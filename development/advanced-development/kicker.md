---
description: Trigger actions on events using Kicker.
---

# Kicker

Kickers constitute a declarative notification mechanism for triggering actions on certain stimuli like a database change or a received notification. These different stimuli and their kickers are defined separately as data kicker and notification kicker respectively.

Common to all types of kickers is that they are declarative. Kickers are modeled in YANG and Kicker instances are stored as configuration data in CDB.

Immediately after a transaction, that defines a new kicker, is committed, the kicker will be active. The same holds for removal. This also implies that the amount of programming for a kicker is a matter of implementing the action to be invoked.

The data-kicker replicates much of the functionality otherwise attained by a CDB subscriber. Without the extra coding in registration and runtime daemon that comes with a CDB subscriber. The data-kicker works for all data providers.

The notification-kicker reacts to notifications received by NSO using a defined notification subscription under `/ncs:devices/device/notifications/subscription`. This simplifies the handling of southbound emitted notifications. Traditionally these were chosen to be stored in CDB as operational data and a separate CDB subscriber was used to act on the received notifications. With the use of the notification-kicker, the CDB subscriber can be removed and there is no longer any need to store the received notification in CDB.

## Kicker Action Invocation <a href="#ug.kicker.actions" id="ug.kicker.actions"></a>

An action as defined by YANG contains an input parameter definition and an output parameter definition. However, a kicker that invokes an action treats the input parameters in a specific way.

The kicker mechanism first checks if the input parameters match those in the `kicker:action-input-params` YANG grouping defined in the `tailf-kicker.yang` file. If so, the action will be invoked with the input parameters:

* `kicker-id`: The id (name) of the invoking kicker.
* `path`: The path of the current monitor triggering the kicker.
* `tid`: The transaction ID to a synthetic transaction containing the changes that lead to the triggering of the kicker.

The "synthetic" transaction implies that this is a copy of the original transaction that led to the kicker triggering. It only contains the data tree under the monitor. The original transaction is already committed and this data might no longer reflect the "running" datastore. It's useful in that the action implementation can attach and diff-iterate over this transaction and retrieve the certain changes that lead to the kicker invocation.

If the kicker mechanism finds an action that does not match the above input parameters, it will invoke the action with an empty parameter list. This implies that a kicker action must either match the above `kicker:action-input-params` grouping precisely or accept an empty incoming parameter list. Otherwise, the action invocation will fail.

## Data Kicker Concepts <a href="#ug.kicker.data-concepts" id="ug.kicker.data-concepts"></a>

For a data kicker, the following principles hold:

* Kickers are triggered by changes in the sub-tree indicated by the `monitor` parameter.
* Actions are invoked during the commit phase. Hence aborted transactions never trigger kickers.
* Kickers process both, configuration and operational data changes, but can be configured to react to a certain type of change only.
* No distinction is made between CRUD types, i.e., create, delete, update. All changes potentially trigger kickers.
* Kickers may have constraints that suppress invocations. Changes in the sub-tree indicated by `monitor` is a necessary but perhaps not a sufficient condition for the action to be invoked.

### Generalized Monitors <a href="#d5e9049" id="d5e9049"></a>

For a data kicker, it is the `monitor` that specifies which subtree under which a change should invoke the kicker. The `monitor` leaf is of type `node-instance-identifier` which means that predicates for keys are optional, i.e., keys may be omitted and then represent all instances for that key.

The resulting evaluation of the monitor defines a node set. Each node in this node set will be the root context for any further xpath evaluations necessary before invoking the kicker action.

The following example shows the strengths of using xpath to define the kickers. Say that we have a situation described by the following YANG model snippet:

```
module example {
  namespace "http://tail-f.com/ns/test/example";
  prefix example;

  ...

  container sys {
    list ifc {
      key name;
      max-elements 64;
      leaf name {
        type interfaceName;
      }
      leaf description {
        type string;
      }
      leaf enabled {
        type boolean;
        default true;
      }
      container hw {
        leaf speed {
          type interfaceSpeed;
        }
        leaf duplex {
          type interfaceDuplex;
        }
        leaf mtu {
          type mtuSize;
        }
        leaf mac {
          type string;
        }
      }
      list ip {
        key address;
        max-elements 1024;
        leaf address {
          type inet:ipv4-address;
        }
        leaf prefix-length {
          type prefixLengthIPv4;
          mandatory true;
        }
        leaf broadcast {
          type inet:ipv4-address;
        }
      }

      tailf:action local_me {
        tailf:actionpoint kick-me-point;
        input {
        }
        output {
        }
      }
    }

    tailf:action kick_me {
      tailf:actionpoint kick-me-point;
      input {
      }
      output {
      }
    }

    tailf:action iter_me {
      tailf:actionpoint kick-me-point;
      input {
        uses kicker:action-input-params;
      }
      output {
      }
    }

  }
}
```

