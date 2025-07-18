# confd_lib_dp Man Page

`confd_lib_dp` - callback library for connecting data providers to ConfD

## Synopsis

    #include <confd_lib.h>
    #include <confd_dp.h>

    struct confd_daemon_ctx *confd_init_daemon(
    const char *name);

    int confd_set_daemon_flags(
    struct confd_daemon_ctx *dx, int flags);

    void confd_release_daemon(
    struct confd_daemon_ctx *dx);

    int confd_connect(
    struct confd_daemon_ctx *dx, int sock, enum confd_sock_type type, const struct sockaddr *srv, 
    int addrsz);

    int confd_register_trans_cb(
    struct confd_daemon_ctx *dx, const struct confd_trans_cbs *trans);

    int confd_register_db_cb(
    struct confd_daemon_ctx *dx, const struct confd_db_cbs *dbcbs);

    int  confd_register_range_data_cb(
    struct confd_daemon_ctx *dx, const struct confd_data_cbs *data, const confd_value_t *lower, 
    const confd_value_t *upper, int numkeys, const char *fmt, ...);

    int confd_register_data_cb(
    struct confd_daemon_ctx *dx, const struct confd_data_cbs *data);

    int confd_register_usess_cb(
    struct confd_daemon_ctx *dx, const struct confd_usess_cbs *ucb);

    int ncs_register_service_cb(
    struct confd_daemon_ctx *dx, const struct ncs_service_cbs *scb);

    int ncs_register_nano_service_cb(
    struct confd_daemon_ctx *dx, const char *component_type, const char *state, 
    const struct ncs_nano_service_cbs *scb);

    int confd_register_done(
    struct confd_daemon_ctx *dx);

    int confd_fd_ready(
    struct confd_daemon_ctx *dx, int fd);

    void confd_trans_set_fd(
    struct confd_trans_ctx *tctx, int sock);

    int confd_data_reply_value(
    struct confd_trans_ctx *tctx, const confd_value_t *v);

    int confd_data_reply_value_attrs(
    struct confd_trans_ctx *tctx, const confd_value_t *v, const confd_attr_value_t *attrs, 
    int num_attrs);

    int confd_data_reply_value_array(
    struct confd_trans_ctx *tctx, const confd_value_t *vs, int n);

    int confd_data_reply_tag_value_array(
    struct confd_trans_ctx *tctx, const confd_tag_value_t *tvs, int n);

    int confd_data_reply_tag_value_attrs_array(
    struct confd_trans_ctx *tctx, const confd_tag_value_attr_t *tvas, int n);

    int confd_data_reply_next_key(
    struct confd_trans_ctx *tctx, const confd_value_t *v, int num_vals_in_key, 
    long next);

    int confd_data_reply_next_key_attrs(
    struct confd_trans_ctx *tctx, const confd_value_t *v, int num_vals_in_key, 
    long next, const confd_attr_value_t *attrs, int num_attrs);

    int confd_data_reply_not_found(
    struct confd_trans_ctx *tctx);

    int confd_data_reply_found(
    struct confd_trans_ctx *tctx);

    int confd_data_reply_next_object_array(
    struct confd_trans_ctx *tctx, const confd_value_t *v, int n, long next);

    int confd_data_reply_next_object_tag_value_array(
    struct confd_trans_ctx *tctx, const confd_tag_value_t *tv, int n, long next);

    int confd_data_reply_next_object_tag_value_attrs_array(
    struct confd_trans_ctx *tctx, const confd_tag_value_attr_t *tva, int n, 
    long next);

    int confd_data_reply_next_object_arrays(
    struct confd_trans_ctx *tctx, const struct confd_next_object *obj, int nobj, 
    int timeout_millisecs);

    int confd_data_reply_next_object_tag_value_arrays(
    struct confd_trans_ctx *tctx, const struct confd_tag_next_object *tobj, 
    int nobj, int timeout_millisecs);

    int confd_data_reply_next_object_tag_value_attrs_arrays(
    struct confd_trans_ctx *tctx, const struct confd_tag_next_object_attrs *toa, 
    int nobj, int timeout_millisecs);

    int confd_data_reply_attrs(
    struct confd_trans_ctx *tctx, const confd_attr_value_t *attrs, int num_attrs);

    int confd_register_push_on_change(
    struct confd_daemon_ctx *dx, const struct confd_push_on_change_cbs *pcbs);

    int confd_push_on_change(
    struct confd_push_on_change_ctx *pctx, struct confd_datetime *time, const struct confd_data_patch *patch);

    int ncs_service_reply_proplist(
    struct confd_trans_ctx *tctx, const struct ncs_name_value *proplist, int num_props);

    int ncs_nano_service_reply_proplist(
    struct confd_trans_ctx *tctx, const struct ncs_name_value *proplist, int num_props);

    int confd_delayed_reply_ok(
    struct confd_trans_ctx *tctx);

    int confd_delayed_reply_error(
    struct confd_trans_ctx *tctx, const char *errstr);

    int confd_data_set_timeout(
    struct confd_trans_ctx *tctx, int timeout_secs);

    int confd_data_get_list_filter(
    struct confd_trans_ctx *tctx, struct confd_list_filter **filter);

    void confd_free_list_filter(
    struct confd_list_filter *filter);

    void confd_trans_seterr(
    struct confd_trans_ctx *tctx, const char *fmt);

    void confd_trans_seterr_extended(
    struct confd_trans_ctx *tctx, enum confd_errcode code, uint32_t apptag_ns, 
    uint32_t apptag_tag, const char *fmt);

    int confd_trans_seterr_extended_info(
    struct confd_trans_ctx *tctx, enum confd_errcode code, uint32_t apptag_ns, 
    uint32_t apptag_tag, confd_tag_value_t *error_info, int n, const char *fmt);

    void confd_db_seterr(
    struct confd_db_ctx *dbx, const char *fmt);

    void confd_db_seterr_extended(
    struct confd_db_ctx *dbx, enum confd_errcode code, uint32_t apptag_ns, 
    uint32_t apptag_tag, const char *fmt);

    int confd_db_seterr_extended_info(
    struct confd_db_ctx *dbx, enum confd_errcode code, uint32_t apptag_ns, 
    uint32_t apptag_tag, confd_tag_value_t *error_info, int n, const char *fmt);

    int confd_db_set_timeout(
    struct confd_db_ctx *dbx, int timeout_secs);

    int confd_aaa_reload(
    const struct confd_trans_ctx *tctx);

    int confd_install_crypto_keys(
    struct confd_daemon_ctx* dtx);

    void confd_register_trans_validate_cb(
    struct confd_daemon_ctx *dx, const struct confd_trans_validate_cbs *vcbs);

    int confd_register_valpoint_cb(
    struct confd_daemon_ctx *dx, const struct confd_valpoint_cb *vcb);

    int confd_register_range_valpoint_cb(
    struct confd_daemon_ctx *dx, struct confd_valpoint_cb *vcb, const confd_value_t *lower, 
    const confd_value_t *upper, int numkeys, const char *fmt, ...);

    int confd_delayed_reply_validation_warn(
    struct confd_trans_ctx *tctx);

    int confd_register_action_cbs(
    struct confd_daemon_ctx *dx, const struct confd_action_cbs *acb);

    int confd_register_range_action_cbs(
    struct confd_daemon_ctx *dx, const struct confd_action_cbs *acb, const confd_value_t *lower, 
    const confd_value_t *upper, int numkeys, const char *fmt, ...);

    void confd_action_set_fd(
    struct confd_user_info *uinfo, int sock);

    void confd_action_seterr(
    struct confd_user_info *uinfo, const char *fmt);

    void confd_action_seterr_extended(
    struct confd_user_info *uinfo, enum confd_errcode code, uint32_t apptag_ns, 
    uint32_t apptag_tag, const char *fmt);

    int confd_action_seterr_extended_info(
    struct confd_user_info *uinfo, enum confd_errcode code, uint32_t apptag_ns, 
    uint32_t apptag_tag, confd_tag_value_t *error_info, int n, const char *fmt);

    int confd_action_reply_values(
    struct confd_user_info *uinfo, confd_tag_value_t *values, int nvalues);

    int confd_action_reply_command(
    struct confd_user_info *uinfo, char **values, int nvalues);

    int confd_action_reply_rewrite(
    struct confd_user_info *uinfo, char **values, int nvalues, char **unhides, 
    int nunhides);

    int confd_action_reply_rewrite2(
    struct confd_user_info *uinfo, char **values, int nvalues, char **unhides, 
    int nunhides, struct confd_rewrite_select **selects, int nselects);

    int confd_action_reply_completion(
    struct confd_user_info *uinfo, struct confd_completion_value *values, 
    int nvalues);

    int confd_action_reply_range_enum(
    struct confd_user_info *uinfo, char **values, int keysize, int nkeys);

    int confd_action_delayed_reply_ok(
    struct confd_user_info *uinfo);

    int confd_action_delayed_reply_error(
    struct confd_user_info *uinfo, const char *errstr);

    int confd_action_set_timeout(
    struct confd_user_info *uinfo, int timeout_secs);

    int confd_register_notification_stream(
    struct confd_daemon_ctx *dx, const struct confd_notification_stream_cbs *ncbs, 
    struct confd_notification_ctx **nctx);

    int confd_notification_send(
    struct confd_notification_ctx *nctx, struct confd_datetime *time, confd_tag_value_t *values, 
    int nvalues);

    int confd_notification_send_path(
    struct confd_notification_ctx *nctx, struct confd_datetime *time, confd_tag_value_t *values, 
    int nvalues, const char *fmt, ...);

    int confd_notification_replay_complete(
    struct confd_notification_ctx *nctx);

    int confd_notification_replay_failed(
    struct confd_notification_ctx *nctx);

    int confd_notification_reply_log_times(
    struct confd_notification_ctx *nctx, struct confd_datetime *creation, 
    struct confd_datetime *aged);

    void confd_notification_set_fd(
    struct confd_notification_ctx *nctx, int fd);

    void confd_notification_set_snmp_src_addr(
    struct confd_notification_ctx *nctx, const struct confd_ip *src_addr);

    int confd_notification_set_snmp_notify_name(
    struct confd_notification_ctx *nctx, const char *notify_name);

    void confd_notification_seterr(
    struct confd_notification_ctx *nctx, const char *fmt);

    void confd_notification_seterr_extended(
    struct confd_notification_ctx *nctx, enum confd_errcode code, uint32_t apptag_ns, 
    uint32_t apptag_tag, const char *fmt);

    int confd_notification_seterr_extended_info(
    struct confd_notification_ctx *nctx, enum confd_errcode code, uint32_t apptag_ns, 
    uint32_t apptag_tag, confd_tag_value_t *error_info, int n, const char *fmt);

    int confd_register_snmp_notification(
    struct confd_daemon_ctx *dx, int fd, const char *notify_name, const char *ctx_name, 
    struct confd_notification_ctx **nctx);

    int confd_notification_send_snmp(
    struct confd_notification_ctx *nctx, const char *notification, struct confd_snmp_varbind *varbinds, 
    int num_vars);

    int confd_register_notification_snmp_inform_cb(
    struct confd_daemon_ctx *dx, const struct confd_notification_snmp_inform_cbs *cb);

    int confd_notification_send_snmp_inform(
    struct confd_notification_ctx *nctx, const char *notification, struct confd_snmp_varbind *varbinds, 
    int num_vars, const char *cb_id, int ref);

    int confd_register_notification_sub_snmp_cb(
    struct confd_daemon_ctx *dx, const struct confd_notification_sub_snmp_cb *cb);

    int confd_notification_flush(
    struct confd_notification_ctx *nctx);

    int confd_register_auth_cb(
    struct confd_daemon_ctx *dx, const struct confd_auth_cb *acb);

    void confd_auth_seterr(
    struct confd_auth_ctx *actx, const char *fmt, ...);

    int confd_register_authorization_cb(
    struct confd_daemon_ctx *dx, const struct confd_authorization_cbs *acb);

    int confd_access_reply_result(
    struct confd_authorization_ctx *actx, int result);

    int confd_authorization_set_timeout(
    struct confd_authorization_ctx *actx, int timeout_secs);

    int confd_register_error_cb(
    struct confd_daemon_ctx *dx, const struct confd_error_cb *ecb);

    void confd_error_seterr(
    struct confd_user_info *uinfo, const char *fmt, ...);

## Library

ConfD Library, (`libconfd`, `-lconfd`)

## Description

The `libconfd` shared library is used to connect to the ConfD Data
Provider API. The purpose of this API is to provide callback hooks so
that user-written data providers can provide data stored externally to
ConfD. ConfD needs this information in order to drive its northbound
agents.

The library is also used to populate items in the data model which are
not data or configuration items, such as statistics items from the
device.

The library consists of a number of API functions whose purpose is to
install different callback functions at different points in the data
model tree which is the representation of the device configuration. Read
more about callpoints in
[tailf_yang_extensions(5)](tailf_yang_extensions.5.md). Read more
about how to use the library in the User Guide chapters on Operational
data and External data.

## Functions

    struct confd_daemon_ctx *confd_init_daemon(
    const char *name);

Initializes a new daemon context or returns NULL on failure. For most of
the library functions described here a daemon_ctx is required, so we
must create a daemon context before we can use them. The daemon context
contains a `d_opaque` pointer which can be used by the application to
pass application specific data into the callback functions.

The `name` parameter is used in various debug printouts and and is also
used to uniquely identify the daemon. The `confd --status` will use this
name when indicating which callpoints are registered.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_PROTOUSAGE

    int confd_set_daemon_flags(
    struct confd_daemon_ctx *dx, int flags);

This function modifies the API behaviour according to the flags ORed
into the `flags` argument. It should be called immediately after
creating the daemon context with `confd_init_daemon()`. The following
flags are available:

`CONFD_DAEMON_FLAG_STRINGSONLY`  
> If this flag is used, the callback functions described below will only
> receive string values for all instances of `confd_value_t` (i.e. the
> type is always `C_BUF`). The callbacks must also give only string
> values in their reply functions. This feature can be useful for
> proxy-type applications that are unaware of the types of all elements,
> i.e. data model agnostic.

`CONFD_DAEMON_FLAG_REG_REPLACE_DISCONNECT`  
> By default, if one daemon replaces a callpoint registration made by
> another daemon, this is only logged, and no action is taken towards
> the daemon that has "lost" its registration. This can be useful in
> some scenarios, e.g. it is possible to have an "initial default"
> daemon providing "null" data for many callpoints, until the actual
> data provider daemons have registered. If a daemon uses the
> `CONFD_DAEMON_FLAG_REG_REPLACE_DISCONNECT` flag, it will instead be
> disconnected from ConfD if any of its registrations are replaced by
> another daemon, and can take action as appropriate.

`CONFD_DAEMON_FLAG_NO_DEFAULTS`  
> This flag tells ConfD that the daemon does not store default values.
> By default, ConfD assumes that the daemon doesn't know about default
> values, and thus whenever default values come into effect, ConfD will
> issue `set_elem()` callbacks to set those values, even if they have
> not actually been set by the northbound agent. Similarly `set_case()`
> will be issued with the default case for choices that have one.
>
> When the `CONFD_DAEMON_FLAG_NO_DEFAULTS` flag is set, ConfD will only
> issue `set_elem()` callbacks when values have been explicitly set, and
> `set_case()` when a case has been selected by explicitly setting an
> element in the case. Specifically:
>
> - When a list entry or presence container is created, there will be no
>   callbacks for descendant leafs with default value, or descendant
>   choices with default case, unless values have been explicitly set.
>
> - When a leaf with a default value is deleted, a `remove()` callback
>   will be issued instead of a `set_elem()` with the default value.
>
> - When the current case in a choice with default case is deleted
>   without another case being selected, the `set_case()` callback will
>   be invoked with the case value given as NULL instead of the default
>   case.
>
> > [!NOTE]
> > A daemon that has the `CONFD_DAEMON_FLAG_NO_DEFAULTS` flag set
> > *must* reply to `get_elem()` and the other callbacks that request
> > leaf values with a value of type C_DEFAULT, rather than the actual
> > default value, when the default value for a leaf is in effect. It
> > *must* also reply to `get_case()` with C_DEFAULT when the default
> > case is in effect.

`CONFD_DAEMON_FLAG_PREFER_BULK_GET`  
> This flag requests that the `get_object()` callback rather than
> `get_elem()` should be used whenever possible, regardless of whether a
> "bulk hint" is given by the northbound agent. If `get_elem()` is not
> registered, the flag is not useful (it has no effect - `get_object()`
> is always used anyway), but in cases where the callpoint also covers
> leafs that cannot be retrieved with `get_object()`, the daemon *must*
> register `get_elem()`.

`CONFD_DAEMON_FLAG_BULK_GET_CONTAINER`  
> This flag tells ConfD that the data provider is prepared to handle a
> `get_object()` callback invocation for the toplevel ancestor container
> when a leaf is requested by a northbound agent, if there exists no
> ancestor list node but there exists such a container. If this flag is
> not set, `get_object()` is only invoked for list entries, and
> `get_elem()` is always used for leafs that do not have an ancestor
> list node. If both `get_object()` and `get_elem()` are registered, the
> choice between them is made as for list entries, i.e. based on a "bulk
> hint" from the northbound agent unless the flag
> `CONFD_DAEMON_FLAG_PREFER_BULK_GET` is also set (see above).

<!-- -->

    void confd_release_daemon(
    struct confd_daemon_ctx *dx);

Returns all memory that has been allocated by `confd_init_daemon()` and
other functions for the daemon context. The control socket as well as
all the worker sockets must be closed by the application (before or
after `confd_release_daemon()` has been called).

    int confd_connect(
    struct confd_daemon_ctx *dx, int sock, enum confd_sock_type type, const struct sockaddr *srv, 
    int addrsz);

Connects to the ConfD daemon. The `dx` parameter is a daemon context
acquired through a call to `confd_init_daemon()`.

There are two different types of connected sockets between an external
daemon and ConfD.

`CONTROL_SOCKET`  
> The first socket that is connected must always be a control socket.
> All requests from ConfD to create new transactions will arrive on the
> control socket, but it is also used for a number of other requests
> that are expected to complete quickly - the general rule is that all
> callbacks that do not have a corresponding `init()` callback are in
> fact control socket requests. There can only be one control socket for
> a given daemon context.

`WORKER_SOCKET`  
> We must always create at least one worker socket. All transaction,
> data, validation, and action callbacks, except the `init()` callbacks,
> use a worker socket. It is possible for a daemon to have multiple
> worker sockets, and the `init()` callback (see e.g.
> `confd_register_trans_cb()`) must indicate which worker socket should
> be used for the subsequent requests. This makes it possible for an
> application to be multi-threaded, where different threads can be used
> for different transactions.

Returns CONFD_OK when successful or CONFD_ERR on connection error.

> **Note**  
>  
> All the callbacks that are invoked via these sockets are subject to
> timeouts configured in `confd.conf`, see
> [confd.conf(5)](ncs.conf.5.md). The callbacks invoked via the
> control socket must generate a reply back to ConfD within the time
> configured for /confdConfig/capi/newSessionTimeout, the callbacks
> invoked via a worker socket within the time configured for
> /confdConfig/capi/queryTimeout. If either timeout is exceeded, the
> daemon will be considered dead, and ConfD will disconnect it by
> closing the control and worker sockets.

> **Note**  
>  
> If this call fails (i.e. does not return CONFD_OK), the socket
> descriptor must be closed and a new socket created before the call is
> re-attempted.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_PROTOUSAGE

    int confd_register_trans_cb(
    struct confd_daemon_ctx *dx, const struct confd_trans_cbs *trans);

This function registers transaction callback functions. A transaction is
a ConfD concept. There may be multiple sources of data for the device
configuration.

In order to orchestrate transactions with multiple sources of data,
ConfD implements a two-phase commit protocol towards all data sources
that participate in a transaction.

Each NETCONF operation will be an individual ConfD transaction. These
transactions are typically very short lived. Transactions originating
from the CLI or the Web UI have longer life. The ConfD transaction can
be viewed as a conceptual state machine where the different phases of
the transaction are different states and the invocations of the callback
functions are state transitions. The following ASCII art depicts the
state machine.

<figure>
<pre><code>               +-------+
               | START |
               +-------+
                   | init()
                   |
                   v
      read()   +------+          finish()
      ------&gt;  | READ | --------------------&gt; START
               +------+
                 ^  |
  trans_unlock() |  | trans_lock()
                 |  v
      read()  +----------+       finish()
      ------&gt; | VALIDATE | -----------------&gt; START
              +----------+
                   | write_start()
                   |
                   v
      write()  +-------+          finish()
      -------&gt; | WRITE | -------------------&gt; START
               +-------+
                   | prepare()
                   |
                   v
              +----------+   commit()   +-----------+
              | PREPARED | -----------&gt; | COMMITTED |
              +----------+              +-----------+
                   | abort()                  |
                   |                          | finish()
                   v                          |
               +---------+                    v
               | ABORTED |                  START
               +---------+
                   | finish()
                   |
                   v
                 START</code></pre>
</figure>

The `struct confd_trans_cbs` is defined as:

<div class="informalexample">

``` c
struct confd_trans_cbs {
    int (*init)(struct confd_trans_ctx *tctx);
    int (*trans_lock)(struct confd_trans_ctx *sctx);
    int (*trans_unlock)(struct confd_trans_ctx *sctx);
    int (*write_start)(struct confd_trans_ctx *sctx);
    int (*prepare)(struct confd_trans_ctx *tctx);
    int (*abort)(struct confd_trans_ctx *tctx);
    int (*commit)(struct confd_trans_ctx *tctx);
    int (*finish)(struct confd_trans_ctx *tctx);
    void (*interrupt)(struct confd_trans_ctx *tctx);
};
```

</div>

Transactions can be performed towards fours different kind of storages.

`CONFD_CANDIDATE`  
> If the system has been configured so that the external database owns
> the candidate data share, we will have to execute candidate
> transactions here. Usually ConfD owns the candidate and in that case
> the external database will never see any CONFD_CANDIDATE transactions.

`CONFD_RUNNING`  
> This is a transaction towards the actual running configuration of the
> device. All write operations in a CONFD_RUNNING transaction must be
> propagated to the individual subsystems that use this configuration
> data.

`CONFD_STARTUP`  
> If the system has ben configured to support the NETCONF startup
> capability, this is a transaction towards the startup database.

`CONFD_OPERATIONAL`  
> This value indicates a transaction towards writable operational data.
> This transaction is used only if there are non-config data marked as
> `tailf:writable true` in the YANG module.
>
> Currently, these transaction are only started by the SNMP agent, and
> only when writable operational data is SET over SNMP.

Which type we have is indicated through the `confd_dbname` field in the
`confd_trans_ctx`.

A transaction, regardless of whether it originates from the NETCONF
agent, the CLI or the Web UI, has several distinct phases:

