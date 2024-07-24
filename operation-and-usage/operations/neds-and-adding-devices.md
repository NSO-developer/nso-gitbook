---
description: Learn about NEDs, their types, and how to work with them.
---

# NEDs and Adding Devices

Network Element Drivers, NEDs, provides the connectivity between NSO and the devices. NEDs are installed as NSO packages. For information on how to add a package for a new device type, see NSO [Package Management](../../administration/management/nso-packages.md).

To see the list of installed packages (you will not see the F5 BigIP):

```cli
admin@ncs# show packages
packages package cisco-ios
 package-version 3.0
 description     "NED package for Cisco IOS"
 ncs-min-version [ 3.0.2 ]
 directory       ./state/packages-in-use/1/cisco-ios
 component upgrade-ned-id
  upgrade java-class-name com.tailf.packages.ned.ios.UpgradeNedId
 component cisco-ios
  ned cli ned-id  cisco-ios
  ned cli java-class-name com.tailf.packages.ned.ios.IOSNedCli
  ned device vendor Cisco
NAME      VALUE
---------------------
show-tag  interface

 oper-status up
packages package f5-bigip
 package-version 1.3
 description     "NED package for the F5 BigIp FW/LB"
 ncs-min-version [ 3.0.1 ]
 directory       ./state/packages-in-use/1/bigip
 component f5-bigip
  ned generic java-class-name com.tailf.packages.ned.bigip.BigIpNedGeneric
  ned device vendor F5
 oper-status up
!
```

The core parts of a NED are:

* **A Driver Element**: Running in a Java VM.
*   **Data Model:** Independent of the underlying device interface technology, NEDs come with a data model in YANG that specifies configuration data and operational data that is supported for the device.

    * For native NETCONF devices, the YANG comes from the device.
    * For JunOS, NSO generates the model from the JunOS XML schema.
    * For SNMP devices, NSO generates the model from the MIBs.
    * For CLI devices, the NED designer writes the YANG to map the CLI.

    NSO only cares about the data that is in the model for the NED. The rest is ignored. See the [NED documentation](../../development/advanced-development/developing-neds/) to learn more about what is covered by the NED.
* **Code:** For NETCONF and SNMP devices, there is no code. For CLI devices there is a minimum of code managing connecting over SSH/Telnet and looking for version strings. The rest is auto-rendered from the data model.

There are four categories of NEDs depending on the device interface:

1. **NETCONF NED**: The device supports NETCONF, for example, Juniper.
2. **CLI NED**: Any device with a CLI that resembles a Cisco CLI.
3. **Generic NED**: Proprietary protocols like REST, and non-Cisco CLIs.
4. **SNMP NED**: An SNMP device.

## Device Authentication <a href="#d5e524" id="d5e524"></a>

Every device needs an auth group that tells NSO how to authenticate to the device:

```cli
admin@ncs(config)# show full-configuration devices authgroups
devices authgroups group default
 umap admin
  remote-name     admin
  remote-password $4$wIo7Yd068FRwhYYI0d4IDw==
 !
 umap oper
  remote-name     oper
  remote-password $4$zp4zerM68FRwhYYI0d4IDw==
 !
!
devices authgroups snmp-group default
 default-map community-name public
 umap admin
  usm remote-name admin
  usm security-level auth-priv
  usm auth md5 remote-password $4$wIo7Yd068FRwhYYI0d4IDw==
  usm priv des remote-password $4$wIo7Yd068FRwhYYI0d4IDw==
 !
!
```

The CLI snippet above shows that there is a mapping from the NSO users `admin` and `oper` to the remote user and password to be used on the devices. There are two options, either a mapping from the local user to the remote user or to pass the credentials. Below is a CLI example to create a new `authgroup foobar` and map NSO user `jim`:

```cli
admin@ncs(config)# devices authgroups group foobar umap joe same-pass same-user
admin@ncs(config-umap-joe)# commit
```

