---
description: Security features to consider for NSO deployment.
---

# Secure Deployment

When deploying NSO in production environments, security should be a primary consideration. This section guides the NSO features available for securing your NSO deployment.

## Development vs. Production Deployment

NSO installations can be configured for development or production use, with significantly different security implications:

### Production Installation

* Use the NSO Installer with the `--system-install` option for production deployments
  * The `--local-install` option should only be used for development environments
  * Use the NSO Installer `--run-as-user User` option to run NSO as a non-root user
* Never use `ncs.conf` files from NSO distribution examples in production
  * Evaluate and customize the default `ncs.conf` file provided with a system installation to meet your specific security requirements

### Key Configuration Differences

The default `ncs.conf` for production installations differs from the development default `ncs.conf` in several critical security areas:

#### Encryption Keys:

* Production (system) installations use external key management where ncs.conf points to `${NCS_CONFIG_DIR}/ncs.crypto_keys` using the `${NCS_DIR}/bin/ncs_crypto_keys` command to retrieve them
* Development installations include the encryption keys directly in `ncs.conf`

#### SSH Configuration:

* Production restricts SSH host key algorithms to `ssh-ed25519` only
* Development allows multiple algorithms for compatibility

#### Authentication:

* Production disables local authentication by default, using PAM with `system-auth`
* Development enables local authentication and uses PAM with `common-auth`
* Production includes password expiration warnings

#### Network Interfaces:

* Production disables CLI SSH, HTTP WebUI, and NETCONF SSH by default
* Development enables these interfaces for convenience
* Production enables restricted-file-access for CLI

