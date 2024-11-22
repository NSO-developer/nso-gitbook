---
description: Perform NSO system management activities.
---

# System Management

NSO consists of a number of modules and executable components. These executable components will be referred to by their command-line name, e.g. `ncs`, `ncs-netsim`, `ncs_cli`, etc. `ncs` is used to refer to the executable, the running daemon.

## Starting NSO <a href="#ug.sys_mgmt.starting_ncs" id="ug.sys_mgmt.starting_ncs"></a>

When NSO is started, it reads its configuration file and starts all subsystems configured to start (such as NETCONF, CLI, etc.).

By default, NSO starts in the background without an associated terminal. It is recommended to use a [System Install](../../installation-and-deployment/system-install.md) when installing NSO for production deployment. This will create an `init` script that starts NSO when the system boots, and makes NSO start the service manager.

## Licensing NSO <a href="#ug.ncs_sys_mgmt.licensing" id="ug.ncs_sys_mgmt.licensing"></a>

NSO is licensed using Cisco Smart Licensing. To register your NSO instance, you need to enter a token from your Cisco Smart Software Manager account. For more information on this topic, see [Cisco Smart Licensing](cisco-smart-licensing.md)_._

## Configuring NSO

NSO is configured in the following two ways:

* Through its configuration file, `ncs.conf`.
* Through whatever data is configured at run-time over any northbound, for example, turning on trace using the CLI.

### `ncs.conf` File

