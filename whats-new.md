---
description: Latest features and enhancements added in this release.
icon: sparkles
---

# What's New

{% hint style="info" %}
Only significant new updates are listed here. To see the complete list of changes, refer to the [NSO Changelog Explorer](https://developer.cisco.com/docs/nso/changelog-explorer/?from=6.5\&to=6.6).
{% endhint %}

## Release Highlights

This release includes major enhancements in the following areas:

<details>

<summary> Filtering JSON-RPC <code>show_config</code> method</summary>

The `show_config` JSON-RPC method now supports filtering and pagination options for improved user experience when retrieving large list instances.

Documentation Updates:

* Added filtering and pagination parameters to `show_config`  documentation in [JSON-RPC API Data](development/advanced-development/web-ui-development/json-rpc-api.md#data).

</details>

<details>

<summary>Service Improvements</summary>

This NSO version introduces multiple quality of life improvements for service development:

* A device template can be converted to a service with the `/services/create-template` action.
* New `child-tags` and `inherit` XML template attributes simplify template operations, further described in [Template Operations](development/core-concepts/templates.md#ch_templates.operations).
* NSO warns if there are unused macros inside XML templates.
* New MAAPI call (`get_template_variables` / `ncsGetTemplateVariables`) enumerates variables in device, service, or compliance template.
* New MAAPI call (`get_trans_mode` / `getTransactionMode`) returns mode of the transaction, allowing, for example, easier reuse of existing transaction in an action.&#x20;
* Similar to Python API, Java API action callback now always provides an open transaction. If there is no existing transaction, a new read-only transaction is started automatically.
* Data kickers can now kick for the same transaction where they are defined when configured with a new `kick-on-creation` leaf.

</details>

<details>

<summary>Web Server Connection Limits</summary>

The NSO Web Server now has a configurable number of simultaneous connections. Additionally, the number of current connections can be monitored through the metrics framework.

&#x20;Documentation Updates:

* Documented a new `/ncs-config/webui/max-connections` parameter for the `ncs.conf` file.

</details>

<details>

<summary>Partial Service Reconciliation</summary>

Added support for reconciling only specific parts of a device configuration during service reconciliation using the new `include` and `exclude` parameters.

Documentation Updates:

* Added a [Partial Reconcile](development/advanced-development/developing-services/services-deep-dive.md#ch_svcref.partialreconcile) section to the Services Deep Dive chapter.

</details>

<details>

<summary>Changes to CDB Persistence Mode</summary>

From NSO 6.7, the default CDB persistence mode has been set to `on-demand-v1`, instead of the `in-memory-v1` mode, which has also been deprecated. If you're upgrading to NSO 6.7, the `on-demand-v1` mode will become the new default. Read more about the change in the documentation.

Documentation Updates:

* Updated the [CDB Persistence](administration/advanced-topics/cdb-persistence.md) section to reflect the new changes in the CDB persistence mode.

</details>

<details>

<summary>...</summary>



</details>
