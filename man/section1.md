# Man-pages Section 1

---

## `ncs-backup`

`ncs-backup` - Command to backup and restore NCS data

### Synopsis

`ncs-backup [--install-dir InstallDir] [--no-compress]`

`ncs-backup --restore [Backup] [--install-dir InstallDir] [--non-interactive]`

### Description

The `ncs-backup` command can be used to backup and restore NCS CDB,
state data, and config files for an NCS installation. It supports both
"system installation", i.e. one that was done with the
`--system-install` option to the NCS installer (see
[ncs-installer(1)](section1.md#ncs-installer)), and "local installation" that
was probably set up using the [ncs-setup(1)](section1.md#ncs-setup) command.
Note that it is not supported to restore a backup from a "local
installation" to a "system installation", and vice versa.

Unless the `--restore` option is used, the command creates a backup. The
backup is stored in the `RunDir/backups` directory, named with the NCS
version and current date and time. In case a "local install" backup is
created, its name will also include "\_local". The `ncs-backup` command
will determine whether an NCS installation is "system" or "local" by
itself based on the directory structure.

### Options

`--restore [ Backup ]`  
> Restore a previously created backup. For backups of "system
> installations", the \<Backup\> argument is either the name of a file
> in the `RunDir/backups` directory or the full path to a backup file.
> If the argument is omitted, unless the `--non-interactive` option is
> given, the command will offer selection from available backups.
>
> For backups of "local installations", the \<Backup\> argument must be
> a path to a backup file. Also, "local installation" restoration must
> target an empty directory as `--install-dir`.

`[ --install-dir InstallDir ]`  
> Specifies the directory for installation of NCS static files, like the
> `--install-dir` option to the installer. In the case of "system
> installations", if this option is omitted, `/opt/ncs` will be used for
> \<InstallDir\>.
>
> In the case of "local installations", the `--install-dir` option
> should point to the directory containing an 'ncs.conf' file. If no
> 'ncs.conf' file is found, the default 'ncs.conf' of the NCS
> installation will be used.
>
> If you are restoring a backup of a "local installation",
> `--install-dir` needs to point to an empty directory.

`[ --non-interactive ]`  
> If this option is used, restore will proceed without asking for
> confirmation.

`[ --no-compress ]`  
> If this option is used, the backup will not be compressed (default is
> compressed). The restore will uncompress if the backup is compressed,
> regardless of this option.

---

## `ncs-collect-tech-report`

`ncs-collect-tech-report` - Command to collect diagnostics from an NCS
installation.

### Synopsis

`ncs-collect-tech-report [--install-dir InstallDir] [--full] [--num-debug-dumps Integer]`

### Description

The `ncs-collect-tech-report` command can be used to collect diagnostics
from an NCS installation. The resulting diagnostics file contains
information that is useful to Cisco support to diagnose problems and
errors.

If the NCS daemon is running, runtime data from the running daemon will
be collected. If the NCS daemon is not running, only static files will
be collected.

### Options

`[ --install-dir InstallDir ]`  
> Specifies the directory for installation of NCS static files, like the
> `--install-dir` option to the installer. If this option is omitted,
> `/opt/ncs` will be used for \<InstallDir\>.

`[ --full ]`  
> This option is used to also include a full backup (as produced by
> [ncs-backup(1)](section1.md#ncs-backup)) of the system. This helps Cisco
> support to reproduce issues locally.

`[ --num-debug-dumps Count ]`  
> This option is useful when a resource leak (memory/file descriptors)
> is suspected. It instructs the `ncs-collect-tech-report` script to run
> the command `ncs --debug-dump` multiple times.

---

## `ncs-installer`

`ncs-installer` - NCS installation script

### Synopsis

`ncs-VSN.OS.ARCH.installer.bin [--local-install] LocalInstallDir`

`ncs-VSN.OS.ARCH.installer.bin --system-install [--install-dir InstallDir] [--config-dir ConfigDir] [--run-dir RunDir] [--log-dir LogDir] [--run-as-user User] [--keep-ncs-setup] [--non-interactive] [--ignore-init-scripts] [--ignore-systemd-script]`

### Description

The NCS installation script can be invoked to do either a simple "local
installation", which is convenient for test and development purposes, or
a "system installation", suitable for deployment.

### Local Installation

`[ --local-install ] LocalInstallDir`  
> When the NCS installation script is invoked with this option, or is
> given only the \<LocalInstallDir\> argument, NCS will be installed in
> the \<LocalInstallDir\> directory only.

### System Installation

`--system-install`  
> When the NCS installation script is invoked with this option, it will
> do a system installation that uses several different directories, in
> accordance with Unix/Linux application installation standards. The
> first time a system installation is done, the following actions are
> taken:
>
> - The directories described below are created and populated.
>
> - An init script for start of NCS at system boot is installed.
>
> - User profile scripts that set up `$PATH` and other environment
>   variables appropriately for NCS users are installed.
>
> - A symbolic link that makes the installed version the currently
>   active one is created (see the `--install-dir` option).

`[ --install-dir InstallDir ]`  
> This is the directory where static files, primarily the code and
> libraries for the NCS daemon, are installed. The actual directory used
> for a given invocation of the installation script is
> `InstallDir/ncs-VSN`, allowing for coexistence of multiple installed
> versions. The currently active version is identified by a symbolic
> link `InstallDir/current` pointing to one of the `ncs-VSN`
> directories. If the `--install-dir` option is omitted, `/opt/ncs` will
> be used for \<InstallDir\>.

`[ --config-dir ConfigDir ]`  
> This directory is used for config files, e.g. `ncs.conf`. If the
> `--config-dir` option is omitted, `/etc/ncs` will be used for
> \<ConfigDir\>.

`[ --run-dir RunDir ]`  
> This directory is used for run-time state files, such as the CDB data
> base and currently used packages. If the `--run-dir` option is
> omitted, `/var/opt/ncs` will be used for \<RunDir\>.

`[ --log-dir LogDir ]`  
> This directory is used for the different log files written by NCS. If
> the `--log-dir` option is omitted, `/var/log/ncs` will be used for
> \<LogDir\>.

`[ --run-as-user User ]`  
> By default, the system installation will run NCS as the `root` user.
> If a different user is given via this option, NCS will instead be run
> as that user. The user will be created if it does not already exist.
> This mode is only supported on Linux systems that have the `setcap`
> command, since it is needed to give NCS components the required
> capabilities for some aspects of the NCS functionality.
>
> When the option is used, the following executable files (assuming that
> the default `/opt/ncs` is used for `--install-dir`) will be installed
> with elevated privileges:
>
> `/opt/ncs/current/lib/ncs/lib/core/pam/priv/epam`  
> > Setuid to root. This is typically needed for PAM authentication to
> > work with a local password file. If PAM authentication is not used,
> > or if the local PAM configuration does not require root privileges,
> > the setuid-root privilege can be removed by using `chmod u-s`.
>
> `/opt/ncs/current/lib/ncs/erts/bin/ncs` `/opt/ncs/current/lib/ncs/erts/bin/ncs.smp`  
> > Capability `cap_net_bind_service`. One of these files (normally
> > `ncs.smp`) will be used as the NCS daemon. The files have execute
> > access restricted to the user given via `--run-as-user`. The
> > capability is needed to allow the daemon to bind to ports below 1024
> > for northbound access, e.g. port 443 for HTTPS or port 830 for
> > NETCONF over SSH. If this functionality is not needed, the
> > capability can be removed by using `setcap -r`.
>
> `/opt/ncs/current/lib/ncs/bin/ip`  
> > Capability `cap_net_admin`. This is a copy of the OS `ip(8)`
> > command, with execute access restricted to the user given via
> > `--run-as-user`. The program is not used by the core NCS daemon, but
> > provided for packages that need to configure IP addresses on
> > interfaces (such as the `tailf-hcc` package). If no such packages
> > are used, the file can be removed.
>
> `/opt/ncs/current/lib/ncs/bin/arping`  
> > Capability `cap_net_raw`. This is a copy of the OS `arping(8)`
> > command, with execute access restricted to the user given via
> > `--run-as-user`. The program is not used by the core NCS daemon, but
> > provided for packages that need to send gratuitous ARP requests
> > (such as the `tailf-hcc` package). If no such packages are used, the
> > file can be removed.
>
> > [!NOTE]
> > When the `--run-as-user` option is used, all OS commands executed by
> > NCS will also run as the given user, rather than as the user
> > specified for custom CLI commands (e.g. through clispec
> > definitions).

`[ --keep-ncs-setup ]`  
> The `ncs-setup` command is not usable in a "system installation", and
> is therefore by default excluded from such an installation to avoid
> confusion. This option instructs the installation script to include
> `ncs-setup` in the installation despite this.

`[ --non-interactive ]`  
> If this option is given, the installation script will proceed with
> potentially disruptive changes (e.g. modifying or removing existing
> files) without asking for confirmation.

`[ --ignore-init-scripts ]`  
> If given this option, the installation script will not install systemd
> or SysV scripts. This can be useful when running in, for example, a
> containerized environment where init scripts are typically not used.

`[ --ignore-systemd-script ]`  
> If given this option, the installation script will not install systemd
> script. The script installs SysV scripts instead.

---

## `ncs-maapi`

`ncs-maapi` - command to access an ongoing transaction

### Synopsis

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

### Description

This command is intended to be used from inside a CLI command or a
NETCONF extension RPC. These can be implemented in several ways, as an
action callback or as an executable.

It is sometimes convenient to use a shell script to implement a CLI
command and then invoke the script as an executable from the CLI. The
ncs-maapi program makes it possible to manipulate the transaction in
which the script was invoked.

Using the ncs-maapi command it is possible to, for example, write
configuration wizards and custom show commands.

### Options

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

### Example

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

    #!/bin/bash 

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

### Diagnostics

On success exit status is 0. On failure 1 or 2. Any error message is
printed to stderr.

### Environment Variables

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

### See Also

The NSO User Guide

`ncs(1)` - command to start and control the NSO daemon

`ncsc(1)` - YANG compiler

`ncs(5)` - NSO daemon configuration file format

`clispec(5)` - CLI specification file format

---

## `ncs-make-package`

`ncs-make-package` - Command to create an NCS package

### Synopsis

`ncs-make-package [OPTIONS] package-name`

### Description

Creates an NCS package of a certain type. For NEDs, it creates a netsim
directory by default, which means that the package can be used to run
simulated devices using ncs-netsim, i.e that ncs-netsim can be used to
run simulation network that simulates devices of this type.

The generated package should be seen as an initial package structure.
Once generated, it should be manually modified when it needs to be
updated. Specifically, the package-meta-data.xml file must be modified
with correct meta data.

### Options

`-h, --help`  
> Print a short help text and exit.

`--dest` Directory  
> By default the generated package will be written to a directory in
> current directory with the same name as the provided package name.
> This optional flag writes the package to the --dest provided location.

`--build`  
> Once the package is created, build it too.

`--no-test`  
> Do not generate the test directory.

`--netconf-ned` DIR  
> Create a NETCONF NED package, using the device YANG files in DIR.

`--generic-ned-skeleton`  
> Generate a skeleton package for a generic NED. This is a good starting
> point whenever we wish to develop a new generic NED.

`--snmp-ned` DIR  
> Create a SNMP NED package, using the device MIB files in DIR.

`--lsa-netconf-ned`DIR  
> Create a NETCONF NED package for LSA, when the device is another NCS
> (the lower ncs), using the device YANG files in DIR. The NED is
> compiled with the ned-id *tailf-ncs-ned:lsa-netconf*.
>
> If the lower NCS is running a different version of NCS than the upper
> NCS or if the YANG files in DIR contains references to configuration
> data in the ncs namespace, use the option `--lsa-lower-nso`.

`--service-skeleton` java \| java-and-template \| python \| python-and-template \| template  
> Generate a skeleton package for a simple RFS service, either
> implemented by Java code, Python code, based on a template, or a
> combination of them.

`--data-provider-skeleton`  
> Generate a skeleton package for a simple data provider.

`--erlang-skeleton`  
> Generate a skeleton for an Erlang package.

`--no-fail-on-warnings`  
> By default ncs-make-package will create packages which will fail when
> encountering warnings in YANG or MIB files. This is desired and
> warnings should be corrected. This option is for legacy reasons,
> before the generated packages where not that strict.

`--nano-service-skeleton` java \| java-and-template \| python \| python-and-template \| template  
> Generate a nano skeleton package for a simple service with nano plan,
> either implemented by Java code with template or Python code with
> template, or on a template. The options java and java-and-template,
> python and python-and-template result in the same skeleton creation.

### Service Specific Options

`--augment`PATH  
> Augment the generated service model under PATH, e.g. */ncs:services*.

`--root-container`NAME  
> Put the generated service model in a container named NAME.

### Java Specific Options

`--java-package`NAME  
> NAME is the Java package name for the Java classes generated from all
> device YANG modules. These classes can be used by Java code
> implementing for example services.

### Ned Specific Options

`--no-netsim`  
> Do not generate a netsim directory. This means the package cannot be
> used by ncs-netsim.

`--no-java`  
> Do not generate any Java classes from the device YANG modules.

`--no-python`  
> Do not generate any Python classes from the device YANG modules.

`--no-template`  
> Do not generate any device templates from the device YANG modules.

`--vendor` VENDOR  
> The vendor element in the package file.

`--package-version` VERSION  
> The package-version element in the package file.

### Netconf Ned Specific Options

`--pyang-sanitize`  
> Sanitize the device's YANG files. This will invoke pyang --sanitize on
> the device YANG files.

`--confd-netsim-db-mode` candidate \| startup \| running-only  
> Control which datastore netsim should use when simulating the device.
> The candidate option here is default and it includes the setting
> writable-through-candidate

`--ncs-depend-package`DIR  
> If the yang code in a package depends on the yang code in another NCS
> package we need to use this flag. An example would be if a device
> model augments YANG code which is contained in another NCS package.
> The arg, the package we depend on, shall be relative the src directory
> to where the package is built.

### Lsa Netconf Ned Specific Options

`--lsa-lower-nso`cisco-nso-nc-X.Y \| DIR  
> Specifies the package name for the lower NCS, the package is in
> `$NCS_DIR/packages/lsa`, or a path to the package directory containing
> the cisco-nso-nc package for the lower node.
>
> The NED will be compiled with the ned-id of the package,
> *cisco-nso-nc-X.Y:cisco-nso-nc-X.Y*.

### Python Specific Options

`--component-class`module.Class  
> This optional parameter specifies the *python-class-name* of the
> generated `package-meta-data.xml` file. It must be in format
> *module.Class*. Default value is *main.Main*.

`--action-example`  
> This optional parameter will produce an example of an Action.

`--subscriber-example`  
> This optional parameter will produce an example of a CDB subscriber.

### Erlang Specific Options

`--erlang-application-name`NAME  
> Add a skeleton for an Erlang application. Invoke the script multiple
> times to add multiple applications.

### Examples

Generate a NETCONF NED package given a set of YANG files from a fictious
acme router device.

<div class="informalexample">

      $ ncs-make-package   --netconf-ned /path/to/yangfiles acme
      $ cd acme/src; make all
          

</div>

This package can now be used by ncs-netsim to create simulation networks
with simulated acme routers.

---

## `ncs-netsim`

`ncs-netsim` - Command to create and manipulate a simulated network

### Synopsis

`ncs-netsim create-network NcsPackage NumDevices Prefix [--dir NetsimDir]`

`ncs-netsim create-device NcsPackage DeviceName [--dir NetsimDir]`

`ncs-netsim add-to-network NcsPackage NumDevices Prefix [--dir NetsimDir]`

`ncs-netsim add-device NcsPackage DeviceName [--dir NetsimDir]`

`ncs-netsim delete-network [--dir NetsimDir]`

`ncs-netsim start | stop | is-alive | reset | restart | status [Devicename] [--dir NetsimDir] [--async | -a ]`

`ncs-netsim netconf-console Devicename [XPathFilter] [--dir NetsimDir]`

`ncs-netsim -w | --window cli | cli-c | cli-i Devicename [--dir NetsimDir]`

`ncs-netsim get-port Devicename [ipc | netconf | cli | snmp] [--dir NetsimDir]`

`ncs-netsim ncs-xml-init [DeviceName] [--dir NetsimDir]`

`ncs-netsim ncs-xml-init-remote RemoteNodeName [DeviceName] [--dir NetsimDir]`

`ncs-netsim list | packages | whichdir [--dir NetsimDir]`

### Description

`ncs-netsim` is a script to create, control and manipulate simulated
networks of managed devices. It is a tool targeted at NCS application
developers. Each network element is simulated by ConfD, a Tail-f tool
that acts as a NETCONF server, a Cisco CLI engine, or an SNMP agent.

### Options

#### Commands

`create-network` \<NcsPackage\> \<NumDevices\> \<Prefix\>  
> Is used to create a new simulation network. The simulation network is
> written into a directory. This directory contains references to NCS
> packages that are used to emulate the network. These references are in
> the form of relative filenames, thus the simulation network can be
> moved as long as the packages that are used in the network are also
> moved.
>
> This command can be given multiple times in one invocation of
> `ncs-netsim`. The mandatory parameters are:
>
> 1.  `NcsPackage` is a either directory where an NCS NED package (that
>     supports netsim) resides. Alternatively, just the name of one of
>     the packages in `$NCS_DIR/packages/neds` can be used.
>     Alternatively the `NcsPackage` is tar.gz package.
>
> 2.  `NumDevices` indicates how many devices we wish to have of the
>     type that is defined by the NED package.
>
> 3.  `Prefix` is a string that will be used as prefix for the name of
>     the devices

`create-device` \<NcsPackage\> \<DeviceName\>  
> Just like create-network, but creates only one device with the
> specific name (no suffix at the end)

`add-to-network` \<NcsPackage\> \<NumDevices\> \<Prefix\>  
> Is used to add additional devices to a previously existing simulation
> network. This command can be given multiple times. The mandatory
> parameters are the same as for `create-network`.
>
> > [!NOTE]
> > If we have already started NCS with an XML initialization file for
> > the existing network, an updated initialization file will not take
> > effect unless we remove the CDB database files, loosing all NCS
> > configuration. But we can replace the original initialization data
> > with data for the complete new network when we have run
> > `add-to-network`, by using `ncs_load` while NCS is running, e.g.
> > like this:
>
> <div class="informalexample">
>
>     $ ncs-netsim ncs-xml-init > devices.xml
>     $ ncs_load -l -m devices.xml
>                   
>
> </div>

`add-device` \<NcsPackage\> \<DeviceName\>  
> Just like add-to-network, but creates only one device with the
> specific name (no suffix at the end)

`delete-network`  
> Completely removes an existing simulation network. The devices are
> stopped, and the network directory is removed along with all files and
> directories inside it.
>
> This command does not do any search for the network directory, but
> only uses `./netsim` unless the `--dir NetsimDir` option is given. If
> the directory does not exist, the command does nothing, and does not
> return an error. Thus we can use it in e.g. scripts or Makefiles to
> make sure we have a clean starting point for a subsequent
> `create-network` command.

`start` \<\[DeviceName\]\>  
> Is used to start the entire network, or optionally the individual
> device called `DeviceName`

`stop` \<\[DeviceName\]\>  
> Is used to stop the entire network, or optionally the individual
> device called `DeviceName`

`is-alive` \<\[DeviceName\]\>  
> Is used to query the 'liveness' of the entire network, or optionally
> the individual device called `DeviceName`

`status` \<\[DeviceName\]\>  
> Is used to check the status of the entire network, or optionally the
> individual device called `DeviceName`.

`reset` \<\[DeviceName\]\>  
> Is used to reset the entire network back into the state it was before
> it was started for the first time. This means that the devices are
> stopped, and all cdb files, log files and state files are removed. The
> command can also be performed on an individual device `DeviceName`.

`restart` \<\[DeviceName\]\>  
> This is the equivalent of 'stop', 'reset', 'start'

`-w | -window`; `cli | cli-c | cli-i` \<DeviceName\>  
> Invokes the ConfD CLI on the device called `DeviceName`. The flavor of
> the CLI will be either of Juniper (default) Cisco IOS (cli-i) or Cisco
> XR (cli-c). The -w option creates a new window for the CLI

`whichdir`  
> When we create the netsim environment with the `create-network`
> command, the data will by default be written into the `./netsim`
> directory unless the `--dir NetsimDir` is given.
>
> All the control commands to stop, start, etc., the network need access
> to the netsim directory where the netsim data resides. Unless the
> `--dir NetsimDir` option is given we will search for the netsim
> directory in \$PWD, and if not found there go upwards in the directory
> hierarchy until we find a netsim directory.
>
> This command prints the result of that netsim directory search.

`list`  
> The netsim directory that got created by the `create-network` command
> contains a static file (by default `./netsim/.netsiminfo`) - this
> command prints the file content formatted. This command thus works
> without the network running.

`netconf-console` \<DeviceName\> \<\[XpathFilter\]\>  
> Invokes the `netconf-console` NETCONF client program towards the
> device called `DeviceName`. This is an easy way to get the
> configuration from a simulated device in XML format.

`get-port` \<DeviceName\> `[ipc | netconf | cli | snmp]`  
> Prints the port number that the device called `DeviceName` is
> listening on for the given protocol - by default, the ipc port is
> printed.

`ncs-xml-init` \<\[DeviceName\]\>  
> Usually the purpose of running `ncs-netsim` is that we wish to
> experiment with running NCS towards that network. This command
> produces the XML data that can be used as initialization data for NCS
> and the network defined by this ncs-netsim installation.

`ncs-xml-init-remote` \<RemoteNodeName\> \<\[DeviceName\]\>  
> Just like ncs-xml-init, but creates initialization data for service
> NCS node in a device cluster. The RemoteNodeName parameter specifies
> the device NCS node in cluster that has the corresponding device(s)
> configured in its /devices/device tree.

`packages`  
> List the NCS NED packages that were used to produce this ncs-netsim
> network.

#### Common options

`--dir` \<NetsimDir\>  
> When we create a network, by default it's created in `./netsim`. When
> we invoke the control commands, the netsim directory is searched for
> in the current directory and then upwards. The `--dir` option
> overrides this and creates/searches and instead uses `NetsimDir` for
> the netsim directory.

`--async | -a`  
> The start, stop, restart and reset commands can use this additional
> flag that runs everything in the background. This typically reduces
> the time to start or stop a netsim network.

### Examples

To create a simulation network we need at least one NCS NED package that
supports netsim. An NCS NED package supports netsim if it has a `netsim`
directory at the top of the package. The NCS distribution contains a
number of packages in \$NCS_DIR/packages/neds. So given those NED
packages, we can create a simulation network that use ConfD, together
with the YANG modules for the device to emulate the device.

<div class="informalexample">

    $ ncs-netsim create-network $NCS_DIR/packages/neds/c7200 3 c \
                 create-network $NCS_DIR/packages/neds/nexus 3 n
        

</div>

The above command creates a test network with 6 routers in it. The data
as well the execution environment for the individual ConfD devices
reside in (by default) directory ./netsim. At this point we can
start/stop/control the network as well as the individual devices with
the ncs-netsim control commands.

<div class="informalexample">

    $ ncs-netsim -a start
    DEVICE c0 OK STARTED
    DEVICE c1 OK STARTED
    DEVICE c2 OK STARTED
    DEVICE n0 OK STARTED
    DEVICE n1 OK STARTED
    DEVICE n2 OK STARTED
        

</div>

Starts the entire network.

<div class="informalexample">

    $ ncs-netsim stop c0
        

</div>

Stops the simulated router named *c0*.

<div class="informalexample">

    $ ncs-netsim cli n1
        

</div>

Starts a Juniper CLI towards the device called *n1*.

### Environment Variables

- *NETSIM_DIR* if set, the value will be used instead of the
  `--dir Netsimdir` option to search for the netsim directory containing
  the environment for the emulated network

  Thus, if we always use the same netsim directory in a development
  project, it may make sense to set this environment variable, making
  the netsim environment available regardless of where we are in the
  directory structure.

- *IPC_PORT* if set, the ConfD instances will use the indicated number
  and upwards for the local IPC port. Default is 5010. Use this if your
  host occupies some of the ports from 5010 and upwards.

- *NETCONF_SSH_PORT* if set, the ConfD instances will use the indicated
  number and upwards for the NETCONF ssh (if configured in confd.conf)
  Default is 12022. Use this if your host occupies some of the ports
  from 12022 and upwards.

- *NETCONF_TCP_PORT* if set, the ConfD instances will use the indicated
  number and upwards for the NETCONF tcp (if configured in confd.conf)
  Default is 13022. Use this if your host occupies some of the ports
  from 13022 and upwards.

- *SNMP_PORT* if set, the ConfD instances will use the indicated number
  and upwards for the SNMP udp traffic. (if configured in confd.conf)
  Default is 11022. Use this if your host occupies some of the ports
  from 11022 and upwards.

- *CLI_SSH_PORT* if set, the ConfD instances will use the indicated
  number and upwards for the CLI ssh traffic. (if configured in
  confd.conf) Default is 10022. Use this if your host occupies some of
  the ports from 10022 and upwards.

The `ncs-setup` tool will use these numbers as well when it generates
the init XML for the network in the `ncs-netsim` network.

---

## `ncs-project-create`

`ncs-project-create` - Command to create an NCS project

### Synopsis

`ncs-project create [OPTIONS] project-name`

### Description

Creates an NCS project, which consists of directories, configuration
files and packages necessary to run an NCS system.

After running this command, the command: *ncs-project update* , should
be run.

The NCS project connects an NCS installation with an arbitrary number of
packages. This is declared in a `project-meta-data.xml` file which is
located in the directory structure as created by this command.

The generated project should be seen as an initial project structure.
Once generated, the `project-meta-data.xml` file should be manually
modified. After the `project-meta-data.xml` file has been changed the
command *ncs-project setup* should be used to bring the project content
up to date.

A package, defined in the `project-meta-data.xml` file, can be located
at a remote git repository and will then be cloned; or the package may
be local to the project itself.

If a package version is specified to origin from a git repository, it
may refer to a particular git commit hash, a branch or a tag. This way
it is possible to either lock down an exact package version or always
make use of the latest version of a particular branch.

A package can also be specified as *local*, which means that it exists
in place and no attempts to retrieve it will be made. Note however that
it still needs to be a proper package with a `package-meta-data.xml`
file.

There is also an option to create a project from an exported bundle. The
bundle is generated using the *ncs-project export* command.

### Options

`-h, --help`  
> Print a short help text and exit.

`-d, --dest` Directory  
> Specify the project (directory) location. The directory will be
> created if not existing. If not specified, the *project-name* will be
> used.

`-u, --ncs-bin-url` URL  
> Specify the exact URL pointing to an NCS install binary. Can be a
> *http://* or *file:///* URL.

`--from-bundle=<bundle_path>` URL  
> Specify the exact path pointing to a bundled NCS Project. The bundle
> should have been created using the *ncs-project export* command.

### Examples

Generate a project using whatever NCS we have in our PATH.

<div class="informalexample">

      $ ncs-project create foo-project
      Creating directory: /home/my/foo-project
      using locally installed NCS
      wrote project to /home/my/foo-project
          

</div>

Generate a project using a particular NCS release, located at a
particular directory.

<div class="informalexample">

      $ ncs-project create -u file:///lab/releases/ncs-4.0.1.linux.x86_64.installer.bin foo-project
      Creating directory: /home/my/foo-project
      cp /lab/releases/ncs-4.0.1.linux.x86_64.installer.bin /home/my/foo-project
      Installing NCS...
      INFO  Using temporary directory /tmp/ncs_installer.25681 to stage NCS installation bundle
      INFO  Unpacked ncs-4.0.1 in /home/my/foo-project/ncs-installdir
      INFO  Found and unpacked corresponding DOCUMENTATION_PACKAGE
      INFO  Found and unpacked corresponding EXAMPLE_PACKAGE
      INFO  Generating default SSH hostkey (this may take some time)
      INFO  SSH hostkey generated
      INFO  Environment set-up generated in /home/my/foo-project/ncs-installdir/ncsrc
      INFO  NCS installation script finished
      INFO  Found and unpacked corresponding NETSIM_PACKAGE
      INFO  NCS installation complete

      Installing NCS...done
      DON'T FORGET TO: source /home/my/foo-project/ncs-installdir/ncsrc
      wrote project to /home/my/foo-project
          

</div>

Generate a project using a project bundle created with the export
command.

<div class="informalexample">

      $  ncs-project create --from-bundle=test_bundle-1.0.tar.gz --dest=installs
      Using NCS 4.2.0 found in /home/jvikman/dev/tailf/ncs_dir
      wrote project to /home/my/installs/test_bundle-1.0
          

</div>

After a project has been created, we need to have its
`project-meta-data.xml` file updated before making use of the
*ncs-project update* command.

---

## `ncs-project-export`

`ncs-project-export` - Command to create a bundle from a NCS project

### Synopsis

`ncs-project export [OPTIONS] project-name`

### Description

Collects relevant packages and files from an existing NCS project and
saves them in a tar file - a *bundle*. This exported bundle can then be
distributed to be unpacked, either with the *ncs-project create*
command, or simply unpacked using the standard *tar* command.

The bundle is declared in the `project-meta-data.xml` file in the
*bundle* section. The packages included in the bundle are leafrefs to
the packages defined at the root of the model. We can also define a
specific tag, commit or branch, even a different location for the
packages, different from the one used while developing. For example we
might develop against an experimental branch of a repository, but bundle
with a specific release of that same repository. Tags or commit SHA
hashes are recommended since branch HEAD pointers usually are a moving
target. Should a branch name be used, a warning is issued.

A list of extra files to be included can be specified.

Url references will not be built, i.e they will be added to the bundle
as is.

The list of packages to be included in the bundle can be picked from git
repositories or locally in the same way as when updating an NCS Project.

Note that the generated `project-meta-data.xml` file, included in the
bundle, will specify all the packages as *local* to avoid any dangling
pointers to non-accessible git repositories.

### Options

`-h, --help`  
> Print a short help text and exit.

`-v, --verbose`  
> Print debugging information when creating the bundle.

`--prefix=<prefix>`  
> Add a prefix to the bundle file name. Cannot be used together with the
> name option.

`--pkg-prefix=<prefix>`  
> Use a specific prefix for the compressed packages used in the bundle
> instead of the default "ncs-\$lt;vsn\>" where the \<vsn\> is the NCS
> version that ncs-project is shipped with.

`--name=<name>`  
> Skip any configured name and use *name* as the bundle file name.

`--skip-build`  
> When the packages have been retrieved from their different locations,
> this option will skip trying to build the packages. No (re-)build will
> occur of the packages. This can be used to export a bundle for a
> different NCS version.

`--skip-pkg-update`  
> This option will not try to use the package versions defined in the
> "bundle" part of the project-meta-data, but instead use whatever
> versions are installed in the "packages" directory. This can be used
> to export modified packages. Use with care.

`--snapshot`  
> Add a timestamp to the bundle file name.

### Examples

Generate a bundle, this command is run in a directory containing a NSO
project.

<div class="informalexample">

      $ ncs-project export
      Creating bundle ...
      Creating bundle ... ok
          

</div>

We can also export a bundle with a specific name, below we will create a
bundle called `test.tar.gz`.

<div class="informalexample">

      $ ncs-project export --name=test
      Creating bundle ...
      Creating bundle ... ok
          

</div>

Example of how to specify some extra files to be included into the
bundle, in the `project-meta-data.xml` file.

<div class="informalexample">

      <bundle>
        <name>test_bundle</name>
        <includes>
          <file>
            <path>README</path>
          </file>
          <file>
            <path>ncs.conf</path>
          </file>
        </includes>
        ...
      </bundle>
          

</div>

Example of how to specify packages to be included in the bundle, in the
`project-meta-data.xml` file.

<div class="informalexample">

      <bundle>
        ...
        <package>
          <name>resource-manager</name>
          <git>
            <repo>ssh://git@stash.tail-f.com/pkg/resource-manager.git</repo>
            <tag>1.2</tag>
          </git>
        </package>
        <!-- Use the repos specified in '../../packages-store' -->
        <package>
          <name>id-allocator</name>
          <git>
            <tag>1.0</tag>
          </git>
        </package>
        <!-- A local package -->
        <!-- (the version vill be picked from the package-meta-data.xml) -->
        <package>
          <name>my-local</name>
          <local/>
        </package>
      </bundle>
          

</div>

Example of how to extract only the packages using *tar*.

<div class="informalexample">

      tar xzf my_bundle-1.0.tar.gz my_bundle-1.0/packages
          

</div>

The command uses a temporary directory called *.bundle*, the directory
contains copies of the included packages, files and
project-meta-data.xml. This temporary directory is removed by the export
command. Should it remain for some reason it can safely be removed.

The tar-ball can be extracted using *tar* and the packages can be
installed like any other packages.

---

## `ncs-project-git`

`ncs-project-git` - For each package git repo, execute a git command

### Synopsis

`ncs-project git [OPTIONS]`

### Description

When developing a project which has many packages coming from remote git
repositories, it is convenient to be able to run git commands over all
those packages. For example, to display the latest diff or log entry in
each and every package. This command makes it possible to do exactly
this.

Note that the generated top project Makefile already contain two make
targets (gstat and glog) to perform two very common functions for
showing any changed but uncomitted files and for showing the last log
entry. The same functions can be achieved with this command, although it
may require some more typing, see the example below.

### Options

``  
> Any git command, including options.

### Examples

Show the latest log entry in each package.

<div class="informalexample">

      $ ncs-project git --no-pager log -n 1

      ------ Package: esc
      commit ccdf889f5fe46d92b5901c7faa9c749f500c68f9
      Author: Bill Smith <void@cisco.com>
      Date:   Wed Oct 14 10:46:38 2015 +0200

          Getting the latest model changes

      ------ Package: cisco-ios
      commit 05a221ab024108e311709d6491ba8526c31df0ed
      Merge: ea72b1e 82e281e
      Author: tailf-stash.gen@cisco.com <void@tail-f.com>
      Date:   Wed Oct 14 21:09:10 2015 +0200

          Merge pull request #8 in NED/cisco-ios

      ....
          

</div>

---

## `ncs-project-setup`

`ncs-project-setup` - Command to setup and maintain an NCS project

### Synopsis

`ncs-project setup [OPTIONS] project-name`

### Description

This command is deprecated, please use the *update* command instead.

---

## `ncs-project-update`

`ncs-project-update` - Command to update and maintain an NCS project

### Synopsis

`ncs-project update [OPTIONS] project-name`

### Description

Update and maintain an NCS project. This involves fetching packages as
defined in `project-meta-data.xml`, and/or update already fetched
packages.

For packages, specified to origin from a git repository, a number of git
commands will be performed to get it up to date. First a *git stash*
will be performed in order to protect from potential data loss of any
local changes made. Then a *git fetch* will be made to bring in the
latest commits from the origin (remote) git repository. Finally, the
local branch, tag or commit hash will be restored, with a *git reset*,
according to the specification in the `project-meta-data.xml` file.

Any package specified as *local* will be left unaffected.

Any package which, in its `package-meta-data.xml` file, has a required
dependency, will have that dependency resolved. First, if a
*packages-store* has been defined in the `project-meta-data.xml` file.
The dependent package will be search for in that location. If this
fails, an attempt to checkout the dependent package via git will be
attempted.

The *ncs-project update* command is intended to be called as soon as you
want to bring your project up to date. Each time called, the command
will recreate the `setup.mk` include file which is intended to be
included by the top Makefile. This file will contain make targets for
compiling the packages and to setup any netsim devices.

### Options

`-h, --help`  
> Print a short help text and exit.

`-v`  
> Print information messages about what is being done.

`-y`  
> Answer yes on every questions. Will cause overwriting to any earlier
> *setup.mk* files.

`--ncs-min-version`  
> 

`--ncs-min-version-non-strict`  
> 

`--use-bundle-packages`  
> Update using the packages defined in the bundle section.

### Examples

Bring a project up to date.

<div class="informalexample">

      $ ncs-project update -v
      ncs-project: installing packages...
      ncs-project: updating package alu-sr...
      ncs-project: cd /home/my/mpls-vpn-project/packages/alu-sr
      ncs-project: git stash   # (to save any local changes)
      ncs-project: git checkout -q "stable"
      ncs-project: git fetch
      ncs-project: git reset --hard origin/stable
      ncs-project: updating package alu-sr...done
      ncs-project: installing packages...ok
      ncs-project: resolving package dependencies...
      ncs-project: filtering missing pkgs for
         "/home/my/mpls-vpn-project/packages/ipaddress-allocator"
      ncs-project: missing packages:
      [{<<"resource-manager">>,undefined}]
      ncs-project: No version found for dependency: "resource-manager" ,
         trying git and the stable branch
      ncs-project: git clone "ssh://git@stash.tail-f.com/pkg/resource-manager.git"
         "/home/my/mpls-vpn-project/packages/resource-manager"
      ncs-project: git checkout -q "stable"
      ncs-project: filtering missing pkgs for
         "/home/my/mpls-vpn-project/packages/resource-manager"
      ncs-project: missing packages:
      [{<<"cisco-ios">>,<<"3.0.2">>}]
      ncs-project: unpacked tar file:
         "/store/releases/ncs-pkgs/cisco-ios/3.0.4/ncs-3.0.4-cisco-ios-3.0.2.tar.gz"
      ncs-project: resolving package dependencies...ok
          

</div>

---

## `ncs-project`

`ncs-project` - Command to invoke NCS project commands

### Synopsis

`ncs-project command [OPTIONS]`

### Description

This command is used to invoke one of the NCS project commands.

An NCS project is a complete running NCS installation. It can contain
all the needed packages and the config data that is required to run the
system.

The NCS project is described in a project-meta-data.xml file according
to the `tailf-ncs-project.yang` Yang model. By using the ncs-project
commands, the complete project can be populated. This can be used for
encapsulating NCS demos or even a full blown turn-key system.

Each command is described in its own man-page, which can be displayed by
calling: `ncs-project help` *\<command\>*

The *OPTIONS* are forwarded to the the invoked script verbatim.

### Command

`create`  
> Create a new NCS project.

`export`  
> Export an NCS project.

`git`  
> For each git package repository, execute an arbitrary git command.

`update`  
> Populate a new NCS project or update an existing project. NOTE: Was
> called 'setup' earlier.

`help` command  
> Display the man-page for the specified NCS project command.

---

## `ncs-setup`

`ncs-setup` - Command to create an initial NCS setup

### Synopsis

`ncs-setup --dest Directory [--netsim-dir Directory] --force-generic [--package Dir|Name...] [--generate-ssh-keys] [--use-copy] [--no-netsim]`

`ncs-setup --eclipse-setup [--dest Directory]`

`ncs-setup --reset [--dest Directory]`

### Description

The `ncs-setup` command is used to create an initial execution
environment for a "local install" of NCS. It does so by generating a set
of files and directories together with an ncs.conf file. The files and
directories are created in the --dest Directory, and NCS can be launched
in that self-contained directory. For production, it is recommended to
instead use a "system install" - see the
[ncs-installer(1)](section1.md#ncs-installer).

Without any options an NCS setup without any default packages is
created. Using the `--netsim-dir` and `--package` options, initial
environments for using NCS towards simulated devices, real devices, or a
combination thereof can be created.

> **Note**  
>  
> This command is not included by default in a "system install" of NCS
> (see [ncs-installer(1)](section1.md#ncs-installer)), since it is not usable
> in such an installation. The (single) execution environment is created
> by the NCS installer when it is invoked with the `--system-install`
> option.

### Options

`--dest` Directory  
> ncs-setup generates files and directories, all files are written into
> the --dest directory. The directory is created if non existent.

`--netsim-dir` Directory  
> If you have an existing ncs-netsim simulation environment, that
> environment consists of a set of devices. These devices may be
> NETCONF, CLI or SNMP devices and the ncs-netsim tool can be used to
> create, control and manipulate that simulation network.
>
> A common developer use case with ncs-setup is that we wish to use NCS
> to control a simulated network. The option --netsim-dir sets up NCS to
> manage all the devices in that simulated network. All hosts in the
> simulated network are assumed to run on the same host as ncs.
> ncs-setup will generate an XML initialization file for all devices in
> the simulated network.

`--force-generic`  
> Generic devices used in a simulated netsim network will normally be
> run as netconf devices. Use this option if the generic devices should
> be forced to be run as generic devices.

`--package` Directory \| Name  
> When you want to create an execution environment where NCS is used to
> control real, actual managed devices we can use the --package option.
> The option can be given more than once to add more packages at the
> same time.
>
> The main purpose of this option is to creates symbolic links in
> ./packages to the NED (or other) package(s) indicated to the command.
> This makes sure that NCS finds the packages when it starts.
>
> For all NED packages that ship together with NCS, i.e packages that
> are found under \$NCS_DIR/packages/neds we can just provide the name
> of the NED. We can also give the path to a NED package.
>
> > [!NOTE]
> > The script also accepts the alias `--ned-package` (to be backwards
> > compatible). Both options do the same thing, create links to your
> > package regardless of what kind of package it is.
>
> To setup NCS to manage Juniper and Cisco routers we execute:
>
> <div class="informalexample">
>
>        $ ncs-setup --package juniper --package ios
>               
>
> </div>
>
> If we have developed our own NED package to control our own ACME
> router, we can do:
>
> <div class="informalexample">
>
>        $ ncs-setup --package /path/to/acme-package
>               
>
> </div>

`--generate-ssh-keys`  
> This option generates fresh ssh keys. By default the keys in
> `${NCS_DIR}/etc/ncs/ssh` are used. This is useful so that the ssh keys
> don't change when a new NCS release is installed. Each NCS release
> comes with newly generated SSH keys.

`--use-copy`  
> By default, ncs-setup will create relative symbolic links in the
> ./packages directory. This option copies the packages instead.

`--no-netsim`  
> By default, ncs-setup searches upward in the directory hierarchy for a
> netsim directory. The chosen netsim directory will be used to populate
> the initial CDB data for the managed devices. This option disables
> this behavior.

Once the initial execution environment is set up, these two options can
be used to assist setting up an Eclipse environment or cleaning up an
existing environment.

`--eclipse-setup`  
> When developing the Java code for an NCS application, this command can
> be used to setup eclipse .project and .classpath appropriately. The
> .classpath will also contain that source path to all of the NCS Java
> libraries.

`--reset`  
> This option resets all data in NCS to "factory defaults" assuming that
> the layout of the NCS execution environment is created by `ncs-setup`.
> All CDB database files and all log files are removed. The daemon is
> also stopped

### Simulation Example

If we have a NETCONF device (which has a set of YANG files and we wish
to create a simulation environment for those devices we may combine the
three tools 'ncs-make-package', 'ncs-netsim' and 'ncs-setup' to achieve
this. Assume all the yang files for the device resides in
`/path/to/yang` we need to

- Create a package for the YANG files.

  <div class="informalexample">

        $ ncs-make-package   --netconf-ned /path/to/yang acme
                  

  </div>

  This creates a package in ./acme

- Setup a network simulation environment. We choose to create a
  simulation network with 5 routers named r0 to r4 with the ncs-netsim
  tool.

  <div class="informalexample">

        $ ncs-netsim create-network ./acme 5 r
                  

  </div>

  The network simulation environment will be created in ./netsim

- Finally create a directory where we execute NCS

  <div class="informalexample">

      $ ncs-setup --netsim-dir netsim --dest ./acme_nms \
                  --generate-ssh-keys
      $ cd ./acme_nms; ncs-setup --eclipse-setup
                

  </div>

This results in a simulation environment that looks like:

<div class="informalexample">

               ------
               | NCS |
               -------
                  |
                  |
                  |
     ------------------------------------
       |      |      |       |      |
       |      |      |       |      |
     ----    ----   ----    ----   ----
     |r0 |   |r1|   |r2|    |r3|   |r4|
     ----    ----   ----    ----   ----

        

</div>

with NCS managing 5 simulated NETCONF routers, all running ConfD on
localhost (on different ports) and all running the YANG models from
`/path/to/yang`

---

## `ncs-uninstall`

`ncs-uninstall` - Command to remove NCS installation

### Synopsis

`ncs-uninstall --ncs-version [Version] [--install-dir InstallDir] [--non-interactive]`

`ncs-uninstall --all [--install-dir InstallDir] [--non-interactive]`

### Description

The `ncs-uninstall` command can be used to remove part or all of an NCS
"system installation", i.e. one that was done with the
`--system-install` option to the NCS installer (see
[ncs-installer(1)](section1.md#ncs-installer)).

### Options

`--ncs-version [ Version ]`  
> Removes the installation of static files for NCS version \<Version\>.
> I.e. the directory tree rooted at `InstallDir/ncs-Version` will be
> removed. The \<Version\> argument may also be given as the filename or
> pathname of the installation directory, or, unless `--non-interactive`
> is given, omitted completely in which case the command will offer
> selection from the installed versions.

`--all`  
> Completely removes the NCS installation. I.e. the whole directory tree
> rooted at \<InstallDir\>, as well as the directories for config files
> (option `--config-dir` to the installer), run-time state files (option
> `--run-dir` to the installer), and log files (option `--log-dir` to
> the installer), and also the init script and user profile scripts.

`[ --install-dir InstallDir ]`  
> Specifies the directory for installation of NCS static files, like the
> `--install-dir` option to the installer. If this option is omitted,
> `/opt/ncs` will be used for \<InstallDir\>.

`[ --non-interactive ]`  
> If this option is used, removal will proceed without asking for
> confirmation.

---

## `ncs`

`ncs` - command to start and control the NCS daemon

### Synopsis

`ncs [--conf ConfFile] [--cd Dir] [--addloadpath Dir] [--nolog ] [--smp Nr] [--foreground [-v | --verbose] [--stop-on-eof]] [--with-package-reload ] [--ignore-initial-validation ] [--full-upgrade-validation ] [--disable-compaction-on-start ] [--start-phase0 ] [--epoll {true | false}]`

`ncs {--wait-phase0[TryTime] | --start-phase1 | --start-phase2 | --wait-started[TryTime] | --reload | --areload | --status | --check-callbacks [Namespace | Path] | --loadfile File | --rollback Nr | --debug-dump File [Options...] | --cli-j-dump File | --loadxmlfiles File | --mergexmlfiles File | --stop } [--timeout MaxTime]`

`ncs {--version | --cdb-debug-dump Directory [Options...] | --cdb-compact Directory}`

### Description

Use this command to start and control the NCS daemon.

### Starting Ncs

These options are relevant when starting the NCS daemon.

`-c`, `--conf` ConfFile  
> ConfFile is the path to a ncs.conf file. If the `-c File` argument is
> not given to `ncs`, first `$PWD` is searched for a file called
> `ncs.conf`, if not found `$NCS_DIR/etc/ncs/ncs.conf` is chosen.

`--cd` Dir  
> Change working directory

`--addloadpath` Dir  
> Add Dir to the set of directories NCS uses to load fxs, clispec, NCS
> packages and SNMP bin files.

`--nolog`  
> Do not log initial startup messages to syslog.

`--smp` Nr  
> Number of threads to run for Symmetric Multiprocessing (SMP). The
> default is to enable SMP support, with as many threads as the system
> has logical processors, if more than one logical processor is
> detected. Giving a value of 1 will disable SMP support, while a value
> bigger than 1 will enable SMP support, where NCS will at any given
> time use at most as many logical processors as the number of threads.

`--foreground [ -v | --verbose ] [ --stop-on-eof ]`  
> Do not start as a daemon. Can be used to start NCS from a process
> manager. In combination with -v or --verbose, all log messages are
> printed to stdout. Useful during development. In combination with
> --stop-on-eof, NCS will stop if it receives EOF (ctrl-d) on standard
> input. Note that to stop NCS when run in foreground, send EOF (if
> --stop-on-eof was used) or use ncs --stop. Do not terminate with
> ctrl-c, since NCS in that case won't have the chance to close the
> database files.

`--with-package-reload`  
> When NCS starts, if the private package directory tree already exists,
> NCS will load the packages from this directory tree and not search the
> load-path for packages. If the --with-package-reload option is given
> when starting NCS, the load-path will be searched and the packages
> found there copied to the private package directory tree, replacing
> the previous contents, before loading. This should always be used when
> upgrading to a new version of NCS in an existing directory structure,
> to make sure that new packages are loaded together with the other
> parts of the new system.
>
> When NCS is started from the /etc/init.d scripts, that get generated
> by the --system-install option to the NCS installer, the environment
> variable NCS_RELOAD_PACKAGES can be set to 'true' to attempt a package
> reload.

`--with-package-reload-force`  
> When reloading packages NCS will give a warning when the upgrade looks
> "suspicious", i.e. may break some functionality. This is not a strict
> upgrade validation, but only intended as a hint to NSO administrator
> early in the upgrade process that something might be wrong. Please
> refer to Loading Packages section in NSO Administration Guide for more
> information.
>
> If all changes indicated by the warnings are intended, this option
> allows to override warnings and proceed with the upgrade. This option
> is equivalent to setting NCS_RELOAD_PACKAGES environment variable to
> 'force'.

`--ignore-initial-validation`  
> When CDB starts on an empty database, or when upgrading, it starts a
> transaction to load the initial configuration or perform the upgrade.
> This option makes NCS skip any validation callpoints when committing
> these initial transaction. (The preferred alternative is to use
> start-phases and register the validation callpoints in phase 0, see
> the user guide).

`--full-upgrade-validation`  
> Perform a full validation of the entire database if the data models
> have been upgraded. This is useful in order to trigger external
> validation to run even if the database content has not been modified.

`--disable-compaction-on-start`  
> Do not compact CDB files when starting the NCS daemon.

`--start-phase0`  
> Start the daemon, but only start internal subsystems and CDB. Phase 0
> is used when a controlled upgrade is done.

`--epoll { true | false }`  
> Determines whether NCS should use an enhanced poll() function (e.g.
> Linux epoll(7)). This can improve performance when NCS has a high
> number of connections, but there may be issues with the implementation
> in some OS/kernel versions. The default is true.

### Communicating With Ncs

When the NCS daemon has been started, these options are used to
communicate with the running daemon.

By default these options will perform their function by connecting to a
running NCS daemon over the default IPC socket. If the daemon is not
listening on its standard port/path, set the environment variables
`NCS_IPC_ADDR`/`NCS_IPC_PORT` or `NCS_IPC_PATH` accordingly. The used
values should match those specified in either the
/ncs-config/ncs-ipc-address or /ncs-config/ncs-local-ipc of the
[ncs.conf(5)](section5.md#ncs.conf) (if both sets are provided,
`NCS_IPC_PATH` takes precedence). See the section on IPC in the Admin
Guide for details.

`--wait-phase0 [ TryTime ]`  
> This call hangs until NCS has initialized start phase0. After this
> call has returned, it is safe to register validation callbacks,
> upgrade CDB etc. This function is useful when NCS has been started
> with --foreground and --start-phase0. It will keep trying the initial
> connection to NCS for at most TryTime seconds (default 5).

`--start-phase1`  
> Do not start the subsystems that listen to the management IP address.
> Must be called after the daemon was started with --start-phase0.

`--start-phase2`  
> Must be called after the management interface has been brought up, if
> --start-phase1 has been used. Starts the subsystems that listens to
> the management IP address.

`--wait-started [ TryTime ]`  
> This call hangs until NCS is completely started. This function is
> useful when NCS has been started with --foreground. It will keep
> trying the initial connection to NCS for at most TryTime seconds
> (default 5).

`--reload`  
> Reload the NCS daemon configuration. All log files are closed and
> reopened, which means that `ncs --reload` can be used from e.g.
> logrotate(8), but it is more efficient to use `ncs_cmd -c reopen_logs`
> for this purpose. Note: If we update a .fxs file it is not enough to
> do a reload; the "packages reload" action must be invoked, or the
> daemon must be restarted with the `--with-package-reload` option.

`--areload`  
> Asynchronously reload the NCS daemon configuration. This can be used
> in scripts executed by the NCS daemon.

`--stop`  
> Stop the NCS daemon.

`--status`  
> Prints status information about the NCS daemon on stdout. Among the
> things listed are: loaded namespaces, current user sessions,
> callpoints (and whether they are registered or not), CDB status, and
> the current start-phase. Start phases are reported as "status:" and
> can be one of starting (which is pre-phase0), phase0, phase1, started
> (i.e. phase2), or stopping (which means that NCS is about to
> shutdown).

`--debug-dump File [Options...]`  
> Dump debug information from an already running NCS daemon into a
> \<File\>. The file only makes sense to NCS developers. It is often a
> good idea to include a debug dump in NCS trouble reports.
>
> Additional options are supported as following
>
> `--collect-timeout Seconds`  
> > Extend the timeout when collecting information to build the debug
> > dump. The default timeout is 10 seconds.
>
> `--compress`  
> > Compress the debug dump to \<File.gz\>

`--cli-j-dump File`  
> Dump cli structure information from the NCS daemon into a file.

`--check-callbacks [Namespace | Path]`  
> Walks through the entire data tree (config and stat), or only the
> Namespace or Path, and verifies that all read-callbacks are
> implemented for all elements, and verifies their return values.

`--loadfile File`  
> Load configuration in curly bracket format from File.

`--rollback Nr`  
> Rollback configuration to saved configuration number Nr.

`--loadxmlfiles File ...`  
> Load configuration in XML format from Files. The configuration is
> completely replaced by the contents in Files.

`--mergexmlfiles File ...`  
> Load configuration in XML format from Files. The configuration is
> merged with the contents in Files. The XML may use the 'operation'
> attribute, in the same way as it is used in a NETCONF \<edit-config\>
> operation.

`--timeout MaxTime`  
> Specify the maximum time to wait for the NCS daemon to complete the
> command, in seconds. If this option is not given, no timeout is used..

### Standalone Options

`--cdb-debug-dump Directory [Options...] [Subtrees...]`  
> Print debug information about the CDB files in \<Directory\> to
> stdout. This is a completely stand-alone feature and the only thing
> needed is the .cdb files (no running NCS daemon or .fxs files etc).
>
> Additional options may be provided to alter the output format and
> content.
>
> Specify subtrees to prevent printing the entire database.
>
> `file_debug`  
> > Dump raw file contents with keypaths.
>
> `file_debug_hkp`  
> > Dump raw file contents with hashed keypaths.
>
> `ns_debug`  
> > Dump fxs headers and namespace list.
>
> `schema_debug`  
> > Dump extensive schema information.
>
> `validate_utf8`  
> > Only emit paths and content with invalid UTF-8.
>
> `xml`  
> > Dump file contents as XML files, without output to stdout. The files
> > will be named A.xml, O.xml and S.xml if data is available.
>
> `help`  
> > Print help text.
>
> The output may also be filtered by file type using the *skip_conf*,
> *skip_oper* and *skip_snap* options to filter out configuration,
> operational and snapshot databases respectively.

`--cdb-compact Directory`  
> Compact CDB files in \<Directory\>. This is a completely stand-alone
> feature and the only thing needed is the .cdb files (no running NCS
> daemon or .fxs files etc).

`--version`  
> Reports the ncs version without interacting with the daemon.

`--timeout MaxTime`  
> See above

### Environment

When NCS is started from the /etc/init.d scripts, that get generated by
the --system-install option to the NCS installer, the environment
variable NCS_RELOAD_PACKAGES can be set to 'true' to attempt a package
reload.

The environment variables `NCS_IPC_PORT`, `NCS_IPC_ADDR` and
`NCS_IPC_PATH` control how to connect to a running NCS daemon. These
variables generally have no effect when starting the daemon, since the
values are read from the configuration file
[ncs.conf(5)](section5.md#ncs.conf). The exception is `NCS_IPC_PATH`, which
overrides the configuration file if set, enabling the Unix domain socket
at the specified path.

### Diagnostics

If NCS starts, the exit status is 0. If not it is a positive integer.
The different meanings of the different exit codes are documented in the
"NCS System Management" chapter in the user guide. When failing to
start, the reason is stated in the NCS daemon log. The location of the
daemon log is specified in the ConfFile as described in
[ncs.conf(5)](section5.md#ncs.conf).

### See Also

`ncs.conf(5)` - NCS daemon configuration file format

---

## `ncs_cli`

`ncs_cli` - Frontend to the NSO CLI engine

### Synopsis

`ncs [options] [File]`

`ncs [--help] [--host Host] [--ip IpAddress | IpAddress/Port ] [--address Address] [--port PortNumber] [--cwd Directory] [--proto tcp> | ssh | console ] [--interactive] [--noninteractive] [--user Username] [--uid UidInt] [--groups Groups] [--gids GidList] [--gid Gid] [--opaque Opaque] [--noaaa]`

### Description

The ncs_cli program is a C frontend to the NSO CLI engine. The `ncs_cli`
program connects to NSO and basically passes data back and forth from
the user to NSO.

ncs_cli can be invoked from the command line. If so, no authentication
is done. The archetypical usage of ncs_cli is to use it as a login shell
in /etc/passwd, in which case authentication is done by the login
program.

### Options

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
> [clispec(5)](section5.md#clispec) and `maapi_get_user_session_opaque()` in
> [confd_lib_maapi(3)](section3.md#confd_lib_maapi). The string can be given
> either via this flag, or via the UNIX environment variable
> `NCS_CLI_OPAQUE`. The `-O` flag takes precedence.

### Environment Variables

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

### Exit Codes

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

### Scripting

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

---

## `ncs_cmd`

`ncs_cmd` - Command line utility that interfaces to common NSO library
functions

### Synopsis

`ncs [common options] [filename]`

`ncs [common options] -c string`

`ncs -h | -h commands | -h command-name`

Common options:

`[-r | -o | -e | -S] [-f [w] | [p] | [r | s]] [-a address] [-p port] [-u user] [-g group] [-x context] [-s] [-m] [-h] [-d]`

### Description

The `ncs_cmd` utility is implemented as a wrapper around many common CDB
and MAAPI function calls. The purpose is to make it easier to prototype
and test various NSO issues using normal scripting tools.

Input is provided as a file (default `stdin` unless a filename is given)
or as directly on the command line using the `-c string` option. The
`ncs_cmd` expects commands separated by semicolon (;) or newlines. A
pound (#) sign means that the rest of the line is treated as a comment.
For example:

<div class="informalexample">

    ncs_cmd -c get_phase

</div>

Would print the current start-phase of NSO, and:

<div class="informalexample">

    ncs_cmd -c "get_phase ; get_txid"

</div>

would first print the current start-phase, then the current transaction
ID of CDB.

Sessions towards CDB, and transactions towards MAAPI are created
as-needed. At the end of the script any open CDB sessions are closed,
and any MAAPI read/write transactions are committed.

### Options

`-d`  
> Debug flag. Add more to increase debug level. All debug output will be
> to stderr.

`-m`  
> Don't load the schemas at startup.

### Environment Variables

`NCS_IPC_ADDR`  
> The address used to connect to the NSO daemon, overrides the compiled
> in default.

`NCS_IPC_PORT`  
> The port number to connect to the NSO daemon on, overrides the
> compiled in default.

### Examples

1.  <div class="informalexample">

    Getting the address of eth0

        ncs_cmd -c "get /sys:sys/ifc{eth0}/ip"

    </div>

2.  <div class="informalexample">

    Setting a leaf in CDB operational

        ncs_cmd -o -c "set /sys:sys/ifc{eth0}/stat/tx 88"

    </div>

3.  <div class="informalexample">

    Making NSO running on localhost the HA primary, with the name node0

        ncs_cmd -c "primary node0"

    Then tell the NSO also running on localhost, but listening on port
    4566, to become secondary and name it node1

        ncs_cmd -p 4566 -c "secondary node1 node0 127.0.0.1"

    </div>

---

## `ncs_load`

`ncs_load` - Command line utility to load and save NSO configurations

### Synopsis

`ncs [-W] [-S] [common options] [filename]`

`ncs -l [-m | -r | -j | -n] [-D] [common options] [filename...]`

`ncs -h | -?`

Common options:

`[-d] [-t] [-F {x | p | o | j | c | i | t}] [-H | -U] [-a] [-e] [ [-u user] [-g group...] [-c context] | [-i]] [[-p keypath] | [-P XPath]] [-o] [-s] [-O] [-b] [-M]`

### Description

This command provides a convenient way of loading and saving all or
parts of the configuration in different formats. It can be used to
initialize or restore configurations as well as in CLI commands.

If you run `ncs_load` without any options it will print the current
configuration in XML format on stdout. The exit status will be zero on
success and non-zero otherwise.

### Common Options

`-d`  
> Debug flag. Add more to increase debug level. All debug output will be
> to stderr.

`-t`  
> Measure how long the requested command takes and print the result on
> stderr.

`-F` \<format\>  
> Selects the format of the configuration when loading and saving, can
> be one of following:
>
> x  
> > XML (default)
>
> p  
> > Pretty XML
>
> o  
> > JSON
>
> j  
> > J-style CLI
>
> c  
> > C-style CLI
>
> i  
> > I-style CLI
>
> t  
> > C-style CLI using turbo parser. Only applicable for load config

`-H`  
> Hide all hidden nodes. By default, no nodes are hidden unless
> `ncs_load` has attached to an existing transaction, in which case the
> hidden nodes are the same as in that transaction's session.

`-U`  
> Unhide all hidden nodes. By default, no nodes are hidden unless
> `ncs_load` has attached to an existing transaction, in which case the
> hidden nodes are the same as in that transaction's session.

`-u` \<user\>; `-g` \<group\> ...; `-c` \<context\>  
> Loading and saving the configuration is done in a user session, using
> these options it is possible to specify which user, groups (more than
> one `-g` can be used to add groups), and context that should be used
> when starting the user session. If only a user is supplied the user is
> assumed to belong to a single group with the same name as the user.
> This is significant in that AAA rules will be applied for the
> specified user / groups / context combination. The default is to use
> the `system` context, which implies that AAA rules will *not* be
> applied at all.
>
> > [!NOTE]
> > If the environment variables `NCS_MAAPI_USID` and
> > `NCS_MAAPI_THANDLE` are set (see the ENVIRONMENT section), or if the
> > `-i` option is used, these options are silently ignored, since
> > `ncs_load` will attach to an existing transaction.

`-i`  
> Instead of starting a new user session and transaction, `ncs_load`
> will try to attach to the init session. This is only valid when NSO is
> in start phase 0, and will fail otherwise. It can be used to load a
> “factory default”file during startup, or loading a file during
> upgrade.

### Save Configuration

By default the complete current configuration will be output on stdout.
To save it in a file add the filename on the command line (the `-f`
option is deprecated). The file is opened by the `ncs_load` utility,
permissions and ownership will be determined by the user running
`ncs_load`. Output format is specified using the `-F` option.

When saving the configuration in XML format, the context of the user
session (see the `-c` option) will determine which namespaces with
export restriction (from `tailf:export`) that are included. If the
`system` context is used (this is the default), all namespaces are
saved, regardless of export restriction. When saving the configuration
in one of the CLI formats, the context used for this selection is always
`cli`.

A number of options are only applicable, or have a special meaning when
saving the configuration:

`-f` \<filename\>  
> Filename to save configuration to (option is deprecated, just give the
> filename on the command line).

`-W`  
> Include leaves which are unset (set to their default value) in the
> output. By default these leaves are not included in the output.

`-S`  
> Include the default value of a leaf as a comment (only works for CLI
> formats, not XML). (Corresponds to the `MAAPI_CONFIG_SHOW_DEFAULTS`
> flag).

`-p` \<keypath\>  
> Only include the configuration below \<keypath\> in the output.

`-P` \<XPath\>  
> Filter the configuration using the \<XPath\> expression. (Only works
> for the XML format.)

`-o`  
> Include operational data in the output. (Corresponds to the
> `MAAPI_CONFIG_WITH_OPER` flag).

`-O`  
> Include *only* operational data, and ancestors to operational data
> nodes, in the output. (Corresponds to the `MAAPI_CONFIG_OPER_ONLY`
> flag).

`-b`  
> Include only data stored in CDB in the output. (Corresponds to the
> `MAAPI_CONFIG_CDB_ONLY` flag).

`-M`  
> Include NCS service-meta-data attributes in the output. (Corresponds
> to the `MAAPI_CONFIG_WITH_SERVICE_META` flag).

### Load Configuration

When the `-l` option is present `ncs_load` will load all the files
listed on the command line . The file(s) are expected to be in XML
format unless otherwise specified using the `-F` flag. Note that it is
the NSO daemon that opens the file(s), it must have permission to do so.
However relative pathnames are assumed to be relative to the working
directory of the `ncs_load` command .

If neither of the `-m` and `-r` options are given when multiple files
are listed on the command line, `ncs_load` will silently treat the
second and subsequent files as if `-m` had been given, i.e. it will
merge in the contents of these files instead of deleting and replacing
the configuration for each file. Note, we almost always want the merge
behavior. If no file is given, or "-" is given as a filename, `ncs_load`
will stream standard input to NSO .

`-f` \<filename\>  
> The file to load (deprecated, just list the file after the options
> instead).

`-m`  
> Merge in the contents of \<filename\>, the (somewhat unfortunate)
> default is to delete and replace.

`-j`  
> Do not run FASTMAP, if FASTMAPPED service data is loaded, we sometimes
> do not want to run the mapper code. One example is a backup saved in
> XML format that contains both device data and also service data.

`-n`  
> Only load data to CDB inside NCS, do not attempt to perform any update
> operations towards the managed devices. This corresponds to the
> 'no-networking' flag to the commit command in the NCS CLI.

`-x`  
> Lax loading. Only applies to XML loading. Ignore unknown namespaces,
> attributes and elements.

`-r`  
> Replace the part of the configuration that is present in \<filename\>,
> the default is to delete and replace. (Corresponds to the
> `MAAPI_CONFIG_REPLACE` flag).

`-a`  
> When loading configuration in 'i' or 'c' format, do a commit operation
> after each line. Default and recommended is to only commit when all
> the configuration has been loaded. (Corresponds to the
> `MAAPI_CONFIG_AUTOCOMMIT` flag).

`-e`  
> When loading configuration do not abort when encountering errors
> (corresponds to the `MAAPI_CONFIG_CONTINUE_ON_ERROR` flag).

`-D`  
> Delete entire config before loading.

`-p` \<keypath\>  
> Delete everything below \<keypath\> before loading the file.

`-o`  
> Accept but ignore contents in the file which is operational data
> (without this flag it will be an error).

`-O`  
> Start a transaction to load *only* operational data, and ancestors to
> operational data nodes. Only supported for XML input.

### Examples

Reloading all xml files in the cdb directory

    ncs_load -D -m -l cdb/*.xml

Merging in the contents of `conf.cli`

    ncs_load -l -m -F j conf.cli

Print interface config and statistics data in cli format

    ncs_load -F i -o -p /sys:sys/ifc

Using xslt to format output

    ncs_load -F x -p /sys:sys/ifc | xsltproc fmtifc.xsl -

Using xmllint to pretty print the xml output

    ncs_load -F x | xmllint --format -

Saving config and operational data to `/tmp/conf.xml`

    ncs_load -F x -o > /tmp/conf.xml

Measure how long it takes to fetch config

    ncs_load -t > /dev/null
    elapsed time: 0.011 s

Output all instances in list /foo/table which has ix larger than 10

    ncs_load -F x -P "/foo/table[ix > 10]"

### Environment

`NCS_IPC_ADDR`  
> The address used to connect to the NSO daemon, overrides the compiled
> in default.

`NCS_IPC_PORT`  
> The port number to connect to the NSO daemon on, overrides the
> compiled in default.

`NCS_MAAPI_USID`; `NCS_MAAPI_THANDLE`  
> If set `ncs_load` will attach to an existing transaction in an
> existing user session instead of starting a new session.
>
> These environment variables are set by the NSO CLI when it invokes
> external commands, which means you can run `ncs_load` directly from
> the CLI. For example, the following addition to the
> \<operationalMode\> in a clispec file (see
> [clispec(5)](section5.md#clispec))
>
> <div class="informalexample">
>
>     <cmd name="servers" mount="show">
>       <info/>
>       <help/>
>       <callback>
>         <exec>
>           <osCommand>ncs_load</osCommand>
>               <args>-F j -p /system/servers</args>
>         </exec>
>       </callback>
>     </cmd>
>
> </div>
>
> will add a `show servers` command which, when run will invoke
> `ncs_load -F j -p /system/servers`. This will output the configuration
> below /system/servers in curly braces format.
>
> Note that when these environment variables are set, it means that the
> configuration will be loaded into the current CLI transaction (which
> must be in configure mode, and have AAA permissions to actually modify
> the config). To load (or save) a file in a separate transaction, unset
> these two environment variables before invoking the `ncs_load`
> command.

---

## `ncsc`

`ncsc` - NCS YANG compiler

### Synopsis

`ncsc -c [-a | --annotate YangAnnotationFile] [--deviation DeviationFile] [--skip-deviation-fxs] [-o FxsFile] [--verbose] [--fail-on-warnings] [-E | --error ErrorCode...] [-W | --warning ErrorCode...] [--allow-interop-issues] [-w | --no-warning ErrorCode...] [--strict-yang] [--no-yang-source] [--include-doc] [--use-description [always]] [[--no-features] | [-F | --feature Features...]] [-C | --conformance [modulename:]implement | [modulename:]import...] [--datastore operational] [--ignore-unknown-features] [--max-status current | deprecated | obsolete] [-p | --prefix Prefix] [--yangpath YangDir] [--export Agent [-f FxsFileOrDir...]...] -- YangFile`

`ncsc --strip-yang-source FxsFile`

`ncsc --list-errors`

`ncsc --list-builtins`

`ncsc -c [-o CclFile] ClispecFile`

`ncsc -c [-o BinFile] [-I Dir] MibFile`

`ncsc -c [-o BinFile] [--read-only] [--verbose] [-I Dir] [--include-file BinFile] [--fail-on-warnings] [--warn-on-type-errors ] [--warn-on-access-mismatch ] [--mib-annotation MibA] [-f FxsFileOrDir...] -- MibFile FxsFile`

`ncsc --ncs-compile-bundle Directory [--yangpath YangDir] [--fail-on-warnings] [--ncs-skip-template] [--ncs-skip-statistics] [--ncs-skip-config] [--lax-revsion-merge] [--ncs-depend-package PackDir] [--ncs-apply-deviations] [--ncs-no-apply-deviations] [--allow-interop-issues] --ncs-device-type netconf | snmp-ned | generic-ned | cli-ned --ncs-ned-id ModName:IdentityName --ncs-device-dir Directory`

`ncsc --ncs-compile-mib-bundle Directory [--fail-on-warnings] [--ncs-skip-template] [--ncs-skip-statistics] [--ncs-skip-config] --ncs-device-type netconf | snmp-ned | generic-ned | cli-ned --ncs-device-dir Directory`

`ncsc --ncs-compile-module YangFile [--yangpath YangDir] [--fail-on-warnings] [--ncs-skip-template] [--ncs-skip-statistics] [--ncs-skip-config] [--ncs-keep-callpoints] [--lax-revision-merge] [--ncs-depend-package PackDir] [--allow-interop-issues] --ncs-device-type netconf | snmp-ned | generic-ned | cli-ned --ncs-ned-id ModName:IdentityName --ncs-device-dir Directory`

`ncsc --emit-java JFile [--print-java-filename ] [--java-disable-prefix ] [--java-package Package] [--exclude-enums ] [--fail-on-warnings ] [-f FxsFileOrDir...] [--builtin ] FxsFile`

`ncsc --emit-python PyFile [--print-python-filename ] [--no-init-py ] [--python-disable-prefix ] [--exclude-enums ] [--fail-on-warnings ] [-f FxsFileOrDir...] [--builtin ] FxsFile`

`ncsc --emit-mib MibFile [--join-names capitalize | hyphen] [--oid OID] [--top Name] [--tagpath Path] [--import Module Name] [--module Module] [--generate-oids ] [--generate-yang-annotation] [--skip-symlinks] [--top Top] [--fail-on-warnings ] [--no-comments ] [--read-only ] [--prefix Prefix] [--builtin ] -- FxsFile`

`ncsc --mib2yang-std [-p | --prefix Prefix] [-o YangFile] -- MibFile`

`ncsc --mib2yang-mods [--mib-annotation MibA] [--keep-readonly] [--namespace Uri] [--revision Date] [-o YangDeviationFile] -- MibFile`

`ncsc --mib2yang [--mib-annotation MibA] [--emit-doc] [--snmp-name] [--read-only] [-u Uri] [-p | --prefix Prefix] [-o YangFile] -- MibFile`

`ncsc --snmpuser EngineID User AuthType PrivType PassPhrase`

`ncsc --revision-merge [-o ResultFxs] [-v ] [-f FxsFileOrDir...] -- ListOfFxsFiles`

`ncsc --lax-revision-merge [-o ResultFxs] [-v ] [-f FxsFileOrDir...] -- ListOfFxsFiles`

`ncsc --get-info FxsFile`

`ncsc --get-uri FxsFile`

`ncsc --version`

### Description

During startup the NSO daemon loads .fxs files describing our
configuration data models. A .fxs file is the result of a compiled YANG
data model file. The daemon also loads clispec files describing
customizations to the auto-generated CLI. The clispec files are
described in [clispec(5)](section5.md#clispec).

A yang file by convention uses .yang (or .yin) filename suffix. YANG
files are directly transformed into .fxs files by ncsc.

We can use any number of .fxs files when working with the NSO daemon.

The `--emit-java` option is used to generate a .java file from a .fxs
file. The java file is used in combination with the Java library for
Java based applications.

The `--emit-python` option is used to generate a .py file from a .fxs
file. The python file is used in combination with the Python library for
Python based applications.

The `--print-java-filename` option is used to print the resulting name
of the would be generated .java file.

The `--print-python-filename` option is used to print the resulting name
of the would be generated .py file.

The `--python-disable-prefix` option is used to prevent prepending the
YANG module prefix to each symbol in the generated .py file.

A clispec file by convention uses a .cli filename suffix. We use the
ncsc command to compile a clispec into a loadable format (with a .ccl
suffix).

A mib file by convention uses a .mib filename suffix. The ncsc command
is used for compiling the mib with one or more fxs files (containing OID
to YANG mappings) into a loadable format (with a .bin suffix). See the
NSO User Guide for more information about compiling the mib.

Take a look at the EXAMPLE section for a crash course.

### Options

#### Common options

`-f`; `--fxsdep` \<FxsFileOrDir\>...  
> .fxs files (or directories containing .fxs files) to be used to
> resolve cross namespace dependencies.

`--yangpath` \<YangModuleDir\>  
> YangModuleDir is a directory containing other YANG modules and
> submodules. This flag must be used when we import or include other
> YANG modules or submodules that reside in another directory.

`-o`; `--output` \<File\>  
> Put the resulting file in the location given by File.

#### Compile options

`-c`; `--compile` \<File\>  
> Compile a YANG file (.yang/.yin) to a .fxs file or a clispec (.cli
> file) to a .ccl file, or a MIB (.mib file) to a .bin file

`-a`; `--annotate` \<AnnotationFile\>  
> YANG users that are utilizing the tailf:annotate extension must use
> this flag to indicate the YANG annotation file(s).
>
> This parameter can be given multiple times.

`--deviation`\<DeviationFile\>  
> Indicates that deviations from the module in *DeviationFile* should be
> present in the fxs file.
>
> This parameter can be given multiple times.
>
> By default, the *DeviationFile* is emitted as an fxs file. To skip
> this, use `--skip-deviation-fxs`. If `--output` is used, the deviation
> fxs file will be created in the same path as the output file.

`--skip-deviation-fxs`  
> Skips emitting the deviation files as fxs files.

`-F`\<features\>; `--feature`\<features\>  
> Indicates that support for the YANG *features* should be present in
> the fxs file. \<features\> is a string on the form
> \<modulename\>:\[\<feature\>(,\<feature\>)\*\]
>
> This option is used to prune the data model by removing all nodes in
> all modules that are defined with an "if-feature" that is not listed
> as \<feature\>. Therefore, if this option is given, all features in
> all modules that are supported must be listed explicitly.
>
> If this option is not given, nothing is pruned, i.e., it works as if
> all features were explicitly listed.
>
> This option can be given multiple times.
>
> If the module uses a feature defined in an imported YANG module, it
> must be given as \<modulename:feature\>.

`--no-yang-source`  
> By default, the YANG module and submodules source is included in the
> fxs file, so that a NETCONF or RESTCONF client can download the module
> from the server.
>
> If this option is given, the YANG source is not included.

`--no-features`  
> Indicates that no YANG features from the given module are supported.

`--ignore-unknown-features`  
> Instructs the compiler to not give an error if an unknown feature is
> specified with `--feature`.

`--max-status current | deprecated | obsolete`  
> Only include definitions with status greater than or equal to the
> given status. For example, to compile a module without support for all
> obsolete definitions, give `--max-status deprecated`.
>
> To include support for some deprecated or obsolete nodes, but not all,
> a deviation module is needed which removes support for the unwanted
> nodes.

`-C`\<conformance\>; `--conformance`\<conformance\>  
> Indicates that the YANG module either is implemented (default) or just
> compiled for import purposes. *conformance* is a string on the form
> \<\[modulename:\]\>\<implement\|import\>
>
> If a module is compiled for import, it will be advertised as such in
> the YANG library data.

`--datastore`\<operational\>  
> Indicates that the YANG module is present only in the operational
> state datastore.

`-p`; `--prefix` \<Prefix\>  
> NCS needs to have a unique prefix for each loaded YANG module, which
> is used e.g. in the CLI and in the APIs. By default the prefix defined
> in the YANG module is used, but this prefix is not required to be
> unique across modules. This option can be used to specify an alternate
> prefix in case of conflicts. The special value 'module-name' means
> that the module name will be used for this prefix.

`--include-doc`  
> Normally, 'description' statements are ignored by ncsc. If this option
> is present, description text is included in the .fxs file, and will be
> available as help text in the Web UI. In the CLI the description text
> will be used as information text if no 'tailf:info' statement is
> present.

`--use-description [always]`  
> Normally, 'description' statements are ignored by ncsc. Instead the
> 'tailf:info' statement is used as information text in the CLI and Web
> UI. When this option is specified, text in 'description' statements is
> used if no 'tailf:info' statement is present. If the option *always*
> is given, 'description' is used even if 'tailf:info' is present.

`--export` \<Agent\> ...  
> Makes the namespace visible to Agent. Agent is either "none", "all",
> "netconf", "snmp", "cli", "webui", "rest" or a free-text string. This
> option overrides any `tailf:export` statements in the module. The
> option "all" makes it visible to all agents. Use "none" to make it
> invisible to all agents.

`--fail-on-warnings`  
> Make compilation fail on warnings.

`-W` \<ErrorCode\>  
> Treat \<ErrorCode\> as a warning, even if `--fail-on-warnings` is
> given. \<ErrorCode\> must be a warning or a minor error.
>
> Use `--list-errors` to get a listing of all errors and warnings.
>
> The following example treats all warnings except the warning for
> dependency mismatch as errors:
>
> <div class="informalexample">
>
>     $ ncsc -c --fail-on-warnings -W TAILF_DEPENDENCY_MISMATCH
>
> </div>

`-w` \<ErrorCode\>  
> Do not report the warning \<ErrorCode\>, even if `--fail-on-warnings`
> is given. \<ErrorCode\> must be a warning.
>
> Use `--list-errors` to get a listing of all errors and warnings.
>
> The following example ignores the warning TAILF_DEPENDENCY_MISMATCH:
>
> <div class="informalexample">
>
>     $ ncsc -c -w TAILF_DEPENDENCY_MISMATCH
>
> </div>

`-E` \<ErrorCode\>  
> Treat the warning \<ErrorCode\> as an error.
>
> Use `--list-errors` to get a listing of all errors and warnings.
>
> The following example treats only the warning for unused import as an
> error:
>
> <div class="informalexample">
>
>     $ ncsc -c -E UNUSED_IMPORT
>
> </div>

`--allow-interop-issues`  
> Report YANG_ERR_XPATH_REF_BAD_CONFIG as a warning instead of an error.
> Be advised that this violates RFC7950 section 6.4.1; a constraint on a
> config true node contains an XPath expression may not refer to a
> config false node.

`--strict-yang`  
> Force strict YANG compliance. Currently this checks that the deref()
> function is not used in XPath expressions and leafrefs.

#### Standard MIB to YANG options

`--mib2yang-std MibFile`  
> Generate a YANG file from the MIB module (.mib file), in accordance
> with the IETF standard, RFC-6643.
>
> If the MIB IMPORTs other MIBs, these MIBs must be available (as .mib
> files) to the compiler when a YANG module is generated. By default,
> all MIBs in the current directory and all builtin MIBs are available.
> Since the compiler uses the tool `smidump` to perform the conversion
> to YANG, the environment variable `SMIPATH` can be set to a
> colon-separated list of directories to search for MIB files.

`-p`; `--prefix` \<Prefix\>  
> Specify a prefix to use in the generated YANG module.
>
> An appendix to the RFC describes how the prefix is automatically
> generated, but such an automatically generated prefix is not always
> unique, and NSO requires unique prefixes in all loaded modules.

#### Standard MIB to YANG modification options

`--mib2yang-mods MibFile`  
> Generate a combined YANG deviation/annotation file from the MIB module
> (.mib file), which can be used to compile the yang file generated by
> --mib2yang-std, to achieve a similar result as with the non-standard
> --mib2yang translation.

`--mib-annotation` \<MibA\>  
> Provide a MIB annotation file to control how to override the standard
> translation of specific MIB objects to YANG. See
> [mib_annotations(5)](section5.md#mib_annotations).

`--revision Date`  
> Generate a revision statement with the provided Date as value in the
> deviation/annotation file.

`--namespace` \<Uri\>  
> Specify a uri to use as namespace in the generated
> deviation/annotation module.

`--keep-readonly`  
> Do not generate any deviations of the standard config (false)
> statements. Without this flag, config statements will be deviated to
> true on yang nodes corresponding to writable MIB objects.

#### MIB to YANG options

`--mib2yang MibFile`  
> Generate a YANG file from the MIB module (.mib file).
>
> If the MIB IMPORTs other MIBs, these MIBs must be available (as .mib
> files) to the compiler when a YANG module is generated. By default,
> all MIBs in the current directory and all builtin MIBs are available.
> Since the compiler uses the tool `smidump` to perform the conversion
> to YANG, the environment variable `SMIPATH` can be set to a
> colon-separated list of directories to search for MIB files.

`-u`; `--uri` \<Uri\>  
> Specify a uri to use as namespace in the generated YANG module.

`-p`; `--prefix` \<Prefix\>  
> Specify a prefix to use in the generated YANG module.

`--mib-annotation` \<MibA\>  
> Provide a MIB annotation file to control how to translate specific MIB
> objects to YANG. See [mib_annotations(5)](section5.md#mib_annotations).

`--snmp-name`  
> Generate the YANG statement "tailf:snmp-name" instead of
> "tailf:snmp-oid".

`--read-only`  
> Generate a YANG module where all nodes are "config false".

#### MIB compiler options

`-c`; `--compile` \<MibFile\>  
> Compile a MIB module (.mib file) to a .bin file.
>
> If the MIB IMPORTs other MIBs, these MIBs must be available (as
> compiled .bin files) to the compiler. By default, all compiled MIBs in
> the current directory and all builtin MIBs are available. Use the
> parameters *--include-dir* or *--include-file* to specify where the
> compiler can find the compiled MIBs.

`--verbose`  
> Print extra debug info during compilation.

`--read-only`  
> Compile the MIB as read-only. All SET attempts over SNMP will be
> rejected.

`-I`; `--include-dir` \<Dir\>  
> Add the directory Dir to the list of directories to be searched for
> IMPORTed MIBs (.bin files).

`--include-file` \<File\>  
> Add File to the list of files of IMPORTed (compiled) MIB files. File
> must be a .bin file.

`--fail-on-warnings`  
> Make compilation fail on warnings.

`--warn-on-type-errors`  
> Warn rather than give error on type checks performed by the MIB
> compiler.

`--warn-on-access-mismatch`  
> Give a warning if an SNMP object has read only access to a config
> object.

`--mib-annotation` \<MibA\>  
> Provide a MIB annotation file to fine-tune how specific MIB objects
> should behave in the SNMP agent. See
> [mib_annotations(5)](section5.md#mib_annotations).

#### Emit SMIv2 MIB options

`--emit-mib` \<MibFile\>  
> Generates a MIB file for use with SNMP agents/managers. See the
> appropriate section in the SNMP agent chapter in the NSO User Guide
> for more information.

`--join-names capitalize`  
> Join element names without separator, but capitalizing, to get the MIB
> name. This is the default.

`--join-names hyphen`  
> Join element names with hyphens to get the MIB name.

`--join-names force-capitalize`  
> The characters '.' and '\_' can occur in YANG identifiers but not in
> SNMP identifiers; they are converted to hyphens, unless this option is
> given. In this case, such identifiers are capitalized (to
> lowerCamelCase).

`--oid` \<OID\>  
> Let *OID* be the top object's OID. If the first component of the OID
> is a name not defined in SNMPv2-SMI, the `--import` option is also
> needed in order to produce a valid MIB module, to import the name from
> the proper module. If this option is not given, a `tailf:snmp-oid`
> statement must be specified in the YANG header.

`--tagpath Path`  
> Generate the MIB only for a subtree of the module. The *Path* argument
> is an absolute schema node identifier, and it must refer to container
> nodes only.

`--import` \<Module\> \<Name\>  
> Add an IMPORT statement which imports *Name* from the MIB *Module*.

`--top` \<Name\>  
> Let *Name* be the name of the top object.

`--module` \<Name\>  
> Let *Name* be the module name. If a `tailf:snmp-mib-module-name`
> statement is in the YANG header, the two names must be equal.

`--generate-oids`  
> Translate all data nodes into MIB objects, and generate OIDs for data
> nodes without `tailf:snmp-oid` statements.

`--generate-yang-annotation`  
> Generate a YANG annotation file containing the `tailf:snmp-oid`,
> `tailf:snmp-mib-module-name` and `tailf:snmp-row-status-column`
> statements for the nodes. Implies `--skip-symlinks`.

`--skip-symlinks`  
> Do not generate MIB objects for data nodes modeled through symlinks.

`--fail-on-warnings`  
> If this option is used all warnings are treated as errors and ncsc
> will fail its execution.

`--no-comments`  
> If this option is used no additional comments will be generated in the
> MIB.

`--read-only`  
> If this option is used all objects in the MIB will be read only.

`--prefix` \<String\>  
> Prefix all MIB object names with *String*.

`--builtin`  
> If a MIB is to be emitted from a builtin YANG module, this option must
> be given to ncsc. This will result in the MIB being emitted from the
> system builtin .fxs files. It is not possible to change builtin models
> since they are system internal. Therefore, compiling a modified
> version of a builtin YANG module, and then using that resulting .fxs
> file to emit .hrl files is not allowed.
>
> Use `--list-builtins` to get a listing of all system builtin YANG
> modules.

#### Emit SNMP user options

`--snmpuser` \<EngineID\> \<User\> \<AuthType\> \<PrivType\> \<PassPhrase\>  
> Generates a user entry with localized keys for the specified engine
> identifier. The output is an usmUserEntry in XML format that can be
> used in an initiation file for the
> SNMP-USER-BASED-SM-MIB::usmUserTable. In short this command provides
> key generation for users in SNMP v3. This option takes five arguments:
> The EngineID is either a string or a colon separated hexlist, or a dot
> separated octet list. The User argument is a string specifying the
> user name. The AuthType argument is one of md5, sha, sha224, sha256,
> sha384, sha512 or none. The PrivType argument is one of des, aes,
> aes192, aes256, aes192c, aes256c or none. Note that the difference
> between aes192/aes256 and aes192c/aes256c is the method for localizing
> the key; where the latter is the method used by many Cisco routers,
> see:
> https://datatracker.ietf.org/doc/html/draft-reeder-snmpv3-usm-3desede-00,
> and the former is defined in:
> https://datatracker.ietf.org/doc/html/draft-blumenthal-aes-usm-04. The
> PassPhrase argument is a string.

#### Emit Java options

`--emit-java` \<JFile\>  
> Generate a .java ConfNamespace file from a .fxs file to be used when
> working with the Java library. The file is useful, but not necessary
> when working with the NAVU library. JFile could either be a file or a
> directory. If JFile is a directory the resulting .java file will be
> created in that directory with a name based on the module name in the
> YANG module. If JFile is not a directory that file is created. Use
> *--print-java-filename* to get the resulting file name.

`--print-java-filename`  
> Only print the resulting java file name. Due to restrictions of
> identifiers in Java the name of the Class and thus the name of the
> file might get changed if non Java characters are used in the name of
> the file or in the name of the module. If this option is used no file
> is emitted the name of the file which would be created is just printed
> on stdout.

`--java-package` \<Package\>  
> If this option is used the generated java file will have the given
> package declaration at the top.

`--exclude-enums`  
> If this option is used, definitions for enums are omitted from the
> generated java file. This can in some cases be useful to avoid
> conflicts between enum symbols, or between enums and other symbols.

`--fail-on-warnings`  
> If this option is used all warnings are treated as errors and ncsc
> will fail its execution.

`-f`; `--fxsdep` \<FxsFileOrDir\>...  
> .fxs files (or directories containing .fxs files) to be used to
> resolve cross namespace dependencies.

`--builtin`  
> If a .java file is to be emitted from a builtin YANG module, this
> option must be given to ncsc. This will result in the .java file being
> emitted from the system builtin .fxs files. It is not possible to
> change builtin models since they are system internal. Therefore,
> compiling a modified version of a builtin YANG module, and then using
> that resulting .fxs file to emit .hrl files is not allowed.
>
> Use `--list-builtins` to get a listing of all system builtin YANG
> modules.

#### NCS device module import options

These options are used to import device modules into NCS. The import is
done as a source code transformation of the yang modules (MIBs) that
define the managed device. By default, the imported modules (MIBs) will
be augmented three times. Once under `/devices/device/config`, once
under `/devices/template/config` and once under
`/devices/device/live-status`.

The `ncsc` commands to import device modules can take the following
options:

`--ncs-skip-template` This option makes the NCS bundle compilation skip
the layout of the template tree - thus making the NCS feature of
provisioning devices through the template tree unusable. The main reason
for using this option is to save memory if the data models are very
large.

`--ncs-skip-statistics` This option makes the NCS bundle compilation
skip the layout of the live tree. This option make sense for e.g NED
modules that are sometimes config only. It also makes sense for the
Junos module which doesn't have and "config false" data.

`--ncs-skip-config` This option makes the NCS bundle compilation skip
the layout of the config tree. This option make sense for some NED
modules that are typically status and commands only.

`--ncs-keep-callpoints` This option makes the NCS bundle compilation
keep callpoints when performing the ncs transformation from modules to
device modules, as long as the callpoints have either `tailf:set-hook`
or `tailf:transaction-hook` as sub statement.

`--ncs-device-dir Directory` This is the target directory where the
output of the *--ncs-compile-xxx* command is collected.

`--lax-revision-merge` When we have multiple revisions of the same
module, the `ncsc` command to import the module will fail if a YANG
module does not follow the YANG module upgrade rules. See RFC 6020. This
option makes `ncsc` ignore those strict rules. Use with extreme care,
the end result may be that NCS is incompatible with the managed devices.

`--ncs-depend-package PackageDir` When a package has references to a
YANG module in another package, use this flag when compiling the
package.

`--ncs-apply-deviations` This option has no effect, since deviations are
applied by default. It is only present for backward compatibility.

`--ncs-no-apply-deviations` This option will make `--ncs-compile-bundle`
ignore deviations that are defined in one module with a target in
another module.

`--ncs-device-type netconf | snmp-ned | generic-ned | cli-ned` All
imported device modules adhere to a specific device type.

`--ncs-ned-id ModName:IdentityName` The NED id for the package.
IdentityName is the name of an identity in the YANG module ModName.

`--ncs-compile-bundle` \<YangFileDirectory\>  
> To import a set of managed device YANG files into NCS, gather the
> required files in a directory and import by using this flag. Several
> invocations will populate the mandatory `--ncs-device-dir` directory
> with the compiler output. This command also handles revision
> management for NCS imported device modules. Invoke the command several
> times with different `YangFileDirectory` directories and the same
> `--ncs-device-dir` directory to accumulate the revision history of the
> modules in several different `YangFileDirectory` directories.
>
> Modules in the `YangFileDirectory` directory having annotations or
> deviations for other modules are identified, and such annotations and
> deviations are processed as follows:
>
> 1.  Annotations using `tailf:annotate` are ignored (this annotation
>     mechanism is incompatible with the source code transformation).
>
> 2.  Annotations using `tailf:annotate-module` are applied (but may,
>     depending on the type of annotation and the device type, be
>     ignored by the transformation).
>
> 3.  Deviations are applied unless the `--ncs-no-apply-deviations`
>     option is given.
>
> Typically when NCS needs to manage multiple revisions of the same
> module, the filenames of the YANG modules are on the form of
> `MOD@REVISION.yang`. The `--ncs-compile-bundle` as well as the
> `--ncs-compile-module` commands will rename the source YANG files and
> organize the result as per revision in the `--ncs-device-dir` output
> directory.
>
> The output structure could look like:
>
> <div class="informalexample">
>
>     ncsc-out
>     |----modules
>     |----|----fxs
>     |----|----|----interfaces.fxs
>     |----|----|----sys.fxs
>     |----|----revisions
>     |----|----|----interfaces
>     |----|----|----|----revision-merge
>     |----|----|----|----|----interfaces.fxs
>     |----|----|----|----2009-12-06
>     |----|----|----|----|----interfaces.fxs
>     |----|----|----|----|----interfaces.yang.orig
>     |----|----|----|----|----interfaces.yang
>     |----|----|----|----2006-11-05
>     |----|----|----|----|----interfaces.fxs
>     |----|----|----|----|----interfaces.yang.orig
>     |----|----|----|----|----interfaces.yang
>     |----|----|----sys
>     |----|----|----|----2010-03-26
>     |----|----|----|----|----sys.yang.orig
>     |----|----|----|----|----sys.yang
>     |----|----|----|----|----sys.fxs
>     |----|----yang
>     |----|----|----interfaces.yang
>     |----|----|----sys.yang
>                 
>
> </div>
>
> where we have the following paths:
>
> 1.  `modules/fxs` contains the FXS files that are revision compiled
>     and are ready to load into NCS.
>
> 2.  `modules/yang/$MODULE.yang` is the augmented YANG file of the
>     latest revision. NCS will run with latest revision of all YANG
>     files, and the revision compilation will annotate that tree with
>     information indication at which revision each YANG element was
>     introduced.
>
> 3.  `modules/revisions/$MODULE` contains the different revisions for
>     \$MODULE and also the merged compilation result.

<!-- -->

`--ncs-compile-mib-bundle` \<MibFileDirectory\>  
> To import a set of SNMP MIB modules for a managed device into NCS, put
> the required MIBs in a directory and import by using this flag. The
> MIB files MUST have the ".mib" extension. The compile also picks up
> any MIB annotation files present in this directory, with the extension
> ".miba". See [mib_annotations(5)](section5.md#mib_annotations) .
>
> This command translates all MIB modules to YANG modules according to
> the standard translation algorithm defined in
> I.D-ietf-netmod-smi-yang, then it generates a YANG deviations module
> in order to handle writable configuration data. When all MIB modules
> have been translated to YANG, *--ncs-compile-bundle* is invoked.
>
> Each invocation of this command will populate the *--ncs-device-dir*
> with the compiler output. This command also handles revision
> management for NCS imported device modules. Invoke the command several
> times with different *MibFileDirectory* directories and the same
> *--ncs-device-dir* directory to accumulate the revision history of the
> modules in several different *MibFileDirectory* directories.

<!-- -->

`--ncs-compile-module` \<YangFile\>  
> This ncsc command imports a single device YANG file into the
> *--ncs-model-dir* structure. It's an alternative to
> *--ncs-compile-bundle*, however is just special case of a one-module
> bundle. From a Makefile perspective it may sometimes be easier to use
> this version of bundle compilation.

#### Misc options

`--strip-yang-source` \<FxsFile\>  
> Removes included YANG source from the fxs file. This makes the file
> smaller, but it means that the YANG module and submodules cannot be
> downloaded from the server, unless they are present in the load path.

`--get-info` \<FxsFile\>  
> Various info about the file is printed on standard output, including
> the names of the source files used to produce this file, which ncsc
> version was used, and for fxs files, namespace URI, other namespaces
> the file depends on, namespace prefix, and mount point.

`--get-uri` \<FxsFile\>  
> Extract the namespace URI.

`--version`  
> Reports the ncsc version.

`--emulator-flags` \<Flags\>  
> Passes `Flags` unaltered to the Erlang emulator. This can be useful in
> rare cases for adjusting the ncsc runtime footprint. For instance,
> *--emulator-flags="+SDio 1"* will force the emulator to create only
> one dirty I/O scheduler thread. Use with care.

### Example

Assume we have the file `system.yang`:

<div class="informalexample">

    module system {
      namespace "http://example.com/ns/gargleblaster";
      prefix "gb";

      import ietf-inet-types {
        prefix inet;
      }
      container servers {
        list server {
          key name;
          leaf name {
            type string;
          }
          leaf ip {
            type inet:ip-address;
          }
          leaf port {
            type inet:port-number;
          }
        }
      }
    }

</div>

To compile this file we do:

<div class="informalexample">

    $ ncsc -c system.yang

</div>

If we intend to manipulate this data from our Java programs, we must
typically also invoke:

<div class="informalexample">

    $ ncsc --emit-java blaster.java system.fxs
        

</div>

Finally we show how to compile a clispec into a loadable format:

<div class="informalexample">

    $ ncsc -c mycli.cli
    $ ls mycli.ccl
    myccl.ccl

</div>

### Diagnostics

On success exit status is 0. On failure 1. Any error message is printed
to stderr.

### Yang 1.1

NCS supports YANG 1.1, as defined in RFC 7950, with the following
exceptions:

- Type `empty` in leaf-list is not supported.

- Type `leafref` in unions are not validated, and treated as a string
  internally.

- `anydata` is not supported.

- The new scoping rules for submodules are not implemented.
  Specifically, a submodule must still include other submodules in order
  to access definitions defined there.

- The new XPath functions `derived-from()` and `derived-from-or-self()`
  can only be used with literal strings in the second argument.

- Leafref paths without prefixes in top-level typedefs are handled as in
  YANG 1.

### See Also

The NCS User Guide  
> 

`ncs(1)`  
> command to start and control the NCS daemon

`ncs.conf(5)`  
> NCS daemon configuration file format

`clispec(5)`  
> CLI specification file format

`mib_annotations(5)`  
> MIB annotations file format
