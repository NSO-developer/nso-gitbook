# Log Messages and Formats


<details>

<summary><code>AAA_LOAD_FAIL</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  Failed to load the AAA data, it could be that an external db is misbehaving or AAA is mounted/populated badly
* **Format String**  
  `"Failed to load AAA: ~s"`

</details>


<details>

<summary><code>ABORT_CAND_COMMIT</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Aborting candidate commit, request from user, reverting configuration.
* **Format String**  
  `"Aborting candidate commit, request from user, reverting configuration."`

</details>


<details>

<summary><code>ABORT_CAND_COMMIT_REBOOT</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  ConfD restarted while having a ongoing candidate commit timer, reverting configuration.
* **Format String**  
  `"ConfD restarted while having a ongoing candidate commit timer, reverting configuration."`

</details>


<details>

<summary><code>ABORT_CAND_COMMIT_TERM</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Candidate commit session terminated, reverting configuration.
* **Format String**  
  `"Candidate commit session terminated, reverting configuration."`

</details>


<details>

<summary><code>ABORT_CAND_COMMIT_TIMER</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Candidate commit timer expired, reverting configuration.
* **Format String**  
  `"Candidate commit timer expired, reverting configuration."`

</details>


<details>

<summary><code>ACCEPT_FATAL</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  ConfD encountered an OS-specific error indicating that networking support is unavailable.
* **Format String**  
  `"Fatal error for accept() - ~s"`

</details>


<details>

<summary><code>ACCEPT_FDLIMIT</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  ConfD failed to accept a connection due to reaching the process or system-wide file descriptor limit.
* **Format String**  
  `"Out of file descriptors for accept() - ~s limit reached"`

</details>


<details>

<summary><code>AUTH_LOGIN_FAIL</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  A user failed to log in to ConfD.
* **Format String**  
  `"login failed via ~s from ~s with ~s: ~s"`

</details>


<details>

<summary><code>AUTH_LOGIN_SUCCESS</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  A user logged into ConfD.
* **Format String**  
  `"logged in to ~s via ~s from ~s with ~s using ~s authentication"`

</details>


<details>

<summary><code>AUTH_LOGOUT</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  A user was logged out from ConfD.
* **Format String**  
  `"logged out <~s> user"`

</details>


<details>

<summary><code>BADCONFIG</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  confd.conf contained bad data.
* **Format String**  
  `"Bad configuration: ~s:~s: ~s"`

</details>


<details>

<summary><code>BAD_DEPENDENCY</code></summary>

* **Severity**  
  `ERR`
* **Description**  
  A dependency was not found
* **Format String**  
  `"The dependency node '~s' for node '~s' in module '~s' does not exist"`

</details>


<details>

<summary><code>BAD_NS_HASH</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  Two namespaces have the same hash value. The namespace hashvalue MUST be unique.  You can pass the flag --nshash <value> to confdc when linking the .xso files to force another value for the namespace hash.
* **Format String**  
  `"~s"`

</details>


<details>

<summary><code>BIND_ERR</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  ConfD failed to bind to one of the internally used listen sockets.
* **Format String**  
  `"~s"`

</details>


<details>

<summary><code>BRIDGE_DIED</code></summary>

* **Severity**  
  `ERR`
* **Description**  
  ConfD is configured to start the confd_aaa_bridge and the C program died.
* **Format String**  
  `"confd_aaa_bridge died - ~s"`

</details>


<details>

<summary><code>CANDIDATE_BAD_FILE_FORMAT</code></summary>

* **Severity**  
  `WARNING`
* **Description**  
  The candidate database file has a bad format. The candidate database is reset to the empty database.
* **Format String**  
  `"Bad format found in candidate db file ~s; resetting candidate"`

</details>


<details>

<summary><code>CANDIDATE_CORRUPT_FILE</code></summary>

* **Severity**  
  `WARNING`
* **Description**  
  The candidate database file is corrupt and cannot be read. The candidate database is reset to the empty database.
* **Format String**  
  `"Corrupt candidate db file ~s; resetting candidate"`

</details>


<details>

<summary><code>CAND_COMMIT_ROLLBACK_DONE</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Candidate commit rollback done
* **Format String**  
  `"Candidate commit rollback done"`

</details>


<details>

<summary><code>CAND_COMMIT_ROLLBACK_FAILURE</code></summary>

* **Severity**  
  `ERR`
* **Description**  
  Failed to rollback candidate commit
* **Format String**  
  `"Failed to rollback candidate commit due to: ~s"`

</details>


<details>

<summary><code>CDB_BACKUP</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  CDB data backed up after migration to a new storage backend.
* **Format String**  
  `"CDB: ~s backed up to ~s"`

</details>


<details>

<summary><code>CDB_BOOT_ERR</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  CDB failed to start. Some grave error in the cdb data files prevented CDB from starting - a recovery from backup is necessary.
* **Format String**  
  `"CDB boot error: ~s"`

</details>


<details>

<summary><code>CDB_CLIENT_TIMEOUT</code></summary>

* **Severity**  
  `ERR`
* **Description**  
  A CDB client failed to answer within the timeout period. The client will be disconnected.
* **Format String**  
  `"CDB client (~s) timed out, waiting for ~s"`

</details>


<details>

<summary><code>CDB_CONFIG_LOST</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  CDB found it's data files but no schema file. CDB recovers by starting from an empty database.
* **Format String**  
  `"CDB: lost config, deleting DB"`

</details>


<details>

<summary><code>CDB_DB_LOST</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  CDB found it's data schema file but not it's data file. CDB recovers by starting from an empty database.
* **Format String**  
  `"CDB: lost DB, deleting old config"`

</details>


<details>

<summary><code>CDB_FATAL_ERROR</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  CDB encounterad an unrecoverable error
* **Format String**  
  `"fatal error in CDB: ~s"`

