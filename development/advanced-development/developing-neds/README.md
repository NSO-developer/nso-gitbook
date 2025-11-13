---
description: Develop your own NEDs to integrate unsupported devices in your network.
---

# Developing NEDs

## Creating a NED

A Network Element Driver (NED) represents a key NSO component that allows NSO to communicate southbound with network devices. The device YANG models contained in the Network Element Drivers (NEDs) enable NSO to store device configurations in the CDB and expose a uniform API to the network for automation. The YANG models can cover only a tiny subset of the device or all of the device. Typically, the YANG models contained in a NED represent the subset of the device's configuration data, state data, Remote Procedure Calls, and notifications to be managed using NSO.

This guide provides information on NED development, focusing on building your own NED package. For a general introduction to NEDs, Cisco-provided NEDs, and NED administration, refer to the [NED Administration](../../../administration/management/ned-administration.md) in Administration.

## Types of NED Packages <a href="#d5e8952" id="d5e8952"></a>

A NED package allows NSO to manage a network device of a specific type. NEDs typically contain YANG models and the code, specifying how NSO should configure and retrieve status. When developing your own NED, there are four categories supported by NSO.

* A NETCONF NED is used with the NSO's built-in NETCONF client and requires no code. Only YANG models. This NED is suitable for devices that strictly follow the specification for the NETCONF protocol and YANG mappings to NETCONF targeting a standardized machine-to-machine interface.
* CLI NED targeted devices that use a Cisco-style CLI as a human-to-machine configuration interface. Various YANG extensions are used to annotate the YANG model representation of the device together with code-converting data between NSO and device formats.
* A generic NED is typically used to communicate with non-CLI devices, such as devices using protocols like REST, TL1, Corba, SOAP, RESTCONF, or gNMI as a configuration interface. Even NETCONF-enabled devices often require a generic NED to function properly with NSO.
* NSO's built-in SNMP client can manage SNMP devices by supplying NSO with the MIBs, with some additional declarative annotations and code to handle the communication to the device. Usually, this legacy protocol is used to read state data. Albeit limited, NSO has support for configuring devices using SNMP.

In summary, the NETCONF and SNMP NEDs use built-in NSO clients; the CLI NED is model-driven, whereas the generic NED requires a Java program to translate operations toward the device.

## Dumb Versus Capable Devices <a href="#ncs.development.ned.dvsc" id="ncs.development.ned.dvsc"></a>

NSO differentiates between managed devices that can handle transactions and devices that can not. This discussion applies regardless of NED type, i.e., NETCONF, SNMP, CLI, or Generic.

NEDs for devices that cannot handle abort must indicate so in the reply of the `newConnection()` method indicating that the NED wants a reverse diff in case of an abort. Thus, NSO has two different ways to abort a transaction towards a NED, invoke the `abort()` method with or without a generated reverse diff.

For non-transactional devices, we have no other way of trying out a proposed configuration change than to send the change to the device and see what happens.

The table below shows the seven different data-related callbacks that could or must be implemented by all NEDs. It also differentiates between 4 different types of devices and what the NED must do in each callback for the different types of devices.

The table below displays the device types:

<table data-full-width="false"><thead><tr><th>Non transactional devices</th><th>Transactional devices</th><th>Transactional devices with confirmed commit</th><th>Fully capable NETCONF server</th></tr></thead><tbody><tr><td>SNMP, Cisco IOS, NETCONF devices with startup+running.</td><td>Devices that can abort, NETCONF devices without confirmed commit.</td><td>Cisco XR type of devices.</td><td>ConfD, Junos.</td></tr></tbody></table>

**INITIALIZE**: The initialize phase is used to initialize a transaction. For instance, if locking or other transaction preparations are necessary, they should be performed here. This callback is not mandatory to implement if no NED-specific transaction preparations are needed.

