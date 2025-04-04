---
description: Manage the life-cycle of network services.
---

# Manage Network Services

NSO can also manage the life-cycle for services like VPNs, BGP peers, and ACLs. It is important to understand what is meant by service in this context:

* NSO abstracts the device-specific details. The user only needs to enter attributes relevant to the service.
* The service instance has configuration data itself that can be represented and manipulated.
* A service instance configuration change is applied to all affected devices.

## Service Configuration Features

The following are the features that NSO uses to support service configuration:

* **Service Modeling**: Network engineers can model the service attributes and the mapping to device configurations. For example, this means that a network engineer can specify at data-model for VPNs with router interfaces, VLAN ID, VRF, and route distinguisher.
* **Service Life-cycle**: While less sophisticated configuration management systems can only create an initial service instance in the network they do not support changing or deleting a service instance. With NSO you can at any point in time modify service elements like the VLAN id of a VPN and NSO can generate the corresponding changes to the network devices.
* **Service Instance**: The NSO service instance has configuration data that can be represented and manipulated. The service model on run-time updates all NSO northbound interfaces so that a network engineer can view and manipulate the service instance over CLI, WebUI, REST, etc.
* **References between Service Instances and Device Configuration**: NSO maintains references between service instances and device configuration. This means that a VPN instance knows exactly which device configurations it created or modified. Every configuration stored in the CDB is mapped to the service instance that created it.

## Service Example <a href="#d5e684" id="d5e684"></a>

An example is the best method to illustrate how services are created and used in NSO. As described in the sections about devices and NEDs, it was said that NEDs come in packages. The same is true for services, either if you design the services yourself or use ready-made service applications, it ends up in a package that is loaded into NSO.