</details>


<details>

<summary><code>CDB_INIT_LOAD</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  CDB is processing an initialization file.
* **Format String**  
  `"CDB load: processing file: ~s"`

</details>


<details>

<summary><code>CDB_MIGRATE</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  CDB data migration to a new storage backend.
* **Format String**  
  `"CDB: migrate ~s to ~s"`

</details>


<details>

<summary><code>CDB_OFFLOAD</code></summary>

* **Severity**  
  `DEBUG`
* **Description**  
  CDB data offload started.
* **Format String**  
  `"CDB: offload ~s from memory"`

</details>


<details>

<summary><code>CDB_OP_INIT</code></summary>

* **Severity**  
  `ERR`
* **Description**  
  The operational DB was deleted and re-initialized (because of upgrade or corrupt file)
* **Format String**  
  `"CDB: Operational DB re-initialized"`

</details>


<details>

<summary><code>CDB_STALE_BACKUP</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  CDB backup data left on disk after migration that can be removed to free up disk space.
* **Format String**  
  `"CDB: ~s backup file(s) occupying ~sMiB, remove to free up disk space: ~s"`

</details>


<details>

<summary><code>CDB_UPGRADE_FAILED</code></summary>

* **Severity**  
  `ERR`
* **Description**  
  Automatic CDB upgrade failed. This means that the data model has been changed in a non-supported way.
* **Format String**  
  `"CDB: Upgrade failed: ~s"`

</details>


<details>

<summary><code>CGI_REQUEST</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  CGI script requested.
* **Format String**  
  `"CGI: '~s' script with method ~s"`

</details>


<details>

<summary><code>CLI_CMD</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  User executed a CLI command.
* **Format String**  
  `"CLI '~s'"`

</details>


<details>

<summary><code>CLI_CMD_ABORTED</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  CLI command aborted.
* **Format String**  
  `"CLI aborted"`

</details>


<details>

<summary><code>CLI_CMD_DONE</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  CLI command finished successfully.
* **Format String**  
  `"CLI done"`

</details>


<details>

<summary><code>CLI_DENIED</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  User was denied to execute a CLI command due to permissions.
* **Format String**  
  `"CLI denied '~s'"`

</details>


<details>

<summary><code>COMMIT_INFO</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Information about configuration changes committed to the running data store.
* **Format String**  
  `"commit ~s"`

</details>


<details>

<summary><code>COMMIT_QUEUE_CORRUPT</code></summary>

* **Severity**  
  `ERR`
* **Description**  
  Failed to load commit queue. ConfD recovers by starting from an empty commit queue.
* **Format String**  
  `"Resetting commit queue due do inconsistent or corrupt data."`

</details>


<details>

<summary><code>CONFIG_CHANGE</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  A change to ConfD configuration has taken place, e.g., by a reload of the configuration file
* **Format String**  
  `"ConfD configuration change: ~s"`

</details>


<details>

<summary><code>CONFIG_DEPRECATED</code></summary>

* **Severity**  
  `WARNING`
* **Description**  
  confd.conf contains a deprecated value
* **Format String**  
  `"Config value is deprecated: ~s"`

</details>


<details>

<summary><code>CONFIG_OBSOLETE</code></summary>

* **Severity**  
  `WARNING`
* **Description**  
  confd.conf contains an obsolete value
* **Format String**  
  `"Config value is obsolete: ~s"`

</details>


<details>

<summary><code>CONFIG_TRANSACTION_LIMIT</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Configuration transaction limit reached, rejected new transaction request.
* **Format String**  
  `"Configuration transaction limit of type '~s' reached, rejected new transaction request"`

</details>


<details>

<summary><code>CONSULT_FILE</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  ConfD is reading its configuration file.
* **Format String**  
  `"Consulting daemon configuration file ~s"`

</details>


<details>

<summary><code>CRYPTO_KEYS_FAILED_LOADING</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Crypto keys failed to load because the old active generation is missing in the new configuration.
* **Format String**  
  `"Cannot reload crypto keys since the old active generation is missing in the new list of keys."`

</details>


<details>

<summary><code>DAEMON_DIED</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  An external database daemon closed its control socket.
* **Format String**  
  `"Daemon ~s died"`

</details>


<details>

<summary><code>DAEMON_TIMEOUT</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  An external database daemon did not respond to a query.
* **Format String**  
  `"Daemon ~s timed out"`

</details>


<details>

<summary><code>DEVEL_AAA</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Developer aaa log message
* **Format String**  
  `"~s"`

</details>


<details>

<summary><code>DEVEL_CAPI</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Developer C api log message
* **Format String**  
  `"~s"`

</details>


<details>

<summary><code>DEVEL_CDB</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Developer CDB log message
* **Format String**  
  `"~s"`

</details>


<details>

<summary><code>DEVEL_CONFD</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Developer ConfD log message
* **Format String**  
  `"~s"`

</details>


<details>

<summary><code>DEVEL_ECONFD</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Developer econfd api log message
* **Format String**  
  `"~s"`

</details>


<details>

<summary><code>DEVEL_SLS</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Developer smartlicensing api log message
* **Format String**  
  `"~s"`

</details>


<details>

<summary><code>DEVEL_SNMPA</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Developer snmp agent log message
* **Format String**  
  `"~s"`

</details>


<details>

<summary><code>DEVEL_SNMPGW</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Developer snmp GW log message
* **Format String**  
  `"~s"`

</details>


<details>

<summary><code>DEVEL_WEBUI</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Developer webui log message
* **Format String**  
  `"~s"`

</details>


<details>

<summary><code>DUPLICATE_NAMESPACE</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  Duplicate namespace found.
* **Format String**  
  `"The namespace ~s is defined in both module ~s and ~s."`

