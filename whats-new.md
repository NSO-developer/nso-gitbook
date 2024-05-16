---
description: Latest features and enhancements added in this release.
---

# What's New

{% hint style="info" %}
Only significant new updates are listed here. To see the complete list of changes, refer to the [NSO Changelog Explorer](https://developer.cisco.com/docs/nso/changelog-explorer/).
{% endhint %}

## Release Highlights <a href="#d5e42" id="d5e42"></a>

This release includes major enhancements in the following areas:

<details>

<summary>Web UI Improvements</summary>

The web-based management interface has been improved to streamline user experience with a modernized look and feel and usability improvements in certain areas, such as device management.&#x20;

Documentation Updates:

* Expanded and improved the [Web UI](operation-and-usage/webui/) documentation to add more information.&#x20;

</details>

<details>

<summary>Device Management Improvements</summary>

Devices now support `auto-configure` and `rename` actions to assist with the initial onboarding as well as the renaming of devices. Additionally, the listing of services, that have modified a device, has been improved and now includes Nano service zombies using a new `/devices/device/services/service` list.

Documentation Updates:

* Added new sections, "Auto-configuring Devices in NSO" and "Renaming Devices in NSO".&#x20;

</details>

<details>

<summary>Support for Linux/arm64 Platform</summary>

Binaries for the Linux OS on the arm64 architecture are now available for download from the Cisco [Software Download](https://software.cisco.com/download/home) site.

Documentation Updates:

* Updated system requirements in the Installation ([Local Install](administration/deployment/local-install.md), [System Install](administration/deployment/system-install.md)) and [Containerized NSO](administration/deployment/containerized-nso.md) sections.&#x20;

</details>

<details>

<summary>Platform Tools Packages</summary>

A number of additional packages are now bundled with the NSO installer binary. These are optional packages that can be added to the NSO instance and were previously distributed separately.

Documentation Updates:

* Expanded the [Installation](administration/deployment/#d5e46-1) section with information on additional bundled packages.

</details>

<details>

<summary>Improved Services Documentation</summary>

The service development documentation has been improved and expanded, allowing for a more gradual introduction to service concepts.

Documentation Updates:

* Replaced the old Services section with a new [Implementing Services](development/development/developing-services/implementing-services.md) section, which builds on top of [Developing a Simple Service](development/development/developing-services/creating-a-service.md) with additional fundamental service functionality.
* Replaced the old Services section with a new [Services Deep Dive](development/development/developing-services/services-deep-dive.md) section, which serves as a service development reference, including best practices, known limitations, and an in-depth explanation of specific FASTMAP features.
* Substantially revised and improved the [Templates](development/development/templates.md) section.

</details>

<details>

<summary>Observability Improvements for Distributed Deployments</summary>

NETCONF and RESTCONF APIs now support the propagation of standards-based Trace Context to aid distributed tracing.

Documentation Updates:

* For NETCONF, added documentation on [the section called “Trace Context”](https://developer.cisco.com/docs/nso-guides-6.3/the-nso-netconf-server/#ug.netconf\_agent.trace\_context) in Northbound APIs.
* For RESTCONF, added documentation on [the section called “Trace Context”](https://developer.cisco.com/docs/nso-guides-6.3/the-restconf-api/#ncs.northbound.restconf.trace\_context) in Northbound APIs.

</details>

<details>

<summary>JSON Metadata Support</summary>

NSO now supports RFC-7952-encoded metadata, as well as setting metadata when using JSON data encoding.

Documentation Updates:

* Expanded [_The RESTCONF API_ ](https://developer.cisco.com/docs/nso-guides-6.3/the-restconf-api)in Northbound APIs with details on metadata handling.

</details>

<details>

<summary>RESTCONF Data Filtering</summary>

Added the "exclude" query parameter support to the GET RESTCONF method that excludes a subtree from the returned output.

Documentation Updates:

* Expanded [the section called “Query Parameters”](https://developer.cisco.com/docs/nso-guides-6.3/the-restconf-api/#ncs.northbound.restconf.query\_params) in Northbound APIs with details and an example of "exclude" usage.

</details>

<details>

<summary>Other Notable Highlights</summary>

* Improved YANG 1.1 support: Allow type `empty` in list keys and unions, as well as improve the handling of unions of enumerations.
* Implement alarms for certificate expiry: The functionality now covers all certificates in use by NSO.
* Automatic migration of templates: Migrating a device to a new NED ID will trigger a copy of the device and compliance templates for the old NED ID to the new NED ID (unless the template already contains configuration for the new NED ID).
* Faster upgrades: The performance of the CDB upgrade process has been significantly improved by utilizing more parallelization.
* `ncs.conf` management: `ncs.conf` file can now use environment variable references and parts of the file can be placed in separate configuration files in the `ncs.conf.d` sub-directory, next to the `ncs.conf` file.

For a full list of changes, refer to the [online changelog](https://developer.cisco.com/docs/nso/changelog-explorer/?from=6.2\&to=6.3).

</details>



## Alarms Descriptions

Design 1: separate expandable for each alarm.

<details>

<summary><code>abort-error</code></summary>

* **Initial Perceived Severity**\
  Major
* **Description**\
  An error happened while aborting or reverting a transaction. The device's configuration is likely to be inconsistent with the NCS CDB.
* **Recommended Action**\
  Inspect the configuration difference with compare-config, and resolve conflicts with sync-from or sync-to if any.
* **Alarm message(s):**&#x20;
  * `Device {dev} is locked`
  * `Device {dev} is southbound locked`
  * `abort error`
* **Clear condition(s)**\
  If NCS achieves sync with the device or receives a transaction ID for a netconf session towards the device, the alarm is cleared.

</details>

Design 2: Will probably need a separate table for every item to keep alarms separate.&#x20;

<table data-header-hidden data-full-width="true"><thead><tr><th width="247"></th><th></th></tr></thead><tbody><tr><td><strong>Alarm Identity</strong></td><td><code>abort-error</code></td></tr><tr><td><strong>Initial Perceived Severity</strong></td><td>Major</td></tr><tr><td><strong>Description</strong></td><td>An error happened while aborting or reverting a transaction. The device's configuration is likely to be inconsistent with the NCS CDB.</td></tr><tr><td><strong>Recommended Action</strong></td><td>Inspect the configuration difference with compare-config, and resolve conflicts with sync-from or sync-to if any.</td></tr><tr><td><p></p><p><strong>Alarm message(s)</strong></p></td><td><p></p><ul><li><code>Device {dev} is locked</code></li><li><code>Device {dev} is southbound locked</code></li><li><code>abort error</code></li></ul></td></tr><tr><td><strong>Clear condition(s)</strong></td><td>If NCS achieves sync with the device or receives a transaction ID for a netconf session towards the device, the alarm is cleared.</td></tr></tbody></table>

## Log Formats

Design 1: will probably need a separate table to keep logs separated from each other.&#x20;

|                   |                                                                                                                 |
| ----------------- | --------------------------------------------------------------------------------------------------------------- |
| **Symbol**        | `AAA_LOAD_FAIL`                                                                                                 |
| **Severity**      | `CRIT`                                                                                                          |
| **Comment**       | Failed to load the AAA data, it could be that an external db is misbehaving or AAA is mounted/populated badly.  |
| **Format String** | `"Failed to load AAA: ~s"`                                                                                      |

Design 2: if looks OK on publish site (not too congested) then can be like this.

<table data-full-width="true"><thead><tr><th>Symbol</th><th>Severity</th><th>Comment</th><th>Format String</th></tr></thead><tbody><tr><td><code>AAA_LOAD_FAIL</code></td><td><code>CRIT</code></td><td>Failed to load the AAA data, it could be that an external db is misbehaving or AAA is mounted/populated badly. </td><td><code>"Failed to load AAA: ~s"</code></td></tr><tr><td><code>ABORT_CAND_COMMIT</code></td><td><code>INFO</code></td><td>Aborting candidate commit, request from user, reverting configuration.</td><td><code>"Aborting candidate commit, request from user, reverting configuration."</code></td></tr></tbody></table>
