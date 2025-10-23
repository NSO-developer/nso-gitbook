---
description: Create generic NEDs.
---

# Generic NED Development

As described in previous sections, the CLI NEDs are almost programming-free. The NSO CLI engine takes care of parsing the stream of characters that come from "show running-config \[toptag]" and also automatically produces the sequence of CLI commands required to take the system from one state to another.

A generic NED is required when we want to manage a device that neither speaks NETCONF or SNMP nor can be modeled so that ConfD - loaded with those models - gets a CLI that looks almost/exactly like the CLI of the managed device. For example, devices that have other proprietary CLIs, devices that can only be configured over other protocols such as REST, Corba, XML-RPC, SOAP, other proprietary XML solutions, etc.

In a manner similar to the CLI NED, the Generic NED needs to be able to connect to the device, return the capabilities, perform changes to the device, and finally, grab the entire configuration of the device.

The interface that a Generic NED has to implement is very similar to the interface of a CLI NED. The main differences are:

* When NSO has calculated a diff for a specific managed device, it will for CLI NEDS also calculate the exact set of CLI commands to send to the device, according to the YANG models loaded for the device. In the case of a generic NED, NSO will instead send an array of operations to perform towards the device in the form of DOM manipulations. The generic NED class will receive an array of `NedEditOp` objects. Each `NedEditOp` object contains:
  * The operation to perform, i.e. CREATED, DELETED, VALUE\_SET, etc.
  * The keypath to the object in case.
  * An optional value
* When NSO wants to sync the configuration from the device to NSO, the CLI NED only has to issue a series of `show running-config [toptag]` commands and reply with the output received from the device. A generic NED has to do more work. It is given a transaction handler, which it must attach to over the Maapi interface. Then the NED code must - by some means - retrieve the entire configuration and write into the supplied transaction, again using the Maapi interface.

Once the generic NED is implemented, all other functions in NSO work precisely in the same manner as with NETCONF and CLI NED devices. NSO still has the capability to run network-wide transactions. The caveat is that to abort a transaction towards a device that doesn't support transactions, we calculate the reverse diff and send it to the device, i.e. we automatically calculate the undo operations.

Another complication with generic NEDs is how the NED class shall authenticate towards the managed device. This depends entirely on the protocol between the NED class and the managed device. If SSH is used to a proprietary CLI, the existing authgroup structure in NSO can be used as is. However, if some other authentication data is needed, it is up to the generic NED implementer to augment the authgroups in `tailf-ncs.yang` accordingly.

We must also configure a managed device, indicating that its configuration is handled by a specific generic NED. Below we see that the NED with identity `xmlrpc` is handling this device.

```cli
admin@ncs# show running-config devices device x1

address   127.0.0.1
port      12023
authgroup default
device-type generic ned-id xmlrpc
state admin-state unlocked
...
```

