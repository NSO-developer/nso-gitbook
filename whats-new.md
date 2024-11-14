---
icon: sparkles
description: Latest features and enhancements added in this release.
---

# What's New

{% hint style="info" %}
Only significant new updates are listed here. To see the complete list of changes, refer to the [NSO Changelog Explorer](https://developer.cisco.com/docs/nso/changelog-explorer/?from=6.3\&to=6.4).
{% endhint %}

## Release Highlights

This release includes major enhancements in the following areas:

<details>

<summary><strong>Restructured Documentation</strong></summary>

NSO product documentation has undergone a major restructuring with the goal of improving the overall experience.

</details>

<details>

<summary><strong>New CDB On-Demand Mode</strong></summary>

NSO can now use a new CDB backend that uses RAM in a more traditional, cache-like manner instead of being a pure in-memory database. This mode better supports use cases with huge amounts of data in CDB, where CDB size exceeds available system memory, or instances where performance gains with in-memory mode are small enough to not justify longer initial startup time.

The additional benefit of this new persistence mode is greatly simplified operation, including an improved compaction process that runs entirely in the background without impacting ongoing requests.

Documentation Updates:

* Added a new section [CDB Persistence](administration/advanced-topics/cdb-persistence.md).
* Added a new example in `examples.ncs/misc/cdb-on-demand` to showcase this functionality.

</details>

<details>

<summary><strong>IPC Authentication</strong></summary>

NSO 6.4 introduces a more secure way for local Inter-Process Communication (IPC) between NSO system components based on Unix domain sockets. The main benefit of the new mechanism is the ability for the main server process to authenticate the clients. The authentication is based on the UID of the other end of the socket connection. In other words, it is now much easier to limit IPC access to specific host OS users.

Documentation Updates:

* Added a new section [UID-based Authentication for Unix Sockets](administration/management/aaa-infrastructure.md#uid-based-authentication-for-unix-sockets).
* Added a new example in `examples.ncs/security/ipc` to showcase this functionality.

</details>

<details>

<summary><strong>Improved Out-of-band Changes Handling</strong></summary>

The `commit no-overwrite` functionality has been extended to include verifying device values that are required to compute the end result (the values from the transaction read-set) have not changed. This means `commit no-overwrite` now provides much stronger guarantees about correctness in the face of device changes that were not made through NSO. In many cases, it translates into making provisioning pre-checks unnecessary and simplifying operations (operator no longer needs to issue a `check-sync` or `sync-from` operation beforehand).

</details>

<details>

<summary><strong>Package Template Structure</strong></summary>

NSO now supports structuring the package `templates` directory with subdirectories. The XML templates contained in the subdirectories can be referenced by prepending the subdirectory path and, optionally, by the package name and a colon.

This allows for unique identification of templates, which can now have duplicated names across NSO packages.

Documentation Updates:

* Updated the section on [Templates](development/core-concepts/templates.md).

</details>

<details>

<summary><strong>Web UI Updates</strong></summary>

The Web UI functionality has been extended to include new feature updates in device/SNMP Authgroups, service manager, and compliance reporting. The UI’s look-and-feel has also been enhanced further for a continued streamlined experience.

Documentation Updates:

* Added a new section [Authgroups](operation-and-usage/webui/devices.md#authgroups) in Devices.
* Improved and aligned the [Services](operation-and-usage/webui/services.md) section in accordance with the new Service Manager.
* Expanded the [Web UI](operation-and-usage/webui/) and [Compliance Reporting](operation-and-usage/webui/tools.md#sec.webui\_compliance) sections to add new details.

</details>

<details>

<summary><strong>Java API Improvement and Cleanup</strong></summary>

The NSO Java API has seen significant changes, such as introduction of SocketAddress-based methods, deprecating a number of older functions, and removal of previously deprecated functionality. For a full list, consult the release CHANGES file ([online version](https://developer.cisco.com/docs/nso/changelog-explorer/?from=6.3\&to=6.4\&component=java-api)).

</details>

<details>

<summary><strong>NSO Installer systemd Script Creation for System Install</strong></summary>

The NSO installer has been updated to, by default, provision a `systemd` system service when performing the initial NSO installation with the `--system-install` option.

Documentation Updates:

* Added `systemd`information to the [System Install](administration/installation-and-deployment/system-install.md#default-directories-and-scripts) section.

</details>

<details>

<summary><strong>Kubernetes Best Practices Guidelines</strong></summary>

A new [document](https://developer.cisco.com/docs/nso/) covering best practices for Kubernetes has been added to the documentation set.

</details>
