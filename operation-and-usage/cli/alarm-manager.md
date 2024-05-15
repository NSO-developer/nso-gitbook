---
description: Manage NSO alarms with native alarm manager.
---

# Alarm Manager

NSO embeds a generic alarm manager. It manages NSO native alarms and can easily be extended with application-specific alarms. Alarm sources can be notifications from devices, undesired states on services detected or anything provided via the Java API.

The Alarm Manager has three main components:

* **Alarm List**: A list of alarms in NSO. Each list entry represents an alarm state for a specific device, an object within the device, and an alarm type.
* **Alarm Model**: For each alarm type, you can configure the mapping to for example X.733 alarm standard parameters that are sent as notifications northbound.
* **Operator Actions**: Actions to set operator states on alarms such as acknowledgement, and also actions to administratively manage the alarm list such as deleting alarms.

<figure><img src="https://pubhub.devnetcloud.com/media/nso-guides-6.1/docs/nso_user_guide/pics/alarmmanager.png#developer.cisco.com" alt="" width="375"><figcaption><p>The Alarm Manager</p></figcaption></figure>

The alarm manager is accessible over all northbound interfaces. A read-only view including an SNMP alarm table and alarm notifications is available in an SNMP Alarm MIB. This MIB is suitable for integration with SNMP-based alarm systems.

To populate the alarm list there is a dedicated Java API. This API lets a developer add alarms, change states on alarms, etc. A common usage pattern is to use the SNMP notification receiver to map a subset of the device traps into alarms.

## Alarm Concepts <a href="#ug.alarmmgr.alarms" id="ug.alarmmgr.alarms"></a>

First of all, it is important to clearly define what an alarm means: "An alarm denotes an undesirable state in a resource for which an operator action is required". Alarms are often confused with general logging and event mechanisms, thereby overflooding the operator with alarms. In NSO, the alarm manager shows undesired resource states that an operator should investigate. NSO contains other mechanisms for logging in general. Therefore, NSO does not naively populate the alarm list with traps received in the SNMP notification receiver.

Before looking into how NSO handles alarms, it is important to define the fundamental concepts. We make a clear distinction between alarms and events in general. Alarms should be taken seriously and be investigated. Alarms have states; they go active with a specific severity, they change severity, and they are cleared by the resource. The same alarm may become active again. A common mistake is to confuse the operator view with the resource view. The model described so far is the resource view. The resource itself may consider the alarm cleared. The alarm manager does not automatically delete cleared alarms. An alarm that has existed in the network may still need investigation. There are dedicated actions an operator can use to manage the alarm list, for example, delete the alarms based on criteria such as cleared and date. These actions can be performed over all northbound interfaces.

Rather than viewing alarms as a list of alarm notifications, NSO defines alarms as states on objects. The NSO alarm list uses four keys for alarms: the alarming object within a device, the alarm type, and an optional specific problem.&#x20;

Alarm types are normally unique identifiers for a specific alarm state and are defined statically. An alarm type corresponds to the well-known X.733 alarm standard tuple event type and probable cause. A specific problem is an optional key that is string-based and can further redefine an alarm type at run-time. This is needed for alarms that are not known before a system is deployed.&#x20;

Imagine a system with general digital inputs. A MIB might specify traps called `input-high`, or `input-low`. When defining the SNMP notification reception, an integrator might define an alarm type called "External-Alarm". `input-high` might imply a major alarm and `input-low` might imply clear.&#x20;

At installation, some detectors report "fire-alarm" and some "door-open" alarms. This is configured at the device and sent as free text in the SNMP var-binds. This is then managed by using the specific problem field of the NSO alarm manager to separate these different alarm types.

The data model for the alarm manager is outlined below.

<figure><img src="https://pubhub.devnetcloud.com/media/nso-guides-6.1/docs/nso_user_guide/pics/dm-alarms.png#developer.cisco.com" alt="" width="563"><figcaption><p>Alarm Model</p></figcaption></figure>

This means that we have a list with key: (managed device, managed object, alarm type, specific problem). In the example above, we might have the following different alarms:

* Device : House1; Managed Object : Detector1; Alarm-Type : External Alarm; Specific Problem = Smoke;
* Device : House1; Managed Object : Detector2; Alarm-Type : External Alarm; Specific Problem = Door Open;

Each alarm entry shows the last status change for the alarm and also a child list with all status changes sorted in chronological order.