</details>


<details>

<summary><code>DUPLICATE_PREFIX</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  Duplicate prefix found.
* **Format String**  
  `"The prefix ~s is defined in both ~s and ~s."`

</details>


<details>

<summary><code>ERRLOG_SIZE_CHANGED</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Notify change of log size for error log
* **Format String**  
  `"Changing size of error log (~s) to ~s (was ~s)"`

</details>


<details>

<summary><code>EVENT_SOCKET_TIMEOUT</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  An event notification subscriber did not reply within the configured timeout period
* **Format String**  
  `"Event notification subscriber with bitmask ~s timed out, waiting for ~s"`

</details>


<details>

<summary><code>EVENT_SOCKET_WRITE_BLOCK</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  Write on an event socket blocked for too long time
* **Format String**  
  `"~s"`

</details>


<details>

<summary><code>EXEC_WHEN_CIRCULAR_DEPENDENCY</code></summary>

* **Severity**  
  `WARNING`
* **Description**  
  An error occurred while evaluating a when-expression.
* **Format String**  
  `"When-expression evaluation error: circular dependency in ~s"`

</details>


<details>

<summary><code>EXTAUTH_BAD_RET</code></summary>

* **Severity**  
  `ERR`
* **Description**  
  Authentication is external and the external program returned badly formatted data.
* **Format String**  
  `"External auth program (user=~s) ret bad output: ~s"`

</details>


<details>

<summary><code>EXT_AUTH_2FA</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  External challenge sent to a user.
* **Format String**  
  `"external challenge sent to ~s from ~s with ~s"`

</details>


<details>

<summary><code>EXT_AUTH_2FA_FAIL</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  External challenge authentication failed for a user.
* **Format String**  
  `"external challenge authentication failed via ~s from ~s with ~s: ~s"`

</details>


<details>

<summary><code>EXT_AUTH_2FA_SUCCESS</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  An external challenge authenticated user logged in.
* **Format String**  
  `"external challenge authentication succeeded via ~s from ~s with ~s, member of groups: ~s~s"`

</details>


<details>

<summary><code>EXT_AUTH_FAIL</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  External authentication failed for a user.
* **Format String**  
  `"external authentication failed via ~s from ~s with ~s: ~s"`

</details>


<details>

<summary><code>EXT_AUTH_SUCCESS</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  An externally authenticated user logged in.
* **Format String**  
  `"external authentication succeeded via ~s from ~s with ~s, member of groups: ~s~s"`

</details>


<details>

<summary><code>EXT_AUTH_TOKEN_FAIL</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  External token authentication failed for a user.
* **Format String**  
  `"external token authentication failed via ~s from ~s with ~s: ~s"`

</details>


<details>

<summary><code>EXT_AUTH_TOKEN_SUCCESS</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  An externally token authenticated user logged in.
* **Format String**  
  `"external token authentication succeeded via ~s from ~s with ~s, member of groups: ~s~s"`

</details>


<details>

<summary><code>EXT_BIND_ERR</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  ConfD failed to bind to one of the externally visible listen sockets.
* **Format String**  
  `"~s"`

</details>


<details>

<summary><code>FILE_ERROR</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  File error
* **Format String**  
  `"~s: ~s"`

</details>


<details>

<summary><code>FILE_LOAD</code></summary>

* **Severity**  
  `DEBUG`
* **Description**  
  System loaded a file.
* **Format String**  
  `"Loaded file ~s"`

</details>


<details>

<summary><code>FILE_LOADING</code></summary>

* **Severity**  
  `DEBUG`
* **Description**  
  System starts to load a file.
* **Format String**  
  `"Loading file ~s"`

</details>


<details>

<summary><code>FILE_LOAD_ERR</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  System tried to load a file in its load path and failed.
* **Format String**  
  `"Failed to load file ~s: ~s"`

</details>


<details>

<summary><code>FXS_MISMATCH</code></summary>

* **Severity**  
  `ERR`
* **Description**  
  A secondary connected to a primary where the fxs files are different
* **Format String**  
  `"Fxs mismatch, secondary is not allowed"`

</details>


<details>

<summary><code>GROUP_ASSIGN</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  A user was assigned to a set of groups.
* **Format String**  
  `"assigned to groups: ~s"`

</details>


<details>

<summary><code>GROUP_NO_ASSIGN</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  A user was logged in but wasn't assigned to any groups at all.
* **Format String**  
  `"Not assigned to any groups - all access is denied"`

</details>


<details>

<summary><code>HA_BAD_VSN</code></summary>

* **Severity**  
  `ERR`
* **Description**  
  A secondary connected to a primary with an incompatible HA protocol version
* **Format String**  
  `"Incompatible HA version (~s, expected ~s), secondary is not allowed"`

</details>


<details>

<summary><code>HA_DUPLICATE_NODEID</code></summary>

* **Severity**  
  `ERR`
* **Description**  
  A secondary arrived with a node id which already exists
* **Format String**  
  `"Nodeid ~s already exists"`

</details>


<details>

<summary><code>HA_FAILED_CONNECT</code></summary>

* **Severity**  
  `ERR`
* **Description**  
  An attempted library become secondary call failed because the secondary couldn't connect to the primary
* **Format String**  
  `"Failed to connect to primary: ~s"`

</details>


<details>

<summary><code>HA_SECONDARY_KILLED</code></summary>

* **Severity**  
  `ERR`
* **Description**  
  A secondary node didn't produce its ticks
* **Format String**  
  `"Secondary ~s killed due to no ticks"`

</details>


<details>

<summary><code>INTERNAL_ERROR</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  A ConfD internal error - should be reported to support@tail-f.com.
* **Format String**  
  `"Internal error: ~s"`

</details>


<details>

