# confd_lib_events Man Page

`confd_lib_events` - library for subscribing to NSO event notifications

## Synopsis

    #include <confd_lib.h>
    #include <confd_events.h>

    int confd_notifications_connect(
    int sock, const struct sockaddr* srv, int srv_sz, confd_notification_type mask);

    int confd_notifications_connect2(
    int sock, const struct sockaddr* srv, int srv_sz, confd_notification_type mask, 
    struct confd_notifications_data *data);

    int confd_read_notification(
    int sock, struct confd_notification *n);

    void confd_free_notification(
    struct confd_notification *n);

    int confd_diff_notification_done(
    int sock, struct confd_trans_ctx  *tctx);

    int confd_sync_audit_notification(
    int sock, int usid);

    int confd_sync_ha_notification(
    int sock);

    int ncs_sync_audit_network_notification(
    int sock, int usid);

## Library

NSO Library, (`libconfd`, `-lconfd`)

## Description

The `libconfd` shared library is used to connect to NSO and subscribe to
certain events generated by NSO. The API to receive events from NSO is a
socket based API whereby the application connects to NSO and receives
events on a socket. See also the Notifications chapter in Northbound
APIs. The program `misc/notifications/confd_notifications.c` in the
examples collection illustrates subscription and processing for all
these events, and can also be used standalone in a development
environment to monitor NSO events.

> **Note**  
>  
> Any event may allocate memory dynamically inside the
> `struct confd_notification`, thus we must always call
> `confd_free_notification()` after receiving and processing an event.

## Events

The following events can be subscribed to:

`CONFD_NOTIF_AUDIT`  
> All audit log events are sent from ConfD on the event notification
> socket.

`CONFD_NOTIF_AUDIT_SYNC`  
> This flag modifies the behavior of a subscription for the
> `CONFD_NOTIF_AUDIT` event - it has no effect unless
> `CONFD_NOTIF_AUDIT` is also present. If this flag is present, ConfD
> will stop processing in the user session that causes an audit
> notification to be sent, and continue processing in that user session
> only after all subscribers with this flag have called
> `confd_sync_audit_notification()`.

`CONFD_NOTIF_DAEMON`  
> All log events that also goes to the /confdConf/logs/confdLog log are
> sent from ConfD on the event notification socket.

`CONFD_NOTIF_NETCONF`  
> All log events that also goes to the /confdConf/logs/netconfLog log
> are sent from ConfD on the event notification socket.

`CONFD_NOTIF_DEVEL`  
> All log events that also goes to the /confdConf/logs/developerLog log
> are sent from ConfD on the event notification socket.

`CONFD_NOTIF_JSONRPC`  
> All log events that also goes to the /confdConf/logs/jsonrpcLog log
> are sent from ConfD on the event notification socket.

`CONFD_NOTIF_WEBUI`  
> All log events that also goes to the /confdConf/logs/webuiAccessLog
> log are sent from ConfD on the event notification socket.

`CONFD_NOTIF_TAKEOVER_SYSLOG`  
> If this flag is present, ConfD will stop syslogging. The idea behind
> the flag is that we want to configure syslogging for ConfD in order to
> let ConfD log its startup sequence. Once ConfD is started we wish to
> subsume the syslogging done by ConfD. Typical applications that use
> this flag want to pick up all log messages, reformat them and use some
> local logging method.
>
> Once all subscriber sockets with this flag set are closed, ConfD will
> resume to syslog.

`CONFD_NOTIF_COMMIT_SIMPLE`  
> An event indicating that a user has somehow modified the
> configuration.

`CONFD_NOTIF_COMMIT_DIFF`  
> An event indicating that a user has somehow modified the
> configuration. The main difference between this event and the
> abovementioned CONFD_NOTIF_COMMIT_SIMPLE is that this event is
> synchronous, i.e. the entire transaction hangs until we have
> explicitly called `confd_diff_notification_done()`. The purpose of
> this event is to give the applications a chance to read the
> configuration diffs from the transaction before it finishes. A user
> subscribing to this event can use MAAPI to attach (`maapi_attach()`)
> to the running transaction and use `maapi_diff_iterate()` to iterate
> through the diff. This feature can also be used to produce a complete
> audit trail of who changed what and when in the system. It is up to
> the application to format that audit trail.

`CONFD_NOTIF_COMMIT_FAILED`  
> This event is generated when a data provider fails in its commit
> callback. ConfD executes a two-phase commit procedure towards all data
> providers when committing transactions. When a provider fails in
> commit, the system is an unknown state. See
> [confd_lib_maapi(3)](confd_lib_maapi.3.md) and the function
> `maapi_get_running_db_state()`. If the provider is "external", the
> name of failing daemon is provided. If the provider is another NETCONF
> agent, the IP address and port of that agent is provided.

