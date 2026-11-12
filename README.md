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

<summary>Improved <code>systemd</code> Integration</summary>

The NSO systemd service now starts NSO in foreground mode, allowing systemd to monitor the `ncs.smp` process directly and restart it after an unexpected failure. The service also uses improved startup logic that allows long-running model upgrade to complete without timing out.

Documentation Updates:

* Updated the [System Install](administration/installation-and-deployment/system-install.md) section with the new behavior.

</details>

<details>

<summary>Post-Quantum Cryptography Support</summary>

NSO adds support for Post-Quantum Cryptography (PQC) to help guard against "store now, decrypt later" attacks with future quantum computers, including:

* Implementation of post-quantum key exchange and signature algorithms, such as `mlkem768x25519-sha256` and `ML-DSA`.
* Offering PQC algorithms for northbound TLS and SSH connections by default.
* Use of PQC algorithms southbound for built-in NETCONF client and NEDs, depending on support by the managed devices.
* Use of hybrid `x25519mlkem768` key-exchange group with TLS 1.3 for connections between HA nodes.

The NED framework now uses the Apache MINA library in order to enable PQC support.

Documentation Updates:

* Updated the [Secure Deployment](administration/installation-and-deployment/deployment/secure-deployment.md) and [SSH Key Management](operation-and-usage/operations/ssh-key-management.md) pages to document PQC algorithms and their connection scope.&#x20;
* Added a link from the [NSO NETCONF Server](development/core-concepts/northbound-apis/nso-netconf-server.md) guide to the configurable SSH algorithm settings.

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

<summary>Configurable Template Loading Mode</summary>

Template loading mode (strict/relaxed) can now be explicitly configured in the XML template or in the package meta data file, allowing developers to decide on how strict is the validation in multi-NED environments.

Documentation Updates:

