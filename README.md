---
icon: paper-plane
description: NED documentation.
cover: .gitbook/assets/gb-cover-final.png
coverY: 0
layout:
  cover:
    visible: true
    size: hero
  title:
    visible: true
  description:
    visible: true
  tableOfContents:
    visible: true
  outline:
    visible: true
  pagination:
    visible: true
---

# Cisco-provided NED Documentation
**Cisco NSO (Network Services Orchestrator) NEDs (Network Element Drivers)** are software components that enable Cisco NSO to communicate with and configure network devices from different vendors using their native CLI, NETCONF, RESTCONF, or other proprietary interfaces.
NEDs translate the NSO service models into device-specific commands, allowing NSO to manage multi-vendor networks efficiently. 

## NSO NED Administration
See the NSO Administration Guide to [learn about Cisco-provided NEDs and how to manage them](https://cisco-tailf.gitbook.io/nso-docs/guides/administration/management/ned-administration).

## The NED `README.md` File
Each NED package comes with a `README.md` file that provides essential documentation and details, including:

1. **Overview of the NED**  
   - A brief introduction to the NED, including its supported device types and software versions.

2. **Installation Instructions**  
   - Steps for installing and configuring the NED in Cisco NSO.

3. **Supported Interfaces and Protocols**  
   - Specifies whether the NED supports CLI, NETCONF, RESTCONF, or other management protocols.

4. **Feature Support List**  
   - Lists supported commands, configurations, and features for the device.

5. **Limitations and Known Issues**  
   - Any constraints, unsupported features, or known bugs related to the NED.

6. **Usage Instructions**  
   - Example commands, data models, and guidelines on how to interact with the NED.

7. **Upgrade and Compatibility Information**  
   - Details on how to upgrade the NED and which Cisco NSO versions it is compatible with.

8. **Licensing and Support Information**  
   - Guidelines on licensing requirements and where to get support.

## Cisco NSO NED Changelog Explorer
The [NED Changelog Explorer](https://developer.cisco.com/docs/nso/ned-changelog-explorer/) allows you to quickly search for changes when upgrading to a specific NED version. This information is also available in the CHANGES file, packaged with each NSO NED release.

