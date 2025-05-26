# Log Messages and Formats


<details>

<summary>AAA_LOAD_FAIL</summary>

<code>AAA_LOAD_FAIL</code>

* **Severity**  
  `CRIT`
* **Description**  
  Failed to load the AAA data, it could be that an external db is misbehaving or AAA is mounted/populated badly
* **Format String**  
  `"Failed to load AAA: ~s"`

</details>


<details>

<summary>ABORT_CAND_COMMIT</summary>

<code>ABORT_CAND_COMMIT</code>

* **Severity**  
  `INFO`
* **Description**  
  Aborting candidate commit, request from user, reverting configuration.
* **Format String**  
  `"Aborting candidate commit, request from user, reverting configuration."`

</details>


<details>

<summary>ABORT_CAND_COMMIT_REBOOT</summary>

<code>ABORT_CAND_COMMIT_REBOOT</code>

* **Severity**  
  `INFO`
* **Description**  
  ConfD restarted while having a ongoing candidate commit timer, reverting configuration.
* **Format String**  
  `"ConfD restarted while having a ongoing candidate commit timer, reverting configuration."`

</details>


<details>

<summary>ABORT_CAND_COMMIT_TERM</summary>

<code>ABORT_CAND_COMMIT_TERM</code>

* **Severity**  
  `INFO`
* **Description**  
  Candidate commit session terminated, reverting configuration.
* **Format String**  
  `"Candidate commit session terminated, reverting configuration."`

</details>


<details>

<summary>ABORT_CAND_COMMIT_TIMER</summary>

<code>ABORT_CAND_COMMIT_TIMER</code>

* **Severity**  
  `INFO`
* **Description**  
  Candidate commit timer expired, reverting configuration.
* **Format String**  
  `"Candidate commit timer expired, reverting configuration."`

</details>


<details>

<summary>ACCEPT_FATAL</summary>

<code>ACCEPT_FATAL</code>

* **Severity**  
  `CRIT`
* **Description**  
  ConfD encountered an OS-specific error indicating that networking support is unavailable.
* **Format String**  
  `"Fatal error for accept() - ~s"`

</details>


<details>

<summary>ACCEPT_FDLIMIT</summary>

<code>ACCEPT_FDLIMIT</code>

* **Severity**  
  `CRIT`
* **Description**  
  ConfD failed to accept a connection due to reaching the process or system-wide file descriptor limit.
* **Format String**  
  `"Out of file descriptors for accept() - ~s limit reached"`

</details>


<details>

<summary>AUTH_LOGIN_FAIL</summary>

<code>AUTH_LOGIN_FAIL</code>

* **Severity**  
  `INFO`
* **Description**  
  A user failed to log in to ConfD.
* **Format String**  
  `"login failed via ~s from ~s with ~s: ~s"`

</details>


<details>

<summary>AUTH_LOGIN_SUCCESS</summary>

<code>AUTH_LOGIN_SUCCESS</code>

* **Severity**  
  `INFO`
* **Description**  
  A user logged into ConfD.
* **Format String**  
  `"logged in to ~s via ~s from ~s with ~s using ~s authentication"`

</details>


<details>

<summary>AUTH_LOGOUT</summary>

<code>AUTH_LOGOUT</code>

* **Severity**  
  `INFO`
* **Description**  
  A user was logged out from ConfD.
* **Format String**  
  `"logged out <~s> user"`

</details>


<details>

<summary>BADCONFIG</summary>

<code>BADCONFIG</code>

* **Severity**  
  `CRIT`
* **Description**  
  confd.conf contained bad data.
* **Format String**  
  `"Bad configuration: ~s:~s: ~s"`

</details>


<details>

<summary>BAD_DEPENDENCY</summary>

<code>BAD_DEPENDENCY</code>

* **Severity**  
  `ERR`
* **Description**  
  A dependency was not found
* **Format String**  
  `"The dependency node '~s' for node '~s' in module '~s' does not exist"`

</details>


<details>

<summary>BAD_NS_HASH</summary>

<code>BAD_NS_HASH</code>

* **Severity**  
  `CRIT`
* **Description**  
  Two namespaces have the same hash value. The namespace hashvalue MUST be unique.  You can pass the flag --nshash <value> to confdc when linking the .xso files to force another value for the namespace hash.
* **Format String**  
  `"~s"`

</details>


<details>

<summary>BIND_ERR</summary>

<code>BIND_ERR</code>

* **Severity**  
  `CRIT`
* **Description**  
  ConfD failed to bind to one of the internally used listen sockets.
* **Format String**  
  `"~s"`

</details>


<details>

<summary>BRIDGE_DIED</summary>

<code>BRIDGE_DIED</code>

* **Severity**  
  `ERR`
* **Description**  
  ConfD is configured to start the confd_aaa_bridge and the C program died.
* **Format String**  
  `"confd_aaa_bridge died - ~s"`

</details>


<details>

<summary>CANDIDATE_BAD_FILE_FORMAT</summary>

<code>CANDIDATE_BAD_FILE_FORMAT</code>

* **Severity**  
  `WARNING`
* **Description**  
  The candidate database file has a bad format. The candidate database is reset to the empty database.
* **Format String**  
  `"Bad format found in candidate db file ~s; resetting candidate"`

</details>


<details>

<summary>CANDIDATE_CORRUPT_FILE</summary>

<code>CANDIDATE_CORRUPT_FILE</code>

* **Severity**  
  `WARNING`
* **Description**  
  The candidate database file is corrupt and cannot be read. The candidate database is reset to the empty database.
* **Format String**  
  `"Corrupt candidate db file ~s; resetting candidate"`

</details>


<details>

<summary>CAND_COMMIT_ROLLBACK_DONE</summary>

<code>CAND_COMMIT_ROLLBACK_DONE</code>

* **Severity**  
  `INFO`
* **Description**  
  Candidate commit rollback done
* **Format String**  
  `"Candidate commit rollback done"`

</details>


<details>

<summary>CAND_COMMIT_ROLLBACK_FAILURE</summary>

<code>CAND_COMMIT_ROLLBACK_FAILURE</code>

* **Severity**  
  `ERR`
* **Description**  
  Failed to rollback candidate commit
* **Format String**  
  `"Failed to rollback candidate commit due to: ~s"`

</details>


<details>

<summary>CDB_BACKUP</summary>

<code>CDB_BACKUP</code>

* **Severity**  
  `INFO`
* **Description**  
  CDB data backed up after migration to a new storage backend.
* **Format String**  
  `"CDB: ~s backed up to ~s"`

</details>


<details>

<summary>CDB_BOOT_ERR</summary>

<code>CDB_BOOT_ERR</code>

* **Severity**  
  `CRIT`
* **Description**  
  CDB failed to start. Some grave error in the cdb data files prevented CDB from starting - a recovery from backup is necessary.
* **Format String**  
  `"CDB boot error: ~s"`

</details>


<details>

<summary>CDB_CLIENT_TIMEOUT</summary>

<code>CDB_CLIENT_TIMEOUT</code>

* **Severity**  
  `ERR`
* **Description**  
  A CDB client failed to answer within the timeout period. The client will be disconnected.
* **Format String**  
  `"CDB client (~s) timed out, waiting for ~s"`

</details>


<details>

<summary>CDB_CONFIG_LOST</summary>

<code>CDB_CONFIG_LOST</code>

* **Severity**  
  `INFO`
* **Description**  
  CDB found it's data files but no schema file. CDB recovers by starting from an empty database.
* **Format String**  
  `"CDB: lost config, deleting DB"`

</details>


<details>

<summary>CDB_DB_LOST</summary>

<code>CDB_DB_LOST</code>

* **Severity**  
  `INFO`
* **Description**  
  CDB found it's data schema file but not it's data file. CDB recovers by starting from an empty database.
* **Format String**  
  `"CDB: lost DB, deleting old config"`

</details>


<details>

<summary>CDB_FATAL_ERROR</summary>

<code>CDB_FATAL_ERROR</code>

* **Severity**  
  `CRIT`
* **Description**  
  CDB encounterad an unrecoverable error
* **Format String**  
  `"fatal error in CDB: ~s"`

</details>


<details>

<summary>CDB_INIT_LOAD</summary>

<code>CDB_INIT_LOAD</code>

* **Severity**  
  `INFO`
* **Description**  
  CDB is processing an initialization file.
* **Format String**  
  `"CDB load: processing file: ~s"`

</details>