* `is-cleared`: was the last state change clear?
* `last-status-change`: timestamp for the last status change.
* `last-perceived-severity`: last severity (not equal to clear).
* `last-alarm-text`: the last alarm text (not equal to clear).
* `status-change`, `event-time`: the time reported by the device.
* `status-change`, `received-time`: the time the state change was received by NSO.
* `status-change`, `perceived-severity`: the new perceived severity.
* `status-change`, `alarm-text`: descriptive text associated with the new alarm status.

It is fundamental to define alarm types (specific problem) and the managed objects with a fine-grained mechanism that still is extensible. For objects we allow YANG instance-identifiers to refer to a YANG instance identifier, an SNMP OID, or a string. Strings can be used when the underlying object is not modeled. We use YANG identities to define alarm types. This has the benefit that alarm types can be defined in a named hierarchy and thereby provide an extensible mechanism. To support "dynamic alarm types" so that alarms can be separated by information only available at run-time, the string-based field-specific problem can also be used.

So far we have described the model based on the resource view. It is common practice to let operators manipulate the alarms corresponding to the operator's investigation. We clearly separate the resource and the operator view, for example, there is no such thing as an operator "clearing an alarm". Rather the alarm entries can have a corresponding alarm handling state. Operators may want to acknowledge an alarm and set the alarm state to closed or similar.

### Alarm List Administrative Actions

We also support some alarm list administrative actions:

* **Synchronize alarms**_:_ try to read the alarm states in the underlying resources and update the alarm list accordingly (this action needs to be implemented by user code for specific applications).
* **Purge alarms**_:_ delete entries in the alarm list based on several different filter criteria.
* **Filter alarms**_:_ with an XPATH as filter input, this action returns all alarms fulfilling the filter.
* **Compress alarms**_:_ since every entry may contain a large amount of state change entries this action compresses the history to the latest state change.

Alarms can be forwarded over NSO northbound interfaces. In many telecom environments, alarms need to be mapped to X.733 parameters. We provide an alarm model where every alarm type is mapped to the corresponding X.733 parameters such as event type and probable cause. In this way, it is easy to integrate NSO alarms into whatever X.733 enumerated values the upper fault management system requires.

## The Alarm Model <a href="#ug.alarmmgr.model" id="ug.alarmmgr.model"></a>

The central part of the YANG Alarm model `tailf-ncs-alarms.yang` has the following structure.

{% code title=" tailf-ncs-alarms.yang" %}
```
module tailf-ncs-alarms {

  namespace "http://tail-f.com/ns/ncs-alarms";
  prefix "al";
  ...
 typedef managed-object-t {
    type union {
      type instance-identifier {
        require-instance false;
        }
      type yang:object-identifier;
      type string;
    }


  ...
  typedef event-type  {
    type enumeration {
      enum other {value 1;}
      enum communicationsAlarm {value 2;}
      enum qualityOfServiceAlarm {value 3;}
      enum processingErrorAlarm {value 4;}
      enum equipmentAlarm {value 5;}
      ...
    }
    description
    "...";
    reference
    "ITU Recommendation X.736, 'Information Technology - Open
     Systems Interconnection - System Management: Security
     Alarm Reporting Function', 1992";
  }

  typedef severity-t  {
    type enumeration {
      enum cleared {value 1;}
      enum indeterminate {value 2;}
      enum critical {value 3;}
      enum major {value 4;}
      enum minor {value 5;}
      enum warning {value 6;}
    }
    description
      "...";
  }
  ...
  identity alarm-type {
    description
    "Base identity for alarm types."
    ...
  }

  identity ncs-dev-manager-alarm {
    base alarm-type;
  }

  identity ncs-service-manager-alarm {
    base alarm-type;
  }

  identity connection-failure {
    base ncs-dev-manager-alarm;
    description
      "NCS failed to connect to a device";
  }
  ....
  container alarm-model {
    list alarm-type {
      key "type";
        leaf type {
          type alarm-type-t;
        }

        uses alarm-model-parameters;
     }
  }

      ...


    container alarm-list {
      config false;
      leaf number-of-alarms {
        type yang:gauge32;
      }

      leaf last-changed {
        type yang:date-and-time;
      }

      list alarm {
        key "device type managed-object specific-problem";
        uses common-alarm-parameters;
        leaf is-cleared {
          type boolean;
          mandatory true;
        }

        leaf last-status-change {
          type yang:date-and-time;
          mandatory true;
        }

        leaf last-perceived-severity {
          type severity-t;
        }

        leaf last-alarm-text {
          type alarm-text-t;
        }

        list status-change {
          key event-time;
          min-elements 1;
          uses alarm-state-change-parameters;
        }

        leaf last-alarm-handling-change {
          type yang:date-and-time;
        }

        list alarm-handling {
          key time;
          leaf time {
            tailf:info "Time stamp for operator action";
            type yang:date-and-time;
          }
          leaf state {
            tailf:info "The operators view of the alarm state";
            type alarm-handling-state-t;
            mandatory true;
            description
              "The operators view of the alarm state.";
          }
          ...
        }
        ...
        notification alarm-notification {
        ...
        rpc synchronize-alarms {
        ...
        rpc compress-alarms {
        ...
        rpc purge-alarms {
```
{% endcode %}

