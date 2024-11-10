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

<summary>Restructured Documentation</summary>

NSO product documentation has undergone a major restructuring with the goal of improving the overall experience.

</details>

<details>

<summary>IPC Authentication</summary>

NSO 6.4 introduces a more secure way for local Inter-Process Communication (IPC) between NSO system components based on Unix domain sockets. The main benefit of the new mechanism is the ability for the main server process to authenticate the clients. The authentication is based on the UID of the other end of the socket connection. In other words, it is now much easier to limit IPC access to specific host OS users.

Documentation Updates:

* Added a new section [UID-based Authentication for Unix Sockets](administration/management/aaa-infrastructure.md#uid-based-authentication-for-unix-sockets).
* Added a new example in `examples.ncs/security/ipc` to showcase this functionality.

</details>

<details>

<summary>Improved Out-of-band Changes Handling</summary>

The `commit no-overwrite` functionality has been extended to include verifying device values that are required to compute the end result (the values from the transaction read-set) have not changed. This means `commit no-overwrite` now provides much stronger guarantees about correctness in the face of device changes that were not made through NSO. In many cases, it translates into making provisioning pre-checks unnecessary and simplifying operations (operator no longer needs to issue a `check-sync` or `sync-from` operation beforehand).

</details>

<details>

<summary>Package Template Structure</summary>

NSO now supports structuring the package `templates` directory with subdirectories. The XML templates contained in the subdirectories can be referenced by prepending the subdirectory path and, optionally, by the package name and a colon.

This allows for unique identification of templates, which can now have duplicated names across NSO packages.

Documentation Updates:

* Updated the section on [Templates](development/core-concepts/templates.md).

</details>

<details>

<summary>Web UI Updates</summary>

The Web UI functionality has been extended to include new feature updates in device/SNMP Authgroups, service manager, and compliance reporting. The UI’s look-and-feel has also been enhanced further for a continued streamlined experience.

Documentation Updates:

* Added a new section [Authgroups](operation-and-usage/webui/devices.md#authgroups) in Devices.
* Improved and aligned the [Services](operation-and-usage/webui/services.md) section in accordance with the new Service Manager.
* Expanded the [Web UI](operation-and-usage/webui/) and [Compliance Reporting](operation-and-usage/webui/tools.md#sec.webui\_compliance) sections to add new details.

</details>

<details>

<summary>Kubernetes Best Practices Guidelines</summary>

A new [document](https://developer.cisco.com/docs/nso/) covering best practices for Kubernetes has been added to the documentation set.

</details>
