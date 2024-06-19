---
description: CLI command reference.
---

# CLI Commands

## Commands <a href="#d5e1937" id="d5e1937"></a>

To get a full XML listing of the commands available in a running NSO instance, use the `ncs` option `--cli-c-dump <file>`. The generated file is only intended for documentation purposes and cannot be used as input to the `ncsc` compiler. The command `show parser dump` can be used to get a command listing.

### Operational Mode Commands <a href="#d5e1943" id="d5e1943"></a>

#### Invoke an Action

<details>

<summary><code>&#x3C;path> &#x3C;parameters></code></summary>

Invokes the action found at `<path>` using the supplied parameters.

This command is auto-generated from the YANG file.

For example, given the following action specification in a YANG file:

```
tailf:action shutdown {
  tailf:actionpoint actions;
  input {
    tailf:constant-leaf flags {
      type uint64 {
        range "1 .. max";
      }
      tailf:constant-value 42;
    }
    leaf timeout {
      type xs:duration;
      default PT60S;
    }
    leaf message {
      type string;
    }
    container options {
      leaf rebootAfterShutdown {
        type boolean;
        default false;
      }
      leaf forceFsckAfterReboot {
        type boolean;
        default false;
      }
      leaf powerOffAfterShutdown {
        type boolean;
        default true;
      }
    }
  }
}
```

The action can be invoked in the following way

```
admin@ncs> shutdown timeout 10s message reboot options { \
    forceFsckAfterReboot true }
```

</details>

#### Builtin Commands

<details>

<summary><code>commit (abort | confirm)</code></summary>

Abort or confirm a pending confirming commit. A pending confirming commit will also be aborted if the CLI session is terminated without doing `commit confirm`. The default is confirm.

Example:

```
admin@ncs# commit abort
```

</details>

<details>

<summary><code>config (exclusive | terminal) [no-confirm]</code></summary>

Enter configure mode. The default is `terminal`.

</details>

<details>

<summary><code>terminal</code></summary>

Edit a private copy of the running configuration, no lock is taken.

</details>

<details>

<summary><code>no-confirm</code></summary>

Enter configure mode ignoring any confirm dialog

Example:

```
admin@ncs# config terminal
Entering configuration mode terminal
```

</details>

<details>

<summary><code>file list &#x3C;directory></code></summary>

List files in `<directory>.`

Example:

```
admin@ncs# file list /config
rollback10001
rollback10002
rollback10003
rollback10004
rollback10005
```

</details>

<details>

<summary><code>file show &#x3C;file></code></summary>

Display contents of a `<file>`.

Example:

```
admin@ncs# file show /etc/skel/.bash_profile
# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs our .bashrc and is recommended by the bash info pages.
[[ -f ~/.bashrc ]] && . ~/.bashrc
```

</details>

<details>

<summary><code>help &#x3C;command></code></summary>

Display help text related to `<command>.`

Example:

```
admin@ncs# help job
Help for command: job
    Job operations
```

</details>

<details>

<summary><code>job stop &#x3C;job id></code></summary>

Stop a specific background job. In the default CLI the only command that creates background jobs is `monitor start`.

Example:

```
admin@ncs# monitor start /var/log/messages
[ok][...]
admin@ncs# show jobs
JOB COMMAND
3   monitor start /var/log/messages
admin@ncs# job stop 3
admin@ncs# show jobs
JOB COMMAND
```

</details>

<details>

<summary><code>logout session &#x3C;session></code></summary>

Log out a specific user session from NSO. If the user holds the `configure exclusive` lock, it will be released.

`<sessionid>`

Log out a specific user session.

Example:

```
admin@ncs# who
Session User  Context From         Proto Date     Mode
 25     oper  cli     192.168.1.72 ssh   12:10:40 operational
*24     admin cli     192.168.1.72 ssh   12:05:50 operational
admin@ncs# logout session 25
admin@ncs# who
Session User  Context From         Proto Date     Mode
*24     admin cli     192.168.1.72 ssh   12:05:50 operational
```

</details>

<details>

<summary><code>logout user &#x3C;username></code></summary>

Log out a specific user from NSO. If the user holds the `configure exclusive` lock, it will be released.

`<username>`

Log out a specific user.

Example:

```
admin@ncs# who
Session User  Context From         Proto Date     Mode
 25     oper  cli     192.168.1.72 ssh   12:10:40 operational
*24     admin cli     192.168.1.72 ssh   12:05:50 operational
admin@ncs# logout user oper
admin@ncs# who
Session User  Context From         Proto Date     Mode
*24     admin cli     192.168.1.72 ssh   12:05:50 operational
```