Then, we can define a kicker for monitoring a specific element in the list and call the correlated `local_me` action:

```
admin@ncs(config)# kickers data-kicker e1 \
> monitor /sys/ifc[name='port-0'] \
>kick-node /sys/ifc[name='port-0']\
> action-name local_me

admin(config-data-kicker-e1)# commit
Commit complete
admin(config-data-kicker-e1)# top
admin@ncs(config)#  show full-configuration kickers
kickers data-kicker e1
 monitor     /sys/ifc[name='port-0']
 kick-node   /sys/ifc[name='port-0']
 action-name local_me
!
```

On the other hand, we can define a kicker for monitoring all elements of the list and call the correlated `local_me` action for each element:

```
admin@ncs(config)# kickers data-kicker e2 \
> monitor /sys/ifc \
>kick-node . \
> action-name local_me

admin(config-data-kicker-e2)# commit
Commit complete
admin(config-data-kicker-e2)# top
admin@ncs(config)#  show full-configuration kickers
kickers data-kicker e2
 monitor     /sys/ifc
 kick-node   .
 action-name local_me
!
```

Here the `.` in the `kick-node` refers to the current node in the node set defined by the `monitor`.

### Kicker Constraints/Filters <a href="#d5e9073" id="d5e9073"></a>

A data kicker may be constrained by adding conditions that suppress invocations. The leaf `trigger-expression` contains a boolean XPath expression that is evaluated twice, before and after the change-set of the commit has been applied to the database(s).

The XPath expression has to be evaluated twice to detect the change caused by the transaction.

The two boolean results together with the leaf `trigger-type` control if the kicker should be triggered or not:

* `enter-and-leave`: false -> true (i.e. positive flank) or true -> false (negative flank).
* `enter`: false -> true.

```
admin(config)# kickers data-kicker k1 monitor /sys/ifc \
> trigger-expr "hw/mtu > 800" \
> trigger-type enter \
> kick-node /sys \
> action-name kick_me
admin(config-data-kicker-k1)# commit
Commit complete
admin(config-data-kicker-k1)# top
admin@ncs%
admin@ncs% show kickers
kickers data-kicker k1
 monitor      /sys/ifc
 trigger-expr "hw/mtu > 800"
 trigger-type enter
 kick-node    /sys
 action-name  kick_me
!
```

Start by changing the MTU to 800:

```
admin(config)# sys ifc port-0 hw mtu 800
admin(config-ifc-port-0)# commit | debug kicker
 2017-02-15T16:35:36.039 kicker: k1 at /kicker_example:sys/kicker_example:ifc[kicker_example:name='port-0'] changed;
not invoking 'kick_me' trigger-expr false -> false
Commit complete.
```

Since the `trigger-expression` evaluates to false, the kicker is not triggered. Let's try again:

```
admin(config)# sys ifc port-0 hw mtu 801
admin(config-ifc-port-0)# commit | debug kicker
 2017-02-15T16:35:36.039 kicker: k1 at /kicker_example:sys/kicker_example:ifc[kicker_example:name='port-0'] changed;
invoking 'kick-me' trigger-expr false -> true
Commit complete.
```

The `trigger-expression` can in some cases be used to refine the `monitor` of kicker, to avoid unnecessary evaluations. Let's change something below the `monitor` that doesn't touch the nodes in the `trigger-expression`:

```
admin(config)# sys ifc port-0 speed ten
admin(config-ifc-port-0)# commit | debug kicker
Commit complete.
```

Notice there was no evaluation done.

### Variable Bindings <a href="#ug.data.kicker.named_xpath" id="ug.data.kicker.named_xpath"></a>

A data kicker may be provided with a list of variables (named values). Each variable binding consists of a name and a XPath expression. The XPath expressions are evaluated on-demand, i.e. when used in either of `monitor` or `trigger-expression` nodes.