<table data-full-width="false"><thead><tr><th>Non transactional devices</th><th>Transactional devices</th><th>Transactional devices with confirmed commit</th><th>Fully capable NETCONF server</th></tr></thead><tbody><tr><td><code>initialize()</code>. NED code shall make the device go into config mode (if applicable) and lock (if applicable).</td><td><code>initialize()</code>. NED code shall start a transaction on the device.</td><td><code>initialize()</code>. NED code shall do the equivalent of configure exclusive.</td><td>Built in, NSO will lock.</td></tr></tbody></table>

**UNINITIALIZE**: If the transaction is not completed and the NED has done INITIALIZE, this method is called to undo the transaction preparations, that is restoring the NED to the state before INITIALIZE. This callback is not mandatory to implement if no NED-specific preparations were performed in INITIALIZE.

<table data-full-width="false"><thead><tr><th>Non transactional devices</th><th>Transactional devices</th><th>Transactional devices with confirmed commit</th><th>Fully capable NETCONF server</th></tr></thead><tbody><tr><td><code>uninitialize()</code>. NED code shall unlock (if applicable).</td><td><code>uninitialize()</code>. NED code shall abort the transaction.</td><td><code>uninitialize()</code>. NED code shall abort the transaction.</td><td>Built in, NSO will unlock.</td></tr></tbody></table>

**PREPARE**: In the prepare phase, the NEDs get exposed to all the changes that are destined for each managed device handled by each NED. It is the responsibility of the NED to determine the outcome here. If the NED replies successfully from the prepare phase, NSO assumes the device will be able to go through with the proposed configuration change.

<table data-full-width="false"><thead><tr><th>Non transactional devices</th><th>Transactional devices</th><th>Transactional devices with confirmed commit</th><th>Fully capable NETCONF server</th></tr></thead><tbody><tr><td><code>prepare(Data)</code>. NED code shall send all data to the device.</td><td><code>prepare(Data)</code>. NED code shall add Data to the transaction and validate.</td><td><code>prepare(Data)</code>. NED code shall add Data to the transaction and validate.</td><td>Built in, NSO will edit-config towards the candidate, validate and commit confirmed with a timeout.</td></tr></tbody></table>

**ABORT**: If any participants in the transaction reject the proposed changes, all NEDs will be invoked in the `abort()` method for each managed device the NED handles. It is the responsibility of the NED to make sure that whatever was done in the PREPARE phase is undone. For NEDs that indicate as a reply in `newConnection()` that they want the reverse diff, they will get the reverse data as a parameter here.

<table data-full-width="false"><thead><tr><th>Non transactional devices</th><th>Transactional devices</th><th>Transactional devices with confirmed commit</th><th>Fully capable NETCONF server</th></tr></thead><tbody><tr><td><code>abort(ReverseData | null)</code> Either do the equivalent of copy startup to running, or apply the ReverseData to the device.</td><td><code>abort(ReverseData | null)</code>. Abort the transaction</td><td><code>abort(ReverseData | null)</code>. Abort the transaction</td><td>Built in, discard-changes and close.</td></tr></tbody></table>

**COMMIT**: Once all NEDs that get invoked in `commit(Timeout)` reply OK, the transaction is permanently committed to the system. The NED may still reject the change in COMMIT. If any NED rejects the COMMIT, all participants will be invoked in REVERT, NEDs that support confirmed commit with a timeout, Cisco XR may choose to use the provided timeout to make REVERT easy to implement.

<table data-full-width="false"><thead><tr><th>Non transactional devices</th><th>Transactional devices</th><th>Transactional devices with confirmed commit</th><th>Fully capable NETCONF server</th></tr></thead><tbody><tr><td><code>commit(Timeout)</code>. Do nothing</td><td><code>commit(Timeout)</code>. Commit the transaction.</td><td><code>commit(Timeout)</code>. Execute commit confirmed [Timeout] on the device.</td><td>Built in, commit confirmed with the timeout.</td></tr></tbody></table>

**REVERT**: This state is reached if any NED reports failure in the COMMIT phase. Similar to the ABORT state, the reverse diff is supplied to the NED if the NED has asked for that.