The first part of the YANG listing above shows the definition for `managed-object` type in order for alarms to refer to YANG, SNMP, and other resources. We also see basic definitions from the X.733 standard for severity levels.

Note well the definition of alarm type using YANG identities. In this way, we can create a structured alarm-type hierarchy all rooted at `alarm-type`. For you to add your specific alarm types, define your own alarm types YANG file and add identities using `alarm-type` as a base.

The `alarm-model` container contains the mapping from alarm types to X.733 parameters used for north-bound interfaces.

The `alarm-list` container is the actual alarm list where we maintain a list mapping (device, managed-object, alarm-type, specific-problem) to the corresponding alarm state changes \[(time, severity, text)].

Finally, we see the northbound alarm notification and alarm administrative actions.

## Alarm Handling <a href="#d5e4392" id="d5e4392"></a>

The NSO alarm manager has support for the operator to acknowledge alarms. We call this alarm handling. Each alarm has an associated list of alarm handling entries as:

```
container alarms {
  ....
  container alarm-list {
    config false;
    ....
    list alarm {
      key "device type managed-object specific-problem";

      .....

      list alarm-handling {
        key time;
        leaf time {
          type yang:date-and-time;
          description
            "Time-stamp for operator action on alarm.";
        }
        leaf state {
          mandatory true;
          type alarm-handling-state-t;
          description
            "The operators view of the alarm state";
        }
        leaf user {
          description "Which user has acknowledged this alarm";
          mandatory true;
          type string;
        }
        leaf description {
          description "Additional optional textual information regarding
            this new alarm-handling entry";
          type string;
        }
      }

        tailf:action handle-alarm {
          tailf:info "Set the operator state of this alarm";
          description
            "An action to allow the operator to add an entry to the
             alarm-handling list. This is a means for the operator to indicate
             the level of human intervention on an alarm.";
          input {
            leaf state {
              type alarm-handling-state-t;
              mandatory true;
            }
          }
        }
      }
```

The following typedef defines the different states an alarm can be set into.

{% code title="Alarm state" %}
```
  typedef alarm-handling-state-t  {
    type enumeration {
      enum none {
        value 1;
      }
      enum ack {
        value 2;
      }
      enum investigation {
        value 3;
      }
      enum observation {
        value 4;
      }
      enum closed {
        value 5;
      }
    }
    description
      "Operator actions on alarms";
  }
```
{% endcode %}

It is of course also possible to manipulate the alarm handling list from either Java code or Javascript code running in the web browser using the `js_maapi` library.

Below is a simple scenario to illustrate the alarm concepts. The example can be found in `examples.ncs/service-provider/simple-mpls-vpn`.

```
$ make stop clean all start
$ ncs-netsim stop pe0
$ ncs-netsim stop pe1
$ ncs_cli -u admin -C
admin connected from 127.0.0.1 using console on host
admin@ncs# devices connect
...
connect-result {
    device pe0
    result false
    info Failed to connect to device pe0: connection refused
}
connect-result {
    device pe1
    result false
    info Failed to connect to device pe1: connection refused
}
...
admin@ncs# show alarms alarm-list
alarms alarm-list number-of-alarms 2
alarms alarm-list last-changed 2015-02-18T08:02:49.162436+00:00
alarms alarm-list alarm pe0 connection-failure /devices/device[name='pe0'] ""
 is-cleared              false
 last-status-change      2015-02-18T08:02:49.162734+00:00
 last-perceived-severity major
 last-alarm-text         "Failed to connect to device pe0: connection refused"
 status-change 2015-02-18T08:02:49.162734+00:00
  received-time      2015-02-18T08:02:49.162734+00:00
  perceived-severity major
  alarm-text         "Failed to connect to device pe0: connection refused"
alarms alarm-list alarm pe1 connection-failure /devices/device[name='pe1'] ""
 is-cleared              false
 last-status-change      2015-02-18T08:02:49.162436+00:00
 last-perceived-severity major
 last-alarm-text         "Failed to connect to device pe1: connection refused"
 status-change 2015-02-18T08:02:49.162436+00:00
  received-time      2015-02-18T08:02:49.162436+00:00
  perceived-severity major
  alarm-text         "Failed to connect to device pe1: connection refused"
```