```
admin@ncs(config)# set kickers data-kicker k3 monitor $PATH/c
                         kick-node /x/y[id='n1']
                         action-name kick-me
                         variable PATH value "/a/b[k1=3][k2='3']"
admin@ncs(config)#
```

In the example above, `PATH` is defined and referred to by the `monitor` expression by using the expression `$PATH`.

{% hint style="info" %}
A monitor expression is not evaluated by the XPath engine. Hence no trace of the evaluation can be found in the the XPath log.

Monitor expressions are expanded and installed in an internal data structure at kicker creation/compile time. XPath may be used while defining kickers by referring to a named XPath expression.
{% endhint %}

### A Simple Data Kicker Example <a href="#ug.kicker.simple_data_example" id="ug.kicker.simple_data_example"></a>

This example is part of the `examples.ncs/web-server-farm/web-site-service` example. It consists of an action and a `README_KICKER` file. For all kickers defined in this example, the same action is used. This action is defined in the `web-site-service` package.

The following is the YANG snippet for the action definition from the `website.yang` file:

```
module web-site {
  namespace "http://examples.com/web-site";
  prefix wse;

  ...

  augment /ncs:services {

    ...

    container actions {
      tailf:action diffcheck {
        tailf:actionpoint diffcheck;
        input {
          uses kicker:action-input-params;
        }
        output {
        }
      }
    }
  }

}
```

The implementation of the action can be found in the `WebSiteServiceRFS.java` class file. Since it takes the `kicker:action-input-params` as input, the `Tid` for the synthetic transaction is available. This transaction is attached and diff-iterated. The result of the diff-iteration is printed in the `ncs-java-vm.log`:

```
class WebSiteServiceRFS {

    ....

    @ActionCallback(callPoint="diffcheck", callType=ActionCBType.ACTION)
    public ConfXMLParam[] diffcheck(DpActionTrans trans, ConfTag name,
                                   ConfObject[] kp, ConfXMLParam[] params)
    throws DpCallbackException {
        try {

            System.out.println("-------------------");
            System.out.println(params[0]);
            System.out.println(params[1]);
            System.out.println(params[2]);

            ConfUInt32 val = (ConfUInt32) params[2].getValue();
            int tid = (int)val.longValue();

            Socket s3 = new Socket("127.0.0.1", Conf.NCS_PORT);
            Maapi maapi3 = new Maapi(s3);
            maapi3.attach(tid, -1);

            maapi3.diffIterate(tid, new MaapiDiffIterate() {
                // Override the Default iterate function in the TestCase class
                public DiffIterateResultFlag iterate(ConfObject[] kp,
                                                     DiffIterateOperFlag op,
                                                     ConfObject oldValue,
                                                     ConfObject newValue,
                                                     Object initstate) {
                    System.out.println("path = " + new ConfPath(kp));
                    System.out.println("op = " + op);
                    System.out.println("newValue = " + newValue);
                    return DiffIterateResultFlag.ITER_RECURSE;

                }

            });


            maapi3.detach(tid);
            s3.close();


        return new ConfXMLParam[]{};

        } catch (Exception e) {
            throw new DpCallbackException("diffcheck failed", e);
        }
    }
}
```

We are now ready to start the `web-site-service` example and define our data kicker. Do the following:

```
$ make all
$ ncs-netsim start
$ ncs
$ ncs_cli -C -u admin

admin@ncs# devices sync-from
sync-result {
    device lb0
    result true
}
sync-result {
    device www0
    result true
}
sync-result {
    device www1
    result true
}
sync-result {
    device www2
    result true
}
```

The kickers are defined under the hide-group `debug`. To be able to show and declare kickers, we need first to unhide this hide group:

```
admin@ncs# config
admin@ncs(config)# unhide debug
```

We now define a data-kicker for the `profile` list under the service augmented container `/services/properties/wsp:web-site`:

```
admin@ncs(config)# kickers data-kicker a1 \
> monitor /services/properties/wsp:web-site/profile \
> kick-node /services/wse:actions action-name diffcheck

admin@ncs(config-data-kicker-a1)# commit
admin@ncs(config-data-kicker-a1)# top
admin@ncs(config)# show full-configuration kickers data-kicker a1
kickers data-kicker a1
 monitor     /services/properties/wsp:web-site/profile
 kick-node   /services/wse:actions
 action-name diffcheck
!
```

