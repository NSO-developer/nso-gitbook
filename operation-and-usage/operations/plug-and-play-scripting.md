---
description: Use NSO's plug-and-play scripting mechanism to add new functionality to NSO.
---

# Plug-and-Play Scripting

&#x20;A scripting mechanism can be used together with the CLI (scripting is not available for any other northbound interfaces). This section is intended for users who are familiar with UNIX shell scripting and/or programming. With the scripting mechanism, an end-user can add new functionality to NSO in a plug-and-play-like manner. No special tools are needed.

There are three categories of scripts:

* `command` scripts: Used to add new commands to the CLI.
* `policy` scripts: Invoked at validation time and may control the outcome of a transaction. Policy scripts have the mandate to cause a transaction to abort.
* `post-commit` scripts: Invoked when a transaction has been committed. Post-commit scripts can for example be used for logging, sending external events etc.

The terms 'script' and 'scripting' used throughout this description refer to how functionality can be added without a requirement for integration using the NSO programming APIs. NSO will only run the scripts as UNIX executables. Thus they may be written as shell scripts, or by using another scripting language that is supported by the OS, e.g., Python, or even as compiled code. The scripts are run with the same user ID as NSO.

The examples in this section are written using shell scripts as the least common denominator, but they can be written in another suitable language, e.g., Python or C.

## Script Storage <a href="#d5e4460" id="d5e4460"></a>

Scripts are stored in a directory tree with a predefined structure where there is a sub-directory for each script category:

```
scripts/
        command/
        policy/
        post-commit/
```

For all script categories, it suffices to just add a valid script in the correct sub-directory to enable the script. See the details for each script category for how a valid script of that category is defined. Scripts with a name beginning with a dot character ('.') are ignored.

The directory path to the location of the scripts is configured with the `/ncs-config/scripts/dir` configuration parameter. It is possible to have several script directories. The sample `ncs.conf` file that comes with the NSO release specifies two script directories: `./scripts` and `${NCS_DIR}/scripts`.

## Script Interface <a href="#d5e4471" id="d5e4471"></a>

All scripts are required to provide a formal description of their interface. When the scripts are loaded, NSO will invoke the scripts with (one of) the following as an argument depending on the script category.

* `--command`
* `--policy`
* `--post-commit`

The script must respond by writing its formal interface description on `stdout` and exit normally. Such a description consists of one or more sections. Which sections are required, depends on the category of the script.

The sections do however have a common syntax. Each section begins with the keyword `begin` followed by the type of section. After that one or more lines of settings follow. Each such setting begins with a name, followed by a colon character (`:`), and after that the value is stated. The section ends with the keyword `end`. Empty lines and spaces may be used to improve readability.

For examples see each corresponding section below.

## Script Loading <a href="#d5e4494" id="d5e4494"></a>

Scripts are automatically loaded at startup and may also be manually reloaded with the CLI command `script reload`. The command takes an optional `verbosity` parameter which may have one of the following values:

* `diff`: Shows info about those scripts that have been changed since the latest (re)load. This is the default.
* `all`: Shows info about all scripts regardless of whether they have been changed or not.
* `errors`: Shows info about those scripts that are erroneous, regardless of whether they have been changed or not. Typical errors are invalid file permissions and syntax errors in the interface description.

Yet another parameter may be useful when debugging the reload of scripts:

* `debug`: Shows additional debug info about the scripts.

