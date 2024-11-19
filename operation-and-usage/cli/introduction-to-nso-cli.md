---
description: Get started with the NSO CLI.
---

# Introduction to NSO CLI

The NSO CLI (command line interface) provides a unified CLI towards the complete network. The NSO CLI is a northbound interface to the NSO representation of the network devices and network services. Do not confuse this with a cut-through CLI that reaches the devices directly. Although the network might be a mix of vendors and device interfaces with different CLI flavors, NSO provides one northbound CLI.

Starting the CLI:

```
$> ncs_cli -C -u admin
```

{% hint style="info" %}
Note the use of the `-u` parameter which tells NSO which user to authenticate towards NSO. It is a common mistake to forget this. This user must be configured in NSO AAA (Authentication, Authorization, and Accounting).
{% endhint %}

Like many CLI's there is an operational mode and a configuration mode. Show commands display different data in those modes. A show in configuration mode displays network configuration data from the NSO configuration database, the CDB. Show in operational mode shows live values from the devices and any operational data stored in the CDB. The CLI starts in operational mode. Note that different prompts are used for the modes (these can be changed in `ncs.conf` configuration file).

NSO organizes all managed devices as a list of devices. The path to a specific device is `devices device DEVICE-NAME`. The CLI sequence below does the following:

1. Show operational data for all devices: fetches operational data from the network devices like interface statistics, and also operational data that is maintained by NSO like alarm counters.
2. Move to configuration mode. Show configuration data for all devices: In this example, this is done before the configuration from the real devices has been loaded in the network to NSO. At this point, only the NSO-configured data like IP Address, port, etc. are shown.

Show device operational data and configuration data:

```cli
admin@ncs# show devices device
devices device ce0
 ...
 alarm-summary indeterminates 0
 alarm-summary criticals 0
 alarm-summary majors 0
 alarm-summary minors 0
 alarm-summary warnings 0
devices device ce1
 ...
admin@ncs# config
Entering configuration mode terminal
admin@ncs(config)# show full-configuration devices device
devices device ce0
 address   127.0.0.1
 port      10022
 ssh host-key ssh-dss
 ...
!
devices device ce1
 ...
!
...
```

It can be annoying to move between modes to display configuration data and operational data. The CLI has ways around this.

Show config data in operational mode and vice versa:

```cli
admin@ncs# show running-config devices device
admin@ncs(config)# do show running-config devices device
```

Look at the device configuration above, no configuration relates to the actual configuration on the devices. To boot-strap NSO and discover the device configuration, it is possible to perform an action to synchronize NSO from the devices, `devices sync-from`. This reads the configuration over available device interfaces and populates the NSO data store with the corresponding configuration. The device-specific configuration is populated below the device's entry in the configuration tree and can be listed specifically.

Perform the action to synchronize from devices:

```cli
admin@ncs(config)# devices sync-from
sync-result {
    device ce0
    result true
}
sync-result {
    device ce1
    result true
}
...
```

Display the device configuration after the synchronization:

```cli
admin@ncs(config)# show full-configuration devices device ce0 config
devices device ce0
 config
  no ios:service pad
  no ios:ip domain-lookup
  no ios:ip http secure-server
  ios:ip source-route
  ios:interface GigabitEthernet0/1
  exit
  ios:interface GigabitEthernet0/10
  exit
  ios:interface GigabitEthernet0/11
  exit
  ios:interface GigabitEthernet0/12
  exit
  ios:interface GigabitEthernet0/13
  exit
  ...
 !
!
...
```

NSO provides a network CLI in two different styles (selectable by the user): J-style and C-style. The CLI is automatically rendered using the data models described by the YANG files. There are three distinctly different types of YANG files, the built-in NSO models describing the device manager and the service manager, models imported from the managed devices, and finally service models. Regardless of model type, the NSO CLI seamlessly handles all models as a whole.

This creates an auto-generated CLI, without any extra effort, except the design of our YANG files. The auto-generated CLI supports the following features:

* Unified CLI across the complete network, devices, and network services.
* Command line history and command line editor.
* Tab completion for the content of the configuration database.
* Monitoring and inspecting log files.
* Inspecting the system configuration and system state.
* Copying and comparing different configurations, for example, between two interfaces or two devices.
* Configuring common settings across a range of devices.

The CLI contains commands for manipulating the network configuration.

An alias provides a shortcut for a complex command.

Alias expansion is performed when a command line is entered. Aliases are part of the configuration and are manipulated accordingly. This is done by manipulating the nodes in the alias configuration tree.

Actions in the YANG files are mapped into actual commands. In J-style CLI actions are mapped to the `request` commands.

Even though the auto-generated CLI is fully functional it can be customized and extended in numerous ways:

* Built-in commands can be moved, hidden, deleted, reordered, and extended.
* Confirmation prompts can be added to built-in commands.
* New commands can be implemented using the Java API, ordinary executables, and shell scripts.
* New commands can be mounted freely in the existing command hierarchy.
* The built-in tab completion mechanism can be overridden using user-defined callbacks.
* New command hierarchies can be created.
* A command timeout can be added, both a global timeout for all commands and command-specific timeouts.
* Actions and parts of the configuration tree can be hidden and can later be made visible when the user enters a password.

How to customize and extend the auto-generated CLI is described in [Plug-and-play Scripting](../operations/plug-and-play-scripting.md).

## CLI Modes <a href="#d5e1216" id="d5e1216"></a>

The CLI is entirely data model-driven. The YANG model(s) defines a hierarchy of configuration elements. The CLI follows this tree. The NSO CLI provides various commands for configuring and monitoring software, hardware, and network connectivity of managed devices.

The CLI supports two modes:

* **Operational** **mode**: For monitoring the state of the NSO node.
* **Configure** **mode**: For changing the state of the network.

The prompt indicates which mode the CLI is in. When moving from operational mode to configure mode using the `configure` command, the prompt is changed from `host#` to `host(config)#`. The prompts can be configured using the `c-prompt1` and `c-prompt2` settings in the `ncs.conf` file.

For example:

```cli
admin@ncs# configure
Entering configuration mode terminal
admin@ncs(config)#
```