`CONFD_NOTIF_CONFIRMED_COMMIT`  
> This event is generated when a user has started a confirmed commit,
> when a confirming commit is issued, or when a confirmed commit is
> aborted; represented by `enum confd_confirmed_commit_type`.
>
> For a confirmed commit, the timeout value is also present in the
> notification.

`CONFD_NOTIF_COMMIT_PROGRESS`  
> This event provides progress information about the commit of a
> transaction. The application receives a
> `struct confd_progress_notification` which gives details for the
> specific transaction along with the progress information, see
> `confd_events.h`.

`CONFD_NOTIF_PROGRESS`  
> This event provides progress information about the commit of a
> transaction or an action being applied. The application receives a
> `struct confd_progress_notification` which gives details for the
> specific transaction/action along with the progress information, see
> `confd_events.h`.

`CONFD_NOTIF_USER_SESSION`  
> An event related to user sessions. There are 6 different user session
> related event types, defined in `enum confd_user_sess_type`: session
> starts/stops, session locks/unlocks database, session starts/stop
> database transaction.

`CONFD_NOTIF_HA_INFO`  
> An event related to ConfDs perception of the current cluster
> configuration.

`CONFD_NOTIF_HA_INFO_SYNC`  
> This flag modifies the behavior of a subscription for the
> `CONFD_NOTIF_HA_INFO` event - it has no effect unless
> `CONFD_NOTIF_HA_INFO` is also present. If this flag is present, ConfD
> will stop all HA processing, and continue only after all subscribers
> with this flag have called `confd_sync_ha_notification()`.

`CONFD_NOTIF_SUBAGENT_INFO`  
> Only sent if ConfD runs as a primary agent with subagents enabled.
> This event is sent when the subagent connection is lost or
> reestablished. There are two event types, defined in
> `enum confd_subagent_info_type`: subagent up and subagent down.

`CONFD_NOTIF_SNMPA`  
> This event is generated whenever an SNMP pdu is processed by ConfD.
> The application receives a `struct confd_snmpa_notification`
> structure. The structure contains a series of fields describing the
> sent or received SNMP pdu. It contains a list of all varbinds in the
> pdu.
>
> Each varbind contains a `confd_value_t` with the string representation
> of the SNMP value. Thus the type of the value in a varbind is always
> C_BUF. See `confd_events.h` include file for the details of the
> received structure.

`CONFD_NOTIF_FORWARD_INFO`  
> This event is generated whenever ConfD forwards (proxies) a northbound
> agent.

`CONFD_NOTIF_UPGRADE_EVENT`  
> This event is generated for the different phases of an in-service
> upgrade, i.e. when the data model is upgraded while ConfD is running.
> The application receives a `struct confd_upgrade_notification` where
> the `enum confd_upgrade_event_type event` gives the specific upgrade
> event, see `confd_events.h`. The events correspond to the invocation
> of the MAAPI functions that drive the upgrade, see
> [confd_lib_maapi(3)](confd_lib_maapi.3.md).

`CONFD_NOTIF_HEARTBEAT`  
> This event can be be used by applications that wish to monitor the
> health and liveness of ConfD itself. It needs to be requested through
> a call to `confd_notifications_connect2()`, where the required
> `heartbeat_interval` can be provided via the
> `struct confd_notifications_data` parameter. ConfD will continuously
> generate heartbeat events on the notification socket. If ConfD fails
> to do so, ConfD is hung, or prevented from getting the CPU time
> required to send the event. The timeout interval is measured in
> milliseconds. Recommended value is 10000 milliseconds to cater for
> truly high load situations. Values less than 1000 are changed to 1000.

`CONFD_NOTIF_HEALTH_CHECK`  
> This event is similar to `CONFD_NOTIF_HEARTBEAT`, in that it can be be
> used by applications that wish to monitor the health and liveness of
> ConfD itself. However while `CONFD_NOTIF_HEARTBEAT` will be generated
> as long as ConfD is not completely hung, `CONFD_NOTIF_HEALTH_CHECK`
> will only be generated after a basic liveness check of the different
> ConfD subsystems has completed successfully. This event also needs to
> be requested through a call to `confd_notifications_connect2()`, where
> the required `health_check_interval` can be provided via the
> `struct confd_notifications_data` parameter. Since the event
> generation incurs more processing than `CONFD_NOTIF_HEARTBEAT`, a
> longer interval than 10000 milliseconds is recommended, but in
> particular the application must be prepared for the actual interval to
> be significantly longer than the requested one in high load
> situations. Values less than 1000 are changed to 1000.

