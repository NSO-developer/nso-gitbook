# ncs-maapi Man Page

`ncs-maapi` - command to access an ongoing transaction

## Synopsis

`ncs- --get Path`

`ncs- --set Path Value [PathValue]`

`ncs- --keys Path`

`ncs- --exists Path`

`ncs- --delete Path`

`ncs- --create Path`

`ncs- --insert Path`

`ncs- --revert`

`ncs- --msg To Message Sender --priomsg To Message --sysmsg To Message`

`ncs- --cliget Param`

`ncs- --cliset Param Value [ParamValue]`

`ncs- --cmd2path Cmd [Cmd]`

`ncs- --cmd-path [--is-deleta ] [--emit-parents ] [--non-recursive ] Path [Path]`

`ncs- --cmd-diff Path [Path]`

`ncs- --keypath-diff Path`

`ncs- --clicmd [--get-io ] [--no-hidden ] [--no-error ] [--no-aaa ] [--keep-pipe-flags ] [--no-fullpath ] [--unhide <group>] Cli command`

## Description

This command is intended to be used from inside a CLI command or a
NETCONF extension RPC. These can be implemented in several ways, as an
action callback or as an executable.

It is sometimes convenient to use a shell script to implement a CLI
command and then invoke the script as an executable from the CLI. The
ncs-maapi program makes it possible to manipulate the transaction in
which the script was invoked.

Using the ncs-maapi command it is possible to, for example, write
configuration wizards and custom show commands.

## Options

`-g`; `--get` \<Path\> ...  
> Read element value at Path and display result. Multiple values can be
> read by giving more than one Path as argument to get.

`-s`; `--set` \<Path\> \<Value\> ...  
> Set the value of Path to Value. Multiple values can be set by giving
> multiple Path Value pairs as arguments to set.

`-k`; `--keys` \<Path\> ...  
> Display all instances found at path. Multiple Paths can be specified.

`-e`; `--exists` \<Path\> ...  
> Exit with exit code 0 if Path exists (if multiple paths are given all
> must exist for the exit code to be 0).

`-d`; `--delete` \<Path\> ...  
> Delete element found at Path.

`-c`; `--create` \<Path\> ...  
> Create the element Path.

`-i`; `--insert` \<Path\> ...  
> Insert the element at Path. This is only possible if the elem has the
> 'indexed-view' attribute set.

`-z`; `--revert`  
> Remove all changes in the transaction.

`-m`; `--msg` \<To\> \<Message\> \<Sender\>  
> Send message to a user logged on to the system.

`-Q`; `--priomsg` \<To\> \<Message\>  
> Send prio message to a user logged on to the system.

`-M`; `--sysmsg` \<To\> \<Message\>  
> Send system message to a user logged on to the system.

`-G`; `--cliget` \<Param\> ...  
> Read and display CLI session parameter or attribute. Multiple params
> can be read by giving more than one Param as argument to cliget.
> Possible params are complete-on-space, idle-timeout,
> ignore-leading-space, paginate, "output file", "screen length",
> "screen width", terminal, history, autowizard, "show defaults", and if
> enabled, display-level. In addition to this the attributes called
> annotation, tags and inactive can be read.

`-S`; `--cliset` \<Param\> \<Value\> ...  
> Set CLI session parameter to Value. Multiple params can be set by
> giving more than one Param-Value pair as argument to cliset. Possible
> params are complete-on-space, idle-timeout, ignore-leading-space,
> paginate, "output file", "screen length", "screen width", terminal,
> history, autowizard, "show defaults", and if enabled, display-level.

`-E`; `--cmd-path` \[`--is-delete`\] \[`--emit-parents`\] \[`--non-recursive`\] \<Path\>  
> Display the C- and I-style command for a given path. Optionally
> display the command to delete the path, and optionally emit the
> parents, ie the commands to reach the submode of the path.

`-L`; `--cmd-diff` \<Path\>  
> Display the C- and I-style command for going from the running
> configuration to the current configuration.

`-q`; `--keypath-diff` \<Path\>  
> Display the difference between the current state in the attached
> transaction and the running configuration. One line is emitted for
> each difference. Each such line begins with the type of the change,
> followed by a colon (':') character and lastly the keypath. The type
> of the change is one of the following: "created", "deleted",
> "modified", "value set", "moved after" and "attr set".

`-T`; `--cmd2path` \<Cmd\>  
> Attempts to derive an aaa-style namespace and path from a C-/I-style
> command path.

`-C`; `--clicmd` \[`--get-io`\] \[`--no-hidden`\] \[`--no-error`\] \[`--no-aaa`\] \[`--keep-pipe-flags`\] \[`--no-fullpath`\] \[`--unhide` \<group\>\] \<Cli command to execute\>  
> Execute cli command in ongoing session, optionally ignoring that a
> command is hidden, unhiding a specific hide group, or ignoring the
> fullpath check of the argument to the show command. Multiple hide
> groups may be unhidden using the --unhide parameter multiple times.

