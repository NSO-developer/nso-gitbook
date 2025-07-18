# ncs.conf Man Page

`ncs.conf` - NCS daemon configuration file format

## Description

Whenever we start (or reload) the NCS daemon it reads its configuration
from `./ncs.conf` or `${NCS_DIR}/etc/ncs/ncs.conf` or from the file
specified with the `-c` option, as described in [ncs(1)](ncs.1.md).

Parts of the configuration can be placed in separate files in the
`ncs.conf.d` sub-directory, next to the `ncs.conf` file. Each of these
files should include the `ncs-config` XML element and the relevant
section from the main configuration file. Files without the ".conf"
extension will be ignored.

`ncs.conf` is an XML configuration file formally defined by a YANG
model, `tailf-ncs-config.yang` as referred to in the SEE ALSO section.
This YANG file is included in the distribution. The NCS distribution
also includes a commented ncs.conf.example file.

A short example: A NCS configuration file which specifies where to find
fxs files etc, which facility to use for syslog, that the developer log
should be disabled and that the audit log should be enabled. Finally, it
also disables clear text NETCONF support:

<div class="informalexample">

    <?xml version="1.0" encoding="UTF-8"?>
    <ncs-config xmlns="http://tail-f.com/yang/tailf-ncs-config/1.0">

      <load-path>
        <dir>/etc/ncs</dir>
        <dir>.</dir>
      </load-path>

      <state-dir>/var/ncs/state</state-dir>

      <cdb>
        <db-dir>/var/ncs/cdb</db-dir>
      </cdb>

      <aaa>
        <ssh-server-key-dir>/etc/ncs/ssh</ssh-server-key-dir>
      </aaa>


      <logs>
        <syslog-config>
          <facility>daemon</facility>
        </syslog-config>
        <developer-log>
          <enabled>false</enabled>
        </developer-log>
        <audit-log>
          <enabled>true</enabled>
        </audit-log>
      </logs>

      <netconf-north-bound>
        <transport>
          <tcp>
            <enabled>false</enabled>
          </tcp>
        </transport>
      </netconf-north-bound>

      <webui>
        <transport>
          <tcp>
            <enabled>false</enabled>
            <ip>0.0.0.0</ip>
            <port>8008>/ip>
          </tcp>
        </transport>
      </webui>
    </ncs-config>

</div>

Many configuration parameters get their default values as defined in the
YANG file. Filename parameters have no default values.

You can use environment variable references in the configuration file to
set values or parts of values that need to be configurable during
deployment. To do this, use `${VARIABLE}`, where `VARIABLE` is the name
of the environment variable. Each variable reference is replaced by the
value of the environment variable at startup. Values that are undefined
will result in an error unless a default value is specified for it.
Default values can be specified with `${VARIABLE:-DefaultValue}` where
`DefaultValue` is the value used if the environment variable is
undefined.

## Configuration Parameters

This section lists all available configuration parameters and their type
(within parenthesis) and default values (within square brackets).
Parameters are written using a path notation to make it easier to see
how they relate to each other.

/ncs-config  
> NCS configuration.

/ncs-config/validate-utf8  
> This section defines settings which affect UTF-8 validation.

/ncs-config/validate-utf8/enabled (boolean) \[true\]  
> By default (true) NCS will validate any data modeled as 'string' to be
> valid UTF-8 and conform to yang-string.
>
> NOTE: String data from data providers and in the ncs.conf file itself
> are not validated.
>
> The possibility to disable UTF-8 validation is supplied because it can
> help in certain situations if there is data which is invalid UTF-8 or
> does not conform to yang-string. Disabling UTF-8 and yang-string
> validation allows invalid data input.
>
> It is possible to check CDB contents for invalid UTF-8 string data
> with the following
>
> ncs --cdb-validate cdb-dir
>
> Invalid data will need to be corrected manually with UTF-8 validation
> disabled.
>
> For further details see:
>
> <div class="informalexample">
>
>     o RFC 3629 UTF-8, a transformation format of ISO 10646
>       and the Unicode standard.
>     o RFC 7950 The YANG 1.1 Data Modeling Language,
>       Section 14 YANG ABNF Grammar, yang-string definition.
>
> </div>