`init()`  
> This callback must always be implemented. All other callbacks are
> optional. This means that if the callback is set to NULL, ConfD will
> treat it as an implicit CONFD_OK. `libconfd` will allocate a
> transaction context on behalf of the transaction and give this newly
> allocated structure as an argument to the `init()` callback. The
> structure is defined as:
>
> <div class="informalexample">
>
> ``` c
> struct confd_user_info {
>     int af;                        /* AF_INET | AF_INET6 */
>     union {
>         struct in_addr v4;         /* address from where the */
>         struct in6_addr v6;        /* user session originates */
>     } ip;
>     uint16_t port;                 /* source port */
>     char username[MAXUSERNAMELEN]; /* who is the user */
>     int usid;                      /* user session id */
>     char context[MAXCTXLEN];       /* cli | webui | netconf | */
>                                    /* noaaa | any MAAPI string */
>     enum confd_proto proto;        /* which protocol */
>     struct confd_action_ctx actx;  /* used during action call */
>     time_t logintime;
>     enum confd_usess_lock_mode lmode;  /* the lock we have (only from */
>                                        /* maapi_get_user_session())   */
>     char snmp_v3_ctx[255];         /* SNMP context for SNMP sessions */
>                                    /* empty string ("") for non-SNMP sessions */
>     char clearpass[255];           /* if have the pass, it's here */
>                                    /* only if confd internal ssh is used */
>     int flags;                     /* CONFD_USESS_FLAG_... */
>     void *u_opaque;                /* Private User data */
>     /* ConfD internal fields */
>     char *errstr;                  /* for error formatting callback */
>     int refc;
> };
> ```
>
> ``` c
> struct confd_trans_ctx {
>     int fd;                      /* trans (worker) socket */
>     int vfd;                     /* validation worker socket */
>     struct confd_daemon_ctx *dx; /* our daemon ctx */
>     enum confd_trans_mode mode;
>     enum confd_dbname dbname;
>     struct confd_user_info *uinfo;
>     void *t_opaque;              /* Private User data (transaction) */
>     void *v_opaque;              /* Private User data (validation) */
>     struct confd_error error;    /* user settable via */
>                                  /* confd_trans_seterr*() */
>     struct confd_tr_item *accumulated;
>     int thandle;                 /* transaction handle */
>     void *cb_opaque;             /* private user data from */
>                                  /* data callback registration */
>     void *vcb_opaque;            /* private user data from */
>                                  /* validation callback registration */
>     int secondary_index;         /* if != 0: secondary index number */
>                                  /* for list traversal */
>     int validation_info;         /* CONFD_VALIDATION_FLAG_XXX */
>     char *callpoint_opaque;      /* tailf:opaque for callpoint
>                                     in data model */
>     char *validate_opaque;       /* tailf:opaque for validation point
>                                     in data model */
>     union confd_request_data request_data; /* info from northbound agent */
>     int hide_inactive;           /* if != 0: config data with
>                                     CONFD_ATTR_INACTIVE should be hidden */
>     int traversal_id;            /* unique id for the get-next* invocation */
>     int cb_flags;                /* CONFD_TRANS_CB_FLAG_XXX */
>
>     /* ConfD internal fields                            */
>     int index;         /* array pos                       */
>     int lastop;        /* remember what we were doing     */
>     int last_proto_op; /* ditto */
>     int seen_reply;    /* have we seen a reply msg        */
>     int query_ref;     /* last query ref for this trans   */
>     int in_num_instances;
>     uint32_t num_instances;
>     long nextarg;
>     int ntravid;
>     struct confd_data_cbs *next_dcb;
>     confd_hkeypath_t *next_kp;
>     struct confd_tr_item *lastack; /* tail of acklist */
>     int refc;
>     const void *list_filter;
> };
> ```
>
> </div>
>
> This callback is required to prepare for future read/write operations
> towards the data source. It could be that a file handle or socket must
> be established. The place to do that is usually the `init()` callback.
>
> The `init()` callback is conceptually invoked at the start of the
> transaction, but as an optimization, ConfD will as far as possible
> delay the actual invocation for a given daemon until it is required.
> In case of a read-only transaction, or a daemon that is only providing
> operational data, this can have the result that a daemon will not have
> any callbacks at all invoked (if none of the data elements that it
> provides are accessed).
>
> The callback must also indicate to `libconfd` which WORKER_SOCKET
> should be used for future communications in this transaction. This is
> the mechanism which is used by libconfd to distribute work among
> multiple worker threads in the database application. If another thread
> than the thread which owns the CONTROL_SOCKET should be used, it is up
> to the application to somehow notify that thread.
>
> The choice of descriptor is done through the API call
> `confd_trans_set_fd()` which sets the `fd` field in the transaction
> context.
>
> The callback must return CONFD_OK, CONFD_DELAYED_RESPONSE or
> CONFD_ERR.
>
> The transaction then enters READ state, where ConfD will perform a
> series of `read()` operations.

`trans_lock()`  
> This callback is invoked when the validation phase of the transaction
> starts. If the underlying database supports real transactions, it is
> usually appropriate to start such a native transaction here.
>
> The callback must return CONFD_OK, CONFD_DELAYED_RESPONSE, CONFD_ERR,
> or CONFD_ALREADY_LOCKED. The transaction enters VALIDATE state, where
> ConfD will perform a series of `read()` operations.
>
> The trans lock is set until either `trans_unlock()` or `finish()` is
> called. ConfD ensures that a trans_lock is set on a single transaction
> only. In the case of the CONFD_DELAYED_RESPONSE - to later indicate
> that the database is already locked, use the
> `confd_delayed_reply_error()` function with the special error string
> "locked". An alternate way to indicate that the database is already
> locked is to use `confd_trans_seterr_extended()` (see below) with
> CONFD_ERRCODE_IN_USE - this is the only way to give a message in the
> "delayed" case. If this function is used, the callback must return
> CONFD_ERR in the "normal" case, and in the "delayed" case
> `confd_delayed_reply_error()` must be called with a NULL argument
> after `confd_trans_seterr_extended()`.

`trans_unlock()`  
> This callback is called when the validation of the transaction failed,
> or the validation is triggered explicitly (i.e. not part of a 'commit'
> operation). This is common in the CLI and the Web UI where the user
> can enter invalid data. Transactions that originate from NETCONF will
> never trigger this callback. If the underlying database supports real
> transactions and they are used, the transaction should be aborted
> here.
>
> The callback must return CONFD_OK, CONFD_DELAYED_RESPONSE or
> CONFD_ERR. The transaction re-enters READ state.

`write_start()`  
> This callback is invoked when the validation succeeded and the write
> phase of the transaction starts. If the underlying database supports
> real transactions, it is usually appropriate to start such a native
> transaction here.
>
> The transaction enters the WRITE state. No more `read()` operations
> will be performed by ConfD.
>
> The callback must return CONFD_OK, CONFD_DELAYED_RESPONSE, CONFD_ERR,
> or CONFD_IN_USE.
>
> If CONFD_IN_USE is returned, the transaction is restarted, i.e. it
> effectively returns to the READ state. To give this return code after
> CONFD_DELAYED_RESPONSE, use the `confd_delayed_reply_error()` function
> with the special error string "in_use". An alternative for both cases
> is to use `confd_trans_seterr_extended()` (see below) with
> CONFD_ERRCODE_IN_USE - this is the only way to give a message in the
> "delayed" case. If this function is used, the callback must return
> CONFD_ERR in the "normal" case, and in the "delayed" case
> `confd_delayed_reply_error()` must be called with a NULL argument
> after `confd_trans_seterr_extended()`.

`prepare()`  
> If we have multiple sources of data it is highly recommended that the
> callback is implemented. The callback is called at the end of the
> transaction, when all read and write operations for the transaction
> have been performed and the transaction should prepare to commit.
>
> This callback should allocate the resources necessary for the commit,
> if any. The callback must return CONFD_OK, CONFD_DELAYED_RESPONSE,
> CONFD_ERR, or CONFD_IN_USE.
>
> If CONFD_IN_USE is returned, the transaction is restarted, i.e. it
> effectively returns to the READ state. To give this return code after
> CONFD_DELAYED_RESPONSE, use the `confd_delayed_reply_error()` function
> with the special error string "in_use". An alternative for both cases
> is to use `confd_trans_seterr_extended()` (see below) with
> CONFD_ERRCODE_IN_USE - this is the only way to give a message in the
> "delayed" case. If this function is used, the callback must return
> CONFD_ERR in the "normal" case, and in the "delayed" case
> `confd_delayed_reply_error()` must be called with a NULL argument
> after `confd_trans_seterr_extended()`.

`commit()`  
> This callback is optional. This callback is responsible for writing
> the data to persistent storage. Must return CONFD_OK,
> CONFD_DELAYED_RESPONSE or CONFD_ERR.

`abort()`  
> This callback is optional. This callback is responsible for undoing
> whatever was done in the `prepare()` phase. Must return CONFD_OK,
> CONFD_DELAYED_RESPONSE or CONFD_ERR.

`finish()`  
> This callback is optional. This callback is responsible for releasing
> resources allocated in the `init()` phase. In particular, if the
> application choose to use the `t_opaque` field in the
> `confd_trans_ctx` to hold any resources, these resources must be
> released here.

`interrupt()`  
> This callback is optional. Unlike the other transaction callbacks, it
> does not imply a change of the transaction state, it is instead a
> notification that the user running the transaction requested that it
> should be interrupted (e.g. Ctrl-C in the CLI). Also unlike the other
> transaction callbacks, the callback request is sent asynchronously on
> the control socket. Registering this callback may be useful for a
> configuration data provider that has some (transaction or data)
> callbacks which require extensive processing - the callback could then
> determine whether one of these callbacks is being processed, and if
> feasible return an error from that callback instead of completing the
> processing. In that case, `confd_trans_seterr_extended()` with `code`
> `CONFD_ERRCODE_INTERRUPT` should be used.

All the callback functions (except `interrupt()`) must return CONFD_OK,
CONFD_DELAYED_RESPONSE or CONFD_ERR.

It is often useful to associate an error string with a CONFD_ERR return
value. This can be done through a call to `confd_trans_seterr()` or
`confd_trans_seterr_extended()`.

Depending on the situation (original caller) the error string gets
propagated to the CLI, the Web UI or the NETCONF manager.

    int confd_register_db_cb(
    struct confd_daemon_ctx *dx, const struct confd_db_cbs *dbcbs);

We may also optionally have a set of callback functions which span over
several ConfD transactions.

If the system is configured in such a way so that the external database
owns the candidate data store we must implement four callback functions
to do this. If ConfD owns the candidate the candidate callbacks should
be set to NULL.

If ConfD owns the candidate, ConfD has been configured to support
`confirmed-commit` and the *revertByCommit* isn't enabled, then three
checkpointing functions must be implemented; otherwise these should be
set to NULL. When `confirmed-commit` is enabled, the user can commit the
candidate with a timeout. Unless a confirming commit is given by the
user before the timer expires, the system must rollback to the previous
running configuration. This mechanism is controlled by the checkpoint
callbacks. If the revertByCommit feature is enabled the potential
rollback to previous running configuration is done using normal reversed
commits, hence no checkpointing support is required in this case. See
further below.

An external database may also (optionally) support the lock/unlock and
lock_partial/unlock_partial operations. This is only interesting if
there exists additional locking mechanisms towards the database - such
as an external CLI which can lock the database, or if the external
database owns the candidate.

Finally, the external database may optionally validate a candidate
configuration. Configuration validation is preferably done through
ConfD - however if a system already has implemented extensive
configuration validation - the `candidate_validate()` callback can be
used.

The `struct confd_db_cbs` structure looks like:

<div class="informalexample">

``` c
struct confd_db_cbs {
    int (*candidate_commit)(struct confd_db_ctx *dbx, int timeout);
    int (*candidate_confirming_commit)(struct confd_db_ctx *dbx);
    int (*candidate_reset)(struct confd_db_ctx *dbx);
    int (*candidate_chk_not_modified)(struct confd_db_ctx *dbx);
    int (*candidate_rollback_running)(struct confd_db_ctx *dbx);
    int (*candidate_validate)(struct confd_db_ctx *dbx);
    int (*add_checkpoint_running)(struct confd_db_ctx *dbx);
    int (*del_checkpoint_running)(struct confd_db_ctx *dbx);
    int (*activate_checkpoint_running)(struct confd_db_ctx *dbx);
    int (*copy_running_to_startup)(struct confd_db_ctx *dbx);
    int (*running_chk_not_modified)(struct confd_db_ctx *dbx);
    int (*lock)(struct confd_db_ctx *dbx, enum confd_dbname dbname);
    int (*unlock)(struct confd_db_ctx *dbx, enum confd_dbname dbname);
    int (*lock_partial)(struct confd_db_ctx *dbx, enum confd_dbname dbname,
                        int lockid, confd_hkeypath_t paths[], int npaths);
    int (*unlock_partial)(struct confd_db_ctx *dbx, enum confd_dbname dbname,
                          int lockid);
    int (*delete_config)(struct confd_db_ctx *dbx, enum confd_dbname dbname);
};
```

</div>

If we have an externally implemented candidate, that is if confd.conf
item /confdConfig/datastores/candidate/implementation is set to
"external", we must implement the 5 candidate callbacks. Otherwise
(recommended) they must be set to NULL.

If implementation is "external", all databases (if there are more than
one) MUST take care of the candidate for their part of the configuration
data tree. If ConfD is configured to use an external database for parts
of the configuration, and the built-in CDB database is used for some
parts, CDB will handle the candidate for its part. See also
`misc/extern_candidate` in the examples collection.

The callback functions are are the following:

`candidate_commit()`  
> This function should copy the candidate DB into the running DB. If
> `timeout` != 0, we should be prepared to do a rollback or act on a
> `candidate_confirming_commit()`. The `timeout` parameter can not be
> used to set a timer for when to rollback; this timer is handled by the
> ConfD daemon. If we terminate without having acted on the
> `candidate_confirming_commit()`, we MUST restart with a rollback. Thus
> we must remember that we are waiting for a
> `candidate_confirming_commit()` and we must do so on persistent
> storage. Must only be implemented when the external database owns the
> candidate.

`candidate_confirming_commit()`  
> If the `timeout` in the `candidate_commit()` function is != 0, we will
> be either invoked here or in the `candidate_rollback_running()`
> function within `timeout` seconds. `candidate_confirming_commit()`
> should make the commit persistent, whereas a call to
> `candidate_rollback_running()` would copy back the previous running
> configuration to running.

`candidate_rollback_running()`  
> If for some reason, apart from a timeout, something goes wrong, we get
> invoked in the `candidate_rollback_running()` function. The function
> should copy back the previous running configuration to running.

`candidate_reset()`  
> This function is intended to copy the current running configuration
> into the candidate. It is invoked whenever the NETCONF operation
> `<discard-changes>` is executed or when a lock is released without
> committing.

`candidate_chk_not_modified()`  
> This function should check to see if the candidate has been modified
> or not. Returns CONFD_OK if no modifications has been done since the
> last commit or reset, and CONFD_ERR if any uncommitted modifications
> exist.

`candidate_validate()`  
> This callback is optional. If implemented, the task of the callback is
> to validate the candidate configuration. Note that the running
> database can be validated by the database in the `prepare()` callback.
> `candidate_validate()` is only meaningful when an explicit validate
> operation is received, e.g. through NETCONF.

`add_checkpoint_running()`  
> This function should be implemented only when ConfD owns the
> candidate, confirmed-commit is enabled and revertByCommit is disabled.
>
> It is responsible for creating a checkpoint of the current running
> configuration and storing the checkpoint in non-volatile memory. When
> the system restarts this function should check if there is a
> checkpoint available, and use the checkpoint instead of running.

`del_checkpoint_running()`  
> This function should delete a checkpoint created by
> `add_checkpoint_running()`. It is called by ConfD when a confirming
> commit is received unless revertByCommit is enabled.

`activate_checkpoint_running()`  
> This function should rollback running to the checkpoint created by
> `add_checkpoint_running()`. It is called by ConfD when the timer
> expires or if the user session expires unless revertByCommit is
> enabled.

`copy_running_to_startup()`  
> This function should copy running to startup. It only needs to be
> implemented if the startup data store is enabled.

`running_chk_not_modified()`  
> This function should check to see if running has been modified or not.
> It only needs to be implemented if the startup data store is enabled.
> Returns CONFD_OK if no modifications have been done since the last
> copy of running to startup, and CONFD_ERR if any modifications exist.

`lock()`  
> This should only be implemented if our database supports locking from
> other sources than through ConfD. In this case both the lock/unlock
> and lock_partial/unlock_partial callbacks must be implemented. If a
> lock on the whole database is set through e.g. NETCONF, ConfD will
> first make sure that no other ConfD transaction has locked the
> database. Then it will call `lock()` to make sure that the database is
> not locked by some other source (such as a non-ConfD CLI). Returns
> CONFD_OK on success, and CONFD_ERR if the lock was already held by an
> external entity.

`unlock()`  
> Unlocks the database.

`lock_partial()`  
> This should only be implemented if our database supports locking from
> other sources than through ConfD, see `lock()` above. This callback is
> invoked if a northbound agent requests a partial lock. The `paths[]`
> argument is an `npaths` long array of hkeypaths that identify the
> leafs and/or subtrees that are to be locked. The `lockid` is a
> reference that will be used on a subsequent corresponding
> `unlock_partial()` invocation.

`unlock_partial()`  
> Unlocks the partial lock that was requested with `lockid`.

`delete_config()`  
> Will be called for 'startup' or 'candidate' only. The database is
> supposed to be set to erased.

All the above callback functions must return either CONFD_OK or
CONFD_ERR. If the system is configured so that ConfD owns the candidate,
then obviously the candidate related functions need not be implemented.
If the system is configured to not do confirmed commit,
`candidate_confirming_commit()` and `candidate_commit()` need not to be
implemented.

It is often interesting to associate an error string with a CONFD_ERR
return value. In particular the `validate()` callback must typically
indicate which item was invalid and why. This can be done through a call
to `confd_db_seterr()` or `confd_db_seterr_extended()`.

Depending on the situation (original caller) the error string is
propagated to the CLI, the Web UI or the NETCONF manager.

    int confd_register_data_cb(
    struct confd_daemon_ctx *dx, const struct confd_data_cbs *data);

This function registers the data manipulation callbacks. The data model
defines a number of "callpoints". Each callpoint must have an associated
set of data callbacks.

Thus if our database application serves three different callpoints in
the data model we must install three different sets of data manipulation
callbacks - one set at each callpoint.

The data callbacks either return data back to ConfD or they do not. For
example the `create()` callback does not return data whereas the
`get_next()` callback does. All the callbacks that return data do so
through API functions, not by means of return values from the function
itself.

The `struct confd_data_cbs` is defined as:

<div class="informalexample">

``` c
struct confd_data_cbs {
    char callpoint[MAX_CALLPOINT_LEN];
    /* where in the XML tree do we */
    /* want this struct */

    /* Only necessary to have this cb if our data model has */
    /* typeless optional nodes or oper data lists w/o keys */
    int (*exists_optional)(struct confd_trans_ctx *tctx, confd_hkeypath_t *kp);
    int (*get_elem)(struct confd_trans_ctx *tctx, confd_hkeypath_t *kp);
    int (*get_next)(struct confd_trans_ctx *tctx, confd_hkeypath_t *kp,
                    long next);
    int (*set_elem)(struct confd_trans_ctx *tctx, confd_hkeypath_t *kp,
                    confd_value_t *newval);
    int (*create)(struct confd_trans_ctx *tctx, confd_hkeypath_t *kp);
    int (*remove)(struct confd_trans_ctx *tctx, confd_hkeypath_t *kp);
    /* optional (find list entry by key/index values) */
    int (*find_next)(struct confd_trans_ctx *tctx, confd_hkeypath_t *kp,
                     enum confd_find_next_type type, confd_value_t *keys,
                     int nkeys);
    /* optional optimizations */
    int (*num_instances)(struct confd_trans_ctx *tctx, confd_hkeypath_t *kp);
    int (*get_object)(struct confd_trans_ctx *tctx, confd_hkeypath_t *kp);
    int (*get_next_object)(struct confd_trans_ctx *tctx, confd_hkeypath_t *kp,
                           long next);
    int (*find_next_object)(struct confd_trans_ctx *tctx, confd_hkeypath_t *kp,
                            enum confd_find_next_type type, confd_value_t *keys,
                            int nkeys);
    /* next two are only necessary if 'choice' is used */
    int (*get_case)(struct confd_trans_ctx *tctx, confd_hkeypath_t *kp,
                    confd_value_t *choice);
    int (*set_case)(struct confd_trans_ctx *tctx, confd_hkeypath_t *kp,
                    confd_value_t *choice, confd_value_t *caseval);
    /* next two are only necessary for config data providers,
       and only if /confdConfig/enableAttributes is 'true' */
    int (*get_attrs)(struct confd_trans_ctx *tctx, confd_hkeypath_t *kp,
                     uint32_t *attrs, int num_attrs);
    int (*set_attr)(struct confd_trans_ctx *tctx, confd_hkeypath_t *kp,
                    uint32_t attr, confd_value_t *v);
    /* only necessary if "ordered-by user" is used */
    int (*move_after)(struct confd_trans_ctx *tctx, confd_hkeypath_t *kp,
                      confd_value_t *prevkeys);
    /* only for per-transaction-invoked transaction hook */
    int (*write_all)(struct confd_trans_ctx *tctx, confd_hkeypath_t *kp);
    void *cb_opaque; /* private user data    */
    int flags;       /* CONFD_DATA_XXX */
};
```

</div>

One of the parameters to the callback is a `confd_hkeypath_t` (h - as in
hashed keypath). This is fully described in
[confd_types(3)](confd_types.3.md).

The `cb_opaque` element can be used to pass arbitrary data to the
callbacks, e.g. when the same set of callbacks is used for multiple
callpoints. It is made available to the callbacks via an element with
the same name in the transaction context (`tctx` argument), see the
structure definition above.

If the `tailf:opaque` substatement has been used with the
`tailf:callpoint` statement in the data model, the argument string is
made available to the callbacks via the `callpoint_opaque` element in
the transaction context.

The `flags` field in the `struct confd_data_cbs` can have the flag
CONFD_DATA_WANT_FILTER set. See the function `get_next()` for details.

When use of the `CONFD_ATTR_INACTIVE` attribute is enabled in the ConfD
configuration (/confdConfig/enableAttributes and
/confdConfig/enableInactive both set to `true`), read callbacks
(`get_elem()` etc) for configuration data must observe the current value
of the `hide_inactive` element in the transaction context. If it is
non-zero, those callbacks must act as if data with the
`CONFD_ATTR_INACTIVE` attribute set does not exist.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_PROTOUSAGE

`get_elem()`  
> This callback function needs to return the value or the value with
> list of attributes, of a specific leaf. Assuming we have the following
> data model:
>
> <div class="informalexample">
>
>     container servers {
>       tailf:callpoint mycp;
>       list server {
>         key name;
>         max-elements 64;
>         leaf name {
>           type string;
>         }
>         leaf ip {
>           type inet:ip-address;
>         }
>         leaf port {
>           type inet:port-number;
>         }
>       }
>     }
>
> </div>
>
> For example the value of the ip leaf in the server entry whose key is
> "www" can be returned separately. The way to return a single data item
> is through `confd_data_reply_value()`. The value can optionally be
> returned with the attributes of the ip leaf through
> `confd_data_reply_value_attrs()`.
>
> The callback must return CONFD_OK on success, CONFD_ERR on error or
> CONFD_DELAYED_RESPONSE if the reply value is not yet available. In the
> latter case the application must at a later stage call
> `confd_data_reply_value()` or `confd_data_reply_value_attrs()` (or
> `confd_delayed_reply_ok()` for a write operation). If an error is
> discovered at the time of a delayed reply, the error is signaled
> through a call to `confd_delayed_reply_error()`
>
> If the leaf does not exist the callback must call
> `confd_data_reply_not_found()`. If the leaf has a default value
> defined in the data model, and no value has been set, the callback
> should use `confd_data_reply_value()` or
> `confd_data_reply_value_attrs()` with a value of type C_DEFAULT - this
> makes it possible for northbound agents to leave such leafs out of the
> data returned to the user/manager (if requested).
>
> The implementation of `get_elem()` must be prepared to return values
> for all the leafs including the key(s). When ConfD invokes
> `get_elem()` on a key leaf it is an existence test. The application
> should verify whether the object exists or not.

