# ncs-netsim Man Page

`ncs-netsim` - Command to create and manipulate a simulated network

## Synopsis

`ncs-netsim create-network NcsPackage NumDevices Prefix [--dir NetsimDir]`

`ncs-netsim create-device NcsPackage DeviceName [--dir NetsimDir]`

`ncs-netsim add-to-network NcsPackage NumDevices Prefix [--dir NetsimDir]`

`ncs-netsim add-device NcsPackage DeviceName [--dir NetsimDir]`

`ncs-netsim delete-network [--dir NetsimDir]`

`ncs-netsim start | stop | is-alive | reset | restart | status [Devicename] [--dir NetsimDir] [--async | -a ]`

`ncs-netsim netconf-console Devicename [XPathFilter] [--dir NetsimDir]`

`ncs-netsim -w | --window cli | cli-c | cli-i Devicename [--dir NetsimDir]`

`ncs-netsim get-port Devicename [ipc | netconf | cli | snmp] [--dir NetsimDir]`

`ncs-netsim ncs-xml-init [DeviceName] [--dir NetsimDir]`

`ncs-netsim ncs-xml-init-remote RemoteNodeName [DeviceName] [--dir NetsimDir]`

`ncs-netsim list | packages | whichdir [--dir NetsimDir]`

## Description

`ncs-netsim` is a script to create, control and manipulate simulated
networks of managed devices. It is a tool targeted at NCS application
developers. Each network element is simulated by ConfD, a Tail-f tool
that acts as a NETCONF server, a Cisco CLI engine, or an SNMP agent.

## Options

### Commands

`create-network` \<NcsPackage\> \<NumDevices\> \<Prefix\>  
> Is used to create a new simulation network. The simulation network is
> written into a directory. This directory contains references to NCS
> packages that are used to emulate the network. These references are in
> the form of relative filenames, thus the simulation network can be
> moved as long as the packages that are used in the network are also
> moved.
>
> This command can be given multiple times in one invocation of
> `ncs-netsim`. The mandatory parameters are:
>
> 1.  `NcsPackage` is a either directory where an NCS NED package (that
>     supports netsim) resides. Alternatively, just the name of one of
>     the packages in `$NCS_DIR/packages/neds` can be used.
>     Alternatively the `NcsPackage` is tar.gz package.
>
> 2.  `NumDevices` indicates how many devices we wish to have of the
>     type that is defined by the NED package.
>
> 3.  `Prefix` is a string that will be used as prefix for the name of
>     the devices

`create-device` \<NcsPackage\> \<DeviceName\>  
> Just like create-network, but creates only one device with the
> specific name (no suffix at the end)

`add-to-network` \<NcsPackage\> \<NumDevices\> \<Prefix\>  
> Is used to add additional devices to a previously existing simulation
> network. This command can be given multiple times. The mandatory
> parameters are the same as for `create-network`.
>
> <div class="note">
>
> If we have already started NCS with an XML initialization file for the
> existing network, an updated initialization file will not take effect
> unless we remove the CDB database files, loosing all NCS
> configuration. But we can replace the original initialization data
> with data for the complete new network when we have run
> `add-to-network`, by using `ncs_load` while NCS is running, e.g. like
> this:
>
> </div>
>
> <div class="informalexample">
>
>     $ ncs-netsim ncs-xml-init > devices.xml
>     $ ncs_load -l -m devices.xml
>                   
>
> </div>

`add-device` \<NcsPackage\> \<DeviceName\>  
> Just like add-to-network, but creates only one device with the
> specific name (no suffix at the end)

`delete-network`  
> Completely removes an existing simulation network. The devices are
> stopped, and the network directory is removed along with all files and
> directories inside it.
>
> This command does not do any search for the network directory, but
> only uses `./netsim` unless the `--dir NetsimDir` option is given. If
> the directory does not exist, the command does nothing, and does not
> return an error. Thus we can use it in e.g. scripts or Makefiles to
> make sure we have a clean starting point for a subsequent
> `create-network` command.

`start` \<\[DeviceName\]\>  
> Is used to start the entire network, or optionally the individual
> device called `DeviceName`

`stop` \<\[DeviceName\]\>  
> Is used to stop the entire network, or optionally the individual
> device called `DeviceName`

`is-alive` \<\[DeviceName\]\>  
> Is used to query the 'liveness' of the entire network, or optionally
> the individual device called `DeviceName`

`status` \<\[DeviceName\]\>  
> Is used to check the status of the entire network, or optionally the
> individual device called `DeviceName`.

`reset` \<\[DeviceName\]\>  
> Is used to reset the entire network back into the state it was before
> it was started for the first time. This means that the devices are
> stopped, and all cdb files, log files and state files are removed. The
> command can also be performed on an individual device `DeviceName`.

`restart` \<\[DeviceName\]\>  
> This is the equivalent of 'stop', 'reset', 'start'

`-w | -window`; `cli | cli-c | cli-i` \<DeviceName\>  
> Invokes the ConfD CLI on the device called `DeviceName`. The flavor of
> the CLI will be either of Juniper (default) Cisco IOS (cli-i) or Cisco
> XR (cli-c). The -w option creates a new window for the CLI