<summary><code>JIT_ENABLED</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Show if JIT is enabled.
* **Format String**  
  `"JIT ~s"`

</details>


<details>

<summary><code>JSONRPC_LOG_MSG</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  JSON-RPC traffic log message
* **Format String**  
  `"JSON-RPC traffic log: ~s"`

</details>


<details>

<summary><code>JSONRPC_REQUEST</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  JSON-RPC method requested.
* **Format String**  
  `"JSON-RPC: '~s' with JSON params ~s"`

</details>


<details>

<summary><code>JSONRPC_REQUEST_ABSOLUTE_TIMEOUT</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  JSON-RPC absolute timeout.
* **Format String**  
  `"Stopping session due to absolute timeout: ~s"`

</details>


<details>

<summary><code>JSONRPC_REQUEST_IDLE_TIMEOUT</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  JSON-RPC idle timeout.
* **Format String**  
  `"Stopping session due to idle timeout: ~s"`

</details>


<details>

<summary><code>JSONRPC_WARN_MSG</code></summary>

* **Severity**  
  `WARNING`
* **Description**  
  JSON-RPC warning message
* **Format String**  
  `"JSON-RPC warning: ~s"`

</details>


<details>

<summary><code>KICKER_MISSING_SCHEMA</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Failed to load kicker schema
* **Format String**  
  `"Failed to load kicker schema"`

</details>


<details>

<summary><code>LIB_BAD_SIZES</code></summary>

* **Severity**  
  `ERR`
* **Description**  
  An application connecting to ConfD used a library version that can't handle the depth and number of keys used by the data model.
* **Format String**  
  `"Got connect from library with insufficient keypath depth/keys support (~s/~s, needs ~s/~s)"`

</details>


<details>

<summary><code>LIB_BAD_VSN</code></summary>

* **Severity**  
  `ERR`
* **Description**  
  An application connecting to ConfD used a library version that doesn't match the ConfD version (e.g. old version of the client library).
* **Format String**  
  `"Got library connect from wrong version (~s, expected ~s)"`

</details>


<details>

<summary><code>LIB_NO_ACCESS</code></summary>

* **Severity**  
  `ERR`
* **Description**  
  Access check failure occurred when an application connected to ConfD.
* **Format String**  
  `"Got library connect with failed access check: ~s"`

</details>


<details>

<summary><code>LISTENER_INFO</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  ConfD starts or stops to listen for incoming connections.
* **Format String**  
  `"~s to listen for ~s on ~s:~s"`

</details>


<details>

<summary><code>LOCAL_AUTH_FAIL</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Authentication for a locally configured user failed.
* **Format String**  
  `"local authentication failed via ~s from ~s with ~s: ~s"`

</details>


<details>

<summary><code>LOCAL_AUTH_FAIL_BADPASS</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Authentication for a locally configured user failed due to providing bad password.
* **Format String**  
  `"local authentication failed via ~s from ~s with ~s: ~s"`

</details>


<details>

<summary><code>LOCAL_AUTH_FAIL_NOUSER</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Authentication for a locally configured user failed due to user not found.
* **Format String**  
  `"local authentication failed via ~s from ~s with ~s: ~s"`

</details>


<details>

<summary><code>LOCAL_AUTH_SUCCESS</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  A locally authenticated user logged in.
* **Format String**  
  `"local authentication succeeded via ~s from ~s with ~s, member of groups: ~s"`

</details>


<details>

<summary><code>LOCAL_IPC_ACCESS_DENIED</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Local IPC access denied for user.
* **Format String**  
  `"Local IPC access denied for user ~s connecting from ~s"`

</details>


<details>

<summary><code>LOGGING_DEST_CHANGED</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  The target logfile will change to another file
* **Format String**  
  `"Changing destination of ~s log to ~s"`

</details>


<details>

<summary><code>LOGGING_SHUTDOWN</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Logging subsystem terminating
* **Format String**  
  `"Daemon logging terminating, reason: ~s"`

</details>


<details>

<summary><code>LOGGING_STARTED</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Logging subsystem started
* **Format String**  
  `"Daemon logging started"`

</details>


<details>

<summary><code>LOGGING_STARTED_TO</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Write logs for a subsystem to a specific file
* **Format String**  
  `"Writing ~s log to ~s"`

</details>


<details>

<summary><code>LOGGING_STATUS_CHANGED</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Notify a change of logging status (enabled/disabled) for a subsystem
* **Format String**  
  `"~s ~s log"`

</details>


<details>

<summary><code>LOGIN_REJECTED</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Authentication for a user was rejected by application callback.
* **Format String**  
  `"~s"`

</details>


<details>

<summary><code>MAAPI_LOGOUT</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  A maapi user was logged out.
* **Format String**  
  `"Logged out from maapi ctx=~s (~s)"`

</details>


<details>

<summary><code>MAAPI_WRITE_TO_SOCKET_FAIL</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  maapi failed to write to a socket.
* **Format String**  
  `"maapi server failed to write to a socket. Op: ~s Ecode: ~s Error: ~s~s"`

</details>


<details>

<summary><code>MISSING_AES256CFB128_SETTINGS</code></summary>

* **Severity**  
  `ERR`
* **Description**  
  AES256CFB128 keys were not found in confd.conf
* **Format String**  
  `"AES256CFB128 keys were not found in confd.conf"`

</details>


<details>

<summary><code>MISSING_AESCFB128_SETTINGS</code></summary>

* **Severity**  
  `ERR`
* **Description**  
  AESCFB128 keys were not found in confd.conf
* **Format String**  
  `"AESCFB128 keys were not found in confd.conf"`

</details>


<details>

<summary><code>MISSING_DES3CBC_SETTINGS</code></summary>

* **Severity**  
  `ERR`
* **Description**  
  DES3CBC keys were not found in confd.conf