`get_next()`  
> This callback makes it possible for ConfD to traverse a set of list
> entries, or a set of leaf-list elements. The `next` parameter will be
> `-1` on the first invocation. This function should reply by means of
> the function `confd_data_reply_next_key()` or optionally
> `confd_data_reply_next_key_attrs()` that includes the attributes of
> list entry in the reply.
>
> If the list has a `tailf:secondary-index` statement (see
> [tailf_yang_extensions(5)](tailf_yang_extensions.5.md)), and the
> entries are supposed to be retrieved according to one of the secondary
> indexes, the variable `tctx->secondary_index` will be set to a value
> greater than `0`, indicating which secondary-index is used. The first
> secondary-index in the definition is identified with the value `1`,
> the second with `2`, and so on. confdc can be used to generate
> `#define`s for the index names. If no secondary indexes are defined,
> or if the sort order should be according to the key values,
> `tctx->secondary_index` is `0`.
>
> If the flag CONFD_DATA_WANT_FILTER is set in the `flags` fields in
> `struct confd_data_cbs`, ConfD may pass a filter to the data provider
> (e.g., if the list traversal is done due to an XPath evaluation). The
> filter can be seen as a hint to the data provider to optimize the list
> retrieval; the data provider can use the filter to ensure that it
> doesn't return any list entries that don't match the filter. Since it
> is a hint, it is ok if it returns entries that don't match the filter.
> However, if the data provider guarantees that all entries returned
> match the filter, it can set the flag CONFD_TRANS_CB_FLAG_FILTERED in
> `tctx->cb_flags` before calling `confd_data_reply_next_key` or
> `confd_data_reply_next_key_attrs()`. In this case, ConfD will not
> re-evaluate the filters. The CONFD_TRANS_CB_FLAG_FILTERED flag should
> only be set when a list filter is available.
>
> The function `confd_data_get_list_filter()` can be used by the data
> provider to get the filter when the first list entry is requested.
>
> To signal that no more entries exist, we reply with a NULL pointer as
> the key value in the `confd_data_reply_next_key()` or
> `confd_data_reply_next_key_attrs()` functions.
>
> The field `tctx->traversal_id` contains a unique identifier for each
> list traversal. I.e., it is set to a unique value before the first
> element is requested, and then this value is kept as the list is being
> traversed. If a new traversal is started, a new unique value is set.
>
> The callback must return CONFD_OK on success, CONFD_ERR on error or
> CONFD_DELAYED_RESPONSE if the reply value is not yet available. In the
> latter case the application must at a later stage call
> `confd_data_reply_next_key()` or `confd_data_reply_next_key_attrs()`.
>
> > [!NOTE]
> > For a list that does not specify a non-default sort order by means
> > of an `ordered-by user` or `tailf:sort-order` statement, ConfD
> > assumes that list entries are ordered strictly by increasing key (or
> > secondary index) values. I.e., CDB's sort order. Thus, for correct
> > operation, we must observe this order when returning list entries in
> > a sequence of `get_next()` calls.
> >
> > A special case is the `union` type key. Entries are ordered by
> > increasing key for their type while types are sorted in the order of
> > appearance in 'enum confd_vtype', see
> > [confd_types(3)](confd_types.3.md). There are exceptions to this
> > rule, namely these five types, which are always sorted at the end:
> > `C_BUF`, `C_DURATION`, `C_INT32`, `C_UINT8`, and `C_UINT16`. Among
> > these, `C_BUF` always comes first, and after that comes
> > `C_DURATION`. Then follows the three integer types, `C_INT32`,
> > `C_UINT8` and `C_UINT16`, which are sorted together in natural
> > number order regardless of type.
> >
> > If CDB's sort order cannot be provided to ConfD for configuration
> > data, /confdConfig/sortTransactions should be set to 'false'. See
> > [confd.conf(5)](ncs.conf.5.md).

`set_elem()`  
> This callback writes the value of a leaf. Note that an optional leaf
> is created by a call to this function but `empty` leafs are treated
> specially. If `empty` is a member of a `union`, this callback is used.
> However, for backward compatibility, a different callback is used for
> type `empty` leafs outside of a `union`.
>
> The callback must return CONFD_OK on success, CONFD_ERR on error or
> CONFD_DELAYED_RESPONSE.
>
> > [!NOTE]
> > Type `empty` leafs part of a `union` are set using this function.
> > Type `empty` leafs outside of `union` use `create()` and `exists()`.

`create()`  
> This callback creates a new list entry, a `presence` container, a leaf
> of type `empty` (unless in a `union`, see the see the C_EMPTY section
> in [confd_types(3)](confd_types.3.md)), or a leaf-list element. In
> the case of the servers data model above, this function need to create
> a new server entry. Must return CONFD_OK on success, CONFD_ERR on
> error, CONFD_DELAYED_RESPONSE or CONFD_ACCUMULATE.
>
> The data provider is responsible for maintaining the order of list
> entries. If the list is marked as `ordered-by user` in the YANG data
> model, the `create()` callback must add the list entry to the end of
> the list.

`remove()`  
> This callback is used to remove an existing list entry or `presence`
> container and all its sub nodes (if any), an optional leaf, or a
> leaf-list element. When we use the YANG `choice` statement in the data
> model, it may also be used to remove nodes that are not optional as
> such when a different `case` (or none) is selected. I.e. it must
> always be possible to remove cases in a choice.
>
> Must return CONFD_OK on success, CONFD_ERR on error,
> CONFD_DELAYED_RESPONSE or CONFD_ACCUMULATE.

`exists_optional()`  
> If we have `presence` containers or leafs of type `empty` (unless type
> `empty` is in a `union` or list key, see the C_EMPTY section in
> [confd_types(3)](confd_types.3.md)), we cannot use the `get_elem()`
> callback to read the value of such a node, since it does not have a
> type. An example of a data model could be:
>
> <div class="informalexample">
>
>     container bs {
>       presence "";
>       tailf:callpoint bcp;
>       list b {
>         key name;
>         max-elements 64;
>         leaf name {
>           type string;
>         }
>         container opt {
>           presence "";
>           leaf ii {
>             type int32;
>           }
>         }
>         leaf foo {
>           type empty;
>         }
>       }
>     }
>
> </div>
>
> The above YANG fragment has 3 nodes that may or may not exist and that
> do not have a type. If we do not have any such elements, nor any
> operational data lists without keys (see below), we do not need to
> implement the `exists_optional()` callback and can set it to NULL.
>
> If we have the above data model, we must implement the
> `exists_optional()`, and our implementation must be prepared to reply
> on calls of the function for the paths /bs, /bs/b/opt, and /bs/b/foo.
> The leaf /bs/b/opt/ii is not mandatory, but it does have a type namely
> `int32`, and thus the existence of that leaf will be determined
> through a call to the `get_elem()` callback.
>
> The `exists_optional()` callback may also be invoked by ConfD as
> "existence test" for an entry in an operational data list without
> keys, or for a leaf-list entry. Normally this existence test is done
> with a `get_elem()` request for the first key, but since there are no
> keys, this callback is used instead. Thus if we have such lists, or
> leaf-lists, we must also implement this callback, and handle a request
> where the keypath identifies a list entry or a leaf-list element.
>
> The callback must reply to ConfD using either the
> `confd_data_reply_not_found()` or the `confd_data_reply_found()`
> function.
>
> The callback must return CONFD_OK on success, CONFD_ERR on error or
> CONFD_DELAYED_RESPONSE if the reply value is not yet available.

`find_next()`  
> This optional callback can be registered to optimize cases where ConfD
> wants to start a list traversal at some other point than at the first
> entry of the list, or otherwise make a "jump" in a list traversal. If
> the callback is not registered, ConfD will use a sequence of
> `get_next()` calls to find the desired list entry.
>
> Where the `get_next()` callback provides a `next` parameter to
> indicate which keys should be returned, this callback instead provides
> a `type` parameter and a set of values to indicate which keys should
> be returned. Just like for `get_next()`, the callback should reply by
> calling `confd_data_reply_next_key()` or
> `confd_data_reply_next_key_attrs()` with the keys for the requested
> list entry.
>
> The `keys` parameter is a pointer to a `nkeys` elements long array of
> key values, or secondary index-leaf values (see below). The `type` can
> have one of two values:
>
> `CONFD_FIND_NEXT`  
> > The callback should always reply with the key values for the first
> > list entry *after* the one indicated by the `keys` array, and a
> > `next` value appropriate for retrieval of subsequent entries. The
> > `keys` array may not correspond to an actual existing list entry -
> > the callback must return the keys for the first existing entry that
> > is "later" in the list order than the keys provided by the callback.
> > Furthermore the number of values provided in the array (`nkeys`) may
> > be fewer than the number of keys (or number of index-leafs for a
> > secondary-index) in the data model, possibly even zero. This means
> > that only the first `nkeys` values are provided, and the remaining
> > ones should be taken to have a value "earlier" than the value for
> > any existing list entry.
>
> `CONFD_FIND_SAME_OR_NEXT`  
> > If the values in the `keys` array completely identify an actual
> > existing list entry, the callback should reply with the keys for
> > this list entry and a corresponding `next` value. Otherwise the same
> > logic as described for `CONFD_FIND_NEXT` should be used.
>
> The `dp/find_next` example in the bundled examples collection has an
> implementation of the `find_next()` callback for a list with two
> integer keys. It shows how the `type` value and the provided keys need
> to be combined in order to find the requested entry - or find that no
> entry matching the request exists.
>
> If the list has a `tailf:secondary-index` statement (see
> [tailf_yang_extensions(5)](tailf_yang_extensions.5.md)), the
> callback must examine the value of the `tctx->secondary_index`
> variable, as described for the `get_next()` callback. If
> `tctx->secondary_index` has a value greater than `0`, the `keys` and
> `nkeys` parameters do not represent key values, but instead values for
> the index leafs specified by the `tailf:index-leafs` statement for the
> secondary index. The callback should however still reply with the
> actual key values for the list entry in the
> `confd_data_reply_next_key()` or `confd_data_reply_next_key_attrs()`
> call.
>
> Once we have called `confd_data_reply_next_key()` or
> `confd_data_reply_next_key_attrs()`, ConfD will use `get_next()` (or
> `get_next_object()`) for any subsequent entry-by-entry list
> traversal - however we can request that this traversal should be done
> using `find_next()` (or `find_next_object()`) instead, by passing `-1`
> for the `next` parameter to `confd_data_reply_next_key()` or
> `confd_data_reply_next_key_attrs()`. In this case ConfD will always
> invoke `find_next()`/`find_next_object()` with `type`
> `CONFD_FIND_NEXT`, and the (complete) set of keys from the previous
> reply.
>
> > [!NOTE]
> > In the case of list traversal by means of a secondary index, the
> > secondary index values must be unique for entry-by-entry traversal
> > with `find_next()`/`find_next_object()` to be possible. Thus we can
> > not pass `-1` for the `next` parameter to
> > `confd_data_reply_next_key()` or `confd_data_reply_next_key_attrs()`
> > in this case if the secondary index values are not unique.
>
> To signal that no entry matching the request exists, i.e. we have
> reached the end of the list while evaluating the request, we reply
> with a NULL pointer as the key value in the
> `confd_data_reply_next_key()` or `confd_data_reply_next_key_attrs()`
> function.
>
> The field `tctx->traversal_id` contains a unique identifier for each
> list traversal. I.e., it is set to a unique value before the first
> element is requested, and then this value is kept as the list is being
> traversed. If a new traversal is started, a new unique value is set.
>
> > [!NOTE]
> > For a list that does not specify a non-default sort order by means
> > of an `ordered-by user` or `tailf:sort-order` statement, ConfD
> > assumes that list entries are ordered strictly by increasing key (or
> > secondary index) values. I.e., CDB's sort order. Thus, for correct
> > operation, we must observe this order when returning list entries in
> > a sequence of `get_next()` calls.
> >
> > A special case is the union type key. Entries are ordered by
> > increasing key for their type while types are sorted in the order of
> > appearance in 'enum confd_vtype', see
> > [confd_types(3)](confd_types.3.md). There are exceptions to this
> > rule, namely these five types, which are always sorted at the end:
> > `C_BUF`, `C_DURATION`, `C_INT32`, `C_UINT8`, and `C_UINT16`. Among
> > these, `C_BUF` always comes first, and after that comes
> > `C_DURATION`. Then follows the three integer types, `C_INT32`,
> > `C_UINT8` and `C_UINT16`, which are sorted together in natural
> > number order regardless of type.
> >
> > If CDB's sort order cannot be provided to ConfD for configuration
> > data, /confdConfig/sortTransactions should be set to 'false'. See
> > [confd.conf(5)](ncs.conf.5.md).
>
> If we have registered `find_next()` (or `find_next_object()`), it is
> not strictly necessary to also register `get_next()` (or
> `get_next_object()`) - except for the case of traversal by secondary
> index when the secondary index values are not unique, see above. If a
> northbound agent does a get_next request, and neither `get_next()` nor
> `get_next_object()` is registered, ConfD will instead invoke
> `find_next()` (or `find_next_object()`), the same way as if `-1` had
> been passed for the `next` parameter to `confd_data_reply_next_key()`
> or `confd_data_reply_next_key_attrs()` as described above - the actual
> `next` value passed is ignored. The very first get_next request for a
> traversal (i.e. where the `next` parameter would be `-1`) will cause a
> find_next invocation with `type` `CONFD_FIND_NEXT` and `nkeys` == 0,
> i.e. no keys provided.
>
> Similar to the `get_next()` callback, a filter may be used to optimize
> the list retrieval, if the flag CONFD_DATA_WANT_FILTER is set in
> `tctx->flags` field. Otherwise this field should be set to 0.
>
> The callback must return CONFD_OK on success, CONFD_ERR on error or
> CONFD_DELAYED_RESPONSE if the reply value is not yet available. In the
> latter case the application must at a later stage call
> `confd_data_reply_next_key()` or `confd_data_reply_next_key_attrs()`.

`num_instances()`  
> This callback can optionally be implemented. The purpose is to return
> the number of entries in a list, or the number of elements in a
> leaf-list. If the callback is set to NULL, whenever ConfD needs to
> calculate the number of entries in a certain list, ConfD will iterate
> through the entries by means of consecutive calls to the `get_next()`
> callback.
>
> If we have a large number of entries *and* it is computationally cheap
> to calculate the number of entries in a list, it may be worth the
> effort to implement this callback for performance reasons.
>
> The number of entries is returned in an `confd_value_t` value of type
> C_INT32. The value is returned through a call to
> `confd_data_reply_value()`, see code example below:
>
> <div class="informalexample">
>
>         int num_instances;
>         confd_value_t v;
>
>         CONFD_SET_INT32(&v, num_instances);
>         confd_data_reply_value(trans_ctx, &v);
>         return CONFD_OK;
>
> </div>
>
> Must return CONFD_OK on success, CONFD_ERR on error or
> CONFD_DELAYED_RESPONSE.

`get_object()`  
> The implementation of this callback is also optional. The purpose of
> the callback is to return an entire object, i.e. a list entry, in one
> swoop. If the callback is not implemented, ConfD will retrieve the
> whole object through a series of calls to `get_elem()`.
>
> By default, the callback will only be called for list entries - i.e.
> `get_elem()` is still needed for leafs that are not defined in a list,
> but if there are no such leafs in the part of the data model covered
> by a given callpoint, the `get_elem()` callback may be omitted when
> `get_object()` is registered. This has the drawback that ConfD will
> have to invoke get_object() even if only a single leaf in a list entry
> is needed though, e.g. for the existence test mentioned for
> `get_elem()`.
>
> However, if the `CONFD_DAEMON_FLAG_BULK_GET_CONTAINER` flag is set via
> `confd_set_daemon_flags()`, `get_object()` will also be used for the
> toplevel ancestor container (if any) when no ancestor list node
> exists. I.e. in this case, `get_elem()` is only needed for toplevel
> leafs - if there are any such leafs in the part of the data model
> covered by a given callpoint.
>
> When ConfD invokes the `get_elem()` callback, it is the responsibility
> of the application to issue calls to the reply function
> `confd_data_reply_value()`. The `get_object()` callback cannot use
> this function since it needs to return a sequence of values. The
> `get_object()` callback must use one of the three functions
> `confd_data_reply_value_array()`, `confd_data_reply_tag_value_array()`
> or `confd_data_reply_tag_value_attrs_array()`. See the description of
> these functions below for the details of the arguments passed. If the
> entry requested does not exist, the callback must call
> `confd_data_reply_not_found()`.
>
> Remember, the callback `exists_optional()` must always be implemented
> when we have `presence` containers or leafs of type `empty` (unless in
> a `union`, see the C_EMPTY section in
> [confd_types(3)](confd_types.3.md)). If we also choose to implement
> the `get_object()` callback, ConfD can derive the existence of such a
> node through a previous call to `get_object()`. This is however not
> always the case, thus even if we implement `get_object()`, we must
> also implement `exists_optional()`if we have such nodes.
>
> If we pass an array of values which does not comply with the rules for
> the above functions, ConfD will notice and an error is reported to the
> agent which issued the request. A message is also logged to ConfD's
> developerLog.
>
> The callback must return CONFD_OK on success, CONFD_ERR on error or
> CONFD_DELAYED_RESPONSE if the reply value is not yet available.

`get_next_object()`  
> The implementation of this callback is also optional. Similar to the
> `get_object()` callback the purpose of this callback is to return an
> entire object, or even multiple objects, in one swoop. It combines the
> functionality of `get_next()` and `get_object()` into a single
> callback, and adds the possibility to return multiple objects. Thus we
> need only implement this callback if it very important to be able to
> traverse a list very fast. If the callback is not implemented, ConfD
> will retrieve the whole object through a series of calls to
> `get_next()` and consecutive calls to either `get_elem()` or
> `get_object()`.
>
> When we have registered `get_next_object()`, it is not strictly
> necessary to also register `get_next()`, but omitting `get_next()` may
> have a serious performance impact, since there are cases (e.g. CLI tab
> completion) when ConfD only wants to retrieve the keys for a list. In
> such a case, if we have only registered `get_next_object()`, all the
> data for the list will be retrieved, but everything except the keys
> will be discarded. Also note that even if we have registered
> `get_next_object()`, at least one of the `get_elem()` and
> `get_object()` callbacks must be registered.
>
> Similar to the `get_next()` callback, if the `next` parameter is `-1`
> ConfD wants to retrieve the first entry in the list.
>
> Similar to the `get_next()` callback, if the `tctx->secondary_index`
> parameter is greater than `0` ConfD wants to retrieve the entries in
> the order defined by the secondary index.
>
> Similar to the `get_next()` callback, a filter may be used to optimize
> the list retrieval, if the flag CONFD_DATA_WANT_FILTER is set in
> `tctx->flags` field. Otherwise this field should be set to 0.
>
> Similar to the `get_object()` callback, `get_next_object()` needs to
> reply with an entire object expressed as either an array of
> `confd_value_t` values or an array of `confd_tag_value_t` values. It
> must also indicate which is the *next* entry in the list similar to
> the `get_next()` callback. The three functions
> `confd_data_reply_next_object_array()`,
> `confd_data_reply_next_object_tag_value_array()` and
> `confd_data_reply_next_object_tag_value_attrs_array()` are use to
> convey the return values for one object from the `get_next_object()`
> callback.
>
> If we want to reply with multiple objects, we must instead use one of
> the functions `confd_data_reply_next_object_arrays()`,
> `confd_data_reply_next_object_tag_value_arrays()` and
> `confd_data_reply_next_object_tag_value_attrs_arrays()`. These
> functions take an "array of object arrays", where each element in the
> array corresponds to the reply for a single object with
> `confd_data_reply_next_object_array()`,
> `confd_data_reply_next_object_tag_value_array()` and
> `confd_data_reply_next_object_tag_value_attrs_array()` respectively.
>
> If we pass an array of values which does not comply with the rules for
> the above functions, ConfD will notice and an error is reported to the
> agent which issued the request. A message is also logged to ConfD's
> developerLog.
>
> The callback must return CONFD_OK on success, CONFD_ERR on error or
> CONFD_DELAYED_RESPONSE if the reply value is not yet available.

`find_next_object()`  
> The implementation of this callback is also optional. It relates to
> `get_next_object()` in exactly the same way as `find_next()` relates
> to `get_next()`. I.e. instead of a parameter `next`, we get a `type`
> parameter and a set of key values, or secondary index-leaf values, to
> indicate which object or objects to return to ConfD via one of the
> reply functions.
>
> Similar to the `get_next_object()` callback, if the
> `tctx->secondary_index` parameter is greater than `0` ConfD wants to
> retrieve the entries in the order defined by the secondary index. And
> as described for the `find_next()` callback, in this case the `keys`
> and `nkeys` parameters represent values for the index leafs specified
> by the `tailf:index-leafs` statement for the secondary index.
>
> Similar to the `get_next_object()` callback, the callback can use any
> of the functions `confd_data_reply_next_object_array()`,
> `confd_data_reply_next_object_tag_value_array()`,
> `confd_data_reply_next_object_tag_value_attrs_array()`,
> `confd_data_reply_next_object_arrays()`,
> `confd_data_reply_next_object_tag_value_arrays()` and
> `confd_data_reply_next_object_tag_value_attrs_arrays()` to return one
> or more objects to ConfD.
>
> If we pass an array of values which does not comply with the rules for
> the above functions, ConfD will notice and an error is reported to the
> agent which issued the request. A message is also logged to ConfD's
> developerLog.
>
> Similar to the `get_next()` callback, a filter may be used to optimize
> the list retrieval, if the flag CONFD_DATA_WANT_FILTER is set in
> `tctx->flags` field.
>
> The callback must return CONFD_OK on success, CONFD_ERR on error or
> CONFD_DELAYED_RESPONSE if the reply value is not yet available.

`get_case()`  
> This callback only needs to be implemented if we use the YANG `choice`
> statement in the part of the data model that our data provider is
> responsible for, but when we use choice, the callback is required. It
> should return the currently selected `case` for the choice given by
> the `choice` argument - `kp` is the path to the container or list
> entry where the choice is defined.
>
> In the general case, where there may be multiple levels of `choice`
> statements without intervening `container` or `list` statements in the
> data model, the choice is represented as an array of `confd_value_t`
> elements with the type C_XMLTAG, terminated by an element with the
> type C_NOEXISTS. This array gives a reversed path with alternating
> choice and case names, from the data node given by `kp` to the
> specific choice that the callback request pertains to - similar to how
> a `confd_hkeypath_t` gives a path through the data tree.
>
> If we don't have such "nested" choices in the data model, we can
> ignore this array aspect, and just treat the `choice` argument as a
> single `confd_value_t` value. The case is always represented as a
> `confd_value_t` with the type C_XMLTAG. I.e. we can use
> CONFD_GET_XMLTAG() to get the choice tag from `choice` and
> CONFD_SET_XMLTAG() to set the case tag for the reply value. The
> callback should use `confd_data_reply_value()` to return the case
> value to ConfD, or `confd_data_reply_not_found()` for an optional
> choice without default case if no case is currently selected. If an
> optional choice with default case does not have a selected case, the
> callback should use `confd_data_reply_value()` with a value of type
> C_DEFAULT.
>
> Must return CONFD_OK on success, CONFD_ERR on error, or
> CONFD_DELAYED_RESPONSE.

`set_case()`  
> This callback is completely optional, and will only be invoked (if
> registered) if we use the YANG `choice` statement and provide
> configuration data. The callback sets the currently selected `case`
> for the choice given by the `kp` and `choice` arguments, and is mainly
> intended to make it easier to support the `get_case()` callback. ConfD
> will additionally invoke the `remove()` callback for all nodes in the
> previously selected case, i.e. if we register `set_case()`, we do not
> need to analyze `set_elem()` callbacks to determine the currently
> selected case, or figure out which nodes that should be deleted.
>
> For a choice without a `mandatory true` statement, it is possible to
> have no case at all selected. To indicate that the previously selected
> case should be deleted without selecting another case, the callback
> will be invoked with NULL for the `caseval` argument.
>
> The callback must return CONFD_OK on success, CONFD_ERR on error,
> CONFD_DELAYED_RESPONSE or CONFD_ACCUMULATE.

`get_attrs()`  
> This callback only needs to be implemented for callpoints specified
> for configuration data, and only if attributes are enabled in the
> ConfD configuration (/confdConfig/enableAttributes set to `true`).
> These are the currently supported attributes:
>
> <div class="informalexample">
>
>     /* CONFD_ATTR_TAGS: value is C_LIST of C_BUF/C_STR */
>     #define CONFD_ATTR_TAGS       0x80000000
>     /* CONFD_ATTR_ANNOTATION: value is C_BUF/C_STR */
>     #define CONFD_ATTR_ANNOTATION 0x80000001
>     /* CONFD_ATTR_INACTIVE: value is C_BOOL 1 (i.e. "true") */
>     #define CONFD_ATTR_INACTIVE   0x00000000
>     /* CONFD_ATTR_BACKPOINTER: value is C_LIST of C_BUF/C_STR */
>     #define CONFD_ATTR_BACKPOINTER 0x80000003
>     /* CONFD_ATTR_OUT_OF_BAND: value is C_LIST of C_BUF/C_STR */
>     #define CONFD_ATTR_OUT_OF_BAND 0x80000010
>     /* CONFD_ATTR_ORIGIN: value is C_IDENTITYREF */
>     #define CONFD_ATTR_ORIGIN 0x80000007
>     /* CONFD_ATTR_ORIGINAL_VALUE: value is C_BUF/C_STR */
>     #define CONFD_ATTR_ORIGINAL_VALUE 0x80000005
>     /* CONFD_ATTR_WHEN: value is C_BUF/C_STR */
>     #define CONFD_ATTR_WHEN 0x80000004
>     /* CONFD_ATTR_REFCOUNT: value is C_UINT32 */
>     #define CONFD_ATTR_REFCOUNT 0x80000002
>
>               
>
> </div>
>
> The `attrs` parameter is an array of attributes of length `num_attrs`,
> giving the requested attributes - if `num_attrs` is 0, all attributes
> are requested. If the node given by `kp` does not exist, the callback
> should reply by calling `confd_data_reply_not_found()`, otherwise it
> should call `confd_data_reply_attrs()`, even if no attributes are set.
>
> > [!NOTE]
> > It is very important to observe this distinction, i.e. to use
> > `confd_data_reply_not_found()` when the node doesn't exist, since
> > ConfD may use `get_attrs()` as an existence check when attributes
> > are enabled. (This avoids doing one callback request for existence
> > check and another to collect the attributes.)
>
> Must return CONFD_OK on success, CONFD_ERR on error, or
> CONFD_DELAYED_RESPONSE.