<details>

<summary>CDB_MIGRATE</summary>

<code>CDB_MIGRATE</code>

* **Severity**  
  `INFO`
* **Description**  
  CDB data migration to a new storage backend.
* **Format String**  
  `"CDB: migrate ~s to ~s"`

</details>


<details>

<summary>CDB_OFFLOAD</summary>

<code>CDB_OFFLOAD</code>

* **Severity**  
  `DEBUG`
* **Description**  
  CDB data offload started.
* **Format String**  
  `"CDB: offload ~s from memory"`

</details>


<details>

<summary>CDB_OP_INIT</summary>

<code>CDB_OP_INIT</code>

* **Severity**  
  `ERR`
* **Description**  
  The operational DB was deleted and re-initialized (because of upgrade or corrupt file)
* **Format String**  
  `"CDB: Operational DB re-initialized"`

</details>


<details>

<summary>CDB_STALE_BACKUP</summary>

<code>CDB_STALE_BACKUP</code>

* **Severity**  
  `INFO`
* **Description**  
  CDB backup data left on disk after migration that can be removed to free up disk space.
* **Format String**  
  `"CDB: ~s backup file(s) occupying ~sMiB, remove to free up disk space: ~s"`

</details>


<details>

<summary>CDB_UPGRADE_FAILED</summary>

<code>CDB_UPGRADE_FAILED</code>

* **Severity**  
  `ERR`
* **Description**  
  Automatic CDB upgrade failed. This means that the data model has been changed in a non-supported way.
* **Format String**  
  `"CDB: Upgrade failed: ~s"`

</details>


<details>

<summary>CGI_REQUEST</summary>

<code>CGI_REQUEST</code>

* **Severity**  
  `INFO`
* **Description**  
  CGI script requested.
* **Format String**  
  `"CGI: '~s' script with method ~s"`

</details>


<details>

<summary>CHANGE_USER</summary>

<code>CHANGE_USER</code>

* **Severity**  
  `INFO`
* **Description**  
  A NETCONF request to change user for authorization was succesfully done.
* **Format String**  
  `"changed user to ~s, groups ~s"`

</details>


<details>

<summary>CLI_CMD</summary>

<code>CLI_CMD</code>

* **Severity**  
  `INFO`
* **Description**  
  User executed a CLI command.
* **Format String**  
  `"CLI '~s'"`

</details>


<details>

<summary>CLI_CMD_ABORTED</summary>

<code>CLI_CMD_ABORTED</code>

* **Severity**  
  `INFO`
* **Description**  
  CLI command aborted.
* **Format String**  
  `"CLI aborted"`

</details>


<details>

<summary>CLI_CMD_DONE</summary>

<code>CLI_CMD_DONE</code>

* **Severity**  
  `INFO`
* **Description**  
  CLI command finished successfully.
* **Format String**  
  `"CLI done"`

</details>


<details>

<summary>CLI_DENIED</summary>

<code>CLI_DENIED</code>

* **Severity**  
  `INFO`
* **Description**  
  User was denied to execute a CLI command due to permissions.
* **Format String**  
  `"CLI denied '~s'"`

</details>


<details>

<summary>COMMIT_INFO</summary>

<code>COMMIT_INFO</code>

* **Severity**  
  `INFO`
* **Description**  
  Information about configuration changes committed to the running data store.
* **Format String**  
  `"commit ~s"`

</details>


<details>

<summary>COMMIT_QUEUE_CORRUPT</summary>

<code>COMMIT_QUEUE_CORRUPT</code>

* **Severity**  
  `ERR`
* **Description**  
  Failed to load commit queue. ConfD recovers by starting from an empty commit queue.
* **Format String**  
  `"Resetting commit queue due do inconsistent or corrupt data."`

</details>


<details>

<summary>CONFIG_CHANGE</summary>

<code>CONFIG_CHANGE</code>

* **Severity**  
  `INFO`
* **Description**  
  A change to ConfD configuration has taken place, e.g., by a reload of the configuration file
* **Format String**  
  `"ConfD configuration change: ~s"`

</details>


<details>

<summary>CONFIG_DEPRECATED</summary>

<code>CONFIG_DEPRECATED</code>

* **Severity**  
  `WARNING`
* **Description**  
  confd.conf contains a deprecated value
* **Format String**  
  `"Config value is deprecated: ~s"`

</details>


<details>

<summary>CONFIG_OBSOLETE</summary>

<code>CONFIG_OBSOLETE</code>

* **Severity**  
  `WARNING`
* **Description**  
  confd.conf contains an obsolete value
* **Format String**  
  `"Config value is obsolete: ~s"`

</details>


<details>

<summary>CONFIG_TRANSACTION_LIMIT</summary>

<code>CONFIG_TRANSACTION_LIMIT</code>

* **Severity**  
  `INFO`
* **Description**  
  Configuration transaction limit reached, rejected new transaction request.
* **Format String**  
  `"Configuration transaction limit of type '~s' reached, rejected new transaction request"`

</details>


<details>

<summary>CONSULT_FILE</summary>

<code>CONSULT_FILE</code>

* **Severity**  
  `INFO`
* **Description**  
  ConfD is reading its configuration file.
* **Format String**  
  `"Consulting daemon configuration file ~s"`

</details>


<details>

<summary>CRYPTO_KEYS_FAILED_LOADING</summary>

<code>CRYPTO_KEYS_FAILED_LOADING</code>

* **Severity**  
  `INFO`
* **Description**  
  Crypto keys failed to load because the old active generation is missing in the new configuration.
* **Format String**  
  `"Cannot reload crypto keys since the old active generation is missing in the new list of keys."`

</details>


<details>

<summary>DAEMON_DIED</summary>

<code>DAEMON_DIED</code>

* **Severity**  
  `CRIT`
* **Description**  
  An external database daemon closed its control socket.
* **Format String**  
  `"Daemon ~s died"`

</details>


<details>

<summary>DAEMON_TIMEOUT</summary>

<code>DAEMON_TIMEOUT</code>

* **Severity**  
  `CRIT`
* **Description**  
  An external database daemon did not respond to a query.
* **Format String**  
  `"Daemon ~s timed out"`

</details>


<details>

<summary>DEVEL_AAA</summary>

<code>DEVEL_AAA</code>

* **Severity**  
  `INFO`
* **Description**  
  Developer aaa log message
* **Format String**  
  `"~s"`

</details>


<details>

<summary>DEVEL_CAPI</summary>

<code>DEVEL_CAPI</code>

* **Severity**  
  `INFO`
* **Description**  
  Developer C api log message
* **Format String**  
  `"~s"`

</details>


<details>

<summary>DEVEL_CDB</summary>

<code>DEVEL_CDB</code>

* **Severity**  
  `INFO`
* **Description**  
  Developer CDB log message
* **Format String**  
  `"~s"`

</details>


<details>

<summary>DEVEL_CONFD</summary>

<code>DEVEL_CONFD</code>

* **Severity**  
  `INFO`
* **Description**  
  Developer ConfD log message
* **Format String**  
  `"~s"`

</details>


<details>

<summary>DEVEL_ECONFD</summary>

<code>DEVEL_ECONFD</code>

* **Severity**  
  `INFO`
* **Description**  
  Developer econfd api log message
* **Format String**  
  `"~s"`

</details>


<details>

<summary>DEVEL_SLS</summary>

<code>DEVEL_SLS</code>

* **Severity**  
  `INFO`
* **Description**  
  Developer smartlicensing api log message
* **Format String**  
  `"~s"`

</details>


<details>

<summary>DEVEL_SNMPA</summary>

<code>DEVEL_SNMPA</code>

* **Severity**  
  `INFO`
* **Description**  
  Developer snmp agent log message
* **Format String**  
  `"~s"`

</details>


<details>

<summary>DEVEL_SNMPGW</summary>

<code>DEVEL_SNMPGW</code>

* **Severity**  
  `INFO`
* **Description**  
  Developer snmp GW log message
* **Format String**  
  `"~s"`

</details>


<details>

<summary>DEVEL_WEBUI</summary>

<code>DEVEL_WEBUI</code>

* **Severity**  
  `INFO`
* **Description**  
  Developer webui log message
* **Format String**  
  `"~s"`

</details>


<details>

<summary>DUPLICATE_MODULE_NAME</summary>

<code>DUPLICATE_MODULE_NAME</code>

* **Severity**  
  `CRIT`
* **Description**  
  Duplicate module name found.