* **Format String**  
  `"DES3CBC keys were not found in confd.conf"`

</details>


<details>

<summary><code>MISSING_NS</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  While validating the consistency of the config - a required namespace was missing.
* **Format String**  
  `"The namespace ~s could not be found in the loadPath."`

</details>


<details>

<summary><code>MISSING_NS2</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  While validating the consistency of the config - a required namespace was missing.
* **Format String**  
  `"The namespace ~s (referenced by ~s) could not be found in the loadPath."`

</details>


<details>

<summary><code>MMAP_SCHEMA_FAIL</code></summary>

* **Severity**  
  `ERR`
* **Description**  
  Failed to setup the shared memory schema
* **Format String**  
  `"Failed to setup the shared memory schema"`

</details>


<details>

<summary><code>NCS_PACKAGE_AUTH_BAD_RET</code></summary>

* **Severity**  
  `ERR`
* **Description**  
  Package authentication program returned badly formatted data.
* **Format String**  
  `"package authentication using ~s program ret bad output: ~s"`

</details>


<details>

<summary><code>NCS_PACKAGE_AUTH_FAIL</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Package authentication failed.
* **Format String**  
  `"package authentication using ~s failed via ~s from ~s with ~s: ~s"`

</details>


<details>

<summary><code>NCS_PACKAGE_AUTH_SUCCESS</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  A package authenticated user logged in.
* **Format String**  
  `"package authentication using ~s succeeded via ~s from ~s with ~s, member of groups: ~s~s"`

</details>


<details>

<summary><code>NCS_PACKAGE_CHAL_2FA</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Package authentication challenge sent to a user.
* **Format String**  
  `"package authentication challenge sent to ~s from ~s with ~s"`

</details>


<details>

<summary><code>NCS_PACKAGE_CHAL_FAIL</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Package authentication challenge failed.
* **Format String**  
  `"package authentication challenge using ~s failed via ~s from ~s with ~s: ~s"`

</details>


<details>

<summary><code>NETCONF</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  NETCONF traffic log message
* **Format String**  
  `"~s"`

</details>


<details>

<summary><code>NETCONF_HDR_ERR</code></summary>

* **Severity**  
  `ERR`
* **Description**  
  The cleartext header indicating user and groups was badly formatted.
* **Format String**  
  `"Got bad NETCONF TCP header"`

</details>


<details>

<summary><code>NIF_LOG</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Log message from NIF code.
* **Format String**  
  `"~s: ~s"`

</details>


<details>

<summary><code>NOAAA_CLI_LOGIN</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  A user used the --noaaa flag to confd_cli
* **Format String**  
  `"logged in from the CLI with aaa disabled"`

</details>


<details>

<summary><code>NOTIFICATION_REPLAY_STORE_FAILURE</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  A failure occurred in the builtin notification replay store
* **Format String**  
  `"~s"`

</details>


<details>

<summary><code>NO_CALLPOINT</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  ConfD tried to populate an XML tree but no code had registered under the relevant callpoint.
* **Format String**  
  `"no registration found for callpoint ~s of type=~s"`

</details>


<details>

<summary><code>NO_SUCH_IDENTITY</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  The fxs file with the base identity is not loaded
* **Format String**  
  `"The identity ~s in namespace ~s refers to a non-existing base identity ~s in namespace ~s"`

</details>


<details>

<summary><code>NO_SUCH_NS</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  A nonexistent namespace was referred to. Typically this means that a .fxs was missing from the loadPath.
* **Format String**  
  `"No such namespace ~s, used by ~s"`

</details>


<details>

<summary><code>NO_SUCH_TYPE</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  A nonexistent type was referred to from a ns. Typically this means that a bad version of an .fxs file was found in the loadPath.
* **Format String**  
  `"No such simpleType '~s' in ~s, used by ~s"`

</details>


<details>

<summary><code>NS_LOAD_ERR</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  System tried to process a loaded namespace and failed.
* **Format String**  
  `"Failed to process namespace ~s: ~s"`

</details>


<details>

<summary><code>NS_LOAD_ERR2</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  System tried to process a loaded namespace and failed.
* **Format String**  
  `"Failed to process namespaces: ~s"`

</details>


<details>

<summary><code>OPEN_LOGFILE</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Indicate target file for certain type of logging
* **Format String**  
  `"Logging subsystem, opening log file '~s' for ~s"`

</details>


<details>

<summary><code>PAM_AUTH_FAIL</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  A user failed to authenticate through PAM.
* **Format String**  
  `"PAM authentication failed via ~s from ~s with ~s: phase ~s, ~s"`

</details>


<details>

<summary><code>PAM_AUTH_SUCCESS</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  A PAM authenticated user logged in.
* **Format String**  
  `"pam authentication succeeded via ~s from ~s with ~s"`

</details>


<details>

<summary><code>PHASE0_STARTED</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  ConfD has just started its start phase 0.
* **Format String**  
  `"ConfD phase0 started"`

</details>


<details>

<summary><code>PHASE1_STARTED</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  ConfD has just started its start phase 1.
* **Format String**  
  `"ConfD phase1 started"`

</details>


<details>

<summary><code>READ_STATE_FILE_FAILED</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  Reading of a state file failed
* **Format String**  
  `"Reading state file failed: ~s: ~s (~s)"`

</details>


<details>

<summary><code>RELOAD</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Reload of daemon configuration has been initiated.
* **Format String**  
  `"Reloading daemon configuration."`

</details>


<details>

<summary><code>REOPEN_LOGS</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Logging subsystem, reopening log files
* **Format String**  
  `"Logging subsystem, reopening log files"`

</details>


<details>

<summary><code>RESTCONF_REQUEST</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  RESTCONF request
* **Format String**  
  `"RESTCONF: request with ~s: ~s"`