The [examples.ncs/device-management/](https://github.com/NSO-developer/nso-examples/tree/6.6/device-management/xmlrpc-device)[generic-xmlrpc-ned](https://github.com/NSO-developer/nso-examples/tree/6.6/device-management/generic-xmlrpc-ned)  example in the NSO examples collection implements a generic NED that speaks XML-RPC to 3 HTTP servers. The HTTP servers run the Apache XML-RPC server code and the NED code manipulates the 3 HTTP servers using a number of predefined XML RPC calls.

A good starting point when we wish to implement a new generic NED is the `ncs-make-package --generic-ned-skeleton ...` command, which is used to generate a skeleton package for a generic NED.

```bash
$ ncs-make-package --generic-ned-skeleton abc --build
```

```bash
$ ncs-setup --ned-package abc --dest ncs
```

```bash
$ cd ncs
```

```bash
$ ncs -c ncs.conf
```

```bash
$ ncs_cli -C -u admin
```

```cli
admin@ncs# show packages package abc
packages package abc
package-version 1.0
description     "Skeleton for a generic NED"
ncs-min-version [ 3.3 ]
component MyDevice
 callback java-class-name [ com.example.abc.abcNed ]
 ned generic ned-id abc
 ned device vendor "Acme abc"
 ...
 oper-status up
```

## Getting Started with a Generic NED <a href="#ug.ned.generic.gettingstarted" id="ug.ned.generic.gettingstarted"></a>

A generic NED always requires more work than a CLI NED. The generic NED needs to know how to map arrays of `NedEditOp` objects into the equivalent reconfiguration operations on the device. Depending on the protocol and configuration capabilities of the device, this may be arbitrarily difficult.

Regardless of the device, we must always write a YANG model that describes the device. The array of `NedEditOp` objects that the generic NED code gets exposed to is relative the YANG model that we have written for the device. Again, this model doesn't necessarily have to cover all aspects of the device.

Often a useful technique with generic NEDs can be to write a pyang plugin to generate code for the generic NED. Again, depending on the device it may be possible to generate Java code from a pyang plugin that covers most or all aspects of mapping an array of `NedEditOp` objects into the equivalent reconfiguration commands for the device.

Pyang is an extensible and open-source YANG parser (written by Tail-f) available at `http://www.yang-central.org`. pyang is also part of the NSO release. A number of plugins are shipped in the NSO release, for example `$NCS_DIR/lib/pyang/pyang/plugins/tree.py` is a good plugin to start with if we wish to write our own plugin.

The [examples.ncs/device-management/](https://github.com/NSO-developer/nso-examples/tree/6.6/device-management/xmlrpc-device)[generic-xmlrpc-ned](https://github.com/NSO-developer/nso-examples/tree/6.6/device-management/generic-xmlrpc-ned)  example is a good example to start with if we wish to write a generic NED. It manages a set of devices over the XML-RPC protocol. In this example, we have:

* Defined a fictitious YANG model for the device.
* Implemented an XML-RPC server exporting a set of RPCs to manipulate that fictitious data model. The XML-RPC server runs the Apache `org.apache.xmlrpc.server.XmlRpcServer` Java package.
* Implemented a Generic NED which acts as an XML-RPC client speaking HTTP to the XML-RPC servers.

The example is self-contained, and we can, using the NED code, manipulate these XML-RPC servers in a manner similar to all other managed devices.

```bash
$ cd $NCS_DIR/device-management/xmlrpc-device
```

```bash
$ make all start
```

```bash
$ ncs_cli -C -u admin
```

```cli
admin@ncs# devices sync-from
sync-result {
    device r1
    result true
}
sync-result {
    device r2
    result true
}
sync-result {
    device r3
    result true
}
```

```cli
admin@ncs# show running-config devices r1 config

ios:interface eth0
  macaddr      84:2b:2b:9e:af:0a
  ipv4-address 192.168.1.129
  ipv4-mask    255.255.255.0
  status       Up
  mtu          1500
  alias 0
    ipv4-address 192.168.1.130
    ipv4-mask    255.255.255.0
    !
  alias 1
    ipv4-address 192.168.1.131
    ipv4-mask    255.255.255.0
    !
speed        100
txqueuelen   1000
!
```

### Tweaking the Order of `NedEditOp` Objects <a href="#ug.gen.ned.diff" id="ug.gen.ned.diff"></a>

As it was mentioned earlier the `NedEditOp` objects are relative to the YANG model of the device, and they are to be translated into the equivalent reconfiguration operations on the device. Applying reconfiguration operations may only be valid in a certain order.

For Generic NEDs, NSO provides a feature to ensure dependency rules are being obeyed when generating a diff to commit. It controls the order of operations delivered in the `NedEditOp` array. The feature is activated by adding the following option to `package-meta-data.xml`:

```xml
<option>
  <name>ordered-diff</name>
</option>
```

When the `ordered-diff` flag is set, the `NedEditOp` objects follow YANG schema order and consider dependencies between leaf nodes. Dependencies can be defined using leafrefs and the _`tailf:cli-diff-after`_, _`tailf:cli-diff-create-after`_, _`tailf:cli-diff-modify-after`_, _`tailf:cli-diff-set-after`_, _`tailf:cli-diff-delete-after`_ YANG extensions. Read more about the above YANG extensions in the Tail-f CLI YANG extensions man page.

## NED Commands <a href="#ug.ned.commands" id="ug.ned.commands"></a>

A device we wish to manage using a NED usually has not just configuration data that we wish to manipulate from NSO, but the device usually has a set of commands that do not relate to configuration.

The commands on the device we wish to be able to invoke from NSO must be modeled as actions. We model this as actions and compile it using a special `ncsc` command to compile NED data models that do not directly relate to configuration data on the device.

The [examples.ncs/device-management/](https://github.com/NSO-developer/nso-examples/tree/6.6/device-management/xmlrpc-device)[generic-xmlrpc-ned](https://github.com/NSO-developer/nso-examples/tree/6.6/device-management/generic-xmlrpc-ned)  example managed device, a fictitious XML-RPC device, contains a YANG snippet:

```yang
container commands {
  tailf:action idle-timeout {
    tailf:actionpoint ncsinternal {
      tailf:internal;
    }
    input {
      leaf time {
        type int32;
      }
    }
    output {
      leaf result {
        type string;
      }
    }
  }
}
```

When that action YANG is imported into NSO it ends up under the managed device. We can invoke the action _on_ the device as :

```cli
admin@ncs# devices device r1 config ios:commands idle-timeout time 55
```

```
result OK
```

The NED code is obviously involved here. All NEDs must always implement:

```
void command(NedWorker w, String cmdName, ConfXMLParam[] params)
    throws NedException, IOException;
```

The `command()` method gets invoked in the NED, the code must then execute the command. The input parameters in the `params` parameter correspond to the data provided in the action. The `command()` method must reply with another array of `ConfXMLParam` objects.

```java
public void command(NedWorker worker, String cmdname, ConfXMLParam[] p)
    throws NedException, IOException {
    session.setTracer(worker);
    if (cmdname.compareTo("idle-timeout") == 0) {
            worker.commandResponse(new ConfXMLParam[]{
               new ConfXMLParamValue(new interfaces(),
                                     "result",
                                      new ConfBuf("OK"))
        });
 }
```

The above code is fake, on a real device, the job of the `command()` method is to establish a connection to the device, invoke the command, parse the output, and finally reply with an `ConfXMLParam` array.

The purpose of implementing NED commands is usually that we want to expose device commands to the programmatic APIs in the NSO DOM tree.
