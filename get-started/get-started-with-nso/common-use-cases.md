---
description: Common use cases for NSO.
layout:
  title:
    visible: true
  description:
    visible: true
  tableOfContents:
    visible: true
  outline:
    visible: true
  pagination:
    visible: false
---

# Common Use Cases

<table><thead><tr><th width="215">Use Case</th><th>Description</th></tr></thead><tbody><tr><td><strong>NSO for Device Turnup</strong></td><td><p>Simplify the deployment of a new device (e.g., a router). Construct and deliver the initial (day 1) config for the device, reducing the manual effort required and reducing the risk of errors.</p><p></p><p>NSO has configuration templates for the different device types and roles, and it takes the device-specific parameters for that device and applies them to the appropriate template. The engineer can choose to preview the config before it is sent to the device if desired. NSO then sends the configuration to the device and has the ability to save the config, reboot the device, etc. NSO can manage multiple devices in one operation and retry any failures.</p></td></tr><tr><td><strong>NSO for NFV Orchestration</strong></td><td><p>Orchestrate the lifecycle of a virtual service. Create, modify, repair, and delete virtualized services on customer demand, within minutes or seconds.</p><p></p><p>NSO has a Network Service Descriptor (NSD) for each virtualized service that describes each Virtual Network Function (VNF) that makes up the virtual service and how the VNFs are chained together. NSO uses the NFV Orchestrator (NFVO) NSO Package to control a VNF Manager such as Cisco's Elastic Services Controller (ESC) and Virtual Infrastructure Managers (VIMs) such as OpenStack and vSphere.</p></td></tr><tr><td><strong>NSO for SD-WAN Orchestration</strong></td><td><p>Orchestrate the lifecycle of SD-WAN services, including Cisco iWAN (Intelligent WAN). Create, modify, repair, and delete SD-WAN services on customer demand within minutes or seconds.</p><p>NSO creates, modifies, repairs, and deletes SD-WAN hubs and branches for Service Provider customers.</p><p></p><p>For Cisco iWAN services, NSO uses the IWAN and vBranch Function Packs. These have built-in service definitions to match the Cisco Validated Design (CVD) for iWAN. Both physical and virtual branch sites are supported.</p><p></p><p>For other SD-WAN services, NSO has NEDs for solutions from Versa, Silverpeak, ODL, and others.</p></td></tr><tr><td><strong>NSO for ACL Management</strong></td><td><p>Simplify the management of Access Control Lists (ACLs) across network devices. Update ACLs on multiple devices on demand, ensuring security policies are applied consistently across the entire infrastructure.</p><p></p><p>NSO has service models corresponding to the desired security policies and generates ACLs matching the desired policy. Policies are translated into the exact syntax needed for the specific vendors and devices and delivered to the device using the appropriate NED.</p></td></tr><tr><td><strong>NSO for QoS Management</strong></td><td><p>Simplify the management of QoS shaping and policing rules on network devices. Update policy maps on demand, ensuring that QoS policies are applied correctly and consistently across the entire infrastructure.</p><p></p><p>Only the QoS parameters (bandwidth, etc.) have to be entered, and NSO has service models that generate the exact syntax needed for the specific vendors and devices. These are delivered to the device using the appropriate NED.</p></td></tr><tr><td><strong>NSO as a Power Tool for Network Engineers</strong></td><td>Use NSO's higher-level CLI to control network devices. Network Engineers interact with NSO's service models instead of directly with the device CLI. This greatly reduces the amount of CLI that must be entered and enables all devices in a multi-vendor network to be controlled using the same CLI syntax. Engineers can choose their preferred CLI syntax (e.g., Cisco or Juniper), and the NSO NEDs ensure that the right CLI is used for each device.</td></tr><tr><td><strong>NSO for Config Audit</strong></td><td>With NSO, you can ensure that device configurations conform to network-wide rules, ensuring that the entire network is correctly configured. NSO has configuration templates matching "golden configs" for the various device types and roles. NSO gets the latest running-config from each device and performs a config audit, comparing the config to the templates. Any deviations are flagged for correction.</td></tr><tr><td><strong>NSO for OS Upgrade</strong></td><td><p>Perform bulk upgrades of devices from a central location. The new OS (e.g., IOS, StarOS) is delivered to a set of devices in bulk, e.g., within a maintenance window.</p><p></p><p>NSO sends the update to the device and can save the config, reboot the device, etc. NSO can manage multiple devices in one operation and retry any failures.</p></td></tr></tbody></table>

