---
description: Understand different types of northbound APIs and their working mechanism.
---

# Northbound APIs

This section describes the various northbound programmatic APIs in NSO NETCONF, REST, and SNMP. These APIs are used by external systems that need to communicate with NSO, such as portals, OSS, or BSS systems.

NSO has two northbound interfaces intended for human usage, the CLI and the WebUI. These interfaces are described in [NSO CLI](../../../operation-and-usage/cli-1/) and [Web User Interface](../../../operation-and-usage/webui.md) respectively.

There are also programmatic Java, Python, and Erlang APIs intended to be used by applications integrated with NSO itself. See [Running Application Code](../../introduction-to-automation/applications-in-nso.md#ncs.development.applications.running) for more information about these APIs.

## Integrating an External System with NSO <a href="#d5e48" id="d5e48"></a>

There are two APIs to choose from when an external system should communicate with NSO:

* NETCONF
* REST

Which one to choose is mostly a subjective matter. REST may, at first sight, appear to be simpler to use, but is not as feature-rich as NETCONF. By using a NETCONF client library such as the open source Java library [JNC](https://github.com/tail-f-systems/JNC) or Python library [ncclient](https://github.com/ncclient/ncclient), the integration task is significantly reduced.

Both NETCONF and REST provide functions for manipulating the configuration (including creating services) and reading the operational state from NSO. NETCONF provides more powerful filtering functions than REST.

NETCONF and SNMP can be used to receive alarms as notifications from NSO. NETCONF provides a reliable mechanism to receive notifications over SSH, whereas SNMP notifications are sent over UDP.

Regardless of the protocol you choose for integration, keep in mind all of them communicate with the NSO server over network sockets, which may be unreliable. Additionally, write transactions in NSO can fail if they conflict with another, concurrent transaction. As a best practice, the client implementation should be able to gracefully handle such errors and be prepared to retry requests. For details on the NSO concurrency, refer to the [NSO Concurrency Model.](../nso-concurrency-model.md)
