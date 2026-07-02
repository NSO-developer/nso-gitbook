---
description: >-
  Use the NSO MCP server to expose NSO capabilities to MCP-compatible AI
  clients.
---

# NSO MCP Server

The Cisco NSO Adaptive MCP Server is an NSO package that bridges the Model Context Protocol (MCP) to Cisco NSO functionality. It allows MCP-compatible AI assistants and clients to securely interact with an NSO deployment through a standard MCP interface while continuing to use NSO authentication, authorization, and policy controls.

The MCP server provides a standard way for MCP-compatible clients to:

* Read NSO data through MCP resources
* Invoke NSO operations through MCP tools
* Use guided workflows exposed as MCP prompts

The server is delivered as an NSO package and exposes an MCP endpoint inside NSO instead of requiring a separate MCP server deployment.

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

## Architecture

The solution uses a hybrid architecture with an Erlang proxy layer and a Java MCP backend.

At a high level:

* NSO exposes the external MCP endpoint over the NSO WebUI HTTP(S) listeners
* An Erlang proxy layer handles authentication-related request processing and forwards requests internally
* A Java `ApplicationComponent` implements the MCP server logic
* The Java backend discovers tools, resources, resource templates, and prompts from the live NSO schema and package content
* Requests are executed with the authenticated NSO user context
* The Java backend is not directly exposed to external clients

## Endpoint and Transport

The NSO MCP server exposes MCP by using Streamable HTTP at the NSO `/mcp` endpoint.

Clients connect to:

* `http://<nso-host>:<http-port>/mcp`
* `https://<nso-host>:<https-port>/mcp`

The server accepts MCP requests over HTTP `POST`. Other HTTP methods are not supported. In particular, `GET /mcp` is not a valid MCP request and returns `405 Method Not Allowed`.

Clients that support HTTP-based MCP can connect directly. Clients that support only stdio transport require an external proxy bridge, such as `mcp-proxy`.

{% hint style="info" %}
When `/ncs-config/webui/match-host-name` is `true`, the HTTP `Host` header must match the configured WebUI `server-name` or `server-alias`. With the default NSO WebUI settings this typically means using `localhost` rather than `127.0.0.1` for local access unless the WebUI host-name settings have been changed.
{% endhint %}

## Authentication and Authorization

The MCP server relies on existing NSO security mechanisms.

### Authentication

The MCP server does not introduce a separate authentication system. Clients authenticate by using the NSO authentication mechanisms configured for the deployment.

The proxy supports the same authentication styles expected for NSO WebUI access, including:

* WebUI session cookies
* HTTP Basic authentication
* `X-Auth-Token` or `Bearer` token authentication
* package-authentication fallback

{% hint style="info" %}
If package-authentication is used, note that the MCP endpoint uses the AAA context `mcp`. Package-authentication scripts that only recognize the `rest` context must be updated to also accept `mcp`.
{% endhint %}

### Authorization and User-Based Execution

Access to the MCP endpoint and to exposed capabilities is controlled by NSO authorization mechanisms, including NACM.

Operations requested through the MCP server run with the authenticated user's identity. MCP clients cannot read data or execute operations beyond that user's normal permissions.

The capabilities visible to a client are the effective intersection of:

* NSO authentication
* NSO authorization and NACM
* MCP exposure policy configuration

## What the MCP Server Exposes

The MCP server exposes NSO functionality through four MCP constructs:

* tools
* resources
* resource templates
* prompts

### Tools

Tools represent executable operations that MCP clients can invoke.

Examples include:

* service-related operations
* device operations such as `sync-from`, `sync-to`, `check-sync`, and `compare-config`
* NSO actions discovered from schema
* read-oriented helper tools for schema, configuration, and operational data

### Resources and Resource Templates

Resources represent readable NSO data that MCP clients can fetch.

Resource templates represent parameterized readable data, for example a device-specific or service-specific path.

Examples may include, depending on the NSO deployment and loaded packages:

* services
* devices
* device configuration
* device operational data
* configuration data at a path
* operational data at a path
* service schema views
* service instance-specific resource templates

### Prompts

Prompts are guided workflows exposed to MCP clients.

Examples include workflows for:

* service-related tasks
* device onboarding
* troubleshooting and recovery
* repeated change procedures