This auth group will pass on `joe`'s credentials to the device.

There is a similar structure for SNMP `devices authgroups snmp-group` that supports SNMPv1/v2c, and SNMPv3 authentication.

The SNMP auth group above has a default auth group for non-mapped users.

## Connecting Devices for Different NED Types <a href="#d5e537" id="d5e537"></a>

Make sure you know the authentication information and created authgroups as above. Also, try all information like port numbers and authentication information, and that you can read and set the configuration over for example CLI if it is a CLI NED. So if it is a CLI device try to ssh (or telnet) to the device and do show and set configuration first of all.

All devices have a `admin-state` with default value `southbound-locked`. This means that if you do not set this value to unlocked no commands will be sent to the device.

### CLI NEDs <a href="#d5e543" id="d5e543"></a>

(See also `examples.ncs/getting-started/using-ncs/2-real-device-cisco-ios`). Straightforward, adding a new device on a specific address, standard SSH port:

```cli
admin@ncs(config)# devices device c7 address 1.2.3.4 port 22 \
                                device-type cli ned-id cisco-ios-cli-3.0
admin@ncs(config-device-c7)# authgroup
Possible completions:
  default  foobar
admin@ncs(config-device-c7)# authgroup default
admin@ncs(config-device-c7)# state admin-state unlocked
admin@ncs(config-device-c7)# commit
```

### NETCONF NEDs, JunOS <a href="#d5e554" id="d5e554"></a>

See also `/examples.ncs/getting-started/using-ncs/3-real-device-juniper`. Make sure that NETCONF over SSH is enabled on the JunOS device:

```
junos1% show system services
ftp;
ssh;
telnet;
netconf {
    ssh {
        port 22;
    }
}
```

Then you can create a NSO netconf device as:

```cli
admin@ncs(config)# devices device junos1 address junos1.lab port 22 \
                                 authgroup foobar device-type netconf
admin@ncs(config-device-junos1)# state admin-state unlocked
admin@ncs(config-device-junos1)# commit
```

### SNMP NEDs <a href="#d5e566" id="d5e566"></a>

(See also `examples.ncs/snmp-ned/basic/README` .) First of all, let's explain SNMP NEDs a bit. By default all read-only objects are mapped to operational data in NSO and read-write objects are mapped to configuration data. This means that a sync-from operation will load read-write objects into NSO. How can you reach read-only objects? Note the following is true for all NED types that have modeled operational data. The device configuration exists at `devices device config` and has a copy in CDB. NSO can speak live to the device to fetch for example counters by using the path `devices device live-status`:

```cli
admin@ncs# show devices device r1 live-status SNMPv2-MIB
live-status SNMPv2-MIB system sysDescr "Tail-f ConfD agent - r1"
live-status SNMPv2-MIB system sysObjectID 1.3.6.1.4.1.24961
live-status SNMPv2-MIB system sysUpTime 4253
live-status SNMPv2-MIB system sysContact ""
live-status SNMPv2-MIB system sysName ""
live-status SNMPv2-MIB system sysLocation ""
live-status SNMPv2-MIB system sysServices 72
live-status SNMPv2-MIB system sysORLastChange 0
live-status SNMPv2-MIB snmp snmpInPkts 3
live-status SNMPv2-MIB snmp snmpInBadVersions 0
live-status SNMPv2-MIB snmp snmpInBadCommunityNames 0
live-status SNMPv2-MIB snmp snmpInBadCommunityUses 0
live-status SNMPv2-MIB snmp snmpInASNParseErrs 0
live-status SNMPv2-MIB snmp snmpEnableAuthenTraps disabled
live-status SNMPv2-MIB snmp snmpSilentDrops 0
live-status SNMPv2-MIB snmp snmpProxyDrops 0
live-status SNMPv2-MIB snmpSet snmpSetSerialNo 2161860
```

In many cases, SNMP NEDs are used for reading operational data in parallel with a CLI NED for writing and reading configuration data. More on that later.