`set_attr()`  
> This callback also only needs to be implemented for callpoints
> specified for configuration data, and only if attributes are enabled
> in the ConfD configuration (/confdConfig/enableAttributes set to
> `true`). See `get_attrs()` above for the supported attributes.
>
> The callback should set the attribute `attr` for the node given by
> `kp` to the value `v`. If the callback is invoked with NULL for the
> value argument, it means that the attribute should be deleted.
>
> The callback must return CONFD_OK on success, CONFD_ERR on error,
> CONFD_DELAYED_RESPONSE or CONFD_ACCUMULATE.

`move_after()`  
> This callback only needs to be implemented if we provide configuration
> data that has YANG lists or leaf-lists with a `ordered-by user`
> statement. The callback moves the list entry or leaf-list element
> given by `kp`. If `prevkeys` is NULL, the entry/element is moved first
> in the list/leaf-list, otherwise it is moved after the entry/element
> given by `prevkeys`. In this case, for a list, `prevkeys` is a pointer
> to an array of key values identifying an entry in the list. The array
> is terminated with an element that has type C_NOEXISTS. For a
> leaf-list, `prevkeys` is a pointer to an array with the leaf-list
> element followed by an element that has type C_NOEXISTS.
>
> The callback must return CONFD_OK on success, CONFD_ERR on error,
> CONFD_DELAYED_RESPONSE or CONFD_ACCUMULATE.

`write_all()`  
> This callback will only be invoked for a transaction hook specified
> with `tailf:invocation-mode per-transaction;`. It is also the only
> callback that is invoked for such a hook. The callback is expected to
> make all the modifications to the current transaction that hook
> functionality requires. The `kp` parameter is currently always NULL,
> since the callback does not pertain to any particular data node.
>
> The callback must return CONFD_OK on success, CONFD_ERR on error, or
> CONFD_DELAYED_RESPONSE.

The six write callbacks (excluding `write_all()`), namely `set_elem()`,
`create()`, `remove()`, `set_case()`, `set_attr()`, and `move_after()`
may return the value CONFD_ACCUMULATE. If CONFD_ACCUMULATE is returned
the library will accumulate the written values as a linked list of
operations. This list can later be traversed in either of the
transaction callbacks `prepare()` or `commit()`.

This provides trivial transaction support for applications that want to
implement the ConfD two-phase commit protocol but lacks an underlying
database with proper transaction support. The write operations are
available as a linked list of confd_tr_item structs:

<div class="informalexample">

``` c
struct confd_tr_item {
    char *callpoint;
    enum confd_tr_op op;
    confd_hkeypath_t *hkp;
    confd_value_t *val;
    confd_value_t *choice; /* only for set_case */
    uint32_t attr;         /* only for set_attr */
    struct confd_tr_item *next;
};
```

</div>

The list is available in the transaction context in the field
`accumulated`. The entire list and its content will be automatically
freed by the library once the transaction finishes.

    int  confd_register_range_data_cb(
    struct confd_daemon_ctx *dx, const struct confd_data_cbs *data, const confd_value_t *lower, 
    const confd_value_t *upper, int numkeys, const char *fmt, ...);

This is a variant of `confd_register_data_cb()` which registers a set of
callbacks for a range of list entries. There can thus be multiple sets
of C functions registered on the same callpoint, even by different
daemons. The `lower` and `upper` parameters are two `numkeys` long
arrays of key values, which define the endpoints of the list range. It
is also possible to do a "default" registration, by giving `lower` and
`upper` as NULL (`numkeys` is ignored). The callbacks for the default
registration will be invoked when the keys are not in any of the
explicitly registered ranges.

The `fmt` and remaining parameters specify a string path for the list
that the keys apply to, in the same form as for the
[confd_lib_maapi(3)](confd_lib_maapi.3.md) and
[confd_lib_cdb(3)](confd_lib_cdb.3.md) functions. However if the list
is a sublist to another list, the key element for the parent list(s) may
be completely omitted, to indicate that the registration applies to all
entries for the parent list(s) (similar to CDB subscription paths).

An example that registers one set of callbacks for the range
/servers/server{aaa} - /servers/server{mzz} and another set for
/servers/server{naa} - /servers/server{zzz}:

<div class="informalexample">

    confd_value_t lower, upper;

    CONFD_SET_STR(&lower, "aaa");
    CONFD_SET_STR(&upper, "mzz");
    if (confd_register_range_data_cb(dctx, &data_cb1, &lower, &upper, 1,
                                     "/servers/server") == CONFD_ERR)
        confd_fatal("Failed to register data cb\n");

    CONFD_SET_STR(&lower, "naa");
    CONFD_SET_STR(&upper, "zzz");
    if (confd_register_range_data_cb(dctx, &data_cb2, &lower, &upper, 1,
                                     "/servers/server") == CONFD_ERR)
        confd_fatal("Failed to register data cb\n");

</div>

In this example, as in most cases where this function is used, the data
model defines a list with a single key, and `numkeys` is thus always
`1`. However it can also be used for lists that have multiple keys, in
which case the `upper` and `lower` arrays may be populated with multiple
keys, upto however many keys the data model specifies for the list, and
`numkeys` gives the number of keys in the arrays. If fewer keys than
specified in the data model are given, the registration covers all
possible values for the remaining keys, i.e. they are effectively
wildcarded.

While traversal of a list with range registrations will always invoke
e.g. `get_next()` only for actually registered ranges, it is also
possible that a request from a northbound interface is made for data in
a specific list entry. If the registrations do not cover all possible
key values, such a request could be for a list entry that does not fall
in any of the registered ranges, which will result in a "no
registration" error. To avoid the error, we can either restrict the type
of the keys such that only values that fall in the registered ranges are
valid, or, for operational data, use a "default" registration as
described above. In this case the daemon with the "default" registration
would just reply with `confd_data_reply_not_found()` for all requests
for specific data, and `confd_data_reply_next_key()` with NULL for the
key values for all `get_next()` etc requests.

> **Note**  
>  
> For a given callpoint name, there can only be either one non-range
> registration or a number of range registrations that all pertain to
> the same list. If a range registration is done after a non-range
> registration or vice versa, or if a range registration is done with a
> different list path than earlier range registrations, the latest
> registration completely replaces the earlier one(s). If we want to
> register for the same ranges in different lists, we must thus have a
> unique callpoint for each list.

> **Note**  
>  
> Range registrations can not be used for lists that have the
> `tailf:secondary-index` extension, since there is no way for ConfD to
> traverse the registrations in secondary-index order.

    int confd_register_usess_cb(
    struct confd_daemon_ctx *dx, const struct confd_usess_cbs *ucb);

This function can be used to register information callbacks that are
invoked for user session start and stop. The `struct confd_usess_cbs` is
defined as:

<div class="informalexample">

``` c
struct confd_usess_cbs {
    void (*start)(struct confd_daemon_ctx *dx, struct confd_user_info *uinfo);
    void (*stop)(struct confd_daemon_ctx *dx, struct confd_user_info *uinfo);
};
```

</div>

Both callbacks are optional. They can be used e.g. for a multi-threaded
daemon to manage a pool of worker threads, by allocating worker threads
to user sessions. In this case we would ideally allocate a worker thread
the first time an `init()` callback for a given user session requires a
worker socket to be assigned, and use only the `stop()` usess callback
to release the worker thread - using the `start()` callback to allocate
a worker thread would often mean that we allocated a thread that was
never used. The `u_opaque` element in the `struct confd_user_info` can
be used to manage such allocations.

> **Note**  
>  
> These callbacks will only be invoked if the daemon has also registered
> other callbacks. Furthermore, as an optimization, ConfD will delay the
> invocation of the `start()` callback until some other callback is
> invoked. This means that if no other callbacks for the daemon are
> invoked for the duration of a user session, neither `start()` nor
> `stop()` will be invoked for that user session. If we want timely
> notification of start and stop for all user sessions, we can subscribe
> to `CONFD_NOTIF_AUDIT` events, see
> [confd_lib_events(3)](confd_lib_events.3.md).

> **Note**  
>  
> When we call `confd_register_done()` (see below), the `start()`
> callback (if registered) will be invoked for each user session that
> already exists.

    int confd_register_done(
    struct confd_daemon_ctx *dx);

When we have registered all the callbacks for a daemon (including the
other types described below if we have them), we must call this function
to synchronize with ConfD. No callbacks will be invoked until it has
been called, and after the call, no further registrations are allowed.

    int confd_fd_ready(
    struct confd_daemon_ctx *dx, int fd);

The database application owns all data provider sockets to ConfD and is
responsible for the polling of these sockets. When one of the ConfD
sockets has I/O ready to read, the application must invoke
`confd_fd_ready()` on the socket. This function will:

- Read data from ConfD

- Unmarshal this data

- Invoke the right callback with the right arguments

When this function reads the request from from ConfD it will block on
`read()`, thus if it is important for the application to have
nonblocking I/O, the application must dispatch I/O from ConfD in a
separate thread.

The function returns the return value from the callback function,
normally CONFD_OK (0), or CONFD_ERR (-1) on error and CONFD_EOF (-2)
when the socket to ConfD has been closed. Thus CONFD_ERR can mean either
that the callback function that was invoked returned CONFD_ERR, or that
some error condition occurred within the `confd_fd_ready()` function.
These cases can be distinguished via `confd_errno`, which will be set to
CONFD_ERR_EXTERNAL if CONFD_ERR comes from the callback function. Thus a
correct call to `confd_fd_ready()` looks like:

<div class="informalexample">

    struct pollfd set[n];
    /* ...... */

    if (set[0].revents & POLLIN) {
        if ((ret = confd_fd_ready(dctx, mysock)) == CONFD_EOF) {
            confd_fatal("ConfD socket closed\n");
        } else if (ret == CONFD_ERR &&
                   confd_errno != CONFD_ERR_EXTERNAL) {
            confd_fatal("Error on ConfD socket request: %s (%d): %s\n",
                        confd_strerror(confd_errno), confd_errno,
                        confd_lasterr());
        }
    }

</div>

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_PROTOUSAGE,
CONFD_ERR_EXTERNAL

    void confd_trans_set_fd(
    struct confd_trans_ctx *tctx, int sock);

Associate a worker socket with the transaction, or validation phase.
This function must be called in the transaction and validation `init()`
callbacks - a minimal implementation of a transaction `init()` callback
looks like:

<div class="informalexample">

    static int init(struct confd_trans_ctx *tctx)
    {
        confd_trans_set_fd(tctx, workersock);
        return CONFD_OK;
    }

</div>

    int confd_data_get_list_filter(
    struct confd_trans_ctx *tctx, struct confd_list_filter **filter);

This function is used from `get_next()`, `get_next_object()`,
`find_next()`, or `find_next_object()` to get the filter associated with
the list traversal. The filter is available if the flag
CONFD_DATA_WANT_FILTER is set in the `flags` fields in
`struct confd_data_cbs` when the callback functions are registered.

The filter is only available when the first list entry is requested,
either when the `next` parameter is -1 in `get_next()` or
`get_next_object()`, or in `find_next()` or `find_next_object()`.

This function allocates the filter in `*filter`, and it must be freed by
the data provider with `confd_free_list_filter()` when it is no longer
used.

The filter is of type `struct confd_list_filter`:

If no filter is associated with the request, `*filter` will be set to
NULL.

<div class="informalexample">

``` c
enum confd_list_filter_type {
  CONFD_LF_OR     = 0,
  CONFD_LF_AND    = 1,
  CONFD_LF_NOT    = 2,
  CONFD_LF_CMP    = 3,
  CONFD_LF_EXISTS = 4,
  CONFD_LF_EXEC   = 5,
  CONFD_LF_ORIGIN = 6,
  CONFD_LF_CMP_LL = 7
};
```

``` c
enum confd_expr_op {
  CONFD_CMP_NOP                  = 0,
  CONFD_CMP_EQ                   = 1,
  CONFD_CMP_NEQ                  = 2,
  CONFD_CMP_GT                   = 3,
  CONFD_CMP_GTE                  = 4,
  CONFD_CMP_LT                   = 5,
  CONFD_CMP_LTE                  = 6,
  /* functions below */
  CONFD_EXEC_STARTS_WITH          = 7,
  CONFD_EXEC_RE_MATCH             = 8,
  CONFD_EXEC_DERIVED_FROM         = 9,
  CONFD_EXEC_DERIVED_FROM_OR_SELF = 10,
  CONFD_EXEC_CONTAINS             = 11,
  CONFD_EXEC_STRING_COMPARE       = 12,
  CONFD_EXEC_COMPARE              = 13
};
```

``` c
struct confd_list_filter {
  enum confd_list_filter_type type;

  struct confd_list_filter *expr1; /* OR, AND, NOT */
  struct confd_list_filter *expr2; /* OR, AND */

  enum confd_expr_op op;           /* CMP, EXEC */
  struct xml_tag *node;            /* CMP, EXEC, EXISTS */
  int nodelen;                     /* CMP, EXEC, EXISTS */
  confd_value_t *val;              /* CMP, EXEC, ORIGIN (-> values[0]) */
  int num_values;
  confd_value_t **values;          /* CMP, EXEC, ORIGIN*/
};
```

</div>

The `confd_value_t val` parameter is always a C_BUF, i.e., a string
value, except when the function is `derived-from`,
`derived-from-or-self` or the expression is `origin`. In this case the
value is of type C_IDENTITYREF.

The `node` array never goes into a nested list. In an `exists`
expression, the `node` can refer to a leaf, leaf-list, container or list
node. If it refers to a list node, the test is supposed to be true if
the list is non-empty. In all other expressions, the `node` is
guaranteed to refer to a leaf or leaf-list, possibly in a hierarchy of
containers.

The `struct confd_list_filter` has a `values` array field and
`num_values` to indicate how many values are present. For backward
compatibility, the `val` pointer is maintained and points to the same
value as `values[0]`. In a `string-compare` or `compare` expression the
filter uses two values: `values[0]` contains the value to compare
against and `values[1]` contains the comparison operator of type
`enum confd_expr_op`, e.g. `CONFD_CMP_LT` for less than.

Note that the `string compare` and `compare` functions will not send a
list-filter to the data provider if both expressions evaluate to
node-sets.

*Errors*: CONFD_ERR_MALLOC

    void confd_free_list_filter(
    struct confd_list_filter *filter);

Frees the `filter` which has been allocated by
`confd_data_get_list_filter()`.

    int confd_data_reply_value(
    struct confd_trans_ctx *tctx, const confd_value_t *v);

This function is used to return a single data item to ConfD.

*Errors*: CONFD_ERR_PROTOUSAGE, CONFD_ERR_MALLOC, CONFD_ERR_OS,
CONFD_ERR_BADTYPE

    int confd_data_reply_value_attrs(
    struct confd_trans_ctx *tctx, const confd_value_t *v, const confd_attr_value_t *attrs, 
    int num_attrs);

This function is used to return a single data item with its attributes
to ConfD. It combines the functions of `confd_data_reply_value` and
`confd_data_reply_attrs`.

    int confd_data_reply_value_array(
    struct confd_trans_ctx *tctx, const confd_value_t *vs, int n);

This function is used to return an array of values, corresponding to a
complete list entry, to ConfD. It can be used by the optional
`get_object()` callback. The `vs` array is populated with `n` values
according to the specification of the Value Array format in the [XML
STRUCTURES](confd_types.xml_structures.3.md) section of the
[confd_types(3)](confd_types.3.md) manual page.

Values for leaf-lists may be passed as a single array element with type
C_LIST (as described in the specification). A daemon that is *not* using
this flag can alternatively treat the leaf-list as a list, and pass an
element with type C_NOEXISTS in the array, in which case ConfD will
issue separate callback invocations to retrieve the data for the
leaf-list. In case the leaf-list does not exist, these extra invocations
can be avoided by passing a C_LIST with size 0 in the array.

In the easiest case, similar to the "servers" example above, we can
construct a reply array as follows:

<div class="informalexample">

    struct in_addr ip4 = my_get_ip(.....);
    confd_value_t ret[3];

    CONFD_SET_STR(&ret[0], "www");
    CONFD_SET_IPV4(&ret[1], ip4);
    CONFD_SET_UINT16(&ret[2], 80);
    confd_data_reply_value_array(tctx, ret, 3);

</div>

Any containers inside the object must also be passed in the array. For
example an entry in the b list used in the explanation for
`exists_optional()` would have to be passed as:

<div class="informalexample">

    confd_value_t ret[4];

    CONFD_SET_STR(&ret[0], "b_name");
    CONFD_SET_XMLTAG(&ret[1], myprefix_opt, myprefix__ns);
    CONFD_SET_INT32(&ret[2], 77);
    CONFD_SET_NOEXISTS(&ret[3]);

    confd_data_reply_value_array(tctx, ret, 4);

</div>

Thus, a container or a leaf of type `empty` (unless in a `union`, see
the C_EMPTY section of [confd_types(3)](confd_types.3.md)) must be
passed as its equivalent XML tag if it exists. But if the type `empty`
leaf is inside a `union` then the `CONFD_SET_EMPTY` macro should be
used. If a `presence` container or leaf of type `empty` does not exist,
it must be passed as a value of C_NOEXISTS. In the example above, the
leaf foo does not exist, thus the contents of position `3` in the array.

If a `presence` container does not exist, its non existing values must
not be passed - it suffices to say that the container itself does not
exist. In the example above, the opt container did exist and thus we
also had to pass the contained value(s), the ii leaf.

Hence, the above example represents:

<div class="informalexample">

    <b>
       <name>b_name</name>
       <opt>
          <ii>77</ii>
       </opt>
    </b>

</div>

    int confd_data_reply_tag_value_array(
    struct confd_trans_ctx *tctx, const confd_tag_value_t *tvs, int n);

This function is used to return an array of values, corresponding to a
complete list entry, to ConfD. It can be used by the optional
`get_object()` callback. The `tvs` array is populated with `n` values
according to the specification of the Tagged Value Array format in the
[XML STRUCTURES](confd_types.xml_structures.3.md) section of the
[confd_types(3)](confd_types.3.md) manual page.

I.e. the difference from `confd_data_reply_value_array()` is that the
values are tagged with the node names from the data model - this means
that non-existing values can simply be omitted from the array, per the
specification above. Additionally the key leafs can be omitted, since
they are already known by ConfD - if the key leafs are included, they
will be ignored. Finally, in e.g. the case of a container with both
config and non-config data, where the config data is in CDB and only the
non-config data provided by the callback, the config elements can be
omitted (for `confd_data_reply_value_array()` they must be included as
C_NOEXISTS elements).

However, although the tagged value array format can represent nested
lists, these must not be passed via this function, since the
`get_object()` callback only pertains to a single entry of one list.
Nodes representing sub-lists must thus be omitted from the array, and
ConfD will issue separate `get_object()` invocations to retrieve the
data for those.

Values for leaf-lists may be passed as a single array element with type
C_LIST (as described in the specification). A daemon that is *not* using
this flag can alternatively treat the leaf-list as a list, and omit it
from the array, in which case ConfD will issue separate callback
invocations to retrieve the data for the leaf-list. In case the
leaf-list does not exist, these extra invocations can be avoided by
passing a C_LIST with size 0 in the array.

Using the same examples as above, in the "servers" case, we can
construct a reply array as follows:

<div class="informalexample">

    struct in_addr ip4 = my_get_ip(.....);
    confd_tag_value_t ret[2];
    int n = 0;

    CONFD_SET_TAG_IPV4(&ret[n], myprefix_ip, ip4); n++;
    CONFD_SET_TAG_UINT16(&ret[n], myprefix_port, 80); n++;
    confd_data_reply_tag_value_array(tctx, ret, n);

</div>

An entry in the b list used in the explanation for `exists_optional()`
would be passed as:

<div class="informalexample">

    confd_tag_value_t ret[3];
    int n = 0;

    CONFD_SET_TAG_XMLBEGIN(&ret[n], myprefix_opt, myprefix__ns); n++;
    CONFD_SET_TAG_INT32(&ret[n], myprefix_ii, 77); n++;
    CONFD_SET_TAG_XMLEND(&ret[n], myprefix_opt, myprefix__ns); n++;
    confd_data_reply_tag_value_array(tctx, ret, n);

</div>

The C_XMLEND element is not strictly necessary in this case, since there
are no subsequent elements in the array. However it would have been
required if the optional foo leaf had existed, thus it is good practice
to always include both the C_XMLBEGIN and C_XMLEND elements for nested
containers (if they exist, that is - otherwise neither must be
included).

    int confd_data_reply_tag_value_attrs_array(
    struct confd_trans_ctx *tctx, const confd_tag_value_attr_t *tvas, int n);

This function is used to return an array of values and attributes,
corresponding to a complete list entry, to ConfD. It can be used by the
optional `get_object()` callback. The `tvas` array is populated with `n`
values and attribute lists according to the specification of the Tagged
Value Attribute Array format in the [XML
STRUCTURES](confd_types.xml_structures.3.md) section of the
[confd_types(3)](confd_types.3.md) manual page.

I.e. the difference from `confd_data_reply_tag_value_array()` is that
not only the values are tagged with the node names from the data model
but also attributes for each node - this means that non-existing
value-attribute pairs can simply be omitted from the array, per the
specification above.

    int confd_data_reply_next_key(
    struct confd_trans_ctx *tctx, const confd_value_t *v, int num_vals_in_key, 
    long next);

This function is used by the `get_next()` and `find_next()` callbacks to
return the next key, or the next leaf-list element in case `get_next()`
is invoked for a leaf-list. A list may have multiple key leafs specified
in the data model. The parameter `num_vals_in_key` indicates the number
of key values, i.e. the length of the `v` array. In the typical case
with a list having just a single key leaf specified, `num_vals_in_key`
is always 1. For a leaf-list, `num_vals_in_key` is always 1.

The `long next` will be passed into the next invocation of the
`get_next()` callback if it has a value other than `-1`. Thus this value
provides a means for the application to traverse the data. Since this is
`long` it is possible to pass a `void*` pointing to the next list entry
in the application - effectively passing a pointer to confd and getting
it back in the next invocation of `get_next()`.

To indicate that no more entries exist, we reply with a NULL pointer for
the `v` array. The values of the `num_vals_in_key` and `next` parameters
are ignored in this case.

Passing the value `-1` for `next` has a special meaning. It tells ConfD
that we want the next request for this list traversal to use the
`find_next()` (or `find_next_object()`) callback instead of `get_next()`
(or `get_next_object()`).

> **Note**  
>  
> In the case of list traversal by means of a secondary index, the
> secondary index values must be unique for entry-by-entry traversal
> with `find_next()`/`find_next_object()` to be possible. Thus we can
> not pass `-1` for the `next` parameter in this case if the secondary
> index values are not unique.

*Errors*: CONFD_ERR_PROTOUSAGE, CONFD_ERR_MALLOC, CONFD_ERR_OS,
CONFD_ERR_BADTYPE

    int confd_data_reply_next_key_attrs(
    struct confd_trans_ctx *tctx, const confd_value_t *v, int num_vals_in_key, 
    long next, const confd_attr_value_t *attrs, int num_attrs);

This function is used by the `get_next()` and `find_next()` callbacks to
return the next key and the list entry's attributes, or the next
leaf-list element and its attributes in case `get_next()` is invoked for
a leaf-list. It combines the functions of `confd_data_reply_next_key()`
and `confd_data_reply_attrs`.

I.e. the difference from `confd_data_reply_next_key()` is that the next
key is returned with the attributes of the list entry or the next
leaf-list element is returned with its attributes in case `get_next()`
is invoked for a leaf-list.

    int confd_data_reply_not_found(
    struct confd_trans_ctx *tctx);

This function is used by the `get_elem()` and `exists_optional()`
callbacks to indicate to ConfD that a list entry or node does not exist.

*Errors*: CONFD_ERR_PROTOUSAGE, CONFD_ERR_MALLOC, CONFD_ERR_OS

    int confd_data_reply_found(
    struct confd_trans_ctx *tctx);

This function is used by the `exists_optional()` callback to indicate to
ConfD that a node does exist.

