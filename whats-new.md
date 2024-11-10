---
description: Latest features and enhancements added in this release.
icon: sparkles
---

# What's New

{% hint style="info" %}
Only significant new updates are listed here. To see the complete list of changes, refer to the [NSO Changelog Explorer](https://developer.cisco.com/docs/nso/changelog-explorer/?from=6.2\&to=6.3).
{% endhint %}

## Release Highlights <a href="#d5e42" id="d5e42"></a>

This release includes major enhancements in the following areas:

<details>

<summary><strong>Web UI Improvements</strong></summary>

The web-based management interface has been improved to streamline user experience with a modernized look and feel. Also, usability improvements have been made in certain areas, such as device management.

Documentation Updates:

* Expanded and improved the [Web UI](operation-and-usage/webui/) documentation to cover usage instructions.

</details>

<details>

<summary><strong>Device Management Improvements</strong></summary>

Devices now support `auto-configure` and `rename` actions to assist with the initial onboarding as well as the renaming of devices. Additionally, the listing of services, that have modified a device, has been improved and now includes Nano service zombies using a new `/devices/device/services/service` list.

Documentation Updates:

* Added new sections [Auto-configuring Devices in NSO](operation-and-usage/operations/nso-device-manager.md#user\_guide.devicemanager.auto-configuring-devices) and [Renaming Devices in NSO](operation-and-usage/operations/nso-device-manager.md#renaming-devices-in-nso).

</details>

<details>

<summary><strong>Support for Linux/arm64 Platform</strong></summary>

Binaries for the Linux OS on the arm64 architecture are now available for download from the Cisco [Software Download](https://software.cisco.com/download/home) site.

Documentation Updates:

* Updated system requirements in the Installation ([Local Install](administration/installation-and-deployment/local-install.md), [System Install](administration/installation-and-deployment/system-install.md)) and [Containerized NSO](administration/installation-and-deployment/containerized-nso.md) sections.

</details>

<details>

<summary><strong>Platform Tools Packages</strong></summary>

A number of additional packages are now bundled with the NSO installer binary. These are optional packages that can be added to the NSO instance and were previously distributed separately.

Documentation Updates:

* Expanded the [Installation](administration/installation-and-deployment/) section with information on additional bundled packages.

</details>

<details>

<summary><strong>Improved Services Documentation</strong></summary>

The service development documentation has been improved and expanded, allowing for a more gradual introduction to service concepts.

Documentation Updates:

* Replaced the old Services section with a new [Implementing Services](development/core-concepts/implementing-services.md) section, which builds on top of [Developing a Simple Service](development/introduction-to-automation/creating-a-service.md) with additional fundamental service functionality.
* Replaced the old Services section with a new [Services Deep Dive](development/advanced-development/developing-services/services-deep-dive.md) section, which serves as a service development reference, including best practices, known limitations, and an in-depth explanation of specific FASTMAP features.
* Substantially revised and improved the [Templates](development/core-concepts/templates.md) section.

</details>

<details>

<summary><strong>Observability Improvements for Distributed Deployments</strong></summary>

NETCONF and RESTCONF APIs now support the propagation of standards-based Trace Context to aid distributed tracing.

Documentation Updates:

* For NETCONF, added documentation on [Trace Context](development/core-concepts/northbound-apis/#trace-context) in Northbound APIs.
* For RESTCONF, added documentation on [Trace Context](development/core-concepts/northbound-apis/#trace-context-1) in Northbound APIs.

</details>

<details>

<summary><strong>JSON Metadata Support</strong></summary>

NSO now supports RFC-7952-encoded metadata, as well as setting metadata when using JSON data encoding.

Documentation Updates:

* Expanded the [RESTCONF API](development/core-concepts/northbound-apis/#the-restconf-api) in Northbound APIs with details on metadata handling.

</details>

<details>

<summary><strong>RESTCONF Data Filtering</strong></summary>

Added the `exclude` query parameter support to the GET RESTCONF method that excludes a subtree from the returned output.

Documentation Updates:

* Expanded the section [Query Parameters](development/core-concepts/northbound-apis/#ncs.northbound.restconf.query\_params) in Northbound APIs with details and an example of `exclude` usage.

</details>

<details>

<summary><strong>Other Notable Highlights</strong></summary>

* Improved YANG 1.1 support: Allow type `empty` in list keys and unions, as well as improve the handling of unions of enumerations.
* Implement alarms for certificate expiry: The functionality now covers all certificates in use by NSO.
* Automatic migration of templates: Migrating a device to a new NED ID will trigger a copy of the device and compliance templates for the old NED ID to the new NED ID (unless the template already contains configuration for the new NED ID).
* Faster upgrades: The performance of the CDB upgrade process has been significantly improved by utilizing more parallelization.
* `ncs.conf` management: `ncs.conf` file can now use environment variable references and parts of the file can be placed in separate configuration files in the `ncs.conf.d` sub-directory, next to the `ncs.conf` file.

</details>
