---
description: Automate non-configuration tasks with NSO.
---

# Actions

The most common way to implement non-configuration automation in NSO is using actions. An action represents a task or an operation that a user of the system can invoke on demand, such as downloading a file, resetting a device, or performing a test.

Like configuration elements, actions must also be defined in the YANG model. Each action is described by the `action` YANG statement that specifies what are its inputs and outputs, if any. Inputs allow a user of the action to provide additional information to the action invocation, while outputs provide information to the caller. Actions are a form of a Remote Procedure Call (RPC) and have historically evolved from NETCONF RPCs. It's therefore unsurprising that with NSO you implement both in a similar manner.

Let's look at an example action definition:

```
action my-test {
  tailf:actionpoint my-test-action;
  input {
    leaf test-string {
      type string;
    }
  }
  output {
    leaf has-nso {
      type boolean;
    }
  }
}
```

The first thing to notice in the code is that, just like services use a service point, actions use an `actionpoint`. It is denoted by the `tailf:actionpoint` statement and tells NSO to execute a callback registered to this name. The callback mechanism allows you to provide custom action implementation.

Correspondingly, your code needs to register a callback to this action point, by calling the `register_action()`, as demonstrated here:

```python
def setup(self):
    self.register_action('my-test-action', MyTestAction)
```

The `MyTestAction` class, referenced in the call, is responsible for implementing the actual action logic and should inherit from the `ncs.dp.Action` base class. The base class will take care of calling the `cb_action()` class method when users initiate the action. The `cb_action()` is where you put your own code. The following code shows a trivial implementation of an action, that checks whether its input contains the string “`NSO`”:

```python
class MyTestAction(Action):
    @Action.action
    def cb_action(self, uinfo, name, kp, input, output, trans):
        self.log.info('Action invoked: ', name)
        output.has_nso = 'NSO' in input.test_string
```

The `input` and `output` arguments contain input and output data, respectively, which matches the definition in the action YANG model. The example shows the value of a simple Python `in` string check that is assigned to an output value.

The `name` argument has the name of the called action (such as `my-test`), to help you distinguish which action was called in the case where you would register the same class for multiple actions. Similarly, an action may be defined on a list item and the `kp` argument contains the full keypath (a tuple) to an instance where it was called.

Finally, the `uinfo` contains information on the user invoking the action and the `trans` argument represents a transaction, that you can use to access data other than input. This transaction is read-only, as configuration changes should normally be done through services instead. Still, the action may need some data from NSO, such as an IP address of a device, which you can access by using `trans` with the `ncs.maagic.get_root()` function and navigate to the relevant information.

{% hint style="info" %}
If, for any reason, your action requires a new, read-write transaction, please also read through [NSO Concurrency Model](../core-concepts/nso-concurrency-model.md) to learn about the possible pitfalls.
{% endhint %}

Further details and the format of the arguments can be found in the NSO Python API reference.

The last thing to note in the above action code definition is the use of the decorator `@Action.action`. Its purpose is to set up the function arguments correctly, so variables such as `input` and `output` behave like other Python Maagic objects. This is no different from services, where decorators are required for the same reason.

## Showcase - Implementing Device Count Action <a href="#d5e1000" id="d5e1000"></a>

