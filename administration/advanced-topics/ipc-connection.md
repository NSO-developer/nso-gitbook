---
description: Connect client libraries to NSO with IPC Ports.
---

# IPC Ports

Client libraries connect to NSO using TCP. We tell NSO which address to use for these connections through the `/ncs-config/ncs-ipc-address/ip` (default value 127.0.0.1) and `/ncs-config/ncs-ipc-address/port` (default value 4569) elements in `ncs.conf`. It is possible to change these values, but it requires a number of steps to also configure the clients. Also, there are security implications, see [Security Issues](security-issues.md).

Some clients read the environment variables `NCS_IPC_ADDR` and `NCS_IPC_PORT` to determine if something other than the default is to be used, others might need to be recompiled. This is a list of clients that communicate with NSO, and what needs to be done when `ncs-ipc-address` is changed.

<table><thead><tr><th width="218">Client</th><th>Changes required</th></tr></thead><tbody><tr><td>Remote commands via the <code>ncs</code> command</td><td>Remote commands, such as <code>ncs --reload</code>, check the environment variables <code>NCS_IPC_ADDR</code> and <code>NCS_IPC_PORT</code>.</td></tr><tr><td>CDB and MAAPI clients</td><td>The address supplied to <code>Cdb.connect()</code> and <code>Maapi.connect()</code> must be changed.</td></tr><tr><td>Data provider API clients</td><td>The address supplied to <code>Dp</code> constructor socket must be changed.</td></tr><tr><td><code>ncs_cli</code></td><td>The Command Line Interface (CLI) client, <strong>ncs_cli</strong>, checks the environment variables <code>NCS_IPC_ADDR</code> and <code>NCS_IPC_PORT</code>. Alternatively the port can be provided on the command line (using the <code>-P</code> option).</td></tr><tr><td>Notification API clients</td><td>The new address must be supplied to the socket for the <code>Nofif</code> constructor.</td></tr></tbody></table>

To run more than one instance of NSO on the same host (which can be useful in development scenarios), each instance needs its own IPC port. For each instance, set `/ncs-config/ncs-ipc-address/port` in `ncs.conf` to something different.

There are two more instances of ports that will have to be modified, NETCONF and CLI over SSH. The netconf (SSH and TCP) ports that NSO listens to by default are 2022 and 2023 respectively. Modify `/ncs-config/netconf/transport/ssh` and `/ncs-config/netconf/transport/tcp`, either by disabling them or changing the ports they listen to. The CLI over SSH by default listens to 2024; modify `/ncs-config/cli/ssh` either by disabling or changing the default port.

## Restricting Access to IPC port <a href="#ug.ncs_advanced.ipc.restricting" id="ug.ncs_advanced.ipc.restricting"></a>

By default, the clients connecting to the IPC port are considered trusted, i.e. there is no authentication required, and we rely on the use of 127.0.0.1 for `/ncs-config/ncs-ipc-address/ip` to prevent remote access. In case this is not sufficient, it is possible to restrict access to the IPC port by configuring an access check.

The access check is enabled by setting the `ncs.conf` element `/ncs-config/ncs-ipc-access-check/enabled` to `true`, and specifying a filename for `/ncs-config/ncs-ipc-access-check/filename`. The file should contain a shared secret, i.e., a random character string. Clients connecting to the IPC port will then be required to prove that they have knowledge of the secret through a challenge handshake before they are allowed access to the NSO functions provided via the IPC port.

{% hint style="info" %}
The access permissions on this file must be restricted via OS file permissions, such that it can only be read by the NSO daemon and client processes that are allowed to connect to the IPC port. E.g. if both the daemon and the clients run as root, the file can be owned by root and have only "read by owner" permission (i.e. mode 0400). Another possibility is to have a group that only the daemon and the clients belong to, set the group ID of the file to that group, and have only "read by group" permission (i.e. mode 040).
{% endhint %}

To provide the secret to the client libraries and inform them that they need to use the access check handshake, we have to set the environment variable `NCS_IPC_ACCESS_FILE` to the full pathname of the file containing the secret. This is sufficient for all the clients mentioned above, i.e., there is no need to change the application code to support or enable this check.

{% hint style="info" %}
The access check must be either enabled or disabled for both the daemon and the clients. E.g., if `/ncs-config/ncs-ipc-access-check/enabled` in `ncs.conf` is not set to `true` but clients are started with the environment variable `NCS_IPC_ACCESS_FILE` pointing to a file with a secret, the client connections will fail.
{% endhint %}
