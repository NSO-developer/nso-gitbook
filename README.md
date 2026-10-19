---
description: Latest features and enhancements added in this release.
icon: sparkles
---

# What's New

{% hint style="info" %}
Only significant new updates are listed here. To see the complete list of changes, refer to the [NSO Changelog Explorer](https://developer.cisco.com/docs/nso/changelog-explorer/?from=6.7\&to=6.8).
{% endhint %}

## Release Highlights

This release includes major enhancements in the following areas:

<details>

<summary>Fancy Feature</summary>

Yada yada.

Documentation Updates:

* Added the [Telemetry](operation-and-usage/operations/nso-device-manager.md#telemetry) section documenting the new feature and potential use cases.
* Added the [Telemetry Kicker Concepts](development/advanced-development/kicker.md#telemetry-kicker-concepts) section on consuming telemetry data.
* Added an [example service](https://github.com/NSO-developer/nso-examples/tree/6.7/service-management/implement-a-service/iface-v6) making use of the YANG-Push to dynamically update service status.

</details>

<details>

<summary>Improved <code>systemd</code> Integration</summary>

The NSO systemd service now starts NSO in foreground mode, allowing systemd to monitor the `ncs.smp` process directly and restart it after an unexpected failure. The service also uses improved startup logic that allows long-running model upgrade to complete without timing out.

Documentation Updates:

* Updated the \[System Install]\(administration/installation-and-deployment/system-install.md) section with the new behavior.

</details>