* **Format String**  
  `"The module name '~s' is both defined in '~s' and '~s'."`

</details>


<details>

<summary>DUPLICATE_NAMESPACE</summary>

<code>DUPLICATE_NAMESPACE</code>

* **Severity**  
  `CRIT`
* **Description**  
  Duplicate namespace found.
* **Format String**  
  `"The namespace ~s is defined in both module ~s and ~s."`

</details>


<details>

<summary>DUPLICATE_PREFIX</summary>

<code>DUPLICATE_PREFIX</code>

* **Severity**  
  `CRIT`
* **Description**  
  Duplicate prefix found.
* **Format String**  
  `"The prefix ~s is defined in both ~s and ~s."`

</details>


<details>

<summary>ERRLOG_SIZE_CHANGED</summary>

<code>ERRLOG_SIZE_CHANGED</code>

* **Severity**  
  `INFO`
* **Description**  
  Notify change of log size for error log
* **Format String**  
  `"Changing size of error log (~s) to ~s (was ~s)"`

</details>


<details>

<summary>EVENT_SOCKET_TIMEOUT</summary>

<code>EVENT_SOCKET_TIMEOUT</code>

* **Severity**  
  `CRIT`
* **Description**  
  An event notification subscriber did not reply within the configured timeout period
* **Format String**  
  `"Event notification subscriber with bitmask ~s timed out, waiting for ~s"`

</details>


<details>

<summary>EVENT_SOCKET_WRITE_BLOCK</summary>

<code>EVENT_SOCKET_WRITE_BLOCK</code>

* **Severity**  
  `CRIT`
* **Description**  
  Write on an event socket blocked for too long time
* **Format String**  
  `"~s"`

</details>


<details>

<summary>EXEC_WHEN_CIRCULAR_DEPENDENCY</summary>

<code>EXEC_WHEN_CIRCULAR_DEPENDENCY</code>

* **Severity**  
  `WARNING`
* **Description**  
  An error occurred while evaluating a when-expression.
* **Format String**  
  `"When-expression evaluation error: circular dependency in ~s"`

</details>


<details>

<summary>EXTAUTH_BAD_RET</summary>

<code>EXTAUTH_BAD_RET</code>

* **Severity**  
  `ERR`
* **Description**  
  Authentication is external and the external program returned badly formatted data.
* **Format String**  
  `"External auth program (user=~s) ret bad output: ~s"`

</details>


<details>

<summary>EXT_AUTH_2FA</summary>

<code>EXT_AUTH_2FA</code>

* **Severity**  
  `INFO`
* **Description**  
  External challenge sent to a user.
* **Format String**  
  `"external challenge sent to ~s from ~s with ~s"`

</details>


<details>

<summary>EXT_AUTH_2FA_FAIL</summary>

<code>EXT_AUTH_2FA_FAIL</code>

* **Severity**  
  `INFO`
* **Description**  
  External challenge authentication failed for a user.
* **Format String**  
  `"external challenge authentication failed via ~s from ~s with ~s: ~s"`

</details>


<details>

<summary>EXT_AUTH_2FA_SUCCESS</summary>

<code>EXT_AUTH_2FA_SUCCESS</code>

* **Severity**  
  `INFO`
* **Description**  
  An external challenge authenticated user logged in.
* **Format String**  
  `"external challenge authentication succeeded via ~s from ~s with ~s, member of groups: ~s~s"`

</details>


<details>

<summary>EXT_AUTH_FAIL</summary>

<code>EXT_AUTH_FAIL</code>

* **Severity**  
  `INFO`
* **Description**  
  External authentication failed for a user.
* **Format String**  
  `"external authentication failed via ~s from ~s with ~s: ~s"`

</details>


<details>

<summary>EXT_AUTH_SUCCESS</summary>

<code>EXT_AUTH_SUCCESS</code>

* **Severity**  
  `INFO`
* **Description**  
  An externally authenticated user logged in.
* **Format String**  
  `"external authentication succeeded via ~s from ~s with ~s, member of groups: ~s~s"`

</details>


<details>

<summary>EXT_AUTH_TOKEN_FAIL</summary>

<code>EXT_AUTH_TOKEN_FAIL</code>

* **Severity**  
  `INFO`
* **Description**  
  External token authentication failed for a user.
* **Format String**  
  `"external token authentication failed via ~s from ~s with ~s: ~s"`

</details>


<details>

<summary>EXT_AUTH_TOKEN_SUCCESS</summary>

<code>EXT_AUTH_TOKEN_SUCCESS</code>

* **Severity**  
  `INFO`
* **Description**  
  An externally token authenticated user logged in.
* **Format String**  
  `"external token authentication succeeded via ~s from ~s with ~s, member of groups: ~s~s"`

</details>


<details>

<summary>EXT_BIND_ERR</summary>

<code>EXT_BIND_ERR</code>

* **Severity**  
  `CRIT`
* **Description**  
  ConfD failed to bind to one of the externally visible listen sockets.
* **Format String**  
  `"~s"`

</details>


<details>

<summary>FILE_ERROR</summary>

<code>FILE_ERROR</code>

* **Severity**  
  `CRIT`
* **Description**  
  File error
* **Format String**  
  `"~s: ~s"`

</details>


<details>

<summary>FILE_LOAD</summary>

<code>FILE_LOAD</code>

* **Severity**  
  `DEBUG`
* **Description**  
  System loaded a file.
* **Format String**  
  `"Loaded file ~s"`

</details>


<details>

<summary>FILE_LOADING</summary>

<code>FILE_LOADING</code>

* **Severity**  
  `DEBUG`
* **Description**  
  System starts to load a file.
* **Format String**  
  `"Loading file ~s"`

</details>


<details>

<summary>FILE_LOAD_ERR</summary>

<code>FILE_LOAD_ERR</code>

* **Severity**  
  `CRIT`
* **Description**  
  System tried to load a file in its load path and failed.
* **Format String**  
  `"Failed to load file ~s: ~s"`

</details>


<details>

<summary>FXS_MISMATCH</summary>

<code>FXS_MISMATCH</code>

* **Severity**  
  `ERR`
* **Description**  
  A secondary connected to a primary where the fxs files are different
* **Format String**  
  `"Fxs mismatch, secondary is not allowed"`

</details>


<details>

<summary>GROUP_ASSIGN</summary>

<code>GROUP_ASSIGN</code>

* **Severity**  
  `INFO`
* **Description**  
  A user was assigned to a set of groups.
* **Format String**  
  `"assigned to groups: ~s"`

</details>


<details>

<summary>GROUP_NO_ASSIGN</summary>

<code>GROUP_NO_ASSIGN</code>

* **Severity**  
  `INFO`
* **Description**  
  A user was logged in but wasn't assigned to any groups at all.
* **Format String**  
  `"Not assigned to any groups - all access is denied"`

</details>


<details>

<summary>HA_BAD_VSN</summary>

<code>HA_BAD_VSN</code>

* **Severity**  
  `ERR`
* **Description**  
  A secondary connected to a primary with an incompatible HA protocol version
* **Format String**  
  `"Incompatible HA version (~s, expected ~s), secondary is not allowed"`

</details>


<details>

<summary>HA_DUPLICATE_NODEID</summary>

<code>HA_DUPLICATE_NODEID</code>

* **Severity**  
  `ERR`
* **Description**  
  A secondary arrived with a node id which already exists
* **Format String**  
  `"Nodeid ~s already exists"`

</details>


<details>

<summary>HA_FAILED_CONNECT</summary>

<code>HA_FAILED_CONNECT</code>

* **Severity**  
  `ERR`
* **Description**  
  An attempted library become secondary call failed because the secondary couldn't connect to the primary
* **Format String**  
  `"Failed to connect to primary: ~s"`

</details>


<details>

<summary>HA_SECONDARY_KILLED</summary>

<code>HA_SECONDARY_KILLED</code>

* **Severity**  
  `ERR`
* **Description**  
  A secondary node didn't produce its ticks
* **Format String**  
  `"Secondary ~s killed due to no ticks"`

</details>


<details>

<summary>INTERNAL_ERROR</summary>

<code>INTERNAL_ERROR</code>

* **Severity**  
  `CRIT`
* **Description**  
  A ConfD internal error - should be reported to support@tail-f.com.
* **Format String**  
  `"Internal error: ~s"`

</details>


<details>

<summary>JIT_ENABLED</summary>