Before trying NSO use net-snmp command line tools or your favorite SNMP Browser to try that all settings are ok.

Adding an SNMP device assuming that NED is in place:

```cli
admin@ncs(config)# show full-configuration devices device r1
devices device r1
 address 127.0.0.1
 port    11023
 device-type snmp version v2c
 device-type snmp snmp-authgroup default
 state admin-state unlocked
!
admin@ncs(config)# show full-configuration devices device r2
devices device r2
 address 127.0.0.1
 port    11024
 device-type snmp version v3
 device-type snmp snmp-authgroup default
 device-type snmp mib-group [ basic snmp ]
 state admin-state unlocked
!
```

MIB Groups are important. A MIB group is just a named collection of SNMP MIB Modules. If you do not specify any MIB group for a device, NSO will try with all known MIBs. It is possible to create MIB groups with wild cards such as `CISCO*`.

```cli
admin@ncs(config)# show full-configuration devices mib-group
devices mib-group basic
 mib-module [ BASIC-CONFIG-MIB ]
!
devices mib-group snmp
 mib-module [ SNMP* ]
!
```

### Generic NEDs <a href="#d5e585" id="d5e585"></a>

Generic devices are typically configured like a CLI device. Make sure you set the right address, port, protocol, and authentication information.

Below is an example of setting up NSO with F5 BigIP:

```cli
admin@ncs(config)# devices device bigip01 address 192.168.1.162 \
                                 port 22 device-type generic ned-id f5-bigip
admin@ncs(config-device-bigip01)# state admin-state southbound-locked
admin@ncs(config-device-bigip01)# authgroup
Possible completions:
  default  foobar
admin@ncs(config-device-bigip01)# authgroup default
admin@ncs(config-device-bigip01)# commit
```

### Live Status Protocol <a href="#d5e596" id="d5e596"></a>

Assume that you have a Cisco device that you would like NSO to configure over CLI but read statistics over SNMP. This can be achieved by adding settings for `live-device-protocol`:

```cli
admin@ncs(config)# devices device c0 live-status-protocol snmp \
                                device-type snmp version v1 \
                                snmp-authgroup default mib-group [ snmp ]
admin@ncs(config-live-status-protocol-snmp)# commit


admin@ncs(config)# show full-configuration devices device c0
devices device c0
 address   127.0.0.1
 port      10022
 !
 authgroup default
 device-type cli ned-id cisco-ios
 live-status-protocol snmp
  device-type snmp version v1
  device-type snmp snmp-authgroup default
  device-type snmp mib-group [ snmp ]
 !
```

Device `c0` has a config tree from the CLI NED and a live-status tree (read-only) from the SNMP NED using all MIBs in the group `snmp`.

#### Multi-NEDs for Statistics

Sometimes we wish to use a different protocol to collect statistics from the live tree than the protocol that is used to configure a managed device. There are many interesting use cases where this pattern applies. For example, if we wish to access SNMP data as statistics in the live tree on a Juniper router, or alternatively, if we have a CLI NED to a Cisco-type device, and wish to access statistics in the live tree over SNMP.

The solution is to configure additional protocols for the live tree. We can have an arbitrary number of NEDs associated to statistics data for an individual managed device.

The additional NEDs are configured under `/devices/device/live-status-protocol`.

In the configuration snippet below, we have configured two additional NEDs for statistics data.

```
devices {
    authgroups {
        snmp-group g1 {
            umap admin {
                community-name public;
            }
        }
    }
    mib-group m1 {
        mib-module [ SIMPLE-MIB ];
    }
    device device0 {
        live-status-protocol x1 {
            port 4001;
            device-type {
                snmp {
                    version        v2c;
                    snmp-authgroup g1;
                    mib-group      [ m1 ];
                }
            }
        }
        live-status-protocol x2 {
            authgroup default;
            device-type {
                cli {
                    ned-id xstats;
                }
            }
        }
     }
```