* Expanded the [Namespaces and Multi-NED Support](development/core-concepts/templates.md#ch_templates.multined) section with information on loading mode configuration and default selection algorithm.

</details>

<details>

<summary>Template Generation Enhancements</summary>

The `/devices/create-template` and `/compliance/create-template` actions can now write XML template files directly using the `out-directory` input. Omitting this input retains CDB template generation. The output directory must exist and be writable by NSO, and an existing file is never overwritten.

Generated XML templates can combine configuration from multiple NED schemas, using `if-ned-id-match` processing instructions for schema-specific configuration. Service template generation also supports paths spanning multiple NED schemas.

Compliance template generation can now build regular expressions from differing values observed in source configurations. The optional `regex-induction` input selects `trie` (the default), `dfa` for additional suffix factoring, or `none` to retain the previous match-all behavior.

When using a device template as the source for `/compliance/create-template`, integrations must supply `device-template` as a container with a mandatory `name` and optional `ned-id`, replacing the previous scalar input.

Documentation Updates:

* Expanded [Device Template Generation](operation-and-usage/operations/nso-device-manager.md#generating-an-xml-device-template) and [Service Template Generation](development/core-concepts/templates.md#generating-a-service-template-for-multiple-ned-schemas) with XML output and multi-NED examples.
* Added a [Generating XML Compliance Templates](operation-and-usage/operations/compliance-reporting.md#generating-xml-compliance-templates) workflow covering generation, reload, and checking. Documented the changed source input in [Generating Compliance Templates](operation-and-usage/operations/compliance-reporting.md#generating-compliance-templates) and [Preparing for Upgrade](administration/installation-and-deployment/upgrade-nso.md#d5e6830).
* Updated the [Web UI compliance template guidance](operation-and-usage/webui/tools.md#compliance-templates) with output requirements and a link to the XML template workflow.
* Documented [Regular-Expression Induction](operation-and-usage/operations/compliance-reporting.md#regular-expression-induction), including algorithm selection, examples, matching behavior, and how to preserve match-all generation. Linked the Web UI algorithm selector to this guidance.

</details>

<details>

<summary>Juniper Set Command Input for MAAPI</summary>

MAAPI can now load configuration expressed as Juniper-style `set` commands directly from a file or an in-memory string. The new `MAAPI_CONFIG_J_CMD` format flag is available in C, with corresponding constants in Java and Python. It can be combined with the merge flag to preserve existing configuration.

This format is supported for configuration loads only. It cannot be used for operational-data loads or as a `save_config` output format.

Documentation Updates:

* Added file and string loading examples, format constants, and transaction requirements to the [Python MAAPI](development/core-concepts/api-overview/python-api-overview.md#loading-juniper-set-commands) and [Java MAAPI](development/core-concepts/api-overview/java-api-overview.md#loading-juniper-set-commands) guides.

</details>

<details>

<summary>Separate RESTCONF and Smart Licensing Logs</summary>

RESTCONF traffic and Smart Licensing events can now be logged independently of other events through these [ncs.conf](resources/man/ncs.conf.5.md) settings:

* `/ncs-config/logs/restconf-log`
* `/ncs-config/logs/smart-license-log`&#x20;

RESTCONF requests and responses now go to the dedicated RESTCONF log instead of `audit.log`. The log supports text and NDJSON files, syslog, and the external log handler. Applications can subscribe to these entries with the new `NOTIF_RESTCONF` notification flag. Authentication and session events remain in the audit log.

Smart Licensing events now go to the dedicated Smart Licensing log instead of `ncs.log`. Notifications have severity `ERR`, `WARNING`, or `INFO`, and a configurable `log-level` controls their volume. The log supports the same destinations and file formats as the RESTCONF log.

When upgrading, configure destinations for both logs in the existing [ncs.conf](resources/man/ncs.conf.5.md). Update tools that read RESTCONF traffic from the audit log or subscribe with `NOTIF_AUDIT`, and update Smart Licensing log collectors and monitoring rules to read the new log.

Documentation Updates:

* Detailed the new sections in the [ncs.conf](resources/man/ncs.conf.5.md) file.
* Added [RESTCONF Logging](administration/management/system-management/README.md#restconf-logging) configuration and migration guidance, with a reminder in [Preparing for Upgrade](administration/installation-and-deployment/upgrade-nso.md#d5e6830).
* Added request and response troubleshooting guidance to the [RESTCONF API](development/core-concepts/northbound-apis/restconf-api.md#request-and-response-logging) guide and documented RESTCONF log subscriptions in the [Python](development/core-concepts/api-overview/python-api-overview.md#restconf-log-notifications) and [Java](development/core-concepts/api-overview/java-api-overview.md#ug.java_api_overview.notif) API overviews.
* Added [Smart Licensing Logging](administration/management/system-management/cisco-smart-licensing.md#smart-licensing-logging) configuration, severity filtering, troubleshooting, and migration guidance. Updated the logging overview and the Smart Licensing notification severities in [Log Messages and Formats](administration/management/system-management/log-messages-and-formats.md).

</details>

<details>

<summary>Web UI Updates</summary>

NSO 6.8 improves Web UI configuration and transaction workflows.&#x20;

* The **Config editor** adds tree filters, a Metadata drawer, schema-driven actions, and clearer handling of lists, leaf-lists, choices, and defaults.&#x20;
* The **Transactions** view replaces **Export transaction** with **Show as** and adds configuration formats and dry-run result views. Web UI search fields now use case-insensitive matching.
* The Web UI also adds a **Packages** sidebar category for loaded extension-package views and updates alarm, compliance-reporting, template, rollback-file, and High Availability guidance.
* The Web UI AI Assistant is provided through the `cisco-nso-ai-assistant` package. Administrators can configure a LiteLLM-compatible gateway or Crosswork AI backend, control user access, and optionally enable permitted MCP tools.

Documentation Updates:

* Updated the [Web UI](operation-and-usage/webui/), [Configuration Editor](operation-and-usage/webui/config-editor.md), [Transactions](operation-and-usage/webui/transactions.md), and [Tools](operation-and-usage/webui/tools.md) pages.
* Added a new page for [Packages](operation-and-usage/webui/packages.md) sidebar category.
* Added a new [Web UI AI Assistant](administration/management/web-ui-ai-assistant.md) guide for administrators.

</details>
