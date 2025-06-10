---
description: Connect client libraries to NSO with IPC.
---

# IPC Connection

Client libraries connect to NSO for inter-process communication (IPC) using TCP or Unix domain sockets.

If NSO is configured to use TCP sockets for IPC, you can tell NSO which address to use for these connections through the `/ncs-config/ncs-ipc-address/ip` (default value 127.0.0.1) and `/ncs-config/ncs-ipc-address/port` (default value 4569) elements in `ncs.conf`. If you change these values, you will likely need to configure the clients accordingly. Note that these values have security implications, see [Security Issues](../installation-and-deployment/deployment/secure-deployment.md#securing-ipc-access). In particular, changing the address away from 127.0.0.1 may allow unauthenticated remote connections.

Many of the clients read the environment variables `NCS_IPC_ADDR` and `NCS_IPC_PORT` to determine if something other than the default is to be used, but others might need source code changes. This is a list of clients that communicate with NSO, and what needs to be done when `ncs-ipc-address` is changed.

<table><thead><tr><th width="218" valign="top">Client</th><th valign="top">Changes required</th></tr></thead><tbody><tr><td valign="top">Remote commands via the <code>ncs</code> command</td><td valign="top">Remote commands, such as <code>ncs --reload</code>, check the environment variables <code>NCS_IPC_ADDR</code> and <code>NCS_IPC_PORT</code>.</td></tr><tr><td valign="top">CLI tools</td><td valign="top">The Command Line Interface (CLI) client <strong>ncs_cli</strong> and similar commands, such as <strong>ncs_cmd</strong> and <strong>ncs_load</strong>, check the environment variables `NCS_IPC_ADDR` and `NCS_IPC_PORT`. Alternatively, many of them also support command line options.</td></tr><tr><td valign="top">CDB and MAAPI clients</td><td valign="top">The address supplied to <code>Cdb.connect()</code> and <code>Maapi.connect()</code> must be changed.</td></tr><tr><td valign="top">Data provider API clients</td><td valign="top">The address supplied to <code>Dp</code> constructor socket must be changed.</td></tr><tr><td valign="top">Notification API clients</td><td valign="top">The new address must be supplied to the socket for the <code>Nofif</code> constructor.</td></tr></tbody></table>

Likewise, if NSO is configured to use Unix domain sockets for IPC and you have changed the path under `/ncs-config/ncs-local-ipc/path` in `ncs.conf`, you can tell clients to use the new path through the `NCS_IPC_PATH` environment variable. Clients must also have filesystem permission to access the IPC path or they will not be able to communicate with the NSO daemon process.

To run more than one instance of NSO on the same host (which can be useful in development scenarios), each instance needs its own IPC socket. If using TCP for IPC, set `/ncs-config/ncs-ipc-address/port` in `ncs.conf` to different values for each instance. If, instead, you are using Unix sockets for IPC, set `/ncs-config/ncs-local-ipc/path` in `ncs.conf` to different values. In either case, you may also need to change the NETCONF and CLI over SSH ports under `/ncs-config/netconf/transport` and `/ncs-config/cli/ssh` by either disabling them or changing their values.

## Restricting Access to the IPC Socket

By default, clients connecting to the IPC socket are considered trusted, i.e. there is no authentication required, as the system relies on the use of 127.0.0.1 for `/ncs-config/ncs-ipc-address/ip` or Unix domain sockets to prevent remote access. In case this is not sufficient, such as when untrusted users have shell access on the system where NSO runs, it is possible to further restrict the access to the IPC socket.

If Unix domain sockets are used, you can leverage Unix filesystem permissions for the socket path, to limit which OS users and groups can initiate connections to the socket. NSO may also perform additional authentication of the connecting users, see [Authenticating IPC Access](../management/aaa-infrastructure.md#authenticating-ipc-access).

For TCP sockets, you can enable an access check by setting the `ncs.conf` element `/ncs-config/ncs-ipc-access-check/enabled` to `true`, and specifying a filename for `/ncs-config/ncs-ipc-access-check/filename`. The file should contain a shared secret, i.e., a random (printable ASCII) character string. Clients connecting to the IPC socket will then be required to prove that they have knowledge of the secret through a challenge handshake, before they are allowed access to the NSO functions provided via the IPC socket.

{% hint style="info" %}
The access permissions on this file must be restricted via OS file permissions, such that it can only be read by the NSO daemon and client processes that are allowed to connect to the IPC port. E.g. if both the daemon and the clients run as root, the file can be owned by root and have only "read by owner" permission (i.e. mode 0400). Another possibility is to have a group that only the daemon and the clients belong to, set the group ID of the file to that group, and have only "read by group" permission (i.e. mode 040).
{% endhint %}

To provide the secret to the client libraries and inform them that they need to use the access check handshake, you have to set the environment variable `NCS_IPC_ACCESS_FILE` to the full pathname of the file containing the secret. This is sufficient for all the clients mentioned above, i.e., there is no need to change the application code to support or enable this check.

{% hint style="info" %}
The access check must be either enabled or disabled for both the daemon and the clients. E.g., if `/ncs-config/ncs-ipc-access-check/enabled` in `ncs.conf` is not set to `true` but clients are started with the environment variable `NCS_IPC_ACCESS_FILE` pointing to a file with a secret, the client connections will fail.
{% endhint %}