{% tabs %}
{% tab title="Operational Mode" %}
The operational mode is the initial mode after successful login to the CLI. It is primarily used for viewing the system status, controlling the CLI environment, monitoring and troubleshooting network connectivity, and initiating the configure mode.

A list of base commands available in the operational mode is listed below in the [Operational Mode Commands](introduction-to-nso-cli.md#d5e1943) section. Additional commands are rendered from the loaded YANG files.
{% endtab %}

{% tab title="Configure Mode" %}
The configure mode can be initiated by entering the `configure` command in operational mode. All changes to the network configuration are done to a copy of the active configuration. These changes do not take effect until a successful `commit` or `commit confirm` command is entered.

A list of base commands available in `configure` mode is listed below in the [Configure Mode Commands](introduction-to-nso-cli.md#d5e2199) section. Additional commands are rendered from the loaded YANG files.

{% hint style="info" %}
When using the `config` mode to enter/set passwords, you may face issues if you are using special characters in your password (e.g., `!`, `""`, `\`, etc.). Some characters are automatically escaped by the CLI, while others require manual escaping. Therefore, the recommendation is to always enclose your password in double quotes `" "` and avoid using quotes `"` and backslash `\` characters in your password. If you prefer including quotes and backslash in your password, remember to manually escape them, as shown in the example below:

```cli
admin@ncs(config)# devices authgroups group default umap
admin remote-name admin remote-password "admin\"admin"
```
{% endhint %}
{% endtab %}
{% endtabs %}

## Starting the CLI <a href="#d5e1253" id="d5e1253"></a>

The CLI is started using the `ncs_cli` program. It can be used as a login program (replacing the shell for a user), started manually once the user has logged in, or used in scripts for performing CLI operations.

In some NSO installations, ordinary users would have the `ncs_cli` program as a login shell, and the root user would have to log in and then start the CLI using `ncs_cli`, whereas in others, the `ncs_cli` can be invoked freely as a normal shell command.

The `ncs_cli` program supports a range of options, primarily intended for debugging and development purposes (see description below).

The `ncs_cli` program can also be used for batch processing of CLI commands, either by storing the commands in a file and running `ncs_cli` on the file, or by having the following line at the top of the file (with the location of the program modified appropriately):

```
#!/bin/ncs_cli
```

When the CLI is run non-interactively it will terminate at the first error and will only show the output of the commands executed. It will not output the prompt or echo the commands. This is the same behavior as for shell scripts.

To run a script non-interactively, such as a script or through a pipe, and still produce prompts and echo commands, use the `--interactive` option.

### Command Line Options

```bash
ncs_cli --help
Usage: ncs_cli [options] [file]
Options:
--help, -h            display this help
--host, -H <host>     current host name (used in prompt)
--address, -A <addr>  cli address to connect to
--port, -P <port>     cli port to connect to
  < ... output omitted ... >
```

<table data-full-width="true"><thead><tr><th width="376">Command</th><th>Description</th></tr></thead><tbody><tr><td><code>-h</code>, <code>--help</code></td><td>Display help text.</td></tr><tr><td><code>-H</code>, <code>--host</code> <em><code>HostName</code></em></td><td>Gives the name of the current host. The <code>ncs_cli</code> program will use the value of the system call <code>gethostbyname()</code> by default. The hostname is used in the CLI prompt.</td></tr><tr><td><code>-A</code>, <code>--address</code> <em><code>Address</code></em></td><td>CLI address to connect to. The default is 127.0.0.1. This can be controlled by either this flag or the UNIX environment variable <code>NCS_IPC_ADDR</code>. The <code>-A</code> flag takes precedence.</td></tr><tr><td><code>-P</code>, <code>--port</code> <em><code>PortNumber</code></em></td><td>CLI port to connect to. The default is the NSO IPC port, which is 4569 This can be controlled by either this flag, or the UNIX environment variable <code>NCS_IPC_PORT</code>. The <code>-P</code> flag takes precedence.</td></tr><tr><td><code>-c</code>, <code>--cwd</code> <em><code>Directory</code></em></td><td>The current working directory (CWD) for the user once in the CLI. All file references from the CLI will be relative to the CWD. By default, the value will be the actual CWD where <code>ncs_cli</code> is invoked.</td></tr><tr><td><code>-p</code>, <code>--proto</code> <code>ssh</code> | <code>tcp</code> | <code>console</code></td><td>The protocol the user is using to connect. This value is used in the audit logs. Defaults to <code>ssh</code> if <code>SSH_CONNECTION</code> environment variable is set; <code>console</code> otherwise.</td></tr><tr><td><code>-i</code>, <code>--ip</code> <em><code>IpAddress</code></em> | <em><code>IpAddress/Port</code></em></td><td>The IP (or IP address and port) which NSO reports that the user is connecting from. This value is used in the audit logs. Defaults to the information in the <code>SSH_CONNECTION</code> environment variable if set, 127.0.0.1 otherwise.</td></tr><tr><td><code>-v</code>, <code>--verbose</code></td><td>Produce additional output about the execution of the command, in particular during the initial handshake phase.</td></tr><tr><td><code>-n</code>, <code>--interactive</code></td><td>Force the CLI to echo prompts and commands. Useful when <code>ncs_cli</code> auto-detects it is not running in a terminal, e.g. when executing as a script, reading input from a file, or through a pipe.</td></tr><tr><td><code>-N</code>, <code>--noninteractive</code></td><td>Force the CLI to only show the output of the commands executed. Do not output the prompt or echo the commands, much like a shell does for a shell script.</td></tr><tr><td><code>-s</code>, <code>--stop-on-error</code></td><td>Force the CLI to terminate at the first error and use a non-zero exit code.</td></tr><tr><td><code>-E</code>, <code>--escape-char</code> <em><code>C</code></em></td><td>A special character that forcefully terminates the CLI when repeated three times in a row. Defaults to control underscore (Ctrl-_).</td></tr><tr><td><code>-J</code>, <code>-C</code></td><td>This flag sets the mode of the CLI. <code>-J</code> is Juniper style CLI, <code>-C</code> is Cisco XR style CLI.</td></tr><tr><td><code>-u</code>, <code>--user</code> <em><code>User</code></em></td><td>The username of the connecting user. Used for access control and group assignment in NSO (if the group mapping is kept in NSO). The default is to use the login name of the user.</td></tr><tr><td><code>-g</code>, <code>--groups</code> <em><code>GroupList</code></em></td><td>A comma-separated list of groups the connecting user is a member of. Used for access control by the AAA system in NSO to authorize data and command access. Defaults to the UNIX groups that the user belongs to, i.e. the same as the <code>groups</code> shell command returns.</td></tr><tr><td><code>-U</code>, <code>--uid</code> <em><code>Uid</code></em></td><td>The numeric user ID the user shall have. Used for executing OS commands on behalf of the user, when checking file access permissions, and when creating files. Defaults to the effective user ID (euid) in use for running the command. Note that NSO needs to run as root for this to work properly.</td></tr><tr><td><code>-G</code>, <code>--gid</code> <em><code>Gid</code></em></td><td>The numeric group ID of the user shall have. Used for executing OS commands on behalf of the user, when checking file access permissions, and when creating files. Defaults to the effective group ID (egid) in use for running the command. Note that NSO needs to run as root for this to work properly.</td></tr><tr><td><code>-D</code>, <code>--gids</code> <em><code>GidList</code></em></td><td>A comma-separated list of supplementary numeric group IDs the user shall have. Used for executing OS commands on behalf of the user and when checking file access permissions. Defaults to the supplementary UNIX group IDs in use for running the command. Note that NSO needs to run as root for this to work properly.</td></tr><tr><td><code>-a</code>, <code>--noaaa</code></td><td>Completely disables all AAA checks for this CLI. This can be used as a disaster recovery mechanism if the AAA rules in NSO have somehow become corrupted.</td></tr><tr><td><code>-O</code>, <code>--opaque</code> <em><code>Opaque</code></em></td><td>Pass an opaque string to NSO. The string is not interpreted by NSO, only made available to application code. See built-in variables in <a href="https://developer.cisco.com/docs/nso-guides-6.3/ncs-man-pages-volume-5/#clispec">clispec(5)</a> and <code>maapi_get_user_session_opaque()</code> in <a href="https://developer.cisco.com/docs/nso-guides-6.3/ncs-man-pages-volume-3/#confd_lib_maapi">confd_lib_maapi(3)</a>. The string can be given either via this flag or via the UNIX environment variable <code>NCS_CLI_OPAQUE</code>. The <code>-O</code> flag takes precedence.</td></tr></tbody></table>

For `clispec(5)` and `confd_lib_maapi(3)` refer to [Manual Pages](https://developer.cisco.com/docs/nso-guides-6.3/ncs-man-pages-volume-1/).

### CLI Styles <a href="#d5e1366" id="d5e1366"></a>

The CLI comes in two flavors: C-Style (Cisco XR style) and the J-style. It is possible to choose one specifically or switch between them.

{% tabs %}
{% tab title="C-Style" %}
Starting the CLI (C-style, Cisco XR style):

```
$> ncs_cli -C -u admin
```
{% endtab %}

{% tab title="J-Style" %}
Starting the CLI (J-style):

```
$> ncs_cli -J -u admin
```
{% endtab %}
{% endtabs %}

It is possible to interactively switch between these styles while inside the CLI using the builtin `switch` command:

```cli
admin@ncs# switch cli
```

C-style is mainly used throughout the documentation for examples etc., except when otherwise stated.

### **Starting the CLI in an Overloaded System** <a href="#d5e1383" id="d5e1383"></a>

If the number of ongoing sessions has reached the configured system limit, no more CLI sessions will be allowed until one of the existing sessions has been terminated.

This makes it impossible to get into the system — a situation that may not be acceptable. The CLI therefore has a mechanism for handling this problem. When the CLI detects that the session limit has been reached, it will check if the new user has the privileges to execute the `logout` command. If the user does, it will display a list of the current user sessions in NSO and ask the user if one of the sessions should be terminated to make room for the new session.

## Modifying the Configuration <a href="#d5e1387" id="d5e1387"></a>

Once NSO is synchronized with the devices' configuration, done by using the `devices sync-from` command, it is possible to modify the devices. The CLI is used to modify the NSO representation of the device configuration and then committed as a transaction to the network.

As an example, to change the speed setting on the interface GigabitEthernet0/1 across several devices:

```cli
admin@ncs(config)# devices device ce0..1 config ios:interface GigabitEthernet0/1 speed auto
admin@ncs(config-if)# top
admin@ncs(config)# show configuration
devices device ce0
 config
  ios:interface GigabitEthernet0/1
   speed auto
  exit
 !
!
devices device ce1
 config
  ios:interface GigabitEthernet0/1
   speed auto
  exit
 !
!
admin@ncs(config)# commit ?
Possible completions:
  and-quit               Exit configuration mode
  check                  Validate configuration
  comment                Add a commit comment
  commit-queue           Commit through commit queue
  label                  Add a commit label
  no-confirm             No confirm
  no-networking          Send nothing to the devices
  no-out-of-sync-check   Commit even if out of sync
  no-overwrite           Do not overwrite modified data on the device
  no-revision-drop       Fail if device has too old data model
  save-running           Save running to file
  ---
  dry-run                Show the diff but do not perform commit
  [<cr>
admin@ncs(config)# commit
Commit complete.
```

Note the availability of commit flags.

Any failure on any device will make the whole transaction fail. It is also possible to perform a manual rollback, a rollback is the undoing of a commit.

This is operational data and the CLI is in configuration mode so the way of showing operational data in config mode is used.

The command `show configuration rollback changes` can be used to view rollback changes in more detail. It will show what will be done when the rollback file is loaded, similar to loading the rollback and using `show configuration`:

```cli
admin@ncs(config)# show configuration rollback changes 10019
devices device ce0
 config
  ios:interface GigabitEthernet0/1
   no speed auto
  exit
 !
!
devices device ce1
 config
  ios:interface GigabitEthernet0/1
   no speed auto
  exit
 !
!
```

The command `show configuration commit changes` can be used to see which changes were done in a given commit, i.e. the roll-forward commands performed in that commit:

```cli
admin@ncs(config)# show configuration commit changes 10019
!
! Created by: admin
! Date: 2015-02-03 12:29:08
! Client: cli
!
devices device ce0
 config
  ios:interface GigabitEthernet0/1
   speed auto
  exit
 !
!
devices device ce1
 config
  ios:interface GigabitEthernet0/1
   speed auto
  exit
 !
!
```

The command `rollback-files apply-rollback-file` can be used to perform the rollback:

```cli
admin@ncs(config)# rollback-files apply-rollback-file fixed-number 10019
admin@ncs(config)# show configuration
devices device ce0
 config
  ios:interface GigabitEthernet0/1
   no speed auto
  exit
 !
!
devices device ce1
 config
  ios:interface GigabitEthernet0/1
   no speed auto
  exit
 !
!
```

And now the `commit` the rollback:

```cli
admin@ncs(config)# commit
Commit complete.
```

When the command `rollback-files apply-rollback-file fixed-number 10019` is run the changes recorded in rollback 10019-N (where N is the highest, thus the most recent rollback number) will all be undone. In other words, the configuration will be rolled back to the state it was in before the commit associated with rollback 10019 was performed.

It is also possible to undo individual changes by running the command `rollback-files apply-rollback-file selective`. E.g. to undo the changes recorded in rollback 10019, but not the changes in 10020-N run the command `rollback-files apply-rollback-file selective fixed-number 10019`.

This operation may fail if the commits following rollback 10019 depend on the changes made in rollback 10019.

## Command Output Processing <a href="#d5e1430" id="d5e1430"></a>

It is possible to process the output from a command using an output redirect. This is done using the | character (a pipe character):

```cli
admin@ncs# show running-config | ?
Possible completions:
  annotation      Show only statements whose annotation matches a pattern
  append          Append output text to a file
  begin           Begin with the line that matches
  best-effort     Display data even if data provider is unavailable or
                  continue loading from file in presence of failures
  context-match   Context match
  count           Count the number of lines in the output
  csv             Show table output in CSV format
  de-select       De-select columns
  details         Display show/commit details
  display         Display options
  exclude         Exclude lines that match
  extended        Display referring entries
  hide            Hide display options
  include         Include lines that match
  linnum          Enumerate lines in the output
  match-all       All selected filters must match
  match-any       At least one filter must match
  more            Paginate output
  nomore          Suppress pagination
  save            Save output text to a file
  select          Select additional columns
  sort-by         Select sorting indices
  tab             Enforce table output
  tags            Show only statements whose tags matches a pattern
  until           End with the line that matches
```

The precise list of pipe commands depends on the command executed. Some pipe commands, like `select` and `de-select`, are only available for the `show` command, whereas others are universally available.

{% hint style="info" %}
Note that the `tab` pipe target is used to enforce table output which is only suitable for the list element. Naturally, the table format is not suitable for displaying arbitrary data output since it needs to map the data to columns and rows.

For example, the following are clearly not suitable because the data has a nested structure. It could take an incredibly long time to display it if you use the `tab` pipe target on a huge amount of data which is not a list element.

```
show running-config | tab
show running-config | include aaa | tab
```
{% endhint %}

### Count the Number of Lines in the Output <a href="#d5e1443" id="d5e1443"></a>

This redirect target counts the number of lines in the output. For example:

```cli
admin@ncs# show running-config | count
Count: 1783 lines
admin@ncs# show running-config aaa | count
Count: 28 lines
```

### Search for a String in the Output <a href="#d5e1449" id="d5e1449"></a>

The `include` targets is used to only include lines matching a regular expression:

```cli
admin@ncs# show running-config aaa | include aaa
aaa authentication users user admin
aaa authentication users user oper
aaa authentication users user private
aaa authentication users user public
```

In the example above only lines containing aaa are shown. Similarly lines not containing a regular expression can be included. This is done using the `exclude` target:

```cli
admin@ncs# show running-config aaa authentication | exclude password
aaa authentication users user admin
 uid        1000
 gid        1000
 ssh_keydir /var/ncs/homes/admin/.ssh
 homedir    /var/ncs/homes/admin
!
aaa authentication users user oper
 uid        1000
 gid        1000
 ssh_keydir /var/ncs/homes/oper/.ssh
 homedir    /var/ncs/homes/oper
!
aaa authentication users user private
 uid        1000
 gid        1000
 ssh_keydir /var/ncs/homes/private/.ssh
 homedir    /var/ncs/homes/private
!
aaa authentication users user public
 uid        1000
 gid        1000
 ssh_keydir /var/ncs/homes/public/.ssh
 homedir    /var/ncs/homes/public
 !
```

It is possible to display the context for a match using the pipe command `include -c`. Matching lines will be prefixed by `<line no>`: and context lines with `<line no>-`. For example:

```cli
admin@ncs# show running-config aaa authentication | include -c 3 homes/admin
 2- uid        1000
 3- gid        1000
 4- password   $1$brH6BYLy$iWQA2T1I3PMonDTJOd0Y/1
 5: ssh_keydir /var/ncs/homes/admin/.ssh
 6: homedir    /var/ncs/homes/admin
 7-!
 8-aaa authentication users user oper
 9- uid        1000
```

It is possible to display the context for a match using the pipe command `context-match`:

```cli
admin@ncs# show running-config aaa authentication | context-match homes/admin
aaa authentication users user admin
 ssh_keydir /var/ncs/homes/admin/.ssh
aaa authentication users user admin
 homedir    /var/ncs/homes/admin
```

It is possible to display the output starting at the first match of a regular expression. This is done using the `begin` pipe command:

```cli
admin@ncs# show running-config aaa authentication users | begin public
aaa authentication users user public
 uid        1000
 gid        1000
 password   $1$DzGnyJGx$BjxoqYEj0QKxwVX5fbfDx/
 ssh_keydir /var/ncs/homes/public/.ssh
 homedir    /var/ncs/homes/public
!
```

### Saving the Output to a File <a href="#d5e1478" id="d5e1478"></a>

The output can also be saved to a file using the `save` or `append` redirect target:

```cli
admin@ncs# show running-config aaa | save /tmp/saved
```

Or to save the configuration, except all passwords:

```cli
admin@ncs# show running-config aaa | exclude password | save /tmp/saved
```

### Regular Expressions <a href="#ug.ncs.cli.regexp" id="ug.ncs.cli.regexp"></a>

The regular expressions are a subset of the regular expressions found in egrep and in the AWK programming language. Some common operators are:

<table><thead><tr><th width="198">Operator</th><th>Description</th></tr></thead><tbody><tr><td><code>.</code></td><td>Matches any character.</td></tr><tr><td><code>^</code></td><td>Matches the beginning of a string.</td></tr><tr><td><code>$</code></td><td>Matches the end of a string.</td></tr><tr><td><code>[abc...]</code></td><td>Character class, which matches any of the characters abc... Character ranges are specified by a pair of characters separated by a -.</td></tr><tr><td><code>[^abc...]</code></td><td>Negated character class, which matches any character except abc... .</td></tr><tr><td><code>r1 | r2</code></td><td>Alternation. It matches either r1 or r2.</td></tr><tr><td><code>r1r2</code></td><td>Concatenation. It matches r1 and then r2.</td></tr><tr><td><code>r+</code></td><td>Matches one or more rs.</td></tr><tr><td><code>r*</code></td><td>Matches zero or more rs.</td></tr><tr><td><code>r?</code></td><td>Matches zero or one rs.</td></tr><tr><td><code>(r)</code></td><td>Grouping. It matches r.</td></tr></tbody></table>

For example, to only display `uid` and `gid` do the following:

```cli
admin@ncs# show running-config aaa | include "(uid)|(gid)"
 uid        1000
 gid        1000
 uid        1000
 gid        1000
 uid        1000
 gid        1000
 uid        1000
 gid        1000
```

## Displaying the Configuration <a href="#d5e1541" id="d5e1541"></a>

There are several options for displaying the configuration and stats data in NSO. The most basic command consists of displaying a leaf or a subtree of the configuration by giving the path to the element.

To display the configuration of a device do:

```cli
admin@ncs# show running-config devices device ce0 config
devices device ce0
 config
  no ios:service pad
  no ios:ip domain-lookup
  no ios:ip http secure-server
  ios:ip source-route
  ios:interface GigabitEthernet0/1
  exit
  ios:interface GigabitEthernet0/10
  exit
  ...
 !
 !
```

This can also be done for a group of devices by substituting the instance name (`ce0` in this case) with [Regular Expressions](introduction-to-nso-cli.md#ug.ncs.cli.regexp).

To display the config of all devices:

```cli
admin@ncs# show running-config devices device * config
devices device ce0
 config
  no ios:service pad
  no ios:ip domain-lookup
  no ios:ip http secure-server
  ios:ip source-route
  ios:interface GigabitEthernet0/1
  exit
  ios:interface GigabitEthernet0/10
  exit
  ...
 !
!
devices device ce1
 config
  ...
 !
!
...
```

It is possible to limit the output even further. View only the HTTP settings on each device:

```cli
admin@ncs# show running-config devices device * config ios:ip http
devices device ce0
 config
  no ios:ip http secure-server
 !
!
devices device ce1
 config
  no ios:ip http secure-server
 !
!
...
```

There is an alternative syntax for this using the `select` pipe command:

```cli
admin@ncs# show running-config devices device * | \
    select config ios:ip http
devices device ce0
 config
  no ios:ip http secure-server
 !
!
devices device ce1
 config
  no ios:ip http secure-server
 !
!
...
```

The `select` pipe command can be used multiple times for adding additional content:

```cli
admin@ncs# show running-config devices device * | \
    select config ios:ip http | \
    select config ios:ip domain-lookup
devices device ce0
 config
  no ios:ip domain-lookup
  no ios:ip http secure-server
 !
!
devices device ce1
 config
  no ios:ip domain-lookup
  no ios:ip http secure-server
 !
!
...
```

There is also a `de-select` pipe command that can be used to instruct the CLI to not display certain parts of the config. The above printout could also be achieved by first selecting the `ip` container, and then de-selecting the `source-route` leaf:

```cli
admin@ncs# show running-config devices device * | \
    select config ios:ip | \
    de-select config ios:ip source-route
devices device ce0
 config
  no ios:ip domain-lookup
  no ios:ip http secure-server
 !
!
devices device ce1
 config
  no ios:ip domain-lookup
  no ios:ip http secure-server
 !
!
...
```

A use-case for the `de-select` pipe command is to de-select the `config` container to only display the device settings without actually displaying their config:

```cli
admin@ncs# show running-config devices device * | de-select config
devices device ce0
 address   127.0.0.1
 port      10022
 ssh host-key ssh-dss
  ...
 !
 authgroup default
 device-type cli ned-id cisco-ios
 state admin-state unlocked
!
devices device ce1
 ...
!
...
```

The above statements also work for the `save` command. To save the devices managed by NSO, but not the contents of their `config` container:

```cli
admin@ncs# show running-config devices device * | \
    de-select config | save /tmp/devices
```

It is possible to use the `select` command to select which list instances to display. To display all devices that have the interface `GigabitEthernet 0/0/0/4`:

```cli
admin@ncs# show running-config devices device * | \
    select config cisco-ios-xr:interface GigabitEthernet 0/0/0/4
devices device p0
 config
  cisco-ios-xr:interface GigabitEthernet 0/0/0/4
   shutdown
  exit
 !
!
devices device p1
 config
  cisco-ios-xr:interface GigabitEthernet 0/0/0/4
   shutdown
  exit
 !
!
...
```

This means to display all device instances that have the interface GigabitEthernet 0/0/0/4. Only the subtree defined by the select path will be displayed. It is also possible to display the entire content of the `config` container for each instance by using an additional select statement:

```cli
admin@ncs# show running-config devices device * | \
    select config cisco-ios-xr:interface GigabitEthernet 0/0/0/4 | \
    select config | match-all
devices device p0
 config
  cisco-ios-xr:hostname PE1
  cisco-ios-xr:interface MgmtEth 0/0/CPU0/0
  exit
  ...
  cisco-ios-xr:interface GigabitEthernet 0/0/0/4
   shutdown
  exit
 !
!
devices device p1
 config
  ...
  cisco-ios-xr:interface GigabitEthernet 0/0/0/4
   shutdown
  exit
 !
!
...
```

The `match-all` pipe command is used for telling the CLI to only display instances that match all select commands. The default behavior is `match-any` which means to display instances that match any of the given `select` commands.

The `display` command is used to format configuration and statistics data. There are several output formats available, and some of these are unique to specific modes, such as configuration or operational mode. The output formats `json`, `keypath`, `xml`, and `xpath` are available in most modes and CLI styles (J, I, and C). The output formats `netconf` and `maagic` are only available if `devtools` has been set to `true` in the CLI session settings.

For instance, assuming we have a data model featuring a set of hosts, each containing a set of servers, we can display the configuration data as JSON. This is depicted in the example below.

```cli
admin@ncs# show running-config hosts | display json
{
  "data": {
    "pipetargets_model:hosts": {
      "host": [
        {
          "name": "host1",
          "enabled": true,
          "numberOfServers": 2,
          "servers": {
            "server": [
              {
                "name": "serv1",
                "ip": "192.168.0.1",
                "port": 5001
              },
              {
                "name": "serv2",
                "ip": "192.168.0.1",
                "port": 5000
              }
            ]
          }
        },
        {
          "name": "host2",
          "enabled": false,
          "numberOfServers": 0
...
```

Still working with the same data model as used in the example above, we might want to see the current configuration in keypath format.

The following example shows how to do that and shows the resulting output:

```cli
admin@ncs# show running-config hosts | display keypath
/hosts/host{host1} enabled
/hosts/host{host1}/numberOfServers 2
/hosts/host{host1}/servers/server{serv1}/ip 192.168.0.1
/hosts/host{host1}/servers/server{serv1}/port 5001
/hosts/host{host1}/servers/server{serv2}/ip 192.168.0.1
/hosts/host{host1}/servers/server{serv2}/port 5000
/hosts/host{host2} disabled
/hosts/host{host2}/numberOfServers 0
```

## Range Expressions <a href="#d5e1612" id="d5e1612"></a>

To modify a range of instances, at the same time, use range expressions or display a specific range of instances.

Basic range expressions are written with a combination of x..y (meaning from x to y), x,y (meaning x and y) and \* (meaning any value), example:

```
1..4,8,10..18
```

It is possible to use range expressions for all key elements of integer type, both for setting values, executing actions, and displaying status and config.

Range expressions are also supported for key elements of non-integer types as long as they are restricted to the pattern \[a-zA-Z-]\*\[0-9]+/\[0-9]+/\[0-9]+/.../\[0-9]+ and the annotation `tailf:cli-allow-range` is used on the key leaf. This is the case for the device list.

The following can be done in the CLI to display a subset of the devices (`ce0`, `ce1`, `ce3`):

```cli
admin@ncs# show running-config devices device ce0..1,3
```

If the devices have names with slashes, for example, Firewall/1/1, Firewall/1/2, Firewall/1/3, Firewall/2/1, Firewall/2/2, and Firewall/2/3, expressions like this are possible:

```cli
admin@ncs# show running-config devices device Firewall/1-2/*
admin@ncs# show running-config devices device Firewall/1-2/1,3
```

In configure mode, it is possible to edit a range of instances in one command:

```cli
admin@ncs(config)# devices device ce0..2 config ios:ethernet cfm ieee
```

Or, like this:

```cli
admin@ncs(config)# devices device ce0..2 config
admin@ncs(config-config)# ios:ethernet cfm ieee
admin@ncs(config-config)# show config
devices device ce0
 config
  ios:ethernet cfm ieee
 !
!
devices device ce1
 config
  ios:ethernet cfm ieee
 !
!
devices device ce2
 config
  ios:ethernet cfm ieee
 !
!
```

## Command History <a href="#d5e1639" id="d5e1639"></a>

Command history is maintained separately for each mode. When entering configure mode from operational for the first time, an empty history is used. It is not possible to access the command history from operational mode when in configure mode and vice versa. When exiting back into operational mode access to the command history from the preceding operational mode session will be used. Likewise, the old command history from the old configure mode session will be used when re-entering configure mode.

## Command Line Editing <a href="#d5e1642" id="d5e1642"></a>

The default keystrokes for editing the command line and moving around the command history are as follows.

### Moving the Cursor <a href="#d5e1645" id="d5e1645"></a>

* Move the cursor back by one character: Ctrl-b or Left Arrow.
* Move the cursor back by one word: Esc-b or Alt-b.
* Move the cursor forward one character: Ctrl-f or Right Arrow.
* Move the cursor forward one word: Esc-f or Alt-f.
* Move the cursor to the beginning of the command line: Ctrl-a or Home.
* Move the cursor to the end of the command line: Ctrl-e or End.

### Delete Characters <a href="#d5e1672" id="d5e1672"></a>

* Delete the character before the cursor: Ctrl-h, Delete, or Backspace.
* Delete the character following the cursor: Ctrl-d.
* Delete all characters from the cursor to the end of the line: Ctrl-k.
* Delete the whole line: Ctrl-u or Ctrl-x.
* Delete the word before the cursor: Ctrl-w, Esc-Backspace, or Alt-Backspace.
* Delete the word after the cursor: Esc-d or Alt-d.

### Insert Recently Deleted Text <a href="#d5e1699" id="d5e1699"></a>

* Insert the most recently deleted text at the cursor: Ctrl-y.

### Display Previous Command Lines <a href="#d5e1706" id="d5e1706"></a>

* Scroll backward through the command history: Ctrl-p or Up Arrow.
* Scroll forward through the command history: Ctrl-n or Down Arrow.
* Search the command history in reverse order: Ctrl-r.
* Show a list of previous commands: run the `show cli history` command.

### Capitalization <a href="#d5e1725" id="d5e1725"></a>

* Capitalize the word at the cursor, i.e. make the first character uppercase and the rest of the word lowercase: Esc-c.
* Change the word at the cursor to lowercase: Esc-l.
* Change the word at the cursor to uppercase: Esc-u.

### Special <a href="#d5e1740" id="d5e1740"></a>

* Abort a command/Clear line: Ctrl-c.
* Quote insert character, i.e. do not treat the next keystroke as an edit command: Ctrl-v/ESC-q.
* Redraw the screen: Ctrl-l.
* Transpose characters: Ctrl-t.
* Enter multi-line mode. Enables entering multi-line values when prompted for a value in the CLI: ESC-m.
* Exit configuration mode: Ctrl-z.

## CLI Completion <a href="#d5e1767" id="d5e1767"></a>

It is not necessary to type the full command or option name for the CLI to recognize it. To display possible completions, type the partial command followed immediately by `<tab>` or `<space>`.

If the partially typed command uniquely identifies a command, the full command name will appear. Otherwise, a list of possible completions is displayed.

Long lines can be broken into multiple lines using the backslash (`\`) character at the end of the line. This is primarily useful inside scripts.

Completion is disabled inside quotes. To type an argument containing spaces either quote them with a \ (e.g. `file show foo\ bar`) or with a " (e.g. `file show "foo bar"`). Space completion is disabled when entering a filename.

Command completion also applies to filenames and directories:

```cli
admin@ncs# <space>
Possible completions:
  alarms                 Alarm management
  autowizard             Automatically query for mandatory elements
  cd                     Change working directory
  clear                  Clear parameter
  cluster                Cluster configuration
  compare                Compare running configuration to another
                         configuration or a file
  complete-on-space      Enable/disable completion on space
  compliance             Compliance reporting
  config                 Manipulate software configuration information
  describe               Display transparent command information
  devices                The managed devices and device communication settings
  display-level          Configure show command display level
  exit                   Exit the management session
  file                   Perform file operations
  help                   Provide help information
  ...
admin@ncs# dev<space>ices <space>
Possible completions:
  check-sync            Check if the NCS config is in sync with the device
  check-yang-modules    Check if NCS and the devices have compatible YANG
                        modules
  clear-trace           Clear all trace files
  commit-queue          List of queued commits
  ...
admin@ncs# devices check-s<space>ync
```

## Comments, Annotations, and Tags <a href="#d5e1780" id="d5e1780"></a>

All characters following a **`!`**, up to the next new line, are ignored. This makes it possible to have comments in a file containing CLI commands, and still be able to paste the file into the command-line interface. For example:

```
! Command file created by Joe Smith
! First show the configuration before we change it
show running-config
! Enter configuration mode and configure an ethernet setting on the ce0 device
config
devices device ce0 config ios:ethernet cfm global
commit
top
exit
exit
! Done
```

To enter the comment character as an argument, it has to be prefixed with a backslash (\\) or used inside quotes (").

The `/* ... */` comment style is also supported.

When using large configurations it may make sense to be able to associate comments (annotations) and tags with the different parts. Then filter the configuration with respect to the annotations or tags. For example, tagging parts of the configuration that relate to a certain department or customer.

NSO has support for both tags and annotations. There is a specific set of commands available in the CLI for annotating and tagging parts of the configuration. There is also a set of pipe commands for controlling whether the tags and annotations should be displayed and for filtering depending on annotation and tag content.

The commands are:

* `annotate <statement> <text>`
* `tag add <statement> <tag>`
* `tag clear <statement> <tag>`
* `tag del <statement> <tag>`

Example:

```cli
admin@ncs(config)# annotate aaa authentication users user admin \
"Only allow the XX department access to this user."
admin@ncs(config)# tag add aaa authentication users user oper oper_tag
admin@ncs(config)# commit
Commit complete.
```

To view the placement of tags and annotations in the configuration it is recommended to use the pipe command `display curly-braces`. The annotations and tags will be displayed as comments where the tags are prefixed by `Tags:`. For example:

```cli
admin@ncs(config)# do show running-config aaa authentication users user | \
    tags oper_tag | display curly-braces
/* Tags: oper_tag */
user oper {
    uid        1000;
    gid        1000;
    password   $1$9qV138GJ$.olmolTfRbFGQhWJMZ9kA0;
    ssh_keydir /var/ncs/homes/oper/.ssh;
    homedir    /var/ncs/homes/oper;
}
admin@ncs(config)# do show running-config aaa authentication users user | \
    annotation XX | display curly-braces
/* Only allow the XX department access to this user. */
user admin {
    uid        1000;
    gid        1000;
    password   $1$EcQwYvnP$Rvq3MPTMSz29UaVOHA/511;
    ssh_keydir /var/ncs/homes/admin/.ssh;
    homedir    /var/ncs/homes/admin;
}
```

It is possible to hide the tags and annotations when viewing the configuration or to explicitly include them in the listing. This is done using the `display annotations/tags` and `hide annotations/tags` pipe commands. To hide all attributes (annotations, tags, and FASTMAP attributes) use the `hide attributes` pipe command.

Annotations and tags are part of the configuration. When adding, removing, or modifying an annotation or a tag, the configuration needs to be committed similar to any other change to the configuration.

## CLI Messages <a href="#d5e1824" id="d5e1824"></a>

Messages appear when entering and exiting configure mode, when committing a configuration, and when typing a command or value that is not valid:

```cli
admin@ncs# show c
-----------------^
syntax error:
Possible alternatives starting with c:
  cli           - Display cli settings
  configuration - Commit configuration changes
admin@ncs# show configuration
------------------------------^
syntax error: expecting
  commit - Commit configuration changes
```

When committing a configuration, the CLI first validates the configuration, and if there is a problem it will indicate what the problem is.

If a missing identifier or a value is out of range a message will indicate where the errors are:

```cli
admin@ncs# config
Entering configuration mode terminal
admin@ncs(config)# nacm rule-list any-group rule allowrule
admin@ncs(config-rule-allowrule)# commit
Aborted: 'nacm rule-list any-group rule allowrule action' is not configured
```

## `ncs.conf` Settings <a href="#d5e1837" id="d5e1837"></a>

Parts of the CLI behavior can be controlled from the `ncs.conf` file. See the [ncs.conf(5)](https://developer.cisco.com/docs/nso-guides-6.3/#!ncs-man-pages-volume-5/man.5.ncs.conf) in Manual Pages manual page for a comprehensive description of all the options.

## CLI Environment <a href="#d5e1842" id="d5e1842"></a>

There are a number of session variables in the CLI. They are only used during the session and are not persistent. Their values are inspected using `show cli` in operational mode, and set using **set** in operational mode. Their initial values are in order derived from the content of the `ncs.conf` file, and the global defaults as configured at `/aaa:session` and user-specific settings configured at `/aaa:user{<user>}/setting`.

```cli
admin@ncs# show cli
autowizard            false
complete-on-space     true
display-level         99999999
history               100
idle-timeout          1800
ignore-leading-space  false
output-file           terminal
paginate              true
prompt1               \h\M#
prompt2               \h(\m)#
screen-length         71
screen-width          80
service prompt config true
show-defaults         false
terminal              xterm-256color
...
```

The different values control different parts of the CLI behavior:

<details>

<summary><code>autowizard (true | false)</code></summary>

When enabled, the CLI will prompt the user for the required settings when a new identifier is created.\
\
For example:

```cli
admin@ncs(config)# aaa authentication users user John
Value for 'uid' (<int>): 1006
Value for 'gid' (<int>): 1006
Value for 'password' (<hash digest string>): ******
Value for 'ssh_keydir' (<string>): /var/ncs/homes/john/.ssh
Value for 'homedir' (<string>): /var/ncs/homes/john
```

This helps the user set all mandatory settings.\
\
It is recommended to disable the autowizard before pasting in a list of commands, in order to avoid prompting. A good practice is to start all such scripts with a line that disables the `autowizard`:

```
autowizard false
...
autowizard true
```

</details>

<details>

<summary><code>complete-on-space (true | false)</code></summary>

Controls if command completion should be attempted when `<space>` is entered. Entering `<tab>` always results in command completion.

</details>

<details>

<summary><code>devtools (true | false)</code></summary>

Controls if certain commands that are useful for developers should be enabled. The command `xpath` and `timecmd` are examples of such a command.

</details>

<details>

<summary><code>history (&#x3C;integer>)</code></summary>

Size of CLI command history.

</details>

<details>

<summary><code>idle-timeout (&#x3C;seconds>)</code></summary>

Maximum idle time before being logged out. Use 0 (zero) for for infinity.

</details>

<details>

<summary><code>ignore-leading-space (true | false)</code></summary>

Controls if leading spaces should be ignored or not. This is useful to turn off when pasting commands into the CLI.

</details>

<details>

<summary><code>paginate (true | false)</code></summary>

Some commands paginate (or MORE process) the output, for example, `show running-config`. This can be disabled or enabled. It is enabled by default. Setting the screen length to 0 has the same effect as turning off pagination.

</details>

<details>

<summary><code>screen length (&#x3C;integer>)</code></summary>

The current length of the terminal. This is used when paginating output to get the proper line count. Setting this to 0 (zero) means it becomes the maximum length and turns off pagination.

</details>

<details>

<summary><code>screen width (&#x3C;integer>)</code></summary>

The current width of the terminal. This is used when paginating output to get the proper line count. Setting this to 0 (zero) means it becomes the maximum width.

</details>

<details>

<summary><code>service prompt config</code></summary>

Controls whether a prompt should be displayed in configure mode. If set to false then no prompt will be displayed. The setting is changed using the commands `no service prompt config` and `service prompt config` in configure mode.

</details>

<details>

<summary><code>terminal (string)</code></summary>

Terminal type. This setting is used for controlling how line editing is performed. Supported terminals are: `dumb`, `vt100`, `xterm`, `linux`, and `ansi`. Other terminals may also work but have no explicit support.

</details>

## Customizing the CLI

### Adding New Commands <a href="#d5e2650" id="d5e2650"></a>

New commands can be added by placing a script in the `scripts/command` directory. See [Plug-and-play Scripting](../operations/plug-and-play-scripting.md).

### File Access <a href="#d5e2655" id="d5e2655"></a>

The default behavior is to enforce Unix-style access restrictions. That is, the user's `uid`, `gid`, and `gids` are used to control what the user has read and write access to.

However, it is also possible to jail a CLI user to their home directory (or the directory where `ncs_cli` is started). This is controlled using the `ncs.conf` parameter `restricted-file-access`. If this is set to `true`, then the user only has access to the home directory.

### Help Texts <a href="#d5e2664" id="d5e2664"></a>

Help and information texts are specified in several places. In the Yang files, the `tailf:info` element is used to specify a descriptive text that is shown when the user enters `?` in the CLI. The first sentence of the `info` text is used when showing one-line descriptions in the CLI.

## Quoting and Escaping Scheme <a href="#d5e2669" id="d5e2669"></a>

### **Canonical Quoting Scheme** <a href="#d5e2671" id="d5e2671"></a>

NCS understands multiple quoting schemes on input and de-quotes a value when parsing the command. Still, it uses what it considers a canonical quoting scheme when printing out this value, e.g., when pushing a configuration change to the device. However, different devices may have different quoting schemes, possibly not compatible with the NCS canonical quoting scheme. For example, the following value cannot be printed out by NCS as two backslashes `\\` match `\` in the quoting scheme used by NCS when encoding values.

```
"foo\\/bar\\?baz"
```

General rules for NCS to represent backslash are as follows, and so on. It can only get an odd number of backslashes output from NCS.

* `\` and `\\` are represented as `\`.
* `\\\` and `\\\\` are represented as `\\\`.
* `\\\\\` and `\\\\\\` are represented as `\\\\\`.

A backslash `\` is represented as a backslash `\` when it is followed by a character that does not need to be escaped but is represented as double backslashes `\\` if the next character could be escaped. With remote passwords, if you are using special characters, be sure to follow recommended guidelines, see [Configure Mode](introduction-to-nso-cli.md#d5e1216) for more information.

### **Escape Backslash Handling** <a href="#d5e2688" id="d5e2688"></a>

To let NCS pass through a quoted string verbatim, one can do as stated below:

* Enable the NCS configuration parameter `escapeBackslash` in the `ncs.conf` file. This is a global setting on NCS which affects all the NEDs.
* Alternatively, a certain NED may be updated on request to be able to transform the value printed by NCS to what the device expects if one only wants to affect a certain device instead of all the connected ones.

### **Octal Numbers Handling** <a href="#d5e2697" id="d5e2697"></a>

If there are numeric triplets following a backslash `\`, NCS will treat them as octal numbers and convert them to one character based on ASCII code. For example:

* `\123` is converted to `S`.
* `\067` is converted to `7`.