</details>


<details>

<summary><code>RESTCONF_RESPONSE</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  RESTCONF response
* **Format String**  
  `"RESTCONF: response with ~s: ~s duration ~s us"`

</details>


<details>

<summary><code>REST_AUTH_FAIL</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Rest authentication for a user failed.
* **Format String**  
  `"rest authentication failed from ~s"`

</details>


<details>

<summary><code>REST_AUTH_SUCCESS</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  A rest authenticated user logged in.
* **Format String**  
  `"rest authentication succeeded from ~s , member of groups: ~s"`

</details>


<details>

<summary><code>REST_REQUEST</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  REST request
* **Format String**  
  `"REST: request with ~s: ~s"`

</details>


<details>

<summary><code>REST_RESPONSE</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  REST response
* **Format String**  
  `"REST: response with ~s: ~s duration ~s ms"`

</details>


<details>

<summary><code>ROLLBACK_FAIL_CREATE</code></summary>

* **Severity**  
  `ERR`
* **Description**  
  Error while creating rollback file.
* **Format String**  
  `"Error while creating rollback file: ~s: ~s"`

</details>


<details>

<summary><code>ROLLBACK_FAIL_DELETE</code></summary>

* **Severity**  
  `ERR`
* **Description**  
  Failed to delete rollback file.
* **Format String**  
  `"Failed to delete rollback file ~s: ~s"`

</details>


<details>

<summary><code>ROLLBACK_FAIL_RENAME</code></summary>

* **Severity**  
  `ERR`
* **Description**  
  Failed to rename rollback file.
* **Format String**  
  `"Failed to rename rollback file ~s to ~s: ~s"`

</details>


<details>

<summary><code>ROLLBACK_FAIL_REPAIR</code></summary>

* **Severity**  
  `ERR`
* **Description**  
  Failed to repair rollback files.
* **Format String**  
  `"Failed to repair rollback files."`

</details>


<details>

<summary><code>ROLLBACK_REMOVE</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Found half created rollback0 file - removing and creating new.
* **Format String**  
  `"Found half created rollback0 file - removing and creating new"`

</details>


<details>

<summary><code>ROLLBACK_REPAIR</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Found half created rollback0 file - repairing.
* **Format String**  
  `"Found half created rollback0 file - repairing"`

</details>


<details>

<summary><code>SESSION_CREATE</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  A new user session was created
* **Format String**  
  `"created new session via ~s from ~s with ~s"`

</details>


<details>

<summary><code>SESSION_LIMIT</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Session limit reached, rejected new session request.
* **Format String**  
  `"Session limit of type '~s' reached, rejected new session request"`

</details>


<details>

<summary><code>SESSION_MAX_EXCEEDED</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  A user failed to create a new user sessions due to exceeding sessions limits
* **Format String**  
  `"could not create new session via ~s from ~s with ~s due to session limits"`

</details>


<details>

<summary><code>SESSION_TERMINATION</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  A user session was terminated due to specified reason
* **Format String**  
  `"terminated session (reason: ~s)"`

</details>


<details>

<summary><code>SKIP_FILE_LOADING</code></summary>

* **Severity**  
  `DEBUG`
* **Description**  
  System skips a file.
* **Format String**  
  `"Skipping file ~s: ~s"`

</details>


<details>

<summary><code>SNMP_AUTHENTICATION_FAILED</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  An SNMP authentication failed.
* **Format String**  
  `"SNMP authentication failed: ~s"`

</details>


<details>

<summary><code>SNMP_CANT_LOAD_MIB</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  The SNMP Agent failed to load a MIB file
* **Format String**  
  `"Can't load MIB file: ~s"`

</details>


<details>

<summary><code>SNMP_MIB_LOADING</code></summary>

* **Severity**  
  `DEBUG`
* **Description**  
  SNMP Agent loading a MIB file
* **Format String**  
  `"Loading MIB: ~s"`

</details>


<details>

<summary><code>SNMP_NOT_A_TRAP</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  An UDP package was received on the trap receiving port, but it's not an SNMP trap.
* **Format String**  
  `"SNMP gateway: Non-trap received from ~s"`

</details>


<details>

<summary><code>SNMP_READ_STATE_FILE_FAILED</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  Read SNMP agent state file failed
* **Format String**  
  `"Read state file failed: ~s: ~s"`

</details>


<details>

<summary><code>SNMP_REQUIRES_CDB</code></summary>

* **Severity**  
  `WARNING`
* **Description**  
  The SNMP agent requires CDB to be enabled in order to be started.
* **Format String**  
  `"Can't start SNMP. CDB is not enabled"`

</details>


<details>

<summary><code>SNMP_TRAP_NOT_FORWARDED</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  An SNMP trap was to be forwarded, but couldn't be.
* **Format String**  
  `"SNMP gateway: Can't forward trap from ~s; ~s"`

</details>


<details>

<summary><code>SNMP_TRAP_NOT_RECOGNIZED</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  An SNMP trap was received on the trap receiving port, but its definition is not known
* **Format String**  
  `"SNMP gateway: Can't forward trap with OID ~s from ~s; There is no notification with this OID in the loaded models."`

</details>


<details>

<summary><code>SNMP_TRAP_OPEN_PORT</code></summary>

* **Severity**  
  `ERR`
* **Description**  
  The port for listening to SNMP traps could not be opened.
* **Format String**  
  `"SNMP gateway: Can't open trap listening port ~s: ~s"`

</details>


<details>

<summary><code>SNMP_TRAP_UNKNOWN_SENDER</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  An SNMP trap was to be forwarded, but the sender was not listed in confd.conf.
* **Format String**  
  `"SNMP gateway: Not forwarding trap from ~s; the sender is not recognized"`

</details>


<details>