`CONFD_NOTIF_REOPEN_LOGS`  
> This event indicates that NSO will close and reopen its log files,
> i.e. that `ncs --reload` or `maapi_reopen_logs()` (e.g. via
> `ncs_cmd -c reopen_logs`) has been used.

`CONFD_NOTIF_STREAM_EVENT`  
> This event is generated for a notification stream, i.e. event
> notifications sent by an application as described in the [NOTIFICATION
> STREAMS](confd_lib_dp.3.md#notification_streams) section of
> [confd_lib_dp(3)](confd_lib_dp.3.md). The application receives a
> `struct confd_stream_notification` where the
> `enum confd_stream_notif_type type` gives the specific event that
> occurred, see `confd_events.h`. This can be either an actual event
> notification (`CONFD_STREAM_NOTIFICATION_EVENT`), one of
> `CONFD_STREAM_NOTIFICATION_COMPLETE` or
> `CONFD_STREAM_REPLAY_COMPLETE`, which indicates that a requested
> replay has completed, or `CONFD_STREAM_REPLAY_FAILED`, which indicates
> that a requested replay could not be carried out. In all cases except
> `CONFD_STREAM_NOTIFICATION_EVENT`, no further
> `CONFD_NOTIF_STREAM_EVENT` events will be delivered on the socket.
>
> This event also needs to be requested through a call to
> `confd_notifications_connect2()`, where the required `stream_name`
> must be provided via the `struct confd_notifications_data` parameter.
> The additional elements in the struct can be used as follows:
>
> - The `start_time` element can be given to request a replay, in which
>   case `stop_time` can also be given to specify the end of the replay
>   (or "live feed"). The `start_time` and `stop_time` must be set to
>   the type C_NOEXISTS to indicate that no value is given, otherwise
>   values of type C_DATETIME must be given.
>
> - The `xpath_filter` element may be used to specify an XPath filter to
>   be applied to the notification stream. If no filtering is wanted,
>   `xpath_filter` must be set to NULL.
>
> - The `usid` element may be used to specify the id of an existing user
>   session for filtering based on AAA rules. Only notifications that
>   are allowed by the access rights of that user session will be
>   received. If no AAA restrictions are wanted, `usid` must be set to
>   `0`.

`CONFD_NOTIF_COMPACTION`  
> This event is generated after each CDB compaction performed by NSO.
> The application receives a `struct confd_compaction_notification`
> where the `enum confd_compaction_dbfile` indicates which datastore was
> compacted, and `enum confd_compaction_type` indicates whether the
> compaction was triggered manually or automatically by the system. The
> notification contains additional information on compaction time,
> datastore sizes and the number of transactions since the last
> compaction. See `confd_events.h` for more information.

`NCS_NOTIF_PACKAGE_RELOAD`  
> This event is generated whenever NSO has completed a package reload.

`NCS_NOTIF_CQ_PROGRESS`  
> This event is generated to report the progress of commit queue
> entries.
>
> The application receives a `struct ncs_cq_progress_notification` where
> the `enum ncs_cq_progress_notif_type type` gives the specific event
> that occurred, see `confd_events.h`. This can be one of
> `NCS_CQ_ITEM_WAITING` (waiting on another executing entry),
> `NCS_CQ_ITEM_EXECUTING`, `NCS_CQ_ITEM_LOCKED` (stalled by parent queue
> in cluster), `NCS_CQ_ITEM_COMPLETED`, `NCS_CQ_ITEM_FAILED` or
> `NCS_CQ_ITEM_DELETED`.

`NCS_NOTIF_CALL_HOME_INFO`  
> This event is generated for a NETCONF Call Home connection. The
> application receives a `struct ncs_call_home_notification` structure.
> See `confd_events.h` include file for the details of the received
> structure.

`NCS_NOTIF_AUDIT_NETWORK`  
> This event is generated whenever any config change is sent southbound
> towards a device.

`NCS_NOTIF_AUDIT_NETWORK_SYNC`  
> This flag modifies the behavior of a subscription for the
> `NCS_NOTIF_AUDIT_NETWORK` event - it has no effect unless
> `NCS_NOTIF_AUDIT_NETWORK` is also present. If this flag is present,
> NSO will stop processing in the user session that causes an audit
> network notification to be sent, and continue processing in that user
> session only after all subscribers with this flag have called
> `ncs_sync_audit_network_notification()`.

Several of the above notification messages contain a lognumber which
identifies the event. All log numbers are listed in the file
`confd_logsyms.h`. Furthermore the array `confd_log_symbols[]` can be
indexed with the lognumber and it contains the symbolic name of each
error. The array `confd_log_descriptions[]` can also be indexed with the
lognumber and it contains a textual description of the logged event.

## Functions

The API to receive events from ConfD is:

    int confd_notifications_connect(
    int sock, const struct sockaddr* srv, int srv_sz, confd_notification_type mask);

    int confd_notifications_connect2(
    int sock, const struct sockaddr* srv, int srv_sz, confd_notification_type mask, 
    struct confd_notifications_data *data);

These functions create a notification socket. The `mask` is a bitmask of
one or several `confd_notification_type` values.

The `confd_notifications_connect2()` variant is required if we wish to
subscribe to `CONFD_NOTIF_HEARTBEAT`, `CONFD_NOTIF_HEALTH_CHECK`, or
`CONFD_NOTIF_STREAM_EVENT` events. The `struct confd_notifications_data`
is defined as:

<div class="informalexample">

``` c
struct confd_notifications_data {
    int heartbeat_interval;    /* required if we wish to generate */
                               /* CONFD_NOTIF_HEARTBEAT events    */
                               /* the time is milli seconds       */
    int health_check_interval; /* required if we wish to generate */
                               /* CONFD_NOTIF_HEALTH_CHECK events */
                               /* the time is milli seconds       */
    /* The following five are used for CONFD_NOTIF_STREAM_EVENT */
    char *stream_name;        /* stream name (required)          */
    confd_value_t start_time; /* type = C_NOEXISTS or C_DATETIME */
    confd_value_t stop_time;  /* type = C_NOEXISTS or C_DATETIME */
                              /* when start_time is C_DATETIME   */
    char *xpath_filter;       /* optional XPath filter for the   */
                              /* stream -  NULL for no filter    */
    int usid;                 /* optional user session id for    */
                              /* AAA  restriction - 0 for no AAA */
    /* The following are used for CONFD_NOTIF_PROGRESS and */
    /* CONFD_NOTIF_COMMIT_PROGRESS                         */
    enum confd_progress_verbosity verbosity; /* optional verbosity level      */
};
```

</div>

When requesting the `CONFD_NOTIF_STREAM_EVENT` event,
`confd_notifications_connect2()` may fail and return CONFD_ERR, with
some specific `confd_errno` values:

`CONFD_ERR_NOEXISTS`  
> The stream name given by `stream_name` does not exist.

`CONFD_ERR_XPATH`  
> The XPath filter provided via `xpath_filter` failed to compile.

`CONFD_ERR_NOSESSION`  
> The user session id given by `usid` does not identify an existing user
> session.

> **Note**  
>  
> If these calls fail (i.e. do not return CONFD_OK), the socket
> descriptor must be closed and a new socket created before the call is
> re-attempted.

    int confd_read_notification(
    int sock, struct confd_notification *n);

The application is responsible for polling the notification socket. Once
data is available to be read on the socket the application must call
`confd_read_notification()` to read the data from the socket. On success
the function returns CONFD_OK and populates the
`struct confd_notification*` pointer. See `confd_events.h` for the
definition of the `struct confd_notification` structure.

If the application is not reading from the socket and a write() from
ConfD hangs for more than 15 seconds, ConfD will close the socket and
log the event to the confdLog

    void confd_free_notification(
    struct confd_notification *n);

The `struct confd_notification` can sometimes have memory dynamically
allocated inside it. This function must be called to free any memory
allocated inside the received notification structure.

For those notification structures that do not have any memory allocated,
this function is a no-op, thus it is always safe to call this function
after a notification structure has been processed.

    int confd_diff_notification_done(
    int sock, struct confd_trans_ctx  *tctx);

If the received event was CONFD_NOTIF_COMMIT_DIFF it is important that
we call this function when we are done reading the transaction diffs
over MAAPI. The transaction is hanging until this function gets called.
This function also releases memory associated to the transaction in the
library.

    int confd_sync_audit_notification(
    int sock, int usid);

If the received event was CONFD_NOTIF_AUDIT, and we are subscribing to
notifications with the flag CONFD_NOTIF_AUDIT_SYNC, this function must
be called when we are done processing the notification. The user session
is hanging until this function gets called.

    int confd_sync_ha_notification(
    int sock);

If the received event was CONFD_NOTIF_HA_INFO, and we are subscribing to
notifications with the flag CONFD_NOTIF_HA_INFO_SYNC, this function must
be called when we are done processing the notification. All HA
processing is blocked until this function gets called.

    int ncs_sync_audit_network_notification(
    int sock, int usid);

If the received event was NCS_NOTIF_AUDIT_NETWORK, and we are
subscribing to notifications with the flag NCS_NOTIF_AUDIT_NETWORK_SYNC,
this function must be called when we are done processing the
notification. The user session will hang until this function is called.

## See Also

The ConfD User Guide