{% hint style="success" %}
Watch a video presentation of this demo on [YouTube](https://www.youtube.com/watch?v=sYuETSuTsrM).
{% endhint %}

The example [examples.ncs/service-management/mpls-vpn-java](https://github.com/NSO-developer/nso-examples/tree/6.4/service-management/mpls-vpn-java) will be used to explain NSO Service Management features. This example illustrates Layer-3 VPNs in a service provider MPLS network. The example network consists of Cisco ASR 9k and Juniper core routers (P and PE) and Cisco IOS-based CE routers. The Layer-3 VPN service configures the CE/PE routers for all endpoints in the VPN with BGP as the CE/PE routing protocol. The layer-2 connectivity between CE and PE routers is expected to be done through a Layer-2 ethernet access network, which is out of scope for this example. The Layer-3 VPN service includes VPN connectivity as well as bandwidth and QOS parameters.

<figure><img src="../../images/network.jpg" alt=""><figcaption><p>A L3 VPN Example</p></figcaption></figure>

The service configuration only has references to CE devices for the end-points in the VPN. The service mapping logic reads from a simple topology model that is configuration data in NSO, outside the actual service model and derives what other network devices to configure.

The topology information has two parts:

*   The first part lists connections in the network and is used by the service mapping logic to find out which PE router to configure for an endpoint. The snippets below show the configuration output in the Cisco-style NSO CLI.

    ```
     topology connection c0
     endpoint-1 device ce0 interface GigabitEthernet0/8 ip-address 192.168.1.1/30
     endpoint-2 device pe0 interface GigabitEthernet0/0/0/3 ip-address 192.168.1.2/30
     link-vlan 88
    !
    topology connection c1
     endpoint-1 device ce1 interface GigabitEthernet0/1 ip-address 192.168.1.5/30
     endpoint-2 device pe1 interface GigabitEthernet0/0/0/3 ip-address 192.168.1.6/30
     link-vlan 77
    !
    ```
*   The second part lists devices for each role in the network and is in this example only used to dynamically render a network map in the Web UI.

    ```
    topology role ce
     device [ ce0 ce1 ce2 ce3 ce4 ce5 ]
    !
    topology role pe
     device [ pe0 pe1 pe2 pe3 ]
    !
    ```

The QOS configuration in service provider networks is complex and often requires a lot of different variations. It is also often desirable to be able to deliver different levels of QOS. This example shows how a QOS policy configuration can be stored in NSO and referenced from VPN service instances. Three different levels of QOS policies are defined; `GOLD`, `SILVER`, and `BRONZE` with different queuing parameters.

```
 qos qos-policy GOLD
 class BUSINESS-CRITICAL
  bandwidth-percentage 20
 !
 class MISSION-CRITICAL
  bandwidth-percentage 20
 !
 class REALTIME
  bandwidth-percentage 20
  priority
 !
!
qos qos-policy SILVER
 class BUSINESS-CRITICAL
  bandwidth-percentage 25
 !
 class MISSION-CRITICAL
  bandwidth-percentage 25
 !
 class REALTIME
  bandwidth-percentage 10
 !
```

Three different traffic classes are also defined with a DSCP value that will be used inside the MPLS core network as well as default rules that will match traffic to a class.

```
qos qos-class BUSINESS-CRITICAL
 dscp-value af21
 match-traffic ssh
  source-ip      any
  destination-ip any
  port-start     22
  port-end       22
  protocol       tcp
 !
!
qos qos-class MISSION-CRITICAL
 dscp-value af31
 match-traffic call-signaling
  source-ip      any
  destination-ip any
  port-start     5060
  port-end       5061
  protocol       tcp
 !
!
```

## Running the Example <a href="#d5e706" id="d5e706"></a>

Run the example as follows:

1.  Make sure that you start clean, i.e. no old configuration data is present. If you have been running this or some other example before, make sure to stop any NSO or simulated network nodes (ncs-netsim) that you may have running. Output like 'connection refused (stop)' means no previous NSO was running and 'DEVICE ce0 connection refused (stop)...' no simulated network was running, which is good.

    ```
    Copy$ 
    ```

    \
    This will set up the environment and start the simulated network.
2.  Before creating a new L3VPN service, we must sync the configuration from all network devices and then enter config mode. (A hint for this complete section is to have the `README` file from the example and cut and paste the CLI commands).

    ```
    Copyncs# 
    ```
3.  Add another VPN.

    ```
    top
    !
    vpn l3vpn ford
    as-number 65200
    endpoint main-office
    ce-device    ce2
    ce-interface GigabitEthernet0/5
    ip-network   192.168.1.0/24
    bandwidth    10000000
    !
    endpoint branch-office1
    ce-device    ce3
    ce-interface GigabitEthernet0/5
    ip-network   192.168.2.0/24
    bandwidth    5500000
    !
    endpoint branch-office2
    ce-device    ce5
    ce-interface GigabitEthernet0/5
    ip-network   192.168.7.0/24
    bandwidth    1500000
    !
    ```

    \
    The above sequence showed how NSO can be used to manipulate service abstractions on top of devices. Services can be defined for various purposes such as VPNs, Access Control Lists, firewall rules, etc. Support for services is added to NSO via a corresponding service package.

A service package in NSO comprises two parts:

1. **Service model:** the attributes of the service, and input parameters given when creating the service. In this example name, as-number, and end-points.
2. **Mapping**: what is the corresponding configuration of the devices when the service is applied. The result of the mapping can be inspected by the `commit dry-run outformat native` command.

We later show how to define this, for now, assume that the job is done.

## Service-Life Cycle Management <a href="#d5e757" id="d5e757"></a>

### Service Changes <a href="#d5e759" id="d5e759"></a>

When NSO applies services to the network, NSO stores the service configuration along with resulting device configuration changes. This is used as a base for the FASTMAP algorithm which automatically can derive device configuration changes from a service change.

**Example 1**

Going back to the example L3 VPN above, any part of `volvo` VPN instance can be modified.

A simple change like changing the `as-number` on the service results in many changes in the network. NSO does this automatically.

```
ncs(config)# vpn l3vpn volvo as-number 65102
ncs(config-l3vpn-volvo)# commit dry-run outformat native
native {
    device {
        name ce0
        data no router bgp 65101
             router bgp 65102
              neighbor 192.168.1.2 remote-as 100
              neighbor 192.168.1.2 activate
              network 10.10.1.0
             !
...
ncs(config-l3vpn-volvo)# commit
```

**Example 2**

Let us look at a more challenging modification.

A common use case is of course to add a new CE device and add that as an end-point to an existing VPN. Below is the sequence to add two new CE devices and add them to the VPNs. (In the CLI snippets below we omit the prompt to enhance readability).

First, we add them to the topology:

```
top
!
topology connection c7
endpoint-1 device ce7 interface GigabitEthernet0/1 ip-address 192.168.1.25/30
endpoint-2 device pe3 interface GigabitEthernet0/0/0/2 ip-address 192.168.1.26/30
link-vlan 103
!
topology connection c8
endpoint-1 device ce8 interface GigabitEthernet0/1 ip-address 192.168.1.29/30
endpoint-2 device pe3 interface GigabitEthernet0/0/0/2 ip-address 192.168.1.30/30
link-vlan 104
!
ncs(config)#commit
```

Note well that the above just updates NSO local information on topological links. It has no effect on the network. The mapping for the L3 VPN services does a look-up in the topology connections to find the corresponding `pe` router.

Next, we add them to the VPNs:

```
top
!
vpn l3vpn ford
endpoint new-branch-office
ce-device    ce7
ce-interface GigabitEthernet0/5
ip-network   192.168.9.0/24
bandwidth    4500000
!
vpn l3vpn volvo
endpoint new-branch-office
ce-device    ce8
ce-interface GigabitEthernet0/5
ip-network   10.8.9.0/24
bandwidth    4500000
!
```

Before we send anything to the network, let's look at the device configuration using a dry run. As you can see, both new CE devices are connected to the same PE router, but for different VPN customers.

```
ncs(config)# commit dry-run outformat native
```

Finally, commit the configuration to the network

```
(config)# commit
```

### Service Impacting Out-of-band Changes <a href="#d5e779" id="d5e779"></a>

Next, we will show how NSO can be used to check if the service configuration in the network is up to date.

In a new terminal window, we connect directly to the device `ce0` which is a Cisco device emulated by the tool `ncs-netsim`.

```bash
$ ncs-netsim cli-c ce0
```

We will now reconfigure an edge interface that we previously configured using NSO.

```
 enable
ce0# configure
Enter configuration commands, one per line. End with CNTL/Z.
ce0(config)# no policy-map volvo
ce0(config)# exit
ce0# exit
```

Going back to the terminal with NSO, check the status of the network configuration:

```cli
ncs# devices check-sync
sync-result {
    device ce0
    result out-of-sync
    info got: c5c75ee593246f41eaa9c496ce1051ea expected: c5288cc0b45662b4af88288d29be8667
...

ncs# vpn l3vpn * check-sync
vpn l3vpn ford check-sync
    in-sync true
vpn l3vpn volvo check-sync
    in-sync true

ncs# vpn l3vpn * deep-check-sync
vpn l3vpn ford deep-check-sync
    in-sync true
vpn l3vpn volvo deep-check-sync
    in-sync false
```

The CLI sequence above performs 3 different comparisons:

* Real device configuration versus device configuration copy in NSO CDB.
* Expected device configuration from the service perspective and device configuration copy in CDB.
* Expected device configuration from the service perspective and real device configuration.

Notice that the service `volvo` is out of sync with the service configuration. Use the `check-sync outformat cli` to see what the problem is:

```cli
ncs# vpn l3vpn volvo deep-check-sync outformat cli
cli  devices {
         devices {
             device ce0 {
                 config {
    +                ios:policy-map volvo {
    +                    class class-default {
    +                        shape {
    +                            average {
    +                                bit-rate 12000000;
    +                            }
    +                        }
    +                    }
    +                }
                 }
             }
         }
     }
```

Assume that a network engineer considers the real device configuration to be authoritative:

```cli
ncs# devices device ce0 sync-from
result true
```

And then restore the service:

```cli
ncs# vpn l3vpn volvo re-deploy dry-run { outformat native } 
native {
    device {
        name ce0
        data policy-map volvo
               class class-default
                shape average 12000000
               !
              !

    }
}
ncs# vpn l3vpn volvo re-deploy
```

### Service Deletion <a href="#d5e809" id="d5e809"></a>

In the same way, as NSO can calculate any service configuration change, it can also automatically delete the device configurations that resulted from creating services:

```cli
ncs(config)# no vpn l3vpn ford
ncs(config)# commit dry-run
cli  devices {
         device ce7
             config {
    -            ios:policy-map ford {
    -                class class-default {
    -                    shape {
    -                        average {
    -                            bit-rate 4500000;
    -                    }
    -                }
    -            }
    -        }
...
```

It is important to understand the two diffs shown above. The first diff as an output to `show configuration` shows the diff at the service level. The second diff shows the output generated by NSO to clean up the device configurations.

Finally, we commit the changes to delete the service.

```
(config)# commit
```

### Viewing Service Configurations <a href="#d5e819" id="d5e819"></a>

Service instances live in the NSO data store as well as a copy of the device configurations. NSO will maintain relationships between these two.

Show the configuration for a service

```cli
ncs(config)# show full-configuration vpn l3vpn
vpn l3vpn volvo
 as-number 65102
 endpoint branch-office1
  ce-device    ce1
  ce-interface GigabitEthernet0/11
  ip-network   10.7.7.0/24
  bandwidth    6000000
 !
...
```

You can ask NSO to list all devices that are touched by a service and vice versa:

```
ncs# show vpn l3vpn modified devices
NAME   DEVICES
------------------------------------
volvo  [ ce0 ce1 ce4 ce8 pe0 pe2 pe3 ]

ncs# show devices device services
NAME  ID
--------------------------------
ce0   /vpn/l3vpn[name='volvo']
ce1   /vpn/l3vpn[name='volvo']
ce2
ce3
ce4   /vpn/l3vpn[name='volvo']
ce5
ce6
ce7
ce8   /vpn/l3vpn[name='volvo']
p0
p1
p2
p3
pe0   /vpn/l3vpn[name='volvo']
pe1
pe2   /vpn/l3vpn[name='volvo']
pe3   /vpn/l3vpn[name='volvo']
```

Note that operational mode in the CLI was used above. Every service instance has an operational attribute that is maintained by the transaction manager and shows which device configuration it created. Furthermore, every device configuration has backward pointers to the corresponding service instances:

```cli
ncs(config)# show full-configuration devices device ce3 \
                    config | display service-meta-data
devices device ce3
 config
  ...
  /* Refcount: 1 */
  /* Backpointer: [ /l3vpn:vpn/l3vpn:l3vpn[l3vpn:name='ford'] ] */
  ios:interface GigabitEthernet0/2.100
   /* Refcount: 1 */
   description Link to PE / pe1 - GigabitEthernet0/0/0/5
   /* Refcount: 1 */
   encapsulation dot1Q 100
   /* Refcount: 1 */
   ip address 192.168.1.13 255.255.255.252
   /* Refcount: 1 */
   service-policy output ford
  exit

ncs(config)# show full-configuration devices device ce3 config \
                     | display curly-braces | display service-meta-data
...
ios:interface {
    GigabitEthernet 0/1;
    GigabitEthernet 0/10;
    GigabitEthernet 0/11;
    GigabitEthernet 0/12;
    GigabitEthernet 0/13;
    GigabitEthernet 0/14;
    GigabitEthernet 0/15;
    GigabitEthernet 0/16;
    GigabitEthernet 0/17;
    GigabitEthernet 0/18;
    GigabitEthernet 0/19;
    GigabitEthernet 0/2;
    /* Refcount: 1 */
    /* Backpointer: [ /l3vpn:vpn/l3vpn:l3vpn[l3vpn:name='ford'] ] */
    GigabitEthernet 0/2.100 {
        /* Refcount: 1 */
        description "Link to PE / pe1 - GigabitEthernet0/0/0/5";
        encapsulation {
            dot1Q {
                /* Refcount: 1 */
                vlan-id 100;
            }
        }
        ip {
            address {
                primary {
                    /* Refcount: 1 */
                    address 192.168.1.13;
                    /* Refcount: 1 */
                    mask    255.255.255.252;
                }
            }
        }
        service-policy {
            /* Refcount: 1 */
            output ford;
        }
    }

ncs(config)# show full-configuration devices device ce3 config \
                   | display service-meta-data | context-match Backpointer
devices device ce3
  /* Refcount: 1 */
  /* Backpointer: [ /l3vpn:vpn/l3vpn:l3vpn[l3vpn:name='ford'] ] */
  ios:interface GigabitEthernet0/2.100
devices device ce3
  /* Refcount: 2 */
  /* Backpointer: [ /l3vpn:vpn/l3vpn:l3vpn[l3vpn:name='ford'] ] */
  ios:interface GigabitEthernet0/5
```

The reference counter above makes sure that NSO will not delete shared resources until the last service instance is deleted. The context-match search is helpful, it displays the path to all matching configuration items.

### Using Commit Queues <a href="#d5e833" id="d5e833"></a>

As described in [Commit Queue](nso-device-manager.md#user_guide.devicemanager.commit-queue), the commit queue can be used to increase the transaction throughput. When the commit queue is for service activation, the services will have states reflecting outstanding commit queue items.

{% hint style="info" %}
When committing a service using the commit queue in _async_ mode the northbound system can not rely on the service being fully activated in the network when the activation requests return.
{% endhint %}

We will now commit a VPN service using the commit queue and one device is down.

```bash
$ ncs-netsim stop ce0
DEVICE ce0 STOPPED
```

```cli
ncs(config)# show configuration
vpn l3vpn volvo
 as-number 65101
 endpoint branch-office1
  ce-device    ce1
  ce-interface GigabitEthernet0/11
  ip-network   10.7.7.0/24
  bandwidth    6000000
 !
 endpoint main-office
  ce-device    ce0
  ce-interface GigabitEthernet0/11
  ip-network   10.10.1.0/24
  bandwidth    12000000
 !
!

ncs# commit commit-queue async
commit-queue-id 10777927137
Commit complete.
ncs(config)# *** ALARM connection-failure: Failed to connect to device ce0: connection refused: Connection refused
```

This service is not provisioned fully in the network, since `ce0` was down. It will stay in the queue either until the device starts responding or when an action is taken to remove the service or remove the item. The commit queue can be inspected. As shown below we see that we are waiting for `ce0`. Inspecting the queue item shows the outstanding configuration.

```cli
ncs# show devices commit-queue | notab
devices commit-queue queue-item 10777927137
 age       1934
 status    executing
 devices   [ ce0 ce1 pe0 ]
 transient ce0
  reason "Failed to connect to device ce0: connection refused"
 is-atomic true

ncs# show vpn l3vpn volvo commit-queue | notab
commit-queue queue-item 1498812003922
```

The commit queue will constantly try to push the configuration towards the devices. The number of retry attempts and at what interval they occur can be configured.

```cli
ncs# show full-configuration devices global-settings commit-queue | details
devices global-settings commit-queue enabled-by-default false
devices global-settings commit-queue atomic true
devices global-settings commit-queue retry-timeout 30
devices global-settings commit-queue retry-attempts unlimited
```

If we start `ce0` and inspect the queue, we will see that the queue will finally be empty and that the `commit-queue` status for the service is empty.

```cli
ncs# show devices commit-queue | notab
devices commit-queue queue-item 10777927137
 age       3357
 status    executing
 devices   [ ce0 ce1 pe0 ]
 transient ce0
  reason "Failed to connect to device ce0: connection refused"
 is-atomic true

ncs# show devices commit-queue | notab
devices commit-queue queue-item 10777927137
 age       3359
 status    executing
 devices   [ ce0 ce1 pe0 ]
 is-atomic true

ncs# show devices commit-queue
% No entries found.

ncs# show vpn l3vpn volvo commit-queue
% No entries found.

ncs# show devices commit-queue completed | notab
devices commit-queue completed queue-item 10777927137
 when               2015-02-09T16:48:17.915+00:00
 succeeded          true
 devices            [ ce0 ce1 pe0 ]
 completed          [ ce0 ce1 pe0 ]
 completed-services [ /l3vpn:vpn/l3vpn:l3vpn[l3vpn:name='volvo'] ]
```

### Un-deploying Services <a href="#d5e863" id="d5e863"></a>

In some scenarios, it makes sense to remove the service configuration from the network but keep the representation of the service in NSO. This is called to `un-deploy` a service.

```cli
ncs# vpn l3vpn volvo check-sync
in-sync false
ncs# vpn l3vpn volvo re-deploy
ncs# vpn l3vpn volvo check-sync
in-sync true
```

## Defining Your Own Services <a href="#d5e871" id="d5e871"></a>

### Overview <a href="#d5e873" id="d5e873"></a>

To have NSO deploy services across devices, two pieces are needed:

1. A service model in YANG: the service model shall define the black-box view of a service; which are the input parameters given when creating the service? This YANG model will render an update of all NSO northbound interfaces, for example, the CLI.
2. Mapping, given the service input parameters, what is the resulting device configuration? This mapping can be defined in templates, code, or a combination of both.

### Defining the Service Model <a href="#d5e881" id="d5e881"></a>

The first step is to generate a skeleton package for a service (for details, see [Packages](../../administration/management/package-mgmt.md)). Create a directory under, for example, `~/my-sim-ios`similar to how it is done for the [examples.ncs/device-management/simulated-cisco-ios](https://github.com/NSO-developer/nso-examples/tree/6.4/device-management/simulated-cisco-ios) example. Make sure that you have stopped any running NSO and netsim.

Navigate to the simulated ios directory and create a new package for the VLAN service model:

```bash
$ cd examples.ncs/device-management/simulated-cisco-ios/packages
```

If the `packages` folder does not exist yet, such as when you have not run this example before, you will need to invoke the `ncs-setup` and `ncs-netsim create-network` commands as described in the `simulated-cisco-ios` `README` file.

The next step is to create the template skeleton by using the `ncs-make-package` utility:

```bash
$ ncs-make-package --service-skeleton template --root-container vlans --no-test  vlan
```

This results in a directory structure:

```
vlan
   package-meta-data.xml
   src
   templates
```

For now, let's focus on the `src/yang/vlan.yang` file.

```yang
            module vlan {
              namespace "http://com/example/vlan";
              prefix vlan;

              import ietf-inet-types {
                prefix inet;
              }
              import tailf-ncs {
                prefix ncs;
              }

              container vlans {
              list vlan {
                key name;

                uses ncs:service-data;
                ncs:servicepoint "vlan";

                leaf name {
                  type string;
                }

                // may replace this with other ways of refering to the devices.
                leaf-list device {
                  type leafref {
                    path "/ncs:devices/ncs:device/ncs:name";
                  }
                }

                // replace with your own stuff here
                leaf dummy {
                  type inet:ipv4-address;
                }
              }
              } // container vlans {
            }
```

If this is your first exposure to YANG, you can see that the modeling language is very straightforward and easy to understand. See [RFC 7950](https://www.ietf.org/rfc/rfc7950.txt) for more details and examples for YANG. The concept to understand in the above-generated skeleton is that the two lines of `uses ncs:service-data` and `ncs:servicepoint "vlan"` tells NSO that this is a service. The `ncs:service-data` grouping together with the `ncs:servicepoint` YANG extension provides the common definitions for a service. The two are implemented by the `$NCS_DIR/src/ncs/yang/tailf-ncs-services.yang`. So if a user wants to create a new VLAN in the network what should be the parameters? - A very simple service model would look like below (modify the `src/yang/vlan.yang` file):

```yang
  augment /ncs:services {
    container vlans {
      key name;

      uses ncs:service-data;
      ncs:servicepoint "vlan";
      leaf name {
        type string;
      }

      leaf vlan-id {
        type uint32 {
          range "1..4096";
        }
      }

      list device-if {
        key "device-name";
          leaf device-name {
            type leafref {
              path "/ncs:devices/ncs:device/ncs:name";
            }
          }
          leaf interface-type {
            type enumeration {
              enum FastEthernet;
              enum GigabitEthernet;
              enum TenGigabitEthernet;
            }
          }
          leaf interface {
            type string;
          }
      }
    }
}
```

This simple VLAN service model says:

1. We give a VLAN a name, for example, net-1, this must also be unique, it is specified as `key`.
2. The VLAN has an id from 1 to 4096.
3. The VLAN is attached to a list of devices and interfaces. To make this example as simple as possible the interface reference is selected by picking the type and then the name as a plain string.

The good thing with NSO is that already at this point you could load the service model to NSO and try if it works well in the CLI etc. Nothing would happen to the devices since we have not defined the mapping, but this is normally the way to iterate a model and test the CLI towards the network engineers.

To build this service model `cd` to the [examples.ncs/device-management/simulated-cisco-ios](https://github.com/NSO-developer/nso-examples/tree/6.4/device-management/simulated-cisco-ios) example `/packages/vlan/src` directory and type `make` (assuming you have the `make` build system installed).

```bash
$ make
```

Go to the root directory of the `simulated-ios` example:

```bash
$ cd $NCS_DIR/examples.ncs/device-management/simulated-cisco-ios
```

Start netsim, NSO, and the CLI:

```bash
$ ncs-netsim start
$ ncs --with-package-reload
$ ncs_cli -C -u admin
```

When starting NSO above we give NSO a parameter to reload all packages so that our newly added `vlan` package is included. Packages can also be reloaded without restart. At this point we have a service model for VLANs, but no mapping of VLAN to device configurations. This is fine, we can try the service model and see if it makes sense. Create a VLAN service:

```cli
admin@ncs(config)# services vlan net-0 vlan-id 1234 \
device-if c0 interface-type FastEthernet interface 1/0
admin@ncs(config-device-if-c0)# top
admin@ncs(config)# show configuration
services vlan net-0
 vlan-id 1234
 device-if c0
  interface-type FastEthernet
  interface      1/0
 !
!
admin@ncs(config)# services vlan net-0 vlan-id 1234 \
device-if c1 interface-type FastEthernet interface 1/0
admin@ncs(config-device-if-c1)# top
admin@ncs(config)# show configuration
services vlan net-0
 vlan-id 1234
 device-if c0
  interface-type FastEthernet
  interface      1/0
 !
 device-if c1
  interface-type FastEthernet
  interface      1/0
 !
!
admin@ncs(config)# commit dry-run outformat cli
cli {
    local-node {
        data  services {
             +    vlan net-0 {
             +        vlan-id 1234;
             +        device-if c0 {
             +            interface-type FastEthernet;
             +            interface 1/0;
             +        }
             +        device-if c1 {
             +            interface-type FastEthernet;
             +            interface 1/0;
             +        }
             +    }
              }
    }
}
admin@ncs(config)# commit
Commit complete.
admin@ncs(config)# no services vlan
admin@ncs(config)# commit
Commit complete.
```

Committing service changes does not affect the devices since we have not defined the mapping. The service instance data will just be stored in NSO CDB.

Note that you get tab completion on the devices since they are leafrefs to device names in CDB, the same for interface-type since the types are enumerated in the model. However the interface name is just a string, and you have to type the correct interface name. For service models where there is only one device type like in this simple example, we could have used a reference to the ios interface name according to the IOS model. However that makes the service model dependent on the underlying device types and if another type is added, the service model needs to be updated and this is most often not desired. There are techniques to get tab completion even when the data type is a string, but this is omitted here for simplicity.

Make sure you delete the `vlan` service instance as above before moving on with the example.

### Defining the Mapping <a href="#d5e954" id="d5e954"></a>

Now it is time to define the mapping from service configuration to actual device configuration. The first step is to understand the actual device configuration. Hard-wire the VLAN towards a device as example. This concrete device configuration is a boilerplate for the mapping, it shows the expected result of applying the service.

```cli
admin@ncs(config)# devices device c0 config ios:vlan 1234
admin@ncs(config-vlan)# top
admin@ncs(config)# devices device c0 config ios:interface \
                   FastEthernet 10/10 switchport trunk allowed vlan 1234
admin@ncs(config-if)# top
admin@ncs(config)# show configuration
devices device c0
 config
  ios:vlan 1234
  !
  ios:interface FastEthernet10/10
   switchport trunk allowed vlan 1234
  exit
 !
!
admin@ncs(config)# commit
```

The concrete configuration above has the interface and VLAN hard-wired. This is what we now will make into a template instead. It is always recommended to start like the above and create a concrete representation of the configuration the template shall create. Templates are device-configuration where parts of the config are represented as variables. These kinds of templates are represented as XML files. Show the above as XML:

```cli
admin@ncs(config)# show full-configuration devices device c0 \
                                 config ios:vlan | display xml
<config xmlns="http://tail-f.com/ns/config/1.0">
  <devices xmlns="http://tail-f.com/ns/ncs">
  <device>
    <name>c0</name>
      <config>
      <vlan xmlns="urn:ios">
        <vlan-list>
          <id>1234</id>
        </vlan-list>
      </vlan>
      </config>
  </device>
  </devices>
</config>

admin@ncs(config)# show full-configuration devices device c0 \
                                config ios:interface FastEthernet 10/10 | display xml
<config xmlns="http://tail-f.com/ns/config/1.0">
  <devices xmlns="http://tail-f.com/ns/ncs">
  <device>
    <name>c0</name>
      <config>
      <interface xmlns="urn:ios">
      <FastEthernet>
        <name>10/10</name>
        <switchport>
          <trunk>
            <allowed>
              <vlan>
                <vlans>1234</vlans>
              </vlan>
            </allowed>
          </trunk>
        </switchport>
      </FastEthernet>
      </interface>
      </config>
  </device>
  </devices>
</config>
admin@ncs(config)#
```

Now, we shall build that template. When the package was created a skeleton XML file was created in `packages/vlan/templates/vlan.xml`

```xml
<config-template xmlns="http://tail-f.com/ns/config/1.0"
                 servicepoint="vlan">
  <devices xmlns="http://tail-f.com/ns/ncs">
    <device>
      <!--
          Select the devices from some data structure in the service
          model. In this skeleton the devices are specified in a leaf-list.
          Select all devices in that leaf-list:
      -->
      <name>{/device}</name>
      <config>
        <!--
            Add device-specific parameters here.
            In this skeleton the service has a leaf "dummy"; use that
            to set something on the device e.g.:
            <ip-address-on-device>{/dummy}</ip-address-on-device>
        -->
      </config>
    </device>
  </devices>
</config-template>
```

We need to specify the right path to the devices. In our case, the devices are identified by `/device-if/device-name` (see the YANG service model).

For each of those devices, we need to add the VLAN and change the specified interface configuration. Copy the XML config from the CLI and replace it with variables:

```xml
<config-template xmlns="http://tail-f.com/ns/config/1.0"
                 servicepoint="vlan">
  <devices xmlns="http://tail-f.com/ns/ncs">
    <device>
      <name>{/device-if/device-name}</name>
      <config>
        <vlan xmlns="urn:ios">
          <vlan-list tags="merge">
            <id>{../vlan-id}</id>
          </vlan-list>
        </vlan>
        <interface xmlns="urn:ios">
          <?if {interface-type='FastEthernet'}?>
            <FastEthernet tags="nocreate">
              <name>{interface}</name>
              <switchport>
                <trunk>
                  <allowed>
                    <vlan tags="merge">
                      <vlans>{../vlan-id}</vlans>
                    </vlan>
                  </allowed>
                </trunk>
              </switchport>
            </FastEthernet>
          <?end?>
          <?if {interface-type='GigabitEthernet'}?>
            <GigabitEthernet tags="nocreate">
              <name>{interface}</name>
              <switchport>
                <trunk>
                  <allowed>
                    <vlan tags="merge">
                      <vlans>{../vlan-id}</vlans>
                    </vlan>
                  </allowed>
                </trunk>
              </switchport>
            </GigabitEthernet>
          <?end?>
          <?if {interface-type='TenGigabitEthernet'}?>
            <TenGigabitEthernet tags="nocreate">
              <name>{interface}</name>
              <switchport>
                <trunk>
                  <allowed>
                    <vlan tags="merge">
                      <vlans>{../vlan-id}</vlans>
                    </vlan>
                  </allowed>
                </trunk>
              </switchport>
            </TenGigabitEthernet>
          <?end?>
        </interface>
      </config>
    </device>
  </devices>
</config-template>
```

Walking through the template can give a better idea of how it works. For every `/device-if/device-name` from the service model do the following:

1. Add the VLAN to the VLAN list, the tag merge tells the template to merge the data into an existing list (the default is to replace).
2. For every interface within that device, add the VLAN to the allowed VLANs and set the mode to `trunk`. The tag `nocreate` tells the template to not create the named interface if it does not exist

It is important to understand that every path in the template above refers to paths from the service model in `vlan.yang`.

Request NSO to reload the packages:

```cli
admin@ncs# packages reload
reload-result {
    package cisco-ios
    result true
}
reload-result {
    package vlan
    result true
}
```

Previously we started NCS with a `reload` package option, the above shows how to do the same without starting and stopping NSO.

We can now create services that will make things happen in the network. (Delete any dummy service from the previous step first). Create a VLAN service:

```cli
admin@ncs(config)# services vlan net-0 vlan-id 1234 device-if c0 \
                                 interface-type FastEthernet interface 1/0
admin@ncs(config-device-if-c0)# top
admin@ncs(config)# services vlan net-0 device-if c1 \
                                 interface-type FastEthernet interface 1/0
admin@ncs(config-device-if-c1)# top
admin@ncs(config)# show configuration
services vlan net-0
 vlan-id 1234
 device-if c0
  interface-type FastEthernet
  interface      1/0
 !
 device-if c1
  interface-type FastEthernet
  interface      1/0
 !
!
admin@ncs(config)# commit dry-run outformat native
native {
    device {
        name c0
        data interface FastEthernet1/0
              switchport trunk allowed vlan 1234
             exit
    }
    device {
        name c1
        data vlan 1234
             !
             interface FastEthernet1/0
              switchport trunk allowed vlan 1234
             exit
    }
}
admin@ncs(config)# commit
Commit complete.
```

When working with services in templates, there is a useful debug option for commit which will show the template and XPATH evaluation.

```cli
admin@ncs(config)# commit | debug
Possible completions:
 template   Display template debug info
 xpath      Display XPath debug info
admin@ncs(config)# commit | debug template
```

We can change the VLAN service:

```cli
admin@ncs(config)# services vlan net-0 vlan-id 1222
admin@ncs(config-vlan-net-0)# top
admin@ncs(config)# show configuration
services vlan net-0
 vlan-id 1222
!
admin@ncs(config)# commit dry-run outformat native
native {
    device {
        name c0
        data no vlan 1234
             vlan 1222
             !
             interface FastEthernet1/0
              switchport trunk allowed vlan 1222
             exit
    }
    device {
        name c1
        data no vlan 1234
             vlan 1222
             !
             interface FastEthernet1/0
              switchport trunk allowed vlan 1222
             exit
    }
}
```

It is important to understand what happens above. When the VLAN ID is changed, NSO can calculate the minimal required changes to the configuration. The same situation holds true for changing elements in the configuration or even parameters of those elements. In this way, NSO does not need explicit mapping to define a VLAN change or deletion. NSO does not overwrite a new configuration on the old configuration. Adding an interface to the same service works the same:

```cli
admin@ncs(config)# services vlan net-0 device-if c2 interface-type FastEthernet interface 1/0
admin@ncs(config-device-if-c2)# top
admin@ncs(config)# commit dry-run outformat native
native {
    device {
        name c2
        data vlan 1222
             !
             interface FastEthernet1/0
              switchport trunk allowed vlan 1222
             exit
    }
}
admin@ncs(config)# commit
Commit complete.
```

To clean up the configuration on the devices, run the delete command as shown below:

```cli
admin@ncs(config)# no services vlan net-0
admin@ncs(config)# commit dry-run outformat native
native {
    device {
        name c0
        data no vlan 1222
             interface FastEthernet1/0
              no switchport trunk allowed vlan 1222
             exit
    }
    device {
        name c1
        data no vlan 1222
             interface FastEthernet1/0
              no switchport trunk allowed vlan 1222
             exit
    }
    device {
        name c2
        data no vlan 1222
             interface FastEthernet1/0
              no switchport trunk allowed vlan 1222
             exit
    }
}
admin@ncs(config)# commit
Commit complete.
```

To make the VLAN service package complete edit the package-meta-data.xml to reflect the service model purpose. This example showed how to use template-based mapping. NSO also allows for programmatic mapping and also a combination of the two approaches. The latter is very flexible if some logic needs to be attached to the service provisioning that is expressed as templates and the logic applies device agnostic templates.

### Reactive FASTMAP and Nano Services <a href="#d5e1023" id="d5e1023"></a>

FASTMAP is the NSO algorithm that renders any service change from the single definition of the `create` service. As seen above, the template or code only has to define how the service shall be created, NSO is then capable of defining _any_ change from that single definition.

A limitation in the scenarios described so far is that the mapping definition could immediately do its work as a single atomic transaction. This is sometimes not possible. Typical examples are external allocation of resources such as IP addresses from an IPAM, spinning up VMs, and sequencing in general.

Nano services using Reactive FASTMAP handle these scenarios with an executable plan that the system can follow to provision the service. The general idea is to implement the service as several smaller (nano) steps or stages, by using reactive FASTMAP and provide a framework to safely execute actions with side effects.

The [examples.ncs/getting-started/netsim-sshkey](https://github.com/NSO-developer/nso-examples/tree/6.4/getting-started/netsim-sshkey) example implements key generation to files and service deployment of the key to set up network elements and NSO for public key authentication to illustrate this concept. The example is described in more detail in [Develop and Deploy a Nano Service](../../development/introduction-to-automation/develop-and-deploy-a-nano-service.md).

## Reconciling Existing Services <a href="#d5e1032" id="d5e1032"></a>

A very common situation when we wish to deploy NSO in an existing network is that the network already has existing services implemented in the network. These services may have been deployed manually or through another provisioning system. The task is to introduce NSO and import the existing services into NSO. The goal is to use NSO to manage existing services, and to add additional instances of the same service type, using NSO. This is a non-trivial problem since existing services may have been introduced in various ways. Even if the service configuration has been done consistently it resembles the challenges of a general solution for rendering a corresponding C-program from assembler.

One of the prerequisites for this to work is that it is possible to construct a list of the already existing services. Maybe such a list exists in an inventory system, an external database, or maybe just an Excel spreadsheet. It may also be the case that we can:

1. Import all managed devices into NSO.
2. Execute a full `sync-from` on the entire network.
3. Write a program, using Python/Maapi or Java/Maapi that traverses the entire network configuration and computes the services list.

The first thing we must do when we wish to reconcile existing services is to define the service YANG model. The second thing is to implement the service mapping logic and do it in such a way that given the service input parameters when we run the service code, they would all result in a configuration that is already there in the existing network.

The basic principles for reconciliation are:

1. Read the device configuration to NSO using the `sync-from` action. This will get the device configuration that is a result of any existing services as well.
2. Instantiate the services according to the principles above.

Performing the above actions with the default behavior would not render the correct reference counters since NSO did not create the original configuration. The service activation can be run with dedicated flags to take this into account. See the NSO User Guide for a detailed process.

## Brown-field Networks <a href="#d5e1052" id="d5e1052"></a>

In many cases, a service activation solution like NSO is deployed in parallel with existing activation solutions. It is then desirable to make sure that NSO does not conflict with the device configuration rendered from the existing solution.

NSO has a commit flag that will restrict the device configuration to not overwrite data that NSO did not create: `commit no-overwrite`

## Advanced Services Orchestration <a href="#d5e1057" id="d5e1057"></a>

Some services need to be set up in stages where each stage can consist of setting up some device configuration and then waiting for this configuration to take effect before performing the next stage. In this scenario, each stage must be performed in a separate transaction which is committed separately. Most often an external notification or other event must be detected and trigger the next stage in the service activation.

NSO supports the implementation of such staged services with the use of Reactive FASTMAP patterns in nano services.

From the user's perspective, it is not important how a certain service is implemented. The implementation should not have an impact on how the user creates or modifies a service. However, knowledge about this can be necessary to explain the behavior of a certain service.

In short the life-cycle of an RFM nano service in not only controlled by the direct create/set/delete operations. Instead, there are one or many implicit `reactive-re-deploy` requests on the service that are triggered by external event detection. If the user examines an RFM service, e.g. using `get-modification`, the device impact will grow over time after the initial create.

### Nano Service Plans <a href="#d5e1065" id="d5e1065"></a>

Nano services autonomously will do `reactive-re-deploy` until all stages of the service are completed. This implies that a nano service normally is not completed when the initial create is committed. For the operator to understand that a nano service has run to completion there must typically be some service-specific operational data that can indicate this.

Plans are introduced to standardize the operational data that can show the progress of the nano service. This gives the user a standardized view of all nano services and can directly answer the question of whether a service instance has run to completion or not.

A plan consists of one or many component entries. Each component consists of two or many state entries where the state can be in status `not-reached`, `reached`, or `failed`. A plan must have a component named `self` and can have other components with arbitrary names that have meaning for the implementing nano service. A plan component must have a first state named `init` and a last state named `ready`. In between `init` and `ready`, a plan component can have additional state entries with arbitrary naming.

The purpose of the `self` component is to describe the main progress of the nano service as a whole. Most importantly the `self` component last state named `ready` must have the status `reached` if and only if the nano service as a whole has been completed. Other arbitrary components as well as states are added to the plan if they have meaning for the specific nano service i.e. more specific progress reporting.

A `plan` also defines an empty leaf `failed` which is set if and only if any _state_ in any _component_ has a status set to `failed`. As such this is an aggregation to make it easy to verify if a RFM service is progressing without problems or not.

The following is an illustration of using the plan to report the progress of a nano service:

```cli
ncs# show vpn l3vpn volvo plan
NAME                    TYPE   STATE              STATUS       WHEN
------------------------------------------------------------------------------------
self                    self   init               reached      2016-04-08T09:22:40
                               ready              not-reached  -
endpoint-branch-office  l3vpn  init               reached      2016-04-08T09:22:40
                               qos-configured     reached      2016-04-08T09:22:40
                               ready              reached      2016-04-08T09:22:40
endpoint-head-office    l3vpn  init               reached      2016-04-08T09:22:40
                               pe-created         not-reached  -
                               ce-vpe-topo-added  not-reached  -
                               vpe-p0-topo-added  not-reached  -
                               qos-configured     not-reached  -
                               ready              not-reached  -
```

### Service Progress Monitoring <a href="#d5e1109" id="d5e1109"></a>

Plans were introduced to standardize the operational data that show the progress of reactive fastmap (RFM) nano services. This gives the user a standardized view of all nano services and can answer the question of whether a service instance has run to completion or not. To keep track of the progress of plans, Service Progress Monitoring (SPM) is introduced. The idea with SPM is that time limits are put on the progress of plan states. To do so, a policy and a trigger are needed.

A policy defines what plan components and states need to be in what status for the policy to be true. A policy also defines how long time it can be false without being considered jeopardized and how long time it can be false without being considered violated. Further, it may define an action, that is called in case of a policy being jeopardized, violated, or successful.

A trigger is used to associate a policy with a service and a component.

The following is an illustration of using an SPM to track the progress of an RFM service, in this case, the policy specifies that the self-components ready state must be reached for the policy to be true:

```cli
ncs# show vpn l3vpn volvo service-progress-monitoring
                                                               JEOPARDY                       VIOLATION           SUCCESS
NAME  POLICY         START TIME           JEOPARDY TIME        RESULT    VIOLATION TIME       RESULT     STATUS   TIME
---------------------------------------------------------------------------------------------------------------------------
self  service-ready  2016-04-08T09:22:40  2016-04-08T09:22:40  -         2016-04-08T09:22:40  -          running  -
```