*Errors*: CONFD_ERR_PROTOUSAGE, CONFD_ERR_MALLOC, CONFD_ERR_OS

    int confd_data_reply_next_object_array(
    struct confd_trans_ctx *tctx, const confd_value_t *v, int n, long next);

This function is used by the optional `get_next_object()` and
`find_next_object()` callbacks to return an entire object including its
keys, as well as the `next` parameter that has the same function as for
`confd_data_reply_next_key()`. It combines the functions of
`confd_data_reply_next_key()` and `confd_data_reply_value_array()`.

The array of `confd_value_t` elements must be populated in exactly the
same manner as for `confd_data_reply_value_array()` and the `long next`
is used in the same manner as the equivalent `next` parameter in
`confd_data_reply_next_key()`. To indicate the end of the list we -
similar to `confd_data_reply_next_key()` - pass a NULL pointer for the
value array.

If we are replying to a `get_next_object()` or `find_next_object()`
request for an operational data list without keys, we must include the
"pseudo" key in the array, as the first element (i.e. preceding the
actual leafs from the data model).

If we are replying to a `get_next_object()` request for a leaf-list, we
must pass the value of the leaf-list element as the only element in the
array.

*Errors*: CONFD_ERR_PROTOUSAGE, CONFD_ERR_MALLOC, CONFD_ERR_OS,
CONFD_ERR_BADTYPE

    int confd_data_reply_next_object_tag_value_array(
    struct confd_trans_ctx *tctx, const confd_tag_value_t *tv, int n, long next);

This function is used by the optional `get_next_object()` and
`find_next_object()` callbacks to return an entire object including its
keys, as well as the `next` parameter that has the same function as for
`confd_data_reply_next_key()`. It combines the functions of
`confd_data_reply_next_key()` and `confd_data_reply_tag_value_array()`.

Similar to how the `confd_data_reply_value_array()` has its companion
function `confd_data_reply_tag_value_array()` if we want to return an
object as an array of `confd_tag_value_t` values instead of an array of
`confd_value_t` values, we can use this function instead of
`confd_data_reply_next_object_array()` when we wish to return values
from the `get_next_object()` callback.

The array of `confd_tag_value_t` elements must be populated in exactly
the same manner as for `confd_data_reply_tag_value_array()` (except that
the key values must be included), and the `long next` is used in the
same manner as the equivalent `next` parameter in
`confd_data_reply_next_key()`. The key leafs must always be given as the
first elements of the array, and in the order specified in the data
model. To indicate the end of the list we - similar to
`confd_data_reply_next_key()` - pass a NULL pointer for the value array.

If we are replying to a `get_next_object()` or `find_next_object()`
request for an operational data list without keys, the "pseudo" key must
be included, as the first element in the array, with a tag value of 0 -
i.e. it can be set with code like this:

<div class="informalexample">

    confd_tag_value_t tv[7];

    CONFD_SET_TAG_INT64(&tv[0], 0, 42);

</div>

Similarly, if we are replying to a `get_next_object()` request for a
leaf-list, we must pass the value of the leaf-list element as the only
element in the array, with a tag value of 0.

*Errors*: CONFD_ERR_PROTOUSAGE, CONFD_ERR_MALLOC, CONFD_ERR_OS,
CONFD_ERR_BADTYPE

    int confd_data_reply_next_object_tag_value_attrs_array(
    struct confd_trans_ctx *tctx, const confd_tag_value_attr_t *tva, int n, 
    long next);

This function is used by the optional `get_next_object()` and
`find_next_object()` callbacks. It combines the functions of
`confd_data_reply_next_key_attrs()` and
`confd_data_reply_tag_value_attrs_array()`.

Similar to how the `confd_data_reply_tag_value_array()` has its
companion function `confd_data_reply_tag_value_attrs_array()` if we want
to return an object as an array of `confd_tag_value_attr_t` values with
lists of attributes instead of an array of `confd_tag_value_t` values,
we can use this function instead of
`confd_data_reply_next_object_tag_value_array()` when we wish to return
values and attributes from the `get_next_object()` callback.

I.e. the difference from
`confd_data_reply_next_object_tag_value_array()` is that the array of
`confd_tag_value_attr_t` elements is used instead of `confd_tag_value_t`
in exactly the same manner as for
`confd_data_reply_tag_value_attrs_array()`

    int confd_data_reply_next_object_arrays(
    struct confd_trans_ctx *tctx, const struct confd_next_object *obj, int nobj, 
    int timeout_millisecs);

This function is used by the optional `get_next_object()` and
`find_next_object()` callbacks to return multiple objects including
their keys, in `confd_value_t` form. The `struct confd_next_object` is
defined as:

<div class="informalexample">

``` c
struct confd_next_object {
    confd_value_t *v;
    int n;
    long next;
};
```

</div>

I.e. it corresponds exactly to the data provided for a call of
`confd_data_reply_next_object_array()`. The parameter `obj` is a pointer
to an `nobj` elements long array of such structs. We can also pass a
timeout value for ConfD's caching of the returned data via
`timeout_millisecs`. If we pass 0 for this parameter, the value
configured via /confdConfig/capi/objectCacheTimeout in `confd.conf` (see
[confd.conf(5)](ncs.conf.5.md)) will be used.

The cache in ConfD may become invalid (e.g. due to timeout) before all
the returned list entries have been used, and ConfD may then need to
issue a new callback request based on an "intermediate" `next` value.
This is done exactly as for the single-entry case, i.e. if `next` is
`-1`, `find_next_object()` (or `find_next()`) will be used, with the
keys from the "previous" entry, otherwise `get_next_object()` (or
`get_next()`) will be used, with the given `next` value.

Thus a data provider can choose to give `next` values that uniquely
identify list entries if that is convenient, or otherwise use `-1` for
all `next` elements - or a combination, e.g. `-1` for all but the last
entry. If any `next` value is given as `-1`, at least one of the
`find_next()` and `find_next_object()` callbacks must be registered.

To indicate the end of the list we can either pass a NULL pointer for
the `obj` array, or pass an array where the last
`struct confd_next_object` element has the `v` element set to NULL. The
latter is preferable, since we can then combine the final list entries
with the end-of-list indication in the reply to a single callback
invocation.

> **Note**  
>  
> When `next` values other than `-1` are used, these must remain valid
> even after the end of the list has been reached, since ConfD may still
> need to issue a new callback request based on an "intermediate" `next`
> value as described above. They can be discarded (e.g. allocated memory
> released) when a new `get_next_object()` or `find_next_object()`
> callback request for the same list in the same transaction has been
> received, or at the end of the transaction.

> **Note**  
>  
> In the case of list traversal by means of a secondary index, the
> secondary index values must be unique for entry-by-entry traversal
> with `find_next_object()`/`find_next()` to be possible. Thus we can
> not use `-1` for the `next` element in this case if the secondary
> index values are not unique.

*Errors*: CONFD_ERR_PROTOUSAGE, CONFD_ERR_MALLOC, CONFD_ERR_OS,
CONFD_ERR_BADTYPE

    int confd_data_reply_next_object_tag_value_arrays(
    struct confd_trans_ctx *tctx, const struct confd_tag_next_object *tobj, 
    int nobj, int timeout_millisecs);

This function is used by the optional `get_next_object()` and
`find_next_object()` callbacks to return multiple objects including
their keys, in `confd_tag_value_t` form. The
`struct confd_tag_next_object` is defined as:

<div class="informalexample">

``` c
struct confd_tag_next_object {
    confd_tag_value_t *tv;
    int n;
    long next;
};
```

</div>

I.e. it corresponds exactly to the data provided for a call of
`confd_data_reply_next_object_tag_value_array()`. The parameter `tobj`
is a pointer to an `nobj` elements long array of such structs. We can
also pass a timeout value for ConfD's caching of the returned data via
`timeout_millisecs`. If we pass 0 for this parameter, the value
configured via /confdConfig/capi/objectCacheTimeout in `confd.conf` (see
[confd.conf(5)](ncs.conf.5.md)) will be used.

The cache in ConfD may become invalid (e.g. due to timeout) before all
the returned list entries have been used, and ConfD may then need to
issue a new callback request based on an "intermediate" `next` value.
This is done exactly as for the single-entry case, i.e. if `next` is
`-1`, `find_next_object()` (or `find_next()`) will be used, with the
keys from the "previous" entry, otherwise `get_next_object()` (or
`get_next()`) will be used, with the given `next` value.

Thus a data provider can choose to give `next` values that uniquely
identify list entries if that is convenient, or otherwise use `-1` for
all `next` elements - or a combination, e.g. `-1` for all but the last
entry. If any `next` value is given as `-1`, at least one of the
`find_next()` and `find_next_object()` callbacks must be registered.

To indicate the end of the list we can either pass a NULL pointer for
the `tobj` array, or pass an array where the last
`struct confd_tag_next_object` element has the `tv` element set to NULL.
The latter is preferable, since we can then combine the final list
entries with the end-of-list indication in the reply to a single
callback invocation.

> **Note**  
>  
> When `next` values other than `-1` are used, these must remain valid
> even after the end of the list has been reached, since ConfD may still
> need to issue a new callback request based on an "intermediate" `next`
> value as described above. They can be discarded (e.g. allocated memory
> released) when a new `get_next_object()` or `find_next_object()`
> callback request for the same list in the same transaction has been
> received, or at the end of the transaction.

> **Note**  
>  
> In the case of list traversal by means of a secondary index, the
> secondary index values must be unique for entry-by-entry traversal
> with `find_next_object()`/`find_next()` to be possible. Thus we can
> not use `-1` for the `next` element in this case if the secondary
> index values are not unique.

*Errors*: CONFD_ERR_PROTOUSAGE, CONFD_ERR_MALLOC, CONFD_ERR_OS,
CONFD_ERR_BADTYPE

    int confd_data_reply_next_object_tag_value_attrs_arrays(
    struct confd_trans_ctx *tctx, const struct confd_tag_next_object_attrs *toa, 
    int nobj, int timeout_millisecs);

This function is used by the optional `get_next_object()` and
`find_next_object()` callbacks to return multiple objects including
their keys, in `confd_tag_value_attr_t` form. The
`struct confd_tag_next_object_attrs` is defined as:

<div class="informalexample">

``` c
struct confd_tag_next_object_attrs {
    confd_tag_value_attr_t *tva;
    int n;
    long next;
};
```

</div>

I.e. it corresponds exactly to the data provided for a call of
`confd_data_reply_next_object_tag_value_attrs_array()`. The parameter
`toa` is a pointer to an `nobj` elements long array of such structs.

I.e. the difference from
`confd_data_reply_next_object_tag_value_arrays()` is that the
`struct confd_tag_next_object_attrs` that has array of `tva` elements is
used instead of `struct confd_tag_next_object` which has array of `tv`.

    int confd_data_reply_attrs(
    struct confd_trans_ctx *tctx, const confd_attr_value_t *attrs, int num_attrs);

This function is used by the `get_attrs()` callback to return the
requested attribute values. The `attrs` array should be populated with
`num_attrs` elements of type `confd_attr_value_t`, which is defined as:

<div class="informalexample">

``` c
typedef struct confd_attr_value {
    uint32_t attr;
    confd_value_t v;
} confd_attr_value_t;
```

</div>

If multiple attributes were requested in the callback invocation, they
should be given in the same order in the reply as in the request.
Requested attributes that are not set should be omitted from the array.
If none of the requested attributes are set, or no attributes at all are
set when all attributes are requested, `num_attrs` should be given as 0,
and the value of `attrs` is ignored.

*Errors*: CONFD_ERR_PROTOUSAGE, CONFD_ERR_MALLOC, CONFD_ERR_OS,
CONFD_ERR_BADTYPE

    int confd_delayed_reply_ok(
    struct confd_trans_ctx *tctx);

This function must be used to return the equivalent of CONFD_OK when the
actual callback returned CONFD_DELAYED_RESPONSE. I.e. it is appropriate
for a transaction callback, a data callback for a write operation, or a
validation callback, when the result is successful.

*Errors*: CONFD_ERR_PROTOUSAGE, CONFD_ERR_MALLOC, CONFD_ERR_OS

    int confd_delayed_reply_error(
    struct confd_trans_ctx *tctx, const char *errstr);

This function must be used to return an error when the actual callback
returned CONFD_DELAYED_RESPONSE. There are two cases where the value of
`errstr` has a special significance:

"locked" after invocation of `trans_lock()`  
> This is equivalent to returning CONFD_ALREADY_LOCKED from the
> callback.

"in_use" after invocation of `write_start()` or `prepare()`  
> This is equivalent to returning CONFD_IN_USE from the callback.

In all other cases, calling `confd_delayed_reply_error()` is equivalent
to calling `confd_trans_seterr()` with the `errstr` value and returning
CONFD_ERR from the callback. It is also possible to first call
`confd_trans_seterr()` (for the varargs format) or
`confd_trans_seterr_extended()` etc (for [EXTENDED ERROR
REPORTING](confd_lib_lib.extended_error_reporting.3.md) as described
in [confd_lib_lib(3)](confd_lib_lib.3.md)), and then call
`confd_delayed_reply_error()` with NULL for `errstr`.

*Errors*: CONFD_ERR_PROTOUSAGE, CONFD_ERR_MALLOC, CONFD_ERR_OS

    int confd_data_set_timeout(
    struct confd_trans_ctx *tctx, int timeout_secs);

A data callback should normally complete "quickly", since e.g. the
execution of a 'show' command in the CLI may require many data callback
invocations. Thus it should be possible to set the
/confdConfig/capi/queryTimeout in `confd.conf` (see above) such that it
covers the longest possible execution time for any data callback. In
some rare cases it may still be necessary for a data callback to have a
longer execution time, and then this function can be used to extend (or
shorten) the timeout for the current callback invocation. The timeout is
given in seconds from the point in time when the function is called.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS

    void confd_trans_seterr(
    struct confd_trans_ctx *tctx, const char *fmt);

This function is used by the application to set an error string. The
next transaction or data callback which returns CONFD_ERR will have this
error description attached to it. This error may propagate to the CLI,
the NETCONF manager, the Web UI or the log files depending on the
situation. We also use this function to propagate warning messages from
the `validate()` callback if we are doing semantic validation in C. The
`fmt` argument is a printf style format string.

    void confd_trans_seterr_extended(
    struct confd_trans_ctx *tctx, enum confd_errcode code, uint32_t apptag_ns, 
    uint32_t apptag_tag, const char *fmt);

This function can be used to provide more structured error information
from a transaction or data callback, see the section [EXTENDED ERROR
REPORTING](confd_lib_lib.extended_error_reporting.3.md) in
[confd_lib_lib(3)](confd_lib_lib.3.md).

    int confd_trans_seterr_extended_info(
    struct confd_trans_ctx *tctx, enum confd_errcode code, uint32_t apptag_ns, 
    uint32_t apptag_tag, confd_tag_value_t *error_info, int n, const char *fmt);

This function can be used to provide structured error information in the
same way as `confd_trans_seterr_extended()`, and additionally provide
contents for the NETCONF \<error-info\> element. See the section
[EXTENDED ERROR
REPORTING](confd_lib_lib.extended_error_reporting.3.md) in
[confd_lib_lib(3)](confd_lib_lib.3.md).

    void confd_db_seterr(
    struct confd_db_ctx *dbx, const char *fmt);

This function is used by the application to set an error string. The
next db callback function which returns CONFD_ERR will have this error
description attached to it. This error may propagate to the CLI, the
NETCONF manager, the Web UI or the log files depending on the situation.
The `fmt` argument is a printf style format string.

    void confd_db_seterr_extended(
    struct confd_db_ctx *dbx, enum confd_errcode code, uint32_t apptag_ns, 
    uint32_t apptag_tag, const char *fmt);

This function can be used to provide more structured error information
from a db callback, see the section [EXTENDED ERROR
REPORTING](confd_lib_lib.extended_error_reporting.3.md) in
[confd_lib_lib(3)](confd_lib_lib.3.md).

    int confd_db_seterr_extended_info(
    struct confd_db_ctx *dbx, enum confd_errcode code, uint32_t apptag_ns, 
    uint32_t apptag_tag, confd_tag_value_t *error_info, int n, const char *fmt);

This function can be used to provide structured error information in the
same way as `confd_db_seterr_extended()`, and additionally provide
contents for the NETCONF \<error-info\> element. See the section
[EXTENDED ERROR
REPORTING](confd_lib_lib.extended_error_reporting.3.md) in
[confd_lib_lib(3)](confd_lib_lib.3.md).

    int confd_db_set_timeout(
    struct confd_db_ctx *dbx, int timeout_secs);

Some of the DB callbacks registered via `confd_register_db_cb()`, e.g.
`copy_running_to_startup()`, may require a longer execution time than
others, and in these cases the timeout specified for
/confdConfig/capi/newSessionTimeout may be insufficient. This function
can then be used to extend the timeout for the current callback
invocation. The timeout is given in seconds from the point in time when
the function is called.

    int confd_aaa_reload(
    const struct confd_trans_ctx *tctx);

When the ConfD AAA tree is populated by an external data provider (see
the AAA chapter in the Admin Guide), this function can be used by the
data provider to notify ConfD when there is a change to the AAA data.
I.e. it is an alternative to executing the command
`confd --clear-aaa-cache`. See also `maapi_aaa_reload()` in
[confd_lib_maapi(3)](confd_lib_maapi.3.md).

    int confd_install_crypto_keys(
    struct confd_daemon_ctx* dtx);

It is possible to define AES keys inside confd.conf. These keys are used
by ConfD to encrypt data which is entered into the system. The supported
types are `tailf:aes-cfb-128-encrypted-string` and
`tailf:aes-256-cfb-128-encrypted-string`. See
[confd_types(3)](confd_types.3.md).

This function will copy those keys from ConfD (which reads confd.conf)
into memory in the library. The parameter `dtx` is a daemon context
which is connected through a call to `confd_connect()`.

> **Note**  
>  
> The function must be called before `confd_register_done()` is called.
> If this is impractical, or if the application doesn't otherwise use a
> daemon context, the equivalent function `maapi_install_crypto_keys()`
> may be more convenient to use, see
> [confd_lib_maapi(3)](confd_lib_maapi.3.md).

## Ncs Service Callbacks

NCS service callbacks are invoked in a manner similar to the data
callbacks described above, but require a registration for a service
point, specified as `ncs:servicepoint` in the data model. The `init()`
transaction callback must also be registered, and must use the
`confd_trans_set_fd()` function to assign a worker socket for the
transaction.

    int ncs_register_service_cb(
    struct confd_daemon_ctx *dx, const struct ncs_service_cbs *scb);

This function registers the service callbacks. The
`struct ncs_service_cbs` is defined as:

<div class="informalexample">

``` c
struct ncs_name_value {
    char *name;
    char *value;
};
```

``` c
enum ncs_service_operation {
    NCS_SERVICE_CREATE = 0,
    NCS_SERVICE_UPDATE = 1,
    NCS_SERVICE_DELETE = 2
};
```

``` c
struct ncs_service_cbs {
    char servicepoint[MAX_CALLPOINT_LEN];

    int (*pre_modification)(struct confd_trans_ctx *tctx,
                            enum ncs_service_operation op, confd_hkeypath_t *kp,
                            struct ncs_name_value *proplist, int num_props);
    int (*create)(struct confd_trans_ctx *tctx, confd_hkeypath_t *kp,
                  struct ncs_name_value *proplist, int num_props,
                  int fastmap_thandle);
    int (*post_modification)(struct confd_trans_ctx *tctx,
                             enum ncs_service_operation op,
                             confd_hkeypath_t *kp,
                             struct ncs_name_value *proplist, int num_props);
    void *cb_opaque; /* private user data    */
};
```

</div>

The `create()` callback is invoked inside NCS FASTMAP when creation or
update of a service instance is committed. It should attach to the
FASTMAP transaction by means of `maapi_attach2()` (see
[confd_lib_maapi(3)](confd_lib_maapi.3.md)), passing the
`fastmap_thandle` transaction handle as the `thandle` parameter to
`maapi_attach2()`. The `usid` parameter for `maapi_attach2()` should be
given as 0. To modify data in the FASTMAP transaction, the NCS-specific
`maapi_shared_xxx()` functions must be used, see the section [NCS
SPECIFIC FUNCTIONS](confd_lib_maapi.ncs_functions.3.md) in the
[confd_lib_maapi(3)](confd_lib_maapi.3.md) manual page.

The `pre_modification()` and `post_modification()` callbacks are
optional, and are invoked outside FASTMAP. `pre_modification()` is
invoked before create, update, or delete of the service, as indicated by
the `enum ncs_service_operation op` parameter. Conversely
`post_modification()` is invoked after create, update, or delete of the
service. These functions can be useful e.g. for allocations that should
be stored and existing also when the service instance is removed.

All the callbacks receive a property list via the `proplist` and
`num_props` parameters. This list is initially empty (`proplist` == NULL
and `num_props` == 0), but it can be used to store and later modify
persistent data outside the service model that might be needed.

> **Note**  
>  
> We must call the `confd_register_done()` function when we are done
> with all registrations for a daemon, see above.

    int ncs_service_reply_proplist(
    struct confd_trans_ctx *tctx, const struct ncs_name_value *proplist, int num_props);

This function must be called with the new property list, immediately
prior to returning from the callback, if the stored property list should
be updated. If a callback returns without calling
`ncs_service_reply_proplist()`, the previous property list is retained.
To completely delete the property list, call this function with the
`num_props` parameter given as 0.

## Validation Callbacks

This library also supports the registration of callback functions on
validation points in the data model. A validation point is a point in
the data model where ConfD will invoke an external function to validate
the associated data. The validation occurs before a transaction is
committed. Similar to the state machine described for "external data
bases" above where we install callback functions in the
`struct confd_trans_cbs`, we have to install callback functions for each
validation point. It does not matter if the database is CDB or an
external database, the validation callbacks described here work equally
well for both cases.

    void confd_register_trans_validate_cb(
    struct confd_daemon_ctx *dx, const struct confd_trans_validate_cbs *vcbs);

This function installs two callback functions for the
`struct confd_daemon_ctx`. One function that gets called when the
validation phase starts in a transaction and one when the validation
phase stops in a transaction. In the `init()` callback we can use the
MAAPI api to attach to the running transaction, this way we can later
on, freely traverse the configuration and read data. The data we will be
reading through MAAPI (see [confd_lib_maapi(3)](confd_lib_maapi.3.md))
will be read from the shadow storage containing the *not-yet-committed*
data.

The `struct confd_trans_validate_cbs` is defined as:

<div class="informalexample">

``` c
struct confd_trans_validate_cbs {
    int (*init)(struct confd_trans_ctx *tctx);
    int (*stop)(struct confd_trans_ctx *tctx);
};
```

</div>

It must thus be populated with two function pointers when we call this
function.

The `init()` callback is conceptually invoked at the start of the
validation phase, but just as for transaction callbacks, ConfD will as
far as possible delay the actual invocation of the validation `init()`
callback for a given daemon until it is required. This means that if
none of the daemon's `validate()` callbacks need to be invoked (see
below), `init()` and `stop()` will not be invoked either.

If we need to allocate memory or other resources for the validation this
can also be done in the `init()` callback, with the resources being
freed in the `stop()` callback. We can use the `t_opaque` element in the
`struct confd_trans_ctx` to manage this, but in a daemon that implements
both data and validation callbacks it is better to use the `v_opaque`
element for validation, to be able to manage the allocations
independently.

Similar to the `init()` callback for external data bases, we must in the
`init()` callback associate a file descriptor with the transaction. This
file descriptor will be used for the actual validation. Thus in a multi
threaded application, we can have one thread performing validation for a
transaction in parallel with other threads executing e.g. data
callbacks. Thus a typical implementation of an `init()` callback for
validation looks as:

<div class="informalexample">

    static int init_validation(struct confd_trans_ctx *tctx)
    {
        maapi_attach(maapi_socket, mtest__ns, tctx);
        confd_trans_set_fd(tctx, workersock);
        return CONFD_OK;
    }

</div>

    int confd_register_valpoint_cb(
    struct confd_daemon_ctx *dx, const struct confd_valpoint_cb *vcb);

We must also install an actual validation function for each validation
point, i.e. for each `tailf:validate` statement in the YANG data model.

A validation point has a name and an associated function pointer. The
struct which must be populated for each validation point looks like:

<div class="informalexample">

``` c
struct confd_valpoint_cb {
    char valpoint[MAX_CALLPOINT_LEN];
    int (*validate)(struct confd_trans_ctx *tctx, confd_hkeypath_t *kp,
                    confd_value_t *newval);
    void *cb_opaque; /* private user data */
};
```