/ncs-config/ncs-ipc-address  
> NCS listens by default on 127.0.0.1:4569 for incoming TCP connections
> from NCS client libraries, such as CDB, MAAPI, the CLI, the external
> database API, as well as commands from the ncs script (such as 'ncs
> --reload').
>
> The IP address and port can be changed. If they are changed all
> clients using MAAPI, CDB et.c. must be re-compiled to handle this. See
> the deployment user-guide on how to do this.
>
> Note that there are severe security implications involved if NCS is
> instructed to bind(2) to anything but localhost. Read more about this
> in the NCS IPC section in the System Managent Topics section of the
> User Guide.

/ncs-config/ncs-ipc-address/ip (ipv4-address \| ipv6-address) \[127.0.0.1\]  
> The IP address which NCS listens on for incoming connections from the
> Java library

/ncs-config/ncs-ipc-address/port (port-number) \[4569\]  
> The port number which NCS listens on for incoming connections from the
> Java library

/ncs-config/ncs-ipc-extra-listen-ip (ipv4-address \| ipv6-address)  
> This parameter may be given multiple times.
>
> A list of additional IPs to which we wish to bind the NCS IPC
> listener. This is useful if we don't want to use the wildcard
> '0.0.0.0' or '::' addresses in order to never expose the NCS IPC to
> certain interfaces.

/ncs-config/ncs-local-ipc  
> NCS can be configured to use Unix domain socket instead of TCP for
> communication with NCS client libraries, such as CDB, MAAPI, the CLI,
> the external database API, as well as commands from the ncs script
> (such as 'ncs --reload').
>
> The default path to the Unix domain socket is /tmp/nso/nso-ipc, the
> value can be changed.

/ncs-config/ncs-local-ipc/enabled (boolean) \[false\]  
> If set to 'true', IPC over Unix domain socket is enabled.
>
> Note that when enabled, supported clients need to use this method to
> connect to NCS as other methods will not be available and the values
> under ncs-ipc-address will be ignored.

/ncs-config/ncs-local-ipc/path (string) \[/tmp/nso/nso-ipc\]  
> Path to the Unix domain socket that should be used for IPC.

/ncs-config/ncs-ipc-access-check  
> NCS can be configured to restrict access for incoming connections to
> the IPC listener sockets. The access check requires that connecting
> clients prove possession of a shared secret.

/ncs-config/ncs-ipc-access-check/enabled (boolean) \[false\]  
> If set to 'true', access check for IPC connections is enabled.

/ncs-config/ncs-ipc-access-check/filename (string)  
> This parameter is mandatory.
>
> filename is the full path to a file containing the shared secret for
> the IPC access check. The file should be protected via OS file
> permissions, such that it can only be read by the NCS daemon and
> client processes that are allowed to connect to the IPC listener
> sockets.

/ncs-config/enable-shared-memory-schema (boolean) \[true\]  
> If set to 'true', then a C program will be started that loads the
> schema into shared memory (which then can be accessed by e.g Python)

/ncs-config/shared-memory-schema-path (string)  
> Path to the shared memory file holding the schema. If left
> unconfigured, it defaults to 'state/schema' in the run-directory. Note
> that if the value is configured, it must be specified as an absolute
> path (i.e containing the root directory and all other subdirectories
> leading to the executable).

/ncs-config/enable-client-template-schemas (boolean) \[false\]  
> If set to 'false', then application client libraries, such as MAAPI,
> will not be able to access the /devices/template/ned-id/config and
> /compliance/template/ned-id/config schemas. This will reduce the
> memory usage for large device data models.

/ncs-config/load-path/dir (string)  
> This parameter is mandatory.
>
> This parameter may be given multiple times.
>
> The load-path element contains any number of dir elements. Each dir
> element points to a directory path on disk which is searched for
> compiled and imported YANG files (.fxs files) and compiled clispec
> files (.ccl files) during daemon startup. NCS also searches the load
> path for packages at initial startup, or when requested by the
> /packages/reload action.

/ncs-config/enable-compressed-schema (boolean) \[false\]  
> If set to true, NCS's internal storage of the schema information from
> the .fxs files will be compressed. This will reduce the memory usage
> for large data models, but may also cause reduced performance when
> looking up the schema information. The trade off depends on the total
> amount of schema information and typical usage patterns, thus the
> effect should be evaluated before enabling this functionality.

/ncs-config/compressed-schema-level (compressed-schema-level-type) \[1\]  
> Controls the level of compression when enable-compressed-schema is set
> to true. Setting the value to 1 results in more aggressive compression
> at the cost of performance, 2 results in slightly less memory saved,
> but at higher performance.

/ncs-config/state-dir (string)  
> This parameter is mandatory.
>
> This is where NCS writes persistent state data. Currently it is used
> to store a private copy of all packages found in the load path, in a
> directory tree rooted at 'packages-in-use.cur' (also referenced by a
> symlink 'packages-in-use'). It is also used for the state files
> 'running.invalid', which exists only if the running database status is
> invalid, which it will be if one of the database implementation fails
> during the two-phase commit protocol, and 'global.data' which is used
> to store some data that needs to be retained across reboots, and the
> high-availabillity raft storage consisting of snapshots and file log.

/ncs-config/commit-retry-timeout (xs:duration \| infinity) \[infinity\]  
> Commit timeout in the NCS backplane. This timeout controls for how
> long the commit operation in the CLI and the JSON-RPC API will attempt
> to complete the operation when some other entity is locking the
> database, e.g. some other commit is in progress or some managed object
> is locking the database.

/ncs-config/max-validation-errors (uint32 \| unbounded) \[1\]  
> Controls how many validation errors are collected and presented to the
> user at a time.

/ncs-config/transaction-lock-time-violation-alarm/timeout (xs:duration \| infinity) \[infinity\]  
> Timeout before an alarm is raised due to a transaction taking too much
> time inside of the critical section. 'infinity' or PT0S, i.e. 0
> seconds, indicates that the alarm will never be raised.

/ncs-config/notifications  
> This section defines settings which affect notifications.
>
> NETCONF and RESTCONF northbound notification settings

/ncs-config/notifications/event-streams  
> Lists all available notification event streams.

/ncs-config/notifications/event-streams/stream  
> Parameters for a single notification event stream.

/ncs-config/notifications/event-streams/stream/name (string)  
> The name attached to a specific event stream.

/ncs-config/notifications/event-streams/stream/description (string)  
> This parameter is mandatory.
>
> A descriptive text attached to a specific event stream.

/ncs-config/notifications/event-streams/stream/replay-support (boolean)  
> This parameter is mandatory.
>
> Signals if replay support is available for a specific event stream.

/ncs-config/notifications/event-streams/stream/builtin-replay-store  
> Parameters for the built in replay store for this event stream.
>
> If replay support is enabled NCS automatically stores all
> notifications on disk ready to be replayed should a NETCONF manager or
> RESTCONF event notification subscriber ask for logged notifications.
> The replay store uses a set of wrapping log files on disk (of a
> certain number and size) to store the notifications.
>
> The max size of each wrap log file (see below) should not be too
> large. This to acheive fast replay of notifications in a certain time
> range. If possible use a larger number of wrap log files instead.
>
> If in doubt use the recommended settings (see below).

/ncs-config/notifications/event-streams/stream/builtin-replay-store/enabled (boolean) \[false\]  
> If set to 'false', the application must implement its own replay
> support.

/ncs-config/notifications/event-streams/stream/builtin-replay-store/dir (string)  
> This parameter is mandatory.
>
> The wrapping log files will be put in this disk location

/ncs-config/notifications/event-streams/stream/builtin-replay-store/max-size (tailf:size)  
> This parameter is mandatory.
>
> The max size of each log wrap file. The recommended setting is
> approximately S10M.

/ncs-config/notifications/event-streams/stream/builtin-replay-store/max-files (int64)  
> This parameter is mandatory.
>
> The max number of log wrap files. The recommended setting is around 50
> files.

/ncs-config/opcache  
> This section defines settings which affect the behavior of the
> operational data cache.

/ncs-config/opcache/enabled (boolean) \[false\]  
> If set to 'true', the cache is enabled.

/ncs-config/opcache/timeout (uint64)  
> This parameter is mandatory.
>
> The amount of time to keep data in the cache, in seconds.

/ncs-config/hide-group  
> Hide groups that can be unhidden must be listed here. There can be
> zero, one or many hide-group entries in the configuraion.
>
> If a hide group does not have a hide-group entry, then it cannot be
> unhidden using the CLI 'unhide' command. However, it is possible to
> add a hide-group entry to the ncs.conf file and then use ncs --reload
> to make it available in the CLI. This may be useful to enable for
> example a diagnostics hide groups that you do not even want accessible
> using a password.

/ncs-config/hide-group/name (string)  
> Name of hide group. This name should correspond to a hide group name
> defined in some YANG module with 'tailf:hidden'.

/ncs-config/hide-group/password (tailf:md5-digest-string) \[\]  
> A password can optionally be specified for a hide group. If no
> password or callback is given then the hide group can be unhidden
> without giving a password.
>
> If a password is specified then the hide group cannot be enabled
> unless the password is entered.
>
> To completely disable a hide group, ie make it impossible to unhide
> it, remove the entire hide-group container for that hide group.

/ncs-config/hide-group/callback (string)  
> A callback can optionally be specified for a hide group. If no
> callback or password is given then the hide group can be unhidden
> without giving a password.
>
> If a callback is specified then the hide group cannot be enabled
> unless a password is entered and the successfully verifies the
> password. The callback receives both the name of the hide group, the
> name of the user issuing the unhide command, and the passowrd.
>
> Using a callback it is possible to have short lived unhide passwords
> and per-user unhide passwords.

/ncs-config/cdb/db-dir (string)  
> This parameter is mandatory.
>
> db-dir is the directory on disk which CDB use for its storage and any
> temporary files being used. It is also the directory where CDB
> searches for initialization files.

/ncs-config/cdb/persistence/format (in-memory-v1 \| on-demand-v1) \[in-memory-v1\]  
> 

/ncs-config/cdb/persistence/db-statistics (disabled \| enabled) \[disabled\]  
> If set to 'enabled', underlying database produces internal statistics
> for further observability.

/ncs-config/cdb/persistence/offload/interval (xs:duration \| infinity) \[5s\]  
> Offload interval time, set to infinity to disable.

/ncs-config/cdb/persistence/offload/threshold/megabytes (uint64)  
> Megabytes of data that can be used for CDB data before starting to
> offload.

/ncs-config/cdb/persistence/offload/threshold/system-memory-percentage (uint8) \[50\]  
> Percentage of total available RAM that can be used for CDB data before
> starting to offload. This is the default and should be used unless
> testing has shown specific requirements.

/ncs-config/cdb/persistence/offload/threshold/max-age (xs:duration \| infinity) \[infinity\]  
> Maximum age of data before it is offloaded from memory.

/ncs-config/cdb/init-path/dir (string)  
> This parameter may be given multiple times.
>
> The init-path can contain any number of dir elements. Each dir element
> points to a directory path which CDB will search for .xml files before
> looking in db-dir. The directories are searched in the order they are
> listed.

/ncs-config/cdb/client-timeout (xs:duration \| infinity) \[infinity\]  
> Specifies how long CDB should wait for a response to e.g. a
> subscription notification before considering a client unresponsive. If
> a client fails to call Cdb.syncSubscriptionSocket() within the timeout
> period, CDB will syslog this failure and then, considering the client
> dead, close the socket and proceed with the subscription
> notifications. If set to infinity, CDB will never timeout waiting for
> a response from a client.

/ncs-config/cdb/subscription-replay/enabled (boolean) \[false\]  
> If enabled it is possible to request a replay of the previous
> subscription notification to a new cdb subscriber.

/ncs-config/cdb/operational  
> Operational data can either be implemented by external callbacks, or
> stored in CDB (or a combination of both). The operational datastore is
> used when data is to be stored in CDB.

/ncs-config/cdb/operational/db-dir (string)  
> db-dir is the directory on disk which CDB operational uses for its
> storage and any temporary files being used. If left unset (default)
> the same directory as db-dir for CDB is used.

/ncs-config/cdb/snapshot  
> The snapshot datastore is used by the commit queue to calculate the
> southbound diff towards the devices outside of the transaction lock.

/ncs-config/cdb/snapshot/pre-populate (boolean) \[false\]  
> This parameter controls if the snapshot datastore should be
> pre-populated during upgrade. Switching this on or off implies
> different trade-offs.
>
> If 'false', NCS is optimized for using normal transaction commits. The
> snapshot is populated in a lazy manner (when a device is committed
> through the commit queue for the first time). The drawback is that
> this commit will suffer performance wise, which is especially true for
> devices with large configurations. Subsequent commits on the same
> devices will not have the same penalty.
>
> If 'true', NCS is optimized for systems using the commit queue
> extensively. This will lead to better performance when committing
> using the commit queue with no additional penalty for the first time
> commits. The drawbacks are that upgrade times will increase and an
> almost doubling of NCS memory consumption.

/ncs-config/compaction/journal-compaction (automatic \| manual) \[automatic\]  
> Controls the way the CDB files does its journal compaction. Never set
> to anything but the default 'automatic' unless there is an external
> mechanism which controls the compaction using the
> cdb_initiate_journal_compaction() API call.

/ncs-config/compaction/file-size-relative (uint8) \[50\]  
> States the threshold in percentage of size increase in a CDB file
> since the last compaction. By default, compaction is initiated if a
> CDB file size grows more than 50 percent since the last compaction. If
> set to 0, the threshold will be disabled.

/ncs-config/compaction/num-node-relative (uint8) \[50\]  
> States the threshold in percentage of number of node increase in a CDB
> file since the last compaction. By default, compaction is initiated if
> the number of nodes grows more than 50 percent since the last
> compaction. If set to 0, the threshold will be disabled.

/ncs-config/compaction/file-size-absolute (tailf:size)  
> States the threshold of size increase in a CDB file since the last
> compaction. Compaction is initiated if a CDB file size grows more than
> file-size-absolute since the last compaction.

/ncs-config/compaction/num-transactions (uint16)  
> States the threshold of number of transactions committed in a CDB file
> since the last compaction. Compaction is initiated if the number of
> transactions are greater than num-transactions since the last
> compaction.

/ncs-config/compaction/delayed-compaction-timeout (xs:duration) \[PT5S\]  
> Controls for how long CDB will delay the compaction before initiating.
> Note that once the timeout elapses, compaction will be initiated only
> if no new transaction occurs during the delay time.

/ncs-config/encrypted-strings  
> encrypted-strings defines keys used to encrypt strings adhering to the
> types tailf:des3-cbc-encrypted-string,
> tailf:aes-cfb-128-encrypted-string and
> tailf:aes-256-cfb-128-encrypted-string.

/ncs-config/encrypted-strings/external-keys  
> Configuration of an external command that will provide the keys used
> for encrypted-strings. When set no keys for encrypted-strings can be
> set in the configuration.
>
> When using protocol version '2' of external-keys, see the description
> in /ncs-config/encrypted-strings/key-rotation for rules applying.

/ncs-config/encrypted-strings/external-keys/command (string)  
> This parameter is mandatory.
>
> Path to command executed to output keys.

/ncs-config/encrypted-strings/external-keys/command-timeout (xs:duration \| infinity) \[PT60S\]  
> Command timeout. Timeout is measured between complete lines read from
> the output.

/ncs-config/encrypted-strings/external-keys/command-argument (string)  
> Argument available in external-keys command as the environment
> variable NCS_EXTERNAL_KEYS_ARGUMENT.

/ncs-config/encrypted-strings/key-rotation  
> Used to store generations of encryption keys.
>
> If migrating from the 'legacy' case (or 'external-keys' without
> 'EXTERNAL_KEY_FORMAT=2') of /ncs-config/encrypted-strings/method
> choice, you \*must\* include the old set of keys as generation '-1'.
> Otherwise the system will refuse to load the new set of keys, in order
> not to overwrite the currently active keys that were used to encrypt
> strings.
>
> If key sets were previously loaded using this list ('key-rotation'),
> or 'external-keys' with with 'EXTERNAL_KEY_FORMAT=2', you must still
> provide the currently active generation when loading new keys.
>
> If /ncs-config/encrypted-strings was not defined before, any
> generations adhering to the type of 'generation' may be added, and the
> highest generation will be set as the currently active generation,
> which will be used to encrypt any strings.

/ncs-config/encrypted-strings/key-rotation/generation (int16)  
> 

/ncs-config/encrypted-strings/key-rotation/AESCFB128  
> In the AESCFB128 case one 128 bits (16 bytes) key and a random initial
> vector are used to encrypt the string. The initVector leaf is
> OBSOLETED

/ncs-config/encrypted-strings/key-rotation/AESCFB128/key (hex16-value-type)  
> This parameter is mandatory.

/ncs-config/encrypted-strings/key-rotation/AES256CFB128  
> In the AES256CFB128 case one 256 bits (32 bytes) key and a random
> initial vector are used to encrypt the string.

/ncs-config/encrypted-strings/key-rotation/AES256CFB128/key (hex32-value-type)  
> This parameter is mandatory.

/ncs-config/encrypted-strings/AESCFB128  
> In the AESCFB128 case one 128 bits (16 bytes) key and a random initial
> vector are used to encrypt the string. The initVector leaf is
> OBSOLETED

/ncs-config/encrypted-strings/AESCFB128/key (hex16-value-type)  
> This parameter is mandatory.

/ncs-config/encrypted-strings/AES256CFB128  
> In the AES256CFB128 case one 256 bits (32 bytes) key and a random
> initial vector are used to encrypt the string.

/ncs-config/encrypted-strings/AES256CFB128/key (hex32-value-type)  
> This parameter is mandatory.

/ncs-config/crypt-hash  
> crypt-hash specifies how cleartext values should be hashed for leafs
> of the types ianach:crypt-hash, tailf:sha-256-digest-string, and
> tailf:sha-512-digest-string.

/ncs-config/crypt-hash/algorithm (md5 \| sha-256 \| sha-512) \[md5\]  
> algorithm can be set to one of the values 'md5', 'sha-256', or
> 'sha-512', to choose the corresponding hash algorithm for hashing of
> cleartext input for the ianach:crypt-hash type.

/ncs-config/crypt-hash/rounds (crypt-hash-rounds-type) \[5000\]  
> For the 'sha-256' and 'sha-512' algorithms for the ianach:crypt-hash
> type, and for the tailf:sha-256-digest-string and
> tailf:sha-512-digest-string types, 'rounds' specifies how many times
> the hashing loop should be executed. If a value other than the default
> 5000 is specified, the hashed format will have 'rounds=N\$', where N
> is the specified value, prepended to the salt. This parameter is
> ignored for the 'md5' algorithm for ianach:crypt-hash.

/ncs-config/logs/syslog-config  
> Shared settings for how to log to syslog. Logs (see below) can be
> configured to log to file and/or syslog. If a log is configured to log
> to syslog, the settings under /ncs-config/logs/syslog-config are used.

/ncs-config/logs/syslog-config/facility (daemon \| authpriv \| local0 \| local1 \| local2 \| local3 \| local4 \| local5 \| local6 \| local7 \| uint32) \[daemon\]  
> This facility setting is the default facility. It's also possible to
> set individual facilities in the different logs below.

/ncs-config/logs/ncs-log  
> ncs-log is NCS's daemon log. Check this log for startup problems of
> the NCS daemon itself. This log is not rotated, i.e. use logrotate(8).

/ncs-config/logs/ncs-log/enabled (boolean) \[true\]  
> If set to true, the log is enabled.

/ncs-config/logs/ncs-log/file/name (string)  
> Name is the full path to the actual log file.

/ncs-config/logs/ncs-log/file/enabled (boolean) \[false\]  
> If set to true, file logging is enabled

/ncs-config/logs/ncs-log/syslog/enabled (boolean) \[false\]  
> If set to true, syslog messages are sent.

/ncs-config/logs/ncs-log/syslog/facility (daemon \| authpriv \| local0 \| local1 \| local2 \| local3 \| local4 \| local5 \| local6 \| local7 \| uint32)  
> This optional value overrides the
> /ncs-config/logs/syslog-config/facility for this particular log.

/ncs-config/logs/ncs-log/external/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', send log data to
> external command for processing.

/ncs-config/logs/developer-log  
> developer-log is a debug log for troubleshooting user-written Java
> code. Enable and check this log for problems with validation code etc.
> This log is enabled by default. In all other regards it can be
> configured as ncs-log. This log is not rotated, i.e. use logrotate(8).

/ncs-config/logs/developer-log/enabled (boolean) \[true\]  
> If set to true, the log is enabled.

/ncs-config/logs/developer-log/file/name (string)  
> Name is the full path to the actual log file.

/ncs-config/logs/developer-log/file/enabled (boolean) \[false\]  
> If set to true, file logging is enabled

/ncs-config/logs/developer-log/syslog/enabled (boolean) \[false\]  
> If set to true, syslog messages are sent.

/ncs-config/logs/developer-log/syslog/facility (daemon \| authpriv \| local0 \| local1 \| local2 \| local3 \| local4 \| local5 \| local6 \| local7 \| uint32)  
> This optional value overrides the
> /ncs-config/logs/syslog-config/facility for this particular log.

/ncs-config/logs/developer-log/external/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', send log data to
> external command for processing.

/ncs-config/logs/developer-log-level (error \| info \| trace) \[info\]  
> Controls which level of developer messages are printed in the
> developer log.

/ncs-config/logs/upgrade-log  
> Contains information about CDB upgrade. This log is enabled by default
> and is not rotated, i.e. use logrotate(8).

/ncs-config/logs/upgrade-log/enabled (boolean) \[true\]  
> If set to true, the log is enabled.

/ncs-config/logs/upgrade-log/file/name (string)  
> Name is the full path to the actual log file.

/ncs-config/logs/upgrade-log/file/enabled (boolean) \[false\]  
> If set to true, file logging is enabled

/ncs-config/logs/upgrade-log/syslog/enabled (boolean) \[false\]  
> If set to true, syslog messages are sent.

/ncs-config/logs/upgrade-log/syslog/facility (daemon \| authpriv \| local0 \| local1 \| local2 \| local3 \| local4 \| local5 \| local6 \| local7 \| uint32)  
> This optional value overrides the
> /ncs-config/logs/syslog-config/facility for this particular log.

/ncs-config/logs/upgrade-log/external/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', send log data to
> external command for processing.

/ncs-config/logs/audit-log  
> audit-log is an audit log recording successful and failed logins to
> the NCS backplane and also user operations performed from the CLI or
> northbound interfaces. This log is enabled by default. In all other
> regards it can be configured as /ncs-config/logs/ncs-log. This log is
> not rotated, i.e. use logrotate(8).

/ncs-config/logs/audit-log/enabled (boolean) \[true\]  
> If set to true, the log is enabled.

/ncs-config/logs/audit-log/file/name (string)  
> Name is the full path to the actual log file.

/ncs-config/logs/audit-log/file/enabled (boolean) \[false\]  
> If set to true, file logging is enabled

/ncs-config/logs/audit-log/syslog/enabled (boolean) \[false\]  
> If set to true, syslog messages are sent.

/ncs-config/logs/audit-log/syslog/facility (daemon \| authpriv \| local0 \| local1 \| local2 \| local3 \| local4 \| local5 \| local6 \| local7 \| uint32)  
> This optional value overrides the
> /ncs-config/logs/syslog-config/facility for this particular log.

/ncs-config/logs/audit-log/external/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', send log data to
> external command for processing.

/ncs-config/logs/audit-log-commit (boolean) \[false\]  
> Controls whether the audit log should include messages about the
> resulting configuration changes for each commit to the running data
> store.

/ncs-config/logs/audit-log-commit-defaults (boolean) \[false\]  
> Controls whether the audit log should include messages about default
> values being set. Enabling this may have a performance impact.

/ncs-config/logs/audit-network-log  
> audit-network-log is an audit log recording southbound traffic towards
> devices. This log is not rotated, i.e. use logrotate(8).

/ncs-config/logs/audit-network-log/enabled (boolean) \[false\]  
> If set to true, the log is enabled.

/ncs-config/logs/audit-network-log/file/name (string)  
> Name is the full path to the actual log file.

/ncs-config/logs/audit-network-log/file/enabled (boolean) \[false\]  
> If set to true, file logging is enabled

/ncs-config/logs/audit-network-log/syslog  
> Syslog is not available for audit-network-log. These parameters have
> no effect.

/ncs-config/logs/audit-network-log/syslog/enabled (boolean) \[false\]  
> Unsupported.

/ncs-config/logs/audit-network-log/syslog/facility (daemon \| authpriv \| local0 \| local1 \| local2 \| local3 \| local4 \| local5 \| local6 \| local7 \| uint32)  
> This optional value overrides the
> /ncs-config/logs/syslog-config/facility for this particular log.

/ncs-config/logs/audit-network-log/external/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', send log data to
> external command for processing.

/ncs-config/logs/raft-log  
> The raft-log is used for tracing raft state and events written by the
> WhatsApp Raft library used by HA Raft. This log is not rotated, i.e.
> use logrotate(8).

/ncs-config/logs/raft-log/enabled (boolean) \[true\]  
> If set to true, the log is enabled.

/ncs-config/logs/raft-log/file/name (string)  
> Name is the full path to the actual log file.

/ncs-config/logs/raft-log/file/enabled (boolean) \[false\]  
> If set to true, file logging is enabled

/ncs-config/logs/raft-log/syslog  
> Syslog is not available for raft-log. This parameter has no effect.

/ncs-config/logs/raft-log/syslog/enabled (boolean) \[false\]  
> Unsupported.

/ncs-config/logs/raft-log/syslog/facility (daemon \| authpriv \| local0 \| local1 \| local2 \| local3 \| local4 \| local5 \| local6 \| local7 \| uint32)  
> This optional value overrides the
> /ncs-config/logs/syslog-config/facility for this particular log.

/ncs-config/logs/raft-log/external/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', send log data to
> external command for processing.

/ncs-config/logs/raft-log/level (error \| info \| trace) \[info\]  
> The severity level for the message to be logged.

/ncs-config/logs/netconf-log  
> netconf-log is a log for troubleshooting northbound NETCONF
> operations, such as checking why e.g. a filter operation didn't return
> the data requested. This log is enabled by default. In all other
> regards it can be configured as /ncs-config/logs/ncs-log. This log is
> not rotated, i.e. use logrotate(8).

/ncs-config/logs/netconf-log/enabled (boolean) \[true\]  
> If set to true, the log is enabled.

/ncs-config/logs/netconf-log/file/name (string)  
> Name is the full path to the actual log file.

/ncs-config/logs/netconf-log/file/enabled (boolean) \[false\]  
> If set to true, file logging is enabled

/ncs-config/logs/netconf-log/syslog/enabled (boolean) \[false\]  
> If set to true, syslog messages are sent.

/ncs-config/logs/netconf-log/syslog/facility (daemon \| authpriv \| local0 \| local1 \| local2 \| local3 \| local4 \| local5 \| local6 \| local7 \| uint32)  
> This optional value overrides the
> /ncs-config/logs/syslog-config/facility for this particular log.

/ncs-config/logs/netconf-log/external/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', send log data to
> external command for processing.

/ncs-config/logs/netconf-log/log-reply-status (boolean) \[false\]  
> When set to 'true', NCS extends NETCONF log with rpc-reply status
> ('ok', 'data', or 'error'). When the type is 'error', the content of
> the error reply is included in the log output.

/ncs-config/logs/netconf-log/log-get-content (boolean) \[false\]  
> When set to 'true', NCS extends NETCONF log with the content of get
> and get-config RPCs sufficient to enable personal accountability
> compliance but limited in size to minimize performance impact.

/ncs-config/logs/netconf-log/max-content-size (uint16) \[750\]  
> Maximum size of body content of requests or replies included in log
> when when log-get-content or log-reply-status is set to 'true'. This
> value has has range of 50 to 5000 characters with a default value of
> 750.

/ncs-config/logs/jsonrpc-log  
> jsonrpc-log is a log of JSON-RPC traffic. This log is enabled by
> default. In all other regards it can be configured as
> /ncs-config/logs/ncs-log. This log is not rotated, i.e. use
> logrotate(8).

/ncs-config/logs/jsonrpc-log/enabled (boolean) \[true\]  
> If set to true, the log is enabled.

/ncs-config/logs/jsonrpc-log/file/name (string)  
> Name is the full path to the actual log file.

/ncs-config/logs/jsonrpc-log/file/enabled (boolean) \[false\]  
> If set to true, file logging is enabled

/ncs-config/logs/jsonrpc-log/syslog/enabled (boolean) \[false\]  
> If set to true, syslog messages are sent.

/ncs-config/logs/jsonrpc-log/syslog/facility (daemon \| authpriv \| local0 \| local1 \| local2 \| local3 \| local4 \| local5 \| local6 \| local7 \| uint32)  
> This optional value overrides the
> /ncs-config/logs/syslog-config/facility for this particular log.

/ncs-config/logs/jsonrpc-log/external/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', send log data to
> external command for processing.

/ncs-config/logs/snmp-log/enabled (boolean) \[true\]  
> If set to true, the log is enabled.

/ncs-config/logs/snmp-log/file/name (string)  
> Name is the full path to the actual log file.

/ncs-config/logs/snmp-log/file/enabled (boolean) \[false\]  
> If set to true, file logging is enabled

/ncs-config/logs/snmp-log/syslog/enabled (boolean) \[false\]  
> If set to true, syslog messages are sent.

/ncs-config/logs/snmp-log/syslog/facility (daemon \| authpriv \| local0 \| local1 \| local2 \| local3 \| local4 \| local5 \| local6 \| local7 \| uint32)  
> This optional value overrides the
> /ncs-config/logs/syslog-config/facility for this particular log.

/ncs-config/logs/snmp-log/external/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', send log data to
> external command for processing.

/ncs-config/logs/snmp-log-level (error \| info) \[info\]  
> Controls which level of SNMP pdus are printed in the SNMP log. The
> value 'error' means that only PDUs with error-status not equal to
> 'noError' are printed.

/ncs-config/logs/webui-browser-log  
> Deprecated. Should not be used.

/ncs-config/logs/webui-browser-log/enabled (boolean) \[false\]  
> Deprecated. Should not be used.

/ncs-config/logs/webui-browser-log/filename (string)  
> This parameter is mandatory.
>
> Deprecated. Should not be used.

/ncs-config/logs/webui-access-log  
> webui-access-log is an access log for the embedded NCS Web server.
> This file adheres to the Common Log Format, as defined by Apache and
> others. This log is not enabled by default and is not rotated, i.e.
> use logrotate(8).

/ncs-config/logs/webui-access-log/enabled (boolean) \[false\]  
> If set to 'true', the access log is used.

/ncs-config/logs/webui-access-log/traffic-log (boolean) \[false\]  
> Is either true or false. If true, all HTTP(S) traffic towards the
> embedded Web server is logged in a log file named traffic.trace. The
> log file can be used to debugging JSON-RPC/REST/RESTCONF. Beware: Do
> not use this log in a production setting. This log is not enabled by
> default and is not rotated, i.e. use logrotate(8).

/ncs-config/logs/webui-access-log/dir (string)  
> This parameter is mandatory.
>
> The path to the directory whereas the access log should be written to.

/ncs-config/logs/webui-access-log/syslog/enabled (boolean) \[false\]  
> If set to true, syslog messages are sent.

/ncs-config/logs/webui-access-log/syslog/facility (daemon \| authpriv \| local0 \| local1 \| local2 \| local3 \| local4 \| local5 \| local6 \| local7 \| uint32)  
> This optional value overrides the
> /ncs-config/logs/syslog-config/facility for this particular log.

/ncs-config/logs/netconf-trace-log  
> netconf-trace-log is a log for understanding and troubleshooting
> northbound NETCONF protocol interactions. When this log is enabled,
> all NETCONF traffic to and from NCS is stored to a file. By default,
> all XML is pretty-printed. This will slow down the NETCONF server, so
> be careful when enabling this log. This log is not rotated, i.e. use
> logrotate(8).
>
> Please note that this means that everything, including potentially
> sensitive data, is logged. No filtering is done.

/ncs-config/logs/netconf-trace-log/enabled (boolean) \[false\]  
> If set to 'true', all NETCONF traffic is logged. NOTE: This
> configuration parameter takes effect for new sessions while existing
> sessions will be terminated.

/ncs-config/logs/netconf-trace-log/filename (string)  
> This parameter is mandatory.
>
> The name of the file where the NETCONF traffic trace log is written.

/ncs-config/logs/netconf-trace-log/external/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', send log data to
> external command for processing.

/ncs-config/logs/netconf-trace-log/format (pretty \| raw) \[pretty\]  
> The value 'pretty' means that the XML data is pretty-printed. The
> value 'raw' means that it is not.

/ncs-config/logs/xpath-trace-log  
> xpath-trace-log is a log for understanding and troubleshooting XPath
> evaluations. When this log is enabled, the execution of all XPath
> queries evaluated by NCS are logged to a file.
>
> This will slow down NCS, so be careful when enabling this log. This
> log is not rotated, i.e. use logrotate(8).

/ncs-config/logs/xpath-trace-log/enabled (boolean) \[false\]  
> If set to 'true', all XPath execution is logged.

/ncs-config/logs/xpath-trace-log/filename (string)  
> The name of the file where the XPath trace log is written

/ncs-config/logs/xpath-trace-log/external/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', send log data to
> external command for processing.

/ncs-config/logs/transaction-error-log  
> transaction-error-log is a log for collecting information on failed
> transactions that lead to either CDB boot error or runtime transaction
> failure.

/ncs-config/logs/transaction-error-log/enabled (boolean) \[false\]  
> If 'true' on CDB boot error a traceback of the failed load will be
> logged or in case of a runtime transaction error the transaction
> information will be dumped to the log.

/ncs-config/logs/transaction-error-log/filename (string)  
> The name of the file where the transaction error log is written.

/ncs-config/logs/transaction-error-log/external/enabled (boolean) \[false\]  
> If 'true', send log data to external command for processing.

/ncs-config/logs/out-of-band-policy-log  
> out-of-band-policy-log is a log for collecting information on detected
> and handled out-of-band values. Which rules from which policies were
> active and which services were affected.

/ncs-config/logs/out-of-band-policy-log/enabled (boolean) \[false\]  
> If 'true' detected and handled out-of-band values will logged.

/ncs-config/logs/out-of-band-policy-log/filename (string)  
> This parameter is mandatory.
>
> The name of the file where the oob policy log is written.

/ncs-config/logs/out-of-band-policy-log-level (error \| info \| trace) \[info\]  
> Controls which level of oob policy messages are printed in the oob
> policy log.

/ncs-config/logs/ext-log  
> ext-log is a log for logging events related to external log processing
> such as process execution, unexpected termination etc.
>
> This log is not rotated, i.e. use logrotate(8).

/ncs-config/logs/ext-log/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', external log
> processing events is logged.

/ncs-config/logs/ext-log/filename (string)  
> This parameter is mandatory.
>
> The name of the file where the log for external log processing is
> written.

/ncs-config/logs/ext-log/level (uint8) \[2\]  
> The log level of extLog. 0 is the most critical, 7 is trace logging.

/ncs-config/logs/error-log  
> error-log is an error log used for internal logging from the NCS
> daemon. It is used for troubleshooting the NCS daemon itself, and
> should normally be disabled. This log is rotated by the NCS daemon
> (see below).

/ncs-config/logs/error-log/enabled (boolean) \[false\]  
> If set to 'true', error logging is performed.

/ncs-config/logs/error-log/filename (string)  
> This parameter is mandatory.
>
> filename is the full path to the actual log file. This parameter must
> be set if the error-log is enabled.

/ncs-config/logs/error-log/max-size (tailf:size) \[S1M\]  
> max-size is the maximum size of an individual log file before it is
> rotated. Log filenames are reused when five logs have been exhausted.

/ncs-config/logs/error-log/debug/enabled (boolean) \[false\]  
> 

/ncs-config/logs/error-log/debug/level (uint16) \[2\]  
> 

/ncs-config/logs/error-log/debug/tag (string)  
> This parameter may be given multiple times.

/ncs-config/logs/progress-trace  
> progress-trace is used for tracing progress events emitted by
> transactions and actions in the system. It provides useful information
> for debugging, diagnostics and profiling. Enabling this setting allows
> progress trace files to be written to the configured directory. What
> data to be emitted are configured in /progress/trace.

/ncs-config/logs/progress-trace/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', progress trace files
> are written to the configured directory.

/ncs-config/logs/progress-trace/dir (string)  
> This parameter is mandatory.
>
> The directory path to the location of the progress trace files.

/ncs-config/logs/external/enabled (boolean) \[false\]  
> 

/ncs-config/logs/external/command (string)  
> This parameter is mandatory.
>
> Path to command executed to process log data from stdin.

/ncs-config/logs/external/restart/max-attempts (uint8) \[3\]  
> Max restart attempts within period, includes time used by delay. If
> maxAttempts restarts is exceeded the external processing will be
> disabled until a reload is issued or the configuration is changed.

/ncs-config/logs/external/restart/delay (xs:duration \| infinity) \[PT1S\]  
> Delay between start attempts if the command failed to start or stopped
> unexpectedly.

/ncs-config/logs/external/restart/period (xs:duration \| infinity) \[PT30S\]  
> Period of time start attempts are counted in. Period is reset if a
> command runs for more than period amount of time.

/ncs-config/sort-transactions (boolean) \[true\]  
> This parameter controls how NCS lists newly created, not yet committed
> list entries. If this value is set to 'false', NCS will list all new
> elements before listing existing data.
>
> If this value is set to 'true', NCS will merge new and existing
> entries, and provide one sorted view of the data. This behavior works
> well when CDB is used to store configuration data, but if an external
> data provider is used, NCS does not know the sort order, and can thus
> not merge the new entries correctly. If an external data provider is
> used for configuration data, and the sort order differs from CDB's
> sort order, this parameter should be set to 'false'.

/ncs-config/enable-inactive (boolean) \[true\]  
> This parameter controls if the NCS's inactive feature should be
> enabled or not. When NCS is used to control Juniper routers, this
> feature is required

/ncs-config/enable-origin (boolean) \[false\]  
> This parameter controls if NCS's NMDA origin feature should be enabled
> or not.

/ncs-config/session-limits  
> Parameters for limiting concurrent access to NCS.

/ncs-config/session-limits/max-sessions (uint32 \| unbounded) \[unbounded\]  
> Puts a limit on the total number of concurrent sessions to NCS.

/ncs-config/session-limits/session-limit  
> Parameters for limiting concurrent access for a specific context to
> NCS. There can be multiple instances of this container element, each
> one specifying parameters for a specific context.

/ncs-config/session-limits/session-limit/context (string)  
> The context is either one of cli, netconf, webui, snmp or it can be
> any other context string defined through the use of MAAPI. As an
> example, if we use MAAPI to implement a CORBA interface to NCS, our
> MAAPI program could send the string 'corba' as context.

/ncs-config/session-limits/session-limit/max-sessions (uint32 \| unbounded)  
> This parameter is mandatory.
>
> Puts a limit on the total number of concurrent sessions to NCS.

/ncs-config/session-limits/max-config-sessions (uint32 \| unbounded) \[unbounded\]  
> Puts a limit on the total number of concurrent configuration sessions
> to NCS.

/ncs-config/session-limits/config-session-limit  
> Parameters for limiting concurrent read-write transactions for a
> specific context to NCS. There can be multiple instances of this
> container element, each one specifying parameters for a specific
> context.

/ncs-config/session-limits/config-session-limit/context (string)  
> The context is either one of cli, netconf, webui, snmp, or it can be
> any other context string defined through the use of MAAPI. As an
> example, if we use MAAPI to implement a CORBA interface to NCS, our
> MAAPI program could send the string 'corba' as context.

/ncs-config/session-limits/config-session-limit/max-sessions (uint32 \| unbounded)  
> This parameter is mandatory.
>
> Puts a limit to the total number of concurrent configuration sessions
> to NCS for the corresponding context.

/ncs-config/transaction-limits  
> Parameters for limiting the number of concurrent transactions being
> applied in NCS.

/ncs-config/transaction-limits/max-transactions (uint8 \| unbounded \| logical-processors) \[logical-processors\]  
> Puts a limit on the total number of concurrent transactions being
> applied towards the running datastore.
>
> If this value is too high it can cause performance degradation due to
> increased contention on system internals and resources.
>
> In some cases, especially when transactions are prone to conflicting
> or other parts of the system has high load, the optimal value for this
> setting can be smaller than the number of logical processors.

/ncs-config/transaction-limits/scheduling-mode (relaxed \| strict) \[relaxed\]  
> 

/ncs-config/parser-limits  
> Parameters for limiting parsing of XML data.

/ncs-config/parser-limits/max-processing-instruction-length (uint32 \| unbounded \| model) \[32768\]  
> Maximum number of bytes for processing instructions.

/ncs-config/parser-limits/max-tag-length (uint32 \| unbounded \| model) \[1024\]  
> Maximum number of bytes for tag names excluding namespace prefix.

/ncs-config/parser-limits/max-attribute-length (uint32 \| unbounded \| model) \[1024\]  
> Maximum number of bytes for attribute names including namespace
> prefix.

/ncs-config/parser-limits/max-attribute-value-length (uint32 \| unbounded) \[unbounded\]  
> Maximum number of bytes for attribute values in escaped form.

/ncs-config/parser-limits/max-attribute-count (uint32 \| unbounded \| model) \[64\]  
> Maximum number of attributes on a single tag.

/ncs-config/parser-limits/max-xmlns-prefix-length (uint32 \| unbounded) \[1024\]  
> Maximum number of bytes for xmlns prefix.

/ncs-config/parser-limits/max-xmlns-valueLength (uint32 \| unbounded \| model) \[1024\]  
> Maximum number of bytes for a namespace value in escaped form.

/ncs-config/parser-limits/max-xmlns-count (uint32 \| unbounded) \[1024\]  
> Maximum number of xmlns declarations on a single tag.

/ncs-config/parser-limits/max-data-length (uint32 \| unbounded) \[unbounded\]  
> Maximum number of bytes of continuous data.

/ncs-config/aaa  
> The login procedure to NCS is fully described in the NCS User Guide.

/ncs-config/aaa/ssh-login-grace-time (xs:duration) \[PT10M\]  
> NCS servers close ssh connections after this time if the client has
> not successfully authenticated itself by then. If the value is 0,
> there is no time limit for client authentication.
>
> This is a global value for all ssh servers in NCS.
>
> Modification of this value will only affect ssh connections that are
> established after the modification has been done.

/ncs-config/aaa/ssh-max-auth-tries (uint32 \| unbounded) \[unbounded\]  
> NCS servers close ssh connections when the client has made this number
> of unsuccessful authentication attempts.
>
> This is a global value for all ssh servers in NCS.
>
> Modification of this value will only affect ssh connections that are
> established after the modification has been done.

/ncs-config/aaa/ssh-server-key-dir (string)  
> ssh-server-key-dir is the directory file path where the keys used by
> the NCS SSH daemon are found. This parameter must be set if SSH is
> enabled for NETCONF or the CLI. If SSH is enabled, the server keys
> used by NCS are om the same format as the server keys used by openssh,
> i.e. the same format as generated by 'ssh-keygen'
>
> Only DSA- and RSA-type keys can be used with the NCS SSH daemon, as
> generated by 'ssh-keygen' with the '-t dsa' and '-t rsa' switches,
> respectively.
>
> The key must be stored with an empty passphrase, and with the name
> 'ssh_host_dsa_key' if it is a DSA-type key, and with the name
> 'ssh_host_rsa_key' if it is an RSA-type key.
>
> The SSH server will advertise support for those key types for which
> there is a key file available and for which the required algorithm is
> enabled, see the /ncs-config/ssh/algorithms/server-host-key leaf.

/ncs-config/aaa/ssh-pubkey-authentication (none \| local \| system) \[system\]  
> Controls how the NCS SSH daemon locates the user keys for public key
> authentication.
>
> If set to 'none', public key authentication is disabled.
>
> If set to 'local', and the user exists in /aaa/authentication/users,
> the keys in the user's 'ssh_keydir' directory are used.
>
> If set to 'system', the user is first looked up in
> /aaa/authentication/users, but only if
> /ncs-config/aaa/local-authentication/enabled is set to 'true' - if
> local-authentication is disabled, or the user does not exist in
> /aaa/authentication/users, but the user does exist in the OS password
> database, the keys in the user's \$HOME/.ssh directory are used.

/ncs-config/aaa/default-group (string)  
> If the group of a user cannot be found in the AAA sub-system, a logged
> in user will end up as a member of the default group (if specified).
> If a user logs in and the group membership cannot be established, the
> user will have zero access rights.

/ncs-config/aaa/auth-order (string)  
> The default order for authentication is 'local-authentication pam
> external-authentication'. It is possible to change this order through
> this parameter

/ncs-config/aaa/validation-order (string)  
> By default the AAA system will try token validation for a user by the
> external-validation configurables, as that is the only one currently
> available - i.e. an external program is invoked to validate the token.
>
> The default is thus:
>
> <div class="informalexample">
>
>     'external-validation'
>
> </div>

/ncs-config/aaa/challenge-order (string)  
> By default the AAA system will try the challenge mechanisms for a user
> by the challenge configurables, invoking them in order to authenticate
> the challenge id and response.
>
> The default is:
>
> <div class="informalexample">
>
>     'external-challenge, package-challenge'
>
> </div>

/ncs-config/aaa/expiration-warning (ignore \| display \| prompt) \[ignore\]  
> When PAM or external authentication is used, the authentication
> mechanism may give a warning that the user's password is about to
> expire. This parameter controls how the NCS daemon processes that
> warning message.
>
> If set to 'ignore', the warning is ignored.
>
> If set to 'display', interactive user interfaces will display the
> warning message at login time.
>
> If set to 'prompt', interactive user interfaces will display the
> warning message at login time, and require that the user acknowledges
> the message before proceeding.

/ncs-config/aaa/audit-user-name (known \| never) \[known\]  
> Controls the logging of the user name when a failed authentication
> attempt is logged to the audit log.
>
> If set to "known", the user name is only logged when it is known to be
> valid (i.e. when attempting local-authentication and the user exists
> in /aaa/authentication/users), otherwise it is logged as
> "\[withheld\]".
>
> If set to "never", the user name is always logged as "\[withheld\]".

/ncs-config/aaa/max-password-length (uint16) \[1024\]  
> The maximum length of the cleartext password for all forms of password
> authentication. Authentication attempts using a longer password are
> rejected without attempting verification.
>
> The hashing algorithms used for password verification, in particular
> those based on sha-256 and sha-512, require extremely high amounts of
> CPU usage when verification of very long passwords is attempted.

/ncs-config/aaa/pam  
> If PAM is to be used for login the NCS daemon typically must run as
> root.

/ncs-config/aaa/pam/enabled (boolean) \[false\]  
> When set to 'true', NCS uses PAM for authentication.

/ncs-config/aaa/pam/service (string) \[common-auth\]  
> The PAM service to be used for the login NETCONF/SSH CLI procedure.
> This can be any service we have installed in the /etc/pam.d directory.
> Different unices have different services installed under /etc/pam.d -
> choose a service which makes sense or create a new one.

/ncs-config/aaa/pam/timeout (xs:duration) \[PT10S\]  
> The maximum time that authentication will wait for a reply from PAM.
> If the timeout is reached, the PAM authentication will fail, but
> authentication attempts may still be done with other mechanisms as
> configured for /ncs-config/aaa/authOrder. Default is PT10S, i.e. 10
> seconds.

/ncs-config/aaa/restconf/auth-cache-ttl (xs:duration) \[PT10S\]  
> The amount of time that RESTCONF locally caches authentication
> credentials before querying the AAA server. Default is PT10S, i.e. 10
> seconds. Setting to PT0S, i.e. 0 seconds, effectively disables the
> authentication cache.

/ncs-config/aaa/restconf/enable-auth-cache-client-ip (boolean) \[false\]  
> If enabled, a clients source IP address will also be stored in the
> RESTCONF authentication cache.

/ncs-config/aaa/single-sign-on/enabled (boolean) \[false\]  
> When set to 'true' Single Sign-On (SSO) functionality is enabled for
> NCS.
>
> SSO is a valid authentication method for webui and JSON-RPC
> interfaces.
>
> The endpoint for SSO in NCS is hardcoded to '/sso'.
>
> The SSO functionality needs package-authentication to be enabled in
> order to work.

/ncs-config/aaa/single-sign-on/enable-automatic-redirect (boolean) \[false\]  
> When set to 'true' and there is only a single Authentication Package
> which has SSO enabled (has an SSO URL) a request to the servers root
> will be redirected to that URL.

/ncs-config/aaa/package-authentication/enabled (boolean) \[false\]  
> When set to 'true', package authentication is used.
>
> The package needs to have an executable in 'scripts/authenticate'
> which adheres to the package authentication API in order to be used by
> the package authentication.

/ncs-config/aaa/package-authentication/package-challenge/enabled (boolean) \[false\]  
> When set to 'true', package challenge is used.
>
> The package needs to have an executable in 'scripts/challenge' which
> adheres to the package challenge API in order to be used by the
> package challenge authentication.

/ncs-config/aaa/package-authentication/packages  
> Specifies the authentication packages to be used by the server as a
> whitespace separated list from the loaded authentication package
> names. If there are multiple packages, the order of the package names
> is the order they will be tried for authentication requests.

/ncs-config/aaa/package-authentication/packages/package (string)  
> The name of the authentication package.

/ncs-config/aaa/package-authentication/packages/display-name (string)  
> The display name of the authentication package.
>
> If no display-name is set, the package name will be used.

/ncs-config/aaa/external-authentication/enabled (boolean) \[false\]  
> When set to 'true', external authentication is used.

/ncs-config/aaa/external-authentication/executable (string)  
> If we enable external authentication, an executable on the local host
> can be launched to authenticate a user. The executable will receive
> the username and the cleartext password on its standard input. The
> format is '\[\${USER};\${PASS};\]\n'. For example if user is 'bob' and
> password is 'secret', the executable will receive the line
> '\[bob;secret;\]' followed by a newline on its standard input. The
> program must parse this line.
>
> The task of the external program, which for example could be a RADIUS
> client is to authenticate the user and also provide the user to groups
> mapping. So if 'bob' is member of the 'oper' and the 'lamers' group,
> the program should echo 'accept oper lamers' on its standard output.
> If the user fails to authenticate, the program should echo 'reject
> \${reason}' on its standard output.

/ncs-config/aaa/external-authentication/use-base64 (boolean) \[false\]  
> When set to 'true', \${USER} and \${PASS} in the data passed to the
> executable will be base64-encoded, allowing e.g. for the password to
> contain ';' characters. For example if user is 'bob' and password is
> 'secret', the executable will receive the string '\[Ym9i;c2VjcmV0;\]'
> followed by a newline.

/ncs-config/aaa/external-authentication/include-extra (boolean) \[false\]  
> When set to 'true', additional information items will be provided to
> the executable: source IP address and port, context, and protocol.
> I.e. the complete format will be
> '\[\${USER};\${PASS};\${IP};\${PORT};\${CONTEXT};\${PROTO};\]\n'.
> Example: '\[bob;secret;192.168.1.1;12345;cli;ssh;\]\n'.

/ncs-config/aaa/local-authentication/enabled (boolean) \[true\]  
> When set to true, NCS uses local authentication. That means that the
> user data kept in the aaa namespace is used to authenticate users.
> When set to false some other authentication mechanism such as PAM or
> external authentication must be used.

/ncs-config/aaa/authentication-callback/enabled (boolean) \[false\]  
> When set to true, NCS will invoke an application callback when
> authentication has succeeded or failed. The callback may reject an
> otherwise successful authentication. If the callback has not been
> registered, all authentication attempts will fail. See Javadoc for
> DpAuthCallback for the callback details.

/ncs-config/aaa/external-validation/enabled (boolean) \[false\]  
> When set to 'true', external token validation is used.

/ncs-config/aaa/external-validation/executable (string)  
> If we enable external token validation, an executable on the local
> host can be launched to validate a user. The executable will receive a
> cleartext token on its standard input. The format is
> '\[\${TOKEN};\]\n'. For example if the token is '7ea345123', the
> executable will receive the string '\[7ea345123;\]' followed by a
> newline on its standard input. The program must parse this line.
>
> The task of the external program, which for example could be a FUSION
> client, is to validate the token and also provide the token to user
> and groups mappings. Refer to the External Token Validation section of
> the documentation for the details of how the program should report the
> result back to NCS.

/ncs-config/aaa/external-validation/use-base64 (boolean) \[false\]  
> When set to true, \${TOKEN} in the data passed to the executable will
> be base64-encoded, allowing e.g. for the token to contain ';'
> characters.

/ncs-config/aaa/external-validation/include-extra (boolean) \[false\]  
> When set to true, additional information items will be provided to the
> executable: source IP address and port, context, and protocol. I.e.
> the complete format will be
> '\[\${TOKEN};\${IP};\${PORT};\${CONTEXT};\${PROTO};\]\n'. Example:
> '\[7ea345123;192.168.1.1;12345;cli;ssh;\]\n'.

/ncs-config/aaa/validation-callback/enabled (boolean) \[false\]  
> When set to true, NCS will invoke an application callback when
> validation has succeeded or failed. The callback may reject an
> otherwise successful validation. If the callback has not been
> registered, all validation attempts will fail.

/ncs-config/aaa/external-challenge/enabled (boolean) \[false\]  
> When set to 'true', the external challenge mechanism is used.

/ncs-config/aaa/external-challenge/executable (string)  
> If we enable the external challenge mechanism, an executable on the
> local host can be launched to authenticate a user. The executable will
> receive a cleartext token on its standard input. The format is
> '\[\${CHALL-ID};\${RESPONSE};\]\n'. For example if the challenge id is
> '6yu125' and the response is '989yuey', the executable will receive
> the string '\[6yu125;989yuey;\]' followed by a newline on its standard
> input. The program must parse this line.
>
> The task of the external program, which for example could be a RADIUS
> client, is to authenticate the combination of the challenge id and the
> response, and also provide a mapping to user and groups. Refer to the
> External challenge section of the AAA chapter in the User Guide for
> the details of how the program should report the result back to NCS.

/ncs-config/aaa/external-challenge/use-base64 (boolean) \[false\]  
> When set to true, \${CHALL-ID} and\${RESPONSE} in the data passed to
> the executable will be base64-encoded, allowing e.g. for them to
> contain ';' characters.

/ncs-config/aaa/external-challenge/include-extra (boolean) \[false\]  
> When set to true, additional information items will be provided to the
> executable: source IP address and port, context, and protocol. I.e.
> the complete format will be
> '\[\${CHALL-ID};\${RESPONSE};\${IP};\${PORT};\${CONTEXT};\${PROTO};\]\n'.
> Example: '\[6yu125;989yuey;192.168.1.1;12345;cli;ssh;\]\n'.

/ncs-config/aaa/challenge-callback/enabled (boolean) \[false\]  
> When set to true, NCS will invoke an application callback when the
> challenge machanism has succeeded or failed. The callback may reject
> an otherwise successful authentication. If the callback has not been
> registered, all challenge mechnism attempts will fail.

/ncs-config/aaa/authorization/enabled (boolean) \[true\]  
> When set to false, all authorization checks are turned off, similar to
> the -noaaa flag in ncs_cli.

/ncs-config/aaa/authorization/callback/enabled (boolean) \[false\]  
> When set to true, NCS will invoke application callbacks for
> authorization. If the callbacks have not been registered, all
> authorization checks will be rejected. See Javadoc for
> DpAuthorizationCallback for the callback details.

/ncs-config/aaa/authorization/nacm-compliant (boolean) \[true\]  
> In earlier versions, NCS did not fully comply with the NACM
> specification: the 'module-name' leaf was required to match toplevel
> nodes, but it was not considered for the node being accessed. If this
> leaf is set to false, this non-compliant behavior remains - this
> setting is only provided for backward compatibility with existing rule
> sets, and is not recommended.

/ncs-config/aaa/namespace (string) \[http://tail-f.com/ns/aaa/1.1\]  
> If we want to move the AAA data into another userdefine namespace, we
> indicate that here.

/ncs-config/aaa/prefix (string) \[/\]  
> If we want to move the AAA data into another userdefined namespace, we
> indicate the prefix path in that namespace where the NCS AAA namespace
> has been mounted.

/ncs-config/aaa/action-input-rules  
> Configuration of NACM action input statements.

/ncs-config/aaa/action-input-rules/enabled (boolean) \[false\]  
> Allows NACM rules to be set for individual action input leafs.

/ncs-config/rollback  
> Settings controlling if and where rollback files are created. A
> rollback file contains the data required to restore the changes that
> were made when the rollback was created.

/ncs-config/rollback/enabled (boolean) \[false\]  
> When set to true a rollback file will be created whenever the running
> configuration is modified.

/ncs-config/rollback/directory (string)  
> This parameter is mandatory.
>
> Location where rollback files will be created.

/ncs-config/rollback/history-size (uint32) \[35\]  
> Number of old rollback files to save.

/ncs-config/checkpoint  
> Configurations for creating transaction checkpoints in the concurrency
> model.

/ncs-config/checkpoint/max-write-set-size (uint32 \| infinity) \[128\]  
> Maximum size of a write set in Megabytes

/ncs-config/checkpoint/max-read-set-size (uint32 \| infinity) \[128\]  
> Maximum size of a read set in Megabytes

/ncs-config/checkpoint/total-size-limit (uint32 \| infinity) \[infinity\]  
> Total size limit of read and write set in Megabytes.

/ncs-config/ssh  
> This section defines settings which affect the behavior of the SSH
> server built into NCS.

/ncs-config/ssh/idle-connection-timeout (xs:duration) \[PT10M\]  
> The maximum time that an authenticated connection to the SSH server is
> allowed to exist without open channels. If the timeout is reached, the
> SSH server closes the connection. Default is PT10M, i.e. 10 minutes.
> If the value is 0, there is no timeout.

/ncs-config/ssh/algorithms  
> This section defines custom lists of algorithms to be usable with the
> built-in SSH implementation.
>
> For each type of algorithm, an empty value means that all supported
> algorithms should be usable, and a non-empty value (a comma-separated
> list of algorithm names) means that the intersection of the supported
> algorithms and the configured algorithms should be usable.

/ncs-config/ssh/algorithms/server-host-key (string) \[ssh-ed25519,ecdsa-sha2-nistp256\]  
> The supported serverHostKey algorithms (if implemented in libcrypto)
> are "ecdsa-sha2-nistp521", "ecdsa-sha2-nistp384",
> "ecdsa-sha2-nistp256", "ssh-ed25519", "ssh-rsa", "rsa-sha2-256",
> "rsa-sha2-512" and "ssh-dss" but for any SSH server, it is limited to
> those algorithms for which there is a host key installed in the
> directory given by /ncs-config/aaa/ssh-server-key-dir.
>
> To limit the usable serverHostKey algorithms to "ssh-dss", set this
> value to "ssh-dss" or avoid installing a key of any other type than
> ssh-dss in the sshServerKeyDir.

/ncs-config/ssh/algorithms/kex (string) \[curve25519-sha256,ecdh-sha2-nistp256,diffie-hellman-group14-sha256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,diffie-hellman-group16-sha512,diffie-hellman-group-exchange-sha256\]  
> The supported key exchange algorithms (as long as their hash functions
> are implemented in libcrypto) are "ecdh-sha2-nistp521",
> "ecdh-sha2-nistp384", "ecdh-sha2-nistp256", "curve25519-sha256",
> "diffie-hellman-group14-sha256", "diffie-hellman-group14-sha1",
> "diffie-hellman-group16-sha512",
> "diffie-hellman-group-exchange-sha256".
>
> To limit the usable key exchange algorithms to
> "diffie-hellman-group14-sha1" and "diffie-hellman-group14-sha256" (in
> that order) set this value to "diffie-hellman-group14-sha1,
> diffie-hellman-group14-sha256".

/ncs-config/ssh/algorithms/dh-group  
> Range of allowed group size, the SSH server responds to the client
> during a "diffie-hellman-group-exchange". The range will be the
> intersection of what the client requests, if there is none the key
> exchange will be aborted.

/ncs-config/ssh/algorithms/dh-group/min-size (dh-group-size-type) \[2048\]  
> Minimal size of p in bits.

/ncs-config/ssh/algorithms/dh-group/max-size (dh-group-size-type) \[4096\]  
> Maximal size of p in bits.

/ncs-config/ssh/algorithms/mac (string) \[hmac-sha2-256,hmac-sha1,hmac-sha2-512\]  
> The supported mac algorithms (if implemented in libcrypto) are
> "hmac-sha1", "hmac-sha2-256" and "hmac-sha2-512".

/ncs-config/ssh/algorithms/encryption (string) \[aes128-gcm@openssh.com,chacha20-poly1305@openssh.com,aes128-ctr,aes256-ctr,aes256-gcm@openssh.com,aes192-ctr\]  
> The supported encryption algorithms (if implemented in libcrypto) are
> "aes128-gcm@openssh.com", "chacha20-poly1305@openssh.com",
> "aes128-ctr", "aes192-ctr", "aes256-ctr", "aes128-cbc",
> "aes256-gcm@openssh.com", "aes256-cbc" and "3des-cbc".

/ncs-config/ssh/client-alive-interval (xs:duration \| infinity) \[PT20S\]  
> If no data has been received from a connected client for this long, a
> request that requires a response from the client will be sent over the
> SSH transport.
>
> NOTE: Configuring a client-alive-interval to 'infinity' is not
> recommended. This as a non 'infinity' value is a protection against
> stale SSH connections. Depending on which activity has been carried
> out over a connection (NETCONF notification subscriptions or NETCONF
> locking in particular) a stale connection can lead to memory
> allocation growth or prevention of any transactions to be committed in
> NSO for as long as the connection appears to be up.

/ncs-config/ssh/client-alive-count-max (uint32) \[3\]  
> If no data has been received from the client, after this many
> consecutive client-alive-interval has passed, the connection will be
> dropped.

/ncs-config/ssh/parallel-login (boolean) \[false\]  
> By default parallel logins are disabled and will block more than one
> password authenticated session from seeing the password prompt. If
> enabled, then up to max_sessions minus active authenticated sessions
> will be shown password prompts.

/ncs-config/ssh/rekey-limit  
> This section defines when the local peer will initiate the SSH
> rekeying procedure. Setting both values to 0 will disable rekeying
> from local side entirely. Note, that rekeying initiated by the other
> peer will still be performed

/ncs-config/ssh/rekey-limit/bytes (uint64) \[10737418240\]  
> The limit of transferred data, after which the rekeying is to be
> initiated. The limit check occurs every minute. A positive value in
> bytes, default is 10737418240 for 1 GB. Value 0 means rekeying will
> not trigger after any amount of transferred data.

/ncs-config/ssh/rekey-limit/minutes (uint32) \[60\]  
> The limit of time, after which the rekeying is to be initiated. A
> positive value greater than 0, default is 60 for 1 hour. Value 0 means
> rekeying will not trigger after any time duration.

/ncs-config/cli  
> CLI parameters.

/ncs-config/cli/enabled (boolean) \[true\]  
> When set to true, the CLI server is started.

/ncs-config/cli/enable-cli-cache (boolean) \[true\]  
> enable-cli-cache is either 'true' or 'false'. If 'true' the CLI will
> operate with a builtin caching mechanism to speed up some of its
> operations. This is the default and preferred method. Only turn this
> off for very special cases.

/ncs-config/cli/allow-implicit-wildcard (boolean) \[true\]  
> When set to true, users do not need to explicitly type \* in the place
> of keys in lists, in order to see all list instances. When set to
> false, users have to explicitly type \* to see all list instances.
>
> This option can be set to 'false', to help in the case where tab
> completion in the CLI takes long time when performed on lists with
> many instances.

/ncs-config/cli/enable-last-login-banner (boolean) \[true\]  
> When set to 'true', the last-login-counter is enabled and displayed in
> the CLI during login.

/ncs-config/cli/completion-show-max (cli-max) \[100\]  
> Maximum number of possible alternatives for the CLI to present when
> doing completion.

/ncs-config/cli/style (j \| c)  
> Style is either 'j', 'c', or 'i'. If 'j', then the CLI will be
> presented as a Juniper style CLI. If 'c' then the CLI will appear as
> Cisco XR style, and if 'i' then a Cisco IOS style CLI will be
> rendered.

/ncs-config/cli/ssh/enabled (boolean) \[true\]  
> enabled is either 'true' or 'false'. If 'true' the NCS CLI will use
> the built in SSH server.

/ncs-config/cli/ssh/ip (ipv4-address \| ipv6-address) \[0.0.0.0\]  
> ip is an IP address which the NCS CLI should listen on for SSH
> connections. '0.0.0.0' or '::' means that it listens on the port
> (/ncs-config/cli/ssh/port) for all IPv4 or IPv6 addresses on the
> machine.

/ncs-config/cli/ssh/port (port-number) \[2024\]  
> The port number for CLI SSH

/ncs-config/cli/ssh/use-keyboard-interactive (boolean) \[false\]  
> Need to be set to true if using challenge/response authentication for
> CLI SSH.

/ncs-config/cli/ssh/banner (string) \[\]  
> banner is a string that will be presented to the client before
> authenticating when logging in to the CLI via the built-in SSH server.

/ncs-config/cli/ssh/banner-file (string) \[\]  
> banner-file is the name of a file whose contents will be presented
> (after any string given by the banner directive) to the client before
> authenticating when logging in to the CLI via the built-in SSH server.

/ncs-config/cli/ssh/extra-listen  
> A list of additional IP address and port pairs which the NCS CLI
> should also listen on for SSH connections. Set the ip as '0.0.0.0' or
> '::' to listen on the port for all IPv4 or IPv6 addresses on the
> machine.

/ncs-config/cli/ssh/extra-listen/ip (ipv4-address \| ipv6-address)  
> 

/ncs-config/cli/ssh/extra-listen/port (port-number)  
> 

/ncs-config/cli/ssh/ha-primary-listen  
> When /ncs-config/ha/enable or /ncs-config/ha-raft/enable is set to
> 'true' and the current NCS node is active (i.e. primary/leader), then
> NCS will listen(2) to the following IPv4 or IPv6 addresses and ports.
> Once the previously active high-availability node transitions to a
> different role, then NCS will shutdown these listen addresses and
> terminate any ongoing traffic.

/ncs-config/cli/ssh/ha-primary-listen/ip (ipv4-address \| ipv6-address)  
> 

/ncs-config/cli/ssh/ha-primary-listen/port (port-number)  
> 

/ncs-config/cli/top-level-cmds-in-sub-mode (boolean) \[false\]  
> topLevelCmdsInSubMode is either 'true' or 'false'. If set to 'true'
> all top level commands in I and C-style CLI are available in sub
> modes.

/ncs-config/cli/completion-meta-info (false \| alt1 \| alt2) \[false\]  
> completionMetaInfo is either 'false', 'alt1' or 'alt2'. If set to
> 'alt1' then the alternatives shown for possible completions will be
> prefixed as follows:
>
> <div class="informalexample">
>
>     containers with >
>     lists with +
>     leaf-lists with +
>
> </div>
>
> For example:
>
> <div class="informalexample">
>
>     Possible completions:
>     ...
>     > applications
>     + apply-groups
>     ...
>     + dns-servers
>     ...
>
> </div>
>
> If set to 'alt2', then possible completions will be prefixed as
> follows:
>
> <div class="informalexample">
>
>     containers with >
>     lists with children with +>
>     lists without children +
>
> </div>
>
> For example:
>
> <div class="informalexample">
>
>     Possible completions:
>     ...
>     > applications
>     +>apply-groups
>     ...
>     + dns-servers
>     ...
>
> </div>

/ncs-config/cli/allow-abbrev-keys (boolean) \[false\]  
> allowAbbrevKeys is either 'true' or 'false'. If 'false' then key
> elements are not allowed to be abbreviated in the CLI. This is
> relevant in the J-style CLI when using the commands 'delete' and
> 'edit'. In the C/I-style CLIs when using the commands 'no', 'show
> configuration' and for commands to enter submodes.

/ncs-config/cli/action-call-no-list-instance (deny-call \| create-instance) \[deny-call\]  
> action-call-no-list-instance can be set to either 'deny-call', or
> 'create-instance'. If attempting to call an action placed in a non
> existing list instance, 'deny-call' will give an error.
> 'create-instance' will create the missing list instance and
> subsequently call the action. This is only effective in configuration
> mode in C-style CLI

/ncs-config/cli/allow-abbrev-enums (boolean) \[false\]  
> allowAbbrevEnums is either 'true' or 'false'. If 'false' then enums
> entered in the CLI cannot be abbreviated.

/ncs-config/cli/allow-case-insensitive-enums (boolean) \[false\]  
> allowCaseInsensitiveEnums is either 'true' or 'false'. If 'false' then
> enums entered in the CLI must match in case, ie you cannot enter FALSE
> if the CLI asks for 'true' or 'false'.

/ncs-config/cli/j-align-leaf-values (boolean) \[true\]  
> j-align-leaf-values is either 'true' or 'false'. If 'true' then the
> leaf values of all siblings in a container or list will be aligned.

/ncs-config/cli/c-align-leaf-values (boolean) \[true\]  
> c-align-leaf-values is either 'true' or 'false'. If 'true' then the
> leaf values of all siblings in a container or list will be aligned.

/ncs-config/cli/c-config-align-leaf-values (boolean) \[true\]  
> c-align-leaf-values is either 'true' or 'false'. If 'true' then the
> leaf values of all siblings in a container or list will be aligned
> when displaying configuration.

/ncs-config/cli/enter-submode-on-leaf (boolean) \[true\]  
> enterSubmodeOnLeaf is either 'true' or 'false'. If set to 'true' (the
> default) then setting a leaf in a submode from a parent mode results
> in entering the submode after the command has completed. If set to
> 'false' then an explicit command for entering the submode is needed.
> For example, if running the command
>
> interface FastEthernet 1/1/1 mtu 1400
>
> from the top level in config mode. If enterSubmodeOnLeaf is true the
> CLI will end up in the 'interface FastEthernet 1/1/1' submode after
> the command execution. If set to 'false' then the CLI will remain at
> the top level. To enter the submode when set to 'false' the command
>
> interface FastEthernet 1/1/1
>
> is needed. Applied to the C-style CLI.

/ncs-config/cli/table-look-ahead (int64) \[50\]  
> The tableLookAhead element tells the system how many rows to pre-fetch
> when displaying a table. The prefetched rows are used for calculating
> the required column widths for the table. If set to a small number it
> is recommended to explicitly configure the column widhts in the
> clispec file.

/ncs-config/cli/default-table-behavior (dynamic \| suppress \| enforce) \[suppress\]  
> defaultTableBehavior is either 'dynamic', 'suppress', or 'enforce'. If
> set to 'dynamic' then list nodes will be displayed as tables if the
> resulting table will fit on the screen. If set to 'suppress', then
> list nodes will not be displayed as tables unless a table has been
> specified by some other means (ie through a setting in the
> clispec-file or through a command line parameter). If set to 'enforce'
> then list nodes will always be displayed as tables unless otherwise
> specified in the clispec-file or on the command line.

/ncs-config/cli/more-buffer-lines (uint32 \| unbounded) \[unbounded\]  
> moreBufferLines is used to limit the buffering done by the more
> process. It can be 'unbounded' or a possitive integer describing the
> maximum number of lines to buffer.

/ncs-config/cli/show-all-ns (boolean) \[false\]  
> If showAllNs is true then all elem names will be prefixed with the
> namespace prefix in the CLI. This is visible when setting values and
> when showing the configuration

/ncs-config/cli/show-action-completions (boolean) \[false\]  
> If set to 'true' then the action completions will be displayed
> separated.

/ncs-config/cli/action-completions-format (string) \[Action completions:\]  
> action-completions-format is the string displayed before the
> displaying the action completion possibilities.

/ncs-config/cli/suppress-fast-show (boolean) \[false\]  
> suppressFastShow is either 'true' or 'false'. If 'true' then the fast
> show optimization will be suppressed in the C-style CLI. The fast show
> optimization is somewhat experimental and may break certain
> operations.

/ncs-config/cli/use-expose-ns-prefix (boolean) \[false\]  
> If 'true' then all nodes annotated with the tailf:cli-expose-ns-prefix
> will result in the namespace prefix being shown/required. If set to
> 'false' then the tailf:cli-expose-ns-prefix annotation will be
> ignored. The container /devices/device/config has this annotation.

/ncs-config/cli/show-defaults (boolean) \[false\]  
> show-defaults is either 'true' or 'false'. If 'true' then default
> values will be shown when displaying the configuration. The default
> value is shown inside a comment on the same line as the value. Showing
> default values can also be enabled in the CLI per session using the
> operational mode command 'set show defaults true'.

/ncs-config/cli/default-prefix (string) \[\]  
> default-prefix is a string that is placed in front of the default
> value when a configuration is shown with default values as comments.

/ncs-config/cli/timezone (utc \| local) \[local\]  
> Time in the CLI can be either local, as configured on the host, or
> UTC.

/ncs-config/cli/with-defaults (boolean) \[false\]  
> withDefaults is either 'true' or 'false'. If 'false' then leaf nodes
> that have their default values will not be shown when the user
> displays the configuration, unless the user gives the 'details' option
> to the 'show' command.
>
> This is useful when there are many settings which are seldom used.
> When set to 'false' only the values actually modified by the user will
> be shown.

/ncs-config/cli/banner (string) \[\]  
> Banner shown to the user when the CLI is started. Default is empty.

/ncs-config/cli/banner-file (string) \[\]  
> File whose contents are shown to the user (after any string set by the
> 'banner' directive) when the CLI is started. Default is empty.

/ncs-config/cli/prompt1 (string) \[\u@\h\M\> \]  
> Prompt used in operational mode.
>
> This string is not validated to be legal UTF-8, for details see
> /ncs-config/validate-utf8.
>
> The string may contain a number of backslash-escaped special
> characters which are decoded as follows:
>
> <div class="informalexample">
>
>     \[ and \]
>         Enclosing sections of the prompt in \[ and \] makes
>         that part not count when calculating the width of the
>         prompt. This makes sense, for example, when including
>         non-printable characters, or control codes that are
>         consumed by the terminal. The common control codes for
>         setting text properties for vt100/xterm are ignored
>         automatically, so are control characters. Updating the
>         xterm title can be done using a control sequence that
>         may look like this:
>             <prompt1>\[&#x1b;]0;\u@\h&#x07;\]\u@\h&gt; </prompt1>
>     \d
>        the date in 'YYYY-MM-DD' format (e.g., '2006-01-18')
>     \h
>        the hostname up to the first '.' (or delimiter as defined
>        by promptHostnameDelimiter)
>     \H
>        the hostname
>     \s
>        the client source ip
>     \S
>        the name provided by the -H argument to ncs_cli
>     \t
>        the current time in 24-hour HH:MM:SS format
>     \T
>        the current time in 12-hour HH:MM:SS format
>     \@
>        the current time in 12-hour am/pm format
>     \A
>        the current time in 24-hour HH:MM format
>     \u
>        the username of the current user
>     \m
>        the mode name (only used in XR style)
>     \m{N}
>        same as \m, but the number of trailing components in
>        the displayed path is limited to be max N (an integer).
>        Characters removed are replaced with an ellipsis (...).
>     \M
>        the mode name inside parenthesis if in a mode
>     \M{N}
>        same as \M, but the number of trailing components in
>        the displayed path is limited to be max N (an integer).
>        Characters removed are replaced with an ellipsis (...).
>
> </div>

/ncs-config/cli/prompt2 (string) \[\u@\h\M% \]  
> Prompt used in configuration mode.
>
> This string is not validated to be legal UTF-8, for details see
> /ncs-config/validate-utf8.
>
> The string may contain a number of backslash-escaped special
> characters which are decoded as described for prompt1.

/ncs-config/cli/c-prompt1 (string) \[\u@\h\M\> \]  
> Prompt used in operational mode in the Cisco XR style CLI.
>
> This string is not validated to be legal UTF-8, for details see
> /ncs-config/validate-utf8.
>
> The string may contain a number of backslash-escaped special
> characters which are decoded as described for prompt1.

/ncs-config/cli/c-prompt2 (string) \[\u@\h\M% \]  
> Prompt used in configuration mode in the Cisco XR style CLI.
>
> This string is not validated to be legal UTF-8, for details see
> /ncs-config/validate-utf8.
>
> The string may contain a number of backslash-escaped special
> characters which are decoded as described for prompt1.

/ncs-config/cli/prompt-hostname-delimiter (string) \[.\]  
> When the \h token is used in a prompt the first part of the hostname
> up until the first occurance of the promptHostnameDelimiter is used.

/ncs-config/cli/idle-timeout (xs:duration) \[PT30M\]  
> Maximum idle time before terminating a CLI session. Default is PT30M,
> ie 30 minutes.

/ncs-config/cli/prompt-sessions-cli (boolean) \[false\]  
> promptSessionsCLI is either 'true' or 'false'. If set to 'true' then
> only the current CLI sessions will be displayed when the user tries to
> start a new CLI session and the maximum number of sessions has been
> reached. Note that MAAPI sessions with their context set to 'cli'
> would be regarded as CLI sessions and would be listed as such.

/ncs-config/cli/suppress-ned-errors (boolean) \[false\]  
> Suppress errors from NED devices. Make log-communication between ncs
> and its devices more silent. Be cautious with this option since errors
> that might be interesting can get suppressed as well.

/ncs-config/cli/disable-idle-timeout-on-cmd (boolean) \[true\]  
> disable-idle-timeout-on-cmd is either 'true' or 'false'. If set to
> 'false' then the idle timeout will trigger even when a command is
> running in the CLI. If set to 'true' the idle timeout will only
> trigger if the user is idling at the CLI prompt.

/ncs-config/cli/command-timeout (xs:duration \| infinity) \[infinity\]  
> Global command timeout. Terminate command unless the command has
> completed within the timeout. It is generally a bad idea to use this
> feature since it may have undesirable effects in a loaded system where
> normal commands take longer to complete than usual.
>
> This timeout can be overridden by a command specific timeout specified
> in the ncs.cli file.

/ncs-config/cli/space-completion/enabled (boolean)  
> 

/ncs-config/cli/ignore-leading-whitespace (boolean)  
> If 'false' then the CLI will show completion help when the user enters
> TAB or SPACE as the first characters on a row. If set to 'true' then
> leading SPACE and TAB are ignored. The user can enter '?' to get a
> list of possible alternatives. Setting the value to 'true' makes it
> easier to paste scripts into the CLI.

/ncs-config/cli/auto-wizard  
> Default value for autowizard in the CLI. The user can always enable or
> disable the auto wizard in each session, this controls the initial
> session value.

/ncs-config/cli/auto-wizard/enabled (boolean) \[true\]  
> enabled is either 'true' or 'false'. If 'true' the CLI will prompt the
> user for required attributes when a new identifier is created.

/ncs-config/cli/restricted-file-access (boolean) \[false\]  
> restricted-file-access is either 'true' or 'false'. If 'true' then a
> CLI user will not be able to access files and directories outside the
> home directory tree.

/ncs-config/cli/restricted-file-regexp (string) \[\]  
> restricted-file-regexp is either an empty string or an regular
> expression (AWK style). If not empty then all files and directories
> created or accessed must match the regular expression. This can be
> used to ensure that certain symbols does not occur in created files.

/ncs-config/cli/history-save (boolean) \[true\]  
> If set to 'true' then the CLI history will be saved between CLI
> sessions. The history is stored in the state directory.

/ncs-config/cli/history-remove-duplicates (boolean) \[false\]  
> If set to 'true' then repeated commands in the CLI will only be stored
> once in the history. Each invocation of the command will only update
> the date of the last entry. If set to 'false' duplicates will be
> stored in the history.

/ncs-config/cli/history-max-size (int64) \[1000\]  
> Sets maximum configurable history size.

/ncs-config/cli/message-max-size (int64) \[10000\]  
> Maximum size of user message.

/ncs-config/cli/show-commit-progress (boolean) \[true\]  
> show-commit-progress can be either 'true' or 'false'. If set to 'true'
> then the commit operation in the CLI will provide some progress
> information.

/ncs-config/cli/commit-message (boolean) \[true\]  
> CLI prints out a message when a commit is executed

/ncs-config/cli/use-double-dot-ranges (boolean) \[true\]  
> useDoubleDotRanges is either 'true' or 'false'. If 'true' then range
> expressions are types as 1..3, if set to 'false' then ranges are given
> as 1-3.

/ncs-config/cli/allow-range-expression-all-types (boolean) \[true\]  
> allowRangeExpressionAllTypes is either 'true' or 'false'. If 'true'
> then range expressions are allowed for all key values regardless of
> type.

/ncs-config/cli/suppress-range-keyword (boolean) \[false\]  
> suppressRangeKeyword is either 'true' or 'false'. If 'true' then
> 'range' keyword is not allowed in C- and I-style for range
> expressions.

/ncs-config/cli/commit-message-format (string) \[ System message at \$(time)... Commit performed by \$(user) via \$(proto) using \$(ctx). \]  
> The format of the CLI commit messages

/ncs-config/cli/suppress-commit-message-context (string)  
> This parameter may be given multiple times.
>
> A list of contexts for which no commit message shall be displayed. A
> good value is \[ system \] which will make all system generated
> commits to go unnoticed in the CLI. A context is either the name of an
> agent i.e cli, webui, netconf, snmp or any free form text string if
> the transaction is initated from Maapi

/ncs-config/cli/show-subsystem-messages (boolean) \[true\]  
> show-subsystem-messages is either 'true' or 'false'. If 'true' the CLI
> will display a system message whenever a connected daemon is started
> or stopped.

/ncs-config/cli/show-editors (boolean) \[true\]  
> show-editors is either 'true' or 'false'. If set to true then a list
> of current editors will be displayed when a user enters configure
> mode.

/ncs-config/cli/rollback-aaa (boolean) \[false\]  
> If set to true then AAA rules will be applied when a rollback file is
> loaded. This means that rollback may not be possible if some other
> user have made changes that the current user does not have access
> privileges to.

/ncs-config/cli/rollback-numbering (rolling \| fixed) \[fixed\]  
> rollbackNumbering is either 'fixed' or 'rolling'. If set to 'rolling'
> then rollback file '0' will always contain the last commit. When using
> 'fixed' each rollback will get a unique increasing number.

/ncs-config/cli/show-service-meta-data (boolean) \[false\]  
> If set to true, then backpointers and refcounts are displayed by
> default when showing the configuration. If set to false, they are not.
> The default can be overridden by the pipe flags 'display service-meta'
> and 'hide service-meta'.

/ncs-config/cli/escape-backslash (boolean) \[false\]  
> escapeBackslash is either 'true' or 'false'. If set to 'true' then
> backslash is escaped in the CLI.

/ncs-config/cli/preserveSemicolon (boolean) \[false\]  
> preserveSemicolon is either 'true' or 'false'. If set to 'true' the
> semicolon is preserved as an ordinary char instead of using the
> semicolon as a keyword to separate CLI statements in the I and C-style
> CLI.

/ncs-config/cli/bypass-allow-abbrev-keys (boolean) \[false\]  
> bypassAllowAbbrevKeys is either 'true' or 'false'. If 'true' then
> /ncs-config/cli/allow-abbrev-keys setting does not take any effect. It
> means that no matter what is set for
> /ncs-config/cli/allow-abbrev-keys, the key elements are not allowed to
> be abbreviated in the CLI. This is relevant in the J-style CLI when
> using the commands 'delete' and 'edit'. In the C/I-style CLIs when
> using the commands 'no', 'show configuration' and for commands to
> enter submodes.

/ncs-config/cli/mode-info-in-aaa (true \| false \| path) \[false\]  
> modeInfoInAAA is either 'true', 'false' or 'path', If 'true', then all
> commands will be prefixed with major and minor mode name when
> processed by the AAA-rules. This means that it is possible to
> differentiate between commands with the same name in different modes.
> Major mode is 'operational' or 'configure' and minor mode is 'top' in
> J-style and the name of the submode in C- and I-mode. On the top-level
> in C- and I-mode it is also 'top'. If set to 'path' the major mode
> will be followed by the full command path to the submode.

/ncs-config/cli/match-completions-search-limit (uint32 \| unbounded) \[50\]  
> match-completions-search-limit is either unbounded or an integer
> value. It determines how many list instances should be looked at in
> order to determine if a leaf should be included in the match
> completions list. It can be very expensive to explore all instances if
> the configuration contains many list instances.

/ncs-config/cli/nmda  
> CLI settings for NMDA.

/ncs-config/cli/nmda/show-operational-state (boolean) \[false\]  
> show-operational-state is either 'true' or 'false'. If 'true', the
> 'operational-state' option to the show command will be available in
> the CLI.
>
> The operational-state option is to display the content of the
> operational datastore.

/ncs-config/cli/allow-brackets-in-no-leaf-list (boolean) \[true\]  
> This parameter controls if the CLI allows brackets when deleting a
> leaf-list.

/ncs-config/cli/commit-prompt  
> Prompt to confirm before commit operation in the CLI. The user can
> always enable or disable the commit prompt in each session. This
> controls the initial session value.

/ncs-config/cli/commit-prompt/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true' the CLI will display
> dry-run output of the configuration changes and prompt the user to
> confirm before a commit operation is performed.

/ncs-config/cli/commit-prompt/dry-run/duration (xs:duration) \[PT0S\]  
> The CLI will not display dry-run output for the same configuration
> changes repeatedly within this time period. The default value is PT0S,
> i.e. 0 seconds, which means the same dry-run output will be shown
> instantly each time before a commit operation is performed.

/ncs-config/cli/commit-prompt/dry-run/outformat (cli \| cli-c \| native \| xml) \[cli\]  
> Format of the dry-run output for the configuration changes which the
> CLI will display before prompting the user to confirm a commit
> operation.

/ncs-config/fips-mode  
> To be able to enable FIPS mode, the FIPS option in the installer needs
> to be choosen. I.e. it is only supported in a FIPS NSO install.

/ncs-config/fips-mode/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', FIPS mode is enabled.

/ncs-config/restconf  
> This section defines settings for the RESTCONF API.

/ncs-config/restconf/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', the RESTCONF API is
> enabled.

/ncs-config/restconf/show-hidden (boolean) \[false\]  
> show-hidden is either 'true' or 'false'. If 'true' all hidden nodes
> will be reachable. If 'false' query parameter ?unhide overrides.

/ncs-config/restconf/root-resource (string) \[restconf\]  
> The RESTCONF root resource path.

/ncs-config/restconf/schema-server-url (string)  
> Change the schema element in the ietf-yang-library:modules-state
> resource response.
>
> It is possible to use the placeholders @X_FORWARDED_HOST@ and
> @X_FORWARDED_PORT@ in order to set the schema URL with HTTP headers
> X-Forwarded-Host and X-Forwarded_Port, e.g.
> https://@X_FORWARDED_HOST@:@X_FORWARDED_PORT@ .

/ncs-config/restconf/token-response  
> When authenticating via AAA external-authentication or
> external-validation and a token is returned, it is possible to include
> a header with the token in the response.

/ncs-config/restconf/token-response/x-auth-token (boolean) \[false\]  
> Either 'true' or 'false'. If 'true', a x-auth-token header is included
> in the response with any token returned from AAA.

/ncs-config/restconf/token-response/token-cookie  
> Configuration of RESTCONF token cookies.

/ncs-config/restconf/token-response/token-cookie/name (string) \[\]  
> The cookie name, exactly as it is to be sent. If configured, a HTTP
> cookie with that name is included in the response with any token
> returned from AAA as value.

/ncs-config/restconf/token-response/token-cookie/directives (string) \[\]  
> An optional string with directives appended to the cookie, exactly as
> it is to be sent.

/ncs-config/restconf/custom-headers  
> The custom-headers element contains any number of header elements,
> with a valid header-field as defined in RFC7230.
>
> The headers will be part of all HTTP responses.

/ncs-config/restconf/custom-headers/header/name (string)  
> 

/ncs-config/restconf/custom-headers/header/value (string)  
> This parameter is mandatory.

/ncs-config/restconf/x-frame-options (DENY \| SAMEORIGIN \| ALLOW-FROM) \[DENY\]  
> By default the X-Frame-Options header is set to DENY for the
> /login.html and /index.html pages. With this header it can be set to
> SAMEORIGIN or ALLOW-FROM instead.

/ncs-config/restconf/x-content-type-options (string) \[nosniff\]  
> The X-Content-Type-Options response HTTP header is a marker used by
> the server to indicate that the MIME types advertised in the
> Content-Type headers should not be changed and be followed. This
> allows to opt-out of MIME type sniffing, or, in other words, it is a
> way to say that the web admins knew what they were doing.
>
> This header is always sent in HTTP responses. By setting the value to
> the empty string will cause the header not to be sent.

/ncs-config/restconf/x-xss-protection (string) \[1; mode=block\]  
> The HTTP X-XSS-Protection response header is a feature of Internet
> Explorer, Chrome and Safari that stops pages from loading when they
> detect reflected cross-site scripting (XSS) attacks. Although these
> protections are largely unnecessary in modern browsers when sites
> implement a strong Content-Security-Policy that disables the use of
> inline JavaScript ('unsafe-inline'), they can still provide
> protections for users of older web browsers that don't yet support
> CSP.
>
> This header is always sent in HTTP responses. By setting the value to
> the empty string will cause the header not to be sent.

/ncs-config/restconf/strict-transport-security (string) \[max-age=31536000; includeSubDomains\]  
> The HTTP Strict-Transport-Security response header (often abbreviated
> as HSTS) lets a web site tell browsers that it should only be accessed
> using HTTPS, instead of using HTTP.
>
> This header is always sent in HTTP responses. By setting the value to
> the empty string will cause the header not to be sent.

/ncs-config/restconf/content-security-policy (string) \[default-src 'self'; style-src 'self' 'nonce-NSO_STYLE_NONCE'; block-all-mixed-content; base-uri 'self'; frame-ancestors 'none';\]  
> The HTTP Content-Security-Policy response header allows web site
> administrators to control resources the user agent is allowed to load
> for a given page.
>
> The default value means that: Resources like fonts, scripts,
> connections, images, and styles will all only load from the same
> origin as the protected resource. All mixed contents will be blocked
> and frame-ancestors like iframes and applets is prohibited. See also:
>
> <div class="informalexample">
>
>       https://www.w3.org/TR/CSP3/
>
> </div>
>
> This header is always sent in HTTP responses. By setting the value to
> the empty string will cause the header not to be sent.

/ncs-config/restconf/cross-origin-embedder-policy (string) \[require-corp\]  
> The HTTP Cross-Origin-Embedder-Policy (COEP) response header
> configures embedding cross-origin resources into the document.
>
> Always sent by default, can be disabled by setting the value to empty
> string.

/ncs-config/restconf/cross-origin-opener-policy (string) \[same-origin\]  
> The HTTP Cross-Origin-Opener-Policy (COOP) response header allows you
> to ensure a top-level document does not share a browsing context group
> with cross-origin documents.
>
> Always sent by default, can be disabled by setting the value to empty
> string.

/ncs-config/restconf/wasm-script-policy-pattern (string) \[(?i)\bwasm\b.\*\\js\$\]  
> The wasmScriptPolicyPattern is a regular expression that matches
> filenames in HTTP requests. If there is a match and the response
> includes a Content-Security-Policy (CSP), the 'script-src' policy is
> updated with the 'wasm-unsafe-eval' directive.
>
> The 'wasm-unsafe-eval' source expression controls the execution of
> WebAssembly. If a page contains a CSP header and the
> 'wasm-unsafe-eval' is specified in the script-src directive, the web
> browser allows the loading and execution of WebAssembly on the page.
>
> Setting the value to an empty string deactivates the match. If you
> still want to allow loading WebAssembly content with this disabled you
> would have to add 'wasm-unsafe-eval' to the 'script-src' rule in the
> CSP header, which. allows it for ALL files.
>
> The default value is a pattern that would case insensitively match any
> filename that contains the word 'wasm' surrounded by at least one
> non-word character (for example ' ', '.' or '-') and has the file
> extension 'js'.
>
> As an example 'dot.wasm.js' and 'WASM-dash.js' would match while
> 'underscore_wasm.js' would not.

/ncs-config/restconf/transport  
> Settings deciding which transport services the RESTCONF server should
> listen on, e.g. TCP and SSL.

/ncs-config/restconf/transport/tcp  
> Settings deciding how the RESTCONF server TCP transport service should
> behave.

/ncs-config/restconf/transport/tcp/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', the RESTCONF server
> uses clear text TCP as a transport service.

/ncs-config/restconf/transport/tcp/ip (ipv4-address \| ipv6-address) \[0.0.0.0\]  
> The IP address which the RESTCONF server should listen on for TCP
> connections. '0.0.0.0' or '::' means that it listens to the port for
> all IPv4 or IPv6 addresses on the machine.

/ncs-config/restconf/transport/tcp/port (port-number) \[8009\]  
> port is a valid port number to be used in combination with the
> address.

/ncs-config/restconf/transport/tcp/extra-listen  
> A list of additional IP address and port pairs which the RESTCONF
> server should also listen on. Set the ip as '0.0.0.0' or '::' to
> listen on the port for all IPv4 or IPv6 addresses on the machine.

/ncs-config/restconf/transport/tcp/extra-listen/ip (ipv4-address \| ipv6-address)  
> 

/ncs-config/restconf/transport/tcp/extra-listen/port (port-number)  
> 

/ncs-config/restconf/transport/tcp/ha-primary-listen  
> When /ncs-config/ha/enable or /ncs-config/ha-raft/enable is set to
> 'true' and the current NCS node is active (i.e. primary/leader), then
> NCS will listen(2) to the following IPv4 or IPv6 addresses and ports.
> Once the previously active high-availability node transitions to a
> different role, then NCS will shutdown these listen addresses and
> terminate any ongoing traffic.

/ncs-config/restconf/transport/tcp/ha-primary-listen/ip (ipv4-address \| ipv6-address)  
> 

/ncs-config/restconf/transport/tcp/ha-primary-listen/port (port-number)  
> 

/ncs-config/restconf/transport/tcp/dscp (dscp-type)  
> Support for setting the Differentiated Services Code Point (6 bits)
> for traffic originating from the RESTCONF server for TCP connections.

/ncs-config/restconf/transport/ssl  
> Settings deciding how the RESTCONF server SSL (Secure Sockets Layer)
> transport service should behave.

/ncs-config/restconf/transport/ssl/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', the RESTCONF server
> uses SSL as a transport service.

/ncs-config/restconf/transport/ssl/ip (ipv4-address \| ipv6-address) \[0.0.0.0\]  
> The IP address which the RESTCONF server should listen on for incoming
> SSL connections. '0.0.0.0' or '::' means that it listens to the port
> for all IPv4 or IPv6 addresses on the machine.

/ncs-config/restconf/transport/ssl/port (port-number) \[8889\]  
> port is a valid port number.

/ncs-config/restconf/transport/ssl/extra-listen  
> A list of additional IP address and port pairs which the RESTCONF
> server should also listen on for incoming ssl connections. Set the ip
> as '0.0.0.0' or '::' to listen on the port for all IPv4 or IPv6
> addresses on the machine.

/ncs-config/restconf/transport/ssl/extra-listen/ip (ipv4-address \| ipv6-address)  
> 

/ncs-config/restconf/transport/ssl/extra-listen/port (port-number)  
> 

/ncs-config/restconf/transport/ssl/ha-primary-listen  
> When /ncs-config/ha/enable or /ncs-config/ha-raft/enable is set to
> 'true' and the current NCS node is active (i.e. primary/leader), then
> NCS will listen(2) to the following IPv4 or IPv6 addresses and ports.
> Once the previously active high-availability node transitions to a
> different role, then NCS will shutdown these listen addresses and
> terminate any ongoing traffic.

/ncs-config/restconf/transport/ssl/ha-primary-listen/ip (ipv4-address \| ipv6-address)  
> 

/ncs-config/restconf/transport/ssl/ha-primary-listen/port (port-number)  
> 

/ncs-config/restconf/transport/ssl/dscp (dscp-type)  
> Support for setting the Differentiated Services Code Point (6 bits)
> for traffic originating from the RESTCONF server for SSL connections.

/ncs-config/restconf/transport/ssl/key-file (string)  
> Specifies which file contains the private key for the certificate.
>
> If this configurable is omitted, the system defaults to a built-in
> self-signed certificate/key
> (\$NCS_DIR/etc/ncs/ssl/cert/host.{cert,key}). Note: Only ever use this
> built-in certificate/key for test purposes.

/ncs-config/restconf/transport/ssl/cert-file (string)  
> Specifies which file contains the server certificate. The certificate
> is either a self-signed test certificate or a genuine and validated
> certificate from a CA (Certificate Authority).
>
> If this configurable is omitted, the system defaults to a built-in
> self-signed certificate/key
> (\$NCS_DIR/etc/ncs/ssl/cert/host.{cert,key}). Note: Only ever use this
> built-in certificate/key for test purposes.
>
> The built-in test certificate has been generated using a local CA:
>
> <div class="informalexample">
>
>     $ openssl
>     OpenSSL> genrsa -out ca.key 4096
>     OpenSSL> req -new -x509 -days 3650 -key ca.key -out ca.cert
>     OpenSSL> genrsa -out host.key 4096
>     OpenSSL> req -new -key host.key -out host.csr
>     OpenSSL> x509 -req -days 365 -in host.csr -CA ca.cert \
>       -CAkey ca.key -set_serial 01 -out host.cert
>
> </div>

/ncs-config/restconf/transport/ssl/ca-cert-file (string)  
> Specifies which file contains the trusted certificates to use during
> client authentication and to use when attempting to build the server
> certificate chain. The list is also used in the list of acceptable CA
> certificates passed to the client when a certificate is requested.
>
> The distribution comes with a CA certificate which can be used for
> testing purposes (\$NCS_DIR/etc/ncs/ssl/ca_cert/ca.cert). This CA
> certificate has been generated as shown above.

/ncs-config/restconf/transport/ssl/verify (1 \| 2 \| 3) \[1\]  
> Specifies the level of verification the server does on client
> certificates. 1 means nothing, 2 means the server will ask the client
> for a certificate but not fail if the client does not supply a client
> certificate, 3 means that the server requires the client to supply a
> client certificate.
>
> If ca-cert-file has been set to the ca.cert file generated above you
> can verify that it works correctly using, for example:
>
> <div class="informalexample">
>
>     $ openssl s_client -connect 127.0.0.1:8888 \
>           -cert client.cert -key client.key
>
> </div>
>
> For this to work client.cert must have been generated using the
> ca.cert from above:
>
> <div class="informalexample">
>
>     $ openssl
>     OpenSSL> genrsa -out client.key 4096
>     OpenSSL> req -new -key client.key -out client.csr
>     OpenSSL> x509 -req -days 3650 -in client.csr -CA ca.cert \
>       -CAkey ca.key -set_serial 01 -out client.cert
>
> </div>

/ncs-config/restconf/transport/ssl/depth (uint64) \[1\]  
> Specifies the depth of certificate chains the server is prepared to
> follow when verifying client certificates.

/ncs-config/restconf/transport/ssl/ciphers (string) \[DEFAULT\]  
> Specifies the cipher suites to be used by the server as a
> colon-separated list from the set
>
> TLS_AES_256_GCM_SHA384, TLS_AES_128_GCM_SHA256,
> TLS_CHACHA20_POLY1305_SHA256, TLS_AES_128_CCM_SHA256,
> SRP-RSA-AES-128-CBC-SHA, AES256-GCM-SHA384, AES256-SHA256,
> AES128-GCM-SHA256, AES128-SHA256, AES256-SHA, AES128-SHA,
> ECDH-ECDSA-DES-CBC3-SHA, ECDHE-ECDSA-DES-CBC3-SHA,
> ECDHE-RSA-DES-CBC3-SHA, ECDHE-ECDSA-AES256-CCM,
> ECDHE-ECDSA-AES128-GCM-SHA256, ECDHE-RSA-AES128-GCM-SHA256,
> ECDHE-ECDSA-AES128-CCM, ECDHE-ECDSA-AES128-SHA256,
> ECDHE-RSA-AES128-SHA256, ECDHE-ECDSA-AES128-SHA, ECDHE-RSA-AES128-SHA,
> ECDHE-ECDSA-AES256-GCM-SHA384, ECDHE-RSA-AES256-GCM-SHA384,
> ECDHE-ECDSA-CHACHA20-POLY1305, ECDHE-RSA-CHACHA20-POLY1305,
> ECDHE-ECDSA-AES256-SHA384, ECDHE-RSA-AES256-SHA384,
> DHE-RSA-AES128-GCM-SHA256, DHE-DSS-AES128-GCM-SHA256,
> DHE-RSA-AES128-SHA256, DHE-DSS-AES128-SHA256, EDH-RSA-DES-CBC3-SHA,
> DHE-RSA-AES128-SHA, DHE-DSS-AES128-SHA, DHE-RSA-AES256-GCM-SHA384,
> DHE-DSS-AES256-GCM-SHA384, DHE-RSA-CHACHA20-POLY1305,
> DHE-RSA-AES256-SHA256, DHE-DSS-AES256-SHA256, and DHE-RSA-AES256-SHA,
>
> or the word "DEFAULT", which expands to a list containing
>
> TLS_AES_256_GCM_SHA384, TLS_AES_128_GCM_SHA256,
> TLS_CHACHA20_POLY1305_SHA256, TLS_AES_128_CCM_SHA256,
> AES256-GCM-SHA384, AES256-SHA256, AES128-GCM-SHA256, AES128-SHA256,
> AES256-SHA, AES128-SHA, ECDHE-ECDSA-AES128-GCM-SHA256,
> ECDHE-RSA-AES128-GCM-SHA256, ECDHE-ECDSA-AES128-SHA256,
> ECDHE-RSA-AES128-SHA256, ECDHE-ECDSA-AES128-SHA, ECDHE-RSA-AES128-SHA,
> ECDHE-ECDSA-AES256-GCM-SHA384, ECDHE-RSA-AES256-GCM-SHA384,
> ECDHE-ECDSA-CHACHA20-POLY1305, ECDHE-RSA-CHACHA20-POLY1305,
> ECDHE-ECDSA-AES256-SHA384, ECDHE-RSA-AES256-SHA384,
> DHE-RSA-AES128-GCM-SHA256, DHE-DSS-AES128-GCM-SHA256,
> DHE-RSA-AES128-SHA256, DHE-DSS-AES128-SHA256, DHE-RSA-AES128-SHA,
> DHE-DSS-AES128-SHA, DHE-RSA-AES256-GCM-SHA384,
> DHE-DSS-AES256-GCM-SHA384, DHE-RSA-AES256-SHA256, and
> DHE-DSS-AES256-SHA256,
>
> See the OpenSSL manual page ciphers(1) for the definition of the
> cipher suites. NOTE: The general cipher list syntax described in
> ciphers(1) is not supported.

/ncs-config/restconf/transport/ssl/protocols (string) \[DEFAULT\]  
> Specifies the SSL/TLS protocol versions to be used by the server as a
> whitespace-separated list from the set tlsv1 tlsv1.1 tlsv1.2 tlsv1.3,
> or the word 'DEFAULT' (use all supported protocol versions except the
> set tlsv1 tlsv1.1).

/ncs-config/restconf/transport/ssl/elliptic-curves (string) \[DEFAULT\]  
> Specifies the curves for Elliptic Curve cipher suites to be used by
> the server as a whitespace-separated list from the set
>
> x25519, x448, secp521r1, brainpoolP512r1, secp384r1, brainpoolP384r1,
> secp256r1, brainpoolP256r1, sect571r1, sect571k1, sect409k1,
> sect409r1, sect283k1, sect283r1, and secp256k1,
>
> or the word 'DEFAULT' (use all supported curves).

/ncs-config/restconf/require-module-name/enabled (boolean) \[true\]  
> When set to 'true', the client must explicitly provide the module name
> of the node if it is defined in a module other than its parent node or
> its parent node is the datastore. When set to 'false', this
> configuration parameter allows the client to bypass above
> requirements. Refer to RFC 8040, section 3.5.3 for detailed
> information.

/ncs-config/webui  
> This section defines settings which decide how the embedded NCS Web
> server should behave, with respect to TCP and SSL etc.

/ncs-config/webui/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', the Web server is
> started.

/ncs-config/webui/server-name (string) \[localhost\]  
> The hostname the Web server serves.

/ncs-config/webui/server-alias (string)  
> This parameter may be given multiple times.
>
> The hostname alias the Web server serves. A server alias may contain
> wildcards: '\*' matches any sequence of zero or more characters '?'
> matches one character unless that character is a period ('.').

/ncs-config/webui/match-host-name (boolean) \[true\]  
> This setting specifies if the Web server only should serve URLs
> adhering to the server-name and server-alias defined above. By default
> the server-name is 'localhost' and match-host-name is 'true', i.e.
> server-name and server-alias needs to be reconfigured to the actual
> hostnames that are used to access the Web server.

/ncs-config/webui/cache-refresh-secs (uint64) \[0\]  
> The NCS Web server uses a RAM cache for static content. An entry sits
> in the cache for a number of seconds before it is reread from disk (on
> access). The default is 0.

/ncs-config/webui/max-ref-entries (uint64) \[100\]  
> Leafref and keyref entries are represented as drop-down menues in the
> automatically generated Web UI. By default no more than 100 entries
> are fetched. This element makes this number configurable.

/ncs-config/webui/docroot (string)  
> The location of the document root on disk. If this configurable is
> omited the docroot points to the next generation docroot in the NCS
> distro instead.

/ncs-config/webui/webui-root-resource (string)  
> The target resource where the WebUI is accessible.
>
> Setting the configurable to, e.g., 'myroot' makes the JSON-RPC
> accessible at https://\<ip-address\>/myroot/jsonrpc.
>
> This option affects the WebUI and JSON-RPC.

/ncs-config/webui/webui-index-url (string) \[/index.html\]  
> Where to redirect after successful login, which by default is
> '/index.html'.

/ncs-config/webui/webui-one-url (string) \[/webui-one\]  
> Url where the 'webui-one' webui is mapped if webui is enabled. The
> default is '/webui-one'.

/ncs-config/webui/login-dir (string)  
> The login-dir element points out an alternative login directory which
> contains your HTML code etc used to login to the Web UI. This
> directory will be mapped https://\<ip-address\>/login. If this element
> is not specified the default login/ directory in the docroot will be
> used instead.

/ncs-config/webui/custom-headers  
> The custom-headers element contains any number of header elements,
> with a valid header-field as defined in RFC7230.
>
> The headers will be part of all HTTP responses.

/ncs-config/webui/custom-headers/header/name (string)  
> 

/ncs-config/webui/custom-headers/header/value (string)  
> This parameter is mandatory.

/ncs-config/webui/x-frame-options (DENY \| SAMEORIGIN \| ALLOW-FROM) \[DENY\]  
> By default the X-Frame-Options header is set to DENY for the
> /login.html and /index.html pages. With this header it can be set to
> SAMEORIGIN or ALLOW-FROM instead.

/ncs-config/webui/x-content-type-options (string) \[nosniff\]  
> The X-Content-Type-Options response HTTP header is a marker used by
> the server to indicate that the MIME types advertised in the
> Content-Type headers should not be changed and be followed. This
> allows to opt-out of MIME type sniffing, or, in other words, it is a
> way to say that the web admins knew what they were doing.
>
> This header is always sent in HTTP responses. By setting the value to
> the empty string will cause the header not to be sent.

/ncs-config/webui/x-xss-protection (string) \[1; mode=block\]  
> The HTTP X-XSS-Protection response header is a feature of Internet
> Explorer, Chrome and Safari that stops pages from loading when they
> detect reflected cross-site scripting (XSS) attacks. Although these
> protections are largely unnecessary in modern browsers when sites
> implement a strong Content-Security-Policy that disables the use of
> inline JavaScript ('unsafe-inline'), they can still provide
> protections for users of older web browsers that don't yet support
> CSP.
>
> This header is always sent in HTTP responses. By setting the value to
> the empty string will cause the header not to be sent.

/ncs-config/webui/strict-transport-security (string) \[max-age=31536000; includeSubDomains\]  
> The HTTP Strict-Transport-Security response header (often abbreviated
> as HSTS) lets a web site tell browsers that it should only be accessed
> using HTTPS, instead of using HTTP.
>
> This header is always sent in HTTP responses. By setting the value to
> the empty string will cause the header not to be sent.

/ncs-config/webui/content-security-policy (string) \[default-src 'self'; style-src 'self' 'nonce-NSO_STYLE_NONCE'; block-all-mixed-content; base-uri 'self'; frame-ancestors 'none';\]  
> The HTTP Content-Security-Policy response header allows web site
> administrators to control resources the user agent is allowed to load
> for a given page.
>
> The default value means that: Resources like fonts, scripts,
> connections, images, and styles will all only load from the same
> origin as the protected resource. All mixed contents will be blocked
> and frame-ancestors like iframes and applets is prohibited. See also:
>
> <div class="informalexample">
>
>       https://www.w3.org/TR/CSP3/
>
> </div>
>
> This header is always sent in HTTP responses. By setting the value to
> the empty string will cause the header not to be sent.

/ncs-config/webui/cross-origin-embedder-policy (string) \[require-corp\]  
> The HTTP Cross-Origin-Embedder-Policy (COEP) response header
> configures embedding cross-origin resources into the document.
>
> Always sent by default, can be disabled by setting the value to empty
> string.

/ncs-config/webui/cross-origin-opener-policy (string) \[same-origin\]  
> The HTTP Cross-Origin-Opener-Policy (COOP) response header allows you
> to ensure a top-level document does not share a browsing context group
> with cross-origin documents.
>
> Always sent by default, can be disabled by setting the value to empty
> string.

/ncs-config/webui/wasm-script-policy-pattern (string) \[(?i)\bwasm\b.\*\\js\$\]  
> The wasmScriptPolicyPattern is a regular expression that matches
> filenames in HTTP requests. If there is a match and the response
> includes a Content-Security-Policy (CSP), the 'script-src' policy is
> updated with the 'wasm-unsafe-eval' directive.
>
> The 'wasm-unsafe-eval' source expression controls the execution of
> WebAssembly. If a page contains a CSP header and the
> 'wasm-unsafe-eval' is specified in the script-src directive, the web
> browser allows the loading and execution of WebAssembly on the page.
>
> Setting the value to an empty string deactivates the match. If you
> still want to allow loading WebAssembly content with this disabled you
> would have to add 'wasm-unsafe-eval' to the 'script-src' rule in the
> CSP header, which. allows it for ALL files.
>
> The default value is a pattern that would case insensitively match any
> filename that contains the word 'wasm' surrounded by at least one
> non-word character (for example ' ', '.' or '-') and has the file
> extension 'js'.
>
> As an example 'dot.wasm.js' and 'WASM-dash.js' would match while
> 'underscore_wasm.js' would not.

/ncs-config/webui/disable-auth/dir (string)  
> This parameter may be given multiple times.
>
> The disable-auth element contains any number of dir elements. Each dir
> element points to a directory path in the docroot which should not be
> restricted by the AAA engine. If no dir elements are specifed the
> following directories and files will not be restricted by the AAA
> engine: '/login' and '/login.html'.

/ncs-config/webui/allow-symlinks (boolean) \[true\]  
> Allow symlinks in the docroot directory.

/ncs-config/webui/transport  
> Settings deciding which transport services the Web server should
> listen on, e.g. TCP and SSL.

/ncs-config/webui/transport/tcp  
> Settings deciding how the Web server TCP transport service should
> behave.

/ncs-config/webui/transport/tcp/enabled (boolean) \[true\]  
> enabled is either 'true' or 'false'. If 'true', the Web server uses
> cleart text TCP as a transport service.

/ncs-config/webui/transport/tcp/redirect (string)  
> If given the user will be redirected to the specified URL. Two macros
> can be specified, i.e. @HOST@ and @PORT@. For example
> https://@HOST@:443 or https://192.12.4.3:@PORT@

/ncs-config/webui/transport/tcp/ip (ipv4-address \| ipv6-address) \[0.0.0.0\]  
> The IP address which the Web server should listen on. '0.0.0.0' or
> '::' means that it listens on the port
> (/ncs-config/webui/transport/tcp/port) for all IPv4 or IPv6 addresses
> on the machine.

/ncs-config/webui/transport/tcp/port (port-number) \[8008\]  
> port is a valid port number to be used in combination with the address
> in /ncs-config/webui/transport/tcp/ip.

/ncs-config/webui/transport/tcp/keepalive (boolean) \[false\]  
> keepalive is either 'true' or 'false' (default). When 'true' periodic
> polling of the other end of the connection will be done for sockets
> that have not exchanged data during the OS defined interval. The
> server will also periodicly send messages (':keepalive test') over the
> connection to detect if it is alive. The first message may not detect
> that the connection is down, but the subsequent one will. The OS
> keepalive service will only clean the OS socket, this timeout will
> clean the server processes.

/ncs-config/webui/transport/tcp/keepalive-timeout (uint64) \[3600\]  
> keepalive-timeout defines the time (in seconds, default 3600) the
> server will wait before trying to send keepalive messages.

/ncs-config/webui/transport/tcp/extra-listen  
> A list of additional IP address and port pairs which the Web server
> should also listen on. Set the ip as '0.0.0.0' or '::' to listen on
> the port for all IPv4 or IPv6 addresses on the machine.

/ncs-config/webui/transport/tcp/extra-listen/ip (ipv4-address \| ipv6-address)  
> 

/ncs-config/webui/transport/tcp/extra-listen/port (port-number)  
> 

/ncs-config/webui/transport/tcp/ha-primary-listen  
> When /ncs-config/ha/enable or /ncs-config/ha-raft/enable is set to
> 'true' and the current NCS node is active (i.e. primary/leader), then
> NCS will listen(2) to the following IPv4 or IPv6 addresses and ports.
> Once the previously active high-availability node transitions to a
> different role, then NCS will shutdown these listen addresses and
> terminate any ongoing traffic.

/ncs-config/webui/transport/tcp/ha-primary-listen/ip (ipv4-address \| ipv6-address)  
> 

/ncs-config/webui/transport/tcp/ha-primary-listen/port (port-number)  
> 

/ncs-config/webui/transport/ssl  
> Settings deciding how the Web server SSL (Secure Sockets Layer)
> transport service should behave.
>
> SSL is widely deployed on the Internet and virtually all bank
> transactions as well as all on-line shopping today is done with SSL
> encryption. There are many good sources on describing SSL in detail,
> e.g. http://www.tldp.org/HOWTO/SSL-Certificates-HOWTO/ which describes
> how to manage certificates and keys.

/ncs-config/webui/transport/ssl/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', the Web server uses
> SSL as a transport service.

/ncs-config/webui/transport/ssl/redirect (string)  
> If given the user will be redirected to the specified URL. Two macros
> can be specified, i.e. @HOST@ and @PORT@. For example http://@HOST@:80
> or http://192.12.4.3:@PORT@

/ncs-config/webui/transport/ssl/ip (ipv4-address \| ipv6-address) \[0.0.0.0\]  
> The IP address which the Web server should listen on for incoming ssl
> connections. '0.0.0.0' or '::' means that it listens on the port
> (/ncs-config/webui/transport/ssl/port) for all IPv4 or IPv6 addresses
> on the machine.

/ncs-config/webui/transport/ssl/port (port-number) \[8888\]  
> port is a valid port number to be used in combination with
> /ncs-config/webui/transport/ssl/ip.

/ncs-config/webui/transport/ssl/keepalive (boolean) \[false\]  
> keepalive is either 'true' or 'false' (default). When 'true' periodic
> polling of the other end of the connection will be done for sockets
> that have not exchanged data during the OS defined interval. The
> server will also periodicly send messages (':keepalive test') over the
> connection to detect if it is alive. The first message may not detect
> that the connection is down, but the subsequent one will. The OS
> keepalive service will only clean the OS socket, this timeout will
> clean the server processes.

/ncs-config/webui/transport/ssl/keepalive-timeout (uint64) \[3600\]  
> keepalive-timeout defines the time (in seconds, default 3600) the
> server will wait before trying to send keepalive messages.

/ncs-config/webui/transport/ssl/extra-listen  
> A list of additional IP address and port pairs which the Web server
> should also listen on for incoming ssl connections. Set the ip as
> '0.0.0.0' or '::' to listen on the port for all IPv4 or IPv6 addresses
> on the machine.

/ncs-config/webui/transport/ssl/extra-listen/ip (ipv4-address \| ipv6-address)  
> 

/ncs-config/webui/transport/ssl/extra-listen/port (port-number)  
> 

/ncs-config/webui/transport/ssl/ha-primary-listen  
> When /ncs-config/ha/enable or /ncs-config/ha-raft/enable is set to
> 'true' and the current NCS node is active (i.e. primary/leader), then
> NCS will listen(2) to the following IPv4 or IPv6 addresses and ports.
> Once the previously active high-availability node transitions to a
> different role, then NCS will shutdown these listen addresses and
> terminate any ongoing traffic.

/ncs-config/webui/transport/ssl/ha-primary-listen/ip (ipv4-address \| ipv6-address)  
> 

/ncs-config/webui/transport/ssl/ha-primary-listen/port (port-number)  
> 

/ncs-config/webui/transport/ssl/read-from-db (boolean) \[false\]  
> If enabled, TLS data (certificate, private key, and CA certificates)
> is read from database. Corresponding configuration regarding reading
> TLS data (i.e. /ncs-config/webui/transport/ssl/key-file,
> /ncs-config/webui/transport/ssl/cert-file,
> /ncs-config/webui/transport/ssl/ca-cert-file) is ignored when enabled.
>
> See tailf-tls.yang and the NCS User Guide for more information.

/ncs-config/webui/transport/ssl/key-file (string)  
> Specifies which file that contains the private key for the
> certificate. Read more about certificates in
> /ncs-config/webui/transport/ssl/cert-file.
>
> During installation self signed certificates/keys are generated if the
> openssl binary is available on the host. Note: Only use these
> certificates/keys for test purposes.

/ncs-config/webui/transport/ssl/cert-file (string)  
> Specifies which file that contains the server certificate. The
> certificate is either a self-signed test certificate or a genuin and
> validated certificate bought from a CA (Certificate Authority).
>
> During installation self signed certificates/keys are generated if the
> openssl binary is available on the host. Note: Only use these
> certificates/keys for test purposes.
>
> This server certificate has been generated using a local CA
> certificate:
>
> <div class="informalexample">
>
>     $ openssl
>     OpenSSL> genrsa -out ca.key 4096
>     OpenSSL> req -new -x509 -days 3650 -key ca.key -out ca.cert
>     OpenSSL> genrsa -out host.key 4096
>     OpenSSL> req -new -key host.key -out host.csr
>     OpenSSL> x509 -req -days 365 -in host.csr -CA ca.cert \
>     -CAkey ca.key -set_serial 01 -out host.cert
>
> </div>

/ncs-config/webui/transport/ssl/ca-cert-file (string)  
> Specifies which file that contains the trusted certificates to use
> during client authentication and to use when attempting to build the
> server certificate chain. The list is also used in the list of
> acceptable CA certificates passed to the client when a certificate is
> requested.
>
> During installation self signed certificates/keys are generated if the
> openssl binary is available on the host. Note: Only use these
> certificates/keys for test purposes.
>
> This CA certificate has been generated as shown above.

/ncs-config/webui/transport/ssl/verify (uint32) \[1\]  
> Specifies the level of verification the server does on client
> certificates. 1 means nothing, 2 means the server will ask the client
> for a certificate but not fail if the client does not supply a client
> certificate, 3 means that the server requires the client to supply a
> client certificate.
>
> If ca-cert-file has been set to the ca.cert file generated above you
> can verify that it works correctly using, for example:
>
> <div class="informalexample">
>
>     $ openssl s_client -connect 127.0.0.1:8888 \
>     -cert client.cert -key client.key
>
> </div>
>
> For this to work client.cert must have been generated using the
> ca.cert from above:
>
> <div class="informalexample">
>
>     $ openssl
>     OpenSSL> genrsa -out client.key 4096
>     OpenSSL> req -new -key client.key -out client.csr
>     OpenSSL> x509 -req -days 3650 -in client.csr -CA ca.cert \
>       -CAkey ca.key -set_serial 01 -out client.cert
>
> </div>

/ncs-config/webui/transport/ssl/depth (uint64) \[1\]  
> Specifies the depth of certificate chains the server is prepared to
> follow when verifying client certificates.

/ncs-config/webui/transport/ssl/ciphers (string) \[DEFAULT\]  
> Specifies the cipher suites to be used by the server as a
> colon-separated list from the set
>
> TLS_AES_256_GCM_SHA384, TLS_AES_128_GCM_SHA256,
> TLS_CHACHA20_POLY1305_SHA256, TLS_AES_128_CCM_SHA256,
> SRP-RSA-AES-128-CBC-SHA, AES256-GCM-SHA384, AES256-SHA256,
> AES128-GCM-SHA256, AES128-SHA256, AES256-SHA, AES128-SHA,
> ECDH-ECDSA-DES-CBC3-SHA, ECDHE-ECDSA-DES-CBC3-SHA,
> ECDHE-RSA-DES-CBC3-SHA, ECDHE-ECDSA-AES256-CCM,
> ECDHE-ECDSA-AES128-GCM-SHA256, ECDHE-RSA-AES128-GCM-SHA256,
> ECDHE-ECDSA-AES128-CCM, ECDHE-ECDSA-AES128-SHA256,
> ECDHE-RSA-AES128-SHA256, ECDHE-ECDSA-AES128-SHA, ECDHE-RSA-AES128-SHA,
> ECDHE-ECDSA-AES256-GCM-SHA384, ECDHE-RSA-AES256-GCM-SHA384,
> ECDHE-ECDSA-CHACHA20-POLY1305, ECDHE-RSA-CHACHA20-POLY1305,
> ECDHE-ECDSA-AES256-SHA384, ECDHE-RSA-AES256-SHA384,
> DHE-RSA-AES128-GCM-SHA256, DHE-DSS-AES128-GCM-SHA256,
> DHE-RSA-AES128-SHA256, DHE-DSS-AES128-SHA256, EDH-RSA-DES-CBC3-SHA,
> DHE-RSA-AES128-SHA, DHE-DSS-AES128-SHA, DHE-RSA-AES256-GCM-SHA384,
> DHE-DSS-AES256-GCM-SHA384, DHE-RSA-CHACHA20-POLY1305,
> DHE-RSA-AES256-SHA256, DHE-DSS-AES256-SHA256, and DHE-RSA-AES256-SHA,
>
> or the word "DEFAULT", which expands to a list containing
>
> TLS_AES_256_GCM_SHA384, TLS_AES_128_GCM_SHA256,
> TLS_CHACHA20_POLY1305_SHA256, TLS_AES_128_CCM_SHA256,
> AES256-GCM-SHA384, AES256-SHA256, AES128-GCM-SHA256, AES128-SHA256,
> AES256-SHA, AES128-SHA, ECDHE-ECDSA-AES128-GCM-SHA256,
> ECDHE-RSA-AES128-GCM-SHA256, ECDHE-ECDSA-AES128-SHA256,
> ECDHE-RSA-AES128-SHA256, ECDHE-ECDSA-AES128-SHA, ECDHE-RSA-AES128-SHA,
> ECDHE-ECDSA-AES256-GCM-SHA384, ECDHE-RSA-AES256-GCM-SHA384,
> ECDHE-ECDSA-CHACHA20-POLY1305, ECDHE-RSA-CHACHA20-POLY1305,
> ECDHE-ECDSA-AES256-SHA384, ECDHE-RSA-AES256-SHA384,
> DHE-RSA-AES128-GCM-SHA256, DHE-DSS-AES128-GCM-SHA256,
> DHE-RSA-AES128-SHA256, DHE-DSS-AES128-SHA256, DHE-RSA-AES128-SHA,
> DHE-DSS-AES128-SHA, DHE-RSA-AES256-GCM-SHA384,
> DHE-DSS-AES256-GCM-SHA384, DHE-RSA-AES256-SHA256, and
> DHE-DSS-AES256-SHA256,
>
> See the OpenSSL manual page ciphers(1) for the definition of the
> cipher suites. NOTE: The general cipher list syntax described in
> ciphers(1) is not supported.

/ncs-config/webui/transport/ssl/protocols (string) \[DEFAULT\]  
> Specifies the SSL/TLS protocol versions to be used by the server as a
> whitespace-separated list from the set tlsv1 tlsv1.1 tlsv1.2 tlsv1.3,
> or the word "DEFAULT" (use all supported protocol versions except the
> set tlsv1 tlsv1.1).

/ncs-config/webui/transport/ssl/elliptic-curves (string) \[DEFAULT\]  
> Specifies the curves for Elliptic Curve cipher suites to be used by
> the server as a whitespace-separated list from the set
>
> x25519, x448, secp521r1, brainpoolP512r1, secp384r1, brainpoolP384r1,
> secp256r1, brainpoolP256r1, sect571r1, sect571k1, sect409k1,
> sect409r1, sect283k1, sect283r1, and secp256k1,
>
> or the word "DEFAULT" (use all supported curves).

/ncs-config/webui/transport/unauthenticated-message-limit (uint32 \| nolimit) \[65536\]  
> Limit the size of allowed unauthenticated messages. Limit is given in
> bytes or 'nolimit'. The default is 64kB.

/ncs-config/webui/cgi  
> CGI-script support

/ncs-config/webui/cgi/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', CGI-script support is
> enabled.

/ncs-config/webui/cgi/dir (string) \[cgi-bin\]  
> The directory path to the location of the CGI-scripts.

/ncs-config/webui/cgi/request-filter (string)  
> Specifies that characters not specified in the given regexp should be
> filtered out silently.

/ncs-config/webui/cgi/max-request-length (uint16)  
> Specifies the maximum amount of characters in a request. All
> characters exceedig this limit are silenty ignored.

/ncs-config/webui/cgi/php  
> PHP support

/ncs-config/webui/cgi/php/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', PHP support is
> enabled.

/ncs-config/webui/idle-timeout (xs:duration) \[PT30M\]  
> Maximum idle time before terminating a Web UI session. PT0M means no
> timeout. Default is PT30M, ie 30 minutes.

/ncs-config/webui/absolute-timeout (xs:duration) \[PT12H\]  
> Maximum absolute time before terminating a Web UI session. PT0M means
> no timeout. Default is PT12H, ie 12 hours.

/ncs-config/webui/rate-limiting (uint64) \[1000000\]  
> Maximum number of allowed JSON-RPC requests every hour. 0 means
> infinity. Default is 1 million.

/ncs-config/webui/audit (boolean) \[false\]  
> audit is either 'true' or 'false'. If 'true', then JSON-RPC/CGI
> requests are logged to the audit log.

/ncs-config/webui/use-forwarded-client-ip  
> This section is created if a Client IP address should be looked for
> among HTTP headers such as 'X-Forwarded-For' or 'X-REAL-IP', etc.

/ncs-config/webui/use-forwarded-client-ip/proxy-headers (string)  
> This parameter is mandatory.
>
> This parameter may be given multiple times.
>
> Name of HTTP headers that contain the true Client IP address.
>
> Typically the de facto standard is to use the 'X-Forwarded-For'
> header, but other headers exists, e.g: 'X-REAL-IP'.
>
> The first header in this list, found to contain an IP address will
> cause this IP address to be used as the Client IP address. In case of
> several elements, the first element, separated by a space or comma,
> will be used. The header name specified here is not case sensitive.
>
> Example of HTTP headers containing a ClientIP:
>
> <div class="informalexample">
>
>          X-Forwarded-For: ClientIP, ProxyIP1, ProxyIP2
>          X-REAL-IP: ClientIP
>
> </div>

/ncs-config/webui/use-forwarded-client-ip/allowed-proxy-ip-prefix (inet:ip-prefix)  
> This parameter is mandatory.
>
> This parameter may be given multiple times.
>
> Only the source IP-prefix addresses listed here will be trusted to
> contain a Client IP address in a HTTP header as specified in
> 'proxyHeaders'

/ncs-config/webui/package-upload  
> Settings for the /package-upload URL.

/ncs-config/webui/package-upload/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', the /package-upload
> URL will be available.

/ncs-config/webui/package-upload/max-files (uint64) \[1\]  
> Specifies the maximum number of files allowed in an upload request. If
> a request contains more files than max-files, then the remaining file
> parts will result in an error and its content will be ignored.

/ncs-config/webui/resources  
> Settings for the /resources URL.

/ncs-config/webui/resources/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', the /resources URL
> will be available.

/ncs-config/api  
> NCS API parameter

/ncs-config/api/new-session-timeout (xs:duration) \[PT30S\]  
> Timeout for a data provider to respond to a control socket request,
> see DpTrans. If the Dp fails to respond within the given time, it will
> be disconnected.

/ncs-config/api/action-timeout (xs:duration) \[PT240S\]  
> Timeout for an action callback response. If the action callback fails
> to generate a response to NCS within the given time, it will be
> disconnected.

/ncs-config/api/query-timeout (xs:duration) \[PT120S\]  
> Timeout for a data provider to respond to a worker socket query, see
> DpTrans. If the dp fails to respond within the given time, it will be
> disconnected.

/ncs-config/api/connect-timeout (xs:duration) \[PT60S\]  
> Timeout for data provider to send initial message after connecting the
> socket to the NCS server. If the dp fails to initiate the connection
> within the given time, it will be disconnected.

/ncs-config/japi  
> Java-API parameters.

/ncs-config/japi/object-cache-timeout (xs:duration) \[PT2S\]  
> Timeout for the cache used by the getObject() and
> iterator(),nextObject() callback requests. NCS caches the result of
> these calls and serves getElem() requests from northbound agents from
> the cache. NOTE: Setting this timeout too low will effectively cause
> the callbacks to be non-functional - e.g. getObject() may be invoked
> for each getElem() request from a northbound agent.

/ncs-config/japi/event-reply-timeout (xs:duration) \[PT120S\]  
> Timeout for the reply from an event notification subscriber for a
> notification that requires a reply, see the Notif class. If the
> subscriber fails to reply within the given time, the event
> notification socket will be closed.

/ncs-config/netconf-north-bound  
> This section defines settings which decide how the NETCONF agent
> should behave, with respect to NETCONF and SSH.

/ncs-config/netconf-north-bound/enabled (boolean) \[true\]  
> enabled is either 'true' or 'false'. If 'true', the NETCONF agent is
> started.

/ncs-config/netconf-north-bound/transport  
> Settings deciding which transport services the NETCONF agent should
> listen on, e.g. TCP and SSH.

/ncs-config/netconf-north-bound/transport/ssh-call-home-source-address  
> This section provides the possibility to specify the source address to
> use for NETCONF call home connnections. In most cases the source
> address assignment is best left to the TCP/IP stack in the OS, since
> an incorrectly chosen address may result in connection failures.
> However in case there is more than one address that could be chosen by
> the stack, and we need to restrict the choice to one of them, these
> settings can be used. Currently only supported when the internal SSH
> stack is used.

/ncs-config/netconf-north-bound/transport/ssh-call-home-source-address/ipv4 (ipv4-address)  
> The source address to use for call home IPv4 connections. If not set,
> the source address will be assigned by the OS.

/ncs-config/netconf-north-bound/transport/ssh-call-home-source-address/ipv6 (ipv6-address)  
> The source address to use for call home IPv6 connections. If not set,
> the source address will be assigned by the OS.

/ncs-config/netconf-north-bound/transport/ssh  
> Settings deciding how the NETCONF SSH transport service should behave.

/ncs-config/netconf-north-bound/transport/ssh/enabled (boolean) \[true\]  
> enabled is either 'true' or 'false'. If 'true', the NETCONF agent uses
> SSH as a transport service.

/ncs-config/netconf-north-bound/transport/ssh/ip (ipv4-address \| ipv6-address) \[0.0.0.0\]  
> ip is an IP address which the NCS NETCONF agent should listen on.
> '0.0.0.0' or '::' means that it listens on the port
> (/ncs-config/netconf-north-bound/transport/ssh/port) for all IPv4 or
> IPv6 addresses on the machine.

/ncs-config/netconf-north-bound/transport/ssh/port (port-number) \[2022\]  
> port is a valid port number to be used in combination with
> /ncs-config/netconf-north-bound/transport/ssh/ip. Note that the
> standard port for NETCONF over SSH is 830.

/ncs-config/netconf-north-bound/transport/ssh/use-keyboard-interactive (boolean) \[false\]  
> Need to be set to true if using challenge/response authentication for
> NETCONF SSH.

/ncs-config/netconf-north-bound/transport/ssh/extra-listen  
> A list of additional IP address and port pairs which the NCS NETCONF
> agent should also listen on. Set the ip as '0.0.0.0' or '::' to listen
> on the port for all IPv4 or IPv6 addresses on the machine.

/ncs-config/netconf-north-bound/transport/ssh/extra-listen/ip (ipv4-address \| ipv6-address)  
> 

/ncs-config/netconf-north-bound/transport/ssh/extra-listen/port (port-number)  
> 

/ncs-config/netconf-north-bound/transport/ssh/ha-primary-listen  
> When /ncs-config/ha/enable or /ncs-config/ha-raft/enable is set to
> 'true' and the current NCS node is active (i.e. primary/leader), then
> NCS will listen(2) to the following IPv4 or IPv6 addresses and ports.
> Once the previously active high-availability node transitions to a
> different role, then NCS will shutdown these listen addresses and
> terminate any ongoing traffic.

/ncs-config/netconf-north-bound/transport/ssh/ha-primary-listen/ip (ipv4-address \| ipv6-address)  
> 

/ncs-config/netconf-north-bound/transport/ssh/ha-primary-listen/port (port-number)  
> 

/ncs-config/netconf-north-bound/transport/tcp  
> NETCONF over TCP is not standardized, but it can be useful during
> development in order to use e.g. netcat for scripting. It is also
> useful if we want to use our own proprietary transport. In that case
> we setup the NETCONF agent to listen on localhost and then proxy it
> from our transport service module.

/ncs-config/netconf-north-bound/transport/tcp/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', the NETCONF agent uses
> clear text TCP as a transport service.

/ncs-config/netconf-north-bound/transport/tcp/ip (ipv4-address \| ipv6-address) \[0.0.0.0\]  
> ip is an IP address which the NCS NETCONF agent should listen on.
> '0.0.0.0' or '::' means that it listens on the port
> (/ncs-config/netconf-north-bound/transport/tcp/port) for all IPv4 or
> IPv6 addresses on the machine.

/ncs-config/netconf-north-bound/transport/tcp/port (port-number) \[2023\]  
> port is a valid port number to be used in combination with
> /ncs-config/netconf-north-bound/transport/tcp/ip.

/ncs-config/netconf-north-bound/transport/tcp/keepalive (boolean) \[false\]  
> keepalive is either 'true' or 'false' (default). When 'true' periodic
> polling of the other end of the connection will be done for sockets
> that have not exchanged data during the OS defined interval.

/ncs-config/netconf-north-bound/transport/tcp/extra-listen  
> A list of additional IP address and port pairs which the NCS NETCONF
> agent should also listen on. Set the ip as '0.0.0.0' or '::' to listen
> on the port for all IPv4 or IPv6 addresses on the machine.

/ncs-config/netconf-north-bound/transport/tcp/extra-listen/ip (ipv4-address \| ipv6-address)  
> 

/ncs-config/netconf-north-bound/transport/tcp/extra-listen/port (port-number)  
> 

/ncs-config/netconf-north-bound/transport/tcp/ha-primary-listen  
> When /ncs-config/ha/enable or /ncs-config/ha-raft/enable is set to
> 'true' and the current NCS node is active (i.e. primary/leader), then
> NCS will listen(2) to the following IPv4 or IPv6 addresses and ports.
> Once the previously active high-availability node transitions to a
> different role, then NCS will shutdown these listen addresses and
> terminate any ongoing traffic.

/ncs-config/netconf-north-bound/transport/tcp/ha-primary-listen/ip (ipv4-address \| ipv6-address)  
> 

/ncs-config/netconf-north-bound/transport/tcp/ha-primary-listen/port (port-number)  
> 

/ncs-config/netconf-north-bound/extended-sessions (boolean) \[false\]  
> If extended-sessions are enabled, all NCS sessions can be terminated
> using \<kill-session\>, i.e. not only can other NETCONF session be
> terminated, but also CLI sessions, Webui sessions etc. If such a
> session holds a lock, it's session id will be returned in the
> \<lock-denied\>, instead of '0'.
>
> Strictly speaking, this extension is not covered by the NETCONF
> specification; therefore it's false by default.

/ncs-config/netconf-north-bound/idle-timeout (xs:duration) \[PT0S\]  
> Maximum idle time before terminating a NETCONF session. If the session
> is waiting for notifications, or has a pending confirmed commit, the
> idle timeout is not used. The default value is 0, which means no
> timeout.
>
> Modification of this value will only affect connections that are
> established after the modification has been done.

/ncs-config/netconf-north-bound/write-timeout (xs:duration) \[PT0S\]  
> Maximum time for a write operation towards a client to complete. If
> the time is exceeded, the NETCONF session is terminated. The default
> value is 0, which means no timeout.
>
> Modification of this value will only affect connections that are
> established after the modification has been done.

/ncs-config/netconf-north-bound/transaction-reuse-timeout (xs:duration) \[PT2S\]  
> Maximum time after the completion of a transaction the system will
> wait to close the transaction or reuse it for another NETCONF request.
>
> Modification of this value will only affect connections that are
> established after the modification has been done.

/ncs-config/netconf-north-bound/rpc-errors (close \| inline) \[close\]  
> If rpc-errors is 'inline', and an error occurs during the processing
> of a \<get\> or \<get-config\> request when NCS tries to fetch some
> data from a data provider, NCS will generate an rpc-error element in
> the faulty element, and continue to process the next element.
>
> If an error occurs and rpc-errors is 'close', the NETCONF transport is
> closed by NCS.

/ncs-config/netconf-north-bound/max-batch-processes (uint32 \| unbounded) \[unbounded\]  
> Controls how many concurrent NETCONF batch processes there can be at
> any time. A batch process can be started by the agent if a new NETCONF
> operation is implemented as a batch operation. See the NETCONF chapter
> in the NCS User's Guide for details.

/ncs-config/netconf-north-bound/capabilities  
> Decide which NETCONF capabilities to enable here.

/ncs-config/netconf-north-bound/capabilities/url  
> Turn on the URL capability options we want to support.

/ncs-config/netconf-north-bound/capabilities/url/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', the url NETCONF
> capability is enabled.

/ncs-config/netconf-north-bound/capabilities/url/file  
> Decide how the url file support should behave.

/ncs-config/netconf-north-bound/capabilities/url/file/enabled (boolean) \[true\]  
> enabled is either 'true' or 'false'. If 'true', the url file scheme is
> enabled.

/ncs-config/netconf-north-bound/capabilities/url/file/root-dir (string)  
> root-dir is a directory path on disk where the system stores the
> result from a NETCONF operation using the url capability. This
> parameter must be set if the file url scheme is enabled.

/ncs-config/netconf-north-bound/capabilities/url/ftp  
> Decide how the url ftp scheme should behave.

/ncs-config/netconf-north-bound/capabilities/url/ftp/enabled (boolean) \[true\]  
> enabled is either 'true' or 'false'. If 'true', the url ftp scheme is
> enabled.

/ncs-config/netconf-north-bound/capabilities/url/ftp/source-address  
> This section provides the possibility to specify the source address to
> use for ftp connnections. In most cases the source address assignment
> is best left to the TCP/IP stack in the OS, since an incorrectly
> chosen address may result in connection failures. However in case
> there is more than one address that could be chosen by the stack, and
> we need to restrict the choice to one of them, these settings can be
> used.

/ncs-config/netconf-north-bound/capabilities/url/ftp/source-address/ipv4 (ipv4-address)  
> The source address to use for IPv4 connections. If not set, the source
> address will be assigned by the OS.

/ncs-config/netconf-north-bound/capabilities/url/ftp/source-address/ipv6 (ipv6-address)  
> The source address to use for IPv6 connections. If not set, the source
> address will be assigned by the OS.

/ncs-config/netconf-north-bound/capabilities/url/sftp  
> Decide how the url sftp scheme should behave.

/ncs-config/netconf-north-bound/capabilities/url/sftp/enabled (boolean) \[true\]  
> enabled is either 'true' or 'false'. If 'true', the url sftp scheme is
> enabled.

/ncs-config/netconf-north-bound/capabilities/url/sftp/source-address  
> This section provides the possibility to specify the source address to
> use for sftp connnections. In most cases the source address assignment
> is best left to the TCP/IP stack in the OS, since an incorrectly
> chosen address may result in connection failures. However in case
> there is more than one address that could be chosen by the stack, and
> we need to restrict the choice to one of them, these settings can be
> used.

/ncs-config/netconf-north-bound/capabilities/url/sftp/source-address/ipv4 (ipv4-address)  
> The source address to use for IPv4 connections. If not set, the source
> address will be assigned by the OS.

/ncs-config/netconf-north-bound/capabilities/url/sftp/source-address/ipv6 (ipv6-address)  
> The source address to use for IPv6 connections. If not set, the source
> address will be assigned by the OS.

/ncs-config/netconf-north-bound/capabilities/inactive  
> DEPRECATED - the YANG module tailf-netconf-inactive will be announced
> if its fxs file is found in the loadPath and
> /ncs-config/enable-inactive is set.
>
> Control of the inactive capability option.

/ncs-config/netconf-north-bound/capabilities/inactive/enabled (boolean) \[true\]  
> enabled is either 'true' or 'false'. If 'true', the
> 'http://tail-f.com/ns/netconf/inactive/1.0' capability is enabled.

/ncs-config/netconf-call-home  
> This section defines settings which decide how the NETCONF Call Home
> client should behave, with respect to TCP.

/ncs-config/netconf-call-home/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', the NETCONF Call Home
> client is started.

/ncs-config/netconf-call-home/transport  
> Settings for the NETCONF Call Home transport service.

/ncs-config/netconf-call-home/transport/tcp  
> The NETCONF Call Home client listens for TCP connection requests.

/ncs-config/netconf-call-home/transport/tcp/ip (ipv4-address \| ipv6-address) \[0.0.0.0\]  
> ip is an IP address which the NETCONF Call Home client should listen
> on. '0.0.0.0' or '::' means that it listens on the port
> (/ncs-config/netconf-call-home/transport/tcp/port) for all IPv4 or
> IPv6 addresses on the machine.

/ncs-config/netconf-call-home/transport/tcp/port (port-number) \[4334\]  
> port is a valid port number to be used in combination with
> /ncs-config/netconf-call-home/transport/tcp/ip.

/ncs-config/netconf-call-home/transport/tcp/extra-listen  
> A list of additional IP address and port pairs which the NETCONF Call
> Home client should also listen on. Set the ip as '0.0.0.0' or '::' to
> listen on the port for all IPv4 or IPv6 addresses on the machine.

/ncs-config/netconf-call-home/transport/tcp/extra-listen/ip (ipv4-address \| ipv6-address)  
> 

/ncs-config/netconf-call-home/transport/tcp/extra-listen/port (port-number)  
> 

/ncs-config/netconf-call-home/transport/tcp/dscp (dscp-type)  
> Support for setting the Differentiated Services Code Point (6 bits)
> for traffic originating from the NETCONF Call Home client for TCP
> connections.

/ncs-config/netconf-call-home/transport/ssh/idle-connection-timeout (xs:duration) \[PT30S\]  
> The maximum time that the authenticated SSH connection is allowed to
> exist without open channels. If the timeout is reached, the SSH server
> closes the connection. Default is PT30S, i.e. 30 seconds. If the value
> is 0, there is no timeout.

/ncs-config/southbound-source-address  
> This section provides the possibility to specify the source address to
> use for southbound connnections from NCS to the devices. In most cases
> the source address assignment is best left to the TCP/IP stack in the
> OS, since an incorrectly chosen address may result in connection
> failures. However in case there is more than one address that could be
> chosen by the stack, and we need to restrict the choice to one of
> them, these settings can be used.

/ncs-config/southbound-source-address/ipv4 (ipv4-address)  
> The source address to use for southbound IPv4 connections. If not set,
> the source address will be assigned by the OS.

/ncs-config/southbound-source-address/ipv6 (ipv6-address)  
> The source address to use for southbound IPv6 connections. If not set,
> the source address will be assigned by the OS.

/ncs-config/ha-raft/enabled (boolean) \[false\]  
> If set to true, the HA Raft mode is enabled.

/ncs-config/ha-raft/dist-ip-version (inet:ip-version) \[ipv4\]  
> Distributed erlang Internet Protocol version.

/ncs-config/ha-raft/cluster-name (string)  
> Unique cluster identifier. All HA nodes of a cluster must be
> configured with the same cluster-name.

/ncs-config/ha-raft/listen/node-address (fq-domain-name-with-optional-node-id \| ipv4-address-with-optional-node-id \| ipv6-address-with-optional-node-id)  
> This parameter is mandatory.
>
> The address uniquely identifies the NCS HA node and also binds
> corresponding address for incoming connections. The format is either
> n1.acme.com, 10.45.22.11, fe11::ff or with the optional node-id part
> ncsd@n1.acme.com, ncsd@10.45.22.11 or ncsd@fe11::ff The latter
> addresses allow multiple NCS HA nodes to run on the same host.
>
> Note: wildcard addresses (such as '0.0.0.0' and '::') are invalid

/ncs-config/ha-raft/listen/min-port (inet:port-number) \[4370\]  
> Specifies the lower bound in the range of ports the local HA node is
> allowed to listen for incoming connections.

/ncs-config/ha-raft/listen/max-port (inet:port-number) \[4399\]  
> Specifies the upper bound in the range of ports the local HA node is
> allowed to listen for incoming connections.

/ncs-config/ha-raft/seed-nodes/seed-node (fq-domain-name-with-optional-node-id \| ipv4-address-with-optional-node-id \| ipv6-address-with-optional-node-id)  
> This parameter may be given multiple times.
>
> The address of an NCS HA node that the local NCS node should try to
> connect to when starting up to establish connectivity to the HA
> cluster.

/ncs-config/ha-raft/ssl/enabled (boolean) \[true\]  
> If set to 'true', all communication between NCS HA nodes is done over
> SSL/TLS.
>
> WARNING: only set this leaf to 'false' during testing/debugging, all
> communication between HA nodes is transported unencrypted and no
> authentication is performed. HA Raft communicates over Distributed
> Erlang protocol which allows any Erlang node to execute code remotely
> on the nodes connected to using Remote Process Calls (rpc).

/ncs-config/ha-raft/ssl/key-file (string)  
> Specifies which file that contains the private key for the
> certificate.

/ncs-config/ha-raft/ssl/cert-file (string)  
> Specifies which file that contains the HA node certificate.

/ncs-config/ha-raft/ssl/ca-cert-file (string)  
> Specifies which file that contains the trusted certificates to use
> during peer authentication and to use when attempting to build the
> certificate chain.

/ncs-config/ha-raft/ssl/crl-dir (string)  
> Path to directory where Certificate Revocation Lists (CRL) are stored
> in files named by the hash of the issuer name suffixed with '.rN'
> where 'N' is an integer represention the version, e.g., 90a3ab2b.r0.
>
> The hash of the CRL issuer can be displayed using openssl, for
> example:
>
> <div class="informalexample">
>
>        $ openssl crl -hash -noout -in crl.pem
>
> </div>

/ncs-config/ha-raft/tick-timeout (xs:duration) \[PT1S\]  
> Defines the timeout between keepalive ticks sent between HA RAFT
> nodes. If a node fails to reply to three ticks, an alarm is raised. If
> later on the node recovers, the alarm is cleared.
>
> Since this mechanism does not automatically disconnect the node but
> only raises an alarm, and the ability of clients to commit
> transactions relies on availability of sufficient number of nodes, the
> leaf uses a more aggressive default value.

/ncs-config/ha-raft/storage-timeout (xs:duration) \[PT2H\]  
> Defines the timeout value for snapshot loading on HA RAFT follower
> nodes.

/ncs-config/ha-raft/follower-max-lag (uint32) \[50000\]  
> Maximum number of RAFT log entries that an HA node can lag behing the
> leader node before triggering a bulk log transfer or snapshot recovery
> to catch up to the leader.

/ncs-config/ha-raft/log-max-entries (uint64) \[200000\]  
> Maximum number of RAFT log entries kept as state on the HA cluster
> leader. Upon reaching this limit all previous entries will be trimmed.
>
> Note, cluster members lagging behind the oldest available entry will
> require snapshot recovery. It is recommended to keep at least twice
> the amount of entries than the allowed follower lag.

/ncs-config/ha-raft/passive (boolean) \[false\]  
> A passive node is not eligible to be elected leader.

/ncs-config/ha/enabled (boolean) \[false\]  
> If set to true, the HA mode is enabled.

/ncs-config/ha/ip (ipv4-address \| ipv6-address) \[0.0.0.0\]  
> The IP address which NCS listens to for incoming connections from
> other HA nodes. '0.0.0.0' or '::' means that it listens on the port
> (/ncs-config/ha/ip/port) for all IPv4 or IPv6 addresses on the
> machine.

/ncs-config/ha/port (port-number) \[4570\]  
> The port number which NCS listens to for incoming connections from
> other HA nodes

/ncs-config/ha/extra-listen  
> A list of additional IP address and port pairs which are used for
> incoming requests from other HA nodes. Set the ip as '0.0.0.0' or '::'
> to listen on the port for all IPv4 or IPv6 addresses on the machine.

/ncs-config/ha/extra-listen/ip (ipv4-address \| ipv6-address)  
> 

/ncs-config/ha/extra-listen/port (port-number)  
> 

/ncs-config/ha/tick-timeout (xs:duration) \[PT20S\]  
> Defines the timeout between keepalive ticks sent between HA nodes. The
> special value 'PT0' means that no keepalive ticks will ever be sent.

/ncs-config/scripts  
> It is possible to add scripts to control various things in NCS, such
> as post-commit callbacks. New CLI commands can also be added. The
> scripts must be stored under /ncs-config/scripts/dir where there is a
> sub-directory for each sript category. For some script categories it
> suffices to just add a script in the correct the sub-directory in
> order to enable the script. For others some configuration needs to be
> done.

/ncs-config/scripts/dir (string)  
> This parameter may be given multiple times.
>
> Directory path to the location of plug-and-play scripts. The scripts
> directory must have the following sub-directories:
>
> <div class="informalexample">
>
>       scripts/command/
>              post-commit/
>
> </div>

/ncs-config/java-vm  
> Configuration parameters to control how and if NCS shall start (and
> restart) the Java Virtual Machine.

/ncs-config/java-vm/auto-start (boolean) \[true\]  
> If 'true', NCS automatically starts the Java VM if any Java package is
> loaded using the 'start-command'.

/ncs-config/java-vm/auto-restart (boolean) \[true\]  
> Restart the Java VM if it terminates.
>
> Only applicable if auto-start is 'true'.

/ncs-config/java-vm/start-command (string)  
> The command which NCS will run to start the Java VM, or the string
> DEFAULT. If this parameter is not set, the ncs-start-java-vm script in
> the NCS installation directory will be used as the start command. The
> string DEFAULT is supported for backward compatibility reasons and is
> equivalent to leaving this parameter unset.

/ncs-config/java-vm/run-in-terminal  
> Enable this feature to run the Java VM inside a terminal, such as
> xterm or gnome-terminal.
>
> This can be very convenient during development; to restart the Java
> VM, just kill the terminal.
>
> Only applicable if auto-start is 'true'.

/ncs-config/java-vm/run-in-terminal/enabled (boolean) \[false\]  
> 

/ncs-config/java-vm/run-in-terminal/terminal-command (string) \[xterm -title ncs-java-vm -e\]  
> The command which NCS will run to start the terminal, or the string
> DEFAULT. The string DEFAULT is supported for backward compatibility
> reasons and is equivalent to leaving this parameter unset.

/ncs-config/java-vm/stdout-capture/enabled (boolean)  
> Enable stdout and stderr capture

/ncs-config/java-vm/stdout-capture/file (string)  
> The prefix used for the Java VM log file, or the string DEFAULT.
> Setting a value here overrides any setting for
> /java-vm/stdout-capture/file in the tailf-ncs-java-vm.yang submodule.
> The string DEFAULT means that the default as specified in
> tailf-ncs-java-vm.yang should be used.

/ncs-config/java-vm/restart-on-error/enabled (boolean) \[false\]  
> If true, catching 'count' number of exceptions from a package within
> 'duration' seconds will result in the java-vm being restarted. If
> false, the 'count' and 'duration' settings below do not have any
> effect. Exceptions from a package will lead to only that package being
> redeployed.

/ncs-config/java-vm/restart-on-error/count (uint16) \[3\]  
> 

/ncs-config/java-vm/restart-on-error/duration (xs:duration) \[PT60S\]  
> 

/ncs-config/python-vm  
> Configuration parameters to control how and if NCS shall start (and
> restart) the Python Virtual Machine.

/ncs-config/python-vm/auto-start (boolean) \[true\]  
> If 'true', NCS automatically starts the Python VM, using the
> 'start-command'.

/ncs-config/python-vm/auto-restart (boolean) \[true\]  
> Restart the Python VM if it terminates.
>
> Only applicable if auto-start is 'true'.

/ncs-config/python-vm/start-command (string)  
> The command which NCS will run to start the Python VM, or the string
> DEFAULT. If this parameter is not set, the ncs-start-python-vm script
> in the NCS installation directory will be used as the start command.
> The string DEFAULT is supported for backward compatibility reasons and
> is equivalent to leaving this parameter unset.

/ncs-config/python-vm/run-in-terminal/enabled (boolean) \[false\]  
> 

/ncs-config/python-vm/run-in-terminal/terminal-command (string) \[xterm -title ncs-python-vm -e\]  
> The command which NCS will run to start the terminal, or the string
> DEFAULT. The string DEFAULT is supported for backward compatibility
> reasons and is equivalent to leaving this parameter unset.

/ncs-config/python-vm/logging/log-file-prefix (string)  
> The prefix used for the Python VM log file, or the string DEFAULT.
> Setting a value here overrides any setting for
> /python-vm/logging/log-file-prefix in the tailf-ncs-python-vm.yang
> submodule. The string DEFAULT means that the default as specified in
> tailf-ncs-python-vm.yang should be used.

/ncs-config/python-vm/start-timeout (xs:duration) \[PT30S\]  
> Timeout for each Python VM to start and initialize registered classes
> after it has been started by NCS.

/ncs-config/smart-license  
> This section provides the possibility to override parameters in the
> tailf-ncs-smart-license.yang submodule, thus preventing setting of
> those parameters via northbound interfaces from having any effect,
> even if the NACM access rules allow it.
>
> Refer to tailf-ncs-smart-license.yang for a detailed description of
> the parameters.

/ncs-config/smart-license/smart-agent/java-executable (string)  
> The Java VM executable that NCS will use for smart licensing, or the
> string DEFAULT. Setting a value here overrides any setting for
> /smart-license/smart-agent/java-executable in the
> tailf-ncs-smart-license.yang submodule. The string DEFAULT means that
> the default as specified in tailf-ncs-smart-license.yang should be
> used.

/ncs-config/smart-license/smart-agent/java-options (string)  
> Options which NCS will use when starting the Java VM, or the string
> DEFAULT. Setting a value here overrides any setting for
> /smart-license/smart-agent/java-options in the
> tailf-ncs-smart-license.yang submodule. The string DEFAULT means that
> the default as specified in tailf-ncs-smart-license.yang should be
> used.

/ncs-config/smart-license/smart-agent/production-url (uri \| string)  
> URL that NCS will use when connecting to the Cisco licensing cloud or
> the string DEFAULT. Setting a value here overrides any setting for
> /smart-license/smart-agent/production-url in the
> tailf-ncs-smart-license.yang submodule. The string DEFAULT means that
> the default as specified in tailf-ncs-smart-license.yang should be
> used.

/ncs-config/smart-license/smart-agent/alpha-url (uri \| string)  
> URL that NCS will use when connecting to the Alpha licensing cloud or
> the string DEFAULT. Setting a value here overrides any setting for
> /smart-license/smart-agent/alpha-url in the
> tailf-ncs-smart-license.yang submodule. The string DEFAULT means that
> the default as specified in tailf-ncs-smart-license.yang should be
> used.

/ncs-config/smart-license/smart-agent/override-url/url (uri \| string)  
> URL that NCS will use when connecting to the Cisco licensing cloud or
> the string DEFAULT. Setting a value here overrides any setting for
> /smart-license/smart-agent/override-url in the
> tailf-ncs-smart-license.yang submodule. The string DEFAULT means that
> the default as specified in tailf-ncs-smart-license.yang should be
> used.

/ncs-config/smart-license/smart-agent/proxy/url (uri \| string)  
> Proxy URL for the smart licensing agent, or the string DEFAULT.
> Setting a value here overrides any setting for
> /smart-license/smart-agent/proxy/url in the
> tailf-ncs-smart-license.yang submodule. The string DEFAULT effectively
> disables the proxy URL, since there is no default specified in
> tailf-ncs-smart-license.yang.

/ncs-config/disable-schema-uri-for-agents (netconf \| rest)  
> This parameter may be given multiple times.
>
> disable-schema-uri-for-agents is a leaf-list of northbound agents that
> schema leaf is not wanted in the ietf-yang-library:modules-state
> resource response.

## Yang Types

### bsd-facility-type

The facility argument is used to specify what type of program is logging
the message. This lets the syslog configuration file specify that
messages from different facilities will be handled differently

### fq-domain-name-with-optional-node-id

Fully qualified domain name. Similar to inet:domain-name but requires at
least two domain parts and allows for an optional node-id part.

### ip-address-with-optional-node-id

Similar to inet:ip-address with an optional node-id part.

## See Also

`ncs(1)` - command to start and control the NCS daemon