In the above scenario, we stop two of the devices and then ask NSO to connect to all devices. This results in two alarms for `pe0` and `pe1`. Note that the key for the alarm is the device name, the alarm type, the full path to the object (in this case, the device and not an object within the device), and finally an empty string for the specific problem.

In the next command sequence, we start the device and request NSO to connect. This will clear the alarms.

```
admin@ncs# exit
$ ncs-netsim start pe0
DEVICE pe0 OK STARTED
$ ncs-netsim start pe1
DEVICE pe1 OK STARTED
$ ncs_cli -u admin -C
$ admin@ncs# devices connect
...
connect-result {
    device pe0
    result true
    info (admin) Connected to pe0 - 127.0.0.1:10028
}
connect-result {
    device pe1
    result true
    info (admin) Connected to pe1 - 127.0.0.1:10029
}
...
admin@ncs# show alarms alarm-list
alarms alarm-list number-of-alarms 2
alarms alarm-list last-changed 2015-02-18T08:05:04.942637+00:00
alarms alarm-list alarm pe0 connection-failure /devices/device[name='pe0'] ""
 is-cleared              true
 last-status-change      2015-02-18T08:05:04.942637+00:00
 last-perceived-severity major
 last-alarm-text         "Failed to connect to device pe0: connection refused"
 status-change 2015-02-18T08:02:49.162734+00:00
  received-time      2015-02-18T08:02:49.162734+00:00
  perceived-severity major
  alarm-text         "Failed to connect to device pe0: connection refused"
 status-change 2015-02-18T08:05:04.942637+00:00
  received-time      2015-02-18T08:05:04.942637+00:00
  perceived-severity cleared
  alarm-text         "Connected as admin"
alarms alarm-list alarm pe1 connection-failure /devices/device[name='pe1'] ""
 is-cleared              true
 last-status-change      2015-02-18T08:05:04.84115+00:00
 last-perceived-severity major
 last-alarm-text         "Failed to connect to device pe1: connection refused"
 status-change 2015-02-18T08:02:49.162436+00:00
  received-time      2015-02-18T08:02:49.162436+00:00
  perceived-severity major
  alarm-text         "Failed to connect to device pe1: connection refused"
 status-change 2015-02-18T08:05:04.84115+00:00
  received-time      2015-02-18T08:05:04.84115+00:00
  perceived-severity cleared
  alarm-text         "Connected as admin"
```

Note that there are two status-change entries for the alarm and that the alarm is cleared. In the following scenario, we will state that the alarm is closed and finally purge (delete) all alarms that are cleared and closed (Again, note the distinction between operator states and the states from the underlying resources).

```
admin@ncs# alarms alarm-list alarm pe0 connection-failure /devices/device[name='pe0']
          "" handle-alarm state closed description Fixed

admin@ncs# show alarms alarm-list alarm alarm-handling

DEVICE  TYPE                 STATE   USER   DESCRIPTION
---------------------------------------------------------
pe0     connection-failure   closed  admin  Fixed

admin@ncs# alarms purge-alarms alarm-handling-state-filter { state closed }
Value for 'alarm-status' [any,cleared,not-cleared]: cleared
purged-alarms 1
```

Assume that you need to configure the northbound parameters. This is done using the alarm model. A logical mapping of the connection problem above is to map it to X.733 probable cause `connectionEstablishmentError (22)` . This is done in the NSO CLI in the following way:

```
admin@ncs# config
Entering configuration mode terminal
admin@ncs(config)# alarms alarm-model alarm-type connection-failure probable-cause 22
admin@ncs(config-alarm-type-connection-failure/*)# commit
Commit complete.
admin@ncs(config-alarm-type-connection-failure/*)# show full-configuration
alarms alarm-model alarm-type connection-failure *
 event-type     communicationsAlarm
 has-clear      true
 kind-of-alarm  root-cause
 probable-cause 22
```