</div>

> **Note**  
>  
> We must call the `confd_register_done()` function when we are done
> with all registrations for a daemon, see above.

See the user guide chapter "Semantic validation" for code examples. The
`validate()` callback can return CONFD_OK if all is well, or CONFD_ERROR
if the validation fails. If we wish a message to accompany the error we
must prior to returning from the callback, call `confd_trans_seterr()`
or `confd_trans_seterr_extended()`.

The `cb_opaque` element can be used to pass arbitrary data to the
callback, e.g. when the same callback is used for multiple validation
points. It is made available to the callback via the element
`vcb_opaque` in the transaction context (`tctx` argument), see the
structure definition above.

If the `tailf:opaque` substatement has been used with the
`tailf:validate` statement in the data model, the argument string is
made available to the callback via the `validate_opaque` element in the
transaction context.

We also have yet another special return value which can be used (only)
from the `validate()` callback which is CONFD_VALIDATION_WARN. Prior to
return of this value we must call `confd_trans_seterr()` which provides
a string describing the warning. The warnings will get propagated to the
transaction engine, and depending on where the transaction originates,
ConfD may or may not act on the warnings. If the transaction originates
from the CLI or the Web UI, ConfD will interactively present the user
with a choice - whereby the transaction can be aborted.

If the transaction originates from NETCONF - which does not have any
interactive capabilities - the warnings are ignored. The warnings are
primarily intended to alert inexperienced users that attempt to make -
dangerous - configuration changes. There can be multiple warnings from
multiple validation points in the same transaction.

It is also possible to let the `validate()` callback return
CONFD_DELAYED_RESPONSE in which case the application at a later stage
must invoke either `confd_delayed_reply_ok()`,
`confd_delayed_reply_error()` or
`confd_delayed_reply_validation_warn()`.

In some cases it may be necessary for the validation callbacks to verify
the availability of resources that will be needed if the new
configuration is committed. To support this kind of verification, the
`validation_info` element in the `struct confd_trans_ctx` can carry one
of these flags:

CONFD_VALIDATION_FLAG_TEST  
> When this flag is set, the current validation phase is a "test"
> validation, as in e.g. the CLI 'validate' command, and the transaction
> will return to the READ state regardless of the validation result.
> This flag is available in all of the `init()`, `validate()`, and
> `stop()` callbacks.

CONFD_VALIDATION_FLAG_COMMIT  
> When this flag is set, all requirements for a commit have been met,
> i.e. all validation as well as the write_start and prepare transitions
> have been successful, and the actual commit will follow. This flag is
> only available in the `stop()` callback.

<!-- -->

    int confd_register_range_valpoint_cb(
    struct confd_daemon_ctx *dx, struct confd_valpoint_cb *vcb, const confd_value_t *lower, 
    const confd_value_t *upper, int numkeys, const char *fmt, ...);

A variant of `confd_register_valpoint_cb()` which registers a validation
function for a range of key values. The `lower`, `upper`, `numkeys`,
`fmt`, and remaining parameters are the same as for
`confd_register_range_data_cb()`, see above.

    int confd_delayed_reply_validation_warn(
    struct confd_trans_ctx *tctx);

This function must be used to return the equivalent of
CONFD_VALIDATION_WARN when the `validate()` callback returned
CONFD_DELAYED_RESPONSE. Before calling this function, we must call
`confd_trans_seterr()` to provide a string describing the warning.

*Errors*: CONFD_ERR_PROTOUSAGE, CONFD_ERR_MALLOC, CONFD_ERR_OS

## Notification Streams

The application can generate notifications that are sent via the
northbound protocols. Currently NETCONF notification streams are
supported. The application generates the content for each notification
and sends it via a socket to ConfD, which in turn manages the stream
subscriptions and distributes the notifications accordingly.

A stream always has a "live feed", which is the sequence of new
notifications, sent in real time as they are generated. Subscribers may
also request "replay" of older, logged notifications if the stream
supports this, perhaps transitioning to the live feed when the end of
the log is reached. There may be one or more replays active
simultaneously with the live feed. ConfD forwards replay requests from
subscribers to the application via callbacks if the stream supports
replay.

Each notification has an associated time stamp, the "event time". This
is the time when the event that generated the notification occurred,
rather than the time the notification is logged or sent, in case these
times differ. The application must pass the event time to ConfD when
sending a notification, and it is also needed when replaying logged
events, see below.

    int confd_register_notification_stream(
    struct confd_daemon_ctx *dx, const struct confd_notification_stream_cbs *ncbs, 
    struct confd_notification_ctx **nctx);

This function registers the notification stream and optionally two
callback functions used for the replay functionality. If the stream does
not support replay, the callback elements in the
`struct confd_notification_stream_cbs` are set to NULL. A context
pointer is returned via the `**nctx` argument - this must be used by the
application for the sending of live notifications via
`confd_notification_send()` and `confd_notification_send_path()` (see
below).

The `confd_notification_stream_cbs` structure is defined as:

<div class="informalexample">

``` c
struct confd_notification_stream_cbs {
    char streamname[MAX_STREAMNAME_LEN];
    int fd;
    int (*get_log_times)(struct confd_notification_ctx *nctx);
    int (*replay)(struct confd_notification_ctx *nctx,
                  struct confd_datetime *start, struct confd_datetime *stop);
    void *cb_opaque; /* private user data */
};
```

</div>

The `fd` element must be set to a previously connected worker socket.
This socket may be used for multiple notification streams, but not for
any of the callback processing described above. Since it is only used
for sending data to ConfD, there is no need for the application to poll
the socket. Note that the control socket must be connected before
registration even if the callbacks are not registered.

> **Note**  
>  
> We must call the `confd_register_done()` function when we are done
> with all registrations for a daemon, see above.

The `get_log_times()` callback is called by ConfD to find out a) the
creation time of the current log and b) the event time of the last
notification aged out of the log, if any. The application provides the
times via the `confd_notification_reply_log_times()` function (see
below) and returns CONFD_OK.

The `replay()` callback is called by ConfD to request replay. The `nctx`
context pointer must be saved by the application and used when sending
the replay notifications via `confd_notification_send()` (or
`confd_notification_send_path()`), as well as for the
`confd_notification_replay_complete()` (or
`confd_notification_replay_failed()`) call (see below) - the callback
should return without waiting for the replay to complete. The pointer
references allocated memory, which is freed by the
`confd_notification_replay_complete()` (or
`confd_notification_replay_failed()`) call.

The times given by `*start` and `*stop` specify the extent of the
replay. The start time will always be given and specify a time in the
past, however the stop time may be either in the past or in the future
or even omitted, i.e. the `stop` argument is NULL. This means that the
subscriber has requested that the subscription continues indefinitely
with the live feed when the logged notifications have been sent.

If the stop time is given:

- The application sends all logged notifications that have an event time
  later than the start time but not later than the stop time, and then
  calls `confd_notification_replay_complete()`. Note that if the stop
  time is in the future when the replay request arrives, this includes
  notifications logged while the replay is in progress (if any), as long
  as their event time is not later than the stop time.

If the stop time is *not* given:

- The application sends all logged notifications that have an event time
  later than the start time, and then calls
  `confd_notification_replay_complete()`. Note that this includes
  notifications logged after the request was received (if any).

ConfD will if needed switch the subscriber over to the live feed and
then end the subscription when the stop time is reached. The callback
may analyze the `start` and `stop` arguments to determine start and stop
positions in the log, but if the analysis is postponed until after the
callback has returned, the `confd_datetime` structure(s) must be copied
by the callback.

The `replay()` callback may optionally select a separate worker socket
to be used for the replay notifications. In this case it must call
`confd_notification_set_fd()` to indicate which socket should be used.

Note that unlike the callbacks for external data bases and validation,
these callbacks do not use a worker socket for the callback processing,
and consequently there is no `init()` callback to request one. The
callbacks are invoked, and the reply is sent, via the daemon control
socket.

The `cb_opaque` element in the `confd_notification_stream_cbs` structure
can be used to pass arbitrary data to the callbacks in much the same way
as for callpoint and validation point registrations, see the description
of the `struct confd_data_cbs` structure above. However since the
callbacks are not associated with a transaction, this element is instead
made available in the `confd_notification_ctx` structure.

    int confd_notification_send(
    struct confd_notification_ctx *nctx, struct confd_datetime *time, confd_tag_value_t *values, 
    int nvalues);

This function is called by the application to send a notification,
defined at the top level of a YANG module, whether "live" or replay.

`confd_notification_send()` is asynchronous and a CONFD_OK return value
only states that the notification was successfully queued for delivery,
the actual send operation can still fail and such a failure will be
logged to ConfD's developerLog.

The `nctx` pointer is provided by ConfD as described above. The `time`
argument specifies the event time for the notification. The `values`
argument is an array of length `nvalues`, populated with the content of
the notification as described for the Tagged Value Array format in the
[XML STRUCTURES](confd_types.xml_structures.3.md) section of the
[confd_types(3)](confd_types.3.md) manual page.

> **Note**  
>  
> The order of the tags in the array must be the same order as in the
> YANG model.

For example, with this definition at the top level of the YANG module
"test":

<div class="informalexample">

    notification linkUp {
      leaf ifIndex {
        type leafref {
          path "/interfaces/interface/ifIndex";
        }
        mandatory true;
      }
    }

</div>

a NETCONF notification of the form:

<div class="informalexample">

    <notification
     xmlns="urn:ietf:params:xml:ns:netconf:notification:1.0">
      <eventTime>2007-08-17T08:56:05Z</eventTime>
      <linkUp xmlns="http://example.com/ns/test">
        <ifIndex>3</ifIndex>
      </linkUp>
    </notification>

</div>

could be sent with the following code:

<div class="informalexample">

    struct confd_notification_ctx *nctx;
    struct confd_datetime event_time = {2007, 8, 17, 8, 56, 5, 0, 0, 0};
    confd_tag_value_t notif[3];
    int n = 0;

    CONFD_SET_TAG_XMLBEGIN(&notif[n], test_linkUp, test__ns); n++;
    CONFD_SET_TAG_UINT32(&notif[n], test_ifIndex, 3); n++;
    CONFD_SET_TAG_XMLEND(&notif[n], test_linkUp, test__ns); n++;
    confd_notification_send(nctx, &event_time, notif, n);

</div>

    int confd_notification_send_path(
    struct confd_notification_ctx *nctx, struct confd_datetime *time, confd_tag_value_t *values, 
    int nvalues, const char *fmt, ...);

This function does the same as `confd_notification_send()`, but for the
"inline" notifications that are added in YANG 1.1, i.e. notifications
that are defined as a child of a container or list. The `nctx`, `time`,
`values`, and `nvalues` arguments are the same as for
`confd_notification_send()`, while the `fmt` and remaining arguments
specify a string path for the container or list entry that is the parent
of the notification, in the same form as for the
[confd_lib_maapi(3)](confd_lib_maapi.3.md) and
[confd_lib_cdb(3)](confd_lib_cdb.3.md) functions. Giving "/" for the
path is equivalent to calling `confd_notification_send()`.

> **Note**  
>  
> The path must be fully instantiated, i.e. all list nodes in the path
> must have all their keys specified.

For example, with this definition at the top level of the YANG module
"test":

<div class="informalexample">

    container interfaces {
      list interface {
        key ifIndex;
        leaf ifIndex {
          type uint32;
        }
        notification link-state {
          leaf state {
            type string;
          }
        }
      }
    }

</div>

a NETCONF notification of the form:

<div class="informalexample">

    <notification
     xmlns="urn:ietf:params:xml:ns:netconf:notification:1.0">
      <eventTime>2018-07-17T08:56:05Z</eventTime>
      <interfaces xmlns="http://example.com/ns/test">
        <interface>
          <ifIndex>3</ifIndex>
          <link-state>
            <state>up</state>
          </link-state>
        </interface>
      </interfaces>
    </notification>

</div>

could be sent with the following code:

<div class="informalexample">

    struct confd_notification_ctx *nctx;
    struct confd_datetime event_time = {2018, 7, 17, 8, 56, 5, 0, 0, 0};
    confd_tag_value_t notif[3];
    int n = 0;

    CONFD_SET_TAG_XMLBEGIN(&notif[n], test_link_state, test__ns); n++;
    CONFD_SET_TAG_STR(&notif[n], test_state, "up"); n++;
    CONFD_SET_TAG_XMLEND(&notif[n], test_link_state, test__ns); n++;
    confd_notification_send_path(nctx, &event_time, notif, n,
                                 "/interfaces/interface{3}");

</div>

> **Note**  
>  
> While it is possible to use separate threads to send live and replay
> notifications for a given stream, or to send different streams on a
> given worker socket, this is not recommended. This is because it
> involves rather complex synchronization problems that can only be
> fully solved by the application, in particular in the case where a
> replay switches over to the live feed.

    int confd_notification_replay_complete(
    struct confd_notification_ctx *nctx);

The application calls this function to notify ConfD that the replay is
complete, using the `nctx` pointer received in the corresponding
`replay()` callback invocation.

    int confd_notification_replay_failed(
    struct confd_notification_ctx *nctx);

In case the application fails to complete the replay as requested (e.g.
the log gets overwritten while the replay is in progress), the
application should call this function *instead* of
`confd_notification_replay_complete()`. An error message describing the
reason for the failure can be supplied by first calling
`confd_notification_seterr()` or `confd_notification_seterr_extended()`,
see below. The `nctx` pointer received in the corresponding `replay()`
callback invocation is used for both calls.

    void confd_notification_set_fd(
    struct confd_notification_ctx *nctx, int fd);

This function may optionally be called by the `replay()` callback to
request that the worker socket given by `fd` should be used for the
replay. Otherwise the socket specified in the
`confd_notification_stream_cbs` at registration will be used.

    int confd_notification_reply_log_times(
    struct confd_notification_ctx *nctx, struct confd_datetime *creation, 
    struct confd_datetime *aged);

Reply function for use in the `get_log_times()` callback invocation. If
no notifications have been aged out of the log, give NULL for the `aged`
argument.

    void confd_notification_seterr(
    struct confd_notification_ctx *nctx, const char *fmt);

In some cases the callbacks may be unable to carry out the requested
actions, e.g. the capacity for simultaneous replays might be exceeded,
and they can then return CONFD_ERR. This function allows the callback to
associate an error message with the failure. It can also be used to
supply an error message before calling
`confd_notification_replay_failed()`.

    void confd_notification_seterr_extended(
    struct confd_notification_ctx *nctx, enum confd_errcode code, uint32_t apptag_ns, 
    uint32_t apptag_tag, const char *fmt);

This function can be used to provide more structured error information
from a notification callback, see the section [EXTENDED ERROR
REPORTING](confd_lib_lib.extended_error_reporting.3.md) in
[confd_lib_lib(3)](confd_lib_lib.3.md).

    int confd_notification_seterr_extended_info(
    struct confd_notification_ctx *nctx, enum confd_errcode code, uint32_t apptag_ns, 
    uint32_t apptag_tag, confd_tag_value_t *error_info, int n, const char *fmt);

This function can be used to provide structured error information in the
same way as `confd_notification_seterr_extended()`, and additionally
provide contents for the NETCONF \<error-info\> element. See the section
[EXTENDED ERROR
REPORTING](confd_lib_lib.extended_error_reporting.3.md) in
[confd_lib_lib(3)](confd_lib_lib.3.md).

    int confd_register_snmp_notification(
    struct confd_daemon_ctx *dx, int fd, const char *notify_name, const char *ctx_name, 
    struct confd_notification_ctx **nctx);

SNMP notifications can also be sent via the notification framework,
however most aspects of the stream concept described above do not apply
for SNMP. This function is used to register a worker socket, the
snmpNotifyName (`notify_name`), and SNMP context (`ctx_name`) to be used
for the notifications.

The `fd` parameter must give a previously connected worker socket. This
socket may be used for different notifications, but not for any of the
callback processing described above. Since it is only used for sending
data to ConfD, there is no need for the application to poll the socket.
Note that the control socket must be connected before registration, even
if none of the callbacks described below are registered.

The context pointer returned via the `**nctx` argument must be used by
the application for the subsequent sending of the notifications via
`confd_notification_send_snmp()` or
`confd_notification_send_snmp_inform()` (see below).

When a notification is sent using one of these functions, it is
delivered to the management targets defined for the `snmpNotifyName` in
the `snmpNotifyTable` in SNMP-NOTIFICATION-MIB for the specified SNMP
context. If `notify_name` is NULL or the empty string (""), the
notification is sent to all management targets. If `ctx_name` is NULL or
the empty string (""), the default context ("") is used.

> **Note**  
>  
> We must call the `confd_register_done()` function when we are done
> with all registrations for a daemon, see above.

    int confd_notification_send_snmp(
    struct confd_notification_ctx *nctx, const char *notification, struct confd_snmp_varbind *varbinds, 
    int num_vars);

Sends the SNMP notification specified by `notification`, without
requesting inform-request delivery information. This is equivalent to
calling `confd_notification_send_snmp_inform()` (see below) with NULL as
the `cb_id` argument. I.e. if the common arguments are the same, the two
functions will send the exact same set of traps and inform-requests.

    int confd_register_notification_snmp_inform_cb(
    struct confd_daemon_ctx *dx, const struct confd_notification_snmp_inform_cbs *cb);

If we want to receive information about the delivery of SNMP
inform-requests, we must register two callbacks for this. The
`struct confd_notification_snmp_inform_cbs` is defined as:

<div class="informalexample">

``` c
struct confd_notification_snmp_inform_cbs {
    char cb_id[MAX_CALLPOINT_LEN];
    void (*targets)(struct confd_notification_ctx *nctx, int ref,
                    struct confd_snmp_target *targets, int num_targets);
    void (*result)(struct confd_notification_ctx *nctx, int ref,
                   struct confd_snmp_target *target, int got_response);
    void *cb_opaque; /* private user data */
};
```

</div>

The callback identifier `cb_id` can be chosen arbitrarily, it is only
used when sending SNMP notifications with
`confd_notification_send_snmp_inform()` - however each inform callback
registration must use a unique `cb_id`. The callbacks are invoked via
the control socket, i.e. the application must poll it and invoke
`confd_fd_ready()` when data is available.

When a notification is sent, the `target()` callback will be invoked
once with `num_targets` (possibly 0) inform-request targets in the
`targets` array, followed by `num_targets` invocations of the `result()`
callback, one for each target. The `ref` argument (passed from the
`confd_notification_send_snmp_inform()` call) allows for tracking the
result of multiple notifications with delivery overlap.

> **Note**  
>  
> We must call the `confd_register_done()` function when we are done
> with all registrations for a daemon, see above.

    int confd_notification_send_snmp_inform(
    struct confd_notification_ctx *nctx, const char *notification, struct confd_snmp_varbind *varbinds, 
    int num_vars, const char *cb_id, int ref);

Sends the SNMP notification specified by `notification`. If `cb_id` is
not NULL, the callbacks registered for `cb_id` will be invoked with the
`ref` argument as described above, otherwise no inform-request delivery
information will be provided. The `varbinds` array should be populated
with `num_vars` elements as described in the Notifications section of
the SNMP Agent chapter in the User Guide.

If `notification` is the empty string, no notification is looked up;
instead `varbinds` defines the notification, including the notification
id (variable name "snmpTrapOID"). This is especially useful for
forwarding a notification which has been received from the SNMP gateway
(see `confd_register_notification_sub_snmp_cb()` below).

If `varbinds` does not contain a timestamp (variable name "sysUpTime"),
one will be supplied by the agent.

    void confd_notification_set_snmp_src_addr(
    struct confd_notification_ctx *nctx, const struct confd_ip *src_addr);

By default, the source address for the SNMP notifications that are sent
by the above functions is chosen by the IP stack of the OS. This
function may be used to select a specific source address, given by
`src_addr`, for the SNMP notifications subsequently sent using the
`nctx` context. The default can be restored by calling the function with
a `src_addr` where the `af` element is set to `AF_UNSPEC`.

    int confd_notification_set_snmp_notify_name(
    struct confd_notification_ctx *nctx, const char *notify_name);

This function can be used to change the snmpNotifyName (`notify_name`)
for the `nctx` context. The new snmpNotifyName is used for notifications
sent by subsequent calls to `confd_notification_send_snmp()` and
`confd_notification_send_snmp_inform()` that use the `nctx` context.

    int confd_register_notification_sub_snmp_cb(
    struct confd_daemon_ctx *dx, const struct confd_notification_sub_snmp_cb *cb);

Registers a callback function to be called when an SNMP notification is
received by the SNMP gateway.

The `struct confd_notification_sub_snmp_cb` is defined as:

<div class="informalexample">

``` c
struct confd_notification_sub_snmp_cb {
    char sub_id[MAX_CALLPOINT_LEN];
    int (*recv)(struct confd_notification_ctx *nctx, char *notification,
                struct confd_snmp_varbind *varbinds, int num_vars,
                confd_value_t *src_addr, uint16_t src_port);
    void *cb_opaque; /* private user data */
};
```

</div>

The `sub_id` element is the subscription id for the notifications. The
`recv()` callback will be called when a notification is received. See
the section "Receiving and Forwarding Traps" in the chapter "The SNMP
gateway" in the Users Guide.

> **Note**  
>  
> We must call the `confd_register_done()` function when we are done
> with all registrations for a daemon, see above.

    int confd_notification_flush(
    struct confd_notification_ctx *nctx);

Notifications are sent asynchronously, i.e. normally without blocking
the caller of the send functions described above. This means that in
some cases, ConfD's sending of the notifications on the northbound
interfaces may lag behind the send calls. If we want to make sure that
the notifications have actually been sent out, e.g. in some shutdown
procedure, we can call `confd_notification_flush()`. This function will
block until all notifications sent using the given `nctx` context have
been fully processed by ConfD. It can be used both for notification
streams and for SNMP notifications (however it will not wait for replies
to SNMP inform-requests to arrive).

## Push On-Change Callbacks

The application can generate push notifications based on data changes
that are sent via the NETCONF protocol. The application generates
content for each subscription according to filters and other parameters
specified by the subscription callback and sends it via a socket to
ConfD. Push notifications that are received by ConfD are then published
to the NETCONF subscribers.

> [!WARNING]
> *Experimental*. The PUSH ON-CHANGE CALLBACKS are not subject to
> libconfd protocol version policy. Non-backwards compatible changes or
> removal may occur in any future release.

> **Note**  
>  
> ConfD implements a YANG-Push server and the push on-change callbacks
> provide a complementary mechanism for ConfD to publish updates from
> the data managed by data providers. Thus, it is recommended to be
> familiar with YANG-Push (RFC 8641) and YANG Patch (RFC 8072)
> standards.

    int confd_register_push_on_change(
    struct confd_daemon_ctx *dx, const struct confd_push_on_change_cbs *pcbs);

This function registers two mandatory callback functions used to
subscribe to and unsubscribe from on-change push notifications.

The `confd_push_on_change_cbs` structure is defined as:

<div class="informalexample">

``` c
struct confd_push_on_change_cbs {
    char callpoint[MAX_CALLPOINT_LEN];
    int fd;
    /*Yang-Push subscription on data changes*/
    int (*subscribe_on_change)(struct confd_push_on_change_ctx *pctx);
    /*Yang-Push unsubscription on data changes*/
    int (*unsubscribe_on_change)(struct confd_push_on_change_ctx *pctx);
    struct confd_push_on_change_ctx **push_ctxs;
    int push_ctxs_len, num_push_ctxs;
    void *cb_opaque; /* private user data */
};
```

</div>

The `fd` element must be set to a previously connected worker socket.
This socket may be used for multiple notification streams, but not for
any of the callback processing described above. Since it is only used
for sending data to ConfD, there is no need for the application to poll
the socket. Note that the control socket must be connected before
registration.

> **Note**  
>  
> We must call the `confd_register_done()` function when we are done
> with all registrations for a daemon, see above.

The `subscribe_on_change()` callback is called by ConfD to initiate a
subscription on specified data with specified trigger options passed by
the context pointer: `pctx` argument. The argument must be used by the
application for the sending of push notifications via
`confd_push_on_change()` (see below for details).

The `unsubscribe_on_change()` callback is called by ConfD to remove a
specified subscription by the context pointer `pctx` argument.

The `push_ctxs` is an array of contextual data that belongs to the
current subscriptions under the registered callback instance. The
`push_ctxs`, `push_ctxs_len` and `num_push_ctxs` are for internal use of
libconfd.

The `cb_opaque` element is reserved for future use.

