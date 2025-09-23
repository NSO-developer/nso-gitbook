# confd_lib_cdb Man Page

`confd_lib_cdb` - library for connecting to NSO built-in XML database
(CDB)

## Synopsis

    #include <confd_lib.h>
    #include <confd_cdb.h>

    int cdb_connect(
    int sock, enum cdb_sock_type type, const struct sockaddr *srv, int srv_sz);

    int cdb_connect_name(
    int sock, enum cdb_sock_type type, const struct sockaddr *srv, int srv_sz, 
    const char *name);

    int cdb_mandatory_subscriber(
    int sock, const char *name);

    int cdb_set_namespace(
    int sock, int hashed_ns);

    int cdb_end_session(
    int sock);

    int cdb_start_session(
    int sock, enum cdb_db_type db);

    int cdb_start_session2(
    int sock, enum cdb_db_type db, int flags);

    int cdb_close(
    int sock);

    int cdb_wait_start(
    int sock);

    int cdb_get_phase(
    int sock, struct cdb_phase *phase);

    int cdb_get_txid(
    int sock, struct cdb_txid *txid);

    int cdb_initiate_journal_compaction(
    int sock);

    int cdb_initiate_journal_dbfile_compaction(
    int sock, enum cdb_dbfile_type dbfile);

    int cdb_get_compaction_info(
    int sock, enum cdb_dbfile_type dbfile, struct cdb_compaction_info *info);

    int cdb_get_user_session(
    int sock);

    int cdb_get_transaction_handle(
    int sock);

    int cdb_set_timeout(
    int sock, int timeout_secs);

    int cdb_exists(
    int sock, const char *fmt, ...);

    int cdb_cd(
    int sock, const char *fmt, ...);

    int cdb_pushd(
    int sock, const char *fmt, ...);

    int cdb_popd(
    int sock);

    int cdb_getcwd(
    int sock, size_t strsz, char *curdir);

    int cdb_getcwd_kpath(
    int sock, confd_hkeypath_t **kp);

    int cdb_num_instances(
    int sock, const char *fmt, ...);

    int cdb_next_index(
    int sock, const char *fmt, ...);

    int cdb_index(
    int sock, const char *fmt, ...);

    int cdb_is_default(
    int sock, const char *fmt, ...);

    int cdb_subscribe2(
    int sock, enum cdb_sub_type type, int flags, int priority, int *spoint, 
    int nspace, const char *fmt, ...);

    int cdb_subscribe(
    int sock, int priority, int nspace, int *spoint, const char *fmt, ...);

    int cdb_oper_subscribe(
    int sock, int nspace, int *spoint, const char *fmt, ...);

    int cdb_subscribe_done(
    int sock);

    int cdb_trigger_subscriptions(
    int sock, int sub_points[], int len);

    int cdb_trigger_oper_subscriptions(
    int sock, int sub_points[], int len, int flags);

    int cdb_diff_match(
    int sock, int subid, struct xml_tag tags[], int tagslen);

    int cdb_read_subscription_socket(
    int sock, int sub_points[], int *resultlen);

    int cdb_read_subscription_socket2(
    int sock, enum cdb_sub_notification *type, int *flags, int *subpoints[], 
    int *resultlen);

    int cdb_replay_subscriptions(
    int sock, struct cdb_txid *txid, int sub_points[], int len);

    int cdb_get_replay_txids(
    int sock, struct cdb_txid **txid, int *resultlen);

    int cdb_diff_iterate(
    int sock, int subid, enum cdb_iter_ret (*iter
          kp, enum cdb_iter_op op, 
    confd_value_t *oldv, confd_value_t *newv, void *state, int flags, void *initstate);

    int cdb_diff_iterate_resume(
    int sock, enum cdb_iter_ret reply, enum cdb_iter_ret (*iter
          kp, 
    enum cdb_iter_op op, confd_value_t *oldv, confd_value_t *newv, void *state, 
    void *resumestate);

    int cdb_get_modifications(
    int sock, int subid, int flags, confd_tag_value_t **values, int *nvalues, 
    const char *fmt, ...);

    int cdb_get_modifications_iter(
    int sock, int flags, confd_tag_value_t **values, int *nvalues);

    int cdb_get_modifications_cli(
    int sock, int subid, int flags, char **str);

    int cdb_sync_subscription_socket(
    int sock, enum cdb_subscription_sync_type st);

    int cdb_sub_progress(
    int sock, const char *fmt, ...);

    int cdb_sub_abort_trans(
    int sock, enum confd_errcode code, uint32_t apptag_ns, uint32_t apptag_tag, 
    const char *fmt);

    int cdb_sub_abort_trans_info(
    int sock, enum confd_errcode code, uint32_t apptag_ns, uint32_t apptag_tag, 
    const confd_tag_value_t *error_info, int n, const char *fmt);

    int cdb_get_case(
    int sock, const char *choice, confd_value_t *rcase, const char *fmt, ...);

    int cdb_get(
    int sock, confd_value_t *v, const char *fmt, ...);

    int cdb_get_int8(
    int sock, int8_t *rval, const char *fmt, ...);

    int cdb_get_int16(
    int sock, int16_t *rval, const char *fmt, ...);

    int cdb_get_int32(
    int sock, int32_t *rval, const char *fmt, ...);

    int cdb_get_int64(
    int sock, int64_t *rval, const char *fmt, ...);

    int cdb_get_u_int8(
    int sock, uint8_t *rval, const char *fmt, ...);

    int cdb_get_u_int16(
    int sock, uint16_t *rval, const char *fmt, ...);

    int cdb_get_u_int32(
    int sock, uint32_t *rval, const char *fmt, ...);

    int cdb_get_u_int64(
    int sock, uint64_t *rval, const char *fmt, ...);

    int cdb_get_bit32(
    int sock, uint32_t *rval, const char *fmt, ...);

    int cdb_get_bit64(
    int sock, uint64_t *rval, const char *fmt, ...);

    int cdb_get_bitbig(
    int sock, unsigned char **rval, int *bufsiz, const char *fmt, ...);

    int cdb_get_ipv4(
    int sock, struct in_addr *rval, const char *fmt, ...);

    int cdb_get_ipv6(
    int sock, struct in6_addr *rval, const char *fmt, ...);

    int cdb_get_double(
    int sock, double *rval, const char *fmt, ...);

    int cdb_get_bool(
    int sock, int *rval, const char *fmt, ...);

    int cdb_get_datetime(
    int sock, struct confd_datetime *rval, const char *fmt, ...);

    int cdb_get_date(
    int sock, struct confd_date *rval, const char *fmt, ...);

    int cdb_get_time(
    int sock, struct confd_time *rval, const char *fmt, ...);

    int cdb_get_duration(
    int sock, struct confd_duration *rval, const char *fmt, ...);

    int cdb_get_enum_value(
    int sock, int32_t *rval, const char *fmt, ...);

    int cdb_get_objectref(
    int sock, confd_hkeypath_t **rval, const char *fmt, ...);

    int cdb_get_oid(
    int sock, struct confd_snmp_oid **rval, const char *fmt, ...);

    int cdb_get_buf(
    int sock, unsigned char **rval, int *bufsiz, const char *fmt, ...);

    int cdb_get_buf2(
    int sock, unsigned char *rval, int *n, const char *fmt, ...);

    int cdb_get_str(
    int sock, char *rval, int n, const char *fmt, ...);

    int cdb_get_binary(
    int sock, unsigned char **rval, int *bufsiz, const char *fmt, ...);

    int cdb_get_hexstr(
    int sock, unsigned char **rval, int *bufsiz, const char *fmt, ...);

    int cdb_get_qname(
    int sock, unsigned char **prefix, int *prefixsz, unsigned char **name, 
    int *namesz, const char *fmt, ...);

    int cdb_get_list(
    int sock, confd_value_t **values, int *n, const char *fmt, ...);

    int cdb_get_ipv4prefix(
    int sock, struct confd_ipv4_prefix *rval, const char *fmt, ...);

    int cdb_get_ipv6prefix(
    int sock, struct confd_ipv6_prefix *rval, const char *fmt, ...);

    int cdb_get_decimal64(
    int sock, struct confd_decimal64 *rval, const char *fmt, ...);

    int cdb_get_identityref(
    int sock, struct confd_identityref *rval, const char *fmt, ...);

    int cdb_get_ipv4_and_plen(
    int sock, struct confd_ipv4_prefix *rval, const char *fmt, ...);

    int cdb_get_ipv6_and_plen(
    int sock, struct confd_ipv6_prefix *rval, const char *fmt, ...);

    int cdb_get_dquad(
    int sock, struct confd_dotted_quad *rval, const char *fmt, ...);

    int cdb_vget(
    int sock, confd_value_t *v, const char *fmt, va_list args);

    int cdb_get_object(
    int sock, confd_value_t *values, int n, const char *fmt, ...);

    int cdb_get_objects(
    int sock, confd_value_t *values, int n, int ix, int nobj, const char *fmt, 
    ...);

    int cdb_get_values(
    int sock, confd_tag_value_t *values, int n, const char *fmt, ...);

    int cdb_get_attrs(
    int sock, uint32_t *attrs, int num_attrs, confd_attr_value_t **attr_vals, 
    int *num_vals, const char *fmt, ...);

    int cdb_set_attr(
    int sock, uint32_t attr, confd_value_t *v, const char *fmt, ...);

    int cdb_set_elem(
    int sock, confd_value_t *val, const char *fmt, ...);

    int cdb_set_elem2(
    int sock, const char *strval, const char *fmt, ...);

    int cdb_vset_elem(
    int sock, confd_value_t *val, const char *fmt, va_list args);

    int cdb_set_case(
    int sock, const char *choice, const char *scase, const char *fmt, ...);

    int cdb_create(
    int sock, const char *fmt, ...);

    int cdb_delete(
    int sock, const char *fmt, ...);

    int cdb_set_object(
    int sock, const confd_value_t *values, int n, const char *fmt, ...);

    int cdb_set_values(
    int sock, const confd_tag_value_t *values, int n, const char *fmt, ...);

    struct confd_cs_node *cdb_cs_node_cd(
    int sock, const char *fmt, ...);

## Library

NSO Library, (`libconfd`, `-lconfd`)

## Description

The `libconfd` shared library is used to connect to the NSO built-in XML
database, CDB. The purpose of this API is to provide a read and
subscription API to CDB.

CDB owns and stores the configuration data and the user of the API wants
to read that configuration data and also get notified when someone
through either NETCONF, SNMP, the CLI, the Web UI or the MAAPI modifies
the data so that the application can re-read the configuration data and
act accordingly.

CDB can also store operational data, i.e. data which is designated with
a `"config false"` statement in the YANG data model. Operational data
can be both read and written by the applications, but NETCONF and the
other northbound agents can only read the operational data.

## Paths

The majority of the functions described here take as their two last
arguments a format string and a variable number of extra arguments as
in: `char *``fmt`, `...``);`

The `fmt` is a printf style format string which is used to format a path
into the XML data tree. Assume the following YANG fragment:

<div class="informalexample">

    container hosts {
      list host {
        key name;
        leaf name {
          type string;
        }
        leaf domain {
          type string;
        }
        leaf defgw {
          type inet:ipv4-address;
        }
        container interfaces {
          list interface {
            key name;
            leaf name {
              type string;
            }
            leaf ip {
              type inet:ipv4-address;
            }
            leaf mask {
              type inet:ipv4-address;
            }
            leaf enabled {
              type boolean;
            }
          }
        }
      }
    }

</div>

Furthermore, assuming our database is populated with the following data.

<div class="informalexample">

    <hosts xmlns="http://example.com/ns/hst/1.0">
      <host>
        <name>buzz</name>
        <domain>tail-f.com</domain>
        <defgw>192.168.1.1</defgw>
        <interfaces>
          <interface>
            <name>eth0</name>
            <ip>192.168.1.61</ip>
            <mask>255.255.255.0</mask>
            <enabled>true</enabled>
          </interface>
          <interface>
            <name>eth1</name>
            <ip>10.77.1.44</ip>
            <mask>255.255.0.0</mask>
            <enabled>false</enabled>
          </interface>
        </interfaces>
      </host>
    </hosts>

</div>

The format path /hosts/host{buzz}/defgw refers to the leaf called defgw
of the host whose key (name leaf) is `buzz`.

The format path /hosts/host{buzz}/interfaces/interface{eth0}/ip refers
to the leaf called ip in the `eth0` interface of the host called `buzz`.

It is possible loop through all entries in a list as in:

<div class="informalexample">

    n = cdb_num_instances(sock, "/hosts/host");
    for (i=0; i<n; i++) {
        cdb_cd(sock, "/hosts/host[%d]", i)
        .....

</div>

Thus instead of an actually instantiated key inside a pair of curly
braces {key}, we can use a temporary integer key inside a pair of
brackets `[n]`.

We can use the following modifiers:

%d  
> requiring an integer parameter (type `int`) to be substituted.

%u  
> requiring an unsigned integer parameter (type `unsigned int`) to be
> substituted.

%s  
> requiring a `char*` string parameter to be substituted.

%ip4  
> requiring a `struct in_addr*` to be substituted.

%ip6  
> requiring a `struct in6_addr*` to be substituted.

%x  
> requiring a `confd_value_t*` to be substituted.

%\*x  
> requiring an array length and a `confd_value_t*` pointing to an array
> of values to be substituted.

%h  
> requiring a `confd_hkeypath_t*` to be substituted.

%\*h  
> requiring a length and a `confd_hkeypath_t*` to be substituted.

Thus,

<div class="informalexample">

    char *hname = "earth";
    struct in_addr ip;
    ip.s_addr = inet_addr("127.0.0.1");

    cdb_cd(sock, "/hosts/host{%s}/bar{%ip4}", hname, &ip);

</div>

would change the current position to the path:
"/hosts/host{earth}/bar{127.0.0.1}"

It is also possible to use the different '%' modifiers outside the curly
braces, thus the above example could have been written as:

<div class="informalexample">

    char *prefix = "/hosts/host";
    cdb_cd(sock, "%s{%s}/bar{%ip4}", prefix, hname, &ip);

</div>

If an element has multiple keys, the keys must be space separated as in
`cdb_cd("/bars/bar{%s %d}/item", str, i);`. However the '%\*x' modifier
is an exception to this rule, and it is especially useful when we have a
number of key values that are unknown at compile time. If we have a list
foo which is known to have two keys, and we have those keys in an array
`key[]`, we can use `cdb_cd("/foo{%x %x}", &key[0], &key[1]);.` But if
the number of keys is unknown at compile time (or if we just want a more
compact code), we can instead use `cdb_cd("/foo{%*x}", n, key);` where
`n` is the number of keys.

The '%h' and '%\*h' modifiers can only be used at the beginning of a
format path, as they expand to the absolute path corresponding to the
`confd_hkeypath_t`. These modifiers are particularly useful with
`cdb_diff_iterate()` (see below), or for MAAPI access in data provider
callbacks (see [confd_lib_maapi(3)](confd_lib_maapi.3.md) and
[confd_lib_dp(3)](confd_lib_dp.3.md)). The '%\*h' variant allows for
using only the initial part of a `confd_hkeypath_t`, as specified by the
preceding length argument (similar to '%.\*s' for `printf(3)`).

For example, if the `iter()` function passed to `cdb_diff_iterate()` has
been invoked with a `confd_hkeypath_t *kp` that corresponds to
/hosts/host{buzz}, we can read the defgw child element with

<div class="informalexample">

    confd_value_t v;
    cdb_get(s, &v, "%h/defgw", kp);

</div>

or the entire list entry with

<div class="informalexample">

    confd_value_t v[5];
    cdb_get_object(sock, v, 5, "%h", kp);

</div>

or the defgw child element for host `mars` with

<div class="informalexample">

    confd_value_t v;
    cdb_get(s, &v, "%*h{mars}/defgw", kp->len - 1, kp);

</div>

All the functions that take a path on this form also have a `va_list`
variant, of the same form as `cdb_vget()` and `cdb_vset_elem()`, which
are the only ones explicitly documented below. I.e. they have a prefix
"cdb_v" instead of "cdb\_", and take a single va_list argument instead
of a variable number of arguments.

## Functions

All functions return CONFD_OK (0), CONFD_ERR (-1) or CONFD_EOF (-2)
unless otherwise stated. CONFD_EOF means that the socket to NSO has been
closed.

Whenever CONFD_ERR is returned from any API function described here, it
is possible to obtain additional information on the error through the
symbol `confd_errno`, see the [ERRORS](confd_lib_lib.3.md#errors)
section in the [confd_lib_lib(3)](confd_lib_lib.3.md) manual page.

    int cdb_connect(
    int sock, enum cdb_sock_type type, const struct sockaddr *srv, int srv_sz);

The application has to connect to NSO before it can interact. There are
two different types of connections identified by `cdb_sock_type`:

`CDB_DATA_SOCKET`  
> This is a socket which is used to read configuration data, or to read
> and write operational data.

`CDB_SUBSCRIPTION_SOCKET`  
> This is a socket which is used to receive notifications about updates
> to the database. A subscription socket needs to be part of the
> application poll set.

Additionally the type CDB_READ_SOCKET is accepted for backwards
compatibility - it is equivalent to CDB_DATA_SOCKET.

A call to `cdb_connect()` is typically followed by a call to either
`cdb_start_session()` for a reading session or a call to
`cdb_subscribe()` for a subscription socket.

<div class="note">

If this call fails (i.e. does not return CONFD_OK), the socket
descriptor must be closed and a new socket created before the call is
re-attempted.

</div>

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS

    int cdb_connect_name(
    int sock, enum cdb_sock_type type, const struct sockaddr *srv, int srv_sz, 
    const char *name);

When we use `cdb_connect()` to create a connection to NSO/CDB, the
`name` parameter passed to the library initialization function
`confd_init()` (see [confd_lib_lib(3)](confd_lib_lib.3.md)) is used to
identify the connection in status reports and logs. If we want different
names to be used for different connections from the same application
process, we can use `cdb_connect_name()` with the wanted name instead of
`cdb_connect()`.

<div class="note">

If this call fails (i.e. does not return CONFD_OK), the socket
descriptor must be closed and a new socket created before the call is
re-attempted.

</div>

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS

    int cdb_mandatory_subscriber(
    int sock, const char *name);

Attaches a mandatory attribute and a mandatory name to the subscriber
identified by `sock`. The `name` parameter is distinct from the name
parameter in `cdb_connect_name`.

CDB keeps a list of mandatory subscribers for infinite extent, i.e.
until confd is restarted. The function is idempotent.

Absence of one or more mandatory subscribers will result in abort of all
transactions. A mandatory subscriber must be present during the entire
PREPARE delivery phase.

If a mandatory subscriber crashes during a PREPARE delivery phase, the
subscriber should be restarted and the commit operation should be
retried.

A mandatory subscriber is present if the subscriber has issued at least
one `cdb_subscribe2()` call followed by a `cdb_subscribe_done()` call.

A call to `cdb_mandatory_subscriber()` is only allowed before the first
call of `cdb_subscribe2()`.

<div class="note">

Only applicable for two-phase subscribers.

</div>

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS

    int cdb_set_namespace(
    int sock, int hashed_ns);

If we want to access data in CDB where the toplevel element name is not
unique, we need to set the namespace. We are reading data related to a
specific .fxs file. confdc can be used to generate a `.h` file with a
\#define for the namespace, by the flag `--emit-h` to confdc (see
[confdc(1)](confdc.1.md)).

It is also possible to indicate which namespace to use through the
namespace prefix when we read and write data. Thus the path /foo:bar/baz
will get us /bar/baz in the namespace with prefix "foo" regardless of
what the "set" namespace is. And if there is only one toplevel element
called "bar" across all namespaces, we can use /bar/baz without the
prefix and without calling `cdb_set_namespace()`.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int cdb_end_session(
    int sock);

We use `cdb_connect()` to establish a read socket to CDB. When the
socket is closed, the read session is ended. We can reuse the same
socket for another read session, but we must then end the session and
create another session using `cdb_start_session()`.

While we have a live CDB read session for configuration data, CDB is
normally locked for writing. Thus all external entities trying to modify
CDB are blocked as long as we have an open CDB read session. It is very
important that we remember to either `cdb_end_session()` or
`cdb_close()` once we have read what we wish to read.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

    int cdb_start_session(
    int sock, enum cdb_db_type db);

Starts a new session on an already established socket to CDB. The db
parameter should be one of:

`CDB_RUNNING`  
> Creates a read session towards the running database.

`CDB_PRE_COMMIT_RUNNING`  
> Creates a read session towards the running database as it was before
> the current transaction was committed. This is only possible between a
> subscription notification and the final
> `cdb_sync_subscription_socket()`. At any other time trying to call
> `cdb_start_session()` will fail with confd_errno set to
> CONFD_ERR_NOEXISTS.
>
> In the case of a `CDB_SUB_PREPARE` subscription notification a session
> towards `CDB_PRE_COMMIT_RUNNING` will (in spite of the name) will
> return values as they were *before the transaction which is about to
> be committed* took place. This means that if you want to read the new
> values during a `CDB_SUB_PREPARE` subscription notification you need
> to create a session towards `CDB_RUNNING`. However, since it is locked
> the session needs to be started in lockless mode using
> `cdb_start_session2()`. So for example:
>
> <div class="informalexample">
>
>     cdb_read_subscription_socket2(ss, &type, &flags, &subp, &len);
>     /* ... */
>     switch (type) {
>     case CDB_SUB_PREPARE:
>         /* Set up a lockless session to read new values: */
>         cdb_start_session2(s, CDB_RUNNING, 0);
>         read_new_config(s);
>         cdb_end_session(s);
>         cdb_sync_subscription_socket(ss, CDB_DONE_PRIORITY);
>         break;
>         /* ... */
>
> </div>

`CDB_STARTUP`  
> Creates a read session towards the startup database.

`CDB_OPERATIONAL`  
> Creates a read/write session towards the operational database. For
> further details about working with operational data in CDB, see the
> `OPERATIONAL DATA` section below.
>
> <div class="note">
>
> Subscriptions on operational data will not be triggered from a session
> created with this function - to trigger operational data
> subscriptions, we need to use `cdb_start_session2()`, see below.
>
> </div>

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_LOCKED,
CONFD_ERR_NOEXISTS

If the error is CONFD_ERR_LOCKED it means that we are trying to create a
new CDB read session precisely when the write phase of some transaction
is occurring. Thus correct usage of `cdb_start_session()` is:

<div class="informalexample">

     while (1) {
       if (cdb_start_session(sock, CDB_RUNNING) == CONFD_OK)
          break;
       if (confd_errno == CONFD_ERR_LOCKED) {
          sleep(1);
          continue;
       }
       .... handle error
    }

</div>

Alternatively we can use `cdb_start_session2()` with `flags` =
CDB_LOCK_SESSION\|CDB_LOCK_WAIT. This means that the call will block
until the lock has been acquired, and thus we do not need the retry
loop.

    int cdb_start_session2(
    int sock, enum cdb_db_type db, int flags);

This function may be used instead of `cdb_start_session()` if it is
considered necessary to have more detailed control over some aspects of
the CDB session - if in doubt, use `cdb_start_session()` instead. The
`sock` and `db` arguments are the same as for `cdb_start_session()`, and
these values can be used for `flags` (ORed together if more than one):

<div class="informalexample">

    #define CDB_LOCK_WAIT     (1 << 0)
    #define CDB_LOCK_SESSION  (1 << 1)
    #define CDB_LOCK_REQUEST  (1 << 2)
    #define CDB_LOCK_PARTIAL  (1 << 3)

</div>

The flags affect sessions for the different database types as follows:

`CDB_RUNNING`  
> CDB_LOCK_SESSION obtains a read lock for the complete session, i.e.
> using this flag alone is equivalent to calling `cdb_start_session()`.
> CDB_LOCK_REQUEST obtains a read lock only for the duration of each
> read request. This means that values of elements read in different
> requests may be inconsistent with each other, and the consequences of
> this must be carefully considered. In particular, the use of
> `cdb_num_instances()` and the `[n]` "integer index" notation in
> keypaths is inherently unsafe in this mode. Note: The implementation
> will not actually obtain a lock for a single-value request, since that
> is an atomic operation anyway. The CDB_LOCK_PARTIAL flag is not
> allowed.

`CDB_STARTUP`  
> Same as CDB_RUNNING.

`CDB_PRE_COMMIT_RUNNING`  
> This database type does not have any locks, which means that it is an
> error to call `cdb_start_session2()` with any CDB_LOCK_XXX flag
> included in `flags`. Using a `flags` value of 0 is equivalent to
> calling `cdb_start_session()`.

`CDB_OPERATIONAL`  
> CDB_LOCK_REQUEST obtains a "subscription lock" for the duration of
> each write request. This can be described as an "advisory exclusive"
> lock, i.e. only one client at a time can hold the lock (unless
> CDB_LOCK_PARTIAL is used), but the lock does not affect clients that
> do not attempt to obtain it. It also does not affect the reading of
> operational data. The purpose of this lock is to indicate that the
> client wants the write operation to generate subscription
> notifications. The lock remains in effect until any/all subscription
> notifications generated as a result of the write has been delivered.
>
> If the CDB_LOCK_PARTIAL flag is used together with CDB_LOCK_REQUEST,
> the "subscription lock" only applies to the smallest data subtree that
> includes all the data in the write request. This means that multiple
> writes that generates subscription notifications, and delivery of the
> corresponding notifications, can proceed in parallel as long as they
> affect disjunct parts of the data tree.
>
> The CDB_LOCK_SESSION flag is not allowed. Using a `flags` value of 0
> is equivalent to calling `cdb_start_session()`.

In all cases of using CDB_LOCK_SESSION or CDB_LOCK_REQUEST described
above, adding the CDB_LOCK_WAIT flag means that instead of failing with
CONFD_ERR_LOCKED if the lock can not be obtained immediately, requests
will wait for the lock to become available. When used with
CDB_LOCK_SESSION it pertains to `cdb_start_session2()` itself, with
CDB_LOCK_REQUEST it pertains to the individual requests.

While it is possible to use this function to start a session towards a
configuration database type with no locking at all (`flags` = 0), this
is strongly discouraged in general, since it means that even the values
read in a single multi-value request (e.g. `cdb_get_object()`, see
below) may be inconsistent with each other. However it is necessary to
do this if we want to have a session open during semantic validation,
see the "Semantic Validation" chapter in the User Guide - and in this
particular case it is safe, since the transaction lock prevents changes
to CDB during validation.

Reading operational data from CDB while there is an ongoing transaction,
CDB will by default read through the transaction, returning the value
from the transaction if it is being modified. By giving the
CDB_READ_COMMITTED flag this behaviour can be overridden in the
operational datastore, such that the value already committed to the
datastore is read.

<div class="informalexample">

                #define CDB_READ_COMMITTED  (1 << 4)
            

</div>

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_LOCKED,
CONFD_ERR_NOEXISTS, CONFD_ERR_PROTOUSAGE

    int cdb_close(
    int sock);

Closes the socket. `cdb_end_session()` should be called before calling
this function.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS

Even if the call returns an error, the socket will be closed.

    int cdb_wait_start(
    int sock);

This call waits until CDB has completed start-phase 1 and is available,
when it is CONFD_OK is returned. If CDB already is available (i.e.
start-phase \>= 1) the call returns immediately. This can be used by a
CDB client who is not synchronously started and only wants to wait until
it can read its configuration. The call can be used after cdb_connect().

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS

    int cdb_get_phase(
    int sock, struct cdb_phase *phase);

Returns the start-phase CDB is currently in, in the struct cdb_phase
pointed to by the second argument. Also if CDB is in phase 0 and has
initiated an init transaction (to load any init files) the flag
CDB_FLAG_INIT is set in the flags field of struct cdb_phase and
correspondingly if an upgrade session is started the CDB_FLAG_UPGRADE is
set. The call can be used after cdb_connect() and returns CONFD_OK.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS

    int cdb_initiate_journal_compaction(
    int sock);

Normally CDB handles journal compaction of the config datastore
automatically. If this has been turned off (in the configuration file)
then the .cdb files will grow indefinitely unless this API function is
called periodically to initiate compaction. This function initiates a
compaction and returns immediately (if the datastore is unavailable, the
compaction will be delayed, but eventually compaction will take place).
This will also initiate compaction of the operational datastore O.cdb
and snapshot datastore S.cdb but without delay.

*Errors*: -

    int cdb_initiate_journal_dbfile_compaction(
    int sock, enum cdb_dbfile_type dbfile);

Similar to `cdb_initiate_journal_compaction()` but initiates the
compaction on the specified CDB file instead of all CDB files. The
`dbfile` argument is identified by `enum cdb_dbfile_type`. The valid
values for NSO are

`CDB_A_CDB`  
> This is the configuration datastore A.cdb

`CDB_O_CDB`  
> This is the operational datastore O.cdb

`CDB_S_CDB`  
> This is the snapshot datastore S.cdb

*Errors*: CONFD_ERR_PROTOUSAGE

    int cdb_get_compaction_info(
    int sock, enum cdb_dbfile_type dbfile, struct cdb_compaction_info *info);

Returns the compaction information for the specified CDB file pointed to
by the `dbfile` argument, see `cdb_initiate_journal_dbfile_compaction()`
for further information. The result is stored in the `info` argument of
`struct cdb_compaction_info`, containing the current file size, file
size of the dbfile after the last compaction, the number of transactions
since last compaction, as well as the timestamp of the last compaction.

*Errors*: CONFD_ERR_PROTOUSAGE, CONFD_ERR_UNAVAILABLE

    int cdb_get_txid(
    int sock, struct cdb_txid *txid);

Read the last transaction id from CDB. This function can be used if we
are forced to reconnect to CDB, If the transaction id we read is
identical to the last id we had prior to loosing the CDB sockets we
don't have to reload our managed object data. See the User Guide for
full explanation. Returns CONFD_OK on success and CONFD_ERR or CONFD_EOF
on failure.

    int cdb_get_replay_txids(
    int sock, struct cdb_txid **txid, int *resultlen);

When the subscriptionReplay functionality is enabled in confd.conf this
function returns the list of available transactions that CDB can replay.
The current transaction id will be the first in the list, the second at
txid\[1\] and so on. The number of transactions is returned in
`resultlen`. In case there are no replay transactions available (the
feature isn't enabled or there hasn't been any transactions yet) only
one (the current) transaction id is returned. It is up to the caller to
`free()` `txid` when it is no longer needed.

    int cdb_set_timeout(
    int sock, int timeout_secs);

A timeout for client actions can be specified via
/confdConfig/cdb/clientTimeout in `confd.conf`, see the
[confd.conf(5)](ncs.conf.5.md) manual page. This function can be used
to dynamically extend (or shorten) the timeout for the current action.
Thus it is possible to configure a restrictive timeout in `confd.conf`,
but still allow specific actions to have a longer execution time.

The function can be called either with a subscription socket during
subscription delivery on that socket (including from the `iter()`
function passed to `cdb_diff_iterate()`), or with a data socket that has
an active session. The timeout is given in seconds from the point in
time when the function is called.

<div class="note">

The timeout for subscription delivery is common for all the subscribers
receiving notifications at a given priority. Thus calling the function
during subscription delivery changes the timeout for all the subscribers
that are currently processing notifications.

</div>

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_PROTOUSAGE,
CONFD_ERR_BADSTATE

    int cdb_exists(
    int sock, const char *fmt, ...);

Leafs in the data model may be optional, and presence containers and
list entries may or may not exist. This function checks whether a node
exists in CDB. Returns 0 for false, 1 for true and CONFD_ERR or
CONFD_EOF for errors.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADPATH

    int cdb_cd(
    int sock, const char *fmt, ...);

Changes the working directory according to the format path. Note that
this function can not be used as an existence test.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADPATH

    int cdb_pushd(
    int sock, const char *fmt, ...);

Similar to `cdb_cd()` but pushes the previous current directory on a
stack.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSTACK,
CONFD_ERR_BADPATH

    int cdb_popd(
    int sock);

Pops the top element from the directory stack and changes directory to
previous directory.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOSTACK

    int cdb_getcwd(
    int sock, size_t strsz, char *curdir);

Returns the current position as previously set by `cdb_cd()`,
`cdb_pushd()`, or `cdb_popd()` as a string path. Note that what is
returned is a pretty-printed version of the internal representation of
the current position, it will be the shortest unique way to print the
path but it might not exactly match the string given to `cdb_cd()`. The
buffer in \*curdir will be NULL terminated, and no more characters than
strsz-1 will be written to it.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS

    int cdb_getcwd_kpath(
    int sock, confd_hkeypath_t **kp);

Returns the current position like `cdb_getcwd()`, but as a pointer to a
hashed keypath instead of as a string. The hkeypath is dynamically
allocated, and may further contain dynamically allocated elements. The
caller must free the allocated memory, easiest done by calling
`confd_free_hkeypath()`.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS

    int cdb_num_instances(
    int sock, const char *fmt, ...);

Returns the number of entries in a list or leaf-list. On error CONFD_ERR
or CONFD_EOF is returned.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADPATH,
CONFD_ERR_UNAVAILABLE

    int cdb_next_index(
    int sock, const char *fmt, ...);

Given a path to a list entry `cdb_next_index()` returns the position
(starting from 0) of the next entry (regardless of whether the path
exists or not). When the list has multiple keys a `*` may be used for
the last keys to make the path partially instantiated. For example if
/foo/bar has three integer keys, the following pseudo code could be used
to iterate over all entries with `42` as the first key:

<div class="informalexample">

    /* find the first entry of /foo/bar with 42 as first key */
    ix = cdb_next_index(sock, "/foo/bar{42 * *}");
    for (; ix>=0; ix++) {
        int32_t k1 = 0;
        cdb_get_int32(sock, &k1, "/foo/bar[%d]/key1", ix);
        if (k1 != 42) break;
        /* ... do something with /foo/bar[%d] ... */
    }

</div>

If there is no next entry -1 is returned. It is not possible to use this
function on an ordered-by user list. On error CONFD_ERR or CONFD_EOF is
returned.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADPATH,
CONFD_ERR_UNAVAILABLE

    int cdb_index(
    int sock, const char *fmt, ...);

Given a path to a list entry `cdb_index()` returns its position
(starting from 0). On error CONFD_ERR or CONFD_EOF is returned.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADPATH

    int cdb_is_default(
    int sock, const char *fmt, ...);

This function returns 1 for a leaf which has a default value defined in
the data model when no value has been set, i.e. when the default value
is in effect. It returns 0 for other existing leafs, and CONFD_ERR or
CONFD_EOF for errors. There is normally no need to call this function,
since CDB automatically provides the default value as needed when
cdb_get() etc is called.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADPATH,
CONFD_ERR_NOEXISTS, CONFD_ERR_UNAVAILABLE

    int cdb_subscribe(
    int sock, int priority, int nspace, int *spoint, const char *fmt, ...);

Sets up a CDB subscription so that we are notified when CDB
configuration data changes. There can be multiple subscription points
from different sources, that is a single client daemon can have many
subscriptions and there can be many client daemons.

Each subscription point is defined through a path similar to the paths
we use for read operations. We can subscribe either to specific leafs or
entire subtrees. Subscribing to list entries can be done using fully
qualified paths, or tagpaths to match multiple entries. A path which
isn't a leaf element automatically matches the subtree below that path.
When specifying keys to a list entry it is possible to use the wildcard
character \* which will match any key value.

When subscribing to a leaf with a `tailf:default-ref` statement, or to a
subtree with elements that have `tailf:default-ref`, implicit
subscriptions to the referred leafs are added. This means that a change
in a referred leaf will generate a notification for the subscription
that has referring leaf(s) - but currently such a change will not be
reported by `cdb_diff_iterate()`. Thus to get the new "effective" value
of a referring leaf in this case, it is necessary to either read the
value of the leaf with e.g. `cdb_get()` - or to use a subscription that
includes the referred leafs, and use `cdb_diff_iterate()` when a
notification for that subscription is received.

Some examples

/hosts  
> Means that we subscribe to any changes in the subtree - rooted at
> /hosts. This includes additions or removals of host entries as well as
> changes to already existing host entries.

/hosts/host{www}/interfaces/interface{eth0}/ip  
> Means we are notified when host www changes its IP address on eth0.

/hosts/host/interfaces/interface/ip  
> Means we are notified when any host changes any of its IP addresses.

/hosts/host/interfaces  
> Means we are notified when either an interface is added/removed or
> when an individual leaf element in an existing interface is changed.

The `priority` value is an integer. When CDB is changed, the change is
performed inside a transaction. Either a `commit` operation from the CLI
or a `candidate-commit` operation in NETCONF means that the running
database is changed. These changes occur inside a ConfD transaction. CDB
will handle the subscriptions in lock-step priority order. First all
subscribers at the lowest priority are handled, once they all have
replied and synchronized through calls to
`cdb_sync_subscription_socket()` the next set - at the next priority
level is handled by CDB. Priority numbers are global, i.e. if there are
multiple client daemons notifications will still be delivered in
priority order per all subscriptions, not per daemon.

See `cdb_diff_iterate()` and cdb_diff_match() for ways of filtering
subscription notifications and finding out what changed. The easiest way
is though to not use either of the two above mentioned diff function but
to solely rely on the positioning of the subscription points in the tree
to figure out what changed.

`cdb_subscribe()` returns a `subscription point` in the return parameter
`spoint`. This integer value is used to identify this particular
subscription.

Because there can be many subscriptions on the same socket the client
must notify ConfD when it is done subscribing and ready to receive
notifications. This is done using `cdb_subscribe_done()`.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADPATH,
CONFD_ERR_NOEXISTS

    int cdb_oper_subscribe(
    int sock, int nspace, int *spoint, const char *fmt, ...);

Sets up a CDB subscription for changes in the operational data base.
Similar to the subscriptions for configuration data, we can be notified
of changes to the operational data stored in CDB. Note that there are
several differences from the subscriptions for configuration data:

- Notifications are only generated if the writer has taken a
  subscription lock, see `cdb_start_session2()` above.

- Priorities are not used for these notifications.

- It is not possible to receive the previous value for modified leafs in
  `cdb_diff_iterate()`.

- A special synchronization reply must be used when the notifications
  have been read (see `cdb_sync_subscription_socket()` below).

<div class="note">

Operational and configuration subscriptions can be done on the same
socket, but in that case the notifications may be arbitrarily
interleaved, including operational notifications arriving between
different configuration notifications for the same transaction. If this
is a problem, use separate sockets for operational and configuration
subscriptions.

</div>

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADPATH,
CONFD_ERR_NOEXISTS

    int cdb_subscribe2(
    int sock, enum cdb_sub_type type, int flags, int priority, int *spoint, 
    int nspace, const char *fmt, ...);

This function supersedes the current `cdb_subscribe()` and
`cdb_oper_subscribe()` as well as makes it possible to use the new two
phase subscription method. The `cdb_sub_type` is defined as:

<div class="informalexample">

``` c
enum cdb_sub_type {
    CDB_SUB_RUNNING = 1,
    CDB_SUB_RUNNING_TWOPHASE = 2,
    CDB_SUB_OPERATIONAL = 3
};
```

</div>

The CDB subscription type `CDB_SUB_RUNNING` is the same as
`cdb_subscribe()`, `CDB_SUB_OPERATIONAL` is the same as
`cdb_oper_subscribe()`, and `CDB_SUB_RUNNING_TWOPHASE` does a two phase
subscription.

The flags argument should be set to 0, or a combination of:

`CDB_SUB_WANT_ABORT_ON_ABORT`  
> Normally if a subscriber is the one to abort a transaction it will not
> receive an abort notification. This flags means that this subscriber
> wants an abort notification even if it was the one that called
> cdb_sub_abort_trans(). This flag is only valid when the subscription
> type is `CDB_SUB_RUNNING_TWOPHASE`.

The two phase subscriptions work like this: A subscriber uses
`cdb_subscribe2()` with the type set to `CDB_SUB_RUNNING_TWOPHASE` to
register as many subscription points as required. The
`cdb_subscribe_done()` function is used to indicate that no more
subscription points will be registered on that particular socket. Only
after `cdb_subscribe_done()` is called will subscription notifications
be delivered.

Once a transaction enters prepare state all CDB two phase subscribers
will be notified in priority order (lowest priority first, subscribers
with the same priority is delivered in parallel). The
`cdb_read_subscription_socket2()` function will set type to
`CDB_SUB_PREPARE`. Once all subscribers have acknowledged the
notification by using the function
`cdb_sync_subscription_socket(CDB_DONE_PRIORITY)` they will subsequently
be notified when the transaction is committed. The `CDB_SUB_COMMIT`
notification is the same as the current subscription mechanism, so when
a transaction is committed all subscribers will be notified (again in
priority order).

When a transaction is aborted, delivery of any remaining
`CDB_SUB_PREPARE` notifications is cancelled. The subscribers that had
already been notified with `CDB_SUB_PREPARE` will be notified with
`CDB_SUB_ABORT` (This notification will be done in reverse order of the
`CDB_SUB_PREPARE` notification). The transaction could be aborted
because one of the subscribers that received `CDB_SUB_PREPARE` called
`cdb_sub_abort_trans()`, but it could also be caused for other reasons,
for example another data provider (than CDB) can abort the transaction.

<div class="note">

Two phase subscriptions are not supported for NCS.

</div>

<div class="note">

Operational and configuration subscriptions can be done on the same
socket, but in that case the notifications may be arbitrarily
interleaved, including operational notifications arriving between
different configuration notifications for the same transaction. If this
is a problem, use separate sockets for operational and configuration
subscriptions.

</div>

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADPATH,
CONFD_ERR_NOEXISTS

    int cdb_subscribe_done(
    int sock);

When a client is done registering all its subscriptions on a particular
subscription socket it must call `cdb_subscribe_done()`. No
notifications will be delivered until then.

    int cdb_trigger_subscriptions(
    int sock, int sub_points[], int len);

This function makes it possible to trigger CDB subscriptions for
configuration data even though the configuration has not been modified.
The caller will trigger all subscription points passed in the sub_points
array (or all subscribers if the array is of zero length) in priority
order, and the call will not return until the last subscriber has called
cdb_sync_subscription_socket().

The call is blocking and doesn't return until all subscribers have
acknowledged the notification. That means that it is not possible to use
`cdb_trigger_subscriptions()` in a cdb subscriber process (without
forking a process or spawning a thread) since it would cause a deadlock.

The subscription notification generated by this "synthetic" trigger will
seem like a regular subscription notification to a subscription client.
As such, it is possible to use `cdb_diff_iterate()` to traverse the
changeset. CDB will make up this changeset in which all leafs in the
configuration will appear to be set, and all list entries and presence
containers will appear as if they are created.

If the client is a two-phase subscriber, a prepare notification will
first be delivered and if any client aborts this synthetic transaction
further delivery of subscription notification is suspended and an error
is returned to the caller of `cdb_trigger_subscriptions()`. The error is
the result of mapping the CONFD_ERRCODE as set by the aborting client as
described for MAAPI in the [EXTENDED ERROR
REPORTING](confd_lib_lib.3.md#extended_error_reporting) section in the
[confd_lib_lib(3)](confd_lib_lib.3.md) manpage. Note however that the
configuration is still the way it is - so it is up to the caller of
`cdb_trigger_subscriptions()` to take appropriate action (for example:
raising an alarm, restarting a subsystem, or even rebooting the system).

If one or more subscription ids is passed in the subids array that are
not valid, an error (`CONFD_ERR_PROTOUSAGE`) will be returned and no
subscriptions will be triggered. If no subscription ids are passed this
error can not occur (even if there aren't any subscribers).

    int cdb_trigger_oper_subscriptions(
    int sock, int sub_points[], int len, int flags);

This function works like `cdb_trigger_subscriptions()`, but for CDB
subscriptions to operational data. The caller will trigger all
subscription points passed in the `sub_points` array (or all operational
data subscribers if the array is of zero length), and the call will not
return until the last subscriber has called
cdb_sync_subscription_socket().

Since the generation of subscription notifications for operational data
requires that the subscription lock is taken (see
`cdb_start_session2()`), this function implicitly attempts to take a
"global" subscription lock. If the subscription lock is already taken,
the function will by default return CONFD_ERR with `confd_errno` set to
CONFD_ERR_LOCKED. To instead have it wait until the lock becomes
available, CDB_LOCK_WAIT can be passed for the `flags` parameter.

    int cdb_replay_subscriptions(
    int sock, struct cdb_txid *txid, int sub_points[], int len);

This function makes it possible to replay the subscription events for
the last configuration change to some or all CDB subscribers. This call
is useful in a number of recovery scenarios, where some CDB subscribers
lost connection to ConfD before having received all the changes in a
transaction. The replay functionality is only available if it has been
enabled in confd.conf

The caller specifies the transaction id of the last transaction that the
application has completely seen and acted on. This verifies that the
application has only missed (part of) the last transaction. If a
different (older) transaction ID is specified, an error is returned and
no subscriptions will be triggered. If the transaction id is the latest
transaction ID (i.e. the caller is already up to date) nothing is
triggered and CONFD_OK is returned.

By calling this function, the caller will potentially trigger all
subscription points passed in the sub_points array (or all subscribers
if the array is of zero length). The subscriptions will be triggered in
priority order, and the call will not return until the last subscriber
has called cdb_sync_subscription_socket().

The call is blocking and doesn't return until all subscribers have
acknowledged the notification. That means that it is not possible to use
`cdb_replay_subscriptions()` in a cdb subscriber process (without
forking a process or spawning a thread) since it would cause a deadlock.

The subscription notification generated by this "synthetic" trigger will
seem like a regular subscription notification to a subscription client.
It is possible to use `cdb_diff_iterate()` to traverse the changeset.

If the client is a two-phase subscriber, a prepare notification will
first be delivered and if any client aborts this synthetic transaction
further delivery of subscription notification is suspended and an error
is returned to the caller of `cdb_replay_subscriptions()`. The error is
the result of mapping the CONFD_ERRCODE as set by the aborting client as
described for MAAPI in the [EXTENDED ERROR
REPORTING](confd_lib_lib.3.md#extended_error_reporting) section in the
[confd_lib_lib(3)](confd_lib_lib.3.md) manpage.

    int cdb_read_subscription_socket(
    int sock, int sub_points[], int *resultlen);

The subscription socket - which is acquired through a call to
`cdb_connect()` - must be part of the application poll set. Once the
subscription socket has I/O ready to read, we must call
`cdb_read_subscription_socket()` on the subscription socket.

The call will fill in the result in the array `sub_points` with a list
of integer values containing *subscription points* earlier acquired
through calls to `cdb_subscribe()`. The global variable
`cdb_active_subscriptions` can be read to find how many active
subscriptions the application has. Make sure the `sub_points[]` array is
at least this big, otherwise the confd library will write in unallocated
memory.

The subscription points may be either for configuration data or
operational data (if `cdb_oper_subscribe()` has been used on the same
socket), but they will all be of the same "type" - i.e. a single call of
the function will never deliver a mix of configuration and operational
data subscription points.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS

    int cdb_read_subscription_socket2(
    int sock, enum cdb_sub_notification *type, int *flags, int *subpoints[], 
    int *resultlen);

<div class="informalexample">

``` c
enum cdb_sub_notification {
    CDB_SUB_PREPARE = 1,
    CDB_SUB_COMMIT = 2,
    CDB_SUB_ABORT = 3,
    CDB_SUB_OPER = 4
};
```

</div>

This is another version of the `cdb_read_subscription_socket()` with two
important differences:

1.  In this version *subpoints is allocated by the library*, and it is
    up to the caller of this function to `free()` it when it is done.

2.  It is possible to retrieve the type of the subscription notification
    via the `type` return parameter.

All parameters except `sock` are return parameters. It is legal to pass
in `flags` and `type` as `NULL` pointers (in which case type and flags
cannot be retrieved). `subpoints` is an array of integers, the length is
indicated in `resultlen`, it is allocated by the library, and *must be
freed by the caller*. The `type` parameter is what the subscriber uses
to distinguish the different types of subscription notifications.

The `flags` return parameter can have the following bits set:

`CDB_SUB_FLAG_IS_LAST`  
> This bit is set when this notification is the last of its type for
> this subscription socket.

`CDB_SUB_FLAG_HA_IS_SECONDARY`  
> This bit is set when NCS runs in HA mode, and the current node is an
> HA secondary. It is a convenient way for the subscriber to know when
> invoked on a secondary and adjust, or possibly skip, processing.

`CDB_SUB_FLAG_TRIGGER`  
> This bit is set when the cause of the subscription notification is
> that someone called `cdb_trigger_subscriptions()`.

`CDB_SUB_FLAG_REVERT`  
> If a confirming commit is aborted it will look to the CDB subscriber
> as if a transaction happened that is the reverse of what the original
> transaction was. This bit will be set when such a transaction is the
> cause of the notification. Note that for a two-phase subscriber both a
> prepare and a commit notification is delivered. However it is not
> possible to reply by calling `cdb_sub_abort_trans()` for the prepare
> notification in this case, instead the subscriber will have to take
> appropriate backup action if it needs to abort (for example: raise an
> alarm, restart, or even reboot the system).

`CDB_SUB_FLAG_HA_SYNC`  
> This bit is set when the cause of the subscription notification is
> initial synchronization of a HA secondary from CDB on the primary.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS

    int cdb_diff_iterate(
    int sock, int subid, enum cdb_iter_ret (*iter
          kp, enum cdb_iter_op op, 
    confd_value_t *oldv, confd_value_t *newv, void *state, int flags, void *initstate);

After reading the subscription socket the `cdb_diff_iterate()` function
can be used to iterate over the changes made in CDB data that matched
the particular subscription point given by `subid`.

The user defined function `iter()` will be called for each element that
has been modified and matches the subscription. The `iter()` callback
receives the `confd_hkeypath_t kp` which uniquely identifies which node
in the data tree that is affected, the operation, and optionally the
values it has before and after the transaction. The `op` parameter gives
the modification as:

MOP_CREATED  
> The list entry, `presence` container, or leaf of type `empty` (unless
> in a `union`, see the C_EMPTY section in
> [confd_types(3)](confd_types.3.md)) given by `kp` has been created.

MOP_DELETED  
> The list entry, `presence` container, or optional leaf given by `kp`
> has been deleted.
>
> If the subscription was triggered because an ancestor was deleted, the
> `iter()` function will not called at all if the delete was above the
> subscription point. However if the flag ITER_WANT_ANCESTOR_DELETE is
> passed to `cdb_diff_iterate()` then deletes that trigger a descendant
> subscription will also generate a call to `iter()`, and in this case
> `kp` will be the path that was actually deleted.

MOP_MODIFIED  
> A descendant of the list entry given by `kp` has been modified.

MOP_VALUE_SET  
> The value of the leaf given by `kp` has been set to `newv`.

MOP_MOVED_AFTER  
> The list entry given by `kp`, in an `ordered-by user` list, has been
> moved. If `newv` is NULL, the entry has been moved first in the list,
> otherwise it has been moved after the entry given by `newv`. In this
> case `newv` is a pointer to an array of key values identifying an
> entry in the list. The array is terminated with an element that has
> type C_NOEXISTS.

By setting the `flags` parameter ITER_WANT_REVERSE two-phase subscribers
may use this function to traverse the reverse changeset in case of
CDB_SUB_ABORT notification. In this scenario a two-phase subscriber
traverses the changes in the prepare phase (CDB_SUB_PREPARE
notification) and if the transaction is aborted the subscriber may
iterate the inverse to the changes during the abort phase (CDB_SUB_ABORT
notification).

For configuration subscriptions, the previous value of the node can also
be passed to `iter()` if the `flags` parameter contains ITER_WANT_PREV,
in which case `oldv` will be pointing to it (otherwise NULL). For
operational data subscriptions, the ITER_WANT_PREV flag is ignored, and
`oldv` is always NULL - there is no equivalent to CDB_PRE_COMMIT_RUNNING
that holds "old" operational data.

If `iter()` returns ITER_STOP, no more iteration is done, and CONFD_OK
is returned. If `iter()` returns ITER_RECURSE iteration continues with
all children to the node. If `iter()` returns ITER_CONTINUE iteration
ignores the children to the node (if any), and continues with the node's
sibling, and if `iter()` returns ITER_UP the iteration is continued with
the node's parents sibling. If, for some reason, the `iter()` function
wants to return control to the caller of `cdb_diff_iterate()` *before*
all the changes has been iterated over it can return ITER_SUSPEND. The
caller then has to call `cdb_diff_iterate_resume()` to continue/finish
the iteration.

The `state` parameter can be used for any user supplied state (i.e.
whatever is supplied as `initstate` is passed as `state` to `iter()` in
each invocation).

By default the traverse order is undefined but guaranteed to be the most
efficient one. The traverse order may be changed by setting setting a
bit in the `flags` parameter:

ITER_WANT_SCHEMA_ORDER  
> The `iter()` function will be invoked in *schema* order (i.e. in the
> order in which the elements are defined in the YANG file).

ITER_WANT_LEAF_FIRST_ORDER  
> The `iter()` function will be invoked for leafs first, then non-leafs.

ITER_WANT_LEAF_LAST_ORDER  
> The `iter()` function will be invoked for non-leafs first, then leafs.

If the `flags` parameter ITER_WANT_SUPPRESS_OPER_DEFAULTS is given,
operational default values will be skipped during iteration.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS,
CONFD_ERR_BADSTATE, CONFD_ERR_PROTOUSAGE.

    int cdb_diff_iterate_resume(
    int sock, enum cdb_iter_ret reply, enum cdb_iter_ret (*iter
          kp, 
    enum cdb_iter_op op, confd_value_t *oldv, confd_value_t *newv, void *state, 
    void *resumestate);

The application *must* call this function whenever an iterator function
has returned `ITER_SUSPEND` to finish up the iteration. If the
application does not wish to continue iteration it must at least call
`cdb_diff_iterate_resume(s, ITER_STOP, NULL, NULL);` to clean up the
state. The `reply` parameter is what the iterator function would have
returned (i.e. normally ITER_RECURSE or ITER_CONTINUE) if it hadn't
returned ITER_SUSPEND. Note that it is up to the iterator function to
somehow communicate that it has returned ITER_SUSPEND to the caller of
`cdb_diff_iterate()`, this can for example be a field in a struct for
which a pointer to can passed back and forth in the
`state`/`resumestate` variable.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_NOEXISTS,
CONFD_ERR_BADSTATE.

    int cdb_diff_match(
    int sock, int subid, struct xml_tag tags[], int tagslen);

This function can be invoked when a subscription point has fired.
Similar to the `confd_hkp_tagmatch()` function it takes an argument
which is an array of XML tags. The function will invoke
`cdb_diff_iterate()` on a subscription socket. Using combinations of
`ITER_STOP`, `ITER_CONTINUE` and `ITER_RECURSE` return values, the
function checks a tagpath and decides whether any changes (under the
subscription point) has occurred that also match the provided path
`tags`. It is slightly easier to use this function than
`cdb_diff_iterate()` but can also be slower since it is a general
purpose matcher.

If we have a subscription point at /root, we could invoke this function
as:

<div class="informalexample">

    struct xml_tag tags[] = {{root_root, root__ns},
                             {root_servers, root__ns},
                             {root_server, root__ns}};
    /* /root/servers/server */
    int retv = cdb_diff_match(subsock, subpoint, tags, 3);

</div>

The function returns 1 if there were any changes under `subpoint` that
matched `tags`, 0 if no match was found and `CONFD_ERR` on error.

    int cdb_get_modifications(
    int sock, int subid, int flags, confd_tag_value_t **values, int *nvalues, 
    const char *fmt, ...);

The `cdb_get_modifications()` function can be called after reception of
a subscription notification to retrieve all the changes that caused the
subscription notification. The socket `s` is the subscription socket,
the subscription id must also be provided. Optionally a path can be used
to limit what is returned further (only changes below the supplied path
will be returned), if this isn't needed fmt can be set to `NULL`.

When `cdb_get_modifications()` returns `CONFD_OK`, the results are in
`values`, which is a tag value array with length `nvalues`. The library
allocates memory for the results, which must be free:d by the caller.
This can in all cases be done with code like this:

<div class="informalexample">

    confd_tag_value_t *values;
    int nvalues, i;

    if (cdb_get_modifications(sock, subid, flags, &values, &nvalues,
                              "/some/path") == CONFD_OK) {
        ...
        for (i = 0; i < nvalues; i++)
            confd_free_value(CONFD_GET_TAG_VALUE(&values[i]));
        free(values);
    }

</div>

The tag value array differs somewhat between how it is described in the
[confd_types(3)](confd_types.3.md) manual page, most notably only the
values that were modified in this transaction are included. In addition
to that these are the different values of the tags depending on what
happened in the transaction:

- A leaf of type `empty` that has been deleted has the value of
  `C_NOEXISTS`, and when it is created it has the value `C_XMLTAG`.

- A leaf or a leaf-list that has been set to a new value (or its default
  value) is included with that new value. If the leaf or leaf-list is
  optional, then when it is deleted the value is `C_NOEXISTS`.

- Presence containers are included when they are created or when they
  have modifications below them (by the usual `C_XMLBEGIN`, `C_XMLEND`
  pair). If a presence container has been deleted its tag is included,
  but has the value `C_NOEXISTS`.

By default `cdb_get_modifications()` does not include list instances
(created, deleted, or modified) - but if the
`CDB_GET_MODS_INCLUDE_LISTS` flag is included in the `flags` parameter,
list instances will be included. To receive information about where a
list instance in an ordered-by user list is moved, the
`CDB_GET_MODS_INCLUDE_MOVES` flag must also be included in the `flags`
parameter. To receive information about ancestor list entry or presence
container deletion the `CDB_GET_MODS_WANT_ANCESTOR_DELETE` flag must
also be included in the `flags` parameter. Created, modified and moved
instances are included wrapped in the `C_XMLBEGIN` / `C_XMLEND` pair,
with the keys first. A list instance moved to the beginning of the list
is indicated by `C_XMLMOVEFIRST` after the keys. A list instance moved
elsewhere is indicated by `C_XMLMOVEAFTER` after the keys, with the
after-keys following directly after. Deleted list instances instead
begin with `C_XMLBEGINDEL`, then follows the keys, immediately followed
by a `C_XMLEND`.

If the `CDB_GET_MODS_SUPPRESS_DEFAULTS` flag is included in the `flags`
parameter, a default value that comes into effect for a leaf due to an
ancestor list entry or presence container being created will not be
included, and a default value that comes into effect for a leaf due to a
set value being deleted will be included as a deletion (i.e. with value
`C_NOEXISTS`).

When processing a `CDB_SUB_ABORT` notification for a two phase
subscription, it is also possible to request a list of "reverse"
modifications instead of the normal "forward" list. This is done by
including the `CDB_GET_MODS_REVERSE` flag in the `flags` parameter.

    int cdb_get_modifications_iter(
    int sock, int flags, confd_tag_value_t **values, int *nvalues);

The `cdb_get_modifications_iter()` is basically a convenient short-hand
of the `cdb_get_modifications()` function intended to be used from
within a iteration function started by `cdb_diff_iterate()`. In this
case no subscription id is needed, and the path is implicitly the
current position in the iteration.

Combining this call with `cdb_diff_iterate()` makes it for example
possible to iterate over a list, and for each list instance fetch the
changes using `cdb_get_modifications_iter()`, and then return
`ITER_CONTINUE` to process next instance.

<div class="note">

Note: The `CDB_GET_MODS_REVERSE` flag is ignored by
`cdb_get_modifications_iter()`. It will instead return a "forward" or
"reverse" list of modifications for a `CDB_SUB_ABORT` notification
according to whether the `ITER_WANT_REVERSE` flag was included in the
`flags` parameter of the `cdb_diff_iterate()` call.

</div>

    int cdb_get_modifications_cli(
    int sock, int subid, int flags, char **str);

The `cdb_get_modifications_cli()` function can be called after reception
of a subscription notification to retrieve all the changes that caused
the subscription notification as a string in Cisco CLI format. The
socket `s` is the subscription socket, the subscription id must also be
provided. The `flags` parameter is a bitmask with the following bits:

ITER_WANT_CLI_ORDER  
> When subscription is triggered by `cdb_trigger_subscriptions()` this
> flag ensures that modifications are in the same order as they would be
> if triggered by a real commit. Use of this flag negatively impacts
> performance and memory consumption during the
> cdb_get_modifications_cli call.

The CLI string is malloc(3)ed by the library, and the caller must free
the memory using free(3) when it is not needed any longer.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS

    int cdb_sync_subscription_socket(
    int sock, enum cdb_subscription_sync_type st);

Once we have read the subscription notification through a call to
`cdb_read_subscription_socket()` and optionally used the
`cdb_diff_iterate()` to iterate through the changes as well as acted on
the changes to CDB, we must synchronize with CDB so that CDB can
continue and deliver further subscription messages to subscribers with
higher priority numbers.

There are four different types of synchronization replies the
application can use in the `enum cdb_subscription_sync_type` parameter:

`CDB_DONE_PRIORITY`  
> This means that the application has acted on the subscription
> notification and CDB can continue to deliver further notifications.

`CDB_DONE_SOCKET`  
> This means that we are done. But regardless of priority, CDB shall not
> send any further notifications to us on our socket that are related to
> the currently executing transaction.

`CDB_DONE_TRANSACTION`  
> This means that CDB should not send any further notifications to any
> subscribers - including ourselves - related to the currently executing
> transaction.

`CDB_DONE_OPERATIONAL`  
> This should be used when a subscription notification for operational
> data has been read. It is the only type that should be used in this
> case, since the operational data does not have transactions and the
> notifications do not have priorities.

When using two phase subscriptions and `cdb_read_subscription_socket2()`
has returned the type as `CDB_SUB_PREPARE` or `CDB_SUB_ABORT` the only
valid response is `CDB_DONE_PRIORITY`.

For configuration data, the transaction that generated the subscription
notifications is pending until all notifications have been acknowledged.
A read lock on CDB is in effect while notifications are being delivered,
preventing writes until delivery is complete.

For operational data, the writer that generated the subscription
notifications is not directly affected, but the "subscription lock"
remains in effect until all notifications have been acknowledged - thus
subsequent attempts to obtain a "global" subscription lock, or a
subscription lock using CDB_LOCK_PARTIAL for a non-disjuct subtree, will
fail or block while notifications are being delivered (see
`cdb_start_session2()` above). Write operations that don't attempt to
obtain the subscription lock will proceed independent of the delivery of
subscription notifications.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS

    int cdb_sub_progress(
    int sock, const char *fmt, ...);

After receiving a subscription notification (using
`cdb_read_subscription_socket()`) but before acknowledging it (or
aborting, in the case of prepare subscriptions), it is possible to send
progress reports back to ConfD using the `cdb_sub_progress()` function.
The socket `sock` must be the subscription socket, and it is allowed to
call the function more than once to display more than one message. It is
also possible to use this function in the diff-iterate callback
function. A newline at the end of the string isn't necessary.

Depending on which north-bound interface that triggered the transaction,
the string passed may be reported by that interface. Currently this is
only presented in the CLI when the operator requests detailed reporting
using the `commit | details` command.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS

    int cdb_sub_abort_trans(
    int sock, enum confd_errcode code, uint32_t apptag_ns, uint32_t apptag_tag, 
    const char *fmt);

This function is to be called instead of
`cdb_sync_subscription_socket()` when the subscriber wishes to abort the
current transaction. It is only valid to call after
`cdb_read_subscription_socket2()` has returned with type set to
`CDB_SUB_PREPARE`. The arguments after sock are the same as to
`confd_X_seterr_extended()` and give the caller a way of indicating the
reason for the failure. Details can be found in the [EXTENDED ERROR
REPORTING](confd_lib_lib.3.md#extended_error_reporting) section in the
[confd_lib_lib(3)](confd_lib_lib.3.md) manpage.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS

    int cdb_sub_abort_trans_info(
    int sock, enum confd_errcode code, uint32_t apptag_ns, uint32_t apptag_tag, 
    const confd_tag_value_t *error_info, int n, const char *fmt);

This function does the same as `cdb_sub_abort_trans()`, and additionally
gives the possibility to provide contents for the NETCONF \<error-info\>
element. See the [EXTENDED ERROR
REPORTING](confd_lib_lib.3.md#extended_error_reporting) section in the
[confd_lib_lib(3)](confd_lib_lib.3.md) manpage.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS

    int cdb_get_user_session(
    int sock);

Returns the user session id for the transaction that triggered the
current subscription notification. This function uses a subscription
socket, and can only be called when a subscription notification for
configuration data has been received on that socket, before
`cdb_sync_subscription_socket()` has been called. Additionally, it is
not possible to call this function from the `iter()` function passed to
`cdb_diff_iterate()`. To retrieve full information about the user
session, use `maapi_get_user_session()` (see
[confd_lib_maapi(3)](confd_lib_maapi.3.md)).

<div class="note">

Note: When the ConfD High Availability functionality is used, the user
session information is not available on secondary nodes.

</div>

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADSTATE,
CONFD_ERR_NOEXISTS

    int cdb_get_transaction_handle(
    int sock);

Returns the transaction handle for the transaction that triggered the
current subscription notification. This function uses a subscription
socket, and can only be called when a subscription notification for
configuration data has been received on that socket, before
`cdb_sync_subscription_socket()` has been called. Additionally, it is
not possible to call this function from the `iter()` function passed to
`cdb_diff_iterate()`.

<div class="note">

A CDB client is not expected to access the ConfD transaction store
directly - this function should only be used for logging or debugging
purposes.

</div>

<div class="note">

When the ConfD High Availability functionality is used, the transaction
information is not available on secondary nodes.

</div>

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADSTATE,
CONFD_ERR_NOEXISTS

    int cdb_get(
    int sock, confd_value_t *v, const char *fmt, ...);

This function reads a value from the path in `fmt` and writes the result
into the result parameter `confd_value_t`. The path must lead to a leaf
element in the XML data tree. Note that for the C_BUF, C_BINARY, C_LIST,
C_OBJECTREF, C_OID, C_QNAME, C_HEXSTR, and C_BITBIG `confd_value_t`
types, the buffer(s) pointed to are allocated using malloc(3) - it is up
to the user of this interface to free them using `confd_free_value()`.

*Errors*: CONFD_ERR_NOEXISTS, CONFD_ERR_MALLOC, CONFD_ERR_OS,
CONFD_ERR_BADPATH, CONFD_ERR_BADTYPE

All the type safe versions of `cdb_get()` described below, as well as
`cdb_vget()`, also have the same possible Errors. When the type of the
read value is wrong, `confd_errno` is set to CONFD_ERR_BADTYPE and the
function returns CONFD_ERR. The YANG type is given in the descriptions
below.

    int cdb_get_int8(
    int sock, int8_t *rval, const char *fmt, ...);

Type safe variant of `cdb_get()` which is used to read `int8` values.

    int cdb_get_int16(
    int sock, int16_t *rval, const char *fmt, ...);

Type safe variant of `cdb_get()` which is used to read `int16` values.

    int cdb_get_int32(
    int sock, int32_t *rval, const char *fmt, ...);

Type safe variant of `cdb_get()` which is used to read `int32` values.

    int cdb_get_int64(
    int sock, int64_t *rval, const char *fmt, ...);

Type safe variant of `cdb_get()` which is used to read `int64` values.

    int cdb_get_u_int8(
    int sock, uint8_t *rval, const char *fmt, ...);

Type safe variant of `cdb_get()` which is used to read `uint8` values.

    int cdb_get_u_int16(
    int sock, uint16_t *rval, const char *fmt, ...);

Type safe variant of `cdb_get()` which is used to read `uint16` values.

    int cdb_get_u_int32(
    int sock, uint32_t *rval, const char *fmt, ...);

Type safe variant of `cdb_get()` which is used to read `uint32` values.

    int cdb_get_u_int64(
    int sock, uint64_t *rval, const char *fmt, ...);

Type safe variant of `cdb_get()` which is used to read `uint64` values.

    int cdb_get_bit32(
    int sock, uint32_t *rval, const char *fmt, ...);

Type safe variant of `cdb_get()` which is used to read `bits` values
where the highest assigned bit position for the type is 31.

    int cdb_get_bit64(
    int sock, uint64_t *rval, const char *fmt, ...);

Type safe variant of `cdb_get()` which is used to read `bits` values
where the highest assigned bit position for the type is above 31 and
below 64.

    int cdb_get_bitbig(
    int sock, unsigned char **rval, int *bufsiz, const char *fmt, ...);

Type safe variant of `cdb_get()` which is used to read `bits` values
where the highest assigned bit position for the type is above 63. Upon
successful return `rval` is pointing to a buffer of size `bufsiz`. It is
up to the user of this function to free the buffer using free(3) when it
is not needed any longer.

    int cdb_get_ipv4(
    int sock, struct in_addr *rval, const char *fmt, ...);

Type safe variant of `cdb_get()` which is used to read
`inet:ipv4-address` values.

    int cdb_get_ipv6(
    int sock, struct in6_addr *rval, const char *fmt, ...);

Type safe variant of `cdb_get()` which is used to read
`inet:ipv6-address` values.

    int cdb_get_double(
    int sock, double *rval, const char *fmt, ...);

Type safe variant of `cdb_get()` which is used to read `xs:float` and
`xs:double` values.

    int cdb_get_bool(
    int sock, int *rval, const char *fmt, ...);

Type safe variant of `cdb_get()` which is used to read `boolean` values.

    int cdb_get_datetime(
    int sock, struct confd_datetime *rval, const char *fmt, ...);

Type safe variant of `cdb_get()` which is used to read `date-and-time`
values.

    int cdb_get_date(
    int sock, struct confd_date *rval, const char *fmt, ...);

Type safe variant of `cdb_get()` which is used to read `xs:date` values.

    int cdb_get_time(
    int sock, struct confd_time *rval, const char *fmt, ...);

Type safe variant of `cdb_get()` which is used to read `xs:time` values.

    int cdb_get_duration(
    int sock, struct confd_duration *rval, const char *fmt, ...);

Type safe variant of `cdb_get()` which is used to read `xs:duration`
values.

    int cdb_get_enum_value(
    int sock, int32_t *rval, const char *fmt, ...);

Type safe variant of `cdb_get()` which is used to read enumeration
values. If we have:

<div class="informalexample">

    typedef unboundedType {
      type enumeration {
        enum unbounded;
        enum infinity;
      }
    }

</div>

The two enumeration values `unbounded` and `infinity` will occur as two
\#define integers in the .h file which is generated from the YANG
module. Thus this function `cdb_get_enum_value()` populates an unsigned
integer pointer.

    int cdb_get_objectref(
    int sock, confd_hkeypath_t **rval, const char *fmt, ...);

Type safe variant of `cdb_get()` which is used to read
`instance-identifier` values. Upon successful return `rval` is pointing
to an allocated `confd_hkeypath_t`. It is up to the user of this
function to free the hkeypath using `confd_free_hkeypath()` when it is
not needed any longer.

    int cdb_get_oid(
    int sock, struct confd_snmp_oid **rval, const char *fmt, ...);

Type safe variant of `cdb_get()` which is used to read
`object-identifier` values. Upon successful return `rval` is pointing to
an allocated `struct confd_snmp_oid`. It is up to the user of this
function to free the struct using free(3) when it is not needed any
longer.

    int cdb_get_buf(
    int sock, unsigned char **rval, int *bufsiz, const char *fmt, ...);

Type safe variant of `cdb_get()` which is used to read `string` values.
Upon successful return `rval` is pointing to a buffer of size `bufsiz`.
It is up to the user of this function to free the buffer using free(3)
when it is not needed any longer.

    int cdb_get_buf2(
    int sock, unsigned char *rval, int *n, const char *fmt, ...);

Type safe variant of `cdb_get()` which is used to read `string` values.
If the buffer returned by `cdb_get()` fits into `*n` bytes CONFD_OK is
returned and the buffer is copied into `*rval`. Upon successful return
`*n` is set to the number of bytes copied into `*rval`.

    int cdb_get_str(
    int sock, char *rval, int n, const char *fmt, ...);

Type safe variant of `cdb_get()` which is used to read `string` values.
If the buffer returned by `cdb_get()` plus a terminating NUL fits into
`n` bytes CONFD_OK is returned and the buffer is copied into `*rval` (as
well as a terminating NUL character).

    int cdb_get_binary(
    int sock, unsigned char **rval, int *bufsiz, const char *fmt, ...);

Type safe variant of `cdb_get()`, as `cdb_get_buf()` but for `binary`
values. Upon successful return `rval` is pointing to a buffer of size
`bufsiz`. It is up to the user of this function to free the buffer using
free(3) when it is not needed any longer.

    int cdb_get_hexstr(
    int sock, unsigned char **rval, int *bufsiz, const char *fmt, ...);

Type safe variant of `cdb_get()`, as `cdb_get_buf()` but for
`yang:hex-string` values. Upon successful return `rval` is pointing to a
buffer of size `bufsiz`. It is up to the user of this function to free
the buffer using free(3) when it is not needed any longer.

    int cdb_get_qname(
    int sock, unsigned char **prefix, int *prefixsz, unsigned char **name, 
    int *namesz, const char *fmt, ...);

Type safe variant of `cdb_get()` which is used to read `xs:QName`
values. Note that `prefixsz` can be zero (in which case `*prefix` will
be set to NULL). The space for prefix and name is allocated using
`malloc()`, it is up to the user of this function to free them when no
longer in use.

    int cdb_get_list(
    int sock, confd_value_t **values, int *n, const char *fmt, ...);

Type safe variant of `cdb_get()` which is used to read values of a YANG
`leaf-list`. The function will `malloc()` an array of `confd_value_t`
elements for the list, and return a pointer to the array via the
`**values` parameter and the length of the array via the `*n` parameter.
The caller must free the memory for the values (see `cdb_get()`) and the
array itself. An example that reads and prints the elements of a list of
strings:

<div class="informalexample">

    confd_value_t *values = NULL;
    int i, n = 0;

    cdb_get_list(sock, &values, &n, "/system/cards");
    for (i = 0; i < n; i++) {
        printf("card %d: %s\n", i, CONFD_GET_BUFPTR(&values[i]));
        confd_free_value(&values[i]);
    }
    free(values);

</div>

    int cdb_get_ipv4prefix(
    int sock, struct confd_ipv4_prefix *rval, const char *fmt, ...);

Type safe variant of `cdb_get()` which is used to read
`inet:ipv4-prefix` values.

    int cdb_get_ipv6prefix(
    int sock, struct confd_ipv6_prefix *rval, const char *fmt, ...);

Type safe variant of `cdb_get()` which is used to read
`inet:ipv6-prefix` values.

    int cdb_get_decimal64(
    int sock, struct confd_decimal64 *rval, const char *fmt, ...);

Type safe variant of `cdb_get()` which is used to read `decimal64`
values.

    int cdb_get_identityref(
    int sock, struct confd_identityref *rval, const char *fmt, ...);

Type safe variant of `cdb_get()` which is used to read `identityref`
values.

    int cdb_get_ipv4_and_plen(
    int sock, struct confd_ipv4_prefix *rval, const char *fmt, ...);

Type safe variant of `cdb_get()` which is used to read
`tailf:ipv4-address-and-prefix-length` values.

    int cdb_get_ipv6_and_plen(
    int sock, struct confd_ipv6_prefix *rval, const char *fmt, ...);

Type safe variant of `cdb_get()` which is used to read
`tailf:ipv6-address-and-prefix-length` values.

    int cdb_get_dquad(
    int sock, struct confd_dotted_quad *rval, const char *fmt, ...);

Type safe variant of `cdb_get()` which is used to read
`yang:dotted-quad` values.

    int cdb_vget(
    int sock, confd_value_t *v, const char *fmt, va_list args);

This function does the same as `cdb_get()`, but takes a single `va_list`
argument instead of a variable number of arguments - i.e. similar to
`vprintf()`. Corresponding `va_list` variants exist for all the
functions that take a path as a variable number of arguments.

    int cdb_get_object(
    int sock, confd_value_t *values, int n, const char *fmt, ...);

In some cases it can be motivated to read multiple values in one
request - this will be more efficient since it only incurs a single
round trip to ConfD, but usage is a bit more complex. This function
reads at most `n` values from the container or list entry specified by
the path, and places them in the `values` array, which is provided by
the caller. The array is populated according to the specification of the
*Value Array* format in the *XML STRUCTURES* section of the
[confd_types(3)](confd_types.3.md) manual page.

When reading from a container or list entry with mixed configuration and
operational data (i.e. a config container or list entry that has some
number of operational elements), some elements will have the "wrong"
type - i.e. operational data in a session for CDB_RUNNING/CDB_STARTUP,
or config data in a session for CDB_OPERATIONAL. Leaf elements of the
"wrong" type will have a "value" of C_NOEXISTS in the array, while
static or (existing) optional sub-container elements will have C_XMLTAG
in all cases. Sub-containers or leafs provided by external data
providers will always be represented with C_NOEXISTS, whether config or
not.

On success, the function returns the actual number of elements in the
container or list entry. I.e. if the return value is bigger than `n`,
only the values for the first `n` elements are in the array, and the
remaining values have been discarded. Note that given the specification
of the array contents, there is always a fixed upper bound on the number
of actual elements, and if there are no presence sub-containers, the
number is constant.

As an example, with the YANG fragment in the
[PATHS](confd_lib_cdb.3.md#paths) section above, this code could be
used to read the values for interface "eth0" on host "buzz":

<div class="informalexample">

    char *path = "/hosts/host{buzz}/interfaces/interface{%s}";
    confd_value_t v[4];
    struct in_addr ip, mask;
    int enabled;

    cdb_get_object(sock, v, 4, path, "eth0");
    /* v[0] is interface name, already known
       - must be freed since it's a C_BUF   */
    confd_free_value(&v[0]);
    ip = CONFD_GET_IPV4(&v[1]);
    mask = CONFD_GET_IPV4(&v[2]);
    enabled = CONFD_GET_BOOL(&v[3]);

</div>

In this simple example, we assumed that the application was aware of the
details of the data model, specifically that a `confd_value_t` array of
length 4 would be sufficient for the values we wanted to retrieve, and
at which positions in the array those values could be found. If we make
use of schema information loaded from the ConfD daemon into the library
(see [confd_types(3)](confd_types.3.md)), we can avoid "hardwiring"
these details. The following, more complex, example does the same as the
above, but using only the names (in the form of \#defines from the
header file generated by `confdc --emit-h`) of the relevant leafs:

<div class="informalexample">

    char *path = "/hosts/host{buzz}/interfaces/interface{%s}";
    struct confd_cs_node *object = confd_cs_node_cd(NULL, path);
    struct confd_cs_node *cur;
    int n = confd_max_object_size(object);
    int i;
    confd_value_t v[n];
    struct in_addr ip, mask;
    int enabled;

    cdb_get_object(sock, v, n, path, "eth0");
    for (cur = object->children, i = 0;
         cur != NULL;
         cur = confd_next_object_node(object, cur, &v[i]), i++) {
        switch (cur->tag) {
        case hst_ip:
            ip = CONFD_GET_IPV4(&v[i]);
            break;
        case hst_mask:
            mask = CONFD_GET_IPV4(&v[i]);
            break;
        case hst_enabled:
            enabled = CONFD_GET_BOOL(&v[i]);
            break;
        }
        /* always free - it is a no-op if not needed */
        confd_free_value(&v[i]);
    }

</div>

See [confd_lib_lib(3)](confd_lib_lib.3.md) for the specification of
the `confd_max_object_size()` and `confd_next_object_node()` functions.
Also worth noting is that the return value from
`confd_max_object_size()` is a constant for a given node in a given data
model - thus we could optimize the above by calling
`confd_max_object_size()` only at the first invocation of
`cdb_get_object()` for a given node, making use of the `opaque` element
of `struct confd_cs_node` to store the value:

<div class="informalexample">

    char *path = "/hosts/host{buzz}/interfaces/interface{%s}";
    struct confd_cs_node *object = confd_cs_node_cd(NULL, path);
    int n;
    struct in_addr ip, mask;
    int enabled;

    if (object->opaque == NULL) {
        n = confd_max_object_size(object);
        object->opaque = (void *)n;
    } else {
        n = (int)object->opaque;
    }

    {
        struct confd_cs_node *cur;
        confd_value_t v[n];
        int i;

        cdb_get_object(sock, v, n, path, "eth0");
        for (cur = object->children, i = 0;
             cur != NULL;
             cur = confd_next_object_node(object, cur, &v[i]), i++) {
            ...
        }
    }

</div>

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADPATH

    int cdb_get_objects(
    int sock, confd_value_t *values, int n, int ix, int nobj, const char *fmt, 
    ...);

Similar to `cdb_get_object()`, but reads multiple entries of a list
based on the "instance integer" otherwise given within square brackets
in the path - here the path must specify the list without the instance
integer. At most `n` values from each of `nobj` entries, starting at
entry `ix`, are read and placed in the `values` array.

The array must be at least `n * nobj` elements long, and the values for
list entry `ix + i` start at element `array[i * n]` (i.e. `ix` starts at
`array[0]`, `ix+1` at `array[n]`, and so on). On success, the highest
actual number of values in any of the list entries read is returned. An
error (CONFD_ERR_NOEXISTS) will be returned if we attempt to read more
entries than actually exist (i.e. if `ix + nobj - 1` is outside the
range of actually existing list entries). Example - read the data for
all interfaces on the host "buzz" (assuming that we have memory enough
for that):

<div class="informalexample">

    char *path = "/hosts/host{buzz}/interfaces/interface";
    int n;

    n = cdb_num_instances(sock, path);
    {
        confd_value_t v[n*4];
        char name[n][64];
        struct in_addr ip[n], mask[n];
        int enabled[n];
        int i;

        cdb_get_objects(sock, v, 4, 0, n, path);
        for (i = 0; i < n*4; i += 4) {
            confd_pp_value(&name[i][0], 64, &v[i]);
            /* value must be freed since it's a C_BUF */
            confd_free_value(&v[i]);
            ip[i] = CONFD_GET_IPV4(&v[i+1]);
            mask[i] = CONFD_GET_IPV4(&v[i+2]);
            enabled[i] = CONFD_GET_BOOL(&v[i+3]);
        }

        /* configure interfaces... */
    }

</div>

This simple example can of course be enhanced to use loaded schema
information in a similar manner as for `cdb_get_object()` above.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADPATH,
CONFD_ERR_NOEXISTS

    int cdb_get_values(
    int sock, confd_tag_value_t *values, int n, const char *fmt, ...);

Read an arbitrary set of sub-elements of a container or list entry. The
`values` array must be pre-populated with `n` values based on the
specification of the *Tagged Value Array* format in the *XML STRUCTURES*
section of the [confd_types(3)](confd_types.3.md) manual page, where
the `confd_value_t` value element is given as follows:

- C_NOEXISTS means that the value should be read from CDB and stored in
  the array.

- C_PTR also means that the value should be read from CDB, but instead
  gives the expected type and a pointer to the type-specific variable
  where the value should be stored. Thus this gives a functionality
  similar to the type safe versions of `cdb_get()`.

- C_XMLBEGIN and C_XMLEND are used as per the specification.

- Key values to select list entries can be given with their values.

- As a special case, the "instance integer" can be used to select a list
  entry by using C_CDBBEGIN instead of C_XMLBEGIN (and no key values).

<div class="note">

When we use C_PTR, we need to take special care to free any allocated
memory. When we use C_NOEXISTS and the value is stored in the array, we
can just use `confd_free_value()` regardless of the type, since the
`confd_value_t` has the type information. But with C_PTR, only the
actual value is stored in the pointed-to variable, just as for
`cdb_get_buf()`, `cdb_get_binary()`, etc, and we need to free the memory
specifically allocated for the types listed in the description of
`cdb_get()` above. See the corresponding `cdb_get_xxx()` functions for
the details of how to do this.

</div>

All elements have the same position in the array after the call, in
order to simplify extraction of the values - this means that optional
elements that were requested but didn't exist will have C_NOEXISTS
rather than being omitted from the array. However requesting a list
entry that doesn't exist, or requesting non-CDB data, or operational vs
config data, is an error. Note that when using C_PTR, the only
indication of a non-existing value is that the destination variable has
not been modified - it's up to the application to set it to some
"impossible" value before the call when optional leafs are read.

In this rather complex example we first read only the "name" and
"enabled" values for all interfaces, and then read "ip" and "mask" for
those that were enabled - a total of two requests. Note that since the
"interface" list begin/end elements are in the array, the path must not
include the "interface" component. When reading values from a single
container, it is generally simpler to have the container component (and
keys or instance integer) in the path instead.

<div class="informalexample">

    char *path = "/hosts/host{buzz}/interfaces";
    int n = cdb_num_instances(sock, "%s/interface", path);
    {
      /* when reading ip/mask, we need 5 elements per interface:
         begin + name (key) + ip + mask + end                    */
      confd_tag_value_t tv[n*5];
      char name[n][64];
      struct in_addr ip[n], mask[n];
      int i, j;
      int n_if;

      /* read name and enabled for all interfaces */
      j = 0;
      for (i = 0; i < n; i++) {
        CONFD_SET_TAG_CDBBEGIN(&tv[j], hst_interface, hst__ns, i); j++;
        CONFD_SET_TAG_NOEXISTS(&tv[j], hst_name);                  j++;
        CONFD_SET_TAG_NOEXISTS(&tv[j], hst_enabled);               j++;
        CONFD_SET_TAG_XMLEND(&tv[j], hst_interface, hst__ns);      j++;
      }
      cdb_get_values(sock, tv, j, path);

      /* extract name for enabled interfaces */
      j = 0;
      for (i = 0; i < n*4; i += 4) {
        int enabled = CONFD_GET_BOOL(CONFD_GET_TAG_VALUE(&tv[i+2]));
        confd_value_t *v = CONFD_GET_TAG_VALUE(&tv[i+1]);
        if (enabled) {
          confd_pp_value(&name[j][0], 64, v);
          j++;
        }
        /* name must be freed regardless since it's a C_BUF */
        confd_free_value(v);
      }
      n_if = j;

      /* read ip and mask for enabled interfaces by key value (name) */
      j = 0;
      for (i = 0; i < n_if; i++) {
        CONFD_SET_TAG_XMLBEGIN(&tv[j], hst_interface, hst__ns);    j++;
        CONFD_SET_TAG_STR(&tv[j], hst_name, &name[i][0]);          j++;
        CONFD_SET_TAG_PTR(&tv[j], hst_ip, C_IPV4, &ip[i]);         j++;
        CONFD_SET_TAG_PTR(&tv[j], hst_mask, C_IPV4, &mask[i]);     j++;
        CONFD_SET_TAG_XMLEND(&tv[j], hst_interface, hst__ns);      j++;
      }
      cdb_get_values(sock, tv, j, path);

      for (i = 0; i < n_if; i++) {
        /* configure interface i with ip[i] and mask[i]... */
      }
    }

</div>

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADPATH,
CONFD_ERR_BADTYPE, CONFD_ERR_NOEXISTS

    int cdb_get_case(
    int sock, const char *choice, confd_value_t *rcase, const char *fmt, ...);

When we use the YANG `choice` statement in the data model, this function
can be used to find the currently selected `case`, avoiding useless
`cdb_get()` etc requests for elements that belong to other cases. The
`fmt, ...` arguments give the path to the container or list entry where
the choice is defined, and `choice` is the name of the choice. The case
value is returned to the `confd_value_t` that `rcase` points to, as type
C_XMLTAG - i.e. we can use the `CONFD_GET_XMLTAG()` macro to retrieve
the hashed tag value. If no case is currently selected (i.e. for an
optional choice that doesn't have a default case), the function will
fail with CONFD_ERR_NOEXISTS.

If we have "nested" choices, i.e. multiple levels of `choice` statements
without intervening `container` or `list` statements in the data model,
the `choice` argument must give a '/'-separated path with alternating
choice and case names, from the data node given by the `fmt, ...`
arguments to the specific choice that the request pertains to.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADPATH,
CONFD_ERR_NOEXISTS

    int cdb_get_attrs(
    int sock, uint32_t *attrs, int num_attrs, confd_attr_value_t **attr_vals, 
    int *num_vals, const char *fmt, ...);

Retrieve attributes for a config node. These attributes are currently
supported:

<div class="informalexample">

    /* CONFD_ATTR_TAGS: value is C_LIST of C_BUF/C_STR */
    #define CONFD_ATTR_TAGS       0x80000000
    /* CONFD_ATTR_ANNOTATION: value is C_BUF/C_STR */
    #define CONFD_ATTR_ANNOTATION 0x80000001
    /* CONFD_ATTR_INACTIVE: value is C_BOOL 1 (i.e. "true") */
    #define CONFD_ATTR_INACTIVE   0x00000000
    /* CONFD_ATTR_BACKPOINTER: value is C_LIST of C_BUF/C_STR */
    #define CONFD_ATTR_BACKPOINTER 0x80000003
    /* CONFD_ATTR_OUT_OF_BAND: value is C_LIST of C_BUF/C_STR */
    #define CONFD_ATTR_OUT_OF_BAND 0x80000010
    /* CONFD_ATTR_ORIGIN: value is C_IDENTITYREF */
    #define CONFD_ATTR_ORIGIN 0x80000007
    /* CONFD_ATTR_ORIGINAL_VALUE: value is C_BUF/C_STR */
    #define CONFD_ATTR_ORIGINAL_VALUE 0x80000005
    /* CONFD_ATTR_WHEN: value is C_BUF/C_STR */
    #define CONFD_ATTR_WHEN 0x80000004
    /* CONFD_ATTR_REFCOUNT: value is C_UINT32 */
    #define CONFD_ATTR_REFCOUNT 0x80000002

</div>

The `attrs` parameter is an array of attributes of length `num_attrs`,
specifying the wanted attributes - if `num_attrs` is 0, all attributes
are retrieved. If no attributes are found, `*num_vals` is set to 0,
otherwise an array of `confd_attr_value_t` elements is allocated and
populated, its address stored in `*attr_vals`, and `*num_vals` is set to
the number of elements in the array. The `confd_attr_value_t` struct is
defined as:

<div class="informalexample">

``` c
typedef struct confd_attr_value {
    uint32_t attr;
    confd_value_t v;
} confd_attr_value_t;
```

</div>

If any attribute values are returned (`*num_vals` \> 0), the caller must
free the allocated memory by calling `confd_free_value()` for each of
the `confd_value_t` elements, and `free(3)` for the `*attr_vals` array
itself.

*Errors*: CONFD_ERR_NOEXISTS, CONFD_ERR_MALLOC, CONFD_ERR_OS,
CONFD_ERR_BADPATH, CONFD_ERR_BADTYPE

    int cdb_vget_attrs(
    int sock, uint32_t *attrs, int num_attrs, confd_attr_value_t **attr_vals, 
    int *num_vals, const char *fmt, va_list args);

This function does the same as `cdb_get_attrs()`, but takes a single
`va_list` argument instead of a variable number of arguments - i.e.
similar to `vprintf()`. Corresponding `va_list` variants exist for all
the functions that take a path as a variable number of arguments.

## Operational Data

It is possible for an application to store operational data (i.e. status
and statistical information) in CDB, instead of providing it on demand
via the callback interfaces described in the
[confd_lib_dp(3)](confd_lib_dp.3.md) manual page. The operational
database has no transactions and normally avoids the use of locks in
order to provide light-weight access methods, however when the
multi-value API functions below are used, all updates requested by a
given function call are carried out atomically. Read about how to
specify the storage of operational data in CDB via the `tailf:cdb-oper`
extension in the
[tailf_yang_extensions(5)](tailf_yang_extensions.5.md) manual page.

To establish a session for operational data, the application needs to
use `cdb_connect()` with CDB_DATA_SOCKET and `cdb_start_session()` with
CDB_OPERATIONAL. After this, all the read and access functions above are
available for use with operational data, and additionally the write
functions described below. Configuration data can not be accessed in a
session for operational data, nor vice versa - however it is possible to
have both types of sessions active simultaneously on two different
sockets, or to alternate the use of one socket via `cdb_end_session()`.
The write functions can never be used in a session for configuration
data.

<div class="note">

In order to trigger subscriptions on operational data, we must obtain a
subscription lock via the use of `cdb_start_session2()` instead of
`cdb_start_session()`, see above.

</div>

In YANG it is possible to define a list of operational data without any
keys. For this type of list, we use a single "pseudo" key which is
always of type C_INT64. This key isn't visible in the northbound agent
interfaces, but is used in the functions described here just as if it
was a "normal" key.

    int cdb_set_elem(
    int sock, confd_value_t *val, const char *fmt, ...);

    int cdb_set_elem2(
    int sock, const char *strval, const char *fmt, ...);

There are two different functions to set the value of a single leaf. The
first takes the value from a `confd_value_t` struct, the second takes
the string representation of the value.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADPATH,
CONFD_ERR_BADTYPE, CONFD_ERR_NOT_WRITABLE

    int cdb_vset_elem(
    int sock, confd_value_t *val, const char *fmt, va_list args);

This function does the same as `cdb_set_elem()`, but takes a single
`va_list` argument instead of a variable number of arguments - i.e.
similar to `vprintf()`. Corresponding `va_list` variants exist for all
the functions that take a path as a variable number of arguments.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADPATH,
CONFD_ERR_BADTYPE, CONFD_ERR_NOT_WRITABLE

    int cdb_create(
    int sock, const char *fmt, ...);

Create a new list entry, presence container, or leaf of type `empty`
(unless in a `union`, see the C_EMPTY section in
[confd_types(3)](confd_types.3.md)). Note that for list entries and
containers, sub-elements will not exist until created or set via some of
the other functions, thus doing implicit create via `cdb_set_object()`
or `cdb_set_values()` may be preferred in this case.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADPATH,
CONFD_ERR_NOT_WRITABLE, CONFD_ERR_NOTCREATABLE, CONFD_ERR_ALREADY_EXISTS

    int cdb_delete(
    int sock, const char *fmt, ...);

Delete a list entry, presence container, or leaf of type `empty` (unless
in a `union` see the C_EMPTY section in
[confd_types(3)](confd_types.3.md)), and all its child elements (if
any).

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADPATH,
CONFD_ERR_NOT_WRITABLE, CONFD_ERR_NOTDELETABLE, CONFD_ERR_NOEXISTS

    int cdb_set_object(
    int sock, const confd_value_t *values, int n, const char *fmt, ...);

Set all elements corresponding to the complete contents of a container
or list entry, except for sub-lists. The `values` array must be
populated with `n` values according to the specification of the *Value
Array* format in the *XML STRUCTURES* section of the
[confd_types(3)](confd_types.3.md) manual page.

If the container or list entry itself, or any sub-elements that are
specified as existing, do not exist before this call, they will be
created, otherwise the existing values will be updated. Non-mandatory
leafs and presence containers that are specified as not existing in the
array, i.e. with value C_NOEXISTS, will be deleted if they existed
before the call.

When writing to a container with mixed configuration and operational
data (i.e. a config container or list entry that has some number of
operational elements), all config leaf elements must be specified as
C_NOEXISTS in the corresponding array elements, while config
sub-container elements are specified with C_XMLTAG just as for
operational data.

For a list entry, since the key elements must be present in the array,
it is not required that the key values are included in the path given by
`fmt`. If the key values *are* included in the path, the values of the
key elements in the array are ignored.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADPATH,
CONFD_ERR_BADTYPE, CONFD_ERR_NOT_WRITABLE

    int cdb_set_values(
    int sock, const confd_tag_value_t *values, int n, const char *fmt, ...);

Set arbitrary sub-elements of a container or list entry. The `values`
array must be populated with `n` values according to the specification
of the *Tagged Value Array* format in the *XML STRUCTURES* section of
the [confd_types(3)](confd_types.3.md) manual page.

If the container or list entry itself, or any sub-elements that are
specified as existing, do not exist before this call, they will be
created, otherwise the existing values will be updated. Both mandatory
and optional elements may be omitted from the array, and all omitted
elements are left unchanged. To actually delete a non-mandatory leaf or
presence container as described for `cdb_set_object()`, it may (as an
extension of the format) be specified as C_NOEXISTS instead of being
omitted.

For a list entry, the key values can be specified either in the path or
via key elements in the array - if the values are in the path, the key
elements can be omitted from the array. For sub-lists present in the
array, the key elements must of course always also be present though,
immediately following the C_XMLBEGIN element and in the order defined by
the data model. It is also possible to delete a list entry by using a
C_XMLBEGINDEL element, followed by the keys in data model order,
followed by a C_XMLEND element.

For a list without keys (see above), the "pseudo" key may (or in some
cases must) be present in the array, but of course there is no tag value
for it, since it isn't present in the data model. In this case we must
use a tag value of 0, i.e. it can be set with code like:

<div class="informalexample">

    confd_tag_value_t tv[7];

    CONFD_SET_TAG_INT64(&tv[1], 0, 42);

</div>

The same method is used when reading data from such a list with the
`cdb_get_values()` function described above.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADPATH,
CONFD_ERR_BADTYPE, CONFD_ERR_NOT_WRITABLE

    int cdb_set_case(
    int sock, const char *choice, const char *scase, const char *fmt, ...);

When we use the YANG `choice` statement in the data model, this function
can be used to select the current `case`. When configuration data is
modified by northbound agents, the current case is implicitly selected
(and elements for other cases potentially deleted) by the setting of
elements in a choice. For operational data in CDB however, this is under
direct control of the application, which needs to explicitly set the
current case. Setting the case will also automatically delete elements
belonging to other cases, but it is up to the application to not set any
elements in the "wrong" case.

The `fmt, ...` arguments give the path to the container or list entry
where the choice is defined, and `choice` and `scase` are the choice and
case names. For an optional choice, it is possible to have no case at
all selected. To indicate that the previously selected case should be
deleted without selecting another case, we can pass NULL for the `scase`
argument.

If we have "nested" choices, i.e. multiple levels of `choice` statements
without intervening `container` or `list` statements in the data model,
the `choice` argument must give a '/'-separated path with alternating
choice and case names, from the data node given by the `fmt, ...`
arguments to the specific choice that the request pertains to.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADPATH,
CONFD_ERR_NOTDELETABLE

    int cdb_set_attr(
    int sock, uint32_t attr, confd_value_t *v, const char *fmt, ...);

This function sets an attribute for a path in `fmt`. The path must lead
to an operational config node. See `cdb_get_attrs` for the supported
attributes.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADPATH,
CONFD_ERR_BADTYPE, CONFD_ERR_NOT_WRITABLE, CONFD_ERR_NOEXISTS

    int cdb_vset_attr(
    int sock, uint32_t attr, confd_value_t *v, const char *fmt, va_list args);

This function does the same as `cdb_set_attr()`, but takes a single
`va_list` argument instead of a variable number of arguments - i.e.
similar to `vprintf()`. Corresponding `va_list` variants exist for all
the functions that take a path as a variable number of arguments.

## Ncs Specific Functions

    struct confd_cs_node *cdb_cs_node_cd(
    int sock, const char *fmt, ...);

Does the same thing as `confd_cs_node_cd()` (see
[confd_lib_lib(3)](confd_lib_lib.3.md)), but can handle paths that are
ambiguous due to traversing a mount point, by sending a request to the
NSO daemon. To be used when `confd_cs_node_cd()` returns `NULL` with
`confd_errno` set to `CONFD_ERR_NO_MOUNT_ID`.

*Errors*: CONFD_ERR_MALLOC, CONFD_ERR_OS, CONFD_ERR_BADPATH

## See Also

`confd_lib(3)` - Confd lib

`confd_types(3)` - ConfD C data types

The ConfD User Guide
