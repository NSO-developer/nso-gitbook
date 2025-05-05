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

Added new `ncs.conf` configuration to modify read-set and write-set size limits for transaction checkpoints.

Documentation Updates:

* Added a new [transaction checkpoint limits](development/core-concepts/nso-concurrency-model.md#automatic-retries-) section to the [NSO Concurrency Model](development/core-concepts/nso-concurrency-model.md) chapter.

</details>

<details>

<summary>NSO Runs as Non-root User in Cisco Containers</summary>

NSO is now installed with the `--run-as-user` option for build and production containers to run NSO from the non-root `nso` user that belongs to the `nso` user group.

Documentation Updates:

* Added a new [NSO Runs from a Non-Root User](whats-new.md#nso-runs-as-non-root-user-in-cisco-containers) section to the [Containerized NSO](administration/installation-and-deployment/containerized-nso.md) chapter.

</details>

<details>

<summary>Support for RFC 8650 (YANG-Push over RESTCONF)</summary>

Implemented support for RFC 8650, "Dynamic Subscription to YANG Events and Datastores over RESTCONF." This update enables subscribed notifications and Yang-Push functionality for RESTCONF. For more details, refer to RFC 8650 and the NSO documentation. Note that subtree filtering and JSON format are not yet supported and are planned for a future release.

Documentation Updates:

* Added a new section, [Dynamic Subscriptions](development/core-concepts/northbound-apis/restconf-api.md#dynamic-subscriptions), in the RESTCONF API documentation.

</details>

<details>

<summary>Enhanced Support for Frontend URL Redirection Behind Nginx Reverse Proxy</summary>



</details>

<details>

<summary>Connection Setup Logging for Erlang SSH Client</summary>



</details>

<details>

<summary>Compliance Templates Checks for Operational Data</summary>

Support has been added in compliance templates to read the live status of devices. This feature is optional and requires opting in. To activate this functionality, NEDs must be recompiled using the new ncsc flag `--ncs-with-operational-compliance`.&#x20;

Documentation Updates:

* Updated the [Compliance Reporting](operation-and-usage/operations/compliance-reporting.md#device-live-status-checks) section in Operation and Usage to add new details about live-status checks.

</details>

<details>

<summary>Compliance Processing Tags Enhancement</summary>

This release introduces new compliance template enhancements:

* A new `allow-empty` tag allows empty nodes to be considered compliant. Configurations that do not match will still fail.
* Support for enabling or disabling strict mode on parts of a compliance template. The `strict` tag can now be applied to sub-trees, allowing fine-grained control over strict compliance checking.

Updated Documentation:

* Updated the [Compliance Reporting](operation-and-usage/operations/compliance-reporting.md#additional-template-functionality) section in Operation and Usage to add new details about the tags.

</details>

<details>

<summary>Support XML strings as Input to <code>shared_set_values</code> in Python API</summary>



</details>

<details>

<summary>Display Dry-run Output and Prompt before Committing</summary>



</details>

<details>

<summary> Template Creation Enhancements</summary>

Added and extended support for generating templates based on device configuration structures:

* New Action: `/devices/create-template` enables creation of device templates from user-defined config paths.
* Extended Action: `/compliance/create-template` now supports generating compliance templates from specified config paths.
* New Action: `/services/create-template` allows creation of service templates and infers a resource-facing service model from config path structures. Outputs include the template and service model, optionally exportable as a service package.

Documentation Updates:

* Updated the [Device Manager](operation-and-usage/operations/nso-device-manager.md#generating-device-templates-from-configuration), [Templates](development/core-concepts/templates.md#ch_templates.templatize), and [Compliance Reporting](operation-and-usage/operations/compliance-reporting.md#device-configuration-checks) sections to add new details about this functionality.

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

<summary>Enhanced Device Auto-Configuration with Improved Reliability</summary>

The device auto-configure feature in NSO is now more robust and reliable, with enhanced retry mechanisms to handle common deployment challenges. This update ensures smoother and more successful device onboarding in a wider range of network environments.

* Automatic Retry on Failure: The auto-configure process now automatically retries in scenarios where:
  * The device requires a commit operation before configuration can be copied.
  * The device is unreachable.
  * Concurrent auto-configuration processes are running for other devices.
* Granular Control: New global settings under `/devices/global-settings/auto-configure` allow administrators to fine-tune the retry behavior, controlling the number of attempts and the interval between them.
* Proactive Alerting: A new `auto-configure-failed` alarm is raised when the maximum number of retry attempts is exhausted, providing immediate notification of persistent auto-configuration failures.

</details>

<details>

<summary>Unified Label for Commit</summary>



</details>

<details>

<summary>Improved NED <code>migrate</code> Action Report for Changes to Node Constraints</summary>



</details>

<details>

<summary>Support for OpenSSL 3.0</summary>

NSO has added support for OpenSSL 3.0 in this release. The Cisco SSL library in this regard has been updated to version 3.0.15.8.0.221 (ciscossl-3.0.15.8.0.221).

</details>

<details>

<summary>Improved Execution of Configuration Changes on a Subset of Devices</summary>



</details>