<table data-full-width="false"><thead><tr><th>Non transactional devices</th><th>Transactional devices</th><th>Transactional devices with confirmed commit</th><th>Fully capable NETCONF server</th></tr></thead><tbody><tr><td><code>revert(ReverseData | null)</code> Either do the equivalent of copy startup to running, or apply the ReverseData to the device.</td><td><code>revert(ReverseData | null)</code> Either do the equivalent of copy startup to running, or apply the ReverseData to the device.</td><td><code>revert(ReverseData | null)</code>. discard-changes</td><td>Built in, discard-changes and close.</td></tr></tbody></table>

**PERSIST**: This state is reached at the end of a successful transaction. Here it's the responsibility of the NED to make sure that if the device reboots, the changes are still there.

<table data-full-width="false"><thead><tr><th>Non transactional devices</th><th>Transactional devices</th><th>Transactional devices with confirmed commit</th><th>Fully capable NETCONF server</th></tr></thead><tbody><tr><td><code>persist()</code> Either do the equivalent of copy running to startup or nothing.</td><td><code>persist()</code> Either do the equivalent of copy running to startup or nothing.</td><td><code>persist()</code>. confirm.</td><td>Built in, commit confirm.</td></tr></tbody></table>

The following state diagram depicts the different states the NED code goes through in the life of a transaction.

<div data-with-frame="true"><figure><img src="../../../images/ned-states.png" alt="" width="563"><figcaption><p>NED Transaction States</p></figcaption></figure></div>

## Statistics <a href="#ncs.development.ned.stats" id="ncs.development.ned.stats"></a>

NED devices have runtime data and statistics. The first part of being able to collect non-configuration data from a NED device is to model the statistics data we wish to gather. In normal YANG files, it is common to have the runtime data nested inside the configuration data. In gathering runtime data for NED devices we have chosen to separate configuration data and runtime data. In the case of the archetypical CLI device, the `show running-config ...` and friends are used to display the running configuration of the device whereas other different `show ...` commands are used to display runtime data, for example `show interfaces`, `show routes`. Different commands for different types of routers/switches and in particular, different tabular output format for different device types.

To expose runtime data from a NED controlled device, regardless of whether it's a CLI NED or a Generic NED, we need to do two things:

* Write YANG models for the aspects of runtime data we wish to expose northbound in NSO.
* Write Java NED code that is responsible for collecting that data.

The NSO NED for the Avaya 4k device contains a data model for some real statistics for the Avaya router and also the accompanying Java NED code. Let's start to take a look at the YANG model for the stats portion, we have:

{% code title="Example: NED Stats YANG Model" %}
```yang
module tailf-ned-avaya-4k-stats {
  namespace 'http://tail-f.com/ned/avaya-4k-stats';
  prefix avaya4k-stats;

  import tailf-common {
    prefix tailf;
  }
  import ietf-inet-types {
    prefix inet;
  }

  import ietf-yang-types {
    prefix yang;
  }

  container stats {
    config false;
    container interface {
      list gigabitEthernet {
        key "num port";
        tailf:cli-key-format "$1/$2";

        leaf num {
          type uint16;
        }

        leaf port {
          type uint16;
        }

        leaf in-packets-per-second {
          type uint64;
        }

        leaf out-packets-per-second {
          type uint64;
        }

        leaf in-octets-per-second {
          type uint64;
        }

        leaf out-octets-per-second {
          type uint64;
        }

        leaf in-octets {
          type uint64;
        }

        leaf out-octets {
          type uint64;
        }

        leaf in-packets {
          type uint64;
        }

        leaf out-packets {
          type uint64;
        }
      }
    }
  }
}
```
{% endcode %}

It's a `config false;` list of counters per interface. We compile the NED stats module with the `--ncs-compile-module` flag or with the `--ncs-compile-bundle` flag. It's the same `non-config` module that contains both runtime data as well as commands and rpcs.

```bash
$ ncsc --ncs-compile-module avaya4k-stats.yang \
    --ncs-device-dir <dir>
```

The `config false;` data from a module that has been compiled with the `--ncs-compile-module` flag will end up mounted under `/devices/device/live-status` tree. Thus running the NED towards a real router we have:

{% code title="Example: Displaying NED Stats in the CLI" %}
```cli
admin@ncs# show devices device r1 live-status interfaces

live-status {
    interface gigabitEthernet1/1 {
        in-packets-per-second   234;
        out-packets-per-second  177;
        in-octets-per-second   4567;
        out-octets-per-second  3561;
        in-octets             12666;
        out-octets            16888;
        in-packets             7892;
        out-packets            2892;
     }
        ............
```
{% endcode %}

It is the responsibility of the NED code to populate the data in the live device tree. Whenever a northbound agent tries to read any data in the live device tree for a NED device, the NED code is invoked.

The NED code implements an interface called, `NedConnection` This interface contains:

```
void showStatsPath(NedWorker w, int th, ConfPath path)
        throws NedException, IOException;
```

This interface method is invoked by NSO in the NED. The Java code must return what is requested, but it may also return more. The Java code always needs to signal errors by invoking `NedWorker.error()` and success by invoking `NedWorker.showStatsPathResponse()`. The latter function indicates what is returned, and also how long it shall be cached inside NSO.

The reason for this design is that it is common for many `show` commands to work on for example an entire interface, or some other item in the managed device. Say that the NSO operator (or MAAPI code) invokes:

```bash
admin@host> show status devices device r1 live-status  \
     interface gigabitEthernet1/1/1 out-octets
out-octets 340;
```

requesting a single leaf, the NED Java code can decide to execute any arbitrary `show` command towards the managed device, parse the output, and populate as much data as it wants. The Java code also decides how long time the NSO shall cache the data.

* When the `showStatsPath()` is invoked, the NED should indicate the state/value of the node indicated by the path (i.e. if a leaf was requested, the NED should write the value of this leaf to the provided transaction handler (th) using MAAPI, or indicate its absence as described below; if a list entry or a presence container was requested then the NED should indicate presence or absence of the element, if the whole list is requested then the NED should populate the keys for this list). Often requesting such data from the actual device will give the NED more data than specifically requested, in which case the worker is free to write other values as well. The NED is not limited to populating the subtree indicated by the path, it may also write values outside this subtree. NSO will then not request those paths but read them directly from the transaction. Different timeouts can be provided for different paths.\
  \
  If a leaf does not have a value or does not exist, the NED can indicate this by returning a TTL for the path to the leaf, without setting the value in the provided transaction. This has changed from earlier versions of NSO. The same applies to optional containers and list entries. If the NED populates the keys for a certain list (both when it is requested to do so or when it decided to do so because it has received this data from the device), it should set the TTL value for the list itself to indicate the time the set of keys should be considered up to date. It may choose to provide different TTL values for some or all list entries, but it is not required to do so.

## Making the NED Handle Default Values Properly <a href="#ncs.development.ned.defaultvalues" id="ncs.development.ned.defaultvalues"></a>

One important task when implementing a NED of any type is to make it mimic the devices handling of default values as close as possible. Network equipment can typically deal with default values in many different ways.

Some devices display default values on leafs even if they have not been explicitly set. Others use trimming, meaning that if a leaf is set to its default value it will be 'unset' and disappear from the devices configuration dump.

It is the responsibility of the NED to make the NSO aware of how the device handles default values. This is done by registering a special NED Capability entry with the NSO. Two modes are currently supported by the NSO: `trim` and `report-all`.

Example 129. A device trimming default values

This is the typical behavior of a Cisco IOS device. The simple YANG code snippet below illustrates the behavior. A container with a boolean leaf. Its default value is true.

```yang
container aaa {
  leaf enabled {
    default true;
    type boolean;
  }
}
```

Try setting the leaf to true in NSO and commit. Then compare the configuration:

```bash
$ ncs_cli -C -u admin
```

```bash
admin@ncs# config
```

```bash
admin@ncs(config)# devices device a0 config aaa enabled true
```

```bash
admin@ncs(config)# commit
```

```bash
Commit complete.
```

```cli
admin@ncs(config)# top devices device a0 compare-config

diff
 devices {
     device a0 {
         config {
             aaa {
-                enabled;
             }
         }
     }
}
```