<code>JIT_ENABLED</code>

* **Severity**  
  `INFO`
* **Description**  
  Show if JIT is enabled.
* **Format String**  
  `"JIT ~s"`

</details>


<details>

<summary>JSONRPC_LOG_MSG</summary>

<code>JSONRPC_LOG_MSG</code>

* **Severity**  
  `INFO`
* **Description**  
  JSON-RPC traffic log message
* **Format String**  
  `"JSON-RPC traffic log: ~s"`

</details>


<details>

<summary>JSONRPC_REQUEST</summary>

<code>JSONRPC_REQUEST</code>

* **Severity**  
  `INFO`
* **Description**  
  JSON-RPC method requested.
* **Format String**  
  `"JSON-RPC: '~s' with JSON params ~s"`

</details>


<details>

<summary>JSONRPC_REQUEST_ABSOLUTE_TIMEOUT</summary>

<code>JSONRPC_REQUEST_ABSOLUTE_TIMEOUT</code>

* **Severity**  
  `INFO`
* **Description**  
  JSON-RPC absolute timeout.
* **Format String**  
  `"Stopping session due to absolute timeout: ~s"`

</details>


<details>

<summary>JSONRPC_REQUEST_IDLE_TIMEOUT</summary>

<code>JSONRPC_REQUEST_IDLE_TIMEOUT</code>

* **Severity**  
  `INFO`
* **Description**  
  JSON-RPC idle timeout.
* **Format String**  
  `"Stopping session due to idle timeout: ~s"`

</details>


<details>

<summary>JSONRPC_WARN_MSG</summary>

<code>JSONRPC_WARN_MSG</code>

* **Severity**  
  `WARNING`
* **Description**  
  JSON-RPC warning message
* **Format String**  
  `"JSON-RPC warning: ~s"`

</details>


<details>

<summary>KICKER_MISSING_SCHEMA</summary>

<code>KICKER_MISSING_SCHEMA</code>

* **Severity**  
  `INFO`
* **Description**  
  Failed to load kicker schema
* **Format String**  
  `"Failed to load kicker schema"`

</details>


<details>

<summary>LIB_BAD_SIZES</summary>

<code>LIB_BAD_SIZES</code>

* **Severity**  
  `ERR`
* **Description**  
  An application connecting to ConfD used a library version that can't handle the depth and number of keys used by the data model.
* **Format String**  
  `"Got connect from library with insufficient keypath depth/keys support (~s/~s, needs ~s/~s)"`

</details>


<details>

<summary>LIB_BAD_VSN</summary>

<code>LIB_BAD_VSN</code>

* **Severity**  
  `ERR`
* **Description**  
  An application connecting to ConfD used a library version that doesn't match the ConfD version (e.g. old version of the client library).
* **Format String**  
  `"Got library connect from wrong version (~s, expected ~s)"`

</details>


<details>

<summary>LIB_NO_ACCESS</summary>

<code>LIB_NO_ACCESS</code>

* **Severity**  
  `ERR`
* **Description**  
  Access check failure occurred when an application connected to ConfD.
* **Format String**  
  `"Got library connect with failed access check: ~s"`

</details>


<details>

<summary>LISTENER_INFO</summary>

<code>LISTENER_INFO</code>

* **Severity**  
  `INFO`
* **Description**  
  ConfD starts or stops to listen for incoming connections.
* **Format String**  
  `"~s to listen for ~s on ~s:~s"`

</details>


<details>

<summary>LOCAL_AUTH_FAIL</summary>

<code>LOCAL_AUTH_FAIL</code>

* **Severity**  
  `INFO`
* **Description**  
  Authentication for a locally configured user failed.
* **Format String**  
  `"local authentication failed via ~s from ~s with ~s: ~s"`

</details>


<details>

<summary>LOCAL_AUTH_FAIL_BADPASS</summary>

<code>LOCAL_AUTH_FAIL_BADPASS</code>

* **Severity**  
  `INFO`
* **Description**  
  Authentication for a locally configured user failed due to providing bad password.
* **Format String**  
  `"local authentication failed via ~s from ~s with ~s: ~s"`

</details>


<details>

<summary>LOCAL_AUTH_FAIL_NOUSER</summary>

<code>LOCAL_AUTH_FAIL_NOUSER</code>

* **Severity**  
  `INFO`
* **Description**  
  Authentication for a locally configured user failed due to user not found.
* **Format String**  
  `"local authentication failed via ~s from ~s with ~s: ~s"`

</details>


<details>

<summary>LOCAL_AUTH_SUCCESS</summary>

<code>LOCAL_AUTH_SUCCESS</code>

* **Severity**  
  `INFO`
* **Description**  
  A locally authenticated user logged in.
* **Format String**  
  `"local authentication succeeded via ~s from ~s with ~s, member of groups: ~s"`

</details>


<details>

<summary>LOCAL_IPC_ACCESS_DENIED</summary>

<code>LOCAL_IPC_ACCESS_DENIED</code>

* **Severity**  
  `INFO`
* **Description**  
  Local IPC access denied for user.
* **Format String**  
  `"Local IPC access denied for user ~s connecting from ~s"`

</details>


<details>

<summary>LOGGING_DEST_CHANGED</summary>

<code>LOGGING_DEST_CHANGED</code>

* **Severity**  
  `INFO`
* **Description**  
  The target logfile will change to another file
* **Format String**  
  `"Changing destination of ~s log to ~s"`

</details>


<details>

<summary>LOGGING_SHUTDOWN</summary>

<code>LOGGING_SHUTDOWN</code>

* **Severity**  
  `INFO`
* **Description**  
  Logging subsystem terminating
* **Format String**  
  `"Daemon logging terminating, reason: ~s"`

</details>


<details>

<summary>LOGGING_STARTED</summary>

<code>LOGGING_STARTED</code>

* **Severity**  
  `INFO`
* **Description**  
  Logging subsystem started
* **Format String**  
  `"Daemon logging started"`

</details>


<details>

<summary>LOGGING_STARTED_TO</summary>

<code>LOGGING_STARTED_TO</code>

* **Severity**  
  `INFO`
* **Description**  
  Write logs for a subsystem to a specific file
* **Format String**  
  `"Writing ~s log to ~s"`

</details>


<details>

<summary>LOGGING_STATUS_CHANGED</summary>

<code>LOGGING_STATUS_CHANGED</code>

* **Severity**  
  `INFO`
* **Description**  
  Notify a change of logging status (enabled/disabled) for a subsystem
* **Format String**  
  `"~s ~s log"`

</details>


<details>

<summary>LOGIN_REJECTED</summary>

<code>LOGIN_REJECTED</code>

* **Severity**  
  `INFO`
* **Description**  
  Authentication for a user was rejected by application callback.
* **Format String**  
  `"~s"`

</details>


<details>

<summary>MAAPI_LOGOUT</summary>

<code>MAAPI_LOGOUT</code>

* **Severity**  
  `INFO`
* **Description**  
  A maapi user was logged out.
* **Format String**  
  `"Logged out from maapi ctx=~s (~s)"`

</details>


<details>

<summary>MAAPI_WRITE_TO_SOCKET_FAIL</summary>

<code>MAAPI_WRITE_TO_SOCKET_FAIL</code>

* **Severity**  
  `INFO`
* **Description**  
  maapi failed to write to a socket.
* **Format String**  
  `"maapi server failed to write to a socket. Op: ~s Ecode: ~s Error: ~s~s"`

</details>


<details>

<summary>MISSING_AES256CFB128_SETTINGS</summary>

<code>MISSING_AES256CFB128_SETTINGS</code>

* **Severity**  
  `ERR`
* **Description**  
  AES256CFB128 keys were not found in confd.conf
* **Format String**  
  `"AES256CFB128 keys were not found in confd.conf"`

</details>


<details>

<summary>MISSING_AESCFB128_SETTINGS</summary>

<code>MISSING_AESCFB128_SETTINGS</code>

* **Severity**  
  `ERR`
* **Description**  
  AESCFB128 keys were not found in confd.conf
* **Format String**  
  `"AESCFB128 keys were not found in confd.conf"`

</details>


<details>

<summary>MISSING_DES3CBC_SETTINGS</summary>

<code>MISSING_DES3CBC_SETTINGS</code>

* **Severity**  
  `ERR`
* **Description**  
  DES3CBC keys were not found in confd.conf
* **Format String**  
  `"DES3CBC keys were not found in confd.conf"`

</details>


