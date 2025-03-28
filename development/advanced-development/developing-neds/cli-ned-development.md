---
description: Create CLI NEDs.
---

# CLI NED Development

The CLI NED is a model-driven way to CLI script towards all Cisco-like devices. Some Java code is necessary for handling the corner cases a human-to-machine interface presents.&#x20;

See the [examples.ncs/device-manager/cli-ned](https://github.com/NSO-developer/nso-examples/tree/main/device-management/cli-ned) for an example of a Java implementation serving any YANG models, including those that come with the example.

The NSO CLI NED southbound of NSO shares a Cisco-style CLI engine with the northbound NSO CLI interface, and the CLI engine can thus run in both directions, producing CLI southbound and interpreting CLI data coming from southbound while presenting a CLI interface northbound. It is helpful to keep this in mind when learning and working with CLI NEDs.

*   A sequence of Cisco CLI commands can be turned into the equivalent manipulation of the internal XML tree that represents the configuration inside NSO.

    A YANG model, annotated appropriately, will produce a Cisco CLI. The user can enter Cisco commands, and NSO will parse the Cisco CLI commands using the annotated YANG model and change the internal XML tree accordingly. Thus, this is the CLI parser and interpreter. Model-driven.
*   The reverse operation is also possible. Given two different XML trees, each representing a configuration state, in the netsim/ConfD case and NSO's northbound CLI interface, it represents the configuration of a single device, i.e., the device using ConfD as a management framework. In contrast, the NSO case represents the entire network configuration and can generate the list of Cisco commands going from one XML tree to another.

    NSO uses this technology to generate CLI commands southbound when we manage Cisco-like devices.

It will become clear later in the examples how the CLI engine runs in forward and reverse mode. The key point though, is that the Cisco CLI NED Java programmer doesn't have to understand and parse the structure of the CLI; this is entirely done by the NSO CLI engine.

To implement a CLI NED, the following components are required:

*   A YANG data model that describes the CLI. An important development tool here is netsim (ConfD), the Tail-f on-device management toolkit. For NSO to manage a CLI device, it needs a YANG file with exactly the right annotations to produce precisely the managed device's CLI. A few examples exist in the NSO NED evaluation collection with annotated YANG models that render different Cisco CLI variants.

    \
    See, for example, `$NCS_DIR/packages/neds/dell-ftos` and `$NCS_DIR/packages/neds/cisco-nx`. Look for `tailf:cli-*` extensions in the NED `src/yang` directory YANG models.

    \
    Thus, to create annotated YANG files for a device with a Cisco-like CLI, the work procedure is to run netsim (ConfD) and write a YANG file that renders the correct CLI.

    \
    Furthermore, this YANG model must declare an identity with `ned:cli-ned-id` as a base.
*   It is important to note that a NED only needs to cover certain aspects of the device. To have NSO manage a device with a Cisco-like CLI you do not have to model the entire device, only the commands intended to be used need to be covered. When the `show()` callback issues its `show running-config [toptag]` command and the device replies with data that is fed to NSO, NSO will ignore all command dump output that the loaded YANG models do not cover.

    \
    Thus, whichever Cisco-like device we wish to manage, we must first have YANG models from NSO that cover all aspects of the device we want to use. Once we have a YANG model, we load it into NSO and modify the example CLI NED class to return the NedCapability list of the device.
* The NED code gets to see all data from and to the device. If it's impossible or too hard to get the YANG model exactly right for all commands, a last resort is to let the NED code modify the data inline.
* The next thing required is a Java class that implements the NED. This is typically not a lot of code, and the existing example NED Java classes are easily extended and modified to fit other needs. The most important point of the Java NED class code is that the code can be oblivious to the CLI commands sent and received.

Java CLI NED code must implement the `CliNed` interface.

* **`NedConnectionBase.java`**. See `$NCS_DIR/java/jar/ncs-src.jar`. Use jar xf ncs-src.jar to extract the JAR file. Look for `src/com/tailf/ned/NedConnectionBase.java`.
* **`NedCliBase.java`**. See `$NCS_DIR/java/jar/ncs-src.jar`. Use jar xf ncs-src.jar to extract the JAR file. Look for `src/com/tailf/ned/NedCliBase.java`.

Thus, the Java NED class has the following responsibilities.

* It must implement the identification callbacks, i.e `modules()`, `type()`, and `identity()`
*   It must implement the connection-related callback methods `newConnection()`, `isConnection()` and `reconnect()`

    \
    NSO will invoke the `newConnection()` when it requires a connection to a managed device. The `newConnection()` method is responsible for connecting to the device, figuring out exactly what type of device it is, and returning an array of `NedCapability` objects.\\

    ```java
        public class NedCapability {

            public String str;
            public String uri;
            public String module;
            public String features;
            public String revision;
            public String deviations;

            ....
    ```

    This is very much in line with how a NETCONF connect works and how the NETCONF client and server exchange hello messages.
*   Finally, the NED code must implement a series of data methods. For example, the method `void prepare(NedWorker w, String data)` get a `String` object which is the set of Cisco CLI commands it shall send to the device.

    \
    In the other direction, when NSO wants to collect data from the device, it will invoke `void show(NedWorker w, String toptag)` for each tag found at the top of the data model(s) loaded for that device. For example, if the NED gets invoked with `show(w, "interface")` it's responsibility is to invoke the relevant show configuration command for "interface", i.e. `show running-config interface` over the connection to the device, and then dumbly reply with all the data the device replies with. NSO will parse the output data and feed it into its internal XML trees.

    \
    NSO can order the `showPartial()` to collect part of the data if the NED announces the capability `http://tail-f.com/ns/ncs-ned/show-partial?path-format=FORMAT` in which FORMAT is of the following:

    * key-path: support regular instance keypath format.
    * top-tag: support top tags under the `/devices/device/config` tree.
    * cmd-path-full: support Cisco's CLI edit path with instances.
    * path-modes-only: support Cisco CLI mode path.
    * cmd-path-modes-only-existing: same as `path-mode-only` but NSO only supplies the path mode of existing nodes.

## Writing a Data Model for a CLI NED

The idea is to write a YANG data model and feed that into the NSO CLI engine such that the resulting CLI mimics that of the device to manage. This is fairly straightforward once you have understood how the different constructs in YANG are mapped into CLI commands. The data model usually needs to be annotated with a specific Tail-f CLI extension to tailor exactly how the CLI is rendered.

This section will describe how the general principles work and give a number of cookbook-style examples of how certain CLI constructs are modeled.

The CLI NED is primarily designed to be used with devices that has a CLI that is similar to the CLIs on a typical Cisco box (i.e. IOS, XR, NX-OS, etc). However, if the CLI follows the same principles but with a slightly different syntax, it may still be possible to use a CLI NED if some of the differences are handled by the Java part of the CLI NED. This section will describe how this can be done.

Let's start with the basic data model for CLI mapping. YANG consists of three major elements: containers, lists, and leaves. For example:

```yang
container interface {
list ethernet {
    key id;

    leaf id {
    type uint16 {
        range "0..66";
    }
    }

    leaf description {
    type string {
        length "1..80";
    }
    }

    leaf mtu {
    type uint16 {
        range "64..18000";
    }
    }
}
}
```

The basic rendering of the constructs is as follows. Containers are rendered as command prefixes which can be stacked at any depth. Leaves are rendered as commands that take one parameter. Lists are rendered as submodes, where the key of the list is rendered as a submode parameter. The example above would result in the command:

```
interface ethernet ID
```

For entering the interface ethernet submode. The interface is a container and is rendered as a prefix, ethernet is a list and is rendered as a submode. Two additional commands would be available in the submode:

```
description WORD
mtu INTEGER<64-18000>
```

A typical configuration with two interfaces could look like this:

```
interface ethernet 0
description "customer a"
mtu 1400
!
interface ethernet 1
description "customer b"
mtu 1500
!
```

Note that it makes sense to add help texts to the data model since these texts will be visible in the NSO and help the user see the mapping between the J-style CLI in the NSO and the CLI on the target device. The data model above may look like the following with proper help texts.

```yang
container interface {
tailf:info "Configure interfaces";

list ethernet {
    tailf:info "FastEthernet IEEE 802.3";
    key id;

    leaf id {
    type uint16 {
        range "0..66";
        tailf:info "<0-66>;;FastEthernet interface number";
    }

    leaf description {
    type string {
        length "1..80";
        tailf:info "LINE;;Up to 80 characters describing this interface";
    }
    }

    leaf mtu {
    type uint16 {
        range "64..18000";
        tailf:info "<64-18000>;;MTU size in bytes";
    }
    }
}
}
```

I will generally not include the help texts in the examples below to save some space but they should be present in a production data model.

## Tweaking the Basic Rendering Scheme <a href="#d5e9523" id="d5e9523"></a>

The basic rendering suffice in many cases but is also not enough in many situations. What follows is a list of ways to annotate the data model in order to make the CLI engine mimic a device.

### **Suppressing Submodes**

Sometimes you want a number of instances (a list) but do not want a submode. For example:

```yang
container dns {
leaf domain {
    type string;
}
list server {
    ordered-by user;
    tailf:cli-suppress-mode;
    key ip;

    leaf ip {
    type inet:ipv4-address;
    }
}
}
```

The above would result in the following commands:

```
dns domain WORD
dns server IPAddress
```

A typical `show-config` output may look like:

```
dns domain tail-f.com
dns server 192.168.1.42
dns server 8.8.8.8
```

### **Adding a Submode**

Sometimes you want a submode to be created without having a list instance, for example, a submode called `aaa` where all AAA configuration is located.

This is done by using the `tailf:cli-add-mode` extension. For example:

```yang
container aaa {
    tailf:info "AAA view";
    tailf:cli-add-mode;
    tailf:cli-full-command;

    ...
}
```

This would result in the command **aaa** for entering the container. However, sometimes the CLI requires that a certain set of elements are also set when entering the submode, but without being a list. For example, the police rules inside a policy map in the Cisco 7200.

```yang
container police {
    // To cover also the syntax where cir, bc and be
    // doesn't have to be explicitly specified
    tailf:info "Police";
    tailf:cli-add-mode;
    tailf:cli-mode-name "config-pmap-c-police";
    tailf:cli-incomplete-command;
    tailf:cli-compact-syntax;
    tailf:cli-sequence-commands {
        tailf:cli-reset-siblings;
    }
    leaf cir {
        tailf:info "Committed information rate";
        tailf:cli-hide-in-submode;
        type uint32 {
            range "8000..2000000000";
            tailf:info "<8000-2000000000>;;Bits per second";
        }
    }
    leaf bc {
        tailf:info "Conform burst";
        tailf:cli-hide-in-submode;
        type uint32 {
            range "1000..512000000";
            tailf:info "<1000-512000000>;;Burst bytes";
        }
    }
    leaf be {
        tailf:info "Excess burst";
        tailf:cli-hide-in-submode;
        type uint32 {
            range "1000..512000000";
            tailf:info "<1000-512000000>;;Burst bytes";
        }
    }
    leaf conform-action {
        tailf:cli-break-sequence-commands;
        tailf:info "action when rate is less than conform burst";
        type police-action-type;
    }
    leaf exceed-action {
        tailf:info "action when rate is within conform and "+
            "conform + exceed burst";
        type police-action-type;
    }
    leaf violate-action {
        tailf:info "action when rate is greater than conform + "+
            "exceed burst";
        type police-action-type;
    }
}
```

Here, the leaves with the annotation `tailf:cli-hide-in-submode` is not present as commands once the submode has been entered, but are instead only available as options the police command when entering the police submode.

### **Commands with Multiple Parameters**

Often a command is defined as taking multiple parameters in a typical Cisco CLI. This is achieved in the data model by using the annotations `tailf:cli-sequence-commands`, `tailf:cli-compact-syntax`, `tailf:cli-drop-node-name`, and possibly `tailf:cli-reset-siblings`.

For example:

```yang
container udld-timeout {
    tailf:info "LACP unidirectional-detection timer";
    tailf:cli-sequence-commands {
        tailf:cli-reset-all-siblings;
    }
    tailf:cli-compact-syntax;
    leaf "timeout-type" {
        tailf:cli-drop-node-name;
        type enumeration {
            enum fast {
                tailf:info "in unit of milli-seconds";
            }
            enum slow {
                tailf:info "in unit of seconds";
            }
        }
    }
    leaf "milli" {
        tailf:cli-drop-node-name;
        when "../timeout-type = 'fast'" {
            tailf:dependency "../timeout-type";
        }
        type uint16 {
            range "100..1000";
            tailf:info "<100-1000>;;timeout in unit of "
                +"milli-seconds";
        }
    }
    leaf "secs" {
        tailf:cli-drop-node-name;
        when "../timeout-type = 'slow'" {
            tailf:dependency "../timeout-type";
        }
        type uint16 {
            range "1..60";
            tailf:info "<1-60>;;timeout in unit of seconds";
        }
    }}
```

This results in the command:

```
udld-timeout [fast <millisecs> | slow <secs> ]
```

The `tailf:cli-sequence-commands` annotation tells the CLI engine to process the leaves in sequence. The `tailf:cli-reset-siblings` tells the CLI to reset all leaves in the container if one is set. This is necessary in order to ensure that no lingering config remains from a previous invocation of the command where more parameters were configured. The `tailf:cli-drop-node-name` tells the CLI that the leaf name shouldn't be specified. The `tailf:cli-compact-syntax` annotation tells the CLI that the leaves should be formatted on one line, i.e. as:

```
udld-timeout fast 1000
```

As opposed to without the annotation:

```
uldl-timeout fast
uldl-timeout 1000
```

When constructs are used to control if the numerical value should be the `milli` or the `secs` leaf.

This command could also be written using a choice construct as:

```yang
container udld-timeout {
tailf:cli-sequence-command;
choice  udld-timeout-choice {
    case fast-case {
    leaf fast {
        tailf:info "in unit of milli-seconds";
        type empty;
    }
    leaf milli {
        tailf:cli-drop-node-name;
        must "../fast" { tailf:dependency "../fast"; }
        type uint16 {
            range "100..1000";
            tailf:info "<100-1000>;;timeout in unit of "
                +"milli-seconds";
        }
        mandatory true;
    }
    }
    case slow-case {
    leaf slow {
        tailf:info "in unit of milli-seconds";
        type empty;
    }
    leaf "secs" {
        must "../slow" { tailf:dependency "../slow"; }
        tailf:cli-drop-node-name;
        type uint16 {
            range "1..60";
            tailf:info "<1-60>;;timeout in unit of seconds";
        }
        mandatory true;
    }
    }
}
}
```

Sometimes the `tailf:cli-incomplete-command` is used to ensure that all parameters are configured. The `cli-incomplete-command` only applies to the C- and I-style CLI. To ensure that prior leaves in a container are also configured when the configuration is written using J-style or Netconf proper 'must' declarations should be used.

Another example is this, where `tailf:cli-optional-in-sequence` is used:

```yang
list pool {
    tailf:cli-remove-before-change;
    tailf:cli-suppress-mode;
    tailf:cli-sequence-commands {
        tailf:cli-reset-all-siblings;
    }
    tailf:cli-compact-syntax;
    tailf:cli-incomplete-command;
    key name;
    leaf name {
        type string {
            length "1..31";
            tailf:info "WORD<length:1-31>  Pool Name or Pool Group";
        }
    }
    leaf ipstart {
        mandatory true;
        tailf:cli-incomplete-command;
        tailf:cli-drop-node-name;
        type inet:ipv4-address {
            tailf:info "A.B.C.D;;Start IP Address of NAT pool";
        }
    }
    leaf ipend {
        mandatory true;
        tailf:cli-incomplete-command;
        tailf:cli-drop-node-name;
        type inet:ipv4-address {
            tailf:info "A.B.C.D;;End IP Address of NAT pool";
        }
    }
    leaf netmask {
        mandatory true;
        tailf:info "Configure Mask for Pool";
        type string {
            tailf:info "/nn or A.B.C.D;;Configure Mask for Pool";
        }
    }

    leaf gateway {
        tailf:info "Gateway IP";
        tailf:cli-optional-in-sequence;
        type inet:ipv4-address {
            tailf:info "A.B.C.D;;Gateway IP";
        }
    }
    leaf ha-group-ip {
        tailf:info "HA Group ID";
        tailf:cli-optional-in-sequence;
        type uint16 {
            range "1..31";
            tailf:info "<1-31>;;HA Group ID 1 to 31";
        }
    }
    leaf ha-use-all-ports {
        tailf:info "Specify this if services using this NAT pool "
            +"are transaction based (immediate aging)";
        tailf:cli-optional-in-sequence;
        type empty;
        when "../ha-group-ip" {
            tailf:dependency "../ha-group-ip";
        }
    }
    leaf vrid {
        tailf:info "VRRP vrid";
        tailf:cli-optional-in-sequence;
        when "not(../ha-group-ip)" {
            tailf:dependency "../ha-group-ip";
        }
        type uint16 {
            range "1..31";
            tailf:info "<1-31>;;VRRP vrid 1 to 31";
        }
    }

    leaf ip-rr {
        tailf:info "Use IP address round-robin behavior";
        type empty;
    }
}
```

The `tailf:cli-optional-in-sequence` means that the parameters should be processed in sequence but a parameter can be skipped. However, if a parameter is specified then only parameters later in the container can follow it.

It is also possible to have some parameters in sequence initially in the container, and then the rest in any order. This is indicated by the `tailf:cli-break-sequence command`. For example:

```yang
list address {
    key ip;
    tailf:cli-suppress-mode;
    tailf:info "Set the IP address of an interface";
    tailf:cli-sequence-commands {
        tailf:cli-reset-all-siblings;
    }
    tailf:cli-compact-syntax;
    leaf ip {
        tailf:cli-drop-node-name;
        type inet:ipv6-prefix;
    }
    leaf link-local {
        type empty;
        tailf:info "Configure an IPv6 link local address";
        tailf:cli-break-sequence-commands;
    }
    leaf anycast {
        type empty;
        tailf:info "Configure an IPv6 anycast address";
        tailf:cli-break-sequence-commands;
    }
}
```

Where it is possible to write:

```
    ip 1.1.1.1 link-local anycast
```

As well as:

```
    ip 1.1.1.1 anycast link-local
```

### **Leaf Values Not Really Part of the Key**

Sometimes a command for entering a submode has parameters that are not really key values, i.e. not part of the instance identifier, but still need to be given when entering the submode. For example

```yang
list service-group {
    tailf:info "Service Group";
    tailf:cli-remove-before-change;
    key "name";
    leaf name {
        type string {
            length "1..63";
            tailf:info "NAME<length:1-63>;;SLB Service Name";
        }
    }
    leaf tcpudp {
        mandatory true;
        tailf:cli-drop-node-name;
        tailf:cli-hide-in-submode;
        type enumeration {
            enum tcp { tailf:info "TCP LB service"; }
            enum udp { tailf:info "UDP LB service"; }
        }
    }

    leaf backup-server-event-log {
        tailf:info "Send log info on back up server events";
        tailf:cli-full-command;
        type empty;
    }
    leaf extended-stats {
        tailf:info "Send log info on back up server events";
        tailf:cli-full-command;
        type empty;
    }
    ...
}
```

In this case, the `tcpudp` is a non-key leaf that needs to be specified as a parameter when entering the `service-group` submode. Once in the submode the commands backup-server-event-log and extended-stats are present. Leaves with the `tailf:cli-hide-in-submode` attribute are given after the last key, in the sequence they appear in the list.

It is also possible to allow leaf values to be entered in between key elements. For example:

```yang
list community {
    tailf:info "Define a community who can access the SNMP engine";
    key "read remote";
    tailf:cli-suppress-mode;
    tailf:cli-compact-syntax;
    tailf:cli-reset-container;
    leaf read {
        tailf:cli-expose-key-name;
        tailf:info "read only community";
        type string {
            length "1..31";
            tailf:info "WORD<length:1-31>;;SNMPv1/v2c community string";
        }
    }
    leaf remote {
        tailf:cli-expose-key-name;
        tailf:info "Specify a remote SNMP entity to which the user belongs";
        type string {
            length "1..31";
            tailf:info "Hostname or A.B.C.D;;IP address of remote SNMP "
                +"entity(length: 1-31)";
        }
    }

    leaf oid {
        tailf:info "specific the oid"; // SIC
        tailf:cli-prefix-key {
            tailf:cli-before-key 2;
        }
        type string {
            length "1..31";
            tailf:info "WORD<length:1-31>;;The oid qvalue";
        }
    }

    leaf mask {
        tailf:cli-drop-node-name;
        type string {
            tailf:info "/nn or A.B.C.D;;The mask";
        }
    }
}
```

Here we have a list that is not mapped to a submode. It has two keys, read and remote, and an optional oid that can be specified before the remote key. Finally, after the last key, an optional mask parameter can be specified. The use of the `tailf:cli-expose-key-name` means that the key names should be part of the command, which they are not by default. The above construct results in the commands:

```
community read WORD [oid WORD] remote HOSTNAME [/nn or A.B.C.D]
```

The `tailf:cli-reset-container` attribute means that all leaves in the container will be reset if any leaf is given.

### **Change Controlling Annotations**

Some devices require that a setting be removed before it can be changed, for example, the service-group list above. This is indicated with the `tailf:cli-remove-before-change` annotation. It can be used both on lists and on leaves. A leaf example:

```yang
leaf source-ip {
    tailf:cli-remove-before-change;
    tailf:cli-no-value-on-delete;
    tailf:cli-full-command;
    type inet:ipv6-address {
        tailf:info "X:X::X:X;;Source IPv6 address used by DNS";
    }
}
```

This means that the diff sent to the device will contain first a `no source-ip` command, followed by a new `source-ip` command to set the new value.

The data model also use the tailf:cli-no-value-on-delete annotation which means that the leaf value should not be present in the no command. With the annotation, a diff to modify the source IP from 1.1.1.1 to 2.2.2.2 would look like:

```
no source-ip
source-ip 2.2.2.2
```

And, without the annotation as:

```
no source-ip 1.1.1.1
source-ip 2.2.2.2
```

### **Ordered-by User Lists**

By default, a diff for an ordered-by-user list contains information about where a new item should be inserted. This is typically not supported by the device. Instead, the commands (diff) to send the device needs to remove all items following the new item, and then reinsert the items in the proper order. This behavior is controlled using the `tailf:cli-long-obu-diff` annotation. For example

```yang
list access-list {
    tailf:info "Configure Access List";
    tailf:cli-suppress-mode;
    key id;
    leaf id {
        type uint16 {
            range "1..199";
        }
    }
    list rules {
        ordered-by user;
        tailf:cli-suppress-mode;
        tailf:cli-drop-node-name;
        tailf:cli-show-long-obu-diffs;
        key "txt";
        leaf txt {
            tailf:cli-multi-word-key;
            type string;
        }
    }
}
```

Suppose we have the access list:

```
access-list 90 permit host 10.34.97.124
access-list 90 permit host 172.16.4.224
```

And we want to change this to:

```
access-list 90 permit host 10.34.97.124
access-list 90 permit host 10.34.94.109
access-list 90 permit host 172.16.4.224
```

We would generate the diff with the `tailf:cli-long-obu-diff`:

```
no access-list 90 permit host 172.16.4.224
access-list 90 permit host 10.34.94.109
access-list 90 permit host 172.16.4.224
```

Without the annotation, the diff would be:

```bash
# after permit host 10.34.97.124
access-list 90 permit host 10.34.94.109
```

### **Default Values**

Often in a config when a leaf is set to its default value it is not displayed by the `show running-config` command, but we still need to set it explicitly. Suppose we have the leaf `state`. By default, the value is `active`.

```yang
leaf  state {
    tailf:info "Activate/Block the user(s)";
    type enumeration {
        enum active {
            tailf:info "Activate/Block the user(s)";
        }
        enum block {
            tailf:info "Activate/Block the user(s)";
        }
    }
    default "active";
}
```

If the device state is `block` and we want to set it to `active`, i.e. the default value. The default behavior is to send to the device:

```
no state block
```

This will not work. The correct command sequence should be:

```
state active
```

The way to achieve this is to do the following:

```yang
leaf  state {
    tailf:info "Activate/Block the user(s)";
    type enumeration {
        enum active {
            tailf:info "Activate/Block the user(s)";
        }
        enum block {
            tailf:info "Activate/Block the user(s)";
        }
    }
    default "active";
    tailf:cli-trim-default;
    tailf:cli-show-with-default;
}
```

This way a value for 'state' will always be generated. This may seem unintuitive but the reason this works comes from how the diff is calculated. When generating the diff the target configuration and the desired configuration is compared (per line). The target config will be:

```
state block
```

And the desired config will be:

```
state active
```

This will be interpreted as a leaf value change and the resulting diff will be to set the new value, i.e. active.

However, without the `cli-show-with-default` option, the desired config will be an empty line, i.e. no value set. When we compare the two lines we get:

(current config)

```
state block
```

(desired config)

```xml
<empty>
```

This will result in the command to remove the configured leaf, i.e.

```
state block
```

Which does not work.

### **Understanding How the Diffs are Generated**

What you see in the C-style CLI when you do 'show configuration' is the commands needed to go from the running config to the configuration you have in your current session. It usually corresponds to the command you have just issued in your CLI session, but not always.

The output is actually generated by comparing the two configurations, i.e. the running config and your current uncommitted configuration. It is done by running 'show running-config' on both the running config and your uncommitted config, and then comparing the output line by line. Each line is complemented by some meta information which makes it possible to generate a better diff.

For example, if you modify a leaf value, say set the MTU to 1400 and the previous value was 1500. The two configs will then be

```
interface FastEthernet0/0/1     interface FastEthernet0/0/1
mtu 1500                        mtu 1400
!                               !
```

When we compare these configs, the first lines are the same -> no action but we remember that we have entered the FastEthernet0/0/1 submode. The second line differs in value (the meta-information associated with the lines has the path and the value). When we analyze the two lines we determine that a value\_set has occurred. The default action when the value has been changed is to output the command for setting the new value, i.e. MTU 1500. However, we also need to reposition to the current submode. If this is the first line we are outputting in the submode we need to issue the command before issuing the MTU 1500 command.

```
interface FastEthernet0/0/1
```

Similarly, suppose a value has been removed, i.e. mtu used to be set but it is no longer present

```
interface FastEthernet0/0/1     interface FastEthernet0/0/1
!                                 mtu 1400
                                !
```

As before, the first lines are equivalent, but the second line has a `!` in the new config, and MTU 1400 in the running config. This is analyzed as being a delete and the commands are generated:

```
interface FastEthernet0/0/1
    no mtu 1400
```

There are tweaks to this behavior. For example, some machines do not like the `no` command to include the old value but want instead the command:

```
no mtu
```

We can instruct the CLI diff engine to behave in this way by using the YANG annotation `tailf:cli-no-value-on-delete;`:

```yang
leaf mtu {
tailf:cli-no-value-on-delete;
type uint16;
}
```

It is also possible to tell the CLI engine to not include the element name in the delete operation. For example the command:

```
aaa local-user password cipher "C>9=UF*^V/'Q=^Q`MAF4<1!!"
```

But the command to delete the password is:

```
no aaa local-user password
```

The data model for this would be:

```
// aaa local-user
container password {
    tailf:info "Set password";
    tailf:cli-flatten-container;
    leaf cipher {
        tailf:cli-no-value-on-delete;
        tailf:cli-no-name-on-delete;
        type string {
            tailf:info "STRING<1-16>/<24>;;The UNENCRYPTED/"
                +"ENCRYPTED password string";
        }
    }
}
```

## Modifying the Java Part of the CLI NED <a href="#d5e9646" id="d5e9646"></a>

It is often necessary to do some minor modifications to the Java part of a CLI NED. There are mainly four functions that needs to be modified: connect, show, applyConfig, and enter/exit config mode.

### **Connecting to a Device**

The CLI NED code should do a few things when the connect callback is invoked.

* Set up a connection to the device (usually SSH).
* If necessary send a secondary password to enter exec mode. Typically a Cisco IOS-like CLI requires the user to give the `enable` command followed by a password.
* Verify that it is the right kind of device and respond to NSO with a list of capabilities. This is usually done by running the `show version` command, or equivalent, and parsing the output.
* Configure the CLI session on the device to not use pagination. This is normally done by setting the screen length to 0 (or infinity or disable). Optionally it may also fiddle with the idle time.

Some modifications may be needed in this section if the commands for the above differ from the Cisco IOS style.

### **Displaying the Configuration of a Device**

The NSO will invoke the `show()` callback multiple times, one time for each top-level tag in the data model. Some devices have support for displaying just parts of the configuration, others do not.

For a device that cannot display only parts of a config the recommended strategy is to wait for a show() invocation with a well known top tag and send the entire config at that point. If, if you know that the data model has a top tag called **interface** then you can use code like:

```java
public void show(NedWorker worker, String toptag)
    throws NedException, IOException {
    session.setTracer(worker);
    try {
        int i;

        if (toptag.equals("interface")) {
            session.print("show running-config | exclude able-management\n");
            ...
        } else {
            worker.showCliResponse("");
        }
    } catch (...) { ... }
}
```

From the point of NSO, it is perfectly ok to send the entire config as a response to one of the requested toptags and to send an empty response otherwise.

Often some filtering is required of the output from the device. For example, perhaps part of the configuration should not be sent to NSO, or some keywords replaced with others. Here are some examples:

#### Stripping Sections, Headers, and Footers

Some devices start the output from `show running-config` with a short header, and some add a footer. Common headers are `Current configuration:` and a footer may be `end` or `return`. In the example below we strip out a header and remove a footer.

```
if (toptag.equals("interface")) {
    session.print("show running-config | exclude able-management\n");
    session.expect("show running-config | exclude able-management");

    String res = session.expect(".*#");

    i = res.indexOf("Current configuration :");
    if (i >= 0) {
        int n = res.indexOf("\n", i);
        res = res.substring(n+1);
    }

    i = res.lastIndexOf("\nend");
    if (i >= 0) {
        res = res.substring(0,i);
    }

    worker.showCliResponse(res);
} else {
    // only respond to first toptag since the A10
    // cannot show different parts of the config.
    worker.showCliResponse("");
}
```

Also, you may choose to only model part of a device configuration in which case you can strip out the parts that you have not modelled. For example, stripping out the SNMP configuration:

```
if (toptag.equals("context")) {
    session.print("show configuration\n");
    session.expect("show configuration");

    String res = session.expect(".*\\[.*\\]#");

    snmp = res.indexOf("\nsnmp");
    home = res.indexOf("\nsession-home");
    port = res.indexOf("\nport");
    tunnel = res.indexOf("\ntunnel");

    if (snmp >= 0) {
        res = res.substring(0,snmp)+res.substring(home,port)+
        res.substring(tunnel);
    } else if (port >= 0) {
        res = res.substring(0,port)+res.substring(tunnel);
    }

    worker.showCliResponse(res);
} else {
    // only respond to first toptag since the STOKEOS
    // cannot show different parts of the config.
    worker.showCliResponse("");
}
```

#### Removing Keywords

Sometimes a device generates non-parsable commands in the output from `show running-config`. For example, some A10 devices add a keyword `cpu-process` at the end of the `ip route` command, i.e.:

```
    ip route 10.40.0.0 /14 10.16.156.65 cpu-process
```

However, it does not accept this keyword when a route is configured. The solution is to simply strip the keyword before sending the config to NSO and to not include the keyword in the data model for the device. The code to do this may look like this:

```
if (toptag.equals("interface")) {
    session.print("show running-config | exclude able-management\n");
    session.expect("show running-config | exclude able-management");

    String res = session.expect(".*#");

    // look for the string cpu-process and remove it
    i = res.indexOf(" cpu-process");
    while (i >= 0) {
        res = res.substring(0,i)+res.substring(i+12);
        i = res.indexOf(" cpu-process");
    }

    worker.showCliResponse(res);
} else {
    // only respond to first toptag since the A10
    // cannot show different parts of the config.
    worker.showCliResponse("");
}
```

#### Replacing Keywords

Sometimes a device has some other names for delete than the standard **no** command found in a typical Cisco CLI. NSO will only generate **no** commands when, for example, an element does not exist (i.e. `no shutdown` for an interface), but the device may need `undo` instead. This can be dealt with as a simple transformation of the configuration before sending it to NSO. For example:

```
if (toptag.equals("aaa")) {
    session.print("display current-config\n");
    session.expect("display current-config");

    String res = session.expect("return");

    session.expect(".*>");

    // split into lines, and process each line
    lines = res.split("\n");

    for(i=0 ; i < lines.length ; i++) {
        int c;
        // delete the version information, not really config
        if (lines[i].indexOf("version ") == 1) {
        lines[i] = "";
        }
        else if (lines[i].indexOf("undo ") >= 0) {
            lines[i] = lines[i].replaceAll("undo ", "no ");
        }
    }

    worker.showCliResponse(join(lines, "\n"));
} else {
    // only respond to first toptag since the H3C
    // cannot show different parts of the config.
    // (well almost)
    worker.showCliResponse("");
}
```

Another example is the following situation. A device has a configuration for `port trunk permit vlan 1-3` and may at the same time have disallowed some VLANs using the command `no port trunk permit vlan 4-6`. Since we cannot use a **no** container in the config, we instead add a `disallow` container, and then rely on the Java code to do some processing, e.g.:

```yang
container disallow {
    container port {
    tailf:info "The port of mux-vlan";
        container trunk {
            tailf:info "Specify current Trunk port's "
                +"characteristics";
            container permit {
                tailf:info "allowed VLANs";
                leaf-list vlan {
                    tailf:info "allowed VLAN";
                    tailf:cli-range-list-syntax;
                    type uint16 {
                        range "1..4094";
                    }
                }
            }
        }
    }
}
```

And, in the Java `show()` code:

```
if (toptag.equals("aaa")) {
    session.print("display current-config\n");
    session.expect("display current-config");

    String res = session.expect("return");

    session.expect(".*>");

    // process each line
    lines = res.split("\n");

    for(i=0 ; i < lines.length ; i++) {
        int c;
        if (lines[i].indexOf("no port") >= 0) {
            lines[i] = lines[i].replaceAll("no ", "disallow ");
        }
    }

    worker.showCliResponse(join(lines, "\n"));
} else {
    // only respond to first toptag since the H3C
    // cannot show different parts of the config.
    // (well almost)
    worker.showCliResponse("");
}
```

A similar transformation needs to take place when the NSO sends a configuration change to the device. A more detailed discussion about apply config modifications follows later but the corresponding code would in this case be:

```
lines = data.split("\n");
for (i=0 ; i < lines.length ; i++) {
    if (lines[i].indexOf("disallow port ") == 0) {
        lines[i] = lines[i].replace("disallow ", "undo ");
    }
}
```

#### Different Quoting Practices

If the way a device quotes strings differ from the way it can be modeled in NSO, it can be handled in the Java code. For example, one device does not quote encrypted password strings which may contain odd characters like the command character `!`. Java code to deal with this may look like:

```
if (toptag.equals("aaa")) {
    session.print("display current-config\n");
    session.expect("display current-config");

    String res = session.expect("return");

    session.expect(".*>");

    // process each line
    lines = res.split("\n");
    for(i=0 ; i < lines.length ; i++) {
        if ((c=lines[i].indexOf("cipher ")) >= 0) {
            String line = lines[i];
            String pass = line.substring(c+7);
            String rest;
            int s = pass.indexOf(" ");
            if (s >= 0) {
                rest = pass.substring(s);
                pass = pass.substring(0,s);
            } else {
                s = pass.indexOf("\r");
                if (s >= 0) {
                    rest = pass.substring(s);
                    pass = pass.substring(0,s);
                }
                else {
                    rest = "";
                }
            }
            // find cipher string and quote it
            lines[i] = line.substring(0,c+7)+quote(pass)+rest;
        }
    }

    worker.showCliResponse(join(lines, "\n"));
} else {
    worker.showCliResponse("");
}
```

And similarly de-quoting when applying a configuration.

```
lines = data.split("\n");
for (i=0 ; i < lines.length ; i++) {
    if ((c=lines[i].indexOf("cipher ")) >= 0) {
        String line = lines[i];
        String pass = line.substring(c+7);
        String rest;
        int s = pass.indexOf(" ");
        if (s >= 0) {
            rest = pass.substring(s);
            pass = pass.substring(0,s);
        } else {
            s = pass.indexOf("\r");
            if (s >= 0) {
                rest = pass.substring(s);
                pass = pass.substring(0,s);
            }
            else {
                rest = "";
            }
        }
        // find cipher string and quote it
        lines[i] = line.substring(0,c+7)+dequote(pass)+rest;
    }
}
```

### **Applying a Config**

NSO will send the configuration to the device in three different callbacks: `prepare()`, `abort()`, and `revert()`. The Java code should issue these commands to the device but some processing of the commands may be necessary. Also, the ongoing CLI session needs to enter configure mode, issue the commands, and then exit configure mode. Some processing may be needed if the device has different keywords, or different quoting, as described under the "Displaying the configuration of a device" section above.

For example, if a device uses `undo` in place of `no` then the code may look like this, where `data` is the string of commands received from NSO:

```
lines = data.split("\n");
for (i=0 ; i < lines.length ; i++) {
    if (lines[i].indexOf("no ") == 0) {
        lines[i] = lines[i].replace("no ", "undo ");
    }
}
```

This relies on the fact that NSO will not have any indentation in the commands sent to the device (as opposed to the indentation usually present in the output from `show running-config`).

## Tail-f CLI NED Annotations <a href="#ncs.development.ned.cliannotintro" id="ncs.development.ned.cliannotintro"></a>

The typical Cisco CLI has two major modes, operational mode and configure mode. In addition, the configure mode has submodes. For example, interfaces are configured in a submode that is entered by giving the command `interface <InterfaceType> <Number>`. Exiting a submode, i.e. giving the **exit** command, leaves you in the parent mode. Submodes can also be embedded in other submodes.

In a typical Cisco CLI, you do not necessary have to exit a submode to execute a command in a parent mode. In fact, the output of the command `show running-config` hardly contains any exit commands. Instead, there is an exclamation mark, `!`, to indicate that a submode is done, which is only a comment. The config is formatted to rely on the fact that if a command isn't found in the current submode, the CLI engine searches for the command in its parent mode.

Another interesting mapping problem is how to interpret the **no** command when multiple leaves are given on a command line. Consider the model:

```yang
container foo {
  tailf:cli-compact-syntax;
  tailf:cli-sequence-commands;
  presence true;
  leaf a {
    type string;
  }
  leaf b {
    type string;
  }
  leaf c {
    type string;
  }
}
```

It corresponds to the command syntax `foo [a <word> [b <word> [c <word>]]]`, i.e. the following commands are valid:

```
foo
foo a <word>
foo a <word> b <word>
foo a <word> b <word> c <word>
```

Now what does it mean to write `no foo a <word> b <word> c <word>`? . It could mean that only the `c` leaf should be removed, or it could mean that all leaves should be removed, and it may also mean that the `foo` container should be removed.

There is no clear principle here and no one right solution. The annotations are therefore necessary to help the diff engine figure out what to actually send to the device.

## Annotations <a href="#ug.cli-annot.annotations" id="ug.cli-annot.annotations"></a>

The full set of annotations can be found in the `tailf_yang_cli_extensions` Manual Page. All annotation YANG extensions are not applicable in an NSO context, but most are. The most commonly used annotations are (in alphabetical order):

<details>

<summary><code>tailf:cli-add-mode</code></summary>

Used for adding a submode in a container. The default rendering engine maps a container as a command prefix and a list node as a submode. However, sometimes entering a submode does not require the user to give a specific instance. In these cases, you can use the `tailf:cli-add-mode` on a container:

```yang
container system {
  tailf:info "For system events.";
  container "default" {
    tailf:cli-add-mode;
    tailf:cli-mode-name "cfg-acct-mlist";
    tailf:cli-delete-when-empty;
    presence true;
    container start-stop {
      tailf:info "Record start and stop without waiting";
      leaf group {
        tailf:info "Use Server-group";
        type aaa-group-type;
      }
    }
  }
}
```

In this example, the `tailf:cli-add-mode` annotations tell the CLI engine to render the `default` container as a submode, in other words, there will be a command `system default` for entering the default container as a submode. All further commands will use that context as a base. In the example above, the `default` container will only contain one command `start-stop group`, rendered from the `start-stop` container (rendered as a prefix) and the `group` leaf.

</details>

<details>

<summary><code>tailf:cli-allow-join-with-key</code></summary>

Tells the parser that the list name is allowed to be joined together with the first key, i.e. written without space in between. This is used to render, for example, the `interface FastEthernet` command where the list is `FastEthernet` and the key is the interface name. In a typical Cisco CLI they are allowed to be written both as **i**`nterface FastEthernet 1` and as `interface FastEthernet1`.

```yang
list FastEthernet {
  tailf:info "FastEthernet IEEE 802.3";
  tailf:cli-allow-join-with-key {
    tailf:cli-display-joined;
  }
  tailf:cli-mode-name "config-if";
  key name;
  leaf name {
    type string {
    pattern "[0-9]+.*";
    tailf:info "<0-66>/<0-128>;;FastEthernet interface number";
  }
}
```

In the above example, the `tailf:cli-display-joined` substatement is used to tell the command renderer that it should display a list item using the format without space.

</details>

<details>

<summary><code>tailf:cli-allow-join-with-value</code></summary>

This tells the parser that a leaf value is allowed to be written without space between the leaf name and the value. This is typically the case when referring to an interface. For example:

```yang
leaf FastEthernet {
  tailf:info "FastEthernet IEEE 802.3";
  tailf:cli-allow-join-with-value {
    tailf:cli-display-joined;
  }
  type string;
  tailf:non-strict-leafref {
    path "/ios:interface/ios:FastEthernet/ios:name";
  }
}
```

In the example above, a leaf FastEthernet is used to point to an existing interface. The command is allowed to be written both as `FastEthernet 1` and as `FastEthernet1`, when referring to FastEthernet interface 1. The substatements say which is the preferred format when rendering the command.

</details>

<details>

<summary><code>tailf:cli-prefix-key</code> and <code>tailf:cli-before-key</code></summary>

Normally, keys come before other leaves when a list command is used, and this is required in YANG. However, this is not always the case in Cisco-style CLIs. For example the `route-map` command where the name and sequence numbers are the keys, but the leaf operation (permit or deny) is given in between the first and the second key. The `tailf:cli-prefix-key` annotation tells the parser to expect a given leaf before the keys, but the substatement `tailf:cli-before-key <N>` can be used to specify that the leaf should occur in between two keys. For example:

```yang
list route-map {
  tailf:info "Route map tag";
  tailf:cli-mode-name "config-route-map";
  tailf:cli-compact-syntax;
  tailf:cli-full-command;
  key "name sequence";
  leaf name {
    type string {
      tailf:info "WORD;;Route map tag";
    }
  }
  // route-map * #
  leaf sequence {
    tailf:cli-drop-node-name;
    type uint16 {
      tailf:info "<0-65535>;;Sequence to insert to/delete from "
        +"existing route-map entry";
      range "0..65535";
    }
  }
  // route-map * permit
  // route-map * deny
  leaf operation {
    tailf:cli-drop-node-name;
    tailf:cli-prefix-key {
      tailf:cli-before-key 2;
    }
    type enumeration {
      enum deny {
        tailf:code-name "op_deny";
        tailf:info "Route map denies set operations";
      }
      enum permit {
        tailf:code-name "op_internet";
        tailf:info "Route map permits set operations";
      }
    }
    default permit;
  }
}
```

A lot of things are going on in the example above, in addition to the `tailf:cli-prefix-key` and `tailf:cli-before-key` annotations. The `tailf:cli-drop-node-name` annotation tells the parser to ignore the name of the leaf (to not accept that as input, or render it when displaying the configuration).

</details>

<details>

<summary><code>tailf:cli-boolean-no</code></summary>

This tells the parser to render a leaf of type boolean as `no <leaf>` and `<leaf>` instead of the default `<leaf> false` and `<leaf> true`. The other alternative to this is to use a leaf of type empty and the `tailf:cli-show-no` annotation. The difference is subtle. A leaf with `tailf:cli-boolean-no` would not be displayed unless explicitly configured to either true or false, whereas a type empty leaf with `tailf:cli-show-no` would always be displayed if not set. For example:

```yang
leaf keepalive {
  tailf:info "Enable keepalive";
  tailf:cli-boolean-no;
  type boolean;
}
```

In the above example the `keepalive` leaf is set to true when the command `keepalive` is given, and to false when `no keepalive` is given. The well known `shutdown` command, on the other hand, is modeled as a type empty leaf with the `tailf:cli-show-no` annotation:

```yang
leaf shutdown {
  // Note: default to "no shutdown" in order to be able to bring if up.
  tailf:info "Shutdown the selected interface";
  tailf:cli-full-command;
  tailf:cli-show-no;
  type empty;
}
```

</details>

<details>

<summary><code>tailf:cli-sequence-commands</code> and <code>tailf:cli-break-sequence-commands</code></summary>

These annotations are used to tell the CLI to only accept leaves in a container in the same order as they appears in the data model. This is typically required when the leaf names are hidden using the `tailf:cli-drop-node-name` annotation. It is very common in the Cisco CLI that commands accept multiple parameters, and such commands must be mapped to setting of multiple leaves in the data model. For example the `aggregate-address` command in the `router bgp` submode:

```
// router bgp * / aggregate-address
container aggregate-address {
  tailf:info "Configure BGP aggregate entries";
  tailf:cli-compact-syntax;
  tailf:cli-sequence-commands {
    tailf:cli-reset-all-siblings;
  }
  leaf address {
    tailf:cli-drop-node-name;
    type inet:ipv4-address {
      tailf:info "A.B.C.D;;Aggregate address";
    }
  }
  leaf mask {
    tailf:cli-drop-node-name;
    type inet:ipv4-address {
      tailf:info "A.B.C.D;;Aggregate mask";
    }
  }
  leaf advertise-map {
    tailf:cli-break-sequence-commands;
    tailf:info "Set condition to advertise attribute";
    type string {
      tailf:info "WORD;;Route map to control attribute "
      +"advertisement";
    }
  }
  leaf as-set {
    tailf:info "Generate AS set path information";
    type empty;
  }
  leaf attribute-map {
    type string {
      tailf:info "WORD;;Route map for parameter control";
    }
  }
  leaf as-override {
    tailf:info "Override matching AS-number while sending update";
    type empty;
  }
  leaf route-map {
    type string {
      tailf:info "WORD;;Route map for parameter control";
    }
  }
  leaf summary-only {
    tailf:info "Filter more specific routes from updates";
    type empty;
  }
  leaf suppress-map {
    tailf:info "Conditionally filter more specific routes from "
    +"updates";
    type string {
      tailf:info "WORD;;Route map for suppression";
    }
  }
}
```

In the above example, the `tailf:cli-sequence-commands` annotation tells the parser to require the leaves in the `aggregate-address` container to be entered in the same order as in the data model, i.e. first address then mask. Since these leaves also have the `tailf:cli-drop-node-name` annotation, it would be impossible for the parser to know which leaf to map the values to, unless the order of appearance was used. The `tailf:cli-break-sequence-commands` annotation on the advertise-map leaf tells the parser that from that leaf and onward the ordering is no longer important and the leaves can be entered in any order (and leaves can be skipped).

Two other annotations are often used in combination with `tailf:cli-sequence-commands`; `tailf:cli-reset-all-siblings`, and `tailf:cli-compact-syntax`. The first tells the parser that all leaves should be reset when any leaf is entered, i.e. if the user first gives the command:

```
aggregate-address 1.1.1.1 255.255.255.0 as-set summary-only
```

This would result in the leaves address, mask, as-set, and summary-only being set in the configuration. However, if the user then entered:

```
aggregate-address 1.1.1.1 255.255.255.0 as-set
```

The assumed result of this is that summary-only is no longer configured, ie that all leaves in the container is zeroed out when the command is entered again. The `tailf:cli-compact-syntax` annotation tells the CLI engine to render all leaves in the rendered on a separate line.

```
aggregate-address 1.1.1.1
aggregate-address 255.255.255.0
aggregate-address as-set
aggregate-address summary-only
```

The above will be rendered on one line (compact syntax) as:

```
aggregate-address 1.1.1.1 255.255.255.0 as-set summary-only
```

</details>

<details>

<summary><code>tailf:cli-case-insensitive</code></summary>

Tells the parser that this particular leaf should be allowed to be entered in case insensitive format. The reason this is needed is that some devices display a command in one case, and other display the same command in a different case. Normally command parsing is case-sensitive. For example:

```yang
leaf dhcp {
  tailf:info "Default Gateway obtained from DHCP";
  tailf:cli-case-insensitive;
  type empty;
}
```

</details>

<details>

<summary><code>tailf:cli-compact-syntax</code></summary>

This annotation tells the CLI engine to render all leaves in the container on one command line, i.e. instead of the default rendering where each leaf is rendered on a separate line

```
aggregate-address 1.1.1.1
aggregate-address 255.255.255.0
aggregate-address as-set
aggregate-address summary-only
```

It should be rendered on one line (compact syntax) as

```
aggregate-address 1.1.1.1 255.255.255.0 as-set summary-only
```

</details>

<details>

<summary><code>tailf:cli-delete-container-on-delete</code></summary>

Deleting items in the database is tricky when using the Cisco CLI syntax. The reason is that `no <command>` is open to multiple interpretations in many cases, for example when multiple leaves are set in one command, or a presence container is set in addition to a leaf. For example:

```yang
container dampening {
  tailf:info "Enable event dampening";
  presence "true";
  leaf dampening-time {
    tailf:cli-drop-node-name;
    tailf:cli-delete-container-on-delete;
    tailf:info "<1-30>;;Half-life time for penalty";
    type uint16 {
      range 1..30;
    }
  }
}
```

This data model allows both the `dampening` command and the command `dampening 10`. When the command `no dampening 10` is issued, should both the dampening container and the leaf be removed, or only the leaf? The `tailf:cli-delete-container-on-delete` tells the CLI engine to also delete the container when the leaf is removed.

</details>

<details>

<summary><code>tailf:cli-delete-when-empty</code></summary>

This annotation tells the CLI engine to remove a list entry or a presence container when all content of the container or list instance has been removed. For example:

```yang
container access-class {
  tailf:info "Filter connections based on an IP access list";
  tailf:cli-compact-syntax;
  tailf:cli-sequence-commands;
  tailf:cli-reset-container;
  tailf:cli-flatten-container;
  list access-list {
    tailf:cli-drop-node-name;
    tailf:cli-compact-syntax;
    tailf:cli-reset-container;
    tailf:cli-suppress-mode;
    tailf:cli-delete-when-empty;
    key direction;
    leaf direction {
      type enumeration {
        enum "in" {
          tailf:info "Filter incoming connections";
        }
        enum "out" {
          tailf:info "Filter outgoing connections";
        }
      }
    }
    leaf access-list {
      tailf:cli-drop-node-name;
      tailf:cli-prefix-key;
      type exp-ip-acl-type;
      mandatory true;
    }
    leaf vrf-also {
      tailf:info "Same access list is applied for all VRFs";
      type empty;
    }
  }
}
```

In this case, the `tailf:cli-delete-when-empty` annotation tells the CLI engine to remove an access-list instance when it doesn't have neither an access-list nor a `vrf-also` child.

</details>

<details>

<summary><code>tailf:cli-diff-dependency</code></summary>

This annotation tells the CLI engine that there is a dependency between the current account when generating diff commands to send to the device, or when rendering the `show configuration` command output. It can have two different substatements: `tailf:cli-trigger-on-set` and `tailf:cli-trigger-on-all`.

Without substatements, it should be thought of as similar to a leaf-ref, i.e. if the dependency target is delete, first perform any modifications to this leaf. For example, the redistribute `ospf` submode in `router bgp`:

```
// router bgp * / redistribute ospf *
list ospf {
  tailf:info "Open Shortest Path First (OSPF)";
  tailf:cli-suppress-mode;
  tailf:cli-delete-when-empty;
  tailf:cli-compact-syntax;
  key id;
  leaf id {
    type uint16 {
      tailf:info "<1-65535>;;Process ID";
      range "1..65535";
    }
  }
  list vrf {
    tailf:info "VPN Routing/Forwarding Instance";
    tailf:cli-suppress-mode;
    tailf:cli-delete-when-empty;
    tailf:cli-compact-syntax;
    tailf:cli-diff-dependency "/ios:ip/ios:vrf";
    tailf:cli-diff-dependency "/ios:vrf/ios:definition";
    key name;
    leaf name {
      type string {
        tailf:info "WORD;;VPN Routing/Forwarding Instance (VRF) name";
      }
    }
  }
}
```

The `tailf:cli-diff-dependency "/ios:ip/ios:vrf"` tells the engine that if the `ip vrf` part of the configuration is deleted, then first display any changes to this part. This can be used when the device requires a certain ordering of the commands.

If the `tailf:cli-trigger-on-all` substatement is used, then it means that the target will always be displayed before the current node. Normally the order in the YANG file is used, but and it might not even be possible if they are embedded in a container.

The `tailf:cli-trigger-on-set` tells the engine that the ordering should be taken into account when this leaf is set and some other leaf is deleted. The other leaf should then be deleted before this is set. Suppose you have this data model:

```yang
list b {
  key "id";
  leaf id {
    type string;
  }
  leaf name {
    type string;
  }
  leaf y {
    type string;
  }
}
list a {
  key id;
  leaf id {
    tailf:cli-diff-dependency "/c[id=current()/../id]" {
      tailf:cli-trigger-on-set;
    }
    tailf:cli-diff-dependency "/b[id=current()/../id]";
    type string;
  }
}
list c {
  key id;
  leaf id {
    tailf:cli-diff-dependency "/a[id=current()/../id]" {
      tailf:cli-trigger-on-set;
    }
    tailf:cli-diff-dependency "/b[id=current()/../id]";
    type string;
  }
}
```

Then the `tailf:cli-diff-dependency "/b[id=current()/../id]"` tells the CLI that before `b` list instance is delete, the `c` instance with the same name needs to be changed.

```
tailf:cli-diff-dependency "/a[id=current()/../id]" {
  tailf:cli-trigger-on-set;
}
```

This annotation, on the other hand, says that before this instance is created any changes to the a instance with the same name needs to be displayed.

Suppose you have the configuration:

```
b foo
!
a foo
!
```

Then created `c foo` and deleted `a foo`, it should be displayed as:

```
no a foo
c foo
```

If you then deleted **c foo** and created **a foo**, it should be rendered as:

```
no c foo
a foo
```

That is, in the reverse order.

</details>

<details>

<summary><code>tailf:cli-disallow-value</code></summary>

This annotation is used to disambiguate parsing. This is sometimes necessary when `tailf:cli-drop-node-name` is used. For example:

```yang
container authentication {
  tailf:info "Authentication";
  choice auth {
    leaf word {
      tailf:cli-drop-node-name;
      tailf:cli-disallow-value "md5|text";
      type string {
        tailf:info "WORD;;Plain text authentication string "
        +"(8 chars max)";
      }
    }
    container md5 {
      tailf:info "Use MD5 authentication";
      leaf key-chain {
        tailf:info "Set key chain";
        type string {
          tailf:info "WORD;;Name of key-chain";
        }
      }
    }
  }
}
```

when the command `authentication md5...` is entered the CLI parser cannot determine if the leaf **word** should be set to the value `"md5"` of if the leaf `md5` should be set. By adding the `tailf:cli-disallow-value` annotation you can tell the CLI parser that certain regular expressions are not valid values. An alternative would be to add a restriction to the string type of **word** but this is much more difficult since restrictions can only be used to specify allowed values, not disallowed values.

</details>

<details>

<summary><code>tailf:cli-display-joined</code></summary>

See the description of `tailf:cli-allow-join-with-value` and `tailf:cli-allow-join-with-key`.

</details>

<details>

<summary><code>tailf:cli-display-separated</code></summary>

This annotation can be used on a presence container and tells the CLI engine that the container should be displayed as a separate command, even when a leaf in the container is set. The default rendering does not do this. For example:

```yang
container ntp {
  tailf:info "Configure NTP";
  // interface * / ntp broadcast
  container broadcast {
    tailf:info "Configure NTP broadcast service";
    //tailf:cli-display-separated;
    presence true;
    container client {
      tailf:info "Listen to NTP broadcasts";
      tailf:cli-full-command;
      presence true;
    }
  }
}
```

If both `broadcast` and `client` are created in the configuration then this will be displayed as:

```
ntp broadcast
ntp broadcast client
```

When the `tailf:cli-display-separated` annotation is used. If the annotation isn't present then it would only be displayed as:

```
ntp broadcast client
```

The creation of the broadcast container would be implied.

</details>

<details>

<summary><code>tailf:cli-drop-node-name</code></summary>

This might be the most used annotation of them all. It can be used for multiple purposes. Primarily it tells the CLI engine that the node name should be ignored, which is typically needed when there is no corresponding leaf name in the command, typically when a command requires multiple parameters:

```yang
container exec-timeout {
  tailf:info "Set the EXEC timeout";
  tailf:cli-sequence-commands;
  tailf:cli-compact-syntax;
  leaf minutes {
    tailf:info "<0-35791>;;Timeout in minutes";
    tailf:cli-drop-node-name;
    type uint32;
  }
  leaf seconds {
    tailf:info "<0-2147483>;;Timeout in seconds";
    tailf:cli-drop-node-name;
    type uint32;
  }
}
```

However, it can also be used to introduce ambiguity, or a choice in the parse tree if you like. Suppose you need to support these commands:

```
// interface * / vrf forwarding
// interface * / ip vrf forwarding
choice vrf-choice {
  container ip-vrf {
    tailf:cli-no-keyword;
    tailf:cli-drop-node-name;
    container ip {
      container vrf {
        leaf forwarding {
          tailf:info "Configure forwarding table";
          type string {
            tailf:info "WORD;;VRF name";
          }
          tailf:non-strict-leafref {
            path "/ios:ip/ios:vrf/ios:name";
          }
        }
     }
  }
}
container vrf {
  tailf:info "VPN Routing/Forwarding parameters on the interface";
  // interface * / vrf forwarding
  leaf forwarding {
    tailf:info "Configure forwarding table";
    type string {
      tailf:info "WORD;;VRF name";
    }
    tailf:non-strict-leafref {
      path "/ios:vrf/ios:definition/ios:name";
    }
  }
}

// interface * / ip
container ip {
  tailf:info "Interface Internet Protocol config commands";
}
```

In the above case, when the parser sees the beginning of the command `ip`, it can interpret it as either entering the `interface */vrf-choice/ip-vrf/ip/vrf` config tree, or the `interface */ip` tree since the tokens consumed are the same in both branches. When the parser sees a `tailf:cli-drop-node-name` in the parse tree, it will try to match the current token stream to that parse tree, and if that fails backtrack and try other paths.

</details>

<details>

<summary><code>tailf:cli-exit-command</code></summary>

Tells the CLI engine to add an explicit exit command in the current submode. Normally, a submode does not have exit commands for leaving a submode, instead, it is implied by the following command residing in a parent mode. However, to avoid ambiguity it is sometimes necessary. For example, in the `address-family` submode:

```yang
container address-family {
  tailf:info "Enter Address Family command mode";
  container ipv6 {
    tailf:info "Address family";
    container unicast {
      tailf:cli-add-mode;
      tailf:cli-mode-name "config-router-af";
      tailf:info "Address Family Modifier";
      tailf:cli-full-command;
      tailf:cli-exit-command "exit-address-family" {
        tailf:info "Exit from Address Family configuration "
        +"mode";
      }
    }
  }
}
```

</details>

<details>

<summary><code>tailf:cli-explicit-exit</code></summary>

This tells the CLI engine to render explicit exit commands instead of the default `!` when leaving a submode. The annotation is inherited by all submodes. For example:

```yang
container interface {
  tailf:info "Configure interfaces";
  tailf:cli-diff-dependency "/ios:vrf";
  tailf:cli-explicit-exit;
  // interface Loopback
  list Loopback {
    tailf:info "Loopback interface";
    tailf:cli-allow-join-with-key {
      tailf:cli-display-joined;
    }
    tailf:cli-mode-name "config-if";
    tailf:cli-suppress-key-abbreviation;
    // tailf:cli-full-command;
    key name;
    leaf name {
      type string {
        pattern "([0-9\.])+";
        tailf:info "<0-2147483647>;;Loopback interface number";
      }
    }
    uses interface-common-grouping;
  }
}
```

Without the `tailf:cli-explicit-exit` annotation, the edit sequences sent to the NED device will contain `!` at the end of a mode, and rely on the next command to move from one submode to some other place in the CLI. This is the way the Cisco CLI usually works. However, it may cause problems if the next edit command is also a valid command in the current submode. Using `tailf:cli-explicit-exit` gets around this problem.

</details>

<details>

<summary><code>tailf:cli-expose-key-name</code></summary>

By default, the key leaf names are not shown in the CLI, but sometimes you want them to be visible, for example:

```
// ip explicit-path name *
list explicit-path {
  tailf:info "Configure explicit-path";
  tailf:cli-mode-name "cfg-ip-expl-path";
  key name;
  leaf name {
    tailf:info "Specify explicit path by name";
    tailf:cli-expose-key-name;
    type string {
      tailf:info "WORD;;Enter name";
    }
  }
}
```

</details>

<details>

<summary><code>tailf:cli-flat-list-syntax</code></summary>

By default, a leaf-list is rendered as a single line with the elements enclosed by `[` and `]`. If you want the values to be listed on one line this is the annotation to use. For example:

```
// class-map * / match cos
leaf-list cos {
  tailf:info "IEEE 802.1Q/ISL class of service/user priority values";
  tailf:cli-flat-list-syntax;
  type uint16 {
    range "0..7";
    tailf:info "<0-7>;;Enter up to 4 class-of-service values"+
    " separated by white-spaces";
  }
}
```

</details>

<details>

<summary><code>tailf:cli-flatten-container</code></summary>

This annotation is a bit tricky. It tells the CLI engine that the container should be allowed to co-exist with leaves on the same command line, i.e. flattened. Normally, once the parser has entered a container it will not exit. However, if the container is flattened, the container will be exited once all leaves in the container have been entered. Also, a flattened container will be displayed together with sibling leaves on the same command line (provided the surrounding container has `tailf:cli-compact-syntax`).

Suppose you want to model the command `limit [inbound <int16> <int16>] [outbound <int16> <int16>] mtu <uint16>`. In other words, the inbound and outbound settings are optional, but if you give inbound you have to specify two 16-bit integers, and you can always specify mtu.

```yang
container foo {
  tailf:cli-compact-syntax;
  container inbound {
    tailf:cli-compact-syntax;
    tailf:cli-sequence-commands;
    tailf:cli-flatten-container;
    leaf a {
      tailf:cli-drop-node-name;
      type uint16;
    }
    leaf b {
      tailf:cli-drop-node-name;
      type uint16;
    }
  }
  container outbound {
    tailf:cli-compact-syntax;
    tailf:cli-sequence-commands;
    tailf:cli-flatten-container;
    leaf a {
      tailf:cli-drop-node-name;
      type uint16;
    }
    leaf b {
      tailf:cli-drop-node-name;
      type uint16;
    }
  }
  leaf mtu {
    type uint16;
  }
}
```

In the above example the `tailf:cli-flatten-container` tells the parser that it should exit the outbound/inbound container once both values have been entered. Without the annotation, it would not be possible to exit the container once it has been entered. It would be possible to have the command `foo inbound 1 3` or `foo outbound 1 2` but not both at the same time, and not the final mtu leaf. The `tailf:cli-compact-syntax` annotation tells the renderer to display all leaves on the same line. If it wasn't used the line setting `foo inbound 1 2 outbound 3 4 mtu 1500` would be displayed as:

```
foo inbound 1
foo inbound 2
foo outbound 3
foo outbound 4
foo mtu 1500
```

The annotation `tailf:cli-sequence-commands` tells the CLI that the user has to enter the leaves inside the container in the specified order. Without this annotation, it would not be possible to drop the names of the leaves and still have a deterministic parser. With the annotation, the parser knows that for the command `foo inbound 1 2`, leaf a should be assigned the value 1 and leaf b the value 2.

Another example:

```yang
container htest {
  tailf:cli-add-mode;
  container param {
    tailf:cli-hide-in-submode;
    tailf:cli-flatten-container;
    tailf:cli-compact-syntax;
    leaf a {
      type uint16;
    }
    leaf b {
      type uint16;
    }
  }
  leaf mtu {
    type uint16;
  }
}
```

The above model results in the command `htest param a <uint16> b <uint16>` for entering the submode. Once the submode has been entered, the command `mtu <uint16>` is available. Without the `tailf:cli-flatten-container` annotation it wouldn't be possible to use the `tailf:cli-hide-in-submode` annotation to attach the leaves to the command for entering the submode.

</details>

<details>

<summary><code>tailf:cli-full-command</code></summary>

This annotation tells the parser to not accept any more input beyond this element. By default, the parser will allow the setting of multiple leaves in the same command, and both enter a submode and set leaf values in the submode. In most cases, it doesn't matter that the parser accepts commands that are not actually generated by the device in the output of `show running-config`. It is however needed to avoid ambiguity, or just to make the NSO CLI for the device more user-friendly.

```yang
container transceiver {
  tailf:info "Select from transceiver configuration commands";
  container "type" {
    tailf:info "type keyword";
    // transceiver type all
    container all {
      tailf:cli-add-mode;
      tailf:cli-mode-name "config-xcvr-type";
      tailf:cli-full-command;
      // transceiver type all / monitoring
        container monitoring {
        tailf:info "Enable/disable monitoring";
        presence true;
        leaf interval {
          tailf:info "Set interval for monitoring";
          type uint16 {
            tailf:info "<300-3600>;;Time interval for monitoring "+
            "transceiver in seconds";
            range "300..3600";
          }
        }
      }
    }
  }
}
```

In the above example, it is possible to have the command `transceiver type all` for entering a submode, and then give the command `monitor [interval <300-3600>]`. If the `tailf:cli-full-command` annotation had not been used, the following would also have been a valid command: `transceiver type all monitor [interval <300-3600>]`. In the above example, it doesn't make a difference as far as being able to parse the configuration on a device. The device will never show the oneline command syntax but always display it as two lines, one for entering the submode and one for setting the monitor interval.

</details>

<details>

<summary><code>tailf:cli-full-no</code></summary>

This annotation tells the CLI parser that no further arguments should be accepted for this path when the path is traversed as an argument to the **no** command.

Example of use:

```
// event manager applet * / action * info
container info {
  tailf:info "Obtain system specific information";
  // event manager applet * / action info type
  container "type" {
    tailf:info "Type of information to obtain";
    tailf:cli-full-no;
    container snmp {
      tailf:info "SNMP information";
      // event manager applet * / action info type snmp var
      container var {
        tailf:info "Trap variable";
        tailf:cli-compact-syntax;
        tailf:cli-sequence-commands;
        tailf:cli-reset-container;
        leaf variable-name {
          tailf:cli-drop-node-name;
          tailf:cli-incomplete-command;
          type string {
            tailf:info "WORD;;Trap variable name";
          }
        }
      }
    }
  }
}
```

</details>

<details>

<summary><code>tailf:cli-hide-in-submode</code></summary>

In some cases, you need to give some parameters for entering a submode, but the submode cannot be modeled as a list, or the parameters should not be modeled as a key element of the list but rather behaves as a leaf. In these cases, you model the parameter as a leaf and use the `tailf:cli-hide-in-submode` annotation. It has two purposes, the leaf is displayed as part of the command for entering the submode when rendering the config, and the leaf is not available as a command in the submode.

For example:

```
// event manager applet *
list applet {
  tailf:info "Register an Event Manager applet";
  tailf:cli-mode-name "config-applet";
  tailf:cli-exit-command "exit" {
    tailf:info "Exit from Event Manager applet configuration submode";
  }
  key name;
  leaf name {
    type string {
      tailf:info "WORD;;Name of the Event Manager applet";
    }
  }
  // event manager applet * authorization
  leaf authorization {
    tailf:info "Specify an authorization type for the applet";
    tailf:cli-hide-in-submode;
    type enumeration {
      enum bypass {
        tailf:info "EEM aaa authorization type bypass";
      }
    }
  }
  // event manager applet * class
  leaf class {
    tailf:info "Specify a class for the applet";
    tailf:cli-hide-in-submode;
    type string {
      tailf:info "Class A-Z | default - default class";
      pattern "[A-Z]|default";
    }
  }
  // event manager applet * trap
  leaf trap {
    tailf:info "Generate an SNMP trap when applet is triggered.";
    tailf:cli-hide-in-submode;
    type empty;
  }
}
```

In the example above the key to the list is the **name** leaf, but to enter the submode the user may also give the arguments `event manager applet <name> [authorization bypass] [class <word>] [trap]`. It is clear that these leaves are not keys to the list since giving the same name but different authorization, class, or trap argument does not result in a new applet instance.

</details>

<details>

<summary><code>tailf:cli-incomplete-command</code></summary>

Tells the CLI that it should not be possible to hit `cr` after the current element. This is usually the case when a command takes multiple parameters, for example, given the following data model:

```yang
container foo {
  tailf:cli-compact-syntax;
  tailf:cli-sequence-commands;
  presence true;
  leaf a {
    type string;
  }
  leaf b {
    type string;
  }
  leaf c {
    type string;
  }
}
```

The valid commands are `foo [a <word> [b <word> [c <word>]]]`. If it however should be `foo a <word> b <word> [c <word>]`, i.e. the parameters `a` and `b` are mandatory, and `c` is optional, then the `tailf:cli-incomplete-command` annotation should be used as follows:

```yang
container foo {
  tailf:cli-compact-syntax;
  tailf:cli-sequence-commands;
  tailf:cli-incomplete-command;
  presence true;
  leaf a {
    tailf:cli-incomplete-command;
    type string;
  }
  leaf b {
    type string;
  }
  leaf c {
    type string;
  }
}
```

In other words, the command is incomplete after entering just `foo`, and also after entering `foo a <word>`, but not after `foo a <word> b <word>` or `foo a <word> b <word> c <word>`.

</details>

<details>

<summary><code>tailf:cli-incomplete-no</code></summary>

This annotation is similar to the `tailf:cli-incomplete-command` above, but applies to **no** commands. Sometimes you want to prevent the user from entering a generic **no** command. Suppose you have the data model:

```yang
container foo {
  tailf:cli-compact-syntax;
  tailf:cli-sequence-commands;
  tailf:cli-incomplete-command;
  presence true;
  leaf a {
    tailf:cli-incomplete-command;
    type string;
  }
  leaf b {
    type string;
  }
  leaf c {
    type string;
  }
}
```

Then it would be valid to write any of the following:

```
no foo
no foo a <word>
no foo a <word> b <word>
no foo a <word> b <word> c <word>
```

If you only want the last version of this to be a valid command, then you can use `tailf:cli-incomplete-no` to enforce this. For example:

```yang
container foo {
  tailf:cli-compact-syntax;
  tailf:cli-sequence-commands;
  tailf:cli-incomplete-command;
  tailf:cli-incomplete-no;
  presence true;
  leaf a {
    tailf:cli-incomplete-command;
    tailf:cli-incomplete-no;
    type string;
  }
  leaf b {
    tailf:cli-incomplete-no;
    type string;
  }
  leaf c {
    type string;
  }
}
```

</details>

<details>

<summary><code>tailf:cli-list-syntax</code></summary>

The default rendering of a leaf-list element is as a command taking a list of values enclosed in square brackets. Given the following element:

```
// class-map * / source-address
container source-address {
  tailf:info "Source address";
  leaf-list mac {
    tailf:info "MAC address";
    type string {
      tailf:info "H.H.H;;MAC address";
    }
  }
}
```

This would result in the command `source-address mac [ H.H.H... H.H.H ]`, instead of the desired `source-address mac H.H.H`. Given the configuration:

```
source-address {
  mac [ 1410.9fd8.8999 a110.9fd8.8999 bb10.9fd8.8999 ]
}
```

It should be rendered as:

```
source-address mac 1410.9fd8.8999
source-address mac a110.9fd8.8999
source-address mac bb10.9fd8.8999
```

This is achieved by adding the `tailf:cli-list-syntax` annotation. For example:

```
// class-map * / source-address
container source-address {
  tailf:info "Source address";
  leaf-list mac {
    tailf:info "MAC address";
    tailf:cli-list-syntax;
    type string {
      tailf:info "H.H.H;;MAC address";
    }
  }
}
```

An alternative would be to model this as a list, i.e.:

```
// class-map * / source-address
container source-address {
  tailf:info "Source address";
  list mac {
    tailf:info "MAC address";
    tailf:cli-suppress-mode;
    key address;
    leaf address {
      type string {
        tailf:info "H.H.H;;MAC address";
      }
    }
  }
}
```

In many cases, this may be the better choice. Notice how the `tailf:cli-suppress-mode` annotation is used to prevent the list from being rendered as a submode.

</details>

<details>

<summary><code>tailf:cli-mode-name</code></summary>

This annotation is not really needed when writing a NED. It is used to tell the CLI which prompt to use when in the submode. Without specific instructions, the CLI will invent a prompt based on the name of the submode container/list and the list instance. If a specific prompt is desired this annotation can be used. For example:

```yang
container transceiver {
  tailf:info "Select from transceiver configuration commands";
  container "type" {
    tailf:info "type keyword";
    // transceiver type all
    container all {
      tailf:cli-add-mode;
      tailf:cli-mode-name "config-xcvr-type";
      tailf:cli-full-command;
      // transceiver type all / monitoring
      container monitoring {
        tailf:info "Enable/disable monitoring";
        presence true;
        leaf interval {
          tailf:info "Set interval for monitoring";
          type uint16 {
            tailf:info "<300-3600>;;Time interval for monitoring "+
            "transceiver in seconds";
            range "300..3600";
          }
        }
      }
    }
  }
}
```

</details>

<details>

<summary><code>tailf:cli-multi-value</code></summary>

This annotation is used to indicate that a leaf should accept multiple tokens, and concatenate them. By default, only a single token is accepted as value to a leaf. If spaces are required then the value needs to be quoted. If this isn't desired the `tailf:cli-multi-value` annotation can be used to tell the parser that a leaf should accept multiple tokens. A common example of this is the description command. It is modeled as:

```
// event manager applet * / description
leaf "description" {
  tailf:info "Add or modify an applet description";
  tailf:cli-full-command;
  tailf:cli-multi-value;
  type string {
    tailf:info "LINE;;description";
  }
}
```

In the above example, the description command will take all tokens to the end of the line, concatenate them with a space, and use that for leaf value. The `tailf:cli-full-command` annotation is used to tell the parser that no other command following this can be entered on the same command line. The parser would not be able to determine when the argument to this command ended and the next command commenced anyway.

</details>

<details>

<summary><code>tailf:cli-multi-word-key</code> and <code>tailf:cli-max-words</code></summary>

By default, all key values consist of a single parser token, i.e. a string without spaces, or a quoted string. If multiple tokens should be accepted for a single key element, without quotes, then the `tailf:cli-multi-word-key` annotation can be used. The sub-annotation `tailf:cli-max-words` can be used to tell the parser that at most a fixed number of words should be allowed for the key. For example:

```yang
container permit {
  tailf:info "Specify community to accept";
  presence "Specify community to accept";
  list permit-list {
    tailf:cli-suppress-mode;
    tailf:cli-delete-when-empty;
    tailf:cli-drop-node-name;
    key expr;
    leaf expr {
      tailf:cli-multi-word-key {
        tailf:cli-max-words 10;
      }
      type string {
        tailf:info "LINE;;An ordered list as a regular-expression";
      }
    }
  }
}
```

The `tailf:cli-max-words` annotation can be used to allow more things to be entered on the same command line.

</details>

<details>

<summary><code>tailf:cli-no-name-on-delete</code> and <code>tailf:cli-no-value-on-delete</code></summary>

When generating delete commands towards the device, the default behavior is to simply add `no` in front of the line you are trying to remove. However, this is not always allowed. In some cases, only parts of the command are allowed. For example, suppose you have the data model:

```yang
container ospf {
  tailf:info "OSPF routes Administrative distance";
  leaf external {
    tailf:info "External routes";
    type uint32 {
      range "1.. 255";
      tailf:info "<1-255>;;Distance for external routes";
    }
    tailf:cli-suppress-no;
    tailf:cli-no-value-on-delete;
    tailf:cli-no-name-on-delete;
  }
  leaf inter-area {
    tailf:info "Inter-area routes";
    type uint32 {
      range "1.. 255";
      tailf:info "<1-255>;;Distance for inter-area routes";
    }
    tailf:cli-suppress-no;
    tailf:cli-no-name-on-delete;
    tailf:cli-no-value-on-delete;
  }
  leaf intra-area {
    tailf:info "Intra-area routes";
    type uint32 {
      range "1.. 255";
      tailf:info "<1-255>;;Distance for intra-area routes";
    }
    tailf:cli-suppress-no;
    tailf:cli-no-name-on-delete;
    tailf:cli-no-value-on-delete;
  }
}
```

If the old configuration has the configuration `ospf external 3 inter-area 4 intra-area 1` then the default behavior would be to send `no ospf external 3 inter-area 4 intra-area 1` but this would generate an error. Instead, the device simply wants `no ospf`. This is then achieved by adding `tailf:cli-no-name-on-delete` (telling the CLI engine to remove the element name from the no line), and `tailf:cli-no-value-on-delete` (telling the CLI engine to strip the leaf value from the command line to be sent).

</details>

<details>

<summary><code>tailf:cli-optional-in-sequence</code></summary>

This annotation is used in combination with `tailf:cli-sequence-commands`. It tells the parser that a leaf in the sequence isn't mandatory. Suppose you have the data model:

```yang
container foo {
  tailf:cli-compact-syntax;
  tailf:cli-sequence-commands;
  presence true;
  leaf a {
    tailf:cli-incomplete-command;
    type string;
  }
  leaf b {
    tailf:cli-incomplete-command;
    type string;
  }
  leaf c {
    type string;
  }
}
```

If you want the command to behave as `foo a <word> [b <word>] c <word>`, it means that the leaves `a` and `c` are required and `b` is optional. If `b` is to be entered, it must be entered after `a` and before `c`. This would be achieved by adding `tailf:cli-optional-in-sequence` in `b`.

```yang
container foo {
  tailf:cli-compact-syntax;
  tailf:cli-sequence-commands;
  presence true;
  leaf a {
    tailf:cli-incomplete-command;
    type string;
  }
  leaf b {
    tailf:cli-incomplete-command;
    tailf:cli-optional-in-sequence;
    type string;
  }
  leaf c {
    type string;
  }
}
```

A live example of this from the Cisco-ios data model is:

```
// voice translation-rule * / rule *
list rule {
  tailf:info "Translation rule";
  tailf:cli-suppress-mode;
  tailf:cli-delete-when-empty;
  tailf:cli-incomplete-command;
  tailf:cli-compact-syntax;
  tailf:cli-sequence-commands {
    tailf:cli-reset-all-siblings;
  }
  ordered-by "user";
  key tag;
  leaf tag {
    type uint8 {
      tailf:info "<1-15>;;Translation rule tag";
      range "1..15";
    }
  }
  leaf reject {
    tailf:info "Call block rule";
    tailf:cli-optional-in-sequence;
    type empty;
  }
  leaf "pattern" {
  tailf:cli-drop-node-name;
  tailf:cli-full-command;
  tailf:cli-multi-value;
  type string {
    tailf:info "WORD;;Matching pattern";
    }
  }
}
```

</details>

<details>

<summary><code>tailf:cli-prefix-key</code></summary>

This annotation is used when the key element of a list isn't the first value that you give when setting a list element (for example when entering a submode). This is similar to `tailf:cli-hide-in-submode`, except it allows the leaf values to be entered in between key elements. In the example below the match leaf is entered before giving the filter ID.

```yang
container radius {
  tailf:info "RADIUS server configuration command";
  // radius filter *
  list filter {
    tailf:info "Packet filter configuration";
    key id;
    leaf id {
      type string {
      tailf:info "WORD;;Name of the filter (max 31 characters, longer will "
      +"be rejected";
    }
  }
  leaf match {
    tailf:cli-drop-node-name;
    tailf:cli-prefix-key;
    type enumeration {
      enum match-all {
        tailf:info "Filter if all of the attributes matches";
      }
      enum match-any {
        tailf:info "Filter if any of the attributes matches";
      }
    }
  }
}
```

It is also possible to have a sub-annotation to `tailf:cli-prefix-key` that specifies that the leaf should occur before a certain key position. For example:

```yang
list route-map {
  tailf:info "Route map tag";
  tailf:cli-mode-name "config-route-map";
  tailf:cli-compact-syntax;
  tailf:cli-full-command;
  key "name sequence";
  leaf name {
    type string {
      tailf:info "WORD;;Route map tag";
    }
  }
  // route-map * #
  leaf sequence {
    tailf:cli-drop-node-name;
    type uint16 {
      tailf:info "<0-65535>;;Sequence to insert to/delete from "
      +"existing route-map entry";
      range "0..65535";
    }
  }
  // route-map * permit
  // route-map * deny
  leaf operation {
    tailf:cli-drop-node-name;
    tailf:cli-prefix-key {
      tailf:cli-before-key 2;
    }
    type enumeration {
      enum deny {
        tailf:code-name "op_deny";
        tailf:info "Route map denies set operations";
      }
      enum permit {
        tailf:code-name "op_internet";
        tailf:info "Route map permits set operations";
      }
    }
    default permit;
  }
  // route-map * / description
  leaf "description" {
    tailf:info "Route-map comment";
    tailf:cli-multi-value;
    type string {
      tailf:info "LINE;;Comment up to 100 characters";
      length "0..100";
    }
  }
}
```

The keys for this list are `name` and `sequence`, but in between you need to specify `deny` or `permit`. This is not a key since you cannot have two different list instances with the same name and sequence number, but differ in `deny` and `permit`.

</details>

<details>

<summary><code>tailf:cli-range-list-syntax</code></summary>

This annotation is used to group together list instances, or values in a leaf-list into ranges. The type of the value is not restricted to integers only. It works with a string also, and it is possible to have a value like this: 1-5, t1, t2.

```
// spanning-tree vlans-root
container vlans-root {
  tailf:cli-drop-node-name;
  list vlan {
    tailf:info "VLAN Switch Spanning Tree";
    tailf:cli-range-list-syntax;
    tailf:cli-suppress-mode;
    tailf:cli-delete-when-empty;
    key id;
    leaf id {
      type uint16 {
        tailf:info "WORD;;vlan range, example: 1,3-5,7,9-11";
        range "1..4096";
      }
    }
  }
}
```

What will exist in the database is separate instances, i.e. if the configuration is `vlan 1,3-5,7,9-11` this will result in the database having the instances 1,3,4,5,7,9,10, and 11. Similarly, to create these instances on the device, the command generated by NSO will be `vlan 1,3-5,7,9-11`. Without this annotation, NSO would generate unique commands for each instance, i.e.:

```
vlan 1
vlan 2
vlan 3
vlan 5
vlan 7
...
```

Same thing for leaf-lists:

```
leaf-list vlan {
  tailf:info "Range of vlans to add to the instance mapping";
  tailf:cli-range-list-syntax;
  type uint16 {
    tailf:info "LINE;;vlan range ex: 1-65, 72, 300 -200";
  }
}
```

</details>

<details>

<summary><code>tailf:cli-remove-before-change</code></summary>

Some settings need to be unset before they can be set. This can be accommodated by using the `tailf:cli-remove-before-change` annotation. An example of such a leaf is:

```
// ip vrf * / rd
leaf rd {
  tailf:info "Specify Route Distinguisher";
  tailf:cli-full-command;
  tailf:cli-remove-before-change;
  type rd-type;
}
```

You are not allowed to define a new route distinguisher before removing the old one.

</details>

<details>

<summary><code>tailf:cli-replace-all</code></summary>

This annotation is used on leaf-lists to tell the CLI engine that the entire list should be written and not just the additions or subtractions, which is the default behavior for leaf-lists. For example:

```
// controller * / channel-group
list channel-group {
  tailf:info "Specify the timeslots to channel-group "+
  "mapping for an interface";
  tailf:cli-suppress-mode;
  tailf:cli-delete-when-empty;
  key number;
  leaf number {
    type uint8 {
      range "0..30";
    }
  }
  leaf-list timeslots {
    tailf:cli-replace-all;
    tailf:cli-range-list-syntax;
    type uint16;
  }
}
```

The `timeslots` leaf is changed by writing the entire range value. The default would be to generate commands for adding and deleting values from the range.

</details>

<details>

<summary><code>tailf:cli-reset-siblings</code> and <code>tailf:cli-reset-all-siblings</code></summary>

This annotation is a sub-annotation to `tailf:cli-sequence-commands`. The problem it addresses is what should happen when a command that takes multiple parameters is run a second time. Consider the data model:

```yang
container foo {
  tailf:cli-compact-syntax;
  tailf:cli-sequence-commands {
    tailf:cli-reset-siblings;
  }
  presence true;
  leaf a {
    type string;
  }
  leaf b {
    type string;
  }
  leaf c {
    type string;
  }
}
```

You are allowed to enter any of the below commands:

```
foo
foo a <word>
foo a <word> b <word>
foo a <word> b <word> c <word>
```

If you first enter the command `foo a 1 b 2 c 3`, what will be stored in the database is foo being present, the leaf `a` having the value 1, the leaf b having the value 2, and the leaf `c` having the value 3.

Now, if the command `foo a 3` is executed, it will set the value of leaf `a` to 3, but will leave leaf `b` and `c` as they were before. This is probably not the way the device works. In most cases, it expects the leaves `b` and `c` to be unset. The annotation `tailf:cli-reset-siblings` tells the CLI engine that all siblings covered by the `tailf:cli-sequence-commands` should be reset.

Another similar case is when you have some leaves covered by the command sequencing, and some not. For example:

```yang
container foo {
  tailf:cli-compact-syntax;
  tailf:cli-sequence-commands {
    tailf:cli-reset-all-siblings;
  }
  presence true;
  leaf a {
    type string;
  }
  leaf b {
    tailf:cli-break-sequence-commands;
    type string;
  }
  leaf c {
    type string;
  }
}
```

The above model will allow the user to enter the b and c leaves in any order, as long as leaf a is entered first. The annotation `tailf:cli-reset-siblings` will reset the leaves up to the `tailf:cli-break-sequence-commands`. The `tailf:cli-reset-all-siblings` tells the CLI engine to reset all siblings, also those outside the command sequencing.

</details>

<details>

<summary><code>tailf:cli-reset-container</code></summary>

This annotation can be used on both containers/lists and on leaves, but has slightly different meaning. When used on a container it means that whenever the container is entered, all leaves in it are reset.

If used on a leaf, it should be understood as whenever that leaf is set all other leaves in the container are reset. For example:

```
// license udi
container udi {
  tailf:cli-compact-syntax;
  tailf:cli-sequence-commands;
  tailf:cli-reset-container;
  leaf pid {
    type string;
  }
  leaf sn {
    type string;
  }
}
container ietf {
  tailf:info "IETF graceful restart";
  container helper {
    tailf:info "helper support";
    presence "helper support";
    leaf disable {
      tailf:cli-reset-container;
      tailf:cli-delete-container-on-delete;
      tailf:info "disable helper support";
      type empty;
    }
    leaf strict-lsa-checking {
    tailf:info "enable helper strict LSA checking";
    type empty;
  }
}
```

</details>

<details>

<summary><code>tailf:cli-show-long-obu-diffs</code></summary>

Changes to lists that have the `ordered-by "user"` annotation are shown as insert, delete, and move operations. However, most devices do not support such operations on the lists. In these cases, if you want to insert an element in the middle of a list, you need to first delete all elements following the insertion point, add the new element, and then add all the elements you deleted. The `tailf:cli-show-long-obu-diffs` tells the CLI engine to do exactly this. For example:

```yang
list foo {
  ordered-by user;
  tailf:cli-show-long-obu-diffs;
  tailf:cli-suppress-mode;
  key id;
  leaf id {
    type string;
  }
}
```

If the old configuration is:

```
foo a
foo b
foo c
foo d
```

The desired configuration is:

```
foo a
foo b
foo e
foo c
foo d
```

NSO will send the following to the device:

```
no foo c
no foo d
foo e
foo c
foo d
```

An example from the cisco-ios model is:

```
// ip access-list extended *
container extended {
  tailf:info "Extended Access List";
  tailf:cli-incomplete-command;
  list ext-named-acl {
    tailf:cli-drop-node-name;
    tailf:cli-full-command;
    tailf:cli-mode-name "config-ext-nacl";
    key name;
    leaf name {
      type ext-acl-type;
    }
    list ext-access-list-rule {
      tailf:cli-suppress-mode;
      tailf:cli-delete-when-empty;
      tailf:cli-drop-node-name;
      tailf:cli-compact-syntax;
      tailf:cli-show-long-obu-diffs;
      ordered-by user;
      key rule;
      leaf rule {
        tailf:cli-drop-node-name;
        tailf:cli-multi-word-key;
        type string {
          tailf:info "deny;;Specify packets to reject\n"+
          "permit;;Specify packets to forwards\n"+
          "remark;;Access list entry comment";
          pattern "(permit.*)|(deny.*)|(no.*)|(remark.*)|([0-9]+.*)";
        }
      }
    }
  }
}
```

</details>

<details>

<summary><code>tailf:cli-show-no</code></summary>

One common CLI behavior is to not only show when something is configured but also when it isn't configured by displaying it as `no <command>`. You can tell the CLI engine that you want this behavior by using the `tailf:cli-show-no` annotation. It can be used both on leaves and on presence containers. For example:

```
// ipv6 cef
container cef {
  tailf:info "Cisco Express Forwarding";
  tailf:cli-display-separated;
  tailf:cli-show-no;
  presence true;
}
```

And,

```
// interface * / shutdown
leaf shutdown {
  // Note: default to "no shutdown" in order to be able to bring if up.
  tailf:info "Shutdown the selected interface";
  tailf:cli-full-command;
  tailf:cli-show-no;
  type empty;
}
```

However, this is a much more subtle behaviour than one may think and it is not obvious when the `tailf:cli-show-no` and the `tailf:cli-boolean-no` should be used. For example, it would also be possible to model the `shutdown` leaf a boolean value, i.e.:

```
// interface * / shutdown
leaf shutdown {
  tailf:cli-boolean-no;
  type boolean;
}
```

The problem with the above is that when a new interface is created, say a VLAN interface, the `shutdown` leaf would not be set to anything and you would not send anything to the device. With the `cli-show-no` definition, you would send `no shutdown` since the shutdown leaf would not be defined when a new interface VLAN instance is created.

The boolean version can be tweaked to behave in a similar way using the `default` annotation and `tailf:cli-show-with-default`, i.e.:

```
// interface * / shutdown
leaf shutdown {
  tailf:cli-show-with-default;
  tailf:cli-boolean-no;
  type boolean;
  default "false";
}
```

The problem with this is that if you explicitly configure the leaf to false in NSO, you will send `no shutdown` to the device (which is fine), but if you then read the config from the device it will not display `no shutdown` since it now has its default setting. This will lead to an out-of-sync situation in NSO. NSO thinks the value should be set to false (which is different from the leaf not being set), whereas the device reports the value as being unset.

The whole situation comes from the fact that NSO and the device treat default values differently. NSO considers a leaf as either being set or not set. If a leaf is set to its default value, it is still considered as set. A leaf must be explicitly deleted for it to become unset. Whereas a typical Cisco device considers a leaf unset if you set it to its default value.

</details>

<details>

<summary><code>tailf:cli-show-with-default</code></summary>

This tells the CLI engine to render a leaf not only when it is actually set, but also when it has its default value. For example:

```yang
leaf "input" {
  tailf:cli-boolean-no;
  tailf:cli-show-with-default;
  tailf:cli-full-command;
  type boolean;
  default true;
}
```

</details>

<details>

<summary><code>tailf:cli-suppress-list-no</code></summary>

Tells the CLI that it should not be possible to delete all lists instances, i.e. the command `no foo` is not allowed, it needs to be `no foo <instance>`. For example:

```yang
list class-map {
  tailf:info "Configure QoS Class Map";
  tailf:cli-mode-name "config-cmap";
  tailf:cli-suppress-list-no;
  tailf:cli-delete-when-empty;
  tailf:cli-no-key-completion;
  tailf:cli-sequence-commands;
  tailf:cli-full-command;
  // class-map *
  key name;
  leaf name {
    tailf:cli-disallow-value "type|match-any|match-all";
    type string {
      tailf:info "WORD;;class-map name";
    }
  }
}
```

</details>

<details>

<summary><code>tailf:cli-suppress-mode</code></summary>

By default, all lists are rendered as submodes. This can be suppressed using the `tailf:cli-suppress-mode` annotation. For example, the data model:

```yang
list foo {
  key id;
  leaf id {
    type string;
  }
  leaf mtu {
    type uint16;
  }
}
```

If you have the configuration:

```
foo a {
  mtu 1400;
}
foo b {
  mtu 1500;
}
```

It would be rendered as:

```
foo a
mtu 1400
!
foo b
mtu 1500
!
```

However, if you add `tailf:cli-suppress-mode`:

```yang
list foo {
  tailf:cli-suppress-mode;
  key id;
  leaf id {
    type string;
  }
  leaf mtu {
    type uint16;
  }
}
```

It will be rendered as:

```
foo a mtu 1400
foo b mtu 1500
```

</details>

<details>

<summary><code>tailf:cli-key-format</code></summary>

The format string is used when parsing a key value and when generating a key value for an existing configuration. The key items are numbered from 1-N and the format string should indicate how they are related by using $(X) (where X is the key number). For example:

```yang
list interface {
  tailf:cli-key-format "$(1)/$(2)/$(3):$(4)";
  key "chassis slot subslot number";
  leaf chassis {
    type uint8 {
      range "1 .. 4";
    }
  }
  leaf slot {
    type uint8 {
      range "1 .. 16";
    }
  }
  leaf subslot {
    type uint8 {
      range "1 .. 48";
    }
  }
  leaf number {
    type uint8 {
      range "1 .. 255";
    }
  }
}
```

It will be rendered as:

```
interface 1/2/3:4
```

</details>

<details>

<summary><code>tailf:cli-recursive-delete</code></summary>

When generating configuration diffs delete all contents of a container or list before deleting the node. For example:

```yang
list foo {
  tailf:cli-recursive-delete;
  key "id"";
  leaf id {
    type string;
  }
  leaf a {
    type uint8;
  }
  leaf b {
    type uint8;
  }
  leaf c {
    type uint8;
  }
}
```

It will be rendered as:

```bash
# show full
foo bar
 a 1
 b 2
 c 3
!
# ex
# no foo bar
# show configuration
foo bar
 no a 1
 no b 2
 no c 3
!
no foo bar
#
```

</details>

<details>

<summary><code>tailf:cli-suppress-no</code></summary>

Specifies that the CLI should not auto-render `no` commands for this element. An element with this annotation will not appear in the completion list to the `no` command. For example:

```yang
list foo {
  tailf:cli-recursive-delete;
  key "id"";
  leaf id {
    type string;
  }
  leaf a {
    type uint8;
  }
  leaf b {
    tailf:cli-suppress-no;
    type uint8;
  }
  leaf c {
    type uint8;
  }
}
```

It will be rendered as:

```
(config-foo-bar)# no ?
Possible completions:
  a
  c
  ---
```

The problem with the above is that the diff will still generate the **no**. To avoid it, you must use the `tailf:cli-no-value-on-delete` and `tailf:cli-no-name-on-delete`.

```
(config-foo-bar)# no ?
Possible completions:
  a
  c
  ---
  service   Modify use of network based services
(config-foo-bar)# ex
(config)# no foo bar
(config)# show config
foo bar
 no a 1
 no b 2
 no c 3
!
no foo bar
(config)#
```

</details>

<details>

<summary><code>tailf:cli-trim-default</code></summary>

Do not display the value if it is the same as default. Please note that this annotation works only in the case of with-defaults basic-mode capability set to `explicit` and the value is explicitly set by the user to the default value. For example:

```yang
list foo {
  key "id"";
  leaf id {
    type string;
  }
  leaf a {
    type uint8;
    default 1;
  }
  leaf b {
    tailf:cli-trim-default;
    type uint8;
    default 2;
  }
}
```

It will be rendered as:

```
(config)# foo bar
(config-foo-bar)# a ?
Possible completions:
  <unsignedByte>[1]
(config-foo-bar)# a 2 b ?
Possible completions:
  <unsignedByte>[2]
(config-foo-bar)# a 2 b 3
(config-foo-bar)# commit
Commit complete.
(config-foo-bar)# show full
foo bar
 a 2
 b 3
!
(config-foo-bar)# a 1 b 2
(config-foo-bar)# commit
Commit complete.
(config-foo-bar)# show full
foo bar
 a 1
!
```

</details>

<details>

<summary><code>tailf:cli-embed-no-on-delete</code></summary>

Embed `no` in front of the element name instead of at the beginning of the line. For example:

```yang
list foo {
 key "id";
 leaf id {
  type string;
 }
 leaf a {
  type uint8;
 }
 container x {
  leaf b {
   type uint8;
   tailf:cli-embed-no-on-delete;
  }
 }
}
```

It will be rendered as:

```
(config-foo-bar)# show full
foo bar
 a 1
 x b 3
!
(config-foo-bar)# no x
(config-foo-bar)# show conf
foo bar
 x no b 3
!
```

</details>

<details>

<summary><code>tailf:cli-allow-range</code></summary>

This means that the non-integer key should allow range expressions. Can be used in key leafs only. The key must support a range format. The range applies only for matching existing instances. For example:

```yang
list interface {
  key name;
  leaf name {
    type string;
    tailf:cli-allow-range;
  }
  leaf number {
    type uint32;
  }
}
```

It will be rendered as:

```
(config)# interface eth0-100 number 90
Error: no matching instances found
(config)# interface
Possible completions:
  <name:string>  eth0  eth1  eth2  eth3  eth4  eth5  range
(config)# interface eth0-3 number 100
(config-interface-eth0-3)# ex
(config)# interface eth4-5 number 200
(config-interface-eth4-5)# commit
Commit complete.
(config-interface-eth4-5)# ex
(config)# do show running-config interface
interface eth0
 number 100
!
interface eth1
 number 100
!
interface eth2
 number 100
!
interface eth3
 number 100
!
interface eth4
 number 200
!
interface eth5
 number 200
!
```

</details>

<details>

<summary><code>tailf:cli-case-sensitive</code></summary>

Specifies that this node is case-sensitive. If applied to a container or a list, any nodes below will also be case-sensitive. For example:

```yang
list foo {
  tailf:cli-case-sensitive;
  key "id";
  leaf id {
    type string;
  }
  leaf a {
    type string;
  }
}
```

It will be rendered as:

```
(config)# foo bar a test
(config-foo-bar)# ex
(config)# commit
Commit complete.
(config)# do show running-config foo
foo bar
 a test
!
(config)# foo bar a Test
(config-foo-bar)# ex
(config)# foo Bar a TEST
(config-foo-Bar)# commit
Commit complete.
(config-foo-Bar)# ex
(config)# do show running-config foo
foo Bar
 a TEST
!
foo bar
 a Test
!
```

</details>

<details>

<summary><code>tailf:cli-expose-ns-prefix</code></summary>

When used force the CLI to display the namespace prefix of all children. For example:

```yang
list foo {
  tailf:cli-expose-ns-prefix;
  key "id"";
  leaf id {
    type string;
  }
  leaf a {
    type uint8;
  }
  leaf b {
    type uint8;
  }
  leaf c {
    type uint8;
  }
}
```

It will be rendered as:

```
(config)# foo bar
(config-foo-bar)# ?
Possible completions:
  example:a
  example:b
  example:c
  ---
```

</details>

<details>

<summary><code>tailf:cli-show-obu-comments</code></summary>

Enforces the CLI engine to generate `insert` comments when displaying configuration changes of `ordered-by user` lists. Should not be used together with `tailf:cli-show-long-obu-diffs`. For example:

```yang
  container policy {
    list policy-list {
      tailf:cli-drop-node-name;
      tailf:cli-show-obu-comments;
      ordered-by user;
      key policyid;
      leaf policyid {
        type uint32 {
          tailf:info "policyid;;Policy ID.";
        }
      }
      leaf-list srcintf {
        tailf:cli-flat-list-syntax {
          tailf:cli-replace-all;
        }
        type string;
      }
      leaf-list srcaddr {
        tailf:cli-flat-list-syntax {
          tailf:cli-replace-all;
        }
        type string;
      }
      leaf-list dstaddr {
        tailf:cli-flat-list-syntax {
          tailf:cli-replace-all;
        }
        type string;
      }
      leaf action {
        type enumeration {
          enum accept {
          tailf:info "Action accept.";
          }
          enum deny {
          tailf:info "Action deny.";
          }
      }
```

It will be rendered as:

```cli
admin@ncs(config-policy-4)# commit dry-run outformat cli
...
                   policy {
                       policy-list 1 {
  -                        action accept;
  +                        action deny;
                       }
  +                    # after policy-list 3
  +                    policy-list 4 {
  +                        srcintf aaa;
  +                        srcaddr bbb;
  +                        dstaddr ccc;
  +                    }
                   }
               }
           }
       }
   }
```

</details>

<details>

<summary><code>tailf:cli-multi-line-prompt</code></summary>

This tells the CLI to automatically enter multi-line mode when prompting the user for a value to this leaf. The user must type `<CR>` to enter in the multiline mode. For example:

```yang
leaf message {
  tailf:cli-multi-line-prompt;
  type string;
}
```

If configured on the same line, no prompt will appear and it will be rendered as:

```
(config)# message aaa
```

If \<CR> typed, it will be rendered as:

```
(config)# message
(<string>) (aaa):
[Multiline mode, exit with ctrl-D.]
> Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
> Aenean commodo ligula eget dolor. Aenean massa.
> Cum sociis natoque penatibus et magnis dis parturient montes,
> nascetur ridiculus mus. Donec quam felis, ultricies nec,
>  pellentesque eu, pretium quis, sem.
>
(config)# commit
Commit complete.
ubuntu(config)# do show running-config message
message "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. \nAenean
commodo ligula eget dolor. Aenean massa. \nCum sociis natoque penatibus et
magnis dis parturient montes, \nnascetur ridiculus mus. Donec quam felis,
ultricies nec,\n pellentesque eu, pretium quis, sem. \n"
(config)#
```

</details>

<details>

<summary><code>tailf:link target</code></summary>

This statement specifies that the data node should be implemented as a link to another data node, called the target data node. This means that whenever the node is modified, the system modifies the target data node instead, and whenever the data node is read, the system returns the value of the target data node. Note that if the data node is a leaf, the target node MUST also be a leaf, and if the data node is a leaf-list, the target node MUST also be a leaf-list. The argument is an XPath absolute location path. If the target lies within lists, all keys must be specified. A key either has a value or is a reference to a key in the path of the source node, using the function `current()` as a starting point for an XPath location path. For example:

```yang
container foo {
  list bar {
   key id;
   leaf id {
     type uint32;
   }
   leaf a {
    type uint32;
   }
   leaf b {
     tailf:link "/example:foo/example:bar[id=current()/../id]/example:a";
     type uint32;
   }
 }
}
```

It will be rendered as:

```
(config)# foo bar 1
ubuntu(config-bar-1)# ?
Possible completions:
  a
  b
  ---
  commit     Commit current set of changes
  describe   Display transparent command information
  exit       Exit from current mode
  help       Provide help information
  no         Negate a command or set its defaults
  pwd        Display current mode path
  top        Exit to top level and optionally run command
(config-bar-1)# b 100
(config-bar-1)# show config
foo bar 1
 b 100
!
(config-bar-1)# commit
Commit complete.
(config-bar-1)# show full
foo bar 1
 a 100
 b 100
!
(config-bar-1)# a 20
(config-bar-1)# commit
Commit complete.
(config-bar-1)# show full
foo bar 1
 a 20
 b 20
!
```

</details>
