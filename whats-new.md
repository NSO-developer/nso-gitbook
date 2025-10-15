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

<summary>High Availability and Compliance Reporting Updates in Web UI</summary>

NSO 6.6 features a redesigned and extended High Availability (HA) Web UI component. The new component makes it easier to access HA cluster status and perform cluster maintenance operations for either HA Raft or rule-based HA. NSO 6.6 also brings new improvements in the Compliance Reporting tool to manage creation of compliance templates.

Documentation Updates:

* Updated and extended the [High Availability](operation-and-usage/webui/tools.md#d5e6538) section of [Web UI Tools](operation-and-usage/webui/tools.md).
* Updated the [Compliance Reporting](operation-and-usage/webui/tools.md#sec.webui_compliance) section of [Web UI Tools](operation-and-usage/webui/tools.md).

</details>

<details>

<summary>Python Virtual Environment Support</summary>

It is now possible to define virtual environment (venv) for a Python-based package, in order to isolate Python package dependencies, simplifying NSO package upgrades.

Documentation Updates:

* Added a Virtual Environment section to [NSO Python VM](development/core-concepts/nso-virtual-machines/nso-python-vm.md).

</details>

<details>

<summary> Filtering JSON-RPC <code>show_config</code> method</summary>

The `show_config` JSON-RPC method now supports filtering and pagination options for improved user experience when retrieving large list instances.

Documentation Updates:

* Added filtering and pagination parameters to `show_config`  documentation in [JSON-RPC API Data](development/advanced-development/web-ui-development/json-rpc-api.md#data).

</details>

<details>

<summary>Improved YANG Schema Management</summary>

NSO 6.6 comes with improvements to the way YANG schema is stored and loaded, reducing load time and memory footprint with deduplication and parallel loading. The Java API also takes advantage of the new schema format, which allows loading schema data from a local memory-mapped file.

</details>

<details>

<summary>Service Improvements</summary>

This NSO version introduces multiple quality of life improvements for service development:

* A device template can be converted to a service with the `/services/create-template` action.

- New `child-tags` and `inherit` XML template attributes simplify template operations, further described in [Template Operations](development/core-concepts/templates.md#ch_templates.operations).

* NSO warns if there are unused macros inside XML templates.

- New MAAPI call (`get_template_variables` / `ncsGetTemplateVariables`) enumerates variables in device, service, or compliance template.
- New MAAPI call (`get_trans_mode` / `getTransactionMode`) returns mode of the transaction, allowing, for example, easier reuse of existing transaction in an action.&#x20;
- Similar to Python API, Java API action callback now always provides an open transaction. If there is no existing transaction, a new read-only transaction is started automatically.
- Data kickers can now kick for the same transaction where they are defined when configured with a new `kick-on-creation` leaf.

</details>

<details>

<summary>Web Server Connection Limits</summary>

The NSO Web Server now has a configurable number of simultaneous connections. Additionally, the number of current connections can be monitored through the metrics framework.

&#x20;Documentation Updates:

* Documented a new `/ncs-config/webui/max-connections` parameter for the `ncs.conf` file.

</details>

<details>

<summary>Updated Example NEDs</summary>

Network Element Drivers (NEDs) used throughout the [NSO examples](https://github.com/NSO-developer/nso-examples) have been updated to include recent versions of the device models. The new models more closely resemble those in production NEDs, which makes examples more realistic and supports additional real-world scenarios.

Note that these NEDs are still example NEDs and are not designed for production use.

</details>

<details>

<summary>Improved Rule-based HA Package Sync</summary>

The `/ha/packages/sync` action, which ensures the packages are distributed to HA secondaries, has been optimized to only distribute the parts that are missing on the secondaries. The new implementation also preserves symbolic links and folder structure in the filesystem.

</details>

<details>

<summary>Improved NACM Authorization for Stacked Reactive/Nano Services</summary>

NSO can now expose only a top-level service in a stacked services scenario, while keeping the lower-level services internal, no longer requiring additional NACM rules that would expose the lower-level services as well.

Documentation Updates:

* Added additional information about the effect of NACM rules on services in the [NACM Rules and Services](administration/management/aaa-infrastructure.md#d5e6693) section.

</details>

<details>

<summary>Support Service Metadata Checks</summary>

The service check-sync action by default checks whether the configuration required by the service exists on the managed devices but does not check if the configuration is owned by the service (the configuration might have been there before). The new `with-service-meta-data` parameter can now be used to also consider service metadata when determining if the service is in sync.

In addition, this new parameter is also available for the `commit`, `re-deploy`, and `un-deploy` commands to include any service metadata changes in the dry-run diff output.

Documentation Updates:

* Updated [Commit Flags](operation-and-usage/operations/lifecycle-operations.md#d5e5048) and [Service Actions](operation-and-usage/operations/lifecycle-operations.md#d5e5403) in [Lifecycle Operations](operation-and-usage/operations/lifecycle-operations.md) with a description of the new parameter.

</details>

<details>

<summary>Consistent User Preferences in the Web UI</summary>

The Web UI keeps track of selected table display preferences across page refreshes, such as column sort order and the number of rows per page.

</details>
