---
description: >-
  Use the NSO MCP server to expose NSO capabilities to MCP-compatible AI
  clients.
---

# NSO MCP Server

The Cisco NSO Adaptive MCP Server is a Cisco NSO package that bridges the Model Context Protocol (MCP) to Cisco NSO functionality. It allows MCP-compatible AI assistants and clients to securely interact with an NSO deployment through a standard interface.

The MCP server provides a standard way for MCP-compatible clients to:

* Read NSO data through MCP resources
* Invoke NSO operations through MCP tools
* Use guided workflows exposed as MCP prompts

The server is delivered as an NSO package and exposes an MCP endpoint in NSO while continuing to use NSO authentication and authorization controls.

## Requirements

The NSO MCP server has the following requirements:

| Requirement     | Version        |
| --------------- | -------------- |
| **NSO version** | 6.7 or higher  |
| **Java**        | 21 or higher   |
| **Protocol**    | MCP 2025-03-26 |

## Role of the MCP Server

The MCP server acts as a bridge between an MCP-compatible client and an NSO deployment.

In a typical workflow:

1. A user works through an MCP-compatible AI assistant or client.
2. The client connects to the NSO MCP endpoint.
3. NSO authenticates the user by using the authentication mechanisms configured for the deployment.
4. The MCP server exposes the capabilities that the authenticated user is allowed to access.
5. The client reads NSO context and invokes supported NSO operations on behalf of that user.

This allows engineers to use natural language or MCP-aware tooling to inspect NSO data and perform supported tasks while NSO remains the source of truth and enforcement point.

{% hint style="info" %}
The MCP server provides the integration layer, not the AI assistant itself. Customers connect an MCP-compatible client or assistant of their choice to the NSO MCP endpoint.
{% endhint %}

## Working Principles

The NSO MCP server is exposed by NSO at the `/mcp` endpoint.

At a high level:

* The customer deploys and configures the Cisco-provided MCP package in NSO.
* An MCP-compatible client connects to the `/mcp` endpoint exposed by NSO.
* The client authenticates by using NSO authentication.
* The client discovers the tools, resources, and prompts available to that user.
* All access remains subject to NSO security controls.

## Architecture

The solution uses a hybrid architecture with an Erlang proxy layer and a Java MCP server.

At a high level:

* The external MCP endpoint is exposed by NSO over HTTP(S)
* NSO handles authentication and authorization for incoming requests
* The MCP server processes MCP requests internally and interacts with NSO by using the authenticated user context
* The internal MCP server is not directly exposed to external clients

## Security and Access Control

The MCP server relies on existing NSO security mechanisms.

### Authentication

The MCP server does not introduce a separate authentication system. Clients authenticate by using the NSO authentication mechanisms configured for the deployment.

### Authorization

Access to the MCP endpoint and to exposed capabilities is controlled by NSO authorization mechanisms, including NACM.

### User-Based Execution

Operations requested through the MCP server run with the authenticated user's identity. MCP clients cannot read data or execute operations beyond that user's normal permissions.

### Exposure Policies

The MCP server also uses exposure policies to control which tools and resources are visible to MCP clients. This allows administrators to limit what the server exposes even when the underlying NSO schema contains additional capabilities.

### What the MCP Server Exposes

The MCP server exposes NSO functionality through three MCP primitives:

* Tools
* Resources
* Prompts

### Transport Support

The NSO MCP server exposes MCP by using Streamable HTTP at the NSO `/mcp` endpoint.

Clients connect to:

* `http://<nso-host>:<http-port>/mcp`
* `https://<nso-host>:<https-port>/mcp`

The server accepts MCP requests over HTTP `POST`. Other HTTP methods are not supported.

Clients that support HTTP-based MCP can connect directly. Clients that support only stdio transport require an external proxy bridge, such as `mcp-proxy`.

## Tools

Tools represent executable operations that MCP clients can invoke.

Examples include:

* service-related operations
* device operations such as `sync-from`, `sync-to`, `check-sync`, and `compare-config`
* NSO actions discovered from schema
* read-oriented helper tools for schema, configuration, and operational data

## Resources

Resources represent readable NSO data that MCP clients can fetch.

Examples may include, depending on the NSO deployment and loaded packages:

* services
* devices
* device configuration
* device live status
* configuration data at a path
* operational data at a path
* packages
* alarms
* rollbacks

## Prompts

Prompts are guided workflows exposed to MCP clients.

