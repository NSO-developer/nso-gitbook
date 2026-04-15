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

<summary>Improved HA Transport</summary>

Raft- and rule-based HA now use a unified TLS transport for improved security and additional features:

* Rule-based HA deployment uses TLS certificates for authentication and encryption of communication between nodes, same as HA Raft.
* HA Raft leader monitors quorum and relinquishes the leader role if quorum is lost, aborting the hanging ongoing transactions. The leader also generates an alarm and releases resources, such as a shared VIP address or primary-listen ports.
* HA Raft now requires only a single listening port to be open for communication, port 4570 by default, same as rule-based HA. The port can be changed in the configuration if required.

Documentation Updates:

* Described the new transport requirements in [#ug.ha.raft](administration/management/high-availability.md#ug.ha.raft "mention") and [#ug.ha.builtin](administration/management/high-availability.md#ug.ha.builtin "mention").
* Added a section on provisioning TLS certificates with the help of example scripts in [high-availability.md](administration/management/high-availability.md "mention").

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
