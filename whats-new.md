---
description: Latest features and enhancements added in this release.
icon: sparkles
---

# What's New

{% hint style="info" %}
Only significant new updates are listed here. To see the complete list of changes, refer to the [NSO Changelog Explorer](https://developer.cisco.com/docs/nso/changelog-explorer/?from=6.3\&to=6.4).
{% endhint %}

## Release Highlights

This release includes major enhancements in the following areas:

<details>

<summary>Brownfield Service Protection and Out-of-band Changes</summary>

NSO now supports a new `confirm-network-state` commit mode for improved interoperation in the face of out-of-band changes. Using this commit mode, it is now possible to avoid provisioning pre-checks and pre-provisioning sync-from operations, even if there are out-of-band changes on NSO-managed devices.

Additionally, NSO introduces support for policy-defined handling of configuration data that overlaps with NSO-configured services. This eases coexistence with other systems and protects already provisioned services from unwanted modification.

Documentation Updates:

* Added a new section called [Out-of-band Interoperation](operation-and-usage/operations/out-of-band-interoperation.md).

</details>

<details>

<summary>Web Server Hostname Matching</summary>

NSO supports serving web traffic from multiple domains and IP addresses. This functionality is configured by `server-name` and `server-alias` settings in the `ncs.conf` file. In addition, the web server refuses to serve requests to other domain names and addresses by default, in order to not expose the system to redirect-related attacks. This functionality can be disabled, but that is strongly discouraged.

</details>

<details>

<summary>FIPS Support for NSO Installs</summary>

In NSO 6.5, we are introducing support for installing NSO in a [FIPS](https://www.nist.gov/itl/publications-0/federal-information-processing-standards-fips)-compliant mode. With this update, you can now install (or upgrade) NSO in the usual standard mode or in a more targeted FIPS mode to meet the specific crypto requirements of the FIPS 140-3 standard in your organization. Bear in mind that FIPS mode targets a very specific use case and should only be used in FIPS-restricted setups. For most installs, the standard mode is the way to go.

Be advised as well that Cisco's FIPS support is currently limited only to installer-based setups and not available on Cisco-provided containers, but you do have the option to pursue a FIPS-compliant container setup independently.

Documentation Updates:

* Updated the [Installation and Deployment](administration/installation-and-deployment/) sections to add new details about installing and upgrading NSO in a FIPS-compliant setup. Specific details are covered in the sections for [System Install](administration/installation-and-deployment/system-install.md), [Local Install](administration/installation-and-deployment/local-install.md), and [Upgrade NSO](administration/installation-and-deployment/upgrade-nso.md).

</details>

<details>

<summary>Continued Enhancements in the NSO Web UI</summary>

This release brings more improvements to extend the design and functionality of the NSO Web UI. This time, we have implemented substantial new updates in the Web UI tools, namely the Package Manager (now called Packages), Alarms, and Compliance Reporting. More specifically:

* The Packages tool now benefits from an all-new design coherent with Cisco's design philosophy. It also includes new feature updates to handle package management in the Web UI in a more detailed and appealing manner.
* The Alarms tool now offers a vastly updated design as well as improved functionality to handle NSO alarms. Users will see enhancements in the information and options to interact with alarms.
* New improvements have also been made in the Compliance Reporting tool to offer more visual details via graphs in report results.

Documentation Updates:

* Updated the Web UI's Tools section to document new updates in the [Packages](operation-and-usage/webui/tools.md#d5e6487), [Alarms](operation-and-usage/webui/tools.md#d5e6565), and [Compliance Reporting](operation-and-usage/webui/tools.md#sec.webui_compliance) sections.

</details>

<details>

<summary>Configurable Size Limits for Transaction Checkpoints</summary>



</details>

<details>

<summary>Run NSO as Non-root User in Cisco Containers</summary>



</details>

<details>

<summary>Support for RFC 8650 (YANG-Push over RESTCONF)</summary>



</details>

<details>

<summary>URL Redirection Behind Nginx Reverse Proxy</summary>



</details>

<details>

<summary>Connection Setup Logging for Erlang SSH Client</summary>



</details>

<details>

<summary>Compliance Templates for Operational Data</summary>



</details>

<details>

<summary>Compliance Processing Tags</summary>



</details>

<details>

<summary>Support XML strings as Input to <code>shared_set_values</code> in Python API</summary>



</details>

<details>

<summary>Display Dry-run Output and Prompt before Committing</summary>



</details>

<details>

<summary>Methods for Template Creation</summary>



</details>

<details>

<summary>Support for Efficient Stream-parsing of JSON</summary>



</details>

<details>

<summary>Support for SFTP as Standardised File Transfer Protocol for SCP Action</summary>



</details>

<details>

<summary>Limit Devices in Actions by XPath</summary>



</details>

<details>

<summary>Retries for Auto-configure</summary>



</details>

<details>

<summary>Unified Label for Commit</summary>



</details>

<details>

<summary>Improved NED <code>migrate</code> Action Report for Changes to Node Constraints</summary>



</details>

<details>

<summary>Support for OpenSSL 3.0</summary>



</details>

<details>

<summary>Improved Execution of Configuration Changes on a Subset of Devices</summary>



</details>