<details>

<summary>MISSING_NS</summary>

<code>MISSING_NS</code>

* **Severity**  
  `CRIT`
* **Description**  
  While validating the consistency of the config - a required namespace was missing.
* **Format String**  
  `"The namespace ~s could not be found in the loadPath."`

</details>


<details>

<summary>MISSING_NS2</summary>

<code>MISSING_NS2</code>

* **Severity**  
  `CRIT`
* **Description**  
  While validating the consistency of the config - a required namespace was missing.
* **Format String**  
  `"The namespace ~s (referenced by ~s) could not be found in the loadPath."`

</details>


<details>

<summary>MMAP_SCHEMA_FAIL</summary>

<code>MMAP_SCHEMA_FAIL</code>

* **Severity**  
  `ERR`
* **Description**  
  Failed to setup the shared memory schema
* **Format String**  
  `"Failed to setup the shared memory schema"`

</details>


<details>

<summary>NETCONF</summary>

<code>NETCONF</code>

* **Severity**  
  `INFO`
* **Description**  
  NETCONF traffic log message
* **Format String**  
  `"~s"`

</details>


<details>

<summary>NETCONF_HDR_ERR</summary>

<code>NETCONF_HDR_ERR</code>

* **Severity**  
  `ERR`
* **Description**  
  The cleartext header indicating user and groups was badly formatted.
* **Format String**  
  `"Got bad NETCONF TCP header"`

</details>


<details>

<summary>NIF_LOG</summary>

<code>NIF_LOG</code>

* **Severity**  
  `INFO`
* **Description**  
  Log message from NIF code.
* **Format String**  
  `"~s: ~s"`

</details>


<details>

<summary>NOAAA_CLI_LOGIN</summary>

<code>NOAAA_CLI_LOGIN</code>

* **Severity**  
  `INFO`
* **Description**  
  A user used the --noaaa flag to confd_cli
* **Format String**  
  `"logged in from the CLI with aaa disabled"`

</details>


<details>

<summary>NOTIFICATION_REPLAY_STORE_FAILURE</summary>

<code>NOTIFICATION_REPLAY_STORE_FAILURE</code>

* **Severity**  
  `CRIT`
* **Description**  
  A failure occurred in the builtin notification replay store
* **Format String**  
  `"~s"`

</details>


<details>

<summary>NO_CALLPOINT</summary>

<code>NO_CALLPOINT</code>

* **Severity**  
  `CRIT`
* **Description**  
  ConfD tried to populate an XML tree but no code had registered under the relevant callpoint.
* **Format String**  
  `"no registration found for callpoint ~s of type=~s"`

</details>


<details>

<summary>NO_SUCH_IDENTITY</summary>

<code>NO_SUCH_IDENTITY</code>

* **Severity**  
  `CRIT`
* **Description**  
  The fxs file with the base identity is not loaded
* **Format String**  
  `"The identity ~s in namespace ~s refers to a non-existing base identity ~s in namespace ~s"`

</details>


<details>

<summary>NO_SUCH_NS</summary>

<code>NO_SUCH_NS</code>

* **Severity**  
  `CRIT`
* **Description**  
  A nonexistent namespace was referred to. Typically this means that a .fxs was missing from the loadPath.
* **Format String**  
  `"No such namespace ~s, used by ~s"`

</details>


<details>

<summary>NO_SUCH_TYPE</summary>

<code>NO_SUCH_TYPE</code>

* **Severity**  
  `CRIT`
* **Description**  
  A nonexistent type was referred to from a ns. Typically this means that a bad version of an .fxs file was found in the loadPath.
* **Format String**  
  `"No such simpleType '~s' in ~s, used by ~s"`

</details>


<details>

<summary>NS_LOAD_ERR</summary>

<code>NS_LOAD_ERR</code>

* **Severity**  
  `CRIT`
* **Description**  
  System tried to process a loaded namespace and failed.
* **Format String**  
  `"Failed to process namespace ~s: ~s"`

</details>


<details>

<summary>NS_LOAD_ERR2</summary>

<code>NS_LOAD_ERR2</code>

* **Severity**  
  `CRIT`
* **Description**  
  System tried to process a loaded namespace and failed.
* **Format String**  
  `"Failed to process namespaces: ~s"`

</details>


<details>

<summary>OPEN_LOGFILE</summary>

<code>OPEN_LOGFILE</code>

* **Severity**  
  `INFO`
* **Description**  
  Indicate target file for certain type of logging
* **Format String**  
  `"Logging subsystem, opening log file '~s' for ~s"`

</details>


<details>

<summary>PAM_AUTH_FAIL</summary>

<code>PAM_AUTH_FAIL</code>

* **Severity**  
  `INFO`
* **Description**  
  A user failed to authenticate through PAM.
* **Format String**  
  `"PAM authentication failed via ~s from ~s with ~s: phase ~s, ~s"`

</details>


<details>

<summary>PAM_AUTH_SUCCESS</summary>

<code>PAM_AUTH_SUCCESS</code>

* **Severity**  
  `INFO`
* **Description**  
  A PAM authenticated user logged in.
* **Format String**  
  `"pam authentication succeeded via ~s from ~s with ~s"`

</details>


<details>

<summary>PHASE0_STARTED</summary>

<code>PHASE0_STARTED</code>

* **Severity**  
  `INFO`
* **Description**  
  ConfD has just started its start phase 0.
* **Format String**  
  `"ConfD phase0 started"`

</details>


<details>

<summary>PHASE1_STARTED</summary>

<code>PHASE1_STARTED</code>

* **Severity**  
  `INFO`
* **Description**  
  ConfD has just started its start phase 1.
* **Format String**  
  `"ConfD phase1 started"`

</details>


<details>

<summary>READ_STATE_FILE_FAILED</summary>

<code>READ_STATE_FILE_FAILED</code>

* **Severity**  
  `CRIT`
* **Description**  
  Reading of a state file failed
* **Format String**  
  `"Reading state file failed: ~s: ~s (~s)"`

</details>


<details>

<summary>RELOAD</summary>

<code>RELOAD</code>

* **Severity**  
  `INFO`
* **Description**  
  Reload of daemon configuration has been initiated.
* **Format String**  
  `"Reloading daemon configuration."`

</details>


<details>

<summary>REOPEN_LOGS</summary>

<code>REOPEN_LOGS</code>

* **Severity**  
  `INFO`
* **Description**  
  Logging subsystem, reopening log files
* **Format String**  
  `"Logging subsystem, reopening log files"`

</details>


<details>

<summary>RESTCONF_REQUEST</summary>

<code>RESTCONF_REQUEST</code>

* **Severity**  
  `INFO`
* **Description**  
  RESTCONF request
* **Format String**  
  `"RESTCONF: request with ~s: ~s"`

</details>


<details>

<summary>RESTCONF_RESPONSE</summary>

<code>RESTCONF_RESPONSE</code>

* **Severity**  
  `INFO`
* **Description**  
  RESTCONF response
* **Format String**  
  `"RESTCONF: response with ~s: ~s duration ~s us"`

</details>


<details>

<summary>REST_AUTH_FAIL</summary>

<code>REST_AUTH_FAIL</code>

* **Severity**  
  `INFO`
* **Description**  
  Rest authentication for a user failed.
* **Format String**  
  `"rest authentication failed from ~s"`

</details>


<details>

<summary>REST_AUTH_SUCCESS</summary>

<code>REST_AUTH_SUCCESS</code>

* **Severity**  
  `INFO`
* **Description**  
  A rest authenticated user logged in.
* **Format String**  
  `"rest authentication succeeded from ~s , member of groups: ~s"`

</details>


<details>

<summary>REST_REQUEST</summary>

<code>REST_REQUEST</code>

* **Severity**  
  `INFO`
* **Description**  
  REST request
* **Format String**  
  `"REST: request with ~s: ~s"`

</details>


<details>

<summary>REST_RESPONSE</summary>

<code>REST_RESPONSE</code>

* **Severity**  
  `INFO`
* **Description**  
  REST response
* **Format String**  
  `"REST: response with ~s: ~s duration ~s ms"`

</details>


<details>

<summary>ROLLBACK_FAIL_CREATE</summary>

<code>ROLLBACK_FAIL_CREATE</code>

* **Severity**  
  `ERR`
* **Description**  
  Error while creating rollback file.
* **Format String**  
  `"Error while creating rollback file: ~s: ~s"`

</details>


<details>

