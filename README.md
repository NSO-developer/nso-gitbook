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

<summary>Southbound Datastore Subscriptions</summary>

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

<summary>Compliance XML Templates</summary>

A new type of compliance template is introduced: compliance template specified as an XML file, that lives as part of a package or individually, under a dedicated load-directory.

The new template has enhanced flexibility by the use of processing instructions, similar to a service template. It supports more sophisticated use cases by allowing for easier integration with multiple NED-IDs and incorporating conditional if-else statements.

Additionally, compliance reports can now re-check the violating items when used with the `re-run` action.

Documentation Updates:

* Added a new section [XML Compliance Templates](operation-and-usage/operations/compliance-reporting.md#xml-compliance-templates) to [Compliance Reporting](operation-and-usage/operations/compliance-reporting.md).

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

Documentation Updates:

* Updated the [Multi-Factor Authentication](administration/management/aaa-infrastructure.md#ug.aaa.external_challenge) documentation in [AAA Infrastructure](administration/management/aaa-infrastructure.md) to cover new changes.

</details>

<details>

<summary>Secure Local IPC</summary>

NSO now uses a more secure, Unix-domain-sockets-based IPC by default. It is used for internal communication between NSO server components.

Built-in components use this IPC mechanism automatically but Java and Python code in custom packages might need an update, depending on the SDK functions used for establishing connection to the NSO. See e.g. [Java API Overview](development/core-concepts/api-overview/java-api-overview.md) for example code using local IPC for connections.

Documentation Updates:

* Updated [IPC Connection](administration/advanced-topics/ipc-connection.md) and [Authenticating IPC Access](administration/management/aaa-infrastructure.md#authenticating-ipc-access) with the new default.
* Updated code snippets throughout the documentation to use the new IPC mechanism where applicable.

</details>

<details>

<summary>Alarm Notification Filtering by Type</summary>

NSO 6.7 introduces `/alarms/control/filter-types` for suppressing outbound alarm notifications for selected alarm types. Matching alarms remain available in the NSO alarm list, but NSO no longer emits matching SNMP, NETCONF, or RESTCONF alarm notifications for them.

Documentation Updates:

* Updated [Alarm Manager](operation-and-usage/operations/alarm-manager.md).
* Updated [System Management](administration/management/system-management/).

</details>

<details>

<summary>Service Bulk Actions</summary>

To facilitate operation at scale, with many service instances of differing type, bulk `check-sync`, `re-deploy`, and `un-deploy` actions were added under `/services`. These action invoke the corresponding service-management action on a number of service instances, such as all services of a given type or matching an XPath expression.

Documentation Updates:

* Added section [Bulk Service Actions](operation-and-usage/operations/managing-network-services.md#bulk-service-actions) in [Manage Network Services](operation-and-usage/operations/managing-network-services.md).
* Added section [Bulk Service Actions](operation-and-usage/operations/lifecycle-operations.md#bulk-service-actions) in [Lifecycle Operations](operation-and-usage/operations/lifecycle-operations.md).

</details>

<details>

<summary>Dry-run Drift Detection</summary>

The new feature helps prevent unintended changes from being committed. If there are additional changes introduced between `commit dry-run` and the final `commit`, the system warns and prompts the user on how to proceed. Dry-run drift detection is available in NSO CLI and JSON-RPC.

Documentation Updates:

* Added section [Dry-run Drift Detection](operation-and-usage/operations/lifecycle-operations.md#dry-run-drift-detection) in [Lifecycle Operations](operation-and-usage/operations/lifecycle-operations.md).

</details>

<details>

<summary>Memory Monitoring</summary>

NSO 6.7 tracks additional memory metrics, which can be used to detect memory trends or take corrective action, such as a debug dump or raising an alarm.

Documentation Updates:

* Updated [Containerized NSO](administration/installation-and-deployment/containerized-nso.md) and [System Install](administration/installation-and-deployment/system-install.md) with the recommended Memory Monitoring setup.

</details>

<details>

<summary>OpenID Connect Support for Single Sign-On</summary>

The `cisco-nso-oidc-auth` package is now available as part of the NSO distribution, implementing OpenID Connect (OIDC) as an authentication protocol for Single Sign-On (SSO).

Documentation Updates:

* Documented the new authentication package in `$NCS_DIR/packages/auth/cisco-nso-oidc-auth/README.md`
* Added the [examples.ncs/aaa/oidc-auth](https://github.com/NSO-developer/nso-examples/tree/6.7/aaa/oidc-auth) example.

</details>

<details>

<summary>Improve <code>live-status</code> Reads with Read Intent</summary>

Reading device's `live-status` data can trigger individual requests to the device when requested data is not cached. The new read-intent set of functions gives a MAAPI user an option to announce the need for required data before-hand, allowing NSO to optimize device roundtrips.

Documentation Updates:

* Added Fetch bulk live-status via MAAPI to [Java API Overview](development/core-concepts/api-overview/java-api-overview.md) and [Python API Overview](development/core-concepts/api-overview/python-api-overview.md).

</details>

<details>

<summary>Web UI Redesign and Enhancements</summary>

This release introduces a new **Transactions** view in the NSO Web UI, along with a redesigned **Configuration Editor** for a more streamlined configuration experience. It also includes general updates across the Web UI and documentation.\
\
Documentation Updates:

* Added a new [**Transactions**](operation-and-usage/webui/transactions.md) page to the Web UI documentation.
* Updated the [**Config Editor**](operation-and-usage/webui/config-editor.md) page to align with new changes.
* Updated the Web UI documentation for general improvements.

</details>