Examples include workflows for:

* service-related tasks
* device onboarding
* troubleshooting and recovery
* repeated change procedures

The MCP server automatically discovers supported tools, resources, and prompts from NSO schema and package content.

## Configuration

The MCP server is configured through the `cisco-nso-mcp` YANG module under the `mcp-server` container.

Key configuration parameters include:

| Parameter                 | Type        | Default      | Description                           |
| ------------------------- | ----------- | ------------ | ------------------------------------- |
| `enabled`                 | boolean     | `true`       | Enable or disable the MCP server      |
| `logging/level`           | enumeration | `info`       | Log level                             |
| `policies/default-action` | enumeration | `restricted` | Default behavior when no rule matches |

## Policy Rules

The `policies/rule` list defines ordered rules for controlling which MCP tools and resources are exposed.

Each rule can match on:

* YANG namespace
* schema path

The first matching rule decides whether access is permitted or denied. If no rule matches, `policies/default-action` controls the outcome.

With the default value `restricted`:

* core NSO operations remain available
* unmatched non-core operations are denied

## Deployment and Setup

The NSO MCP server is delivered as a Cisco-provided NSO package. Deploy and configure it in your NSO environment instead of building a separate MCP server implementation.

The package is:

* exposed externally through the NSO `/mcp` endpoint
* managed through standard NSO package workflows

A typical setup flow is:

1. Ensure the MCP package is present in the NSO installation.
2. Place the package in the NSO packages directory if required by your deployment workflow.
3. Build and load the package.
4. Reload NSO packages, for example by using the NSO CLI command `packages reload`.
5. Verify that the package is operational.
6. Review and adjust `mcp-server` configuration as needed.
7. Connect an MCP-compatible client to the `/mcp` endpoint by using NSO authentication.

## Connecting an MCP Client

After the package is installed and configured, an MCP-compatible client connects to the NSO MCP endpoint at `/mcp`.

The client authenticates by using the NSO authentication method configured for the deployment. Clients that support HTTP-based MCP can connect directly. Clients that support only stdio transport require a proxy bridge.

Once authenticated, the client can:

* list available MCP tools
* list available MCP resources
* list available MCP prompts
* read permitted NSO data
* invoke permitted NSO operations

The capabilities visible to the client depend on NSO authentication, NACM authorization, and MCP exposure policy configuration.

## Verifying the Setup

A typical verification flow includes:

1. Confirm that the MCP package is loaded and operational.
2. Confirm that the NSO `/mcp` endpoint is reachable.
3. Connect an MCP-compatible client with valid NSO credentials.
4. Verify that the client can list tools, resources, and prompts.
5. Test a permitted read or tool invocation.

## Interaction through AI Assistants

The MCP server allows MCP-compatible AI assistants and clients to interact with NSO through a standard interface.

This means that an engineer can use an AI assistant to:

* inspect NSO state
* discover available operations
* carry out supported tasks
* use guided workflows for common NSO procedures

The MCP server does not replace NSO review, authentication, authorization, or operational controls. Instead, it provides a structured bridge between AI tooling and the NSO deployment.

## Example Client Configuration

The NSO MCP server is configured through the `cisco-nso-mcp` YANG module under the `mcp-server` container.

A typical starting point is:

* `enabled`: `true`
* `logging/level`: `info`
* `policies/default-action`: `restricted`

This keeps the MCP server enabled, uses standard operational logging, and exposes only capabilities allowed by the default restricted policy and any configured policy rules.

**Endpoint**

After the package is installed and operational, the MCP endpoint is exposed by NSO at:

```
https://<host-name-or-ip>:<port>/mcp
```

**Example VS Code MCP Client Configuration**

Visual Studio Code supports remote MCP servers over HTTP. A minimal workspace configuration looks like this:

{% code title="Example" overflow="wrap" %}
```
{
  "servers": {
    "nsoProduction": {
      "type": "http",
      "url": "https://nso.example.com:<port>/mcp",
      "headers": {
        "Authorization": "Basic YWRtaW46YWRtaW4="
      }
    }
  }
}
```
{% endcode %}

Adjust the URL, port, and authentication settings to match the NSO deployment and save this in `.vscode/mcp.json`. The `Authorization` header shown above is an example and should be replaced with credentials appropriate for the target NSO deployment.

If the deployment requires explicit HTTP authentication headers, configure them according to the NSO authentication method used in that environment.