<summary>ROLLBACK_FAIL_DELETE</summary>

<code>ROLLBACK_FAIL_DELETE</code>

* **Severity**  
  `ERR`
* **Description**  
  Failed to delete rollback file.
* **Format String**  
  `"Failed to delete rollback file ~s: ~s"`

</details>


<details>

<summary>ROLLBACK_FAIL_RENAME</summary>

<code>ROLLBACK_FAIL_RENAME</code>

* **Severity**  
  `ERR`
* **Description**  
  Failed to rename rollback file.
* **Format String**  
  `"Failed to rename rollback file ~s to ~s: ~s"`

</details>


<details>

<summary>ROLLBACK_FAIL_REPAIR</summary>

<code>ROLLBACK_FAIL_REPAIR</code>

* **Severity**  
  `ERR`
* **Description**  
  Failed to repair rollback files.
* **Format String**  
  `"Failed to repair rollback files."`

</details>


<details>

<summary>ROLLBACK_REMOVE</summary>

<code>ROLLBACK_REMOVE</code>

* **Severity**  
  `INFO`
* **Description**  
  Found half created rollback0 file - removing and creating new.
* **Format String**  
  `"Found half created rollback0 file - removing and creating new"`

</details>


<details>

<summary>ROLLBACK_REPAIR</summary>

<code>ROLLBACK_REPAIR</code>

* **Severity**  
  `INFO`
* **Description**  
  Found half created rollback0 file - repairing.
* **Format String**  
  `"Found half created rollback0 file - repairing"`

</details>


<details>

<summary>SESSION_CREATE</summary>

<code>SESSION_CREATE</code>

* **Severity**  
  `INFO`
* **Description**  
  A new user session was created
* **Format String**  
  `"created new session via ~s from ~s with ~s"`

</details>


<details>

<summary>SESSION_LIMIT</summary>

<code>SESSION_LIMIT</code>

* **Severity**  
  `INFO`
* **Description**  
  Session limit reached, rejected new session request.
* **Format String**  
  `"Session limit of type '~s' reached, rejected new session request"`

</details>


<details>

<summary>SESSION_MAX_EXCEEDED</summary>

<code>SESSION_MAX_EXCEEDED</code>

* **Severity**  
  `INFO`
* **Description**  
  A user failed to create a new user sessions due to exceeding sessions limits
* **Format String**  
  `"could not create new session via ~s from ~s with ~s due to session limits"`

</details>


<details>

<summary>SESSION_TERMINATION</summary>

<code>SESSION_TERMINATION</code>

* **Severity**  
  `INFO`
* **Description**  
  A user session was terminated due to specified reason
* **Format String**  
  `"terminated session (reason: ~s)"`

</details>


<details>

<summary>SKIP_FILE_LOADING</summary>

<code>SKIP_FILE_LOADING</code>

* **Severity**  
  `DEBUG`
* **Description**  
  System skips a file.
* **Format String**  
  `"Skipping file ~s: ~s"`

</details>


<details>

<summary>SNMP_AUTHENTICATION_FAILED</summary>

<code>SNMP_AUTHENTICATION_FAILED</code>

* **Severity**  
  `INFO`
* **Description**  
  An SNMP authentication failed.
* **Format String**  
  `"SNMP authentication failed: ~s"`

</details>


<details>

<summary>SNMP_CANT_LOAD_MIB</summary>

<code>SNMP_CANT_LOAD_MIB</code>

* **Severity**  
  `CRIT`
* **Description**  
  The SNMP Agent failed to load a MIB file
* **Format String**  
  `"Can't load MIB file: ~s"`

</details>


<details>

<summary>SNMP_MIB_LOADING</summary>

<code>SNMP_MIB_LOADING</code>

* **Severity**  
  `DEBUG`
* **Description**  
  SNMP Agent loading a MIB file
* **Format String**  
  `"Loading MIB: ~s"`

</details>


<details>

<summary>SNMP_NOT_A_TRAP</summary>

<code>SNMP_NOT_A_TRAP</code>

* **Severity**  
  `INFO`
* **Description**  
  An UDP package was received on the trap receiving port, but it's not an SNMP trap.
* **Format String**  
  `"SNMP gateway: Non-trap received from ~s"`

</details>


<details>

<summary>SNMP_READ_STATE_FILE_FAILED</summary>

<code>SNMP_READ_STATE_FILE_FAILED</code>

* **Severity**  
  `CRIT`
* **Description**  
  Read SNMP agent state file failed
* **Format String**  
  `"Read state file failed: ~s: ~s"`

</details>


<details>

<summary>SNMP_REQUIRES_CDB</summary>

<code>SNMP_REQUIRES_CDB</code>

* **Severity**  
  `WARNING`
* **Description**  
  The SNMP agent requires CDB to be enabled in order to be started.
* **Format String**  
  `"Can't start SNMP. CDB is not enabled"`

</details>


<details>

<summary>SNMP_TRAP_NOT_FORWARDED</summary>

<code>SNMP_TRAP_NOT_FORWARDED</code>

* **Severity**  
  `INFO`
* **Description**  
  An SNMP trap was to be forwarded, but couldn't be.
* **Format String**  
  `"SNMP gateway: Can't forward trap from ~s; ~s"`

</details>


<details>

<summary>SNMP_TRAP_NOT_RECOGNIZED</summary>

<code>SNMP_TRAP_NOT_RECOGNIZED</code>

* **Severity**  
  `INFO`
* **Description**  
  An SNMP trap was received on the trap receiving port, but its definition is not known
* **Format String**  
  `"SNMP gateway: Can't forward trap with OID ~s from ~s; There is no notification with this OID in the loaded models."`

</details>


<details>

<summary>SNMP_TRAP_OPEN_PORT</summary>

<code>SNMP_TRAP_OPEN_PORT</code>

* **Severity**  
  `ERR`
* **Description**  
  The port for listening to SNMP traps could not be opened.
* **Format String**  
  `"SNMP gateway: Can't open trap listening port ~s: ~s"`

</details>


<details>

<summary>SNMP_TRAP_UNKNOWN_SENDER</summary>

<code>SNMP_TRAP_UNKNOWN_SENDER</code>

* **Severity**  
  `INFO`
* **Description**  
  An SNMP trap was to be forwarded, but the sender was not listed in confd.conf.
* **Format String**  
  `"SNMP gateway: Not forwarding trap from ~s; the sender is not recognized"`

</details>


<details>

<summary>SNMP_TRAP_V1</summary>

<code>SNMP_TRAP_V1</code>

* **Severity**  
  `INFO`
* **Description**  
  An SNMP v1 trap was received on the trap receiving port, but forwarding v1 traps is not supported.
* **Format String**  
  `"SNMP gateway: V1 trap received from ~s"`

</details>


<details>

<summary>SNMP_WRITE_STATE_FILE_FAILED</summary>

<code>SNMP_WRITE_STATE_FILE_FAILED</code>

* **Severity**  
  `WARNING`
* **Description**  
  Write SNMP agent state file failed
* **Format String**  
  `"Write state file failed: ~s: ~s"`

</details>


<details>

<summary>SSH_HOST_KEY_UNAVAILABLE</summary>

<code>SSH_HOST_KEY_UNAVAILABLE</code>

* **Severity**  
  `ERR`
* **Description**  
  No SSH host keys available.
* **Format String**  
  `"No SSH host keys available"`

</details>


<details>

<summary>SSH_SUBSYS_ERR</summary>

<code>SSH_SUBSYS_ERR</code>

* **Severity**  
  `INFO`
* **Description**  
  Typically errors where the client doesn't properly send the \"subsystem\" command.
* **Format String**  
  `"ssh protocol subsys - ~s"`

</details>


<details>

<summary>STARTED</summary>

<code>STARTED</code>

* **Severity**  
  `INFO`
* **Description**  
  ConfD has started.
* **Format String**  
  `"ConfD started vsn: ~s"`

</details>


<details>

<summary>STARTING</summary>

<code>STARTING</code>

* **Severity**  
  `INFO`
* **Description**  
  ConfD is starting.
* **Format String**  
  `"Starting ConfD vsn: ~s"`

</details>


<details>

<summary>STOPPING</summary>

<code>STOPPING</code>

* **Severity**  
  `INFO`
* **Description**  
  ConfD is stopping (due to e.g. confd --stop).
* **Format String**  
  `"ConfD stopping (~s)"`

</details>


<details>

