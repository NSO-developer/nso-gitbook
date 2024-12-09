---
description: Frequently Asked Questions on NSO.
---

# FAQs

## Problems Solved <a href="#problems-solved-1" id="problems-solved-1"></a>

<details>

<summary>What are the key functions of NSO?</summary>

Unlike other configuration managers on the market, NSO focuses not only on reading but also on writing deep fine-grained configurations to the network. NSO provides configuration management for both devices and network services. Any detailed parameter can be changed and NSO will generate the minimum configuration changes to the devices (not the entire config files).

NSO applies distributed transactions to all network changes. That is, if there is an error on any device when committing a change to the network, none of the other devices in that [transaction will be changed](faqs.md#what-is-unique-about-the-way-that-nso-manages-transactions). This includes non-transactional devices like CLI and SNMP. When NSO writes the configuration changes it is capable of generating any reverse operations to keep the network and NSO in a consistent state (these reverse operations are stored in rollback files).

</details>

<details>

<summary>When does it make financial sense to purchase NSO?</summary>

Cisco research and customer experience shows 50-70% cost savings can be achieved within Service & Network Ops using NSO and model driven orchestration. Connect with your Cisco representative to get more information about how NSO can help your operations.

</details>

## General NSO Configuration Management Principles <a href="#general-nso-configuration-management-principles-1" id="general-nso-configuration-management-principles-1"></a>

<details>

<summary>Which types of network devices can NSO manage?</summary>

Any device that can be remotely configured can be managed by NSO. This includes routers, switches, load balancers, firewalls, web servers, and a whole host of other devices (both virtual and physical). Since it is not limited to one type of device or particular vendor, NSO allows for the management of the entire network from a single pane of glass.

</details>

<details>

<summary>How does NSO handle interfaces to devices?</summary>

The device interfaces are managed by NSO Network Element Drivers (NEDs) and the accompanying toolkit. Cisco provides NEDs to Juniper, Cisco, Alcatel-Lucent, Ericsson, A10, F5, Brocade, HP, Huawei, and others. Additional NEDs can be ordered from Cisco or developed by end-customers and integrators.

As part of the support contract, Cisco will support any device upgrades with the same NED functionality.

</details>

<details>

<summary>Can customers change the Network Element Driver?</summary>

In theory, customers can create or enhance Network Element Drivers, NEDs, since the NED source (YANG, etc.) and developer guide come with the system.

But in practice, there should be no need for a customer to do so.

If a customer chooses to create or enhance a NED, this will mean that:

* The NED cannot be supported by Cisco TAC.
* The upgrade path to official NED versions will break.

The only time customer development of NEDs should be considered is:

* In case of emergency.
* For one-off devices/systems.

However, it is always advised to use a qualified partner to create or enhance a NED.

</details>

<details>

<summary>Can NSO orchestrate VNFs according to ETSI NFV MANO Specification?</summary>

NSO with the NFVO package is an ETSI-compliant implementation of NFV orchestration. The Cisco NFVO is designed to enable easy integration with Specialized-VNFMs by offering a flexible interface or “dock” into which a third-party VNFM can be integrated without having to make changes to the NFV-O itself. Cisco Elastic Services Controller, a multi-vendor VNFM, is integrated via this interface to provide a full NFV orchestration platform.

</details>

<details>

<summary>How does NSO deal with different software versions of a device?</summary>

When NSO connects to a device it discovers the device version and the appropriate data model version. The NSO Web interface, CLI, database, and APIs are version-aware, so the correct model will be used. When committing changes to the network, a user can choose different strategies (require all devices to support all changes or skip changes to devices not supporting them). The network engineer using NSO does not have to keep device versions in mind, NSO resolves all of this.

</details>

<details>

<summary>Can NSO validate configurations?</summary>

Yes, NSO supports deep fine-grain configuration validations. Validations can be applied to both devices and services. Validation constraints can be added at run-time to specify uniqueness, dependencies between configuration items and devices, and more.

Some examples of validations include:

* All URLs must be unique.
* All devices should have a management interface m0 with status up.
* The MTU for ATM interfaces must be between 64 and 17966.

</details>

<details>

<summary>What happens if NSO is temporarily down or unreachable?</summary>

NSO can reconcile any configuration change that happened out-of-band and allows a network engineer to determine which configuration is correct.

</details>

<details>

<summary>Can NSO do service configuration?</summary>

Absolutely! NSO is typically used for provisioning network services like VPNs, ACLs, BGP Peers, etc. It is of great value to have one product and one embedded database that provisions services and device configurations as one atomic transaction.

NSO supports fine-grained service updates: the user can change any aspect of a service and NSO will calculate the resulting minimum device configuration changes. NSO automatically cleans up the network when services are deleted.

NSO can also perform network audits to detect if any device configuration has changed with respect to the desired service configuration. The diff can be displayed and analyzed and the service can be re-deployed if needed.

</details>

<details>

<summary>Can NSO do compliance reporting?</summary>

NSO has built-in support for compliance reporting that will check that all devices and services are configured as expected. It also shows details for any discrepancies, such as a misconfigured VPN on an interface. The report also includes details about all changes that have been performed in the network.

</details>

<details>

<summary>Why don't we have NED roadmaps?</summary>

Any NED supports the features that have been used by previous customers and POCs for that NED. No customer should expect any NED to be "complete" and cover all possible use cases for the managed device. NEDs are developed incrementally as and when needed. There is also no NED roadmap. This is possible because of the extremely short turnaround times for NEDs and NED enhancements. This is beneficial to everyone. From a customer perspective, they will get the NEDs and NED features that they require for when they need them. The question "Does NED x support feature y or OS version x?" becomes moot - the answer is yes - if it is required then it will, provided that the customer has purchased the NED, that they have a current support agreement, that the request is for "normal" use of the managed device (i.e. a configuration use case that is not extremely customer specific), and that the NED team can access devices for test purposes, which may require access to devices in the customer's network.

The normal SWSS contract covers NEDs purchased from the price list and entitles access to all future versions of the NEDs. They can request enhancements to the NEDs, via the account team, as per the NED request process specified in the NED index slides on DevNet and Field Portal, and we will deliver these at no additional cost, provided that the enhancements represent reasonably mainstream use of the managed devices, and can be added without adverse impact on other customers. NED enhancements will normally be delivered within 2-6 weeks after we have received the required data regarding the configuration use cases and commands, depending on the volume and complexity of the enhancements, and also sometimes on being able to access the customer devices in the cases where device/OS versions and features are not available in our labs.

</details>

<details>

<summary>How long does it take to introduce new Service models?</summary>

Introducing new service types (VPN, Firewall Policies, etc.) into NSO Service models usually takes a matter of days. As with devices, services are defined by data models. Once a new service model is created, it can automatically be loaded and used for new service instances.

</details>

## Vendor-Specific Device Management <a href="#vendor-specific-device-management-1" id="vendor-specific-device-management-1"></a>

<details>

<summary>How does NSO configure Juniper devices?</summary>

The Juniper NED, with a complete JunOS Schema, is available for purchase. Upgrades are managed by reading the JunOS schema from the upgraded device and the NSO toolkit will re-render all the NSO functions from the newly read JunOS schema, including the user interfaces and the database schema.

</details>

<details>

<summary>How does NSO configure Cisco devices?</summary>

Multiple Cisco CLI NEDs are available for purchase, for IOS (IOS XE), NX-OS, IOS -XR and others. The NEDs include YANG data models representing subsets of the devices’ configuration. From these data models, NSO renders Cisco CLI sequences and parses CLI outputs without any code. This means that adding support for new commands is a matter of adding the command to the model. Furthermore, the model covers dependencies so NSO can generate commands and roll-backs.

</details>

<details>

<summary>How does NSO configure SNMP Devices?</summary>

NSO can load SNMP MIBs and generate configuration commands directly from the MIBs. Before loading the MIBs an integrator can annotate the MIB with ordering dependencies so that a user does not need to know that a certain variable needs to have a certain value before changing another variable, which is common in SNMP. NSO also handles table relationships automatically. NSO allows for transaction-based management of SNMP devices. The NSO diff-engine can generate the reverse operations to reach the previous state, thus supporting roll-backs also of SNMP devices.

</details>

## Transactions and roll-backs <a href="#transactions-and-roll-backs-1" id="transactions-and-roll-backs-1"></a>

<details>

<summary>What is unique about the way that NSO manages transactions?</summary>

NSO does not just fire off commands to the network but rather confirms that all changes in the transaction are deployed correctly at the device level. If at any point of the series a device cannot be changed, the entire transaction is automatically roll-backed. This ensures that there is always a consistent network state. Complex rollback scenarios like the correct ordering of CLI commands are handled. The NSO database, the services and the devices configurations are all part of the same transaction.

Users can load network-wide rollback files to undo network changes.

</details>

<details>

<summary>How can NSO do network transactions over non-transactional devices like those supporting SNMP and CLI?</summary>

NSO performs any configuration change as a diff operation against the current configuration. If a device does not support rollbacks, NSO can use the diff engine to calculate the diff between current state and the previous state before the configuration change is applied. NSO knows the capabilities for different network devices and will issue a config change or just a rollback command depending on the network device capabilities. The data models for the devices specify dependencies explicitly as directed references – this ensures that NSO knows in which order to create and delete items.

</details>

<details>

<summary>How many roll-backs do you keep?</summary>

That is up to the user of NSO – it is configurable.

</details>

## Usability <a href="#usability-1" id="usability-1"></a>

<details>

<summary>How can a network engineer work with NSO?</summary>

Most network engineers are hard-core CLI users. NSO is the only product on the market that is designed with the network engineer in mind. NSO provides a network-wide CLI to a multi-vendor network. As a real-time abstraction of the network, it doesn’t matter which access methods are used, the network is [always in a consistent state](faqs.md#what-are-the-key-functions-of-nso). Some of our customers use NSO for network automation by hooking it into their workflow systems, while at the same time having the CLI access for network engineers to quickly review and approve changes to device configurations.

</details>

<details>

<summary>How does NSO support different user categories?</summary>

NSO supports different interfaces for different users with different needs and skills:

* CLI for power users.
* Web interface for ad-hoc users.
* Programmable interfaces: REST, scripting, Java, JavaScript.

</details>

<details>

<summary>Can NSO do dry-run and what-if scenarios?</summary>

Before a transaction is committed, a user can inspect the actual effect on the network in two ways:

* `Compare running brief` – this will show the difference between the desired configuration and the current configuration.
* `Dry-run` – this will also involve any service provisioning logic and show the resulting device configurations.

</details>

<details>

<summary>What are the training requirements for NSO?</summary>

Limited training is required to get started. NSO is designed to be user-friendly to network engineers by providing common tools that they are already familiar using, such as a CLI and a Web interface.

</details>

<details>

<summary>How complex is it to install NSO?</summary>

NSO installs in seconds. There are no third-party requirements.

</details>

## The Cisco NSO Difference <a href="#the-cisco-nso-difference-1" id="the-cisco-nso-difference-1"></a>

<details>

<summary>Does NSO provide a centralized configuration database?</summary>

The NSO-embedded configuration database and transaction engine are at the heart of the product. Whenever an NSO user changes a device or service configuration this change is applied as [one single transaction](faqs.md#transactions-and-roll-backs-1) including the NSO database as well as the devices. This means that the database will always represent the true state of the network. In case of out-of-band configurations, boot-strap scenarios, etc., NSO supports synchronization and comparison tools.

The database is an integral part of NSO, so schemas and database administration are managed automatically without requiring a database administrator.

The database can be imported, exported, and queried using XML, XPath, and the CLI and Web interfaces. Programmatic interfaces to the database are also provided.

</details>

<details>

<summary>How does NSO compare to other Configuration Management tools?</summary>

If you look at the marketing material, there seems to be a lot of configuration management tools on the market. However, when you dig into the actual functionality available for writing configurations to the devices, it is disappointing. The practice for these kinds of tools is to push and pull configuration files, store them, diff them, and restore them. This works fine for static environments. The above tools do not actually understand the configurations, they treat them as opaque text files.

NSO on the other hand understands the configurations and represents them as fine-grained data structures in the embedded configuration database. Thereby NSO can provide configuration-aware tools like the CLI, configuration validation, an auto-rendered web interface, etc. And most importantly NSO can do real-time fine-grained changes rather than diffing and pulling configuration files.

NSO can also do [service provisionin](faqs.md#can-nso-do-service-configuration)g.

Some vendors have fantastic tools for managing their specific devices. This works great if you have a single-vendor network. However, single-vendor networks are rare.

</details>

<details>

<summary>How does NSO compare with Service Activation tools?</summary>

NSO has unique features to ensure shorter time-to-market and lower cost of ownership than any other service activation tools on the market.

There are several stove-pipe activation tools (single-vendor, single service-type) that work very well for that specific vendor or service type. Service activation with these tools breaks down when a service requires different vendors or multiple service types. NSO is capable of handling multiple service types for multi-vendor networks.

NSO is unique in the way it communicates with the devices. Many activation tools require device “adaptors” that are custom-coded and expensive to maintain. The [NSO Network Element Driver (NED) technology](faqs.md#how-does-nso-handle-interfaces-to-devices) makes device integration simple.

Another difference is that NSO applies transactions to the activation chain. Many other activation tools are workflow-centric, which makes it very hard to recover from faults, and in many cases, they escape to manual work orders.

NSO also provides detailed knowledge of the device configurations: it can make sure that the service instance is consistent with the actual device configuration. NSO provides a network and service CLI as a power tool for network engineers. The visibility of the activation chain, using the CLI, service dry-run, etc, helps the network engineers trust the tool (this is harder to do with tools that just provide a magic OK button).

</details>

## Integration, Support, and Hardware requirements <a href="#integration-support-and-hardware-requirements-1" id="integration-support-and-hardware-requirements-1"></a>

<details>

<summary>Does NSO support OpenStack?</summary>

The Havanna release of OpenStack introduced an NSO Mechanism Driver that maps the OpenStack Neutron network model changes to NSO REST calls. NSO can then map these changes to a multi-vendor network.

</details>

<details>

<summary>What type of database does NSO require?</summary>

NSO ships with an [embedded special-purpose database](faqs.md#does-nso-provide-a-centralized-configuration-database), so no external database server is needed.

</details>

<details>

<summary>Which northbound interfaces does NSO support?</summary>

The following interfaces are auto-rendered for all services and devices:

* CLI: for network engineers that prefer a Juniper or Cisco-style command-line interface.
* Web interface: for network engineers that prefer a graphical interface.
* REST: for programmatic access (exactly the same feature set as the CLI and Web interface).
* Java/C: for building custom applications and service provisioning logic.
* JavaScript: for embedding NSO functions in portals.
* NETCONF: for importing and exporting XML configurations.
* SNMP: for reading status and receiving NSO alarms.
* Python: for scripting network-wide configuration changes.

</details>

<details>

<summary>Does NSO support XML import and export?</summary>

NETCONF is an XML-based protocol. So by using the northbound NETCONF interface configuration data as well as operational data can be imported and exported. The NSO database has XML import and export tools.

</details>

<details>

<summary>Does NSO support syslog?</summary>

NSO supports generating BSD and RFC 5424 Syslog messages.

</details>

<details>

<summary>Which logs does NSO generate?</summary>

Developer logs, audit trail logs, web interface logs, device communication logs, and XPath logs.

</details>

<details>

<summary>Does NSO support AAA?</summary>

NSO contains a rich AAA engine that spans all interfaces. NSO supports role-based access control lists providing different access privileges to different users. These privileges may apply to a group of devices, or to individual devices, or to any subset of any device configuration. External authentication can be used via the Pluggable Application Module (PAM).

</details>

<details>

<summary>How does NSO guarantee high Availability?</summary>

NSO can be configured to run in HA mode: one master and several slaves. All slaves are updated at every transactional border. The slaves can be used for reading data. The slaves are hot-standby and a fail-over to a slave can be made at any time. In the clustered solution described above, each cluster node is typically a HA configuration.

</details>

<details>

<summary>What is the typical hardware requirement?</summary>

NSO requires a standard Unix box

* Medium (< 1000 devices): 4 Core CPU and 32 GB RAM.
* Large (> 1000 devices): 8 Core CPU and 64 BG RAM.
* Linux/x86 – Linux/x86 64.
* MacOS 10.6/x86 64.

</details>

## NFV and SDN <a href="#nfv-and-sdn-1" id="nfv-and-sdn-1"></a>

<details>

<summary>How does NSO relate to NFV and SDN?</summary>

In the NFV architecture NSO, with the NSO NFVO component, fulfills the NFV orchestrator (NFVO) role, and also partially replaces the EMS/OSS layer. The Tail-f NSO architecture enables it to act as the central orchestrator and has the ability to control both SDN Controllers and NFV Managers. Tail-f NSO interfaces to SDN Controllers and NFV Managers via Network Equipment Drivers (NEDs). Similar to packages, NEDs are decoupled from the Tail-f NSO product and have their own release cycle enabling agile feature growth.

</details>
