---
description: Send the log data to an external command.
---

# External Logging

As a development feature, NSO supports sending log data as-is to an external command for reading on standard input. As this is a development feature, there are a few limitations, such as the data sent to the external command is not guaranteed to be processed before the external application is shut down.

## Enabling External Log Processing <a href="#d5e10563" id="d5e10563"></a>

The general configuration of the external log processing is done in `ncs.conf`. Global and per-device settings controlling the external log processing for NED trace logs are stored in the CDB.

To enable external log processing, set `/ncs-config/logs/external` to `true` and `/ncs-config/logs/command` to the full path of the command that will receive the log data. The same executable will be used for all log types.

External configuration example:

```xml
<external>
  <enabled>true</enabled>
  <command>./path/to/log_filter</command>
</external>
```

To support the debugging of the external log command behavior, a separate log file is used. This debugging log is configured under `/ncs-config/logs/ext-log`. The example below shows the configuration for `./logs/external.log` with the highest log level set:

```xml
<ext-log>
  <enabled>true</enabled>
  <filename>./logs/external.log</filename>
  <level>7</level>
</ext-log>
```

By default, NED trace output is written to the file, preserving backward compatibility. To write NED trace logs to a file for all but the device `test`, which will use external log processing, the following configuration can be entered in the CLI:

```bash
# devices global-settings trace-output file
# devices device example trace-output external
```

When setting both `external` and `file` bits without setting `/ncs-config/logs/external` to `true`, a warning message will be logged to `ext-log`. When only setting the `external` bit, no logging will be done.

## Processing Logs using an External Command <a href="#d5e10588" id="d5e10588"></a>

After enabling external log processing, NSO will start one instance of the external command for each configured log destination. Processing of the log data is done by reading from standard input and processing it as required.

The command-line arguments provide information about the log that is being processed and in what format the data is sent.

The example below shows how the configured command `./log_processor` would be executed for NETCONF trace data configured to log in raw mode:

```
./log_processor 1 log "NETCONF Trace" netconf-trace raw
```

Command line argument position and meaning:

* `version`: Protocol version, always set to `1`. Added for forward compatibility.
* `action`: The action being performed. Is always set to `log`. Added for forward compatibility.
* `name:` Name of the log being processed.
* `log-type`: Type of log data being processed. For all but NETCONF and NED trace logs, this is set to `system`. Depending on the type of NED one of `ned-trace-java`, `ned-trace-netconf` and `ned-trace-snmp` is used. NETCONF trace is set to `netconf-trace`.
* `log-mode`: Format of log data being sent. For all but NETCONF and NED trace logs, this will be `raw`. NETCONF and NED trace logs can be pretty-printed, and then the format will be `pretty`.