<summary><code>SNMP_TRAP_V1</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  An SNMP v1 trap was received on the trap receiving port, but forwarding v1 traps is not supported.
* **Format String**  
  `"SNMP gateway: V1 trap received from ~s"`

</details>


<details>

<summary><code>SNMP_WRITE_STATE_FILE_FAILED</code></summary>

* **Severity**  
  `WARNING`
* **Description**  
  Write SNMP agent state file failed
* **Format String**  
  `"Write state file failed: ~s: ~s"`

</details>


<details>

<summary><code>SSH_HOST_KEY_UNAVAILABLE</code></summary>

* **Severity**  
  `ERR`
* **Description**  
  No SSH host keys available.
* **Format String**  
  `"No SSH host keys available"`

</details>


<details>

<summary><code>SSH_SUBSYS_ERR</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Typically errors where the client doesn't properly send the \"subsystem\" command.
* **Format String**  
  `"ssh protocol subsys - ~s"`

</details>


<details>

<summary><code>STARTED</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  ConfD has started.
* **Format String**  
  `"ConfD started vsn: ~s"`

</details>


<details>

<summary><code>STARTING</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  ConfD is starting.
* **Format String**  
  `"Starting ConfD vsn: ~s"`

</details>


<details>

<summary><code>STOPPING</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  ConfD is stopping (due to e.g. confd --stop).
* **Format String**  
  `"ConfD stopping (~s)"`

</details>


<details>

<summary><code>TOKEN_MISMATCH</code></summary>

* **Severity**  
  `ERR`
* **Description**  
  A secondary connected to a primary with a bad auth token
* **Format String**  
  `"Token mismatch, secondary is not allowed"`

</details>


<details>

<summary><code>UPGRADE_ABORTED</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  In-service upgrade was aborted.
* **Format String**  
  `"Upgrade aborted"`

</details>


<details>

<summary><code>UPGRADE_COMMITTED</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  In-service upgrade was committed.
* **Format String**  
  `"Upgrade committed"`

</details>


<details>

<summary><code>UPGRADE_INIT_STARTED</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  In-service upgrade initialization has started.
* **Format String**  
  `"Upgrade init started"`

</details>


<details>

<summary><code>UPGRADE_INIT_SUCCEEDED</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  In-service upgrade initialization succeeded.
* **Format String**  
  `"Upgrade init succeeded"`

</details>


<details>

<summary><code>UPGRADE_PERFORMED</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  In-service upgrade has been performed (not committed yet).
* **Format String**  
  `"Upgrade performed"`

</details>


<details>

<summary><code>WEBUI_LOG_MSG</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  WebUI access log message
* **Format String**  
  `"WebUI access log: ~s"`

</details>


<details>

<summary><code>WEB_ACTION</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  User executed a Web UI action.
* **Format String**  
  `"WebUI action '~s'"`

</details>


<details>

<summary><code>WEB_CMD</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  User executed a Web UI command.
* **Format String**  
  `"WebUI cmd '~s'"`

</details>


<details>

<summary><code>WEB_COMMIT</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  User performed Web UI commit.
* **Format String**  
  `"WebUI commit ~s"`

</details>


<details>

<summary><code>WRITE_STATE_FILE_FAILED</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  Writing of a state file failed
* **Format String**  
  `"Writing state file failed: ~s: ~s (~s)"`

</details>


<details>

<summary><code>XPATH_EVAL_ERROR1</code></summary>

* **Severity**  
  `WARNING`
* **Description**  
  An error occurred while evaluating an XPath expression.
* **Format String**  
  `"XPath evaluation error: ~s for ~s"`

</details>


<details>

<summary><code>XPATH_EVAL_ERROR2</code></summary>

* **Severity**  
  `WARNING`
* **Description**  
  An error occurred while evaluating an XPath expression.
* **Format String**  
  `"XPath evaluation error: '~s' resulted in ~s for ~s"`

</details>


<details>

<summary><code>COMMIT_UN_SYNCED_DEV</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Data was committed toward a device with bad or unknown sync state
* **Format String**  
  `"Committed data towards device ~s which is out of sync"`

</details>


<details>

<summary><code>NCS_DEVICE_OUT_OF_SYNC</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  A check-sync action reported out-of-sync for a device
* **Format String**  
  `"NCS device-out-of-sync Device '~s' Info '~s'"`

</details>


<details>

<summary><code>NCS_JAVA_VM_FAIL</code></summary>

* **Severity**  
  `ERR`
* **Description**  
  The NCS Java VM failure/timeout
* **Format String**  
  `"The NCS Java VM ~s"`

</details>


<details>

<summary><code>NCS_JAVA_VM_START</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Starting the NCS Java VM
* **Format String**  
  `"Starting the NCS Java VM"`

</details>


<details>

<summary><code>NCS_PACKAGE_BAD_DEPENDENCY</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  Bad NCS package dependency
* **Format String**  
  `"Failed to load NCS package: ~s; required package ~s of version ~s is not present (found ~s)"`

</details>


<details>

<summary><code>NCS_PACKAGE_BAD_NCS_VERSION</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  Bad NCS version for package
* **Format String**  
  `"Failed to load NCS package: ~s; requires NCS version ~s"`

</details>


<details>

<summary><code>NCS_PACKAGE_CIRCULAR_DEPENDENCY</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  Circular NCS package dependency
* **Format String**  
  `"Failed to load NCS package: ~s; circular dependency found"`

</details>


<details>

<summary><code>NCS_PACKAGE_COPYING</code></summary>

* **Severity**  
  `DEBUG`
* **Description**  
  A package is copied from the load path to private directory
* **Format String**  
  `"Copying NCS package from ~s to ~s"`

</details>


<details>