</details>

<details>

<summary><code>script reload</code></summary>

Reload scripts found in the `scripts/command`directory. New scripts will be added and if a script file has been removed the corresponding CLI command will be purged. See [Plug-and-play Scripting](../cli-1/plug-and-play-scripting.md).

</details>

<details>

<summary><code>send (all | &#x3C;user>) &#x3C;message></code></summary>

Display a message on the screens of all users who are logged in to the device or on a specific screen.

`all`

Display the message to all currently logged-in users.

`<user>`

Display the message to a specific user.

Example:

<pre><code><strong>admin@ncs# send oper "I will reboot system in 5 minutes."
</strong></code></pre>

In oper's session:

```
oper@ncs# Message from admin@ncs at 13:16:41...
I will reboot system in 5 minutes.
EOF
```

</details>

<details>

<summary><code>show cli</code></summary>

Display CLI properties.

Example:

```
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
timestamp             disable
```

</details>

<details>

<summary><code>show history [ &#x3C;limit> ]</code></summary>

Display CLI command history. By default, the last 100 commands are listed. The size of the history list is configured using the history CLI setting. If a history limit has been specified only the last number of commands up to that limit will be shown.

Example:

```
admin@ncs# show history
06-19 14:34:02 -- ping router
06-20 14:42:35 -- show running-config
06-20 14:42:37 -- who
06-20 14:42:40 -- show history
admin@ncs# show history 3
14:42:37 -- who
14:42:40 -- show history
14:42:46 -- show history 3
```

</details>

<details>

<summary><code>show jobs</code></summary>

Display currently running background jobs.

Example:

```
admin@ncs# show jobs
JOB COMMAND
3   monitor start /var/log/messages
```

</details>

<details>

<summary><code>show parser dump &#x3C;command prefix></code></summary>

Shows all possible commands starting with the `<command prefix>`.

</details>

<details>

<summary><code>show running-config [ &#x3C;pathfilter> [ sort-by &#x3C;idx> ] ]</code></summary>

Display current configuration. By default, the whole configuration is displayed. It is possible to limit what is shown by supplying a pathfilter.

The `<pathfilter>` maybe either a path pointing to a specific instance or if an instance id is omitted, the part following the omitted instance is treated as a filter.

The `sort-by` argument can be given when the `<pathfilter>` points to a list element with secondary indexes. `<idx>` is the name of a secondary index. When given, the table will be sorted in the order defined by the secondary index. This makes it possible for the CLI user to control in which order instances should be displayed.

To show the `aaa` settings for the `admin` user:

```
admin@ncs# show running-config aaa authentication users user admin
aaa authentication users user admin
 uid        1000
 gid        1000
 password   $1$JA.1O3Tx$Zt1ycpnMlg1bVMqM/zSZ7/
 ssh_keydir /var/ncs/homes/admin/.ssh
 homedir    /var/ncs/homes/admin
!
```

To show all users that have group ID 1000, omit the user ID and instead specify `gid` `1000`:

<pre><code><strong>admin@ncs# show running-config aaa authentication users user * gid 1000
</strong>...
</code></pre>

</details>

<details>

<summary><code>show &#x3C;path> [ sort-by &#x3C;idx> ]</code></summary>

This command shows the configuration as a table provided that `<path>` leads to a list element and the data can be rendered as a table (ie, the table fits on the screen). It is also possible to force table formatting of a list by using the `| tab` pipe command.

The `sort-by` argument can be given when the _path_ points to a list element with secondary indexes. `<idx>` is the name of a secondary index. When given, the table will be sorted in the order defined by the secondary index. This makes it possible for the CLI user to control in which order instances should be displayed.

Example:

```
admin@ncs# show devices device ce0 module
NAME                       REVISION    FEATURE  DEVIATION
-----------------------------------------------------------
tailf-ned-cisco-ios        2015-03-16  -        -
tailf-ned-cisco-ios-stats  2015-03-16  -        -
```

</details>

<details>

<summary><code>source &#x3C;file></code></summary>

Execute commands from \<file> as if they had been entered by the user. The `autowizard` is disabled when executing commands from the file, also any commands that require input from the user (commands added by clispec, for example) will receive an interrupt signal upon attempt to read from stdin.

</details>

<details>

<summary><code>timecmd &#x3C;command></code></summary>

Time command. It measures and displays the execution time of `<command>`.

Note that this command will only be available if `devtools` has been set to `true` in the CLI session settings.

Example:

```
admin@ncs# timecmd id
user = admin(501), gid=20, groups=admin, gids=12,20,33,61,79,80,81,98,100
Command executed in 0.00 sec
admin@ncs#
```

</details>

<details>

<summary><code>who</code></summary>

Display currently logged-on users. The current session, i.e. the session running the show status command, is marked with an asterisk.

Example:

```
admin@ncs# who
Session User  Context From         Proto Date     Mode
 25     oper  cli     192.168.1.72 ssh   12:10:40 operational
*24     admin cli     192.168.1.72 ssh   12:05:50 operational
admin@ncs#
```

</details>

### Configure Mode Commands <a href="#d5e2199" id="d5e2199"></a>

#### **Configure a Value**

<details>

<summary><code>&#x3C;path> [&#x3C;value>]</code></summary>

Set a parameter. If a new identifier is created and `autowizard` is enabled, then the CLI will prompt the user for all mandatory sub-elements of that identifier.

This command is auto-generated from the YANG file\_.\_

If no `<value>` is provided, then the CLI will prompt the user for the value. No echo of the entered value will occur if `<path>` is an encrypted value, i.e. of the type MD5DigestString, DESDigestString, DES3CBCEncryptedString, AESCFB128EncryptedString, or AES256CFB128EncryptedString as documented in the `tailf-common.yang` data model.

</details>

#### **Builtin Commands**

<details>

<summary><code>annotate &#x3C;statement> &#x3C;text></code></summary>

Associate an annotation with a given configuration. To remove an annotation leave the text empty.

Only available when the system has been configured with attributes enabled.

</details>

<details>

<summary><code>commit (check | and-quit | confirmed | to-startup)</code><br><code>[comment &#x3C;text>] [label &#x3C;text>]</code></summary>

Commit the current configuration to "running".

* `check`: Validate current configuration.
* `and-quit`: Commit to running and quit configure mode.
* `comment <text>`: Associate a comment with the commit. The comment can later be seen when examining rollback files.
* `label <text>`: Associate a label with the commit. The label can later be seen when examining rollback files.

</details>

<details>

<summary><code>copy &#x3C;instance path> &#x3C;new id></code></summary>

Make a copy of an instance.

Copying between different ned-id versions works as long as the schema nodes being copied have not changed between the versions.

</details>

<details>

<summary><code>copy cfg [ merge | overwrite] &#x3C;src path> to &#x3C;dest path></code></summary>

Copy data from one configuration tree to another. Only data that makes sense at the destination will be copied. No error message will be generated for data that cannot be copied and the operation can fail completely without any error messages being generated.

For example to create a template from a part of a device config. First, configure the device then copy the config into the template configuration tree.

```
admin@ncs(config)# devices template host_temp
admin@ncs(config-template-host_temp)# exit
admin@ncs(config)# copy cfg merge devices device ce0 config \
    ios:ethernet to devices template host_temp config ios:ethernet
admin@ncs(config)# show configuration diff
+devices template host_temp
+ config
+  ios:ethernet cfm global
+ !
+!
```

</details>

<details>

<summary><code>copy compare &#x3C;src path> to &#x3C;dest path></code></summary>

Compare two arbitrary configuration trees. Items that only appear in the `src` tree are ignored.

</details>

<details>

<summary><code>delete &#x3C;path></code></summary>

Delete a data element.

</details>

<details>

<summary><code>do &#x3C;command></code></summary>

Run the command in operational mode.

</details>

<details>

<summary><code>edit &#x3C;path></code></summary>

Edit a sub-element. Missing elements in the `<path>` will be created.

</details>

<details>

<summary><code>exit (level | configuration-mode)level</code></summary>

* `level`\
  Exit from this level. If performed on the top level, will exit configure mode. This is the default if no option is given.

<!---->

* `configuration-mode`\
  Exit from configuration mode regardless of which edit level.

</details>

<details>

<summary><code>help &#x3C;command></code></summary>

Shows help text for `<command>`.

</details>

<details>

<summary><code>hide &#x3C;hide-group></code></summary>

Re-hides the elements and actions belonging to the hide groups. No password is required for hiding. This command is hidden and not shown during command completion.

</details>

<details>

<summary><code>insert &#x3C;path></code></summary>

Inserts a new element. If the element already exists and has the `indexedView` option set in the data model, then the old element will be renamed to element+1, and the new element will be inserted in its place.

</details>

<details>

<summary><code>insert &#x3C;path>[ first| last| before key| after key]</code></summary>

Inject a new element into an ordered list. The element can be added first, last (default), before or after another element.

</details>

<details>

<summary><code>load (merge | override | replace) (terminal | &#x3C;file>)</code></summary>

Load configuration from file or terminal.

* `merge`\
  Merge the content of the file/terminal with the current configuration.

<!---->

* `override`\
  Configuration from file/terminal overwrites the current configuration.

<!---->

* `replace`\
  Configuration from file/terminal replaces the current configuration.

If this is the current configuration:

```
devices device p1
 config
  cisco-ios-xr:interface GigabitEthernet 0/0/0/0
   shutdown
  exit
  cisco-ios-xr:interface GigabitEthernet 0/0/0/1
   shutdown
 !
!
```

The `shutdown` value for the entry `GigabitEthernet 0/0/0/0` should be deleted. As the configuration file is basically just a sequence of commands with comments in between, the configuration file should look like this:

```
devices device p1
 config
  cisco-ios-xr:interface GigabitEthernet 0/0/0/0
   no shutdown
  exit
 !
!
```

The file can then be used with the command ` load merge`` `` `_`FILENAME`_ to achieve the desired results.

</details>

<details>

<summary><code>move &#x3C;path>[ first | last| before key | after key]</code></summary>

Move an existing element to a new position in an ordered list. The element can be moved first, last (default), before or after another element.

</details>

<details>

<summary><code>rename &#x3C;instance path> &#x3C;new id></code></summary>

Rename an instance.

</details>

<details>

<summary><code>revert</code></summary>

Copy the running configuration into the current configuration, eg remove all uncommitted changes.

</details>

<details>

<summary><code>rload (merge | override | replace) (terminal | &#x3C;file>)</code></summary>

Load file relative to the current sub-mode. For example, given a file with a device config it is possible to enter one device and issue the `rload merge/override/replace <file>` command to load the config for that device, then enter another device and load the same config file using `rload`. See also the `load` command.

* `merge`\
  Merge the content of the file/terminal with the current configuration.

<!---->

* `override`\
  Configuration from file/terminal overwrites the current configuration.

<!---->

* `replace`\
  Configuration from file/terminal replaces the current configuration.

</details>

<details>

<summary><code>rollback-files apply-rollback-file (id | fixed-number)</code><br><code>&#x3C;number> [path &#x3C;path>] [selective]</code></summary>

Return the configuration to a previously committed configuration. The system stores a limited number of old configurations. The number of old configurations to store is configured in the `ncs.conf` file. If more than the configured number of configurations is stored, then the oldest configuration is removed before creating a new one.

The configuration changes are stored in rollback files where the most recent changes are stored in the file rollbackN with the highest number N.

Only the deltas are stored in the rollback files. When rolling back the configuration to rollback N, all changes stored in rollback10001-rollbackN are applied.

There are two ways to address which rollback file to use, either `fixed-number <number>` to address an absolute rollback number or **id \<number>** to address a relative number. For e.g., the latest commit has relative rollback id 0, the second-latest has id 1, and so on.

The optional path argument allows subtrees to be rolled back while the rest of the configuration tree remains unchanged.

Instead of undoing all changes from rollback10001 to rollbackN it is possible to undo only the changes stored in a specific rollback file. This may or may not work depending on which changes have been made to the configuration after the rollback was created. In some cases applying the rollback file may fail, or the configuration may require additional changes in order to be valid. E.g. to undo the changes recorded in rollback 10019, but not the changes in 10020-N run the command `rollback-files apply-rollback-file selective fixed-number 10019`.

Example:

<pre><code><strong>admin@ncs(config)# rollback-files apply-rollback-file fixed-number 10005
</strong></code></pre>

This command is only available if rollback has been enabled in `ncs.conf`.

</details>

<details>

<summary><code>show full-configuration [&#x3C;pathfilter> [sort-by &#x3C;idx>]]</code></summary>

Show the current configuration, taking local changes into account. The `show` command can be limited to a part of the configuration by providing a `<pathfilter>`.

The `sort-by` argument can be given when the `<pathfilter>` points to a list element with secondary indexes. `<idx>` is the name of a secondary index. When given, the table will be sorted in the order defined by the secondary index. This makes it possible for the CLI user to control in which order instances should be displayed.

</details>

<details>

<summary><code>show configuration [&#x3C;pathfilter>]</code></summary>

Show current edits to the configuration.

</details>

<details>

<summary><code>show configuration merge [&#x3C;pathfilter> [sort-by &#x3C;idx>]]</code></summary>

Show the current configuration, taking local changes into account. The `show` command can be limited to a part of the configuration by providing a `<pathfilter>`.

The `sort-by` argument can be given when the `<pathfilter>` points to a list element with secondary indexes. `<idx>` is the name of a secondary index. When given, the table will be sorted in the order defined by the secondary index. This makes it possible for the CLI user to control in which order instances should be displayed.

</details>

<details>

<summary><code>show configuration commit changes [&#x3C;number> [&#x3C;path>]]</code></summary>

Display edits associated with a commit, identified by the rollback number created for the commit. The changes are displayed as forward changes, as opposed to `show configuration rollback changes` which displays the commands for undoing the changes.

The optional path argument allows only edits related to a given subtree to be listed.

</details>

<details>

<summary><code>show configuration commit list [&#x3C;path>]</code></summary>

List rollback files

The optional path argument allows only rollback files related to a given subtree to be listed.

</details>

<details>

<summary><code>show configuration rollback listed [&#x3C;number>]</code></summary>

Display the operations needed to undo the changes performed in a commit associated with a rollback file. These are the changes that will be applied if the configuration is rolled back to that rollback number.

</details>

<details>

<summary><code>show configuration running [&#x3C;pathfilter>]</code></summary>

Display the "running" configuration without taking uncommitted changes into account. An optional `<pathfilter>` can be provided to limit what is displayed.

</details>

<details>

<summary><code>show configuration diff [&#x3C;pathfilter>]</code></summary>

Display uncommitted changes to the running-config in diff-style, ie with + and - in front of added and deleted configuration lines.

</details>

<details>

<summary><code>show parser dump &#x3C;command prefix></code></summary>

Shows all possible commands starting with `<command>` prefix.

</details>

<details>

<summary><code>tag add &#x3C;statement> &#x3C;tag></code></summary>

Add a tag to a configuration statement.

Only available when the system has been configured with attributes enabled.

</details>

<details>

<summary><code>tag del &#x3C;statement> &#x3C;tag></code></summary>

Remove a tag from a configuration statement.

Only available when the system has been configured with attributes enabled.

</details>

<details>

<summary><code>tag clear &#x3C;statement></code></summary>

Remove all tags from a configuration statement.

Only available when the system has been configured with attributes enabled.

</details>

<details>

<summary><code>timecmd &#x3C;command></code></summary>

Time command. It measures and displays the execution time of `<command>`.

Note that this command will only be available if `devtools` has been set to `true` in the CLI session settings.

Example:

```
admin@ncs# timecmd id
user = admin(501), gid=20, groups=admin, gids=12,20,33,61,79,80,81,98,100
Command executed in 0.00 sec
admin@ncs#
```

</details>

<details>

<summary><code>top [command]</code></summary>

Exit to the top level of the configuration, or execute a command at the top level of the configuration.

</details>

<details>

<summary><code>unhide &#x3C;hide-group></code></summary>

Unhides all elements and actions belonging to the `<hide-group>`. It may be required to enter a password. This command is hidden and not shown during command completion

</details>

<details>

<summary><code>validate</code></summary>

Validates current configuration. This is the same operation as `commit check`.

</details>

<details>

<summary><code>xpath [ctx &#x3C;path>] (eval | must | when) &#x3C;expression></code></summary>

Evaluate an XPath expression. A context path may be given to be used as the current context for the evaluation of the expression. If no context path is given, the current sub-mode will be used as the context path. The pipe command `trace` may be used to display debug/trace information during the execution of the command.

Note that this command will only be available if `devtools` has been set to `true` in the CLI session settings.

* `eval`\
  Evaluate an XPath expression.

<!---->

* `must`\
  Evaluate the expression as a YANG must expression.

<!---->

* `when`\
  Evaluate the expression as a YANG when expression.

</details>

<details>

<summary><code>reapply-commands [best-effort | list]</code></summary>

Reapply entered config commands since the latest commit. The command will stop on the first error by default.

Commands that may have unknown side-effects will be skipped and thus not reapplied, such as actions, custom commands, etc. To display all commands, including those that will be skipped, the pipe command `details` can be used.

Note that this command will only be available if there is a conflict.

`best-effort`

Do not stop on the first error but continue to process the rest of the commands.

`list`

Display the current set of commands.

</details>