<summary>TOKEN_MISMATCH</summary>

<code>TOKEN_MISMATCH</code>

* **Severity**  
  `ERR`
* **Description**  
  A secondary connected to a primary with a bad auth token
* **Format String**  
  `"Token mismatch, secondary is not allowed"`

</details>


<details>

<summary>UPGRADE_ABORTED</summary>

<code>UPGRADE_ABORTED</code>

* **Severity**  
  `INFO`
* **Description**  
  In-service upgrade was aborted.
* **Format String**  
  `"Upgrade aborted"`

</details>


<details>

<summary>UPGRADE_COMMITTED</summary>

<code>UPGRADE_COMMITTED</code>

* **Severity**  
  `INFO`
* **Description**  
  In-service upgrade was committed.
* **Format String**  
  `"Upgrade committed"`

</details>


<details>

<summary>UPGRADE_INIT_STARTED</summary>

<code>UPGRADE_INIT_STARTED</code>

* **Severity**  
  `INFO`
* **Description**  
  In-service upgrade initialization has started.
* **Format String**  
  `"Upgrade init started"`

</details>


<details>

<summary>UPGRADE_INIT_SUCCEEDED</summary>

<code>UPGRADE_INIT_SUCCEEDED</code>

* **Severity**  
  `INFO`
* **Description**  
  In-service upgrade initialization succeeded.
* **Format String**  
  `"Upgrade init succeeded"`

</details>


<details>

<summary>UPGRADE_PERFORMED</summary>

<code>UPGRADE_PERFORMED</code>

* **Severity**  
  `INFO`
* **Description**  
  In-service upgrade has been performed (not committed yet).
* **Format String**  
  `"Upgrade performed"`

</details>


<details>

<summary>WEBUI_LOG_MSG</summary>

<code>WEBUI_LOG_MSG</code>

* **Severity**  
  `INFO`
* **Description**  
  WebUI access log message
* **Format String**  
  `"WebUI access log: ~s"`

</details>


<details>

<summary>WEB_ACTION</summary>

<code>WEB_ACTION</code>

* **Severity**  
  `INFO`
* **Description**  
  User executed a Web UI action.
* **Format String**  
  `"WebUI action '~s'"`

</details>


<details>

<summary>WEB_CMD</summary>

<code>WEB_CMD</code>

* **Severity**  
  `INFO`
* **Description**  
  User executed a Web UI command.
* **Format String**  
  `"WebUI cmd '~s'"`

</details>


<details>

<summary>WEB_COMMIT</summary>

<code>WEB_COMMIT</code>

* **Severity**  
  `INFO`
* **Description**  
  User performed Web UI commit.
* **Format String**  
  `"WebUI commit ~s"`

</details>


<details>

<summary>WRITE_STATE_FILE_FAILED</summary>

<code>WRITE_STATE_FILE_FAILED</code>

* **Severity**  
  `CRIT`
* **Description**  
  Writing of a state file failed
* **Format String**  
  `"Writing state file failed: ~s: ~s (~s)"`

</details>


<details>

<summary>XPATH_EVAL_ERROR1</summary>

<code>XPATH_EVAL_ERROR1</code>

* **Severity**  
  `WARNING`
* **Description**  
  An error occurred while evaluating an XPath expression.
* **Format String**  
  `"XPath evaluation error: ~s for ~s"`

</details>


<details>

<summary>XPATH_EVAL_ERROR2</summary>

<code>XPATH_EVAL_ERROR2</code>

* **Severity**  
  `WARNING`
* **Description**  
  An error occurred while evaluating an XPath expression.
* **Format String**  
  `"XPath evaluation error: '~s' resulted in ~s for ~s"`

</details>


<details>

<summary>COMMIT_UN_SYNCED_DEV</summary>

<code>COMMIT_UN_SYNCED_DEV</code>

* **Severity**  
  `INFO`
* **Description**  
  Data was committed toward a device with bad or unknown sync state
* **Format String**  
  `"Committed data towards device ~s which is out of sync"`

</details>


<details>

<summary>NCS_DEVICE_OUT_OF_SYNC</summary>

<code>NCS_DEVICE_OUT_OF_SYNC</code>

* **Severity**  
  `INFO`
* **Description**  
  A check-sync action reported out-of-sync for a device
* **Format String**  
  `"NCS device-out-of-sync Device '~s' Info '~s'"`

</details>


<details>

<summary>NCS_JAVA_VM_FAIL</summary>

<code>NCS_JAVA_VM_FAIL</code>

* **Severity**  
  `ERR`
* **Description**  
  The NCS Java VM failure/timeout
* **Format String**  
  `"The NCS Java VM ~s"`

</details>


<details>

<summary>NCS_JAVA_VM_START</summary>

<code>NCS_JAVA_VM_START</code>

* **Severity**  
  `INFO`
* **Description**  
  Starting the NCS Java VM
* **Format String**  
  `"Starting the NCS Java VM"`

</details>


<details>

<summary>NCS_PACKAGE_AUTH_BAD_RET</summary>

<code>NCS_PACKAGE_AUTH_BAD_RET</code>

* **Severity**  
  `ERR`
* **Description**  
  Package authentication program returned badly formatted data.
* **Format String**  
  `"package authentication using ~s program ret bad output: ~s"`

</details>


<details>

<summary>NCS_PACKAGE_AUTH_FAIL</summary>

<code>NCS_PACKAGE_AUTH_FAIL</code>

* **Severity**  
  `INFO`
* **Description**  
  Package authentication failed.
* **Format String**  
  `"package authentication using ~s failed via ~s from ~s with ~s: ~s"`

</details>


<details>

<summary>NCS_PACKAGE_AUTH_SUCCESS</summary>

<code>NCS_PACKAGE_AUTH_SUCCESS</code>

* **Severity**  
  `INFO`
* **Description**  
  A package authenticated user logged in.
* **Format String**  
  `"package authentication using ~s succeeded via ~s from ~s with ~s, member of groups: ~s~s"`

</details>


<details>

<summary>NCS_PACKAGE_BAD_DEPENDENCY</summary>

<code>NCS_PACKAGE_BAD_DEPENDENCY</code>

* **Severity**  
  `CRIT`
* **Description**  
  Bad NCS package dependency
* **Format String**  
  `"Failed to load NCS package: ~s; required package ~s of version ~s is not present (found ~s)"`

</details>


<details>

<summary>NCS_PACKAGE_BAD_NCS_VERSION</summary>

<code>NCS_PACKAGE_BAD_NCS_VERSION</code>

* **Severity**  
  `CRIT`
* **Description**  
  Bad NCS version for package
* **Format String**  
  `"Failed to load NCS package: ~s; requires NCS version ~s"`

</details>


<details>

<summary>NCS_PACKAGE_CHAL_2FA</summary>

<code>NCS_PACKAGE_CHAL_2FA</code>

* **Severity**  
  `INFO`
* **Description**  
  Package authentication challenge sent to a user.
* **Format String**  
  `"package authentication challenge sent to ~s from ~s with ~s"`

</details>


<details>

<summary>NCS_PACKAGE_CHAL_FAIL</summary>

<code>NCS_PACKAGE_CHAL_FAIL</code>

* **Severity**  
  `INFO`
* **Description**  
  Package authentication challenge failed.
* **Format String**  
  `"package authentication challenge using ~s failed via ~s from ~s with ~s: ~s"`

</details>


<details>

<summary>NCS_PACKAGE_CIRCULAR_DEPENDENCY</summary>

<code>NCS_PACKAGE_CIRCULAR_DEPENDENCY</code>

* **Severity**  
  `CRIT`
* **Description**  
  Circular NCS package dependency
* **Format String**  
  `"Failed to load NCS package: ~s; circular dependency found"`

</details>


<details>

<summary>NCS_PACKAGE_COPYING</summary>

<code>NCS_PACKAGE_COPYING</code>

* **Severity**  
  `DEBUG`
* **Description**  
  A package is copied from the load path to private directory
* **Format String**  
  `"Copying NCS package from ~s to ~s"`

</details>


<details>

<summary>NCS_PACKAGE_DUPLICATE</summary>

<code>NCS_PACKAGE_DUPLICATE</code>

* **Severity**  
  `CRIT`
* **Description**  
  Duplicate package found
* **Format String**  
  `"Failed to load duplicate NCS package ~s: (~s)"`

</details>


<details>

<summary>NCS_PACKAGE_SYNTAX_ERROR</summary>

