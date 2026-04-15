---
description: Latest features and enhancements added in this release.
icon: sparkles
---

# What's New

{% hint style="info" %}
Only significant new updates are listed here. To see the complete list of changes, refer to the [NSO Changelog Explorer](https://developer.cisco.com/docs/nso/changelog-explorer/?from=6.6\&to=6.7).
{% endhint %}

## Release Highlights

This release includes major enhancements in the following areas:

<details>

<summary>Telemetry: Subscribing to Device Datastore Updates</summary>

Protocols, such as YANG-Push (RFC 8641), define a mechanism for applications to receive continuous updates of the target datastore, avoiding the need to frequently poll the remote system for latest data.

NSO 6.7 introduces native support for consuming NETCONF-based YANG-Push streams on managed devices, as well as the more general framework for managing and consuming subscribed updates. The latter allows NEDs to implement and expose the same kind of data updates by using other protocols, such as gRPC.

Documentation Updates:

* Added the [Telemetry](operation-and-usage/operations/nso-device-manager.md#telemetry) section documenting the new feature and potential use cases.
* Added the [Telemetry Kicker Concepts](development/advanced-development/kicker.md#telemetry-kicker-concepts) section on consuming telemetry data.
* Added an [example service](https://github.com/NSO-developer/nso-examples/tree/6.7/service-management/implement-a-service/iface-v6) making use of the YANG-Push to dynamically update service status.

</details>

<details>

<summary>Improved HA Transport</summary>

Raft- and rule-based HA now use a unified TLS transport for improved security and additional features:

* Rule-based HA deployment uses TLS certificates for authentication and encryption of communication between nodes, same as HA Raft.
* HA Raft leader monitors quorum and relinquishes the leader role if quorum is lost, aborting the hanging ongoing transactions. The leader also generates an alarm and releases resources, such as a shared VIP address or primary-listen ports.
* HA Raft now requires only a single listening port to be open for communication, port 4570 by default, same as rule-based HA. The port can be changed in the configuration if required.

Documentation Updates:

* Described the new transport requirements in [HA Raft](administration/management/high-availability.md#ug.ha.raft) and [Rule-based HA](administration/management/high-availability.md#ug.ha.builtin).
* Added a section on provisioning TLS certificates with the help of example scripts to [High Availability](administration/management/high-availability.md).

</details>

<details>

<summary>Changes to CDB Persistence Mode</summary>

From NSO 6.7, the default CDB persistence mode has been set to `on-demand-v1`, instead of the `in-memory-v1` mode, which has also been deprecated. If you're upgrading to NSO 6.7, the `on-demand-v1` mode will become the new default. Read more about the change in the documentation.

Documentation Updates:

* Updated the [CDB Persistence](administration/advanced-topics/cdb-persistence.md) section to reflect the new changes in the CDB persistence mode.

</details>

<details>

<summary>Updates to Multi-Factor Authentication Handling</summary>

MFA handling is now tied directly to the authentication method being attempted. When a method issues a challenge, NSO invokes the challenge handler associated with that method only. Package-based MFA is the preferred approach. The configuration option `/ncs-config/aaa/challenge-order` is deprecated and ignored at runtime; authentication flow is controlled solely by `/ncs-config/aaa/auth-order`.

Documentation Updates

* Updated the [Multi-Factor Authentication](administration/management/aaa-infrastructure.md#ug.aaa.external_challenge) documentation in [AAA Infrastructure](administration/management/aaa-infrastructure.md) to cover new changes.

</details>

<details>

<summary>Alarm Notification Filtering by Type</summary>

NSO 6.7 introduces `/alarms/control/filter-types` for suppressing outbound alarm notifications for selected alarm types. Matching alarms remain available in the NSO alarm list, but NSO no longer emits matching SNMP, NETCONF, or RESTCONF alarm notifications for them.

Documentation Updates:

* Updated [Alarm Manager](operation-and-usage/operations/alarm-manager.md).
* Updated [System Management](administration/management/system-management/).

</details>

<details>

<summary>OpenID Connect Support for Single Sign-On</summary>

The `cisco-nso-oidc-auth` package is now available as part of the NSO distribution, implementing OpenID Connect (OIDC) as an authentication protocol for Single Sign-On (SSO).

Documentation Updates:

* Documented the new authentication package in `$NCS_DIR/packages/auth/cisco-nso-oidc-auth/README.md`
* Added the [examples.ncs/aaa/oidc-auth](https://github.com/NSO-developer/nso-examples/tree/6.7/aaa/oidc-auth) example.

</details>