The `struct confd_push_on_change_ctx` structure is defined as:

<div class="informalexample">

``` c
struct confd_push_on_change_ctx {
    char *callpoint;
    int fd;                      /* notification (worker) socket */
    struct confd_daemon_ctx *dx; /* our daemon ctx */
    struct confd_error error;    /* user settable via */
                                 /* confd_push_on_change_seterr*() */
    int subid;
    int usid;
    char *xpath_filter;
    confd_hkeypath_t *hkeypaths;
    int npaths;
    int dampening_period;
    int excluded_changes;
    void *cb_opaque; /* private user data from registration */

    /* ConfD internal fields */
    int flags;
};
```

</div>

The `subid` is the subscription identity provided by ConfD to identify
the subscription on NETCONF session.

The `usid` is the user id corresponding to the user of the NETCONF
session. The user id can be used to optionally identify and obtain the
user session, which can be used to authorize the push notifications.

> [!WARNING]
> ConfD will always check access rights on the data that is pushed from
> the applications, unless the configuration parameter
> `enableExternalAccessCheck` is set to *true*. If
> `enableExternalAccessCheck` is true and the application sets the
> `CONFD_PATCH_FLAG_AAA_CHECKED` flag, then ConfD will not perform
> access right checks on the received data.

The optional `xpath_filter` element is the string representation of the
XPath filter provided for the subscription to identify a portion of data
in the data tree. The `xpath_filter` is present if the NETCONF
subscription is specified with an XPath filter instead of a subtree
filter. Applications are requested to provide the data changes occurring
in the portion of the data where the XPath expression evaluates to.

The `hkeypaths` element is an array of `struct confd_hkeypath_t *`, each
path specifies the data sub-tree that the subscription is interested in
for occurring data changes. Applications are requested to provide the
data changes occurring at and under the data sub-tree pointed by the
provided hkeypaths. If an application is able to evaluate the XPath
expression specified by the `xpath_filter`, then it might not be needed
to take hkeypaths in consideration and the application may provide data
contents of the notifications according to the XPath evaluation it
performs. For the subscriptions with an XPath filter, hkeypaths are
populated in best effort manner and the data content of the
notifications might need to be filtered again by ConfD. The `hkeypaths`
must be used if `xpath_filter` is not provided.

The `npaths` integer specifies the size of the `hkeypaths` array.

The `dampening_period` element specifies the time interval that has to
pass before successive push notification can be sent. The
`dampening_period` is specified in centiseconds. Any notification that
is sent before the specified amount of time passed after previous
notification will be dampened by ConfD. Note that ConfD can dampen the
notification even if the application sends the successive notification
after the period ends. This can happen in cases where ConfD itself have
generated a notification for another portion of the data tree and pushed
it to the NETCONF session.

The `excluded_changes` is an integer specifying which kind of changes
should not be included in push notifications. The application needs to
check which bits in the `excluded_changes` are set and compare it with
the enumerated change codes below, defined by `enum confd_data_op`.

<div class="informalexample">

``` c
enum confd_data_op {
    CONFD_DATA_CREATE = 0,
    CONFD_DATA_DELETE = 1,
    CONFD_DATA_INSERT = 2,
    CONFD_DATA_MERGE = 3,
    CONFD_DATA_MOVE = 4,
    CONFD_DATA_REPLACE = 5,
    CONFD_DATA_REMOVE = 6
};
```

</div>

    int confd_push_on_change(
    struct confd_push_on_change_ctx *pctx, struct confd_datetime *time, const struct confd_data_patch *patch);

This function is called by the application to send a push notification
upon data changes occurring in the subscribed portion of the data tree.
`confd_push_on_change()` is asynchronous and a CONFD_OK return value
only states that the notification was successfully passed to ConfD. The
actual NETCONF notification might differ according to the ConfD
configuration and its state.

The `pctx` pointer is provided by ConfD as it is described above. The
`time` argument specifies the event time for the notification. The
`patch` argument of type `struct confd_data_patch*` is populated with
the content of the push notification as described below. The structure
of the `struct confd_data_patch*` conforms to YANG Patch media type
specified by RFC 8072.

The `struct confd_data_patch` structure is defined as:

<div class="informalexample">

``` c
struct confd_data_patch {
    char *patch_id;
    char *comment;
    struct confd_data_edit *edits;
    int nedits;
    int flags;
};
```

</div>

The application must set `patch_id` to a string for identification of
the patch. The application should attempt to generate unique values to
distinguish between transactions from multiple clients in any audit logs
maintained by ConfD. The `patch_id` string is not used by ConfD when
publishing push change update notifications via NETCONF, but it may be
used for auditing in the future.

The application can optionally set `comment` to a string to describe the
patch.

The `edits` is an array of `struct confd_data_edit*` type, which also
conforms to the edit list in YANG Patch specified by RFC 8072. Each edit
instance represents one type of change on targeted portions of
datastore. (See below for detailed description of the
`struct confd_data_edit*`).

The application must set the `nedits` integer value according to the
number of edits populated in the `edits` array.

The application must set the `flags` integer value by setting the bits
corresponding to the below macros and their conditions.

<div class="informalexample">

    CONFD_PATCH_FLAG_INCOMPLETE      /* indicates that not all subscribed
                                        datastore nodes are included with this
                                        patch. */
    CONFD_PATCH_FLAG_BUFFER_DAMPENED /* indicates that if ConfD dampens the push
                                        notification, it should also buffer it
                                        to send with next push change update
                                        after current dampening period ends. */
    CONFD_PATCH_FLAG_FILTER          /* indicates that ConfD should filter the
                                        push notification contents. */
    CONFD_PATCH_FLAG_AAA_CHECKED     /* indicates that the application already
                                        checked AAA access rights for the
                                        user. */

</div>

> [!WARNING]
> Currently ConfD can not apply an XPath or Subtree filter on the data
> provided in push notifications. If the `CONFD_PATCH_FLAG_FILTER` flag
> is set, ConfD can only filter out the edits with operations that are
> specified in excluded changes.

The `struct confd_data_edit` structure is defined as:

<div class="informalexample">

``` c
struct confd_data_edit {
    char *edit_id;
    enum confd_data_op op;
    void *target;
    void *point;
    enum confd_data_where where;
    confd_tag_value_t *data;
    int ndata;
    int flags;
    int (*set_path)(const struct confd_data_edit *edit, size_t offset,
                    const char *fmt, ...);
};
```

</div>

An edit may be defined as in the example below and the struct member
values can be initialized using `CONFD_DATA_EDIT()` macro.

<div class="informalexample">

    struct confd_data_edit *edit =
        (struct confd_data_edit *) malloc(sizeof(struct confd_data_edit));
    *edit = CONFD_DATA_EDIT();

</div>

The application must set an arbitrary string to `edit_id` as an
identifier for the edit.

The mandatory `op` element of type `enum confd_data_op` must be set to
one of the enumerated values. (See above for the definition).

The mandatory `target` element identifies the target data node for the
edit. The `target` can be set using the convenience macro
`CONFD_DATA_EDIT_SET_PATH`, where a `fmt` argument and variable
arguments can be passed to set the path to target.

<div class="informalexample">

    CONFD_DATA_EDIT_SET_PATH(edit, target, "/if:interfaces/interface{eth%d}", 1);

</div>

The conditional `point` element identifies the position of the data node
when the value of `op` is `CONFD_DATA_INSERT` or `CONFD_DATA_MOVE`; and
also the value of `where` is `CONFD_DATA_BEFORE` or `CONFD_DATA_AFTER`.
The `point` can be set using the convenience macro
`CONFD_DATA_EDIT_SET_PATH`, similar to the `target` element.

<div class="informalexample">

    CONFD_DATA_EDIT_SET_PATH(edit, point, "/if:interfaces/interface{eth%d}", 0);

</div>

The conditional `where` element of type `enum confd_data_where`
identifies the relative position of the data node when the value of `op`
is `CONFD_DATA_INSERT` or `CONFD_DATA_MOVE`. The `enum confd_data_where`
is defined as below.

<div class="informalexample">

``` c
enum confd_data_where {
    CONFD_DATA_BEFORE = 0,
    CONFD_DATA_AFTER = 1,
    CONFD_DATA_FIRST = 2,
    CONFD_DATA_LAST = 3
};
```

</div>

The conditional `data` element is an array of type
`struct confd_tag_value_t*` and must be populated when the edit's `op`
value is `CONFD_DATA_CREATE`, `CONFD_DATA_MERGE`, `CONFD_DATA_REPLACE`,
or `CONFD_DATA_INSERT`. The data array is populated with values
according to the specification of the Tagged Value Array format in the
[XML STRUCTURES](confd_types.xml_structures.3.md) section of the
[confd_types(3)](confd_types.3.md) manual page.

> **Note**  
>  
> The order of the tags in the array must be the same order as in the
> YANG model.

The conditional `ndata` must be set to an integer value if `data` is
set, according to the number of `struct confd_tag_value_t` instances
populated in `data` array.

The `flags` element is reserved for future use.

The `set_path` function pointer is for internal use. It provides a
convenience function for setting `target` and `point` elements of type
void pointers.

Example: a NETCONF YANG-Push notification of the form:

<div class="informalexample">

    <notification
      xmlns="urn:ietf:params:xml:ns:netconf:notification:1.0">
      <eventTime>2020-11-10T08:56:05.0+00.00</eventTime>
      <push-change-update xmlns="urn:ietf:params:xml:ns:yang:ietf-yang-push">
        <id>1</id>
        <datastore-changes>
          <yang-patch>
            <patch-id>s1-p0</patch-id>
            <edit>
              <edit-id>dp-edit-1</edit-id>
              <operation>merge</operation>
              <target>/ietf-interfaces:interfaces/interface=eth2</target>
              <value>
                <interface xmlns="urn:ietf:params:xml:ns:yang:ietf-interfaces">
                  <name>eth2</name>
                  <type xmlns:ianaift="urn:ietf:params:xml:ns:yang:iana-if-type">
                    ianaift:coffee
                  </type>
                  <enabled>true</enabled>
                  <oper-status>dormant</oper-status>
                </interface>
              </value>
            </edit>
          </yang-patch>
        </datastore-changes>
        <incomplete-update/>
      </push-change-update>
    </notification>

</div>

could be sent with the following code:

<div class="informalexample">

    struct confd_push_on_change_ctx *pctx = stored_pctx;
    struct confd_datetime event_time = {2020, 11, 10, 8, 56, 5, 0, 0, 0};
    confd_tag_value_t notif[6];
    struct edits[1];
    struct confd_data_edit *edit =
        (struct confd_data_edit *) malloc(sizeof(struct confd_data_edit));

    /* Initialize members of confd_data_edit struct */
    *edit = CONFD_DATA_EDIT();
    /* Setting edit parameters */
    edit->edit_id = "dp-edit-1";
    edit->op = CONFD_DATA_MERGE;
    /* Setting target path */
    CONFD_DATA_EDIT_SET_PATH(edit, target, "/if:interfaces/interface{eth%d}", 2);

    /* Populating Tagged Value Array */
    int i = 0;
    CONFD_SET_TAG_XMLBEGIN(&notif[i++], if_interface, if__ns);
    CONFD_SET_TAG_STR(&notif[i++], if_name, "eth2");
    struct confd_identityref type;
    type.ns = ianaift__ns;
    type.id = ianaift_coffee;
    CONFD_SET_TAG_IDENTITYREF(&notif[i++], if_type, type);
    CONFD_SET_TAG_BOOL(&notif[i++], if_interface_enabled, 1);
    CONFD_SET_TAG_ENUM_VALUE(&notif[i++], if_oper_status, if_dormant);
    CONFD_SET_TAG_XMLEND(&notif[i++], if_interface, if__ns);

    /* Set the data and its length */
    edit->data = notif;
    edit->ndata = i;
    /* Populate edits array */
    edits[0] = *edit;

    /* Setting patch parameters */
    struct confd_data_patch *patch =
        (struct confd_data_patch *) malloc(sizeof(struct confd_data_patch));
    patch->patch_id = "example-patch"; /* ConfD ignores this and generates own. */
    patch->comment = "Example patch from manpages.";
    patch->edits = edits;
    patch->nedits = 1;
    patch->flags = CONFD_PATCH_FLAG_INCOMPLETE;

    /* Send the patch to confd */
    confd_push_on_change(pctx, &event_time, patch);

    free(edit);
    free(patch);

</div>

## Confd Actions

The use of action callbacks can be specified either via a `rpc`
statement or via a `tailf:action` statement in the YANG data model, see
the YANG specification and
[tailf_yang_extensions(5)](tailf_yang_extensions.5.md). In both cases
the use of a `tailf:actionpoint` statement specifies that the action is
implemented as a callback function. This section describes how such
callback functions should be implemented and registered with ConfD.

Unlike the callbacks for data and validation, there is not always a
transaction associated with an action callback. However an action is
always associated with a user session (NETCONF, CLI, etc), and only one
action at a time can be invoked from a given user session. Hence a
pointer to the associated `struct confd_user_info` is passed to the
callbacks.

The action callback mechanism is also used for command and completion
callbacks configured for the CLI, either in a YANG module using tailf
extension statements, or in a [clispec(5)](clispec.5.md). As the
parameter structure is significantly different, special callbacks are
used for these functions.

    int confd_register_action_cbs(
    struct confd_daemon_ctx *dx, const struct confd_action_cbs *acb);

This function registers up to five callback functions, two of which will
be called in sequence when an action is invoked. The
`struct confd_action_cbs` is defined as:

<div class="informalexample">

``` c
struct confd_action_cbs {
    char actionpoint[MAX_CALLPOINT_LEN];
    int (*init)(struct confd_user_info *uinfo);
    int (*abort)(struct confd_user_info *uinfo);
    int (*action)(struct confd_user_info *uinfo, struct xml_tag *name,
                  confd_hkeypath_t *kp, confd_tag_value_t *params, int nparams);
    int (*command)(struct confd_user_info *uinfo, char *path, int argc,
                   char **argv);
    int (*completion)(struct confd_user_info *uinfo, int cli_style, char *token,
                      int completion_char, confd_hkeypath_t *kp, char *cmdpath,
                      char *cmdparam_id, struct confd_qname *simpleType,
                      char *extra);
    void *cb_opaque; /* private user data */
};
```

</div>

The `init()` callback, and at least one of the `action()`, `command()`,
and `completion()` callbacks, must be specified. It is in principle
possible to use a single "point name" for more than one of these
callback types, and have the corresponding callback invoked in each
case, but in typical usage we would only register one of the callbacks
`action()`, `command()`, and `completion()`. Below, the term "action
callback" is used to refer to any of these three.

Similar to the `init()` callback for external data bases, we must in the
`init()` callback associate a worker socket with the action. This socket
will be used for the invocation of the action callback, which actually
carries out the action. Thus in a multi threaded application, actions
can be dispatched to different threads.

However note that unlike the callbacks for external data bases and
validation, both `init()` and action callbacks are registered for each
action point (i.e. different action points can have different `init()`
callbacks), and there is no `finish()` callback - the action is
completed when the action callback returns.

The `struct confd_action_ctx actx` element inside the
`struct confd_user_info` holds action-specific data, in particular the
`t_opaque` element could be used to pass data from the `init()` callback
to the action callback, if needed. If the action is associated with a
transaction, the `thandle` element is set to the transaction handle, and
can be used with a call to `maapi_attach2()` (see
[confd_lib_maapi(3)](confd_lib_maapi.3.md)), otherwise `thandle` will
be -1. It is up to the northbound interface whether to invoke the action
with a transaction handle, and the action implementer must check if the
thandle is -1 or a proper transaction handle if the action intends to
use it. The CLI will always invoke an action with a transaction handle
(it will pass a handle to a read_write transaction when in configure
mode, and a read transaction otherwise). The NETCONF interface will do
so if the tailf extension `<start-transaction/>` was used before the
action was invoked. A transaction handle will also be passed to the
callback when invoked via `maapi_request_action_th()` (see
[confd_lib_maapi(3)](confd_lib_maapi.3.md)).

The `cb_opaque` element in the `confd_action_cbs` structure can be used
to pass arbitrary data to the callbacks in much the same way as for
callpoint and validation point registrations, see the description of the
`struct confd_data_cbs` structure above. This element is made available
in the `confd_action_ctx` structure.

If the `tailf:opaque` substatement has been used with the
`tailf:actionpoint` statement in the data model, the argument string is
made available to the callbacks via the `actionpoint_opaque` element in
the `confd_action_ctx` structure.

> **Note**  
>  
> We must call the `confd_register_done()` function when we are done
> with all registrations for a daemon, see above.

The `action()` callback receives all the parameters pertaining to the
action: The `name` argument is a pointer to the action name as defined
in the data model, the `kp` argument gives the path through the data
model for an action defined via `tailf:action` (it is a NULL pointer for
an action defined via `rpc`), and finally the `params` argument is a
representation of the inout parameters provided when the action is
invoked. The `params` argument is an array of length `nparams`,
populated as described for the Tagged Value Array format in the [XML
STRUCTURES](confd_types.xml_structures.3.md) section of the
[confd_types(3)](confd_types.3.md) manual page.

The `command()` callback is invoked for CLI callback commands. It must
always result in a call of `confd_action_reply_command()`. As the
parameters in this case are all in string form, they are passed in the
traditional Unix `argc`, `argv` manner - i.e. `argv` is an array of
`argc` pointers to NUL-terminated strings plus a final NULL pointer
element, and `argv[0]` is the name of the command. Additionally the full
path of the command is available via the `path` argument.

The `completion()` callback is invoked for CLI completion and
information. It must result in a call of
`confd_action_reply_completion()`, except for the case when the callback
is invoked via a `tailf:cli-custom-range-enumerator` statement in the
data model (see below). The `cli_style` argument gives the style of the
CLI session as a character: 'J', 'C', or 'I'. The `token` argument is a
NUL-terminated string giving the parameter of the CLI command line that
the callback invocation pertains to, and `completion_char` is the
character that the user typed, i.e. TAB ('\t'), SPACE (' '), or '?'. If
the callback pertains to a data model element, `kp` identifies that
element, otherwise it is NULL. The `cmdpath` is a NUL-terminated string
giving the full path of the command. If a `cli-completion-id` is
specified in the YANG module, or a `completionId` is specified in the
clispec, it is given as a NUL-terminated string via `cmdparam_id`,
otherwise this argument is NULL. If the invocation pertains to an
element that has a type definition, the `simpleType` argument identifies
the type with namespace and type name, otherwise it is NULL. The `extra`
argument is currently unused (always NULL).

When `completion()` is invoked via a `tailf:cli-custom-range-enumerator`
statement in the data model, it is a request to provide possible key
values for creation of an entry in a list with a custom range
specification. The callback must in this case result in a call of
`confd_action_reply_range_enum()`. Refer to the `cli/range_create`
example in the bundled examples collection to see an implementation of
such a callback.

The action callbacks must return CONFD_OK, CONFD_ERR, or
CONFD_DELAYED_RESPONSE. CONFD_DELAYED_RESPONSE implies that the
application must later reply asynchronously.

The optional `abort()` callback is called whenever an action is aborted,
e.g. when a user invokes an action from one of the northbound agents and
aborts it before it has completed. The `abort()` callback will be
invoked on the control socket. It is the responsibility of the `abort()`
callback to make sure that the pending reply from the action callback is
sent. This is required to allow the worker socket to be used for further
queries. There are several possible ways for an application to support
aborting. E.g. the application can return CONFD_DELAYED_RESPONSE from
the action callback. Then, when the `abort()` callback is called, it can
terminate the executing action and use e.g.
`confd_action_delayed_reply_error()`. Alternatively an application can
use threads where the action callback is executed in a separate thread.
In this case the `abort()` callback could inform the thread executing
the action that it should be terminated, and that thread can just return
from the action callback.

    int confd_register_range_action_cbs(
    struct confd_daemon_ctx *dx, const struct confd_action_cbs *acb, const confd_value_t *lower, 
    const confd_value_t *upper, int numkeys, const char *fmt, ...);

A variant of `confd_register_action_cbs()` which registers action
callbacks for a range of key values. The `lower`, `upper`, `numkeys`,
`fmt`, and remaining parameters are the same as for
`confd_register_range_data_cb()`, see above.

> **Note**  
>  
> This function can not be used for registration of the `command()` or
> `completion()` callbacks - only actions specified in the data model
> are invoked via a keypath that can be used for selection of the
> corresponding callbacks.

    void confd_action_set_fd(
    struct confd_user_info *uinfo, int sock);

Associate a worker socket with the action. This function must be called
in the `init()` callback - a typical implementation of an `init()`
callback looks as:

<div class="informalexample">

    static int init_action(struct confd_user_info *uinfo)
    {
        confd_action_set_fd(uinfo, workersock);
        return CONFD_OK;
    }

</div>

    int confd_action_reply_values(
    struct confd_user_info *uinfo, confd_tag_value_t *values, int nvalues);

If the action definition specifies that the action should return data,
it must invoke this function in response to the `action()` callback. The
`values` argument points to an array of length `nvalues`, populated with
the output parameters in the same way as the `params` array above.

> **Note**  
>  
> This function must only be called for an `action()` callback.

    int confd_action_reply_command(
    struct confd_user_info *uinfo, char **values, int nvalues);

If a CLI callback command should return data, it must invoke this
function in response to the `command()` callback. The `values` argument
points to an array of length `nvalues`, populated with pointers to
NUL-terminated strings.

> **Note**  
>  
> This function must only be called for a `command()` callback.

    int confd_action_reply_rewrite(
    struct confd_user_info *uinfo, char **values, int nvalues, char **unhides, 
    int nunhides);

This function can be called instead of `confd_action_reply_command()` as
a response to a show path rewrite callback invocation. The `values`
argument points to an array of length `nvalues`, populated with pointers
to NUL-terminated strings representing the tokens of the new path. The
`unhides` argument points to an array of length `nunhides`, populated
with pointers to NUL-terminated strings representing hide groups to
temporarily unhide during evaluation of the show command.

> **Note**  
>  
> This function must only be called for a `command()` callback.

    int confd_action_reply_rewrite2(
    struct confd_user_info *uinfo, char **values, int nvalues, char **unhides, 
    int nunhides, struct confd_rewrite_select **selects, int nselects);

This function can be called instead of `confd_action_reply_command()` as
a response to a show path rewrite callback invocation. The `values`
argument points to an array of length `nvalues`, populated with pointers
to NUL-terminated strings representing the tokens of the new path. The
`unhides` argument points to an array of length `nunhides`, populated
with pointers to NUL-terminated strings representing hide groups to
temporarily unhide during evaluation of the show command. The `selects`
argument points to an array of length `nselects`, populated with
pointers to confd_rewrite_select structs representing additional select
targets.

> **Note**  
>  
> This function must only be called for a `command()` callback.

    int confd_action_reply_completion(
    struct confd_user_info *uinfo, struct confd_completion_value *values, 
    int nvalues);

This function must normally be called in response to the `completion()`
callback. The `values` argument points to an `nvalues` long array of
`confd_completion_value` elements:

<div class="informalexample">

``` c
enum confd_completion_type {
    CONFD_COMPLETION,
    CONFD_COMPLETION_INFO,
    CONFD_COMPLETION_DESC,
    CONFD_COMPLETION_DEFAULT
};
```

``` c
struct confd_completion_value {
    enum confd_completion_type type;
    char *value;
    char *extra;
};
```

</div>

For a completion alternative, `type` is set to CONFD_COMPLETION, `value`
gives the alternative as a NUL-terminated string, and `extra` gives
explanatory text as a NUL-terminated string - if there is no such text,
`extra` is set to NULL. For "info" or "desc" elements, `type` is set to
CONFD_COMPLETION_INFO or CONFD_COMPLETION_DESC, respectively, and
`value` gives the text as a NUL-terminated string (the `extra` element
is ignored).

In order to fallback to the normal completion behavior, `type` should be
set to CONFD_COMPLETION_DEFAULT. CONFD_COMPLETION_DEFAULT cannot be
combined with the other completion types, implying the `values` array
always must have length `1` which is indicated by `nvalues` setting.

> **Note**  
>  
> This function must only be called for a `completion()` callback.

    int confd_action_reply_range_enum(
    struct confd_user_info *uinfo, char **values, int keysize, int nkeys);

This function must be called in response to the `completion()` callback
when it is invoked via a `tailf:cli-custom-range-enumerator` statement
in the data model. The `values` argument points to a `keysize` `*`
`nkeys` long array of strings giving the possible key values, where
`keysize` is the number of keys for the list in the data model and
`nkeys` is the number of list entries for which keys are provided. I.e.
the array gives entry1-key1, entry1-key2, ..., entry2-key1, entry2-key2,
... and so on. See the `cli/range_create` example in the bundled
examples collection for details.