The result shows that the configurations differ. The reason is that the device does not display the value of the leaf 'enabled'. It has been trimmed since it has its default value. The NSO is now out of sync with the device.

To solve this issue, make the NED tell the NSO that the device is trimming default values. Register an extra NED Capability entry in the Java code.

```
NedCapability capas[] = new NedCapability[2];
capas[0] = new NedCapability(
         "",
         "urn:ios",
         "tailf-ned-cisco-ios",
         Collections.emptyList(),
         "2015-01-01",
         Collections.emptyList());
capas[1] = new NedCapability(
        "urn:ietf:params:netconf:capability:" +
        "with-defaults:1.0?basic-mode=trim",    // Set mode to trim
        "urn:ietf:params:netconf:capability:" +
        "with-defaults:1.0",
        "",
        Collections.emptyList(),
        "",
        Collections.emptyList());
```

Now, try the same operation again:

```bash
$ ncs_cli -C -u admin
```

```cli
admin@ncs# config
```

```cli
admin@ncs(config)# devices device a0 config aaa enabled true
```

```cli
admin@ncs(config)# commit
```

```
Commit complete.
```

```cli
admin@ncs(config)# top devices device a0 compare-config
```

```cli
admin@ncs(config)#
```

The NSO is now in sync with the device.

**Example: A Device Displaying All Default Values**

Some devices display default values for leafs even if they have not been explicitly set. The simple YANG code below will be used to illustrate this behavior. A list containing a key and a leaf with a default value.

```yang
list interface {
  key id;
  leaf id {
    type string;
  }
  leaf treshold {
    default 20;
    type uint8;
  }
}
```

Try creating a new list entry in NSO and commit. Then compare the configuration:

```bash
$ ncs_cli -C -u admin
```

```cli
admin@ncs# config
```

```cli
admin@ncs(config)# devices device a0 config interface myinterface
```

```cli
admin@ncs(config)# commit
```

```cli
admin@ncs(config)# top devices device a0 compare-config

diff
 devices {
     device a0 {
         config {
            interface myinterface {
+              treshold 20;
            }
         }
     }
  }
```

The result shows that the configurations differ. The NSO is out of sync. This is because the device displays the default value of the 'threshold' leaf even if it has not been explicitly set through the NSO.

To solve this issue, make the NED tell the NSO that the device is reporting all default values. Register an extra NED Capability entry in the Java code.

```
NedCapability capas[] = new NedCapability[2];
capas[0] = new NedCapability(
       "",
       "urn:abc",
       "tailf-ned-abc",
       Collections.emptyList(),
       "2015-01-01",
       Collections.emptyList());
capas[1] = new NedCapability(
      "urn:ietf:params:netconf:capability:" +
      "with-defaults:1.0?basic-mode=report-all",  // Set mode to report-all
      "urn:ietf:params:netconf:capability:" +
      "with-defaults:1.0",
      "",
      Collections.emptyList(),
      "",
      Collections.emptyList());
```

Now, try the same operation again:

```bash
$ ncs_cli -C -u admin
```

```cli
admin@ncs# config
```

```
admin@ncs(config)# devices device a0 config interface myinterface
```

```cli
admin@ncs(config)# commit
```

```
Commit complete.
```

```
admin@ncs(config)# top devices device a0 compare-config
```

```cli
admin@ncs(config)#
```

The NSO is now in sync with the device.

## Dry-run Considerations <a href="#d5e10809" id="d5e10809"></a>

The possibility to do a dry-run on a transaction is a feature in NSO that allows to examine the changes to be pushed out to the managed devices in the network. The output can be produced in different formats, namely `cli`, `xml`, and `native`. In order to produce a dry run in the native output format NSO needs to know the exact syntax used by the device, and the task of converting the commands or operations produced by the NSO into the device-specific output belongs the corresponding NED. This is the purpose of the `prepareDry()` callback in the NED interface.

In order to be able to invoke a callback an instance of the NED object needs to be created first. There are two ways to instantiate a NED:

