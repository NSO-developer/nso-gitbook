---
icon: sparkles
description: Latest features and enhancements added in this release.
---

# What's New

{% hint style="info" %}
Only significant new updates are listed here. To see the complete list of changes, refer to the [NSO Changelog Explorer](https://developer.cisco.com/docs/nso/changelog-explorer/).
{% endhint %}

## Release Highlights

This release includes major enhancements in the following areas:

<details>

<summary><strong>HA Raft</strong></summary>

Introduced HA Raft, a consensus-based high-availability solution. HA Raft is based on the Raft algorithm and provides secure and durable state replication with robust automatic cluster management.

Documentation Updates:

* Added a new section [NSO HA Raft](administration/management/high-availability.md#ug.ha.raft) with comprehensive documentation on this new feature.

</details>

<details>

<summary><strong>CDB Compaction</strong></summary>

Compaction improvements have been made to schedule periodic compaction and disable compaction on start.

Documentation Updates:

* Added a new section [Compaction](administration/advanced-topics/compaction.md) to describe automatic and manual compaction. A new `ncs` command option `--disable-compaction-on-start` added to disable compaction on start.
* Added a new section [Periodic Compaction](development/connected-topics/scheduler.md#ug.sc.compaction) to include scheduling of NSO compaction during low utilization periods.
* Updated the Manual Pages, [NCS man-pages Volume 5](man/section5.md) to add a new configuration parameter `ncs-config/compaction/delayed-compaction-timeout`.

</details>

<details>

<summary><strong>Containerized NSO</strong></summary>

It is now possible to run NSO in a container runtime, such as Docker. A pre-built image is available for download from software.cisco.com.

Documentation Updates:

* Added a new guide [Containerized NSO](administration/installation-and-deployment/containerized-nso.md) describing how to run NSO in a containerized environment, such as Docker.

</details>

<details>

<summary><strong>NED Packages</strong></summary>

NED packages can now be added to the system without triggering a package reload/service outage.

Documentation Updates:

* Added a new section [Adding NED Packages](administration/management/package-management.md#ug.package_mgmt.ned_package_add) to guide how to add new NED packages without triggering a service outage. Updated also the [NED Migration](administration/management/package-management.md#ug.package_mgmt.ned_migration) and [Upgrade](administration/installation-and-deployment/upgrade-nso.md) sections.

</details>

<details>

<summary><strong>AAA</strong></summary>

NSO authentication mechanism has been improved to include Single Sign-on and package authentication.

Documentation Updates:

* Added a new section [Package Authentication](administration/management/aaa-infrastructure.md#ug.aaa.packageauth) to describe the NSO package authentication mechanism.

- Added a new section [Single Sign-on](development/advanced-development/web-ui-development/#single-sign-on-sso) to describe the NSO package authentication mechanism.

</details>

<details>

<summary><strong>Compliance Reporting</strong></summary>

The device, service, and template checks now run in parallel across the CPU cores in the system while utilizing less memory by streaming the report to disk instead of building the report in memory. Compliance templates can check devices for compliance. In addition, strict mode checks that the template configuration is the only configuration on the device. Reports can now be generated in `sqlite` format, which will produce an SQLite database file as the output of a report run.

Documentation Updates:

* Added a new section called [Additional Configuration Checks](operation-and-usage/operations/compliance-reporting.md#additional-configuration-checks).

</details>

<details>

<summary><strong>Deprecating RFM in Favor of Nano Services</strong></summary>

Updates in documentation to promote using nano services over Reactive FastMAP.

Documentation Updates:

* Updated the section [Developing NSO Services](development/core-concepts/implementing-services.md) to include new content and an example to promote using nano services to implement Reactive FASTMAP (RFM) based applications. Also updated the [Kicker](development/advanced-development/kicker.md) section.

</details>

<details>

<summary><strong>Progress Trace</strong></summary>

The progress trace framework has been improved to add the concepts of spans and links.

* A span represents a unit of work or operation that occurs over a span of time.
* A link is a reference to another span event and can be used to find related events.

Documentation Updates:

* Updated the section [Progress Trace](development/advanced-development/progress-trace.md).

</details>

<details>

<summary><strong>Phased Provisioning</strong></summary>

NSO now provides Phased Provisioning as a support tool to schedule provisioning tasks. Phased Provisioning gives you more fine-grained control over how and when changes are introduced into the network.

Documentation Updates:

* Updated the NSO [Platform Tools](https://nso-docs.cisco.com/resources) documentation to include Cisco NSO Phased Provisioning.

</details>

<details>

<summary><strong>Observability Exporter</strong></summary>

NSO Observability Exporter package allows Cisco NSO to export observability-related data using software-industry-standard formats and protocols, such as the OpenTelemetry protocol (OTLP).

Documentation Updates:

* Updated the NSO [Platform Tools](https://nso-docs.cisco.com/resources) documentation to include Cisco NSO Observability Exporter.

</details>