## Example

Suppose we want to create an add-user wizard as a shell script. We would
add the command in the clispec file `ncs.cli` as follows:

<div class="informalexample">

     ...
      <configureMode>
        <cmd name="wizard">
          <info>Configuration wizards</info>
          <help>Configuration wizards</help>
          <cmd name="adduser">
            <info>Create a user</info>
            <help>Create a user</help>
            <callback>
              <exec>
                <osCommand>./adduser.sh</osCommand>
              </exec>
            </callback>
          </cmd>
        </cmd>
      </configureMode>
     ...

</div>

And have the following script `adduser.sh`:

<div class="informalexample">

    #!/usr/bin/env bash

    ## Ask for user name
    while true; do
        echo -n "Enter user name: "
        read user

        if [ ! -n "${user}" ]; then
        echo "You failed to supply a user name."
        elif ncs-maapi --exists "/aaa:aaa/authentication/users/user{${user}}"; then
        echo "The user already exists."
        else
        break
        fi
    done

    ## Ask for password
    while true; do
        echo -n "Enter password: "
        read -s pass1
        echo

        if [ "${pass1:0:1}" == "$" ]; then
        echo -n "The password must not start with $. Please choose a "
        echo    "different password."
        else
        echo -n "Confirm password: "
        read -s pass2
        echo

        if [ "${pass1}" != "${pass2}" ]; then
            echo "Passwords do not match."
        else
            break
        fi
        fi
    done

    groups=`ncs-maapi --keys "/aaa:aaa/authentication/groups/group"`
    while true; do
        echo "Choose a group for the user."
        echo -n "Available groups are: "
        for i in ${groups}; do echo -n "${i} "; done
        echo
        echo -n "Enter group for user: "
        read group

        if [ ! -n "${group}" ]; then
        echo "You must enter a valid group."
        else
        for i in ${groups}; do
            if [ "${i}" == "${group}" ]; then
            # valid group found
            break 2;
            fi
        done
        echo "You entered an invalid group."
        fi
        echo
    done

    echo
    echo "Creating user"
    echo
    ncs-maapi --create "/aaa:aaa/authentication/users/user{${user}}"
    ncs-maapi --set "/aaa:aaa/authentication/users/user{${user}}/password" \
        "${pass1}"

    echo "Setting home directory to: /var/ncs/homes/${user}"
    ncs-maapi --set "/aaa:aaa/authentication/users/user{${user}}/homedir" \
                "/var/ncs/homes/${user}"
    echo

    echo "Setting ssh key directory to: "
    echo "/var/ncs/homes/${user}/ssh_keydir"
    ncs-maapi --set "/aaa:aaa/authentication/users/user{${user}}/ssh_keydir" \
                "/var/ncs/homes/${user}/ssh_keydir"
    echo

    ncs-maapi --set "/aaa:aaa/authentication/users/user{${user}}/uid" "1000"
    ncs-maapi --set "/aaa:aaa/authentication/users/user{${user}}/gid" "100"

    echo "Adding user to the ${group} group."
    gusers=`ncs-maapi --get "/aaa:aaa/authentication/groups/group{${group}}/users"`

    for i in ${gusers}; do
        if [ "${i}" == "${user}" ]; then
        echo "User already in group"
        exit 0
        fi
    done
    ncs-maapi --set "/aaa:aaa/authentication/groups/group{${group}}/users" \
                "${gusers} ${user}"
    echo
    exit 0

          

</div>

## Diagnostics

On success exit status is 0. On failure 1 or 2. Any error message is
printed to stderr.

## Environment Variables

Environment variables are used for determining which user session and
transaction should be used when performing the operations. The
NCS_MAAPI_USID and NCS_MAAPI_THANDLE environment variables are
automatically set by NCS when invoking a CLI command, but when a NETCONF
extension RPC is invoked, only NCS_MAAPI_USID is set, since there is no
transaction associated with such an invocation.

`NCS_MAAPI_USID`  
> User session to use.

`NCS_MAAPI_THANDLE`  
> The transaction to use when performing the operations.

`NCS_MAAPI_DEBUG`  
> Maapi debug information will be printed if this variable is defined.

`NCS_IPC_ADDR`  
> The address used to connect to the NSO daemon, overrides the compiled
> in default.

`NCS_IPC_PORT`  
> The port number to connect to the NSO daemon on, overrides the
> compiled in default.

## See Also

The NSO User Guide

`ncs(1)` - command to start and control the NSO daemon

`ncsc(1)` - YANG compiler

`ncs(5)` - NSO daemon configuration file format

`clispec(5)` - CLI specification file format