We now commit a change in the profile list and we use the `debug kicker` pipe option to be able to follow the kicker invocation:

```
admin@ncs(config)# services properties web-site profile lean lb lb0
admin@ncs(config-profile-lean)# commit | debug kicker
 2017-02-15T16:35:36.039 kicker: a1 at /ncs:services/ncs:properties/wsp:web-site/wsp:profile[wsp:name='lean'] changed; invoking diffcheck
Commit complete.

admin@ncs(config-profile-lean)# top
admin@ncs(config)# exit
```

We can also check the result of the action by looking into the `ncs-java-vm.log`:

```
admin@ncs# file show logs/ncs-java-vm.log
```

In the end, we will find the following printout from the `diffcheck` action:

```
-------------------
{[669406386|id], a1}
{[669406386|monitor], /ncs:services/properties/web-site/profile{lean}}
{[669406386|tid], 168}
path = /ncs:services/properties/wsp:web-site/profile{lean}
op = MOP_CREATED
newValue = null
path = /ncs:services/properties/wsp:web-site/profile{lean}/name
op = MOP_VALUE_SET
newValue = lean
path = /ncs:services/properties/wsp:web-site/profile{lean}/lb
op = MOP_VALUE_SET
newValue = lb0
[ok][2017-02-15 17:11:59]
```

## Notification Kicker Concepts <a href="#ug.kicker.notif-concepts" id="ug.kicker.notif-concepts"></a>

For a notification kicker, the following principles hold:

* Notification Kickers are triggered by the arrival of notifications from any device subscription. These subscriptions are defined under the `/devices/device/notification/subscription` path.
* Storing the received notifications in CDB is optional and not part of the notification kicker functionality.
* The ordering of kicker invocations is generally not guaranteed. That is, a kicker triggered at a later time might execute before a kicker that was triggered earlier, and kickers triggered for the same subscription may execute in any order. A `priority` and a `serializer` value can be used to modify this behavior.

### Notification Selector Expression <a href="#d5e9191" id="d5e9191"></a>

The notification kicker is defined using a mandatory `selector-expr` which is an XPATH 1.0 expression. When the notification is received a synthetic transaction is started and the notification is written as if it would be stored under the path `/devices/device/notification/received-notifications/data`. Storing the notification in CDB is optional. The `selector-expr` is evaluated with the notification node as the current context and `/` as the root context. For example, if the device model defines a notification like this:

```
module device {
  ...
  notification mynotif {
    leaf message {
      type string;
    }
  }
  ...
}
```

The notification node `mynotif` will be the current context for the `selector-expr` There are four predefined variable bindings used when evaluating this expression:

* `DEVICE`: The name of the device emitting the current notification.
* `SUBSCRIPTION_NAME`: The name of the current subscription from which the notification was received. the kicker
* `NOTIFICATION_NAME`: The name of the current notification.
* `NOTIFICATION_NS`: The namespace of the current notification.

The `selector-expr` technique for defining the notification kickers is very flexible. For instance, a kicker can be defined to:

* Receive all notifications for a device.
* Receive all notifications of a certain type for any device.
* Receive a subset of notifications of a subset of devices by the use of specific subscriptions with the same name in several devices.

In addition to this usage of the predefined variable bindings, it is possible to further drill down into the specific notification to trigger on certain leafs in the notification.

### Variable Bindings <a href="#ug.notif.kicker.named_xpath" id="ug.notif.kicker.named_xpath"></a>

In addition to the four variable bindings mentioned above, a notification kicker may also be provided with a list of variables (named values). Each variable binding consists of a name and an XPath expression. The XPath expression is evaluated when the selector-expr is run.

```
            admin@ncs(config)# set kickers notification-kicker k4
            selector-expr "$NOTIFICATION_NAME=linkUp and address[ip=$IP]"
            kick-node /x/y[id='n1']
            action-name kick-me
            variable IP value '192.168.128.55'
admin@ncs(config)#
```

In the example above, `PATH` is defined and referred to by the `monitor` expression by using the expression `$PATH`.

{% hint style="info" %}
A monitor expression is not evaluated by the XPath engine. Hence no trace of the evaluation can be found in the the XPath log.

Monitor expressions are expanded and installed in an internal data structure at kicker creation/compile time. XPath may be used while defining kickers by referring to a named XPath expression.
{% endhint %}

### Serializer and Priority Values <a href="#d5e9243" id="d5e9243"></a>