The MCP server automatically discovers supported tools, resources, resource templates, and prompts from NSO schema and package content.

{% hint style="info" %}
Prompt visibility does not by itself guarantee that every referenced tool is exposed. Under restrictive MCP policy settings, a prompt may be visible while some of the tools used by that workflow remain hidden.
{% endhint %}

## Supported MCP Methods

The NSO MCP server supports the following MCP methods:

* `initialize`
* `tools/list`
* `tools/call`
* `resources/list`
* `resources/templates/list`
* `resources/read`
* `prompts/list`
* `prompts/get`
* `ping`
* `notifications/initialized`

The endpoint also accepts:

* `resources/subscribe`
* `resources/unsubscribe`

but no active resource subscription capability is currently provided.

## Configuration

The MCP server is configured through the `cisco-nso-mcp` YANG module under the `mcp-server` container.

Key configuration parameters include:

| Parameter                 | Type        | Default      | Description                                       |
| ------------------------- | ----------- | ------------ | ------------------------------------------------- |
| `enabled`                 | boolean     | `true`       | Enable or disable the MCP server                  |
| `logging/level`           | enumeration | `info`       | Log level                                         |
| `policies/default-action` | enumeration | `restricted` | Behavior when no rule matches                     |
| `policies/rule`           | list        | none         | Ordered permit or deny rules by path or namespace |

## Policy Rules

The `policies/rule` list defines ordered rules for controlling which MCP tools and resources are exposed.

Each rule can match on:

* YANG namespace
* schema path

The first matching rule decides whether access is permitted or denied. If no rule matches, `policies/default-action` controls the outcome.

`policies/default-action` supports:

* `permit`
  * expose unmatched capabilities
* `deny`
  * deny unmatched capabilities
* `restricted`
  * expose only built-in tools, device-operation tools, and read helpers for schema, config, and operational data

With the default value `restricted`:

* core read and device-operation capabilities remain available
* service CRUD tools, many discovered actions, and other non-core tools remain hidden unless explicitly permitted

This is an important behavior difference for first-time users. If a deployment appears to expose only a small set of MCP tools, check the MCP policy configuration before assuming discovery failed.

Example targeted policy configuration:

{% code title="Example" overflow="wrap" %}
```xml
<config xmlns="http://tail-f.com/ns/config/1.0">
  <mcp-server xmlns="http://cisco.com/pkg/cisco-nso-mcp">
    <policies>
      <default-action>restricted</default-action>
      <rule>
        <sequence>100</sequence>
        <action>permit</action>
        <match>
          <path>/my-service:my-service/*</path>
        </match>
        <description>Expose my-service capabilities</description>
      </rule>
    </policies>
  </mcp-server>
</config>
```
{% endcode %}

For broad exposure in a lab environment, `default-action permit` can be used. In production deployments, targeted permit rules are usually preferred.

## Deployment and Setup

The NSO MCP server is delivered as a Cisco-provided NSO package. Deploy and configure it in your NSO environment instead of building a separate MCP server implementation.

The package is:

* exposed externally through the NSO `/mcp` endpoint
* managed through standard NSO package workflows

A typical setup flow is:

1. Ensure the MCP package is present in the NSO installation or deployment package set.
2. Place the package in the NSO packages directory if required by your deployment workflow.
3. Build and load the package.
4. Reload NSO packages, for example by using the NSO CLI command `packages reload`.
5. Restart NSO with the `--with-package-reload` option.
6. Verify that the package is operational.
7. Review and adjust `mcp-server` configuration as needed.
8. Connect an MCP-compatible client to the `/mcp` endpoint by using NSO authentication.

## Connecting an MCP Client

After the package is installed and configured, an MCP-compatible client connects to the NSO MCP endpoint at `/mcp`.

The client authenticates by using the NSO authentication method configured for the deployment. Clients that support HTTP-based MCP can connect directly. Clients that support only stdio transport require a proxy bridge.

Once authenticated, the client can:

* list available MCP tools
* list available MCP resources
* list available MCP resource templates
* list available MCP prompts
* read permitted NSO data
* invoke permitted NSO operations

The capabilities visible to the client depend on NSO authentication, NACM authorization, and MCP exposure policy configuration.

## Verifying the Setup

A typical verification flow includes:

1. Confirm that the MCP package is loaded and operational.
2. Confirm that the NSO `/mcp` endpoint is reachable.
3. Connect an MCP-compatible client with valid NSO credentials.
4. Verify that the client can list tools, resources, resource templates, and prompts.
5. Test a permitted read or tool invocation.

Example `initialize` request:

{% code title="Example" overflow="wrap" %}
```bash
curl -u <user>:<password> \
  -H "Content-Type: application/json" \
  -d '{
        "jsonrpc": "2.0",
        "id": 1,
        "method": "initialize",
        "params": {
          "protocolVersion": "2025-03-26",
          "capabilities": {},
          "clientInfo": {
            "name": "example-client",
            "version": "1.0"
          }
        }
      }' \
  http://localhost:8080/mcp
```
{% endcode %}

Example `tools/list` request:

{% code title="Example" overflow="wrap" %}
```bash
curl -u <user>:<password> \
  -H "Content-Type: application/json" \
  -d '{
        "jsonrpc": "2.0",
        "id": 2,
        "method": "tools/list",
        "params": {}
      }' \
  http://localhost:8080/mcp
```
{% endcode %}

The package ships with validation script `test-mcp.sh`, that script can be used as a smoke test after the package is loaded.

## Interaction through AI Assistants

The MCP server allows MCP-compatible AI assistants and clients to interact with NSO through a standard interface.

This means that an engineer can use an AI assistant to:

* inspect NSO state
* discover available operations
* carry out supported tasks
* use guided workflows for common NSO procedures

The MCP server does not replace NSO review, authentication, authorization, or operational controls. Instead, it provides a structured bridge between AI tooling and the NSO deployment.

## Troubleshooting

The following checks are useful when the MCP endpoint does not behave as expected:

<details>

<summary><code>400 Bad Request</code> on <code>/mcp</code></summary>

If the endpoint returns `400 Bad Request`, verify the WebUI host-name settings.

When `/ncs-config/webui/match-host-name` is `true`, the HTTP `Host` header must match the configured WebUI `server-name` or `server-alias`. For local testing with the default NSO WebUI settings, use `localhost` rather than `127.0.0.1`.

</details>

<details>

<summary><code>405 Method Not Allowed</code></summary>

The MCP endpoint supports HTTP `POST`. Do not use `GET` for MCP requests.

</details>

<details>

<summary>Fewer tools are visible than expected</summary>

If discovery appears to work but only a small set of tools is visible, check:

* the authenticated user's NSO permissions and NACM rules
* the MCP exposure policy under `mcp-server/policies`
* whether `policies/default-action` is still `restricted`

</details>

<details>

<summary>Package-authentication works for RESTCONF but not for MCP</summary>

If package-authentication is used, confirm that the authentication script accepts the AAA context `mcp` in addition to any existing `rest` handling.

</details>

<details>

<summary><code>500 Internal Server Error</code> or backend unavailable</summary>

Check the package logs and the Java VM logs.

Useful log files include:

* `logs/cisco-nso-mcp-server.log` for the Erlang proxy layer
* `logs/ncs-java-vm.log` for the Java backend and component lifecycle

On platforms with short Unix-domain socket path limits, such as macOS, very long NSO runtime paths can prevent the internal MCP Unix socket from being created. If the Java backend reports an error such as `Unix domain path too long`, shorten the NSO runtime path and restart the package or deployment.

</details>

## Operational Considerations

AI-based operations can move quickly from intent to execution. In a production NSO environment, this carries a risk of unintended changes. This section offers guidance for careful and deliberate use of the NSO MCP server.

* Treat the MCP endpoint as another NSO northbound interface. An MCP client acts on behalf of the authenticated NSO user, so normal operational practices still apply: use least-privilege users, review intended changes, keep audit context, and verify the result after every state-changing operation.
* Read-oriented operations are usually the safest way to start. They are useful for discovering devices, services, schema, operational state, and available actions before making a change. However, read access can still expose sensitive configuration or operational data, so it should still be controlled through NSO authentication, NACM, and MCP exposure policies.
* State-changing tools and actions require more care. Some operations change NSO CDB, some push changes to devices, and some do both. For example, a device `sync-from` reads from the device but immediately updates NSO's copy of the configuration. A `sync-to`, service `re-deploy`, service create/update/delete operation, or another action may change device state or service ownership depending on the underlying NSO operation.