<summary><code>NCS_PACKAGE_DUPLICATE</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  Duplicate package found
* **Format String**  
  `"Failed to load duplicate NCS package ~s: (~s)"`

</details>


<details>

<summary><code>NCS_PACKAGE_SYNTAX_ERROR</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  Syntax error in package file
* **Format String**  
  `"Failed to load NCS package: ~s; syntax error in package file"`

</details>


<details>

<summary><code>NCS_PACKAGE_UPGRADE_ABORTED</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  The CDB upgrade was aborted implying that CDB is untouched. However the package state is changed
* **Format String**  
  `"NCS package upgrade failed with reason '~s'"`

</details>


<details>

<summary><code>NCS_PACKAGE_UPGRADE_UNSAFE</code></summary>

* **Severity**  
  `CRIT`
* **Description**  
  Package upgrade has been aborted due to warnings.
* **Format String**  
  `"NCS package upgrade has been aborted due to warnings:\n~s"`

</details>


<details>

<summary><code>NCS_PYTHON_VM_FAIL</code></summary>

* **Severity**  
  `ERR`
* **Description**  
  The NCS Python VM failure/timeout
* **Format String**  
  `"The NCS Python VM ~s"`

</details>


<details>

<summary><code>NCS_PYTHON_VM_START</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Starting the named NCS Python VM
* **Format String**  
  `"Starting the NCS Python VM ~s"`

</details>


<details>

<summary><code>NCS_PYTHON_VM_START_UPGRADE</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Starting a Python VM to run upgrade code
* **Format String**  
  `"Starting upgrade of NCS Python package ~s"`

</details>


<details>

<summary><code>NCS_SERVICE_OUT_OF_SYNC</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  A check-sync action reported out-of-sync for a service
* **Format String**  
  `"NCS service-out-of-sync Service '~s' Info '~s'"`

</details>


<details>

<summary><code>NCS_SET_PLATFORM_DATA_ERROR</code></summary>

* **Severity**  
  `ERR`
* **Description**  
  The device failed to set the platform operational data at connect
* **Format String**  
  `"NCS Device '~s' failed to set platform data Info '~s'"`

</details>


<details>

<summary><code>NCS_SMART_LICENSING_ENTITLEMENT_NOTIFICATION</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Smart Licensing Entitlement Notification
* **Format String**  
  `"Smart Licensing Entitlement Notification: ~s"`

</details>


<details>

<summary><code>NCS_SMART_LICENSING_EVALUATION_COUNTDOWN</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Smart Licensing evaluation time remaining
* **Format String**  
  `"Smart Licensing evaluation time remaining: ~s"`

</details>


<details>

<summary><code>NCS_SMART_LICENSING_FAIL</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  The NCS Smart Licensing Java VM failure/timeout
* **Format String**  
  `"The NCS Smart Licensing Java VM ~s"`

</details>


<details>

<summary><code>NCS_SMART_LICENSING_GLOBAL_NOTIFICATION</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Smart Licensing Global Notification
* **Format String**  
  `"Smart Licensing Global Notification: ~s"`

</details>


<details>

<summary><code>NCS_SMART_LICENSING_START</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Starting the NCS Smart Licensing Java VM
* **Format String**  
  `"Starting the NCS Smart Licensing Java VM"`

</details>


<details>

<summary><code>NCS_SNMPM_START</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Starting the NCS SNMP manager component
* **Format String**  
  `"Starting the NCS SNMP manager component"`

</details>


<details>

<summary><code>NCS_SNMPM_STOP</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  The NCS SNMP manager component has been stopped
* **Format String**  
  `"The NCS SNMP manager component has been stopped"`

</details>


<details>

<summary><code>NCS_SNMP_INIT_ERR</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  Failed to locate snmp_init.xml in loadpath
* **Format String**  
  `"Failed to locate snmp_init.xml in loadpath ~s"`

</details>


<details>

<summary><code>BAD_LOCAL_PASS</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  A locally configured user provided a bad password.
* **Format String**  
  `"Provided bad password"`

</details>


<details>

<summary><code>EXT_LOGIN</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  An externally authenticated user logged in.
* **Format String**  
  `"Logged in over ~s using externalauth, member of groups: ~s~s"`

</details>


<details>

<summary><code>EXT_NO_LOGIN</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  External authentication failed for a user.
* **Format String**  
  `"failed to login using externalauth: ~s"`

</details>


<details>

<summary><code>NO_SUCH_LOCAL_USER</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  A non existing local user tried to login.
* **Format String**  
  `"no such local user"`

</details>


<details>

<summary><code>PAM_LOGIN_FAILED</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  A user failed to login through PAM.
* **Format String**  
  `"pam phase ~s failed to login through PAM: ~s"`

</details>


<details>

<summary><code>PAM_NO_LOGIN</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  A user failed to login through PAM
* **Format String**  
  `"failed to login through PAM: ~s"`

</details>


<details>

<summary><code>SSH_LOGIN</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  A user logged into ConfD's builtin ssh server.
* **Format String**  
  `"logged in over ssh from ~s with authmeth:~s"`

</details>


<details>

<summary><code>SSH_LOGOUT</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  A user was logged out from ConfD's builtin ssh server.
* **Format String**  
  `"Logged out ssh <~s> user"`

</details>


<details>

<summary><code>SSH_NO_LOGIN</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  A user failed to login to ConfD's builtin SSH server.
* **Format String**  
  `"Failed to login over ssh: ~s"`

</details>


<details>

<summary><code>WEB_LOGIN</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  A user logged in through the WebUI.
* **Format String**  
  `"logged in through Web UI from ~s"`

</details>


<details>

<summary><code>WEB_LOGOUT</code></summary>

* **Severity**  
  `INFO`
* **Description**  
  A Web UI user logged out.
* **Format String**  
  `"logged out from Web UI"`

</details>