* `newConnection()` callback that tells the NED to establish a connection to the device which can later be used to perform any action such as show configuration, apply changes, or view operational data as well as produce dry-run output.
* Optional `initNoConnect()` callback that tells the NED to create an instance that would not need to communicate with the device, and hence must not establish a connection or otherwise communicate with the device. This instance will only be used to calculate dry-run output. It is possible for a NED to reject the `initNoConnect()` request if it is not able to calculate the dry-run output without establishing a connection to the device, for example, if a NED is capable of managing devices with different flavors of syntax and it is not known at the moment which syntax is used by this particular device.

The following state diagram displays NED states specific to the dry-run scenario.

<figure><img src="../../../images/ned-dry.png" alt="" width="563"><figcaption><p>NED Dry-run States</p></figcaption></figure>

## NED Identification <a href="#ncs.development.ned.identification" id="ncs.development.ned.identification"></a>

Each managed device in NSO has a device type, which informs NSO how to communicate with the device. The device type is one of `netconf`, `snmp`, `cli`, or `generic`. In addition, a special `ned-id` identifier is needed.

NSO uses a technique called YANG Schema Mount, where all the data models from a device are mounted into the `/devices` tree in NSO. Each set of mounted data models is completely separated from the others (they are confined to a "mount jail"). This makes it possible to load different versions of the same YANG module for different devices. The functionality is called Common Data Models (CDM).

In most cases, there are many devices running the same software version in the network managed by NSO, thus using the exact same set of YANG modules. With CDM, all YANG modules for a certain device (or family of devices) are contained in a NED package (or just NED for short). If the YANG modules on the device are updated in a backward-compatible way, the NED is also updated.

However, if the YANG modules on the device are updated in an incompatible way in a new version of the device's software, it might be necessary to create a new NED package for the new set of modules. Without CDM, this would not be possible, since there would be two different packages that contained different versions of the same YANG module.

When a NED is being built, its YANG modules are compiled to be mounted into the NSO YANG model. This is done by device compilation of the device's YANG modules and is performed via the `ncsc` tool provided by NSO.

The ned-id identifier is a YANG identity, which must be derived from one of the pre-defined identities in `$NCS_DIR/src/ned/yang/tailf-ncs-ned.yang`.

A YANG model for devices handled by NED code needs to extend the base identity and provide a new identity that can be configured.

{% code title="Example: Defining a User Identity" %}
```
import tailf-ncs-ned {
    prefix ned;
}

identity cisco-ios {
 base ned:cli-ned-id;
}
```
{% endcode %}

The Java NED code registers the identity it handles with NSO.

Similar to how we import device models for NETCONF-based devices, we use the `ncsc --ncs-compile-bundle` command to import YANG models for NED-handled devices.

Once we have imported such a YANG model into NSO, we can configure the managed device in NSO to be handled by the appropriate NED handler (which is user Java code, more on that later)

{% code title="Example: Setting the Device Type" %}
```cli
admin@ncs# show running config devices device r1

address   127.0.0.1
port      2025
authgroup default
device-type cli ned-id cisco-ios
state admin-state unlocked
...
```
{% endcode %}

When NSO needs to communicate southbound towards a managed device which is not of type NETCONF, it will look for a NED that has registered with the name of the identity, in the case above, the string "ios".

Thus before the NSO attempts to connect to a NED device before it tries to sync, or manipulate the configuration of the device, a user-based Java NED code must have registered with the NSO service manager indicating which Java class is responsible for the NED with the string of the identity, in this case, the string "ios". This happens automatically when the NSO Java VM gets a `instantiate-component` request for an NSO package component of type `ned`.

The component Java class `myNed` needs to implement either of the interfaces `NedGeneric` or `NedCli`. Both interfaces require the NED class to implement the following:

{% code title="Example: NED Identification Callbacks" %}
```
// should return "cli" or "generic"
String type();

// Which YANG modules are covered by the class
String [] modules();

// Which identity is implemented by the class
String identity();
```
{% endcode %}

\
The above three callbacks are used by the NSO Java VM to connect the NED Java class with NSO. They are called at when the NSO Java VM receives the `instantiate-component request`.

The underlying NedMux will start a number of threads, and invoke the registered class with other data callbacks as transactions execute.