These values are used to ensure the order of kicker execution. Priority orders kickers for the same notification event, while serializer orders kickers chronologically for different notification events. By default, when no serializer or priority value is given, kickers may be triggered in any order and in parallel. However, some situations may require stricter ordering, and setting serializer and priority in kicker configuration allows you to achieve it.

If priority for a set of kickers is specified, for each individual notification event, the kickers that match are executed in order, going from priority 0 to 255. For example, kicker `K1` with priority 5 is executed before the kicker `K2` with priority 8, which triggered for the same notification.

Parallel execution of kickers can also result in a situation where a kicker for a notification is executed after the kicker for a later notification. That is, even though the trigger for the first kicker came first, this kicker might have a priority set and must wait for other kickers to execute first, while the kicker for the next notification can execute right away. If there is a dependency between these two kickers, serializer value can ensure chronological ordering.

A serializer is a simple integer value between 0 and 255. Notification kickers configured with the same value will be executed in the order in which they were triggered, relative to each other. For example, suppose there are three kickers configured: `T1` and `T2` with serializer set to 10, and `T3` with serializer of 20. NSO receives two notifications, the first triggering `T1` and `T3`, and the second triggering `T2`. Because of the serializer, NSO guarantees `T1` will be invoked before `T2`. But `T2`, even though it came in later, could potentially be invoked before `T3` because they are not serialized (have different serializer value).

When using both, serializer and priority, only kickers with the same serializer value are priority ordered, that is, serializer value takes precedence. For example, the kicker `Q1` with serializer 10 and priority 15 may execute before or after the kicker `Q2` with serializer 20 and priority 4. The reason is `Q1` may need to wait for other kickers with serializer 10 from previous events. The same is true for `Q2` and previous kickers with serializer 20.

### A Simple Notification Kicker Example <a href="#ug.kicker.simple_notif_example" id="ug.kicker.simple_notif_example"></a>

In this example, we use the same action and setup as in the data kicker example above. The procedure for starting is also the same.

The `web-site-service` example has devices that have notifications generated on the stream "interface". We start with defining the notification kicker for a certain `SUBSCRIPTION_NAME = 'mysub'`. This subscription does not exist for the moment and the kicker will therefore not be triggered:

```
admin@ncs# config

admin@ncs(config)# kickers notification-kicker n1 \
> selector-expr "$SUBSCRIPTION_NAME = 'mysub'" \
> kick-node /services/wse:actions \
> action-name diffcheck

admin@ncs(config-notification-kicker-n1)# commit
admin@ncs(config-notification-kicker-n1)# top

admin@ncs(config)# show full-configuration kickers notification-kicker n1
kickers notification-kicker n1
 selector-expr "$SUBSCRIPTION_NAME = 'mysub'"
 kick-node     /services/wse:actions
 action-name   diffcheck
!
```

Now we define the `mysub` subscription on a device `www0` and refer to the notification stream `interface`. As soon as this definition is committed, the kicker will start triggering:

```
admin@ncs(config)# devices device www0 notifications subscription mysub \
> local-user admin stream interface
admin@ncs(config-subscription-mysub)# commit

admin@ncs(config-profile-lean)# top
admin@ncs(config)# exit
```

If we now inspect the `ncs-java-vm.log`, we will see a number of notifications that are received. We also see that the transaction that is diff-iterated contains the notification as data under the path `/devices/device/notifications/received-notifications/notification/data`. This is an operational data list. However, this transaction is synthetic and will not be committed. If the notification will be stored CDB is optional and not depending on the notification kicker functionality:

```
admin@ncs# file show logs/ncs-java-vm.log

-------------------
{[669406386|id], n1}
{[669406386|monitor], /ncs:devices/device{www0}/notifications.../data/linkUp}
{[669406386|tid], 758}
path = /ncs:devices/device{www0}
op = MOP_MODIFIED
newValue = null
path = /ncs:devices/device{www0}/notifications...
op = MOP_CREATED
newValue = null
path = /ncs:devices/device{www0}/notifications.../event-time
op = MOP_VALUE_SET
newValue = 2017-02-15T16:35:36.039204+00:00
path = /ncs:devices/device{www0}/notifications.../sequence-no
op = MOP_VALUE_SET
newValue = 0
path = /ncs:devices/device{www0}/notifications.../data/notif:linkUp
op = MOP_CREATED
newValue = null
path = /ncs:devices/device{www0}/notifications.../data/notif:linkUp/address{192.168.128.55}
op = MOP_CREATED
newValue = null
path = /ncs:devices/device{www0}/notifications.../data/notif:linkUp/address{192.168.128.55}/ip
op = MOP_VALUE_SET
newValue = 192.168.128.55
path = /ncs:devices/device{www0}/notifications.../data/notif:linkUp/address{192.168.128.55}/mask
op = MOP_VALUE_SET
newValue = 255.255.255.0
path = /ncs:devices/device{www0}/notifications.../data/notif:linkUp/ifName
op = MOP_VALUE_SET
newValue = eth2
path = /ncs:devices/device{www0}/notifications.../data/notif:linkUp/linkProperty{0}
op = MOP_CREATED
newValue = null
path = /ncs:devices/device{www0}/notifications.../data/notif:linkUp/linkProperty{0}/extensions{0}
op = MOP_CREATED
newValue = 4668
path = /ncs:devices/device{www0}/notifications.../data/notif:linkUp/linkProperty{0}/extensions{1}/name
op = MOP_VALUE_SET
newValue = 2
path = /ncs:devices/device{www0}/notifications.../data/notif:linkUp/linkProperty{0}/flags
op = MOP_VALUE_SET
newValue = 42
path = /ncs:devices/device{www0}/notifications.../data/notif:linkUp/linkProperty{0}/newlyAdded
op = MOP_CREATED
newValue = null
```

We end by removing the kicker and the subscription:

```
admin@ncs# config
admin@ncs(config)# no kickers notification-kicker
admin@ncs(config)# no devices device www0 notifications subscription
admin@ncs(config)# commit
```

## Nano Services Reactive FastMap with Kicker <a href="#ug.kicker.rfm" id="ug.kicker.rfm"></a>

Nano services use kickers to trigger executing state callback code, run templates, and execute actions according to a plan when pre-conditions are met. For more information see [Nano Services for Provisioning with Side Effects](../core-concepts/implementing-services.md#ncs.development.reactive\_fastmap) and [Nano Services for Staged Provisioning](../core-concepts/nano-services.md).

## Debugging Kickers <a href="#ug.kicker.debugging" id="ug.kicker.debugging"></a>

### Kicker CLI Debug Target <a href="#ug.kicker.debugging.pipe" id="ug.kicker.debugging.pipe"></a>

To find out why a Kicker kicked when it shouldn't or more commonly and annoying, why it didn't kick when it should, use the CLI pipe `debug kicker`.

Evaluation of potential Kicker invocations are reported in the CLI together with XPath evaluation results:

```
admin@ncs(config)# set sys ifc port-0 hw mtu 8000
admin@ncs(config)# commit | debug kicker
 2017-02-15T16:35:36.039 kicker: k1 at /kicker_example:sys/kicker_example:ifc[kicker_example:name='port-0'] changed;
not invoking 'kick-me' trigger-expr false -> false
Commit complete.
admin@ncs(config)#
```

### Unhide Kickers <a href="#ug.kicker.debugging.unhide" id="ug.kicker.debugging.unhide"></a>

The top-level container `kickers` is by default invisible due to a hidden attribute. To make `kickers` visible in the CLI, two steps are required.

1.  First, the following XML snippet must be added to `ncs.conf`.\


    ```
    <hide-group>
        <name>debug</name>
    </hide-group>
    ```
2.  Next, the `unhide` command can be used in the CLI session.\


    ```
    admin@ncs(config)# unhide debug
    admin@ncs(config)#
    ```

### XPath Log <a href="#d5e9321" id="d5e9321"></a>

Detailed information from the XPath evaluator can be enabled and made available in the xpath log. Add the following snippet to `ncs.conf`.

```
<xpathTraceLog>
  <enabled>true</enabled>
  <filename>./xpath.trace</filename>
</xpathTraceLog>
```

### Devel Log <a href="#d5e9327" id="d5e9327"></a>

Error information is written in the development log. The development log is meant to be used as support while developing the application. It is enabled in `ncs.conf`:

{% code title="Enabling the Developer Log" %}
```
<developer-log>
  <enabled>true</enabled>
  <file>
    <name>./logs/devel.log</name>
     <enabled>true</enabled>
  </file>
</developer-log>
<developer-log-level>trace</developer-log-level>
```
{% endcode %}