`whichdir`  
> When we create the netsim environment with the `create-network`
> command, the data will by default be written into the `./netsim`
> directory unless the `--dir NetsimDir` is given.
>
> All the control commands to stop, start, etc., the network need access
> to the netsim directory where the netsim data resides. Unless the
> `--dir NetsimDir` option is given we will search for the netsim
> directory in \$PWD, and if not found there go upwards in the directory
> hierarchy until we find a netsim directory.
>
> This command prints the result of that netsim directory search.

`list`  
> The netsim directory that got created by the `create-network` command
> contains a static file (by default `./netsim/.netsiminfo`) - this
> command prints the file content formatted. This command thus works
> without the network running.

`netconf-console` \<DeviceName\> \<\[XpathFilter\]\>  
> Invokes the `netconf-console` NETCONF client program towards the
> device called `DeviceName`. This is an easy way to get the
> configuration from a simulated device in XML format.

`get-port` \<DeviceName\> `[ipc | netconf | cli | snmp]`  
> Prints the port number that the device called `DeviceName` is
> listening on for the given protocol - by default, the ipc port is
> printed.

`ncs-xml-init` \<\[DeviceName\]\>  
> Usually the purpose of running `ncs-netsim` is that we wish to
> experiment with running NCS towards that network. This command
> produces the XML data that can be used as initialization data for NCS
> and the network defined by this ncs-netsim installation.

`ncs-xml-init-remote` \<RemoteNodeName\> \<\[DeviceName\]\>  
> Just like ncs-xml-init, but creates initialization data for service
> NCS node in a device cluster. The RemoteNodeName parameter specifies
> the device NCS node in cluster that has the corresponding device(s)
> configured in its /devices/device tree.

`packages`  
> List the NCS NED packages that were used to produce this ncs-netsim
> network.

### Common options

`--dir` \<NetsimDir\>  
> When we create a network, by default it's created in `./netsim`. When
> we invoke the control commands, the netsim directory is searched for
> in the current directory and then upwards. The `--dir` option
> overrides this and creates/searches and instead uses `NetsimDir` for
> the netsim directory.

`--async | -a`  
> The start, stop, restart and reset commands can use this additional
> flag that runs everything in the background. This typically reduces
> the time to start or stop a netsim network.

## Examples

To create a simulation network we need at least one NCS NED package that
supports netsim. An NCS NED package supports netsim if it has a `netsim`
directory at the top of the package. The NCS distribution contains a
number of packages in \$NCS_DIR/packages/neds. So given those NED
packages, we can create a simulation network that use ConfD, together
with the YANG modules for the device to emulate the device.

<div class="informalexample">

    $ ncs-netsim create-network $NCS_DIR/packages/neds/c7200 3 c \
                 create-network $NCS_DIR/packages/neds/nexus 3 n
        

</div>

The above command creates a test network with 6 routers in it. The data
as well the execution environment for the individual ConfD devices
reside in (by default) directory ./netsim. At this point we can
start/stop/control the network as well as the individual devices with
the ncs-netsim control commands.

<div class="informalexample">

    $ ncs-netsim -a start
    DEVICE c0 OK STARTED
    DEVICE c1 OK STARTED
    DEVICE c2 OK STARTED
    DEVICE n0 OK STARTED
    DEVICE n1 OK STARTED
    DEVICE n2 OK STARTED
        

</div>

Starts the entire network.

<div class="informalexample">

    $ ncs-netsim stop c0
        

</div>

Stops the simulated router named *c0*.

<div class="informalexample">

    $ ncs-netsim cli n1
        

</div>

Starts a Juniper CLI towards the device called *n1*.

## Environment Variables

- *NETSIM_DIR* if set, the value will be used instead of the
  `--dir Netsimdir` option to search for the netsim directory containing
  the environment for the emulated network

  Thus, if we always use the same netsim directory in a development
  project, it may make sense to set this environment variable, making
  the netsim environment available regardless of where we are in the
  directory structure.

- *IPC_PORT* if set, the ConfD instances will use the indicated number
  and upwards for the local IPC port. Default is 5010. Use this if your
  host occupies some of the ports from 5010 and upwards.

- *NETCONF_SSH_PORT* if set, the ConfD instances will use the indicated
  number and upwards for the NETCONF ssh (if configured in confd.conf)
  Default is 12022. Use this if your host occupies some of the ports
  from 12022 and upwards.

- *NETCONF_TCP_PORT* if set, the ConfD instances will use the indicated
  number and upwards for the NETCONF tcp (if configured in confd.conf)
  Default is 13022. Use this if your host occupies some of the ports
  from 13022 and upwards.

- *SNMP_PORT* if set, the ConfD instances will use the indicated number
  and upwards for the SNMP udp traffic. (if configured in confd.conf)
  Default is 11022. Use this if your host occupies some of the ports
  from 11022 and upwards.

- *CLI_SSH_PORT* if set, the ConfD instances will use the indicated
  number and upwards for the CLI ssh traffic. (if configured in
  confd.conf) Default is 10022. Use this if your host occupies some of
  the ports from 10022 and upwards.

The `ncs-setup` tool will use these numbers as well when it generates
the init XML for the network in the `ncs-netsim` network.
