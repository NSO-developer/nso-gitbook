---
description: Handle tasks that require root privileges.
---

# Security Issues

NSO requires some privileges to perform certain tasks. The following tasks may, depending on the target system, require root privileges.

* Binding to privileged ports. The `ncs.conf` configuration file specifies which port numbers NSO should `bind(2)` to. If any of these port numbers are lower than 1024, NSO usually requires root privileges unless the target operating system allows NSO to bind to these ports as a non-root user.
* If PAM is to be used for authentication, the program installed as `$NCS_DIR/lib/ncs/priv/pam/epam` acts as a PAM client. Depending on the local PAM configuration, this program may require root privileges. If PAM is configured to read the local `passwd` file, the program must either run as `root` or be `setuid` root. If the local PAM configuration instructs NSO to run, for example, `pam_radius_auth`, root privileges are possibly not required depending on the local PAM installation.
*   If the CLI is used and we want to create CLI commands that run executables, we may want to modify the permissions of the `$NCS_DIR/lib/ncs/lib/core/confd/priv/cmdptywrapper` program.

    \
    To be able to run an executable as root or a specific user, we need to make `cmdptywrapper` `setuid` `root`, i.e.:

    1. `# chown root cmdptywrapper`
    2. `# chmod u+s cmdptywrapper`

    Failing that, all programs will be executed as the user running the `ncs` daemon. Consequently, if that user is the `root` we do not have to perform the `chmod` operations above. The same applies to executables run via actions, but then we may want to modify the permissions of the `$NCS_DIR/lib/ncs/lib/core/confd/priv/cmdwrapper` program instead:

    1. `# chown root cmdwrapper`
    2. `# chmod u+s cmdwrapper`

NSO can be instructed to terminate NETCONF over cleartext TCP. This is useful for debugging since the NETCONF traffic can then be easily captured and analyzed. It is also useful if we want to provide some local proprietary transport mechanism that is not SSH. Clear text TCP termination is not authenticated, the clear text client simply tells NSO which user the session should run as. The idea is that authentication is already done by some external entity, such as an SSH server. If clear text TCP is enabled, NSO must bind to localhost (127.0.0.1) for these connections.

Client libraries connect to NSO. For example, the CDB API is socket based and a CDB client connects to NSO. We instruct NSO which address to use for these connections through the `ncs.conf` parameters `/ncs-config/ncs-ipc-address/ip` (default address 127.0.0.1) and `/ncs-config/ncs-ipc-address/port` (default port 4565), or which Unix socket path to use with `/ncs-config/ncs-local-ipc/path` (default `/tmp/nso/nso-ipc`).

NSO multiplexes different kinds of connections on the same IPC socket. The following programs connect on the socket:

* Remote commands, such as `ncs --reload`
* CDB clients
* External database API clients
* MAAPI, the Management Agent API clients
* The `ncs_cli` program

Since the IPC socket allows full control of the system, it is important to ensure that only trusted or authorized clients can connect. See [Restricting Access to the IPC Socket](ipc-connection.md#restricting-access-to-the-ipc-socket).