An example session reloading scripts using the [examples.ncs/sdk-api/scripting](https://github.com/NSO-developer/nso-examples/tree/6.4/sdk-api/scripting) example:

```cli
admin@ncs# script reload all
$NCS_DIR/examples.ncs/sdk-api/scripting/scripts:
ok
command:
    add_user.sh: unchanged
    echo.sh: unchanged
policy:
    check_dir.sh: unchanged
post-commit:
    show_diff.sh: unchanged
/opt/ncs/scripts: ok
command:
    device_brief.sh: unchanged
    device_brief_c.sh: unchanged
    device_list.sh: unchanged
    device_list_c.sh: unchanged
    device_save.sh: unchanged
```

## Command Scripts <a href="#d5e4525" id="d5e4525"></a>

Command scripts are used to add new commands to the CLI. The scripts are executed in the context of a transaction. When the script is run in `oper` mode, this is a read-only transaction, when it is run in `config` mode, it is a read-write transaction. In that context, the script may make use of the environment variables `NCS_MAAPI_USID` and `NCS_MAAPI_THANDLE` in order to attach to the active transaction. This makes it simple to make use of the `ncs-maapi` command (see the [ncs-maapi(1)](https://developer.cisco.com/docs/nso-api-6.4/ncs-man-pages-volume-1/#man.1.maapi) in Manual Pages manual page) for various purposes.

Each command script must be able to handle the argument `--command` and, when invoked, write a `command` section to `stdout`. If the CLI command is intended to take parameters, one `param` section per CLI parameter must also be emitted.

The command is not paginated by default in the CLI and will only do so if it is piped to `more`.

```
joe@io> example_command_script | more
```

### `command` Section <a href="#d5e4544" id="d5e4544"></a>

The following settings can be used to define a command:

* `modes`: Defines in which CLI mode(s) that the command should be available. The value can be `oper`, `config` or both (separated with space).
* `styles`: Defines in which CLI styles the command should be available. The value can be one or more of `c`, `i` and `j` (separated with space). `c` means Cisco style, `i`means Cisco IOS, and `j` J-style.
* `cmdpath`: Is the full CLI command path. For example, the `command` path `my script echo` implies that the command will be called `my script echo` in the CLI.
* `help`: Command help text.

An example of a `command` section is:

```
begin command
  modes: oper
  styles: c i j
  cmdpath: my script echo
  help: Display a line of text
end
```

### `param` Section <a href="#d5e4581" id="d5e4581"></a>

Now let's look at various aspects of a parameter. This may both affect the parameter syntax for the end-user in the CLI as well as what the command script will get as arguments.

The following settings can be used to customize each CLI parameter:

* `name`: Optional name of the parameter. If provided, the CLI will prompt for this name before the value. By default, the name is not forwarded to the script. See `flag` and `prefix`.
* `type`: The type of the parameter. By default each parameter has a value, but by setting the type to `void` the CLI will not prompt for a value. To be useful the `void` type must be combined with `name` and either `flag` or `prefix`.
* `presence`: Controls whether the parameter must be present in the CLI input or not. Can be set to `optional` or `mandatory`.
* `words`: Controls the number of words that the parameter value may consist of. By default, the value must consist of just one word (possibly quoted if it contains spaces). If set to `any`, the parameter may consist of any number of words. This setting is only valid for the last parameter.
* `flag`: Extra argument added before the parameter value. For example, if set to `-f` and the user enters `logfile`, the script will get `-f logfile` as arguments.
* `prefix`: Extra string prepended to the parameter value (as a single word). For example, if set to `--file=` and the user enters `logfile`, the script will get `--file=logfile` as argument.
* `help`: Parameter help text.

If the command takes a parameter to redirect the output to a file, a `param` section might look like this:

```
begin param
 name: file
 presence: optional
 flag: -f
 help: Redirect output to file
end
```

### Full `command` Example <a href="#d5e4639" id="d5e4639"></a>

A command denying changes the configured `trace-dir` for a set of devices, it can use the `check_dir.sh` script.

```
#!/bin/bash

set -e

while [ $# -gt 0 ]; do
    case "$1" in
        --command)
            # Configuration of the command
            #
            # modes   - CLI mode (oper config)
            # styles  - CLI style (c i j)
            # cmdpath - Full CLI command path
            # help    - Command help text
            #
            # Configuration of each parameter
            #
            # name     - (optional) name of the parameter
            # more     - (optional) true or false
            # presence - optional or mandatory
            # type     - void - A parameter without a value
            # words    - any - Multi word param. Only valid for the last param
            # flag     - Extra word added before the parameter value
            # prefix   - Extra string prepended to the parameter value
            # help     - Command help text
            cat << EOF

begin command
  modes: config
  styles: c i j
  cmdpath: user-wizard
  help: Add a new user
end
EOF
            exit
            ;;
        *)
            break
            ;;
    esac
    shift
done

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

groups=`ncs-maapi --keys "/nacm/groups/group"`
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

echo "Creating user"

ncs-maapi --create "/aaa:aaa/authentication/users/user{${user}}"
ncs-maapi --set "/aaa:aaa/authentication/users/user{${user}}/password" \
                "${pass1}"

echo "Setting home directory to: /homes/${user}"
ncs-maapi --set "/aaa:aaa/authentication/users/user{${user}}/homedir" \
            "/homes/${user}"

echo "Setting ssh key directory to: /homes/${user}/ssh_keydir"
ncs-maapi --set "/aaa:aaa/authentication/users/user{${user}}/ssh_keydir" \
            "/homes/${user}/ssh_keydir"

ncs-maapi --set "/aaa:aaa/authentication/users/user{${user}}/uid" "1000"
ncs-maapi --set "/aaa:aaa/authentication/users/user{${user}}/gid" "100"

echo "Adding user to the ${group} group."
gusers=`ncs-maapi --get "/nacm/groups/group{${group}}/user-name"`

for i in ${gusers}; do
    if [ "${i}" == "${user}" ]; then
        echo "User already in group"
        exit 0
    fi
done

ncs-maapi --set "/nacm/groups/group{${group}}/user-name" "${gusers} ${user}"
```

Running the [examples.ncs/sdk-api/scripting](https://github.com/NSO-developer/nso-examples/tree/6.4/sdk-api/scripting) `/scripts/command/echo.sh` script with the argument `--command` argument produces a `command` section and a couple of `param` sections:

```bash
$ ./echo.sh --command
begin command
  modes: oper
  styles: c i j
  cmdpath: my script echo
  help: Display a line of text
end

begin param
 name: nolf
 type: void
 presence: optional
 flag: -n
 help: Do not output the trailing newline
end

begin param
 name: file
 presence: optional
 flag: -f
 help: Redirect output to file
end

begin param
 presence: mandatory
 words: any
 help: String to be displayed
end
```

In the complete example, [examples.ncs/sdk-api/scripting](https://github.com/NSO-developer/nso-examples/tree/6.4/sdk-api/scripting), there is a `README` file and a simple command script `scripts/command/echo.sh`.

## Policy Scripts <a href="#d5e4655" id="d5e4655"></a>

Policy scripts are invoked at validation time before a change is committed. A policy script can reject the data, accept it, or accept it with a warning. If a warning is produced, it will be displayed for interactive users (e.g. through the CLI or Web UI). The user may choose to abort or continue to commit the transaction.

Policy scripts are typically assigned to individual leafs or containers. In some cases, it may be feasible to use a single policy script, e.g. on the top-level node of the configuration. In such a case, this script is responsible for the validation of all values and their relationships throughout the configuration.

All policy scripts are invoked on every configuration change. The policy scripts can be configured to depend on certain subtrees of the configuration, which can save time but it is very important that all dependencies are stated and also updated when the validation logic of the policy script is updated. Otherwise, an update may be accepted even though a dependency should have denied it.

There can be multiple dependency declarations for a policy script. Each declaration consists of a dependency element specifying a configuration subtree that the validation code is dependent upon. If any element in any of the subtrees is modified, the policy script is invoked. A subtree is specified as an absolute path.

If there are no declared dependencies, the root of the configuration tree (/) is used, which means that the validation code is executed when any configuration element is modified. If dependencies are declared on a leaf element, an implicit dependency on the leaf itself is added.

Each policy script must handle the argument `--policy` and, when invoked, write a `policy` section to `stdout`. The script must also perform the actual validation when invoked with the argument `--keypath`.

### `policy` Section <a href="#d5e4667" id="d5e4667"></a>

The following settings can be used to configure a policy script:

* `keypath`: Mandatory. The keypath is the path to a node in the configuration data tree. The policy script will be associated with this node. The path must be absolute. A keypath can for example be `/devices/device/c0`. The script will be invoked if the configuration node, referred to by the keypath, is changed or if any node in the subtree under the node (if the node is a container or list) is changed.
* `dependency`: Declaration of a dependency. The dependency must be an absolute key path. Multiple dependency settings can be declared. Default is `/`.
* `priority`: An optional integer parameter specifying the order policy scripts will be evaluated, in order of increasing priority, where a lower value is higher priority. The default priority is `0`.
* `call`: This optional setting can only be used if the associated node, declared as `keypath`, is a list. If set to `once`, the policy script is only called once even though there exists many list entries in the data store. This is useful if we have a huge amount of instances or if values assigned to each instance have to be validated in comparison with its siblings. Default is `each`.

A policy that will be run for every change on or under `/devices/device`.

```
begin policy
 keypath: /devices/device
 dependency: /devices/global-settings
 priority: 4
 call: each
end
```

### Validation <a href="#d5e4700" id="d5e4700"></a>

When NSO has concluded that the policy script should be invoked to perform its validation logic, the script is invoked with the option `--keypath`. If the registered node is a leaf, its value will be given with the `--value` option. For example `--keypath /devices/device/c0` or if the node is a leaf `--keypath /devices/device/c0/address --value 127.0.0.1`.

Once the script has performed its validation logic it must exit with a proper status.

The following exit statuses are valid:

* `0`: Validation ok. Vote for commit.
* `1`: When the outcome of the validation is dubious, it is possible for the script to issue a warning message. The message is extracted from the script output on stdout. An interactive user can choose to abort or continue to commit the transaction. Non-interactive users automatically vote for commit.
* `2`: When the validation fails, it is possible for the script to issue an error message. The message is extracted from the script output on stdout. The transaction will be aborted.

### Full `policy` Example <a href="#d5e4724" id="d5e4724"></a>

A policy denying changes the configured `trace-dir` for a set of devices, it can use the `check_dir.sh` script.

```
#!/bin/sh

usage_and_exit() {
    cat << EOF
Usage: $0 -h
       $0 --policy
       $0 --keypath <keypath> [--value <value>]

  -h                    display this help and exit
  --policy              display policy configuration and exit
  --keypath <keypath>   path to node
  --value <value>       value of leaf

Return codes:

  0 - ok
  1 - warning message is printed on stdout
  2 - error message   is printed on stdout
EOF
    exit 1
}

while [ $# -gt 0 ]; do
    case "$1" in
        -h)
            usage_and_exit
            ;;
        --policy)
            cat << EOF
begin policy
  keypath: /devices/global-settings/trace-dir
  dependency: /devices/global-settings
  priority: 2
  call: each
end
EOF
            exit 0
            ;;
        --keypath)
            if [ $# -lt 2 ]; then
                echo "<ERROR> --keypath <keypath> - path omitted"
                usage_and_exit
            else
                keypath=$2
                shift
            fi
            ;;
        --value)
            if [ $# -lt 2 ]; then
                echo "<ERROR> --value <value> - leaf value omitted"
                usage_and_exit
            else
                value=$2
                shift
            fi
            ;;
        *)
            usage_and_exit
            ;;
    esac
    shift
done

if [ -z "${keypath}" ]; then
    echo "<ERROR> --keypath <keypath> is mandatory"
    usage_and_exit
fi

if [ -z "${value}" ]; then
    echo "<ERROR> --value <value> is mandatory"
    usage_and_exit
fi

orig="./logs"
dir=${value}
# dir=`ncs-maapi --get /devices/global-settings/trace-dir`
if [ "${dir}" != "${orig}" ] ; then
    echo "/devices/global-settings/trace-dir: must retain it original value (${orig})"
    exit 2
fi
```

Trying to change that parameter would result in an aborted transaction

```cli
admin@ncs(config)# devices global-settings trace-dir ./testing
admin@ncs(config)# commit
Aborted: /devices/global-settings/trace-dir: must retain it original
value (./logs)
```

In the complete example, [examples.ncs/sdk-api/scripting](https://github.com/NSO-developer/nso-examples/tree/6.4/sdk-api/scripting) there is a `README` file and a simple policy script `scripts/policy/check_dir.sh`.

## Post-commit Scripts <a href="#d5e4739" id="d5e4739"></a>

Post-commit scripts are run when a transaction has been committed, but before any locks have been released. The transaction hangs until the script has returned. The script cannot change the outcome of the transaction. Post-commit scripts can for example be used for logging, sending external events etc. The scripts run as the same user ID as NSO.

The script is invoked with `--post-commit` at script (re)load. In future releases, it is possible that the `post-commit` section will be used for control of the post-commit scripts behavior.

At post-commit, the script is invoked without parameters. In that context, the script may make use of the environment variables `NCS_MAAPI_USID` and `NCS_MAAPI_THANDLE` in order to attach to the active (read-only) transaction.

This makes it simple to make use of the `ncs-maapi` command. Especially the command `ncs-maapi --keypath-diff /` may turn out to be useful, as it provides a listing of all updates within the transaction on a format that is easy to parse.

### `post-commit` Section <a href="#d5e4754" id="d5e4754"></a>

All post-commit scripts must be able to handle the argument `--post-commit` and, when invoked, write an empty `post-commit` section to `stdout`:

```
begin post-commit
end
```

### Full `post-commit` Example <a href="#d5e4762" id="d5e4762"></a>

Assume the administrator of a system would want to have a mail each time a change is performed on the system, a script such as `mail_admin.sh`:

```
#!/bin/bash

set -e

if [ $# -gt 0 ]; then
    case "$1" in
        --post-commit)
            cat <<EOF
begin post-commit
end
EOF
            exit 0
            ;;
        *)
            echo
            echo "Usage: $0 [--post-commit]"
            echo
            echo "  --post-commit Mandatory for post-commit scripts"
            exit 1
            ;;
    esac
else
    file="mail_admin.log"
    NCS_DIFF=$(ncs-maapi --keypath-diff /)
    mail -s "NCS Mailer" admin@example.com <<EOF
AutoGenerated mail from NCS

$NCS_DIFF
EOF
fi
```

If the `admin` then loads this script:

```cli
admin@ncs# script reload debug
$NCS_DIR/examples.ncs/device-management/simulated-cisco-ios/scripts:
ok
    post-commit:
        mail_admin.sh: new
--- Output from
$NCS_DIR/examples.ncs/device-management/simulated-cisco-ios/scripts/post-commit/mail_admin.sh
--post-commit ---
1: begin post-commit
2: end
3:
---
admin@ncs# config
Entering configuration mode terminal
admin@ncs(config)# devices global-settings trace-dir ./again
admin@ncs(config)# commit
Commit complete.
```

This configuration change will produce an email to `admin@example.com` with subject `NCS Mailer` and body.

```
AutoGenerated mail from NCS
value set  : /devices/global-settings/trace-dir
```

In the complete example, [examples.ncs/sdk-api/scripting](https://github.com/NSO-developer/nso-examples/tree/6.4/sdk-api/scripting) , there is a `README` file and a simple post-commit script `scripts/post-commit/show_diff.sh`.
