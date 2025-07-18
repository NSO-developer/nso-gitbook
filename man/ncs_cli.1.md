# ncs_cli Man Page

`ncs_cli` - Frontend to the NSO CLI engine

## Synopsis

`ncs [options] [File]`

`ncs [--help] [--host Host] [--ip IpAddress | IpAddress/Port ] [--address Address] [--port PortNumber] [--cwd Directory] [--proto tcp> | ssh | console ] [--interactive] [--noninteractive] [--user Username] [--uid UidInt] [--groups Groups] [--gids GidList] [--gid Gid] [--opaque Opaque] [--noaaa]`

## Description

The ncs_cli program is a C frontend to the NSO CLI engine. The `ncs_cli`
program connects to NSO and basically passes data back and forth from
the user to NSO.

ncs_cli can be invoked from the command line. If so, no authentication
is done. The archetypical usage of ncs_cli is to use it as a login shell
in /etc/passwd, in which case authentication is done by the login
program.

## Options

`-h`; `--help`  
> Display help text.

`-H`; `--host` \<HostName\>  
> Gives the name of the current host. The `ncs_cli` program will use the
> value of the system call `gethostbyname()` by default. The host name
> is used in the CLI prompt.

`-A`; `--address` \<Address\>  
> CLI address to connect to. The default is 127.0.0.1. This can be
> controlled by either this flag, or the UNIX environment variable
> `NCS_IPC_ADDR`. The `-A` flag takes precedence.

`-P`; `--port` \<PortNumber\>  
> CLI port to connect to. The default is the NSO IPC port, which is 4569
> This can be controlled by either this flag, or the UNIX environment
> variable `NCS_IPC_PORT`. The `-P` flag takes precedence.

`-S`; `--socket-path` \<Path\>  
> Path of the UNIX domain socket to connect to, used in place of TCP
> (address and port). Controlled by either this flag, or the UNIX
> environment variable `NCS_IPC_PATH`. The `-S` flag takes precedence.

`-c`; `--cwd` \<Directory\>  
> The current working directory for the user once in the CLI. All file
> references from the CLI will be relative to the cwd. By default the
> value will be the actual cwd where ncs_cli is invoked.

`-p`; `--proto` `ssh` \| `tcp` \| `console`  
> The protocol the user is using to connect. This value is used in the
> audit logs. Defaults to "ssh" if `SSH_CONNECTION` environment variable
> is set, "console" otherwise.

`-i`; `--ip` \<IpAddress\> \| \<IpAddress/Port\>  
> The IP (or IP address and port) which NSO reports that the user is
> connecting from. This value is used in the audit logs. Defaults to the
> information in the `SSH_CONNECTION` environment variable if set,
> 127.0.0.1 otherwise.

`-v`; `--verbose`  
> Produce additional output about the execution of the command, in
> particular during the initial handshake phase.

`-n`; `--interactive`  
> Force the CLI to echo prompts and commands. Useful when `ncs_cli`
> auto-detects it is not running in a terminal, e.g. when executing as a
> script, reading input from a file or through a pipe.

`-N`; `--noninteractive`  
> Force the CLI to only show the output of the commands executed. Do not
> output the prompt or echo the commands, much like a shell does for a
> shell script.

`-s`; `--stop-on-error`  
> Force the CLI to terminate at the first error and use a non-zero exit
> code.

`-E`; `--escape-char` \<C\>  
> A special character that forcefully terminates the CLI when repeated
> three times in a row. Defaults to control underscore (Ctrl-\_).

`-J`; `-C`  
> This flag sets the mode of the CLI. `-J` is Juniper style CLI, `-C` is
> Cisco XR style CLI.

`-u`; `--user` \<User\>  
> The username of the connecting user. Used for access control and group
> assignment in NSO (if the group mapping is kept in NSO). The default
> is to use the login name of the user.

`-g`; `--groups` \<GroupList\>  
> A comma-separated list of groups the connecting user is a member of.
> Used for access control by the AAA system in NSO to authorize data and
> command access. Defaults to the UNIX groups that the user belongs to,
> i.e. the same as the `groups` shell command returns.

`-U`; `--uid` \<Uid\>  
> The numeric user id the user shall have. Used for executing OS
> commands on behalf of the user, when checking file access permissions,
> and when creating files. Defaults to the effective user id (euid) in
> use for running the command. Note that NSO needs to run as root for
> this to work properly.

`-G`; `--gid` \<Gid\>  
> The numeric group id of the user shall have. Used for executing OS
> commands on behalf of the user, when checking file access permissions,
> and when creating files. Defaults to the effective group id (egid) in
> use for running the command. Note that NSO needs to run as root for
> this to work properly.

`-D`; `--gids` \<GidList\>  
> A comma-separated list of supplementary numeric group ids the user
> shall have. Used for executing OS commands on behalf of the user and
> when checking file access permissions. Defaults to the supplementary
> UNIX group ids in use for running the command. Note that NSO needs to
> run as root for this to work properly.

`-a`; `--noaaa`  
> Completely disables all AAA checks for this CLI. This can be used as a
> disaster recovery mechanism if the AAA rules in NSO have somehow
> become corrupted.

`-O`; `--opaque` \<Opaque\>  
> Pass an opaque string to NSO. The string is not interpreted by NSO,
> only made available to application code. See "built-in variables" in
> [clispec(5)](clispec.5.md) and `maapi_get_user_session_opaque()` in
> [confd_lib_maapi(3)](confd_lib_maapi.3.md). The string can be given
> either via this flag, or via the UNIX environment variable
> `NCS_CLI_OPAQUE`. The `-O` flag takes precedence.

## Environment Variables

NCS_IPC_ADDR  
> Which IP address to connect to.

NCS_IPC_PORT  
> Which TCP port to connect to.

NCS_IPC_PATH  
> Which UNIX domain socket to connect to, instead of TCP address and
> port.

NCS_IPC_ACCESS_FILE  
> Path to the file containing a secret if IPC access check is enabled.

SSH_CONNECTION  
> Set by openssh and used by *ncs_cli* to determine client IP address
> etc.

TERM  
> Passed on to terminal aware programs invoked by NSO.

## Exit Codes

0  
> Normal exit

1  
> Failed to read user data for initial handshake.

2  
> Close timeout, client side closed, session inactive.

3  
> Idle timeout triggered.

4  
> Tcp level error detected on daemon side.

5  
> Internal error occurred in daemon.

5  
> User interrupted clistart using special escape char.

6  
> User interrupted clistart using special escape char.

7  
> Daemon abruptly closed socket.

8  
> Stopped on error.

## Scripting

It is very easy to use `ncs_cli` from `/bin/sh` scripts. `ncs_cli` reads
stdin and can then also be run in non interactive mode. This is the
default if stdin is not a tty (as reported by `isatty()`)

Here is example of invoking `ncs_cli` from a shell script.

<div class="informalexample">

    #!/bin/sh

    ncs_cli << EOF
    configure
    set foo bar 13
    set funky stuff 44
    commit
    exit no-confirm
    exit
    EOF

</div>

And here is en example capturing the output of `ncs_cli`:

<div class="informalexample">

    #!/bin/sh
    { ncs_cli << EOF;
    configure
    set trap-manager t2 ip-address 10.0.0.1 port 162 snmp-version 2
    commit
    exit no-confirm
    exit
    EOF
    } | grep 'Aborted:.*not unique.*'
    if [ $? != 0 ]; then
      echo 'test2: commit did not fail'; exit 1;
    fi

</div>

The above type of CLI scripting is a very efficient and easy way to test
various aspects of the CLI.
