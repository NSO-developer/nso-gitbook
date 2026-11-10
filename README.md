---
description: Detailed NSO API implementation reference.
icon: gear-api
---

# NSO Developer Reference

This repository contains reference documentation for the northbound interfaces
and APIs provided by Cisco Network Services Orchestrator (NSO).

Interfaces:

- <i class="fa-code">:code:</i> [RESTCONF API](#restconf-api)
- <i class="fa-diagram-project">:diagram-project:</i> [NETCONF Interface](#netconf-interface)
- <i class="fa-brackets-curly">:brackets-curly:</i> [JSON-RPC API](#json-rpc-api)
- <i class="fa-message-bot">:message-bot:</i> [SNMP Agent](#snmp-agent)

Language Bindings:

- <i class="fa-square-p">:square-p:</i> [Python API Reference](pyapi/README.md)
- <i class="fa-square-e">:square-e:</i> [Erlang API Reference](erlang/README.md)
- <i class="fa-square-j">:square-j:</i> [Java API Reference](java/com/tailf/README.md)

For an introduction to using these APIs, consult the
[Guides](https://nso-docs.cisco.com/guides).

## RESTCONF API

The NSO RESTCONF documentation covers implementation details and extension to or deviation from the RESTCONF RFC 8040 and YANG RFC 7950 respectively. The IETF RESTCONF and YANG RFCs are the main reference guides for the NSO RESTCONF interface, while the NSO documentation complements the RFCs.

{% embed url="https://datatracker.ietf.org/doc/html/rfc8040" %}

{% embed url="https://datatracker.ietf.org/doc/html/rfc7950" %}

{% embed url="https://datatracker.ietf.org/doc/html/rfc7951" %}

{% embed url="https://nso-docs.cisco.com/guides/development/core-concepts/northbound-apis/restconf-api" %}

See also [Sample RESTCONF API Docs](https://developer.cisco.com/docs/nso/overview/)

# NETCONF Interface

The NSO NETCONF documentation covers implementation details and extension to or deviation from the NETCONF RFC 6241 and YANG RFC 7950 respectively. The IETF NETCONF and YANG RFCs are the main reference guides for the NSO NETCONF interface, while the NSO documentation complements the RFCs.

{% embed url="https://datatracker.ietf.org/doc/html/rfc6241" %}

{% embed url="https://datatracker.ietf.org/doc/html/rfc7950" %}

{% embed url="https://nso-docs.cisco.com/guides/development/core-concepts/northbound-apis/nso-netconf-server" %}

## JSON-RPC API

Visit the link below to learn more.

{% embed url="https://nso-docs.cisco.com/guides/development/advanced-development/web-ui-development/json-rpc-api" %}

## SNMP Agent

Visit the link below to learn more.

{% embed url="https://nso-docs.cisco.com/guides/development/core-concepts/northbound-apis/nso-snmp-agent" %}