{% hint style="info" %}
See [examples.ncs/getting-started/applications-nso](https://github.com/NSO-developer/nso-examples/tree/6.6/getting-started/applications-nso) for an example implementation.
{% endhint %}

### Prerequisites

* No previous NSO or netsim processes are running. Use the `ncs --stop` and `ncs-netsim stop` commands to stop them if necessary.
* NSO local install with a fresh runtime directory has been created by the `ncs-setup --dest ~/nso-lab-rundir` or similar command.
* The environment variable `NSO_RUNDIR` points to this runtime directory, such as set by the `export NSO_RUNDIR=~/nso-lab-rundir` command. It enables the below commands to work as-is, without additional substitution needed.

### Step 1 - Create a New Python Package <a href="#d5e1015" id="d5e1015"></a>

One of the most common uses of NSO actions is automating network and service tests but they are also a good choice for any other non-configuration task. Being able to quickly answer questions, such as how many network ports are available (unused) or how many devices currently reside in a given subnet, can greatly simplify the network planning process. Coding these computations as actions in NSO makes them accessible on-demand to a wider audience.

For this scenario, you will create a new package for the action, however actions can also be placed into existing packages. A common example is adding a self-test action to a service package.

First, navigate to the `packages` subdirectory:

```bash
$ cd $NSO_RUNDIR/packages
```

Create a package skeleton with the `ncs-make-package` command and the `--action-example` option. Name the package `count-devices`, like so:

```bash
$ ncs-make-package --service-skeleton python --action-example count-devices
```

This command creates a YANG module file, where you will place a custom action definition. In a text or code editor open the `count-devices.yang` file, located inside `count-devices/src/yang/`. This file already contains an example action which you will remove. Find the following line (after module imports):

```
  description
```

Delete this line and all the lines following it, to the very end of the file. The file should now resemble the following:

```yang
module count-devices {

  namespace "http://example.com/count-devices";
  prefix count-devices;

  import ietf-inet-types {
    prefix inet;
  }
  import tailf-common {
    prefix tailf;
  }
  import tailf-ncs {
    prefix ncs;
  }
```

### Step 2 - Define a New Action in YANG <a href="#d5e1035" id="d5e1035"></a>

To model an action, you can use the `action` YANG statement. It is part of the YANG standard from version 1.1 onward, requiring you to also define `yang-version 1.1` in the YANG model. So, add the following line at the start of the module, right before `namespace` statement:

```
  yang-version 1.1;
```

Note that in YANG version 1.0, actions used the NSO-specific `tailf:action` extension, which you may still find in some YANG models.

Now, go to the end of the file and add a `custom-actions` container with the `count-devices` action, using the `count-devices-action` action point. The input is an IP subnet and the output is the number of devices managed by NSO in this subnet.

```yang
  container custom-actions {
    action count-devices {
      tailf:actionpoint count-devices-action;
      input {
        leaf in-subnet {
          type inet:ipv4-prefix;
        }
      }
      output {
        leaf result {
          type uint16;
        }
      }
    }
  }
```

Also, add the closing bracket for the module at the end:

```
}
```

Remember to finally save the file, which should now be similar to the following:

```yang
module count-devices {

  yang-version 1.1;
  namespace "http://example.com/count-devices";
  prefix count-devices;

  import ietf-inet-types {
    prefix inet;
  }
  import tailf-common {
    prefix tailf;
  }
  import tailf-ncs {
    prefix ncs;
  }

  container custom-actions {
    action count-devices {
      tailf:actionpoint count-devices-action;
      input {
        leaf in-subnet {
          type inet:ipv4-prefix;
        }
      }
      output {
        leaf result {
          type uint16;
        }
      }
    }
  }
}
```

### Step 3 - Implement the Action Logic <a href="#d5e1053" id="d5e1053"></a>

The action code is implemented in a dedicated class, that you will put in a separate file. Using an editor, create a new, empty file `count_devices_action.py` in the `count-devices/python/count_devices/` subdirectory.

At the start of the file, import the packages that you will need later on and define the action class with the `cb_action()` method:

```python
from ipaddress import IPv4Address, IPv4Network
import socket
import ncs
from ncs.dp import Action

class CountDevicesAction(Action):
    @Action.action
    def cb_action(self, uinfo, name, kp, input, output, trans):
```

Then initialize the `count` variable to `0` and construct a reference to the NSO data root, since it is not part of the method arguments:

```
        count = 0
        root = ncs.maagic.get_root(trans)
```

Using the `root` variable, you can iterate through the devices managed by NSO and find their (IPv4) address:

```
        for device in root.devices.device:
            address = socket.gethostbyname(device.address)
```

If the IP address comes from the specified subnet, increment the count:

```
            if IPv4Address(address) in IPv4Network(input.in_subnet):
                count = count + 1
```

Lastly, assign the count to the result:

```
        output.result = count
```

### Step 4 - Register Callback <a href="#d5e1071" id="d5e1071"></a>

Your custom Python code is ready; however, you still need to link it to the `count-devices` action. Open the `main.py` from the same directory in a text or code editor and delete all the content already in there.

Next, create a class called `Main` that inherits from the `ncs.application.Application` base class. Add a single class method `setup()` that takes no additional arguments.

```python
import ncs

class Main(ncs.application.Application):
    def setup(self):
```

Inside the `setup()` method call the `register_action()` as follows:

```python
        self.register_action('count-devices-action', CountDevicesAction)
```

This line instructs NSO to use the `CountDevicesAction` class to handle invocations of the `count-devices-action` action point. Also, import the `CountDevicesAction` class from the `count_devices_action` module.

The complete `main.py` file should then be similar to the following:

```python
import ncs
from count_devices_action import CountDevicesAction

class Main(ncs.application.Application):
    def setup(self):
        self.register_action('count-devices-action', CountDevicesAction)
```

### Step 5 - And... Action! <a href="#d5e1093" id="d5e1093"></a>

With all of the code ready, you are one step away from testing the new action, but to do that, you will need to add some devices to NSO. So, first, add a couple of simulated routers to the NSO instance:

```bash
$ cd $NCS_DIR/examples.ncs/device-management/router-network
```

```bash
$ make all
$ cp ncs-cdb/ncs_init.xml $NSO_RUNDIR/ncs-cdb/
```

```bash
$ cp -a packages/router $NSO_RUNDIR/packages/
```

Before the packages can be loaded, you must compile them:

```bash
$ cd $NSO_RUNDIR
```

```bash
$ make -C packages/router/src && make -C packages/count-devices/src
make: Entering directory 'packages/router/src'
< ... output omitted ... >
make: Leaving directory 'packages/router/src'
make: Entering directory 'packages/count-devices/src'
mkdir -p ../load-dir
mkdir -p java/src//
bin/ncsc  `ls count-devices-ann.yang  > /dev/null 2>&1 && echo "-a count-devices-ann.yang"` \
              -c -o ../load-dir/count-devices.fxs yang/count-devices.yang
make: Leaving directory 'packages/count-devices/src'
```

You can start the NSO now and connect to the CLI:

```bash
$ ncs --with-package-reload && ncs_cli -C -u admin
```

Finally, invoke the action:

```bash
$ admin@ncs# custom-actions count-devices in-subnet 127.0.0.0/16
result 3
```

You can use the `show devices list` command to verify that the result is correct. You can alter the address of any device and see how it affects the result. You can even use a hostname, such as `localhost`.

{% hint style="info" %}
Other examples of action implementations can be found under [examples.ncs/sdk-api](https://github.com/NSO-developer/nso-examples/tree/6.6/sdk-api).
{% endhint %}