<code>NCS_PACKAGE_SYNTAX_ERROR</code>

* **Severity**  
  `CRIT`
* **Description**  
  Syntax error in package file
* **Format String**  
  `"Failed to load NCS package: ~s; syntax error in package file"`

</details>


<details>

<summary>NCS_PACKAGE_UPGRADE_ABORTED</summary>

<code>NCS_PACKAGE_UPGRADE_ABORTED</code>

* **Severity**  
  `CRIT`
* **Description**  
  The CDB upgrade was aborted implying that CDB is untouched. However the package state is changed
* **Format String**  
  `"NCS package upgrade failed with reason '~s'"`

</details>


<details>

<summary>NCS_PACKAGE_UPGRADE_UNSAFE</summary>

<code>NCS_PACKAGE_UPGRADE_UNSAFE</code>

* **Severity**  
  `CRIT`
* **Description**  
  Package upgrade has been aborted due to warnings.
* **Format String**  
  `"NCS package upgrade has been aborted due to warnings:\n~s"`

</details>


<details>

<summary>NCS_PYTHON_VM_FAIL</summary>

<code>NCS_PYTHON_VM_FAIL</code>

* **Severity**  
  `ERR`
* **Description**  
  The NCS Python VM failure/timeout
* **Format String**  
  `"The NCS Python VM ~s"`

</details>


<details>

<summary>NCS_PYTHON_VM_START</summary>

<code>NCS_PYTHON_VM_START</code>

* **Severity**  
  `INFO`
* **Description**  
  Starting the named NCS Python VM
* **Format String**  
  `"Starting the NCS Python VM ~s"`

</details>


<details>

<summary>NCS_PYTHON_VM_START_UPGRADE</summary>

<code>NCS_PYTHON_VM_START_UPGRADE</code>

* **Severity**  
  `INFO`
* **Description**  
  Starting a Python VM to run upgrade code
* **Format String**  
  `"Starting upgrade of NCS Python package ~s"`

</details>


<details>

<summary>NCS_SERVICE_OUT_OF_SYNC</summary>

<code>NCS_SERVICE_OUT_OF_SYNC</code>

* **Severity**  
  `INFO`
* **Description**  
  A check-sync action reported out-of-sync for a service
* **Format String**  
  `"NCS service-out-of-sync Service '~s' Info '~s'"`

</details>


<details>

<summary>NCS_SET_PLATFORM_DATA_ERROR</summary>

<code>NCS_SET_PLATFORM_DATA_ERROR</code>

* **Severity**  
  `ERR`
* **Description**  
  The device failed to set the platform operational data at connect
* **Format String**  
  `"NCS Device '~s' failed to set platform data Info '~s'"`

</details>


<details>

<summary>NCS_SMART_LICENSING_ENTITLEMENT_NOTIFICATION</summary>

<code>NCS_SMART_LICENSING_ENTITLEMENT_NOTIFICATION</code>

* **Severity**  
  `INFO`
* **Description**  
  Smart Licensing Entitlement Notification
* **Format String**  
  `"Smart Licensing Entitlement Notification: ~s"`

</details>


<details>

<summary>NCS_SMART_LICENSING_EVALUATION_COUNTDOWN</summary>

<code>NCS_SMART_LICENSING_EVALUATION_COUNTDOWN</code>

* **Severity**  
  `INFO`
* **Description**  
  Smart Licensing evaluation time remaining
* **Format String**  
  `"Smart Licensing evaluation time remaining: ~s"`

</details>


<details>

<summary>NCS_SMART_LICENSING_FAIL</summary>

<code>NCS_SMART_LICENSING_FAIL</code>

* **Severity**  
  `INFO`
* **Description**  
  The NCS Smart Licensing Java VM failure/timeout
* **Format String**  
  `"The NCS Smart Licensing Java VM ~s"`

</details>


<details>

<summary>NCS_SMART_LICENSING_GLOBAL_NOTIFICATION</summary>

<code>NCS_SMART_LICENSING_GLOBAL_NOTIFICATION</code>

* **Severity**  
  `INFO`
* **Description**  
  Smart Licensing Global Notification
* **Format String**  
  `"Smart Licensing Global Notification: ~s"`

</details>


<details>

<summary>NCS_SMART_LICENSING_START</summary>

<code>NCS_SMART_LICENSING_START</code>

* **Severity**  
  `INFO`
* **Description**  
  Starting the NCS Smart Licensing Java VM
* **Format String**  
  `"Starting the NCS Smart Licensing Java VM"`

</details>


<details>

<summary>NCS_SNMPM_START</summary>

<code>NCS_SNMPM_START</code>

* **Severity**  
  `INFO`
* **Description**  
  Starting the NCS SNMP manager component
* **Format String**  
  `"Starting the NCS SNMP manager component"`

</details>


<details>

<summary>NCS_SNMPM_STOP</summary>

<code>NCS_SNMPM_STOP</code>

* **Severity**  
  `INFO`
* **Description**  
  The NCS SNMP manager component has been stopped
* **Format String**  
  `"The NCS SNMP manager component has been stopped"`

</details>


<details>

<summary>NCS_SNMP_INIT_ERR</summary>

<code>NCS_SNMP_INIT_ERR</code>

* **Severity**  
  `INFO`
* **Description**  
  Failed to locate snmp_init.xml in loadpath
* **Format String**  
  `"Failed to locate snmp_init.xml in loadpath ~s"`

</details>


<details>

<summary>BAD_LOCAL_PASS</summary>

<code>BAD_LOCAL_PASS</code>

* **Severity**  
  `INFO`
* **Description**  
  A locally configured user provided a bad password.
* **Format String**  
  `"Provided bad password"`

</details>


<details>

<summary>EXT_LOGIN</summary>

<code>EXT_LOGIN</code>

* **Severity**  
  `INFO`
* **Description**  
  An externally authenticated user logged in.
* **Format String**  
  `"Logged in over ~s using externalauth, member of groups: ~s~s"`

</details>


<details>

<summary>EXT_NO_LOGIN</summary>

<code>EXT_NO_LOGIN</code>

* **Severity**  
  `INFO`
* **Description**  
  External authentication failed for a user.
* **Format String**  
  `"failed to login using externalauth: ~s"`

</details>


<details>

<summary>NO_SUCH_LOCAL_USER</summary>

<code>NO_SUCH_LOCAL_USER</code>

* **Severity**  
  `INFO`
* **Description**  
  A non existing local user tried to login.
* **Format String**  
  `"no such local user"`

</details>


<details>

<summary>PAM_LOGIN_FAILED</summary>

<code>PAM_LOGIN_FAILED</code>

* **Severity**  
  `INFO`
* **Description**  
  A user failed to login through PAM.
* **Format String**  
  `"pam phase ~s failed to login through PAM: ~s"`

</details>


<details>

<summary>PAM_NO_LOGIN</summary>

<code>PAM_NO_LOGIN</code>

* **Severity**  
  `INFO`
* **Description**  
  A user failed to login through PAM
* **Format String**  
  `"failed to login through PAM: ~s"`

</details>


<details>

<summary>SSH_LOGIN</summary>

<code>SSH_LOGIN</code>

* **Severity**  
  `INFO`
* **Description**  
  A user logged into ConfD's builtin ssh server.
* **Format String**  
  `"logged in over ssh from ~s with authmeth:~s"`

</details>


<details>

<summary>SSH_LOGOUT</summary>

<code>SSH_LOGOUT</code>

* **Severity**  
  `INFO`
* **Description**  
  A user was logged out from ConfD's builtin ssh server.
* **Format String**  
  `"Logged out ssh <~s> user"`

</details>


<details>

<summary>SSH_NO_LOGIN</summary>

<code>SSH_NO_LOGIN</code>

* **Severity**  
  `INFO`
* **Description**  
  A user failed to login to ConfD's builtin SSH server.
* **Format String**  
  `"Failed to login over ssh: ~s"`

</details>


<details>

<summary>WEB_LOGIN</summary>

<code>WEB_LOGIN</code>

* **Severity**  
  `INFO`
* **Description**  
  A user logged in through the WebUI.
* **Format String**  
  `"logged in through Web UI from ~s"`

</details>


<details>

<summary>WEB_LOGOUT</summary>

<code>WEB_LOGOUT</code>

* **Severity**  
  `INFO`
* **Description**  
  A Web UI user logged out.
* **Format String**  
  `"logged out from Web UI"`

</details>

