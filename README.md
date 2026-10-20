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

* Updated the [System Install](administration/installation-and-deployment/system-install.md) section with the new behavior.

</details>

<details>

<summary>Richer NACM Device Group Support</summary>

A re-implemented NETCONF Access Control Model (NACM) extension in NSO makes it possible to scope NACM rules to a model path and one or more device groups. For example, it is now possible to write a ruleset that allows some modifications to a device, but not others, for all devices in a device group.

Documentation Updates:

* Described supported usage in the [AAA Infrastructure](administration/management/aaa-infrastructure.md).

</details>

<details>

<summary>Nano Services Updates</summary>

NSO 6.8 introduces additional progress trace events when nano service execution is blocked waiting on a pre-condition, action invocation, or similar. This feature provides better insight into nano service state and simplifies troubleshooting.

Furthermore, the system now waits for outstanding commit queue items before marking nano service provisioning as completed (reaching the `self/ready` state), helping callers ensure changes are propagated to network devices.

Documentation Updates:

* Updated the [Nano Services](development/core-concepts/nano-services.md) documentation.

</details>

<details>

<summary>Post-Quantum Cryptography Support</summary>

NSO adds support for Post-Quantum Cryptography (PQC) to help guard against "store now, decrypt later" attacks with future quantum computers, including:

* Implementation of post-quantum key exchange and signature algorithms, such as `mlkem768x25519-sha256` and `ML-DSA`
* Offering PQC algorithms for northbound TLS and SSH connections
* Use of PQC algorithms southbound for built-in NETCONF client and NEDs

The NED framework now uses the Apache MINA library in order to enable PQC support.

Documentation Updates:

* Added the new algorithms to [???](development/core-concepts/nano-services.md).

</details>