## NSO for Device Turnup <a href="#nso-for-device-turnup" id="nso-for-device-turnup"></a>

Simplify the deployment of a new device (e.g., a router). Construct and deliver the initial (day 1) config for the device, reducing the manual effort required and reducing the risk of errors.\
NSO has configuration templates for the different device types and roles, and it takes the device-specific parameters for that device and applies them to the appropriate template. The engineer can choose to preview the config before it is sent to the device if desired. NSO then sends the configuration to the device and has the ability to save the config, reboot the device, etc. NSO can manage multiple devices in one operation and retry any failures.

## NSO for NFV Orchestration <a href="#nso-for-nfv-orchestration" id="nso-for-nfv-orchestration"></a>

Orchestrate the lifecycle of a virtual service. Create, modify, repair, and delete virtualized services on customer demand, within minutes or seconds.

NSO has a Network Service Descriptor (NSD) for each virtualized service that describes each Virtual Network Function (VNF) that makes up the virtual service and how the VNFs are chained together. NSO uses the NFV Orchestrator (NFVO) NSO Package to control a VNF Manager such as Cisco's Elastic Services Controller (ESC) and Virtual Infrastructure Managers (VIMs) such as OpenStack and vSphere.

## NSO for SD-WAN Orchestration <a href="#nso-for-sd-wan-orchestration" id="nso-for-sd-wan-orchestration"></a>

Orchestrate the lifecycle of SD-WAN services, including Cisco iWAN (Intelligent WAN). Create, modify, repair, and delete SD-WAN services on customer demand within minutes or seconds.

NSO creates, modifies, repairs, and deletes SD-WAN hubs and branches for Service Provider customers.

For Cisco iWAN services, NSO uses the IWAN and vBranch Function Packs. These have built-in service definitions to match the Cisco Validated Design (CVD) for iWAN. Both physical and virtual branch sites are supported.

For other SD-WAN services, NSO has NEDs for solutions from Versa, Silverpeak, ODL, and others.

## NSO for ACL Management <a href="#nso-for-acl-management" id="nso-for-acl-management"></a>

Simplify the management of Access Control Lists (ACLs) across network devices. Update ACLs on multiple devices on demand, ensuring security policies are applied consistently across the entire infrastructure.

NSO has service models corresponding to the desired security policies and generates ACLs matching the desired policy. Policies are translated into the exact syntax needed for the specific vendors and devices and delivered to the device using the appropriate NED.

## NSO for QoS Management <a href="#nso-for-qos-management" id="nso-for-qos-management"></a>

Simplify the management of QoS shaping and policing rules on network devices. Update policy maps on demand, ensuring that QoS policies are applied correctly and consistently across the entire infrastructure.

Only the QoS parameters (bandwidth, etc.) have to be entered, and NSO has service models that generate the exact syntax needed for the specific vendors and devices. These are delivered to the device using the appropriate NED.

## NSO as a Power Tool for Network Engineers <a href="#nso-as-a-power-tool-for-network-engineers" id="nso-as-a-power-tool-for-network-engineers"></a>

Use NSO's higher-level CLI to control network devices. Network Engineers interact with NSO's service models instead of directly with the device CLI. This greatly reduces the amount of CLI that must be entered and enables all devices in a multi-vendor network to be controlled using the same CLI syntax. Engineers can choose their preferred CLI syntax (e.g., Cisco or Juniper), and the NSO NEDs ensure that the right CLI is used for each device.

## NSO for Config Audit <a href="#nso-for-config-audit" id="nso-for-config-audit"></a>

With NSO, you can ensure that device configurations conform to network-wide rules, ensuring that the entire network is correctly configured. NSO has configuration templates matching "golden configs" for the various device types and roles. NSO gets the latest running-config from each device and performs a config audit, comparing the config to the templates. Any deviations are flagged for correction.

## NSO for OS Upgrade <a href="#nso-for-os-upgrade" id="nso-for-os-upgrade"></a>

Perform bulk upgrades of devices from a central location. The new OS (e.g., IOS, StarOS) is delivered to a set of devices in bulk, e.g., within a maintenance window.

NSO sends the update to the device and can save the config, reboot the device, etc. NSO can manage multiple devices in one operation and retry any failures.