The configuration file `ncs.conf` is read at startup and can be reloaded. Below is an example of the most common settings. It is included here as an example and should be self-explanatory. See [ncs.conf](https://developer.cisco.com/docs/nso-guides-6.2/#!ncs-man-pages-volume-5/ncs-conf) in Manual Pages for more information. Important configuration settings are:

* `load-path`: where NSO should look for compiled YANG files, such as data models for NEDs or Services.
* `db-dir`: the directory on disk that CDB uses for its storage and any temporary files being used. It is also the directory where CDB searches for initialization files. This should be a local disk and not NFS mounted for performance reasons.
* Various log settings.
* AAA configuration.
* Rollback file directory and history length.
* Enabling north-bound interfaces like REST, and WebUI.
* Enabling of High-Availability mode.

The `ncs.conf` file is described in the NSO [Manual Pages](https://developer.cisco.com/docs/nso-guides-6.2/#!ncs-man-pages-volume-5/tailf-ncs-config.yang\_config). There is a large number of configuration items in `ncs.conf`, most of them have sane default values. The `ncs.conf` file is an XML file that must adhere to the `tailf-ncs-config.yang` model. If we start the NSO daemon directly, we must provide the path to the NCS configuration file as in:

```bash
# ncs -c /etc/ncs/ncs.conf
```

However, in a System Install, the `init` script is typically used to start NSO, and it will pass the appropriate options to the `ncs` command. Thus NSO is started with the command:

```bash
# /etc/init.d/ncs start
```

It is possible to edit the `ncs.conf` file, and then tell NSO to reload the edited file without restarting the daemon as in:

```bash
# ncs --reload
```

This command also tells NSO to close and reopen all log files, which makes it suitable to use from a system like `logrotate`.

In this section, some of the important configuration settings will be described and discussed.

### Exposed Interfaces

NSO allows access through a number of different interfaces, depending on the use case. In the default configuration, clients can access the system locally through an unauthenticated IPC socket (with the `ncs*` family of commands, port 4569) and plain (non-HTTPS) HTTP web server (port 8080). Additionally, the system enables remote access through SSH-secured NETCONF and CLI (ports 2022 and 2024).

We strongly encourage you to review and customize the exposed interfaces to your needs in the `ncs.conf` configuration file. In particular, set:

* `/ncs-config/webui/match-host-name` to `true`.
* `/ncs-config/webui/server-name` to the hostname of the server.

If you decide to allow remote access to the web server, also make sure you use TLS-secured HTTPS instead of HTTP. Not doing so exposes you to security risks.

{% hint style="info" %}
Using `/ncs-config/webui/match-host-name = true` requires you to use the configured hostname when accessing the server. Web browsers do this automatically but you may need to set the `Host` header when performing requests programmatically using an IP address instead of the hostname.
{% endhint %}

To additionally secure IPC access, refer to [Restricting Access to the IPC port](../../advanced-topics/ipc-ports.md#ug.ncs\_advanced.ipc.restricting).

For more details on individual interfaces and their use, see [Northbound APIs](https://developer.cisco.com/docs/nso-guides-6.2/#!northbound-apis-introduction).

### Dynamic Configuration <a href="#d5e81" id="d5e81"></a>

Let's look at all the settings that can be manipulated through the NSO northbound interfaces. NSO itself has a number of built-in YANG modules. These YANG modules describe the structure that is stored in CDB. Whenever we change anything under, say `/devices/device`, it will change the CDB, but it will also change the configuration of NSO. We call this dynamic configuration since it can be changed at will through all northbound APIs.

We summarize the most relevant parts below:

```cli
ncs@ncs(config)#
Possible completions:
  aaa                        AAA management, users and groups
  cluster                    Cluster configuration
  devices                    Device communication settings
  java-vm                    Control of the NCS Java VM
  nacm                       Access control
  packages                   Installed packages
  python-vm                  Control of the NCS Python VM
  services                   Global settings for services, (the services themselves might be augmented somewhere else)
  session                    Global default CLI session parameters
  snmp                       Top-level container for SNMP related configuration and status objects.
  snmp-notification-receiver Configure reception of SNMP notifications
  software                   Software management
  ssh                        Global SSH connection configuration
```

#### **`tailf-ncs.yang` Module**

This is the most important YANG module that is used to control and configure NSO. The module can be found at: `$NCS_DIR/src/ncs/yang/tailf-ncs.yang` in the release. Everything in that module is available through the northbound APIs. The YANG module has descriptions for everything that can be configured.

`tailf-common-monitoring2.yang` and `tailf-ncs-monitoring2.yang` are two modules that are relevant to monitoring NSO.

### Built-in or External SSH Server <a href="#d5e95" id="d5e95"></a>

NSO has a built-in SSH server which makes it possible to SSH directly into the NSO daemon. Both the NSO northbound NETCONF agent and the CLI need SSH. To configure the built-in SSH server we need a directory with server SSH keys - it is specified via `/ncs-config/aaa/ssh-server-key-dir` in `ncs.conf`. We also need to enable `/ncs-config/netconf-north-bound/transport/ssh` and `/ncs-config/cli/ssh` in `ncs.conf`. In a System Install, `ncs.conf` is installed in the "config directory", by default `/etc/ncs`, with the SSH server keys in `/etc/ncs/ssh`.

### Run-time Configuration <a href="#ncsnwe.admin.runtime.cfg" id="ncsnwe.admin.runtime.cfg"></a>

There are also configuration parameters that are more related to how NSO behaves when talking to the devices. These reside in `devices global-settings`.

```cli
admin@ncs(config)# devices global-settings
Possible completions:
  backlog-auto-run               Auto-run the backlog at successful connection
  backlog-enabled                Backlog requests to non-responding devices
  commit-queue
  commit-retries                 Retry commits on transient errors
  connect-timeout                Timeout in seconds for new connections
  ned-settings                   Control which device capabilities NCS uses
  out-of-sync-commit-behaviour   Specifies the behaviour of a commit operation involving a device that is out of sync with NCS.
  read-timeout                   Timeout in seconds used when reading data
  report-multiple-errors         By default, when the NCS device manager commits data southbound and when there are errors, we only
                                 report the first error to the operator, this flag makes NCS report all errors reported by managed
                                 devices
  trace                          Trace the southbound communication to devices
  trace-dir                      The directory where trace files are stored
  write-timeout                  Timeout in seconds used when writing
  data
```

## User Management

Users are configured at the path `aaa authentication users`.

```cli
admin@ncs(config)# show full-configuration aaa authentication users user
aaa authentication users user admin
 uid        1000
 gid        1000
 password   $1$GNwimSPV$E82za8AaDxukAi8Ya8eSR.
 ssh_keydir /var/ncs/homes/admin/.ssh
 homedir    /var/ncs/homes/admin
!
aaa authentication users user oper
 uid        1000
 gid        1000
 password   $1$yOstEhXy$nYKOQgslCPyv9metoQALA.
 ssh_keydir /var/ncs/homes/oper/.ssh
 homedir    /var/ncs/homes/oper
!...
```

Access control, including group memberships, is managed using the NACM model (RFC 6536).

```cli
admin@ncs(config)# show full-configuration nacm
nacm write-default permit
nacm groups group admin
 user-name [ admin private ]
!
nacm groups group oper
 user-name [ oper public ]
!
nacm rule-list admin
 group [ admin ]
 rule any-access
  action permit
 !
!
nacm rule-list any-group
 group [ * ]
 rule tailf-aaa-authentication
  module-name       tailf-aaa
  path              /aaa/authentication/users/user[name='$USER']
  access-operations read,update
  action            permit
 !
```

### Adding a User

Adding a user includes the following steps:

1. Create the user: `admin@ncs(config)# aaa authentication users user <user-name>`.
2. Add the user to a NACM group: `admin@ncs(config)# nacm groups <group-name> admin user-name <user-name>`.
3. Verify/change access rules.

It is likely that the new user also needs access to work with device configuration. The mapping from NSO users and corresponding device authentication is configured in `authgroups`. So, the user needs to be added there as well.

```cli
admin@ncs(config)# show full-configuration devices authgroups
devices authgroups group default
 umap admin
  remote-name     admin
  remote-password $4$wIo7Yd068FRwhYYI0d4IDw==
 !
 umap oper
  remote-name     oper
  remote-password $4$zp4zerM68FRwhYYI0d4IDw==
 !
!
```

If the last step is forgotten, you will see the following error:

```cli
jim@ncs(config)# devices device c0 config ios:snmp-server community fee
jim@ncs(config-config)# commit
Aborted: Resource authgroup for jim doesn't exist
```

## Monitoring NSO <a href="#d5e7876" id="d5e7876"></a>

This section describes how to monitor NSO. See also [NSO Alarms](./#nso-alarms).

Use the command `ncs --status` to get runtime information on NSO.

### NSO Status <a href="#d5e119" id="d5e119"></a>

Checking the overall status of NSO can be done using the shell:

```bash
$ ncs --status
```

Or, in the CLI:

```cli
ncs# show ncs-state
```

For details on the output see `$NCS_DIR/src/yang/tailf-common-monitoring2.yang`.

Below is an overview of the output:

<table data-header-hidden data-full-width="true"><thead><tr><th width="246"></th><th></th></tr></thead><tbody><tr><td><code>daemon-status</code></td><td>You can see the NSO daemon mode, starting, phase0, phase1, started, stopping. The phase0 and phase1 modes are schema upgrade modes and will appear if you have upgraded any data models.</td></tr><tr><td><code>version</code></td><td>The NSO version.</td></tr><tr><td><code>smp</code></td><td>Number of threads used by the daemon.</td></tr><tr><td><code>ha</code></td><td>The High-Availability mode of the NCS daemon will show up here: <code>secondary</code>, <code>primary</code>, <code>relay-secondary</code>.</td></tr><tr><td><code>internal/callpoints</code></td><td><p>The next section is callpoints. Make sure that any validation points, etc. are registered. (The <code>ncs-rfs-service-hook</code> is an obsolete callpoint, ignore this one).</p><ul><li><code>UNKNOWN</code> code tries to register a call-point that does not exist in a data model.</li><li><code>NOT-REGISTERED</code> a loaded data model has a call-point but no code has registered.</li></ul><p>Of special interest is of course the <code>servicepoints</code>. All your deployed service models should have a corresponding <code>service-point</code>. For example:</p><pre data-overflow="wrap"><code>servicepoints:
  id=l3vpn-servicepoint daemonId=10 daemonName=ncs-dp-6-l3vpn:L3VPN
  id=nsr-servicepoint daemonId=11 daemonName=ncs-dp-7-nsd:NSRService
  id=vm-esc-servicepoint daemonId=12 daemonName=ncs-dp-8-vm-manager-esc:ServiceforVMstarting
  id=vnf-catalogue-esc daemonId=13 daemonName=ncs-dp-9-vnf-catalogue-esc:ESCVNFCatalogueService
</code></pre></td></tr><tr><td><code>internal/cdb</code></td><td>The <code>cdb</code> section is important. Look for any locks. This might be a sign that a developer has taken a CDB lock without releasing it. The subscriber section is also important. A design pattern is to register subscribers to wait for something to change in NSO and then trigger an action. Reactive FASTMAP is designed around that. Validate that all expected subscribers are OK.</td></tr><tr><td><code>loaded-data-models</code></td><td>The next section shows all namespaces and YANG modules that are loaded. If you, for example, are missing a service model, make sure it is loaded.</td></tr><tr><td><code>cli</code><em>,</em> <code>netconf</code><em>,</em> <code>rest</code><em>,</em> <code>snmp</code><em>,</em> <code>webui</code></td><td>All northbound agents like CLI, REST, NETCONF, SNMP, etc. are listed with their IP and port. So if you want to connect over REST, for example, you can see the port number here.</td></tr><tr><td><code>patches</code></td><td>Lists any installed patches.</td></tr><tr><td><code>upgrade-mode</code></td><td>If the node is in upgrade mode, it is not possible to get any information from the system over NETCONF. Existing CLI sessions can get system information.</td></tr></tbody></table>

It is also important to look at the packages that are loaded. This can be done in the CLI with:

```
admin> show packages
packages package cisco-asa
 package-version 3.4.0
 description     "NED package for Cisco ASA"
 ncs-min-version [ 3.2.2 3.3 3.4 4.0 ]
 directory       ./state/packages-in-use/1/cisco-asa
 component upgrade-ned-id
  upgrade java-class-name com.tailf.packages.ned.asa.UpgradeNedId
 component ASADp
  callback java-class-name [ com.tailf.packages.ned.asa.ASADp ]
 component cisco-asa
  ned cli ned-id  cisco-asa
  ned cli java-class-name com.tailf.packages.ned.asa.ASANedCli
  ned device vendor Cisco
```

### Monitoring the NSO Daemon <a href="#d5e174" id="d5e174"></a>

NSO runs the following processes:

* **The daemon**: `ncs.smp`: this is the NCS process running in the Erlang VM.
* **Java VM**: `com.tailf.ncs.NcsJVMLauncher`: service applications implemented in Java run in this VM. There are several options on how to start the Java VM, it can be monitored and started/restarted by NSO or by an external monitor. See the [ncs.conf(5)](https://developer.cisco.com/docs/nso-guides-6.2/#!ncs-man-pages-volume-5/ncs-conf) Manual Page and the `java-vm` settings in the CLI.
* **Python VMs**: NSO packages can be implemented in Python. The individual packages can be configured to run a VM each or share a Python VM. Use the `show python-vm status current` to see current threads and `show python-vm status start` to see which threads were started at startup time.

### Logging <a href="#ug.ncs_sys_mgmt.logging" id="ug.ncs_sys_mgmt.logging"></a>

NSO has extensive logging functionality. Log settings are typically very different for a production system compared to a development system. Furthermore, the logging of the NSO daemon and the NSO Java VM/Python VM is controlled by different mechanisms. During development, we typically want to turn on the `developer-log`. The sample `ncs.conf` that comes with the NSO release has log settings suitable for development, while the `ncs.conf` created by a System Install are suitable for production deployment.

NSO logs in `/logs` in your running directory, (depends on your settings in `ncs.conf`). You might want the log files to be stored somewhere else. See man `ncs.conf` for details on how to configure the various logs. Below is a list of the most useful log files:

* `ncs.log` : NCS daemon log. See [Log Messages and Formats](./#ug.ncs\_monitoring.messages). Can be configured to Syslog.
* `ncserr.log.1`_,_ `ncserr.log.idx`_,_ `ncserr.log.siz`: if the NSO daemon has a problem. this contains debug information relevant to support. The content can be displayed with `ncs --printlog ncserr.log`.
* `audit.log`: central audit log covering all northbound interfaces. See [Log Messages and Formats](./#ug.ncs\_monitoring.messages). Can be configured to Syslog.
* `localhost:8080.access`: all HTTP requests to the daemon. This is an access log for the embedded Web server. This file adheres to the Common Log Format, as defined by Apache and others. This log is not enabled by default and is not rotated, i.e. use logrotate(8). Can be configured to Syslog.
*   `devel.log`: developer-log is a debug log for troubleshooting user-written code. This log is enabled by default and is not rotated, i.e. use logrotate(8). This log shall be used in combination with the `java-vm` or `python-vm` logs. The user code logs in the VM logs and the corresponding library logs in `devel.log`. Disable this log in production systems. Can be configured to Syslog.\
    \
    You can manage this log and set its logging level in `ncs.conf`.

    ```xml
        <developer-log>
          <enabled>true</enabled>
          <file>
            <name>${NCS_LOG_DIR}/devel.log</name>
            <enabled>false</enabled>
          </file>
          <syslog>
            <enabled>true</enabled>
          </syslog>
        </developer-log>
        <developer-log-level>trace</developer-log-level>
    ```
*   `ncs-java-vm`_._`log`_,_ `ncs-python-vm.log`: logger for code running in Java or Python VM, for example, service applications. Developers writing Java and Python code use this log (in combination with devel.log) for debugging. Both Java and Python log levels can be set from their respective VM settings in, for example, the CLI.

    ```cli
    admin@ncs(config)# python-vm logging level level-info
    admin@ncs(config)# java-vm java-logging logger com.tailf.maapi level level-info
    ```
* `netconf.log`_,_ `snmp.log`: Log for northbound agents. Can be configured to Syslog.
* `rollbackNNNNN`: All NSO commits generate a corresponding rollback file. The maximum number of rollback files and file numbering can be configured in `ncs.conf`.
*   `xpath.trace`: XPATH is used in many places, for example, XML templates. This log file shows the evaluation of all XPATH expressions and can be enabled in the `ncs.conf`.

    ```xml
        <xpathTraceLog>
          <enabled>true</enabled>
          <filename>${NCS_LOG_DIR}/xpath.trace</filename>
        </xpathTraceLog>
    ```

    To debug XPATH for a template, use the pipe target `debug` in the CLI instead.

    ```cli
    admin@ncs(config)# commit | debug template
    ```
*   `ned-cisco-ios-xr-pe1.trace` (for example): if device trace is turned on a trace file will be created per device. The file location is not configured in `ncs.conf` but is configured when the device trace is turned on, for example in the CLI.

    ```cli
    admin@ncs(config)# devices device r0 trace pretty
    ```
* Progress trace log: When a transaction or action is applied, NSO emits specific progress events. These events can be displayed and recorded in a number of different ways, either in CLI with the pipe target `details` on a commit, or by writing it to a log file. You can read more about it in the [Progress Trace](../../../development/advanced-development/progress-trace.md).
* Transaction error log: log for collecting information on failed transactions that lead to either a CDB boot error or a runtime transaction failure. The default is `false` (disabled). More information about the log is available in the [Manual Pages](https://developer.cisco.com/docs/nso-guides-6.2/ncs-man-pages-volume-5/#tailf-ncs-config.yang\_config) under Configuration Parameters (see `logs/transaction-error-log`).
* Upgrade log: log containing information about CDB upgrade. The log is enabled by default and not rotated (i.e., use logrotate). With the NSO example set, the following examples populate the log in the `logs/upgrade.log` file: `examples.ncs/development-guide/ned-upgrade/yang-revision`, `examples.ncs/development-guide/high-availability/upgrade-basic`, `examples.ncs/development-guide/high-availability/upgrade-cluster`, and `examples.ncs/getting-started/developing-with-ncs/14-upgrade-service`. More information about the log is available in the [Manual Pages](https://developer.cisco.com/docs/nso-guides-6.2/ncs-man-pages-volume-5/#tailf-ncs-config.yang\_config) under Configuration Parameters (see `logs/upgrade-log)`.

### Syslog <a href="#d5e259" id="d5e259"></a>

NSO can syslog to a local Syslog. See `man ncs.conf` how to configure the Syslog settings. All Syslog messages are documented in Log Messages. The `ncs.conf` also lets you decide which of the logs should go into Syslog: `ncs.log, devel.log, netconf.log, snmp.log, audit.log, WebUI access log`. There is also a possibility to integrate with `rsyslog` to log the NCS, developer, audit, netconf, SNMP, and WebUI access logs to syslog with the facility set to daemon in `ncs.conf`. For reference, see the upgrade-l2 example, located in `examples.ncs/development-guide/high-availability/hcc` .

Below is an example of Syslog configuration:

```xml
    <syslog-config>
      <facility>daemon</facility>
    </syslog-config>

    <ncs-log>
      <enabled>true</enabled>
      <file>
        <name>./logs/ncs.log</name>
        <enabled>true</enabled>
      </file>
      <syslog>
        <enabled>true</enabled>
      </syslog>
    </ncs-log>
```

Log messages are described on the link below:

{% content-ref url="log-messages-and-formats.md" %}
[log-messages-and-formats.md](log-messages-and-formats.md)
{% endcontent-ref %}

### NSO Alarms <a href="#nso-alarms" id="nso-alarms"></a>

NSO generates alarms for serious problems that must be remedied. Alarms are available over all the northbound interfaces and exist at the path `/alarms`. NSO alarms are managed as any other alarms by the general NSO Alarm Manager, see the specific section on the alarm manager in order to understand the general alarm mechanisms.

The NSO alarm manager also presents a northbound SNMP view, alarms can be retrieved as an alarm table, and alarm state changes are reported as SNMP Notifications. See the "NSO Northbound" documentation on how to configure the SNMP Agent.

This is also documented in the example `/examples.ncs/getting-started/using-ncs/5-snmp-alarm-northbound`.

Alarms are described on the link below:

{% content-ref url="alarms.md" %}
[alarms.md](alarms.md)
{% endcontent-ref %}

### Trace ID <a href="#d5e2587" id="d5e2587"></a>

NSO can issue a unique Trace ID per northbound request, visible in logs and trace headers. This Trace ID can be used to follow the request from service invocation to configuration changes pushed to any device affected by the change. The Trace ID may either be passed in from an external client or generated by NSO.

Trace ID is enabled by default, and can be turned off by adding the following snippet to NSO.conf:

```xml
<trace-id>false</trace-id>
```

Trace ID is propagated downwards in LSA setups and is fully integrated with commit queues.

Trace ID can be passed to NSO over NETCONF, RESTCONF, JSON-RPC, or CLI as a commit parameter.

If Trace ID is not given as a commit parameter, NSO will generate one if the feature is enabled. This generated Trace ID will be on the form UUID version 4.

For RESTCONF requests, this generated Trace ID will be communicated back to the requesting client as an HTTP header called `X-Cisco-NSO-Trace-ID`. The `trace-id` query parameter can also be used with RPCs and actions to relay a trace-id from northbound requests.

For NETCONF, the Trace ID will be returned as an attribute called `trace-id`.

Trace ID will appear in relevant log entries and trace file headers on the form `trace-id=...`.

## Disaster Management <a href="#ug.ncs_sys_mgmt.disaster" id="ug.ncs_sys_mgmt.disaster"></a>

This section describes a number of disaster scenarios and recommends various actions to take in the different disaster variants.

### NSO Fails to Start <a href="#d5e2642" id="d5e2642"></a>

CDB keeps its data in four files `A.cdb`, `C.cdb`, `O.cdb` and `S.cdb`. If NSO is stopped, these four files can be copied, and the copy is then a full backup of CDB.

Furthermore, if neither files exist in the configured CDB directory, CDB will attempt to initialize from all files in the CDB directory with the suffix `.xml`.

Thus, there exist two different ways to re-initiate CDB from a previously known good state, either from `.xml` files or from a CDB backup. The `.xml` files would typically be used to reinstall factory defaults whereas a CDB backup could be used in more complex scenarios.

If the `S.cdb` file has become inconsistent or has been removed, all commit queue items will be removed, and devices not yet processed out of sync. For such an event, appropriate alarms will be raised on the devices and any service instance that has unprocessed device changes will be set in the failed state.

When NSO starts and fails to initialize, the following exit codes can occur:

* Exit codes 1 and 19 mean that an internal error has occurred. A text message should be in the logs, or if the error occurred at startup before logging had been activated, on standard error (standard output if NSO was started with `--foreground --verbose`). Generally, the message will only be meaningful to the NSO developers, and an internal error should always be reported to support.
* Exit codes 2 and 3 are only used for the NCS control commands (see the section COMMUNICATING WITH NCS in the [ncs(1)](https://developer.cisco.com/docs/nso-guides-6.2/#!ncs-man-pages-volume-1/man.1.ncs) in Manual Pages manual page) and mean that the command failed due to timeout. Code 2 is used when the initial connect to NSO didn't succeed within 5 seconds (or the `TryTime` if given), while code 3 means that the NSO daemon did not complete the command within the time given by the `--timeout` option.
* Exit code 10 means that one of the init files in the CDB directory was faulty in some way — further information in the log.
* Exit code 11 means that the CDB configuration was changed in an unsupported way. This will only happen when an existing database is detected, which was created with another configuration than the current in `ncs.conf`.
* Exit code 13 means that the schema change caused an upgrade, but for some reason, the upgrade failed. Details are in the log. The way to recover from this situation is either to correct the problem or to re-install the old schema (`fxs`) files.
* Exit code 14 means that the schema change caused an upgrade, but for some reason the upgrade failed, corrupting the database in the process. This is rare and usually caused by a bug. To recover, either start from an empty database with the new schema, or re-install the old schema files and apply a backup.
* Exit code 15 means that `A.cdb` or `C.cdb` is corrupt in a non-recoverable way. Remove the files and re-start using a backup or init files.
* Exit code 16 means that CDB ran into an unrecoverable file error (such as running out of space on the device while performing journal compaction).
* Exit code 20 means that NSO failed to bind a socket.
* Exit code 21 means that some NSO configuration file is faulty. More information is in the logs.
* Exit code 22 indicates an NSO installation-related problem, e.g., that the user does not have read access to some library files, or that some file is missing.

If the NSO daemon starts normally, the exit code is 0.

If the AAA database is broken, NSO will start but with no authorization rules loaded. This means that all write access to the configuration is denied. The NSO CLI can be started with a flag `ncs_cli --noaaa` that will allow full unauthorized access to the configuration.

### NSO Failure After Startup <a href="#d5e2702" id="d5e2702"></a>

NSO attempts to handle all runtime problems without terminating, e.g., by restarting specific components. However, there are some cases where this is not possible, described below. When NSO is started the default way, i.e. as a daemon, the exit codes will of course not be available, but see the `--foreground` option in the [ncs(1)](https://developer.cisco.com/docs/nso-guides-6.2/#!ncs-man-pages-volume-1/man.1.ncs) Manual Page.

* **Out of memory**: If NSO is unable to allocate memory, it will exit by calling abort(3). This will generate an exit code, as for reception of the SIGABRT signal - e.g. if NSO is started from a shell script, it will see 134, as the exit code (128 + the signal number).
*   **Out of file descriptors for accept(2)**: If NSO fails to accept a TCP connection due to lack of file descriptors, it will log this and then exit with code 25. To avoid this problem, make sure that the process and system-wide file descriptor limits are set high enough, and if needed configure session limits in `ncs.conf`. The out-of-file descriptors issue may also manifest itself in that applications are no longer able to open new file descriptors.\
    \
    In many Linux systems, the default limit is 1024, but if we, for example, assume that there are four northbound interface ports, CLI, RESTCONF, SNMP, WebUI/JSON-RPC, or similar, plus a few hundred IPC ports, x 1024 == 5120. But one might as well use the next power of two, 8192, to be on the safe side.

    \
    Several application issues can contribute to consuming extra ports. In the scope of an NSO application that could, for example, be a script application that invokes CLI command or a callback daemon application that does not close the connection socket as it should.

    A commonly used command for changing the maximum number of open file descriptors is `ulimit -n [limit]`. Commands such as `netstat` and `lsof` can be useful to debug file descriptor-related issues.

### Transaction Commit Failure <a href="#d5e2722" id="d5e2722"></a>

When the system is updated, NSO executes a two-phase commit protocol towards the different participating databases including CDB. If a participant fails in the `commit()` phase although the participant succeeded in the preparation phase, the configuration is possibly in an inconsistent state.

When NSO considers the configuration to be in an inconsistent state, operations will continue. It is still possible to use NETCONF, the CLI, and all other northbound management agents. The CLI has a different prompt which reflects that the system is considered to be in an inconsistent state and also the Web UI shows this:

```
  -- WARNING ------------------------------------------------------
  Running db may be inconsistent. Enter private configuration mode and
  install a rollback configuration or load a saved configuration.
  ------------------------------------------------------------------
```

The MAAPI API has two interface functions that can be used to set and retrieve the consistency status, those are `maapi_set_running_db_status()` and `maapi_get_running_db_status()` corresponding. This API can thus be used to manually reset the consistency state. The only alternative to reset the state to a consistent state is by reloading the entire configuration.

## Backup and Restore

All parts of the NSO installation can be backed up and restored with standard file system backup procedures.

The most convenient way to do backup and restore is to use the `ncs-backup` command. In that case, the following procedure is used.

### Take a Backup <a href="#d5e7884" id="d5e7884"></a>

NSO Backup backs up the database (CDB) files, state files, config files, and rollback files from the installation directory. To take a complete backup (for disaster recovery), use:

```bash
# ncs-backup
```

The backup will be stored in the "run directory", by default `/var/opt/ncs`, as `/var/opt/ncs/backups/ncs-VERSION@DATETIME.backup`.

For more information on backup, refer to the [ncs-backup(1)](https://developer.cisco.com/docs/nso-guides-6.2/#!ncs-man-pages-volume-1/man.1.ncs-backup) in Manual Pages.

### Restore a Backup <a href="#d5e7896" id="d5e7896"></a>

NSO Restore is performed if you would like to switch back to a previous good state or restore a backup.

It is always advisable to stop NSO before performing a restore.

1.  First stop NSO if NSO is not stopped yet.

    ```
    /etc/init.d/ncs stop
    ```
2.  Restore the backup.

    ```bash
    ncs-backup --restore
    ```

    \
    Select the backup to be restored from the available list of backups. The configuration and database with run-time state files are restored in `/etc/ncs` and `/var/opt/ncs`.
3.  Start NSO.

    ```
    /etc/init.d/ncs start
    ```

## Rollbacks <a href="#ug.sys_mgmt.tshoot" id="ug.sys_mgmt.tshoot"></a>

NSO supports creating rollback files during the commit of a transaction that allows for rolling back the introduced changes. Rollbacks do not come without a cost and should be disabled if the functionality is not going to be used. Enabling rollbacks impacts both the time it takes to commit a change and requires sufficient storage on disk.

Rollback files contain a set of headers and the data required to restore the changes that were made when the rollback was created. One of the header fields includes a unique rollback ID that can be used to address the rollback file independent of the rollback numbering format.

The use of rollbacks from the supported APIs and the CLI is documented in the documentation for the given API.

### `ncs.conf` Config for Rollback <a href="#d5e5666" id="d5e5666"></a>

As described [earlier](./#configuring-nso), NSO is configured through the configuration file, `ncs.conf`. In that file, we have the following items related to rollbacks:

* `/ncs-config/rollback/enabled`: If set to `true`, then a rollback file will be created whenever the running configuration is modified.
* `/ncs-config/rollback/directory`: Location where rollback files will be created.
* `/ncs-config/rollback/history-size`: The number of old rollback files to save.

## Troubleshooting <a href="#ug.sys_mgmt.tshoot" id="ug.sys_mgmt.tshoot"></a>

New users can face problems when they start to use NSO. If you face an issue, reach out to our support team regardless if your problem is listed here or not.

{% hint style="success" %}
A useful tool in this regard is the `ncs-collect-tech-report` tool, which is the Bash script that comes with the product. It collects all log files, CDB backup, and several debug dumps as a TAR file. Note that it works only with a System Install.

```bash
root@linux:/# ncs-collect-tech-report --full 
```
{% endhint %}

Some noteworthy issues are covered here.

<details>

<summary>Installation Problems: Error Messages During Installation</summary>

*   **Error**

    ```
    tar: Skipping to next header
    gzip: stdin: invalid compressed data--format violated
    ```

<!---->

* **Impact**\
  The resulting installation is incomplete.

<!---->

* **Cause**\
  This happens if the installation program has been damaged, most likely because it has been downloaded in ASCII mode.

<!---->

* **Resolution**\
  Remove the installation directory. Download a new copy of NSO from our servers. Make sure you use binary transfer mode every step of the way.

</details>

<details>

<summary>Problem Starting NSO: NSO Terminating with GLIBC Error</summary>

*   **Error**

    ```
    Internal error: Open failed: /lib/tls/libc.so.6: version
    `GLIBC_2.3.4' not found (required by
    .../lib/ncs/priv/util/syst_drv.so)
    ```

<!---->

* **Impact**\
  NSO terminates immediately with a message similar to the one above.

<!---->

* **Cause**\
  This happens if you are running on a very old Linux version. The GNU libc (GLIBC) version is older than 2.3.4, which was released in 2004.

<!---->

* **Resolution**\
  Use a newer Linux system, or upgrade the GLIBC installation.

</details>

<details>

<summary>Problem in Running Examples: The <code>netconf-console</code> Program Fails</summary>

* **Error**\
  You must install the Python SSH implementation Paramiko in order to use SSH.

<!---->

* **Impact**\
  Sending NETCONF commands and queries with `netconf-console` fails, while it works using `netconf-console-tcp`.

<!---->

* **Cause**\
  The `netconf-console` command is implemented using the Python programming language. It depends on the Python SSHv2 implementation Paramiko. Since you are seeing this message, your operating system doesn't have the Python module Paramiko installed.

<!---->

*   **Resolution**\
    Install Paramiko using the instructions from [https://www.paramiko.org](https://www.paramiko.org/).\
    \
    When properly installed, you will be able to import the Paramiko module without error messages.

    ```bash
    $ python
    ...
    >>> import paramiko
    >>>
    ```

    \
    Exit the Python interpreter with Ctrl+D.

<!---->

* **Workaround**\
  A workaround is to use `netconf-console-tcp`. It uses TCP instead of SSH and doesn't require Paramiko. Note that TCP traffic is not encrypted.

</details>

<details>

<summary>Problems Using and Developing Services</summary>

If you encounter issues while loading service packages, creating service instances, or developing service models, templates, and code, you can consult the [Troubleshooting](../../../development/core-concepts/implementing-services.md#ncs.development.services.tshoot) section in [Implementing Services](../../../development/core-concepts/implementing-services.md).

</details>

### General Troubleshooting Strategies <a href="#d5e2778" id="d5e2778"></a>

If you have trouble starting or running NSO, examples, or the clients you write, here are some troubleshooting tips.

<details>

<summary>Transcript</summary>

When contacting support, it often helps the support engineer to understand what you are trying to achieve if you copy-paste the commands, responses, and shell scripts that you used to trigger the problem, together with any CLI outputs and logs produced by NSO.

</details>

<details>

<summary>Source ENV Variables</summary>

If you have problems executing `ncs` commands, make sure you source the `ncsrc` script in your NSO directory (your path may be different than the one in the example if you are using a local install), which sets the required environmental variables.

```bash
$ source /etc/profile.d/ncs.sh
```

</details>

<details>

<summary>Log Files</summary>

To find out what NSO is/was doing, browsing NSO log files is often helpful. In the examples, they are called `devel.log`, `ncs.log`, `audit.log`. If you are working with your own system, make sure that the log files are enabled in `ncs.conf`. They are already enabled in all the examples. You can read more about how to enable and inspect various logs in the [Logging](./#ug.ncs\_sys\_mgmt.logging) section.

</details>

<details>

<summary>Verify HW Resources</summary>

Both high CPU utilization and a lack of memory can negatively affect the performance of NSO. You can use commands such as `top` to examine resource utilization, and `free -mh` to see the amount of free and consumed memory. A common symptom of a lack of memory is NSO or Java-VM restarting. A sufficient amount of disk space is also required for CDB persistence and logs, so you can also check disk space with `df -h` command. In case there is enough space on the disk and you still encounter ENOSPC errors, check the inode usage with `df -i` command.

</details>

<details>

<summary>Status</summary>

NSO will give you a comprehensive status of daemon status, YANG modules, loaded packages, MIBs, active user sessions, CDB locks, and more if you run:

```bash
$ ncs --status
```

NSO status information is also available as operational data under `/ncs-state`.

</details>

<details>

<summary>Check Data Provider</summary>

If you are implementing a data provider (for operational or configuration data), you can verify that it works for all possible data items using:

```bash
$ ncs --check-callbacks
```

</details>

<details>

<summary>Debug Dump</summary>

If you suspect you have experienced a bug in NSO, or NSO told you so, you can give Support a debug dump to help us diagnose the problem. It contains a lot of status information (including a full `ncs --status report`) and some internal state information. This information is only readable and comprehensible to the NSO development team, so send the dump to your support contact. A debug dump is created using:

```bash
$ ncs --debug-dump mydump1
```

Just as in CSI on TV, the information must be collected as soon as possible after the event. Many interesting traces will wash away with time, or stay undetected if there are lots of irrelevant facts in the dump.

If NSO gets stuck while terminating, it can optionally create a debug dump after being stuck for 60 seconds. To enable this mechanism, set the environment variable `$NCS_DEBUG_DUMP_NAME` to a filename of your choice.

</details>

<details>

<summary>Error Log</summary>

Another thing you can do in case you suspect that you have experienced a bug in NSO is to collect the error log. The logged information is only readable and comprehensible to the NSO development team, so send the log to your support contact. The log actually consists of a number of files called `ncserr.log.*` - make sure to provide them all.

</details>

<details>

<summary>System Dump</summary>

If NSO aborts due to failure to allocate memory (see [Disaster Management](./#ug.ncs\_sys\_mgmt.disaster)), and you believe that this is due to a memory leak in NSO, creating one or more debug dumps as described above (before NSO aborts) will produce the most useful information for Support. If this is not possible, NSO will produce a system dump by default before aborting, unless `DISABLE_NCS_DUMP` is set.

The default system dump file name is `ncs_crash.dump` and it could be changed by setting the environment variable `$NCS_DUMP` before starting NSO. The dumped information is only comprehensible to the NSO development team, so send the dump to your support contact.

</details>

<details>

<summary>System Call Trace</summary>

To catch certain types of problems, especially relating to system start and configuration, the operating system's system call trace can be invaluable. This tool is called `strace`/`ktrace`/`truss`. Please send the result to your support contact for a diagnosis.

By running the instructions below.

Linux:

```bash
# strace -f -o mylog1.strace -s 1024 ncs ...
```

BSD:

```bash
# ktrace -ad -f mylog1.ktrace ncs ...
# kdump -f mylog1.ktrace > mylog1.kdump
```

Solaris:

```bash
# truss -f -o mylog1.truss ncs ...
```

</details>