See [ncs.conf(5)](../../../man/section5.md#ncs.conf) for all available options to configure the NSO daemon.

## Eliminating Root Access

Running NSO with minimal privileges is a fundamental security best practice:

* Use the NSO installer `--run-as-user User` option to run NSO as a non-root user
* Some files are installed with elevated privileges - refer to the [ncs-installer(1)](../../../man/section1.md#system-installation) man page under the `--run-as-user User` option for details
* The NSO production container runs NSO from a [non-root user](../containerized-nso.md#nso-runs-from-a-non-root-user)
*   If the CLI is used and we want to create CLI commands that run executables, we may want to modify the permissions of the `$NCS_DIR/lib/ncs/lib/core/confd/priv/cmdptywrapper` program.\
    To be able to run an executable as root or a specific user, we need to make `cmdptywrapper` `setuid` `root`, i.e.:

    1. `# chown root cmdptywrapper`
    2. `# chmod u+s cmdptywrapper`

    Failing that, all programs will be executed as the user running the `ncs` daemon. Consequently, if that user is the `root`, we do not have to perform the `chmod` operations above.\
    The same applies to executables run via actions, but then we may want to modify the permissions of the `$NCS_DIR/lib/ncs/lib/core/confd/priv/cmdwrapper` program instead:

    1. `# chown root cmdwrapper`
    2. `# chmod u+s cmdwrapper`
* The deployment variant referenced in the README file of the [examples.ncs/getting-started/netsim-sshkey](https://github.com/NSO-developer/nso-examples/tree/6.5/getting-started/netsim-sshkey) example provides a native and NSO production container based example.

## Authentication, Authorization, and Accounting (AAA)

### PAM Authentication

PAM (Pluggable Authentication Modules) is the recommended authentication method for NSO:

* Group assignments based on the OS group database `/etc/group`
* Default NACM (Network Configuration Access Control Module) settings provide two groups:
  * `ncsadmin`: unlimited access rights
  * `ncsoper`: minimal access rights (read-only)

See [PAM](../../management/aaa-infrastructure.md#ug.aaa.pam) for details.

### Customizing AAA Configuration

When customizing the default `aaa_init.xml` configuration:

* Exclude credentials unless local authentication is explicitly enabled
* Never use default passwords
* Carefully consider which groups can modify NACM rules
* Tailor NACM settings for user groups based on the principle of least privilege

See [AAA Infrastructure](../../management/aaa-infrastructure.md) for details.

### Additional Authentication Methods

* CLI and NETCONF: SSH public key authentication
* RESTCONF: Token, JWT, LDAP, or TACACS+ authentication
* WebUI: HTTPS (TLS) with JSON-RPC SSO (Single Sign-On)

{% hint style="info" %}
Disable unused interfaces in `ncs.conf` to reduce the attack surface.
{% endhint %}

See [Authentication](../../management/aaa-infrastructure.md#ug.aaa.authentication) for details.

## Securing IPC Access

Inter-Process Communication (IPC) security is crucial for safeguarding NSO's extensibility SDK API communications. Since the IPC socket allows full control of the system, it is important to ensure that only trusted or authorized clients can connect. See [Restricting Access to the IPC Socket](../../advanced-topics/ipc-connection.md#restricting-access-to-the-ipc-socket).\
Examples of programs that connect using IPC sockets:

* Remote commands, such as `ncs --reload`
* MAAPI, CDB, DP, event notification API clients
* The `ncs_cli` program
* The `ncs_cmd` and `ncs_load` programs

### Default Security

* Only local connections to IPC sockets are allowed by default
* TCP sockets with no authentication

### Best Practices

* Use Unix sockets for authenticating the client based on the UID of the other end of the socket connection
  * Root and the user NSO runs from always have access
  * If using TCP sockets, configure NSO to use access checks with a pre-shared key
    * If enabling non-localhost IPC over TCP sockets, implement encryption

See [Authenticating IPC Access](../../management/aaa-infrastructure.md#authenticating-ipc-access) for details.

## Southbound Interface Security

Secure communication with managed devices:

* Use [Cisco-provided NEDs](../../management/ned-administration.md) when possible
* Refer to the [examples.ncs/getting-started/netsim-sshkey](https://github.com/NSO-developer/nso-examples/tree/6.5/getting-started/netsim-sshkey) README, which references a deployment variant of\
  the example for SSH key update patterns using nano services.

## Cryptographic Key Management

### Hashing Algorithms

* Set the `ncs.conf` `/ncs-config/crypt-hash/algorithm` to sha-512 for password hashing
  * Used by the `ianach:crypt-hash` type for secure password storage

### Encryption Keys

* Generate new encryption keys before or at startup
* Replace or rotate keys generated by the NSO installer
  * Rotate keys periodically
* Store keys securely (default location: `/etc/ncs/ncs.crypto_keys`)
* The `ncs.crypto_keys` file contains the highly sensitive encryption keys for all encrypted CDB data

See [Cryptographic Keys](../../advanced-topics/cryptographic-keys.md) for details.

## Rate Limiting and Resource Protection

Implement various limiting mechanisms to prevent resource exhaustion:

### NSO Configuration Limits

NSO can be configured with some limits from `ncs.conf`:

* `/ncs-config/session-limits`: Limit concurrent sessions
* `/ncs-config/transaction-limits`: Limit concurrent transactions
* `/ncs-config/parser-limits`: Limit XML data parsing
* `/ncs-config/webui/transport/unauthenticated-message-limit`: Limit unauthenticated message size
* `/ncs-config/webui/rate-limiting`: Limit JSON-RPC requests per hour

### External Rate Limiting

For additional protection, implement rate limiting at the network level using tools like Linux `iptables`.

## High Availability Security

When deploying NSO in [HA (High Availability)](../../management/high-availability.md) configurations:

* RAFT HA:
  * Uses encrypted TLS with mutual X.509 authentication
* Rule-based HA:
  * Unencrypted communication
  * Shared token for authentication between HA group nodes

{% hint style="info" %}
Encrypted strings for all encrypted CDB data, default stored in `/etc/ncs/ncs.crypto_keys`, must be identical across nodes
{% endhint %}

## Compliance Reporting

NSO provides comprehensive [compliance reporting](../../../operation-and-usage/operations/compliance-reporting.md) capabilities:

* Track user actions - "Who has done what?"
* Verify network configuration compliance
* Generate audit reports for regulatory requirements

## FIPS Mode

For enhanced security and regulatory compliance:

* FIPS mode restricts NSO to use only FIPS 140-3 validated cryptographic modules
* Enable with the `--fips-install` option during [installation](../system-install.md)
* Required for certain government and regulated industry deployments