### Recommended Workflow for State-Changing Operations

Before invoking a state-changing MCP tool:

1. Use read operations first to identify the exact service, device, path, or action target.
2. Ask the client to describe the intended change, affected objects, and expected result.
3. Prefer narrow targets over broad selectors such as all devices or all services.
4. When the operation supports it, run a `dry-run` first and review the resulting diff.
5. Use commit metadata such as `label` and `comment` when available, so rollback files, events, compliance reports, and commit queue entries can be tied back to the reason for the change.
6. Consider commit parameters such as `no-overwrite`, `confirm-network-state`, `no-networking`, or `commit-queue` only when they match the operational intent and are supported by the invoked operation.
7. After the operation completes, verify the result with read operations, `check-sync`, `compare-config`, service `check-sync`, or commit queue status as appropriate.

For production use, keep `policies/default-action` set to `restricted` and expose paths, namespaces, or actions that enable state-changing operations only through targeted permit rules. Broad exposure, such as `default-action permit`, is better suited to labs and short-lived evaluation environments.

### Dos and Don'ts

Consider the following when using MCP-based operations.

<details>

<summary>Dos</summary>

* **Access control**: Use NSO users and NACM groups with only the permissions needed for the intended MCP workflows.
* **MCP policies**: Start from `restricted` and add targeted permit rules for known service paths, namespaces, or actions.
* **Read first**: Use resources, resource templates, and read helper tools to inspect state before invoking tools that change state.
* **Dry run**: Use `dry-run` where the underlying NSO operation supports it, especially for service deployment, re-deploy, `sync-to`, or package-related operations.
* **Auditability**: Use `label` and `comment` when available to make MCP-originated changes easy to find in rollback files, events, and commit queue results.
* **Verification**: Check the resulting NSO state, affected device sync state, service sync state, and commit queue result after state-changing operations.
* **Environment**: In local-install or development environments, source the NSO environment, for example `source ncsrc`, before running NSO commands, package scripts, or validation scripts such as `test-mcp.sh`.
* **Troubleshooting**: Check `logs/cisco-nso-mcp-server.log` for the Erlang proxy layer and `logs/ncs-java-vm.log` for Java backend or component lifecycle issues.

</details>

<details>

<summary>Don'ts</summary>

* **Broad changes**: Do not ask an MCP client to make vague changes such as "fix this service" or "clean up the devices" without first reviewing the proposed target and operation.
* **Production exposure**: Do not use broad `default-action permit` policies in production unless the deployment is intentionally designed for that level of MCP exposure.
* **Credentials**: Do not store long-lived administrator credentials in shared client configuration files such as `.vscode/mcp.json`.
* **Blind changes**: Do not invoke state-changing tools before checking the current NSO state and, where relevant, device or service sync state.
* **Sync operations**: Do not treat `sync-from` as a harmless read-only operation. It reads from the device but updates NSO's stored configuration.
* **Commit flags**: Do not use flags such as `no-networking`, `no-out-of-sync-check`, or `no-overwrite` unless the operator understands their NSO behavior and the operation supports them.
* **Logs**: Do not troubleshoot only from the MCP client response. Also inspect NSO package status, the MCP package logs, Java VM logs, and commit queue or rollback state when a state-changing operation fails.

</details>

## Example Client Configuration

After the package is installed and operational, the MCP endpoint is exposed by NSO at:

```
https://<host-name-or-ip>:<port>/mcp
```

If the deployment uses the default WebUI host-name settings for local access, use `https://localhost:<port>/mcp`.

### Example VS Code MCP Client Configuration

Visual Studio Code supports remote MCP servers over HTTP. A minimal workspace configuration looks like this:

{% code title="Example" overflow="wrap" %}
```json
{
  "servers": {
    "nsoProduction": {
      "type": "http",
      "url": "https://nso.example.com:<port>/mcp",
      "headers": {
        "Authorization": "Basic <base64-user-colon-password>"
      }
    }
  }
}
```
{% endcode %}

Adjust the URL, port, and authentication settings to match the NSO deployment and save this in `.vscode/mcp.json`.

If the deployment requires explicit HTTP authentication headers, configure them according to the NSO authentication method used in that environment.