> **Note**  
>  
> This function must only be called for a `completion()` callback.

    void confd_action_seterr(
    struct confd_user_info *uinfo, const char *fmt);

If action callback encounters fatal problems that can not be expressed
via the reply function, it may call this function with an appropriate
message and return CONFD_ERR instead of CONFD_OK.

    void confd_action_seterr_extended(
    struct confd_user_info *uinfo, enum confd_errcode code, uint32_t apptag_ns, 
    uint32_t apptag_tag, const char *fmt);

This function can be used to provide more structured error information
from an action callback, see the section [EXTENDED ERROR
REPORTING](confd_lib_lib.extended_error_reporting.3.md) in
[confd_lib_lib(3)](confd_lib_lib.3.md).

    int confd_action_seterr_extended_info(
    struct confd_user_info *uinfo, enum confd_errcode code, uint32_t apptag_ns, 
    uint32_t apptag_tag, confd_tag_value_t *error_info, int n, const char *fmt);

This function can be used to provide structured error information in the
same way as `confd_action_seterr_extended()`, and additionally provide
contents for the NETCONF \<error-info\> element. See the section
[EXTENDED ERROR
REPORTING](confd_lib_lib.extended_error_reporting.3.md) in
[confd_lib_lib(3)](confd_lib_lib.3.md).

    int confd_action_delayed_reply_ok(
    struct confd_user_info *uinfo);

    int confd_action_delayed_reply_error(
    struct confd_user_info *uinfo, const char *errstr);

If we use the CONFD_DELAYED_RESPONSE as a return value from the action
callback, we must later asynchronously reply. If we use one of the
`confd_action_reply_xxx()` functions, this is a complete reply.
Otherwise we must use the `confd_action_delayed_reply_ok()` function to
signal success, or the `confd_action_delayed_reply_error()` function to
signal an error.

    int confd_action_set_timeout(
    struct confd_user_info *uinfo, int timeout_secs);

Some action callbacks may require a significantly longer execution time
than others, and this time may not even be possible to determine
statically (e.g. a file download). In such cases the
/confdConfig/capi/queryTimeout setting in `confd.conf` (see above) may
be insufficient, and this function can be used to extend (or shorten)
the timeout for the current callback invocation. The timeout is given in
seconds from the point in time when the function is called.

Examples on how to work with actions are available in the User Guide and
in the bundled examples collection.

## Authentication Callback

We can register a callback with ConfD's AAA subsystem, to be invoked
whenever AAA has completed processing of an authentication attempt. In
the case where the authentication was otherwise successful, the callback
can still cause it to be rejected. This can be used to implement
specific access policies, as an alternative to using PAM or "External"
authentication for this purpose. The callback will only be invoked if it
is both enabled via /confdConfig/aaa/authenticationCallback/enabled in
`confd.conf` (see [confd.conf(5)](ncs.conf.5.md)) and registered as
described here.

> **Note**  
>  
> If the callback is enabled in `confd.conf` but not registered, or
> invocation keeps failing for some reason, *all* authentication
> attempts will fail.

> **Note**  
>  
> This callback can not be used to actually *perform* the
> authentication. If we want to implement the authentication outside of
> ConfD, we need to use PAM or "External" authentication, see the AAA
> chapter in the Admin Guide.

    int confd_register_auth_cb(
    struct confd_daemon_ctx *dx, const struct confd_auth_cb *acb);

Registers the authentication callback. The `struct confd_auth_cb` is
defined as:

<div class="informalexample">

``` c
struct confd_auth_cb {
    int (*auth)(struct confd_auth_ctx *actx);
};
```

</div>

The `auth()` callback is invoked with a pointer to an authentication
context that provides information about the result of the authentication
so far. The callback must return CONFD_OK or CONFD_ERR, see below. The
`struct confd_auth_ctx` is defined as:

<div class="informalexample">

``` c
struct confd_auth_ctx {
    struct confd_user_info *uinfo;
    char *method;
    int success;
    union {
        struct { /* if success */
            int ngroups;
            char **groups;
        } succ;
        struct {       /* if !success */
            int logno; /* number from confd_logsyms.h */
            char *reason;
        } fail;
    } ainfo;
    /* ConfD internal fields */
    char *errstr;
};
```

</div>

The `uinfo` element points to a `struct confd_user_info` with details
about the user logging in, specifically user name, password (if used),
source IP address, context, and protocol. Note that the user session
does not actually exist at this point, even if the AAA authentication
was successful - it will only be created if the callback accepts the
authentication, hence e.g. the `usid` element is always 0.

The `method` string gives the authentication method used, as follows:

"password"  
> Password authentication. This generic term is used if the
> authentication failed.

"local", "pam", "external"  
> Password authentication. On successful authentication, the specific
> method that succeeded is given. See the AAA chapter in the Admin Guide
> for an explanation of these methods.

"publickey"  
> Public key authentication via the internal SSH server.

Other  
> Authentication with an unknown or unsupported method with this name
> was attempted via the internal SSH server.

If `success` is non-zero, the AAA authentication succeeded, and `groups`
is an array of length `ngroups` that gives the groups that will be
assigned to the user at login. If the callback returns CONFD_OK, the
complete authentication succeeds and the user is logged in. If it
returns CONFD_ERR (or an invalid return value), the authentication
fails.

If `success` is zero, the AAA authentication failed (with `logno` set to
`CONFD_AUTH_LOGIN_FAIL`), and the explanatory string `reason`. This
invocation is only for informational purposes - the callback return
value has no effect on the authentication, and should normally be
CONFD_OK.

    void confd_auth_seterr(
    struct confd_auth_ctx *actx, const char *fmt, ...);

This function can be used to provide a text message when the callback
returns CONFD_ERR. If used when rejecting a successful authentication,
the message will be logged in ConfD's audit log (otherwise a generic
"rejected by application callback" message is logged).

## Authorization Callbacks

We can register two authorization callbacks with ConfD's AAA subsystem.
These will be invoked when the northbound agents check that a command or
a data access is allowed by the AAA access rules. The callbacks can
partially or completely replace the access checks done within the AAA
subsystem, and they may accept or reject the access. Typically many
access checks are done during the processing of commands etc, and using
these callbacks can thus have a significant performance impact. Unless
it is a requirement to query an external authorization mechanism, it is
far better to only configure access rules in the AAA data model (see the
AAA chapter in the Admin Guide).

The callbacks will only be invoked if they are both enabled via
/confdConfig/aaa/authorization/callback/enabled in `confd.conf` (see
[confd.conf(5)](ncs.conf.5.md)) and registered as described here.

> **Note**  
>  
> If the callbacks are enabled in `confd.conf` but no registration has
> been done, or if invocation keeps failing for some reason, *all*
> access checks will be rejected.

    int confd_register_authorization_cb(
    struct confd_daemon_ctx *dx, const struct confd_authorization_cbs *acb);

Registers the authorization callbacks. The
`struct confd_authorization_cbs` is defined as:

<div class="informalexample">

``` c
struct confd_authorization_cbs {
    int cmd_filter;
    int data_filter;
    int (*chk_cmd_access)(struct confd_authorization_ctx *actx,
                          char **cmdtokens, int ntokens, int cmdop);
    int (*chk_data_access)(struct confd_authorization_ctx *actx,
                           uint32_t hashed_ns, confd_hkeypath_t *hkp,
                           int dataop, int how);
};
```

</div>

Both callbacks are optional, i.e. we can set the function pointer in
`struct confd_authorization_cbs` to NULL if we don't want the
corresponding callback invocation. In this case the AAA subsystem will
handle the access check as if the callback was registered, but always
replied with `CONFD_ACCESS_RESULT_DEFAULT` (see below).

The `cmd_filter` and `data_filter` elements can be used to prevent
access checks from causing invocation of a callback even though it is
registered. If we do not want any filtering, they must be set to zero.
The value is a bitmask obtained by ORing together values: For
`cmd_filter`, we can use the possible values for `cmdop` (see below),
preventing the corresponding invocations of `chk_cmd_access()`. For
`data_filter`, we can use the possible values for `dataop` and `how`
(see below), preventing the corresponding invocation of
`chk_data_access()`. If the callback invocation is prevented by
filtering, the AAA subsystem will handle the access check as if the
callback had replied with `CONFD_ACCESS_RESULT_CONTINUE` (see below).

Both callbacks are invoked with a pointer to an authorization context
that provides information about the user session that the access check
pertains to, and the group list for that session. The
`struct confd_authorization_ctx` is defined as:

<div class="informalexample">

``` c
struct confd_authorization_ctx {
    struct confd_user_info *uinfo;
    int ngroups;
    char **groups;
    struct confd_daemon_ctx *dx;
    /* ConfD internal fields */
    int result;
    int query_ref;
};
```

</div>

`chk_cmd_access()`  
> This callback is invoked for command authorization, i.e. it
> corresponds to the rules under /aaa/authorization/cmdrules in the AAA
> data model. `cmdtokens` is an array of `ntokens` NUL-terminated
> strings representing the command to be checked, corresponding to the
> command leaf in the cmdrule list. If /confdConfig/cli/modeInfoInAAA is
> enabled in `confd.conf` (see [confd.conf(5)](ncs.conf.5.md)), mode
> names will be prepended in the `cmdtokens` array. The `cmdop`
> parameter gives the operation, corresponding to the ops leaf in the
> cmdrule list. The possible values for `cmdop` are:
>
> `CONFD_ACCESS_OP_READ`  
> > Read access. The CLI will use this during command completion, to
> > filter out alternatives that are disallowed by AAA.
>
> `CONFD_ACCESS_OP_EXECUTE`  
> > Execute access. This is used when a command is about to be executed.
>
> > [!NOTE]
> > This callback may be invoked with `actx->uinfo == NULL`, meaning
> > that no user session has been established for the user yet. This
> > will occur e.g. when the CLI checks whether a user attempting to log
> > in is allowed to (implicitly) execute the command "request system
> > logout user" (J-CLI) or "logout" (C/I-CLI) when the maximum number
> > of sessions has already been reached (if allowed, the CLI will ask
> > whether the user wants to terminate one of the existing sessions).

`chk_data_access()`  
> This callback is invoked for data authorization, i.e. it corresponds
> to the rules under /aaa/authorization/datarules in the AAA data model.
> `hashed_ns` and `hkp` give the namespace and hkeypath of the data node
> to be checked, corresponding to the namespace and keypath leafs in the
> datarule list. The `hkp` parameter may be NULL, which means that
> access to the entire namespace given by `hashed_ns` is requested. When
> a hkeypath is provided, some key elements in the path may be without
> key values (i.e. hkp-\>v\[n\]\[0\].type == C_NOEXISTS). This indicates
> "wildcard" keys, used for CLI tab completion when keys are not fully
> specified. The `dataop` parameter gives the operation, corresponding
> the ops leaf in the datarule list. The possible values for `dataop`
> are:
>
> `CONFD_ACCESS_OP_READ`  
> > Read access.
>
> `CONFD_ACCESS_OP_EXECUTE`  
> > Execute access.
>
> `CONFD_ACCESS_OP_CREATE`  
> > Create access.
>
> `CONFD_ACCESS_OP_UPDATE`  
> > Update access.
>
> `CONFD_ACCESS_OP_DELETE`  
> > Delete access.
>
> `CONFD_ACCESS_OP_WRITE`  
> > Write access. This is used when the specific write operation
> > (create/update/delete) isn't known yet, e.g. in CLI command
> > completion or processing of a NETCONF `edit-config`.
>
> The `how` parameter is one of:
>
> `CONFD_ACCESS_CHK_INTERMEDIATE`  
> > Access to the given data node *or* its descendants is requested.
> > This is used e.g. in CLI command completion or processing of a
> > NETCONF `edit-config`.
>
> `CONFD_ACCESS_CHK_FINAL`  
> > Access to the specific data node is requested.
>
> `CONFD_ACCESS_CHK_DESCENDANT`  
> > Access to the descendants of given data node is requested. For
> > example this is used in CLI completion or processing of a NETCONF
> > `edit-config`.

<!-- -->

    int confd_access_reply_result(
    struct confd_authorization_ctx *actx, int result);

The callbacks must call this function to report the result of the access
check to ConfD, and should normally return CONFD_OK. If any other value
is returned, it will cause the access check to be rejected. The `actx`
parameter is the pointer to the authorization context passed in the
callback invocation, and `result` must be one of:

`CONFD_ACCESS_RESULT_ACCEPT`  
> The access is allowed. This is a "final verdict", analogous to a "full
> match" when the AAA rules are used.

`CONFD_ACCESS_RESULT_REJECT`  
> The access is denied.

`CONFD_ACCESS_RESULT_CONTINUE`  
> The access is allowed "so far". I.e. access to sub-elements is not
> necessarily allowed. This result is mainly useful when
> `chk_cmd_access()` is called with `cmdop` == `CONFD_ACCESS_OP_READ` or
> `chk_data_access()` is called with `how` ==
> `CONFD_ACCESS_CHK_INTERMEDIATE`.

`CONFD_ACCESS_RESULT_DEFAULT`  
> The request should be handled according to the rules configured in the
> AAA data model.

<!-- -->

    int confd_authorization_set_timeout(
    struct confd_authorization_ctx *actx, int timeout_secs);

The authorization callbacks are invoked on the daemon control socket,
and as such are expected to complete quickly, within the timeout
specified for /confdConfig/capi/newSessionTimeout. However in case they
send requests to a remote server, and such a request needs to be
retried, this function can be used to extend the timeout for the current
callback invocation. The timeout is given in seconds from the point in
time when the function is called.

## Error Formatting Callback

It is possible to register a callback function to generate customized
error messages for ConfD's internally generated errors. All the
customizable errors are defined with a type and a code in the XML
document `$CONFD_DIR/src/confd/errors/errcode.xml` in the ConfD release.
To use this functionality, the application must `#include` the file
`confd_errcode.h`, which defines C constants for the types and codes.

    int confd_register_error_cb(
    struct confd_daemon_ctx *dx, const struct confd_error_cb *ecb);

Registers the error formatting callback. The `struct confd_error_cb` is
defined as:

<div class="informalexample">

``` c
struct confd_error_cb {
    int error_types;
    void (*format_error)(struct confd_user_info *uinfo,
                         struct confd_errinfo *errinfo, char *default_msg);
};
```

</div>

The `error_types` element is the logical OR of the error types that the
callback should handle. An application daemon can only register one
error formatting callback, and only one daemon can register for each
error type. The available types are:

`CONFD_ERRTYPE_VALIDATION`  
> Errors detected by ConfD's internal semantic validation of the data
> model constraints, e.g. mandatory elements that are unset, dangling
> references, etc. The codes for this type are the `confd_errno` values
> corresponding to the validation errors, as resulting e.g. from a call
> to `maapi_apply_trans()` (see
> [confd_lib_maapi(3)](confd_lib_maapi.3.md)). I.e. CONFD_ERR_NOTSET,
> CONFD_ERR_BAD_KEYREF, etc - see the 'id' attribute in `errcode.xml`.

`CONFD_ERRTYPE_BAD_VALUE`  
> Type errors, i.e. errors generated when an invalid value is given for
> a leaf in the data model. The codes for this type are defined in
> `confd_errcode.h` as CONFD_BAD_VALUE_XXX, where "XXX" is the
> all-uppercase form of the code name given in `errcode.xml`.

`CONFD_ERRTYPE_CLI`  
> CLI-specific errors. The codes for this type are defined in
> `confd_errcode.h` as CONFD_CLI_XXX in the same way as for
> `CONFD_ERRTYPE_BAD_VALUE`.

`CONFD_ERRTYPE_MISC`  
> Miscellaneous errors, which do not fit into the other categories. The
> codes for this type are defined in `confd_errcode.h` as CONFD_MISC_XXX
> in the same way as for `CONFD_ERRTYPE_BAD_VALUE`.

`CONFD_ERRTYPE_NCS`  
> NCS errors, which is a broad class of errors, ranging from
> authentication failures towards devices to case errors. The codes for
> this type are defined in `confd_errcode.h` as CONFD_NCS_XXX in the
> same way as for `CONFD_ERRTYPE_BAD_VALUE`.

`CONFD_ERRTYPE_OPERATION`  
> The same set of errors and codes as for `CONFD_ERRTYPE_VALIDATION`,
> but detected in validation of input parameters for an rpc or action.

The `format_error()` callback is invoked with a pointer to a
`struct confd_errinfo`, which gives the error type and type-specific
structured information about the details of the error. It is defined as:

<div class="informalexample">

``` c
struct confd_errinfo {
    int type;  /* CONFD_ERRTYPE_XXX */
    union {
        struct confd_errinfo_validation validation;
        struct confd_errinfo_bad_value bad_value;
        struct confd_errinfo_cli cli;
        struct confd_errinfo_misc misc;
#ifdef CONFD_C_PRODUCT_NCS
        struct confd_errinfo_ncs ncs;
#endif
    } info;
};
```

</div>

For `CONFD_ERRTYPE_VALIDATION` and `CONFD_ERRTYPE_OPERATION`, the
`struct confd_errinfo_validation validation` gives the detailed
information, using an `info` union that has a specific struct member for
each code:

<div class="informalexample">

``` c
struct confd_errinfo_validation {
    int code;  /* CONFD_ERR_NOTSET, CONFD_ERR_TOO_FEW_ELEMS, ... */
    union {
        struct {
            /* the element given by kp is not set */
            confd_hkeypath_t *kp;
        } notset;
        struct {
            /* kp has n instances, must be at least min */
            confd_hkeypath_t *kp;
            int n, min;
        } too_few_elems;
        struct {
            /* kp has n instances, must be at most max */
            confd_hkeypath_t *kp;
            int n, max;
        } too_many_elems;
        struct {
            /* the elements given by kps1 have the same set
               of values vals as the elements given by kps2
               (kps1, kps2, and vals point to n_elems long arrays) */
            int n_elems;
            confd_hkeypath_t *kps1;
            confd_hkeypath_t *kps2;
            confd_value_t *vals;
        } non_unique;
        struct {
            /* the element given by kp references
               the non-existing element given by ref
               Note: 'ref' may be NULL or have key elements without values
               (ref->v[n][0].type == C_NOEXISTS) if it cannot be instantiated */
            confd_hkeypath_t *kp;
            confd_hkeypath_t *ref;
        } bad_keyref;
        struct {
            /* the mandatory 'choice' statement choice in the
               container kp does not have a selected 'case' */
            confd_value_t *choice;
            confd_hkeypath_t *kp;
        } unset_choice;
        struct {
            /* the 'must' expression expr for element kp is not satisfied
               - error_message and and error_app_tag are NULL if not given
               in the 'must'; val points to the value of the element if it
               has one, otherwise it is NULL */
            char *expr;
            confd_hkeypath_t *kp;
            char *error_message;
            char *error_app_tag;
            confd_value_t *val;
        } must_failed;
        struct {
            /* the element kp has the instance-identifier value instance,
               which doesn't exist, but require-instance is 'true' */
            confd_hkeypath_t *kp;
            confd_hkeypath_t *instance;
        } missing_instance;
        struct {
            /* the element kp has the instance-identifier value instance,
               which doesn't conform to the specified path filters */
            confd_hkeypath_t *kp;
            confd_hkeypath_t *instance;
        } invalid_instance;
        struct {
            /* the element kp has the instance-identifier value instance,
               which has stale data after upgrading, and require-instance
               is 'true' */
            confd_hkeypath_t *kp;
            confd_hkeypath_t *instance;
        } stale_instance;
        struct {
            /* the expression for a configuration policy rule evaluated to
               'false' - error_message is the associated error message */
            char *error_message;
        } policy_failed;
        struct {
            /* the XPath expression expr, for the configuration policy
               rule with key name, could not be compiled due to msg */
            char *name;
            char *expr;
            char *msg;
        } policy_compilation_failed;
        struct {
            /* the expression expr, for the configuration policy rule
               with key name, failed XPath evaluation due to msg */
            char *name;
            char *expr;
            char *msg;
        } policy_evaluation_failed;
    } info;
    /* These are only provided for CONFD_ERRTYPE_VALIDATION */
    int test;            /* 1 if 'validate', 0 if 'commit' */
    struct confd_trans_ctx *tctx; /* only valid for duration of callback */
};
```

</div>

The member structs are named as the `confd_errno` values that are used
for the `code` elements, i.e. `notset` for CONFD_ERR_NOTSET, etc. For
`CONFD_ERRTYPE_VALIDATION`, the callback also has full information about
the transaction that failed validation via the
`struct confd_trans_ctx *tctx` element - it is even possible to use
`maapi_attach()` (see [confd_lib_maapi(3)](confd_lib_maapi.3.md)) to
attach to the transaction and read arbitrary data from it, in case the
data directly related to the error (as given in the code-specific
struct) is not sufficient.

For the other error types, the corresponding `confd_errinfo_xxx` struct
gives the code and an array with the parameters for the default error
message, as defined by the \<fmt\> element in `errcode.xml`:

<div class="informalexample">

``` c
enum confd_errinfo_ptype {
    CONFD_ERRINFO_KEYPATH,
    CONFD_ERRINFO_STRING
};
```

``` c
struct confd_errinfo_param {
    enum confd_errinfo_ptype type;
    union {
        confd_hkeypath_t *kp;
        char *str;
    } val;
};
```

``` c
struct confd_errinfo_bad_value {
    int code;
    int n_params;
    struct confd_errinfo_param *params;
};
```

</div>

The parameters in the `params` array are given in the order they appear
in the \<fmt\> specification. Parameters that are specified as `{path}`
have `params[n].type` set to `CONFD_ERRINFO_KEYPATH`, and are
represented as a `confd_hkeypath_t` that can be accessed via
`params[n].val.kp`. All other parameters are represented as strings,
i.e. `params[n].type` is `CONFD_ERRINFO_STR` and the string value can be
accessed via `params[n].val.str`. The `struct confd_errinfo_cli cli` and
`struct confd_errinfo_misc misc` union members have the same form as
`struct confd_errinfo_bad_value` shown above.

Finally, the `default_msg` callback parameter gives the default error
message that will be reported to the user if the `format_error()`
function does not generate a replacement.

    void confd_error_seterr(
    struct confd_user_info *uinfo, const char *fmt, ...);

This function must be called by `format_error()` to provide a
replacement of the default error message. If `format_error()` returns
without calling `confd_error_seterr()`, the default message will be
used.

Here is an example that targets a specific validation error for a
specific element in the data model. For this case only, it replaces
ConfD's internally generated messages of the form:

`"too many 'protocol bgp', 2 configured, at most 1 must be configured"`

with

`"Only 1 bgp instance is supported, cannot define 2"`

<div class="informalexample">

    #include <confd_lib.h>
    #include <confd_dp.h>
    #include <confd_errcode.h>
    .
    .
    int main(int argc, char **argv)
    {
         struct confd_error_cb ecb;
         .
         .
         memset(&ecb, 0, sizeof(ecb));
         ecb.error_types = CONFD_ERRTYPE_VALIDATION;
         ecb.format_error = format_error;
         if (confd_register_error_cb(dctx, &ecb) != CONFD_OK)
              confd_fatal("Couldn't register error callback\n");
         .
    }

    static void format_error(struct confd_user_info *uinfo,
                             struct confd_errinfo *errinfo,
                             char *default_msg)
    {
         struct confd_errinfo_validation *err;
         confd_hkeypath_t *kp;

         err = &errinfo->info.validation;
         if (err->code == CONFD_ERR_TOO_MANY_ELEMS) {
              kp = err->info.too_many_elems.kp;
              if (CONFD_GET_XMLTAG(&kp->v[0][0]) == myns_bgp &&
                  CONFD_GET_XMLTAG(&kp->v[1][0]) == myns_protocol) {
                  confd_error_seterr(uinfo,
                                     "Only %d bgp instance is supported, "
                                     "cannot define %d",
                                     err->info.too_many_elems.max,
                                     err->info.too_many_elems.n);
              }
         }
    }

</div>

The CLI-specific "Aborted: " prefix is not included in the message for
this error type - if we wanted to replace that too, we could include the
`CONFD_ERRTYPE_CLI` error type in the registration and process the
`CONFD_CLI_COMMAND_ABORTED` error code for this type, see `errcode.xml`.

## See Also

`confd.conf(5)` - ConfD daemon configuration file format

The ConfD User Guide
