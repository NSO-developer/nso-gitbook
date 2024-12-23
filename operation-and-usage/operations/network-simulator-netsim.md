---
description: Use NSO's network simulator to simulate your network and test functionality.
---

# Network Simulator

The `ncs-netsim` program is a useful tool to simulate a network of devices to be managed by NSO. It makes it easy to test NSO packages towards simulated devices. All you need is the NSO NED packages for the devices that you need to simulate. The devices are simulated with the Tail-f ConfD product.

All the NSO examples use `ncs-netsim` to simulate the devices. A good way to learn how to use `ncs-netsim` is to study them.

## Using Netsim <a href="#ug.netsim.using" id="ug.netsim.using"></a>

The `ncs-netsim` tool takes any number of NED packages as input. The user can specify the number of device instances per package (device type) and a string that is used as a prefix for the name of the devices. The command takes the following parameters:

```
admin$ ncs-netsim --help
Usage ncs-netsim  [--dir <NetsimDir>]
            create-network <NcsPackage> <NumDevices> <Prefix> |
            create-device <NcsPackage> <DeviceName> |
            add-to-network <NcsPackage> <NumDevices> <Prefix> |
            add-device <NcsPackage> <DeviceName> |
            delete-network                     |
            [-a | --async]  start [devname]    |
            [-a | --async ] stop [devname]     |
            [-a | --async ] reset [devname]    |
            [-a | --async ] restart [devname]  |
            list                      |
            is-alive [devname]        |
            status [devname]          |
            whichdir                  |
            ncs-xml-init [devname]    |
            ncs-xml-init-remote <RemoteNodeName> [devname] |
            [--force-generic]         |
            packages                  |
            netconf-console devname [XpathFilter] |
            [-w | --window] [cli | cli-c | cli-i] devname
```

Assume that you have prepared an NSO package for a device called `router`. (See the [examples.ncs/device-management/router-network](https://github.com/NSO-developer/nso-examples/tree/6.4/device-management/router-network) example). Also, assume the package is in `./packages/router`. At this point, you can create the simulated network by:

```bash
$ ncs-netsim create-network ./packages/router 3 device --dir ./netsim
```

This creates three devices; `device0`, `device1`, and `device2`. The simulated network is stored in the `./netsim` directory. The output structure is:

```
          ./netsim/device/
               device0/<ConfD files>, <log files>
               device1/
               ....
```

There is one separate directory for every ConfD simulating the devices.

The network can be started with:

```bash
$ ncs-netsim start
```

You can add more devices to the network in a similar way as it was created. E.g. if you created a network with some Juniper devices and want to add some Cisco IOS devices. Point to the NED you want to use (See `{NCS_DIR}/packages/neds/`) and run the command. Remember to start the new devices after they have been added to the network.

```bash
$ ncs-netsim add-to-network ${NCS_DIR}/packages/neds/cisco-ios 2 c-device --dir ./netsim
```

To extract the device data from the simulated network to a file in XML format:

```bash
$ ncs-netsim ncs-xml-init > devices.xml
```

This data is usually used to load the simulated network into NSO. Putting the XML file in the `./ncs-cdb` folder will load it when NSO starts. If NSO is already started it can be reloaded while running.

```bash
$ ncs_load -l -m devices.xml
```

The generated device data creates devices of the same type as the device being simulated. This is true for NETCONF, CLI, and SNMP devices. When simulating generic devices, the simulated device will run as a netconf device.

Under very special circumstances, one can choose to force running the simulation as a generic device with the option `--force-generic`.

The simulated network device info can be shown with:

```bash
 $ ncs-netsim list
...
 name=device0 netconf=12022 snmp=11022 ipc=5010 cli=10022 dir=examples.ncs/device-management/router-network/netsim/device/device0
...
```

Here you can see the device name, the working directory, and the port number for different services to be accessed on the simulated device (NETCONF SSH, SNMP, IPC, and direct access to the CLI).

You can reach the CLI of individual devices with:

```bash
$ ncs-netsim cli-c device0
```

The simulated devices actually provide three different styles of CLI:

* `cli`: J-Style
* `cli-c`: Cisco XR Style
* `cli-i`: Cisco IOS Style

Individual devices can be started and stopped with:

```bash
$ ncs-netsim start device0
$ ncs-netsim stop device0
```

You can check the status of the simulated network. Either a short version just to see if the device is running or a more verbose with all the information.

```bash
$ ncs-netsim is-alive device0
$ ncs-netsim status device0
```

View which packages are used in the simulated network:

```bash
$ ncs-netsim packages
```

It is also possible to reset the network back to the state of initialization:

```bash
$ ncs-netsim reset
```

When you are done, remove the network:

```bash
$ ncs-netsim delete-network
```

### Using ConfD Tools with Netsim <a href="#ug.netsim.using_confd_tools" id="ug.netsim.using_confd_tools"></a>

The netsim tool includes a standard ConfD distribution and the ConfD C API library (libconfd) that the ConfD tools use. The library is built with default settings where the values for MAXDEPTH and MAXKEYLEN are 20 and 9, respectively. These values define the size of `confd_hkeypath_t` struct and this size is related to the size of data models in terms of depth and key lengths. Default values should be big enough even for very large and complex data models. But in some rare cases, one or both of these values might not be large enough for a given data model.

One might observe a limitation when the data models that are used by simulated devices exceed these limits. Then it would not be possible to use the ConfD tools that are provided with the netsim. To overcome this limitation, it is advised to use the corresponding NSO tools to perform desired tasks on devices.

NSO and ConfD tools and Python APIs are basically the same except for naming, the default IPC port and the MAXDEPTH and MAXKEYLEN values, where for NSO tools, the values are set to 60 and 18, respectively. Thus, the advised solution is to use the NSO tools and NSO Python API with netsim.

E.g. Instead of using the below command:

```bash
$ CONFD_IPC_PORT=5010 ${NCS_DIR}/netsim/confd/bin/confd_load -m -l *.xml
```

One may use:

```bash
$ NCS_IPC_PORT=5010 ncs_load -m -l *.xml
```

### Learn More <a href="#ug.netsim.learnmore" id="ug.netsim.learnmore"></a>

The README file in [examples.ncs/device-management/router-network](https://github.com/NSO-developer/nso-examples/tree/6.4/device-management/router-network) example gives a good introduction on how to use `ncs-netsim`.
