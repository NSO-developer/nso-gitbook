---
description: Set up and configure NSO.
---

# Configuring NSO

NSO is configured in the following two ways:

* Through its configuration file, `ncs.conf`.
* Through whatever data is configured at run-time over any northbound, for example, turning on trace using the CLI.

## `ncs.conf` File

The configuration file `ncs.conf` is read at startup and can be reloaded. Below is an example of the most common settings. It is included here as an example and should be self-explanatory. See [ncs.conf](https://developer.cisco.com/docs/nso-guides-6.1/#!ncs-man-pages-volume-5/ncs-conf) in Manual Pages for more information. Important configuration settings are:

* `load-path`: where NSO should look for compiled YANG files, such as data models for NEDs or Services.
* `db-dir`: the directory on disk that CDB uses for its storage and any temporary files being used. It is also the directory where CDB searches for initialization files. This should be a local disk and not NFS mounted for performance reasons.
* Various log settings.
* AAA configuration.
* Rollback file directory and history length.
* Enabling north-bound interfaces like REST, and WebUI.
* Enabling of High-Availability mode.

The `ncs.conf` file is described in the NSO [Manual Pages](https://developer.cisco.com/docs/nso-guides-6.1/#!ncs-man-pages-volume-5/tailf-ncs-config.yang\_config). There is a large number of configuration items in `ncs.conf`, most of them have sane default values. The `ncs.conf` file is an XML file that must adhere to the `tailf-ncs-config.yang` model. If we start the NSO daemon directly, we must provide the path to the NCS configuration file as in:

```
# ncs -c /etc/ncs/ncs.conf
```

However, in a System Install, the `init` script must be used to start NSO, and it will pass the appropriate options to the `ncs` command. Thus NSO is started with the command:

```
# /etc/init.d/ncs start
```

It is possible to edit the `ncs.conf` file, and then tell NSO to reload the edited file without restarting the daemon as in:

```
# ncs --reload
```

This command also tells NSO to close and reopen all log files, which makes it suitable to use from a system like `logrotate`.

In this section, some of the important configuration settings will be described and discussed.

## Exposed Interfaces

NSO allows access through a number of different interfaces, depending on the use case. In the default configuration, clients can access the system locally through an unauthenticated IPC socket (with the `ncs*` family of commands, port 4569) and plain (non-HTTPS) HTTP web server (port 8080). Additionally, the system enables remote access through SSH-secured NETCONF and CLI (ports 2022 and 2024).

We strongly encourage you to review and customize the exposed interfaces to your needs in the `ncs.conf` configuration file. In particular, set:

* `/ncs-config/webui/match-host-name` to `true`.
* `/ncs-config/webui/server-name` to the hostname of the server.

If you decide to allow remote access to the web server, also make sure you use TLS-secured HTTPS instead of HTTP. Not doing so exposes you to security risks.

{% hint style="info" %}
Using `/ncs-config/webui/match-host-name = true` requires you to use the configured hostname when accessing the server. Web browsers do this automatically but you may need to set the `Host` header when performing requests programmatically using an IP address instead of the hostname.
{% endhint %}

To additionally secure IPC access, refer to [Restricting Access to the IPC port](../advanced-topics/ipc-ports.md#ug.ncs\_advanced.ipc.restricting).

For more details on individual interfaces and their use, see [Northbound APIs](https://developer.cisco.com/docs/nso-guides-6.1/#!northbound-apis-introduction).

## Dynamic Configuration <a href="#d5e81" id="d5e81"></a>

Let's look at all the settings that can be manipulated through the NSO northbound interfaces. NSO itself has a number of built-in YANG modules. These YANG modules describe the structure that is stored in CDB. Whenever we change anything under, say `/devices/device`, it will change the CDB, but it will also change the configuration of NSO. We call this dynamic configuration since it can be changed at will through all northbound APIs.

We summarize the most relevant parts below:

```
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

### **`tailf-ncs.yang` Module**

This is the most important YANG module that is used to control and configure NSO. The module can be found at: `$NCS_DIR/src/ncs/yang/tailf-ncs.yang` in the release. Everything in that module is available through the northbound APIs. The YANG module has descriptions for everything that can be configured.

`tailf-common-monitoring2.yang` and `tailf-ncs-monitoring2.yang` are two modules that are relevant to monitoring NSO.

## Built-in or External SSH Server <a href="#d5e95" id="d5e95"></a>

NSO has a built-in SSH server which makes it possible to SSH directly into the NSO daemon. Both the NSO northbound NETCONF agent and the CLI need SSH. To configure the built-in SSH server we need a directory with server SSH keys - it is specified via `/ncs-config/aaa/ssh-server-key-dir` in `ncs.conf`. We also need to enable `/ncs-config/netconf-north-bound/transport/ssh` and `/ncs-config/cli/ssh` in `ncs.conf`. In a System Install, `ncs.conf` is installed in the "config directory", by default `/etc/ncs`, with the SSH server keys in `/etc/ncs/ssh`.

## Run-time Configuration <a href="#ncsnwe.admin.runtime.cfg" id="ncsnwe.admin.runtime.cfg"></a>

There are also configuration parameters that are more related to how NSO behaves when talking to the devices. These reside in `devices global-settings`.

```
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