## Administrative State for Devices <a href="#d5e605" id="d5e605"></a>

Devices have an `admin-state` with following values:

* **unlocked**: the device can be modified and changes will be propagated to the real device.
* **southbound-locked**: the device can be modified but changes will not be propagated to the real device. Can be used to prepare configurations before the device is available in the network.
* **locked**: the device can only be read.

The admin-state value southbound-locked is the default. This means if you create a new device without explicitly setting this value configuration changes will not propagate to the network. To see default values, use the pipe target `details`

```cli
admin@ncs(config)# show full-configuration devices device c0 | details
```

## Troubleshooting NEDs <a href="#d5e626" id="d5e626"></a>

To analyze NED problems, turn on the tracing for a device and look at the trace file contents.

```cli
admin@ncs(config)# show full-configuration devices global-settings
devices global-settings trace-dir ./logs

admin@ncs(config)# devices device c0 trace raw
admin@ncs(config-device-c0)# commit

admin@ncs(config)# devices device c0 disconnect
admin@ncs(config)# devices device c0 connect
```

NSO pools SSH connections and trace settings are only affecting new connections so therefore any open connection must be closed before the trace setting will take effect. Now you can inspect the raw communication between NSO and the device:

```bash
$ less logs/ned-c0.trace

admin connected from 127.0.0.1 using ssh on HOST-17
c0>
  *** output 8-Sep-2014::10:05:39.673 ***
enable

  *** input 8-Sep-2014::10:05:39.674 ***
 enable
c0#
  *** output 8-Sep-2014::10:05:39.713 ***
terminal length 0

  *** input 8-Sep-2014::10:05:39.714 ***
 terminal length 0
c0#
  *** output 8-Sep-2014::10:05:39.782 ***
terminal width 0

  *** input 8-Sep-2014::10:05:39.783 ***
 terminal width 0
0^M
c0#
  *** output 8-Sep-2014::10:05:39.839 ***
-- Requesting version string --
show version

  *** input 8-Sep-2014::10:05:39.839 ***
 show version
Cisco IOS Software, 7200 Software (C7200-JK9O3S-M), Version 12.4(7h), RELEASE SOFTWARE (fc1)^M
Technical Support: http://www.cisco.com/techsupport^M
Copyright (c) 1986-2007 by Cisco Systems, Inc.^M
...
```

### Device Communication Failure

If NSO fails to talk to the device, the typical root causes are:

<details>

<summary>Timeout Problems</summary>

Some devices are slow to respond, latency on connections, etc. Fine-tune the connect, read, and write timeouts for the device:

```cli
admin@ncs(config)# devices device c0
Possible completions:
  ...
  connect-timeout           - Timeout in seconds for new connections
  ...
  read-timeout              - Timeout in seconds used when reading data
  ...
  write-timeout             - Timeout in seconds used when writing data
```

\
These settings can be set in profiles shared by devices.

```cli
admin@ncs(config)# devices profiles profile good-profile
Possible completions:
  connect-timeout   Timeout in seconds for new connections
  ned-settings      Control which device capabilities NCS uses
  read-timeout      Timeout in seconds used when reading data
  trace             Trace the southbound communication to devices
  write-timeout     Timeout in seconds used when writing data
```

</details>

<details>

<summary>Device Management Interface Problems</summary>

Examples, not enabling the NETCONF SSH subsystem on Juniper, not enabling the SNMP agent, using the wrong port numbers, etc. Use standalone tools to make sure that you can connect, read configuration, and write configuration over the device interface that NSO is using

</details>

<details>

<summary>Access Rights</summary>

The NSO-mapped user does not have access rights to do the operation on the device. Make sure the `authgroups` settings are OK and test them manually to read and write configuration with those credentials.

</details>

<details>

<summary>NED Data Model and Device Version Problems</summary>

If the device is upgraded and existing commands actually change in an incompatible way, the NED has to be updated. This can be done by editing the YANG data model for the device or by using Cisco support.

</details>
