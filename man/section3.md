# Section 3

***

## `confd_lib`

`confd_lib` - C library for connecting to NSO

### Library

NSO Library, (`libconfd`, `-lconfd`)

### Description

The `libconfd` shared library is used to connect to NSO. The documentation for the library is divided into several manual pages:

[confd\_lib\_lib(3)](section3.md#confd_lib_lib)

> Common Library Functions

[confd\_lib\_dp(3)](section3.md#confd_lib_dp)

> The Data Provider API

[confd\_lib\_events(3)](section3.md#confd_lib_events)

> The Event Notification API

[confd\_lib\_ha(3)](section3.md#confd_lib_ha)

> The High Availability API

[confd\_lib\_cdb(3)](section3.md#confd_lib_cdb)

> The CDB API

[confd\_lib\_maapi(3)](section3.md#confd_lib_maapi)

> The Management Agent API

There is also a C header file associated with each of these manual pages:

`#include <confd_lib.h>`

> Common type definitions and prototypes for the functions in the [confd\_lib\_lib(3)](section3.md#confd_lib_lib) manual page. Always needed.

`#include <confd_dp.h>`

> Needed when functions in the [confd\_lib\_dp(3)](section3.md#confd_lib_dp) manual page are used.

`#include <confd_events.h>`

> Needed when functions in the [confd\_lib\_events(3)](section3.md#confd_lib_events) manual page are used.

`#include <confd_ha.h>`

> Needed when functions in the [confd\_lib\_ha(3)](section3.md#confd_lib_ha) manual page are used.

`#include <confd_cdb.h>`

> Needed when functions in the [confd\_lib\_cdb(3)](section3.md#confd_lib_cdb) manual page are used.

`#include <confd_maapi.h>`

> Needed when functions in the [confd\_lib\_maapi(3)](section3.md#confd_lib_maapi) manual page are used.

For backwards compatibility, `#include <confd.h>` can also be used, and is equivalent to:

```
#include <confd_lib.h>
#include <confd_dp.h>
#include <confd_events.h>
#include <confd_ha.h>
```

### See Also

The NSO User Guide

***

## `confd_lib_cdb`

`confd_lib_cdb` - library for connecting to NSO built-in XML database (CDB)

### Synopsis

```
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
```

### Library

NSO Library, (`libconfd`, `-lconfd`)

### Description

The `libconfd` shared library is used to connect to the NSO built-in XML database, CDB. The purpose of this API is to provide a read and subscription API to CDB.

CDB owns and stores the configuration data and the user of the API wants to read that configuration data and also get notified when someone through either NETCONF, SNMP, the CLI, the Web UI or the MAAPI modifies the data so that the application can re-read the configuration data and act accordingly.

CDB can also store operational data, i.e. data which is designated with a `"config false"` statement in the YANG data model. Operational data can be both read and written by the applications, but NETCONF and the other northbound agents can only read the operational data.

### Paths

The majority of the functions described here take as their two last arguments a format string and a variable number of extra arguments as in: `char *``fmt`, `...``);`

The `fmt` is a printf style format string which is used to format a path into the XML data tree. Assume the following YANG fragment:

```
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
```

Furthermore, assuming our database is populated with the following data.

```
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
```

The format path /hosts/host{buzz}/defgw refers to the leaf called defgw of the host whose key (name leaf) is `buzz`.

The format path /hosts/host{buzz}/interfaces/interface{eth0}/ip refers to the leaf called ip in the `eth0` interface of the host called `buzz`.

It is possible loop through all entries in a list as in:

```
n = cdb_num_instances(sock, "/hosts/host");
for (i=0; i<n; i++) {
    cdb_cd(sock, "/hosts/host[%d]", i)
    .....
```

Thus instead of an actually instantiated key inside a pair of curly braces {key}, we can use a temporary integer key inside a pair of brackets `[n]`.

We can use the following modifiers:

%d

> requiring an integer parameter (type `int`) to be substituted.

%u

> requiring an unsigned integer parameter (type `unsigned int`) to be substituted.

%s

> requiring a `char*` string parameter to be substituted.

%ip4

> requiring a `struct in_addr*` to be substituted.

%ip6

> requiring a `struct in6_addr*` to be substituted.

%x

> requiring a `confd_value_t*` to be substituted.

%\*x

> requiring an array length and a `confd_value_t*` pointing to an array of values to be substituted.

%h

> requiring a `confd_hkeypath_t*` to be substituted.

%\*h

> requiring a length and a `confd_hkeypath_t*` to be substituted.

Thus,

```
char *hname = "earth";
struct in_addr ip;
ip.s_addr = inet_addr("127.0.0.1");

cdb_cd(sock, "/hosts/host{%s}/bar{%ip4}", hname, &ip);
```

would change the current position to the path: "/hosts/host{earth}/bar{127.0.0.1}"

It is also possible to use the different '%' modifiers outside the curly braces, thus the above example could have been written as:

```
char *prefix = "/hosts/host";
cdb_cd(sock, "%s{%s}/bar{%ip4}", prefix, hname, &ip);
```

If an element has multiple keys, the keys must be space separated as in `cdb_cd("/bars/bar{%s %d}/item", str, i);`. However the '%\*x' modifier is an exception to this rule, and it is especially useful when we have a number of key values that are unknown at compile time. If we have a list foo which is known to have two keys, and we have those keys in an array `key[]`, we can use `cdb_cd("/foo{%x %x}", &key[0], &key[1]);.` But if the number of keys is unknown at compile time (or if we just want a more compact code), we can instead use `cdb_cd("/foo{%*x}", n, key);` where `n` is the number of keys.

The '%h' and '%\*h' modifiers can only be used at the beginning of a format path, as they expand to the absolute path corresponding to the `confd_hkeypath_t`. These modifiers are particularly useful with `cdb_diff_iterate()` (see below), or for MAAPI access in data provider callbacks (see [confd\_lib\_maapi(3)](section3.md#confd_lib_maapi) and [confd\_lib\_dp(3)](section3.md#confd_lib_dp)). The '%\*h' variant allows for using only the initial part of a `confd_hkeypath_t`, as specified by the preceding length argument (similar to '%.\*s' for `printf(3)`).

For example, if the `iter()` function passed to `cdb_diff_iterate()` has been invoked with a `confd_hkeypath_t *kp` that corresponds to /hosts/host{buzz}, we can read the defgw child element with

```
confd_value_t v;
cdb_get(s, &v, "%h/defgw", kp);
```

or the entire list entry with

```
confd_value_t v[5];
cdb_get_object(sock, v, 5, "%h", kp);
```

or the defgw child element for host `mars` with

```
confd_value_t v;
cdb_get(s, &v, "%*h{mars}/defgw", kp->len - 1, kp);
```

All the functions that take a path on this form also have a `va_list` variant, of the same form as `cdb_vget()` and `cdb_vset_elem()`, which are the only ones explicitly documented below. I.e. they have a prefix "cdb\_v" instead of "cdb\_", and take a single va\_list argument instead of a variable number of arguments.

### Functions

All functions return CONFD\_OK (0), CONFD\_ERR (-1) or CONFD\_EOF (-2) unless otherwise stated. CONFD\_EOF means that the socket to NSO has been closed.

Whenever CONFD\_ERR is returned from any API function described here, it is possible to obtain additional information on the error through the symbol `confd_errno`, see the [ERRORS](section3.md#confd_lib_lib.errors) section in the [confd\_lib\_lib(3)](section3.md#confd_lib_lib) manual page.

```
int cdb_connect(
int sock, enum cdb_sock_type type, const struct sockaddr *srv, int srv_sz);
```

The application has to connect to NSO before it can interact. There are two different types of connections identified by `cdb_sock_type`:

`CDB_DATA_SOCKET`

> This is a socket which is used to read configuration data, or to read and write operational data.

`CDB_SUBSCRIPTION_SOCKET`

> This is a socket which is used to receive notifications about updates to the database. A subscription socket needs to be part of the application poll set.

Additionally the type CDB\_READ\_SOCKET is accepted for backwards compatibility - it is equivalent to CDB\_DATA\_SOCKET.

A call to `cdb_connect()` is typically followed by a call to either `cdb_start_session()` for a reading session or a call to `cdb_subscribe()` for a subscription socket.

> **Note**
>
> If this call fails (i.e. does not return CONFD\_OK), the socket descriptor must be closed and a new socket created before the call is re-attempted.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS

```
int cdb_connect_name(
int sock, enum cdb_sock_type type, const struct sockaddr *srv, int srv_sz, 
const char *name);
```

When we use `cdb_connect()` to create a connection to NSO/CDB, the `name` parameter passed to the library initialization function `confd_init()` (see [confd\_lib\_lib(3)](section3.md#confd_lib_lib)) is used to identify the connection in status reports and logs. If we want different names to be used for different connections from the same application process, we can use `cdb_connect_name()` with the wanted name instead of `cdb_connect()`.

> **Note**
>
> If this call fails (i.e. does not return CONFD\_OK), the socket descriptor must be closed and a new socket created before the call is re-attempted.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS

```
int cdb_mandatory_subscriber(
int sock, const char *name);
```

Attaches a mandatory attribute and a mandatory name to the subscriber identified by `sock`. The `name` parameter is distinct from the name parameter in `cdb_connect_name`.

CDB keeps a list of mandatory subscribers for infinite extent, i.e. until confd is restarted. The function is idempotent.

Absence of one or more mandatory subscribers will result in abort of all transactions. A mandatory subscriber must be present during the entire PREPARE delivery phase.

If a mandatory subscriber crashes during a PREPARE delivery phase, the subscriber should be restarted and the commit operation should be retried.

A mandatory subscriber is present if the subscriber has issued at least one `cdb_subscribe2()` call followed by a `cdb_subscribe_done()` call.

A call to `cdb_mandatory_subscriber()` is only allowed before the first call of `cdb_subscribe2()`.

> **Note**
>
> Only applicable for two-phase subscribers.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS

```
int cdb_set_namespace(
int sock, int hashed_ns);
```

If we want to access data in CDB where the toplevel element name is not unique, we need to set the namespace. We are reading data related to a specific .fxs file. confdc can be used to generate a `.h` file with a #define for the namespace, by the flag `--emit-h` to confdc (see [confdc(1)](section1.md#confdc)).

It is also possible to indicate which namespace to use through the namespace prefix when we read and write data. Thus the path /foo:bar/baz will get us /bar/baz in the namespace with prefix "foo" regardless of what the "set" namespace is. And if there is only one toplevel element called "bar" across all namespaces, we can use /bar/baz without the prefix and without calling `cdb_set_namespace()`.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int cdb_end_session(
int sock);
```

We use `cdb_connect()` to establish a read socket to CDB. When the socket is closed, the read session is ended. We can reuse the same socket for another read session, but we must then end the session and create another session using `cdb_start_session()`.

While we have a live CDB read session for configuration data, CDB is normally locked for writing. Thus all external entities trying to modify CDB are blocked as long as we have an open CDB read session. It is very important that we remember to either `cdb_end_session()` or `cdb_close()` once we have read what we wish to read.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int cdb_start_session(
int sock, enum cdb_db_type db);
```

Starts a new session on an already established socket to CDB. The db parameter should be one of:

`CDB_RUNNING`

> Creates a read session towards the running database.

`CDB_PRE_COMMIT_RUNNING`

> Creates a read session towards the running database as it was before the current transaction was committed. This is only possible between a subscription notification and the final `cdb_sync_subscription_socket()`. At any other time trying to call `cdb_start_session()` will fail with confd\_errno set to CONFD\_ERR\_NOEXISTS.
>
> In the case of a `CDB_SUB_PREPARE` subscription notification a session towards `CDB_PRE_COMMIT_RUNNING` will (in spite of the name) will return values as they were _before the transaction which is about to be committed_ took place. This means that if you want to read the new values during a `CDB_SUB_PREPARE` subscription notification you need to create a session towards `CDB_RUNNING`. However, since it is locked the session needs to be started in lockless mode using `cdb_start_session2()`. So for example:
>
> ```
> cdb_read_subscription_socket2(ss, &type, &flags, &subp, &len);
> /* ... */
> switch (type) {
> case CDB_SUB_PREPARE:
>     /* Set up a lockless session to read new values: */
>     cdb_start_session2(s, CDB_RUNNING, 0);
>     read_new_config(s);
>     cdb_end_session(s);
>     cdb_sync_subscription_socket(ss, CDB_DONE_PRIORITY);
>     break;
>     /* ... */
> ```

`CDB_STARTUP`

> Creates a read session towards the startup database.

`CDB_OPERATIONAL`

> Creates a read/write session towards the operational database. For further details about working with operational data in CDB, see the `OPERATIONAL DATA` section below.
>
> > \[!NOTE] Subscriptions on operational data will not be triggered from a session created with this function - to trigger operational data subscriptions, we need to use `cdb_start_session2()`, see below.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_LOCKED, CONFD\_ERR\_NOEXISTS

If the error is CONFD\_ERR\_LOCKED it means that we are trying to create a new CDB read session precisely when the write phase of some transaction is occurring. Thus correct usage of `cdb_start_session()` is:

```
 while (1) {
   if (cdb_start_session(sock, CDB_RUNNING) == CONFD_OK)
      break;
   if (confd_errno == CONFD_ERR_LOCKED) {
      sleep(1);
      continue;
   }
   .... handle error
}
```

Alternatively we can use `cdb_start_session2()` with `flags` = CDB\_LOCK\_SESSION|CDB\_LOCK\_WAIT. This means that the call will block until the lock has been acquired, and thus we do not need the retry loop.

```
int cdb_start_session2(
int sock, enum cdb_db_type db, int flags);
```

This function may be used instead of `cdb_start_session()` if it is considered necessary to have more detailed control over some aspects of the CDB session - if in doubt, use `cdb_start_session()` instead. The `sock` and `db` arguments are the same as for `cdb_start_session()`, and these values can be used for `flags` (ORed together if more than one):

```
#define CDB_LOCK_WAIT     (1 << 0)
#define CDB_LOCK_SESSION  (1 << 1)
#define CDB_LOCK_REQUEST  (1 << 2)
#define CDB_LOCK_PARTIAL  (1 << 3)
```

The flags affect sessions for the different database types as follows:

`CDB_RUNNING`

> CDB\_LOCK\_SESSION obtains a read lock for the complete session, i.e. using this flag alone is equivalent to calling `cdb_start_session()`. CDB\_LOCK\_REQUEST obtains a read lock only for the duration of each read request. This means that values of elements read in different requests may be inconsistent with each other, and the consequences of this must be carefully considered. In particular, the use of `cdb_num_instances()` and the `[n]` "integer index" notation in keypaths is inherently unsafe in this mode. Note: The implementation will not actually obtain a lock for a single-value request, since that is an atomic operation anyway. The CDB\_LOCK\_PARTIAL flag is not allowed.

`CDB_STARTUP`

> Same as CDB\_RUNNING.

`CDB_PRE_COMMIT_RUNNING`

> This database type does not have any locks, which means that it is an error to call `cdb_start_session2()` with any CDB\_LOCK\_XXX flag included in `flags`. Using a `flags` value of 0 is equivalent to calling `cdb_start_session()`.

`CDB_OPERATIONAL`

> CDB\_LOCK\_REQUEST obtains a "subscription lock" for the duration of each write request. This can be described as an "advisory exclusive" lock, i.e. only one client at a time can hold the lock (unless CDB\_LOCK\_PARTIAL is used), but the lock does not affect clients that do not attempt to obtain it. It also does not affect the reading of operational data. The purpose of this lock is to indicate that the client wants the write operation to generate subscription notifications. The lock remains in effect until any/all subscription notifications generated as a result of the write has been delivered.
>
> If the CDB\_LOCK\_PARTIAL flag is used together with CDB\_LOCK\_REQUEST, the "subscription lock" only applies to the smallest data subtree that includes all the data in the write request. This means that multiple writes that generates subscription notifications, and delivery of the corresponding notifications, can proceed in parallel as long as they affect disjunct parts of the data tree.
>
> The CDB\_LOCK\_SESSION flag is not allowed. Using a `flags` value of 0 is equivalent to calling `cdb_start_session()`.

In all cases of using CDB\_LOCK\_SESSION or CDB\_LOCK\_REQUEST described above, adding the CDB\_LOCK\_WAIT flag means that instead of failing with CONFD\_ERR\_LOCKED if the lock can not be obtained immediately, requests will wait for the lock to become available. When used with CDB\_LOCK\_SESSION it pertains to `cdb_start_session2()` itself, with CDB\_LOCK\_REQUEST it pertains to the individual requests.

While it is possible to use this function to start a session towards a configuration database type with no locking at all (`flags` = 0), this is strongly discouraged in general, since it means that even the values read in a single multi-value request (e.g. `cdb_get_object()`, see below) may be inconsistent with each other. However it is necessary to do this if we want to have a session open during semantic validation, see the "Semantic Validation" chapter in the User Guide - and in this particular case it is safe, since the transaction lock prevents changes to CDB during validation.

Reading operational data from CDB while there is an ongoing transaction, CDB will by default read through the transaction, returning the value from the transaction if it is being modified. By giving the CDB\_READ\_COMMITTED flag this behaviour can be overridden in the operational datastore, such that the value already committed to the datastore is read.

```
            #define CDB_READ_COMMITTED  (1 << 4)
        
```

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_LOCKED, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_PROTOUSAGE

```
int cdb_close(
int sock);
```

Closes the socket. `cdb_end_session()` should be called before calling this function.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

Even if the call returns an error, the socket will be closed.

```
int cdb_wait_start(
int sock);
```

This call waits until CDB has completed start-phase 1 and is available, when it is CONFD\_OK is returned. If CDB already is available (i.e. start-phase >= 1) the call returns immediately. This can be used by a CDB client who is not synchronously started and only wants to wait until it can read its configuration. The call can be used after cdb\_connect().

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS

```
int cdb_get_phase(
int sock, struct cdb_phase *phase);
```

Returns the start-phase CDB is currently in, in the struct cdb\_phase pointed to by the second argument. Also if CDB is in phase 0 and has initiated an init transaction (to load any init files) the flag CDB\_FLAG\_INIT is set in the flags field of struct cdb\_phase and correspondingly if an upgrade session is started the CDB\_FLAG\_UPGRADE is set. The call can be used after cdb\_connect() and returns CONFD\_OK.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS

```
int cdb_initiate_journal_compaction(
int sock);
```

Normally CDB handles journal compaction of the config datastore automatically. If this has been turned off (in the configuration file) then the .cdb files will grow indefinitely unless this API function is called periodically to initiate compaction. This function initiates a compaction and returns immediately (if the datastore is unavailable, the compaction will be delayed, but eventually compaction will take place). This will also initiate compaction of the operational datastore O.cdb and snapshot datastore S.cdb but without delay.

_Errors_: -

```
int cdb_initiate_journal_dbfile_compaction(
int sock, enum cdb_dbfile_type dbfile);
```

Similar to `cdb_initiate_journal_compaction()` but initiates the compaction on the specified CDB file instead of all CDB files. The `dbfile` argument is identified by `enum cdb_dbfile_type`. The valid values for NSO are

`CDB_A_CDB`

> This is the configuration datastore A.cdb

`CDB_O_CDB`

> This is the operational datastore O.cdb

`CDB_S_CDB`

> This is the snapshot datastore S.cdb

_Errors_: CONFD\_ERR\_PROTOUSAGE

```
int cdb_get_compaction_info(
int sock, enum cdb_dbfile_type dbfile, struct cdb_compaction_info *info);
```

Returns the compaction information for the specified CDB file pointed to by the `dbfile` argument, see `cdb_initiate_journal_dbfile_compaction()` for further information. The result is stored in the `info` argument of `struct cdb_compaction_info`, containing the current file size, file size of the dbfile after the last compaction, the number of transactions since last compaction, as well as the timestamp of the last compaction.

_Errors_: CONFD\_ERR\_PROTOUSAGE, CONFD\_ERR\_UNAVAILABLE

```
int cdb_get_txid(
int sock, struct cdb_txid *txid);
```

Read the last transaction id from CDB. This function can be used if we are forced to reconnect to CDB, If the transaction id we read is identical to the last id we had prior to loosing the CDB sockets we don't have to reload our managed object data. See the User Guide for full explanation. Returns CONFD\_OK on success and CONFD\_ERR or CONFD\_EOF on failure.

```
int cdb_get_replay_txids(
int sock, struct cdb_txid **txid, int *resultlen);
```

When the subscriptionReplay functionality is enabled in confd.conf this function returns the list of available transactions that CDB can replay. The current transaction id will be the first in the list, the second at txid\[1] and so on. The number of transactions is returned in `resultlen`. In case there are no replay transactions available (the feature isn't enabled or there hasn't been any transactions yet) only one (the current) transaction id is returned. It is up to the caller to `free()` `txid` when it is no longer needed.

```
int cdb_set_timeout(
int sock, int timeout_secs);
```

A timeout for client actions can be specified via /confdConfig/cdb/clientTimeout in `confd.conf`, see the [confd.conf(5)](section5.md#ncs.conf) manual page. This function can be used to dynamically extend (or shorten) the timeout for the current action. Thus it is possible to configure a restrictive timeout in `confd.conf`, but still allow specific actions to have a longer execution time.

The function can be called either with a subscription socket during subscription delivery on that socket (including from the `iter()` function passed to `cdb_diff_iterate()`), or with a data socket that has an active session. The timeout is given in seconds from the point in time when the function is called.

> **Note**
>
> The timeout for subscription delivery is common for all the subscribers receiving notifications at a given priority. Thus calling the function during subscription delivery changes the timeout for all the subscribers that are currently processing notifications.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_PROTOUSAGE, CONFD\_ERR\_BADSTATE

```
int cdb_exists(
int sock, const char *fmt, ...);
```

Leafs in the data model may be optional, and presence containers and list entries may or may not exist. This function checks whether a node exists in CDB. Returns 0 for false, 1 for true and CONFD\_ERR or CONFD\_EOF for errors.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADPATH

```
int cdb_cd(
int sock, const char *fmt, ...);
```

Changes the working directory according to the format path. Note that this function can not be used as an existence test.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADPATH

```
int cdb_pushd(
int sock, const char *fmt, ...);
```

Similar to `cdb_cd()` but pushes the previous current directory on a stack.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSTACK, CONFD\_ERR\_BADPATH

```
int cdb_popd(
int sock);
```

Pops the top element from the directory stack and changes directory to previous directory.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSTACK

```
int cdb_getcwd(
int sock, size_t strsz, char *curdir);
```

Returns the current position as previously set by `cdb_cd()`, `cdb_pushd()`, or `cdb_popd()` as a string path. Note that what is returned is a pretty-printed version of the internal representation of the current position, it will be the shortest unique way to print the path but it might not exactly match the string given to `cdb_cd()`. The buffer in \*curdir will be NULL terminated, and no more characters than strsz-1 will be written to it.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS

```
int cdb_getcwd_kpath(
int sock, confd_hkeypath_t **kp);
```

Returns the current position like `cdb_getcwd()`, but as a pointer to a hashed keypath instead of as a string. The hkeypath is dynamically allocated, and may further contain dynamically allocated elements. The caller must free the allocated memory, easiest done by calling `confd_free_hkeypath()`.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS

```
int cdb_num_instances(
int sock, const char *fmt, ...);
```

Returns the number of entries in a list or leaf-list. On error CONFD\_ERR or CONFD\_EOF is returned.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADPATH, CONFD\_ERR\_UNAVAILABLE

```
int cdb_next_index(
int sock, const char *fmt, ...);
```

Given a path to a list entry `cdb_next_index()` returns the position (starting from 0) of the next entry (regardless of whether the path exists or not). When the list has multiple keys a `*` may be used for the last keys to make the path partially instantiated. For example if /foo/bar has three integer keys, the following pseudo code could be used to iterate over all entries with `42` as the first key:

```
/* find the first entry of /foo/bar with 42 as first key */
ix = cdb_next_index(sock, "/foo/bar{42 * *}");
for (; ix>=0; ix++) {
    int32_t k1 = 0;
    cdb_get_int32(sock, &k1, "/foo/bar[%d]/key1", ix);
    if (k1 != 42) break;
    /* ... do something with /foo/bar[%d] ... */
}
```

If there is no next entry -1 is returned. It is not possible to use this function on an ordered-by user list. On error CONFD\_ERR or CONFD\_EOF is returned.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADPATH, CONFD\_ERR\_UNAVAILABLE

```
int cdb_index(
int sock, const char *fmt, ...);
```

Given a path to a list entry `cdb_index()` returns its position (starting from 0). On error CONFD\_ERR or CONFD\_EOF is returned.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADPATH

```
int cdb_is_default(
int sock, const char *fmt, ...);
```

This function returns 1 for a leaf which has a default value defined in the data model when no value has been set, i.e. when the default value is in effect. It returns 0 for other existing leafs, and CONFD\_ERR or CONFD\_EOF for errors. There is normally no need to call this function, since CDB automatically provides the default value as needed when cdb\_get() etc is called.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_UNAVAILABLE

```
int cdb_subscribe(
int sock, int priority, int nspace, int *spoint, const char *fmt, ...);
```

Sets up a CDB subscription so that we are notified when CDB configuration data changes. There can be multiple subscription points from different sources, that is a single client daemon can have many subscriptions and there can be many client daemons.

Each subscription point is defined through a path similar to the paths we use for read operations. We can subscribe either to specific leafs or entire subtrees. Subscribing to list entries can be done using fully qualified paths, or tagpaths to match multiple entries. A path which isn't a leaf element automatically matches the subtree below that path. When specifying keys to a list entry it is possible to use the wildcard character \* which will match any key value.

When subscribing to a leaf with a `tailf:default-ref` statement, or to a subtree with elements that have `tailf:default-ref`, implicit subscriptions to the referred leafs are added. This means that a change in a referred leaf will generate a notification for the subscription that has referring leaf(s) - but currently such a change will not be reported by `cdb_diff_iterate()`. Thus to get the new "effective" value of a referring leaf in this case, it is necessary to either read the value of the leaf with e.g. `cdb_get()` - or to use a subscription that includes the referred leafs, and use `cdb_diff_iterate()` when a notification for that subscription is received.

Some examples

/hosts

> Means that we subscribe to any changes in the subtree - rooted at /hosts. This includes additions or removals of host entries as well as changes to already existing host entries.

/hosts/host{www}/interfaces/interface{eth0}/ip

> Means we are notified when host www changes its IP address on eth0.

/hosts/host/interfaces/interface/ip

> Means we are notified when any host changes any of its IP addresses.

/hosts/host/interfaces

> Means we are notified when either an interface is added/removed or when an individual leaf element in an existing interface is changed.

The `priority` value is an integer. When CDB is changed, the change is performed inside a transaction. Either a `commit` operation from the CLI or a `candidate-commit` operation in NETCONF means that the running database is changed. These changes occur inside a ConfD transaction. CDB will handle the subscriptions in lock-step priority order. First all subscribers at the lowest priority are handled, once they all have replied and synchronized through calls to `cdb_sync_subscription_socket()` the next set - at the next priority level is handled by CDB. Priority numbers are global, i.e. if there are multiple client daemons notifications will still be delivered in priority order per all subscriptions, not per daemon.

See `cdb_diff_iterate()` and cdb\_diff\_match() for ways of filtering subscription notifications and finding out what changed. The easiest way is though to not use either of the two above mentioned diff function but to solely rely on the positioning of the subscription points in the tree to figure out what changed.

`cdb_subscribe()` returns a `subscription point` in the return parameter `spoint`. This integer value is used to identify this particular subscription.

Because there can be many subscriptions on the same socket the client must notify ConfD when it is done subscribing and ready to receive notifications. This is done using `cdb_subscribe_done()`.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOEXISTS

```
int cdb_oper_subscribe(
int sock, int nspace, int *spoint, const char *fmt, ...);
```

Sets up a CDB subscription for changes in the operational data base. Similar to the subscriptions for configuration data, we can be notified of changes to the operational data stored in CDB. Note that there are several differences from the subscriptions for configuration data:

* Notifications are only generated if the writer has taken a subscription lock, see `cdb_start_session2()` above.
* Priorities are not used for these notifications.
* It is not possible to receive the previous value for modified leafs in `cdb_diff_iterate()`.
* A special synchronization reply must be used when the notifications have been read (see `cdb_sync_subscription_socket()` below).

> **Note**
>
> Operational and configuration subscriptions can be done on the same socket, but in that case the notifications may be arbitrarily interleaved, including operational notifications arriving between different configuration notifications for the same transaction. If this is a problem, use separate sockets for operational and configuration subscriptions.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOEXISTS

```
int cdb_subscribe2(
int sock, enum cdb_sub_type type, int flags, int priority, int *spoint, 
int nspace, const char *fmt, ...);
```

This function supersedes the current `cdb_subscribe()` and `cdb_oper_subscribe()` as well as makes it possible to use the new two phase subscription method. The `cdb_sub_type` is defined as:

```c
enum cdb_sub_type {
    CDB_SUB_RUNNING = 1,
    CDB_SUB_RUNNING_TWOPHASE = 2,
    CDB_SUB_OPERATIONAL = 3
};
```

The CDB subscription type `CDB_SUB_RUNNING` is the same as `cdb_subscribe()`, `CDB_SUB_OPERATIONAL` is the same as `cdb_oper_subscribe()`, and `CDB_SUB_RUNNING_TWOPHASE` does a two phase subscription.

The flags argument should be set to 0, or a combination of:

`CDB_SUB_WANT_ABORT_ON_ABORT`

> Normally if a subscriber is the one to abort a transaction it will not receive an abort notification. This flags means that this subscriber wants an abort notification even if it was the one that called cdb\_sub\_abort\_trans(). This flag is only valid when the subscription type is `CDB_SUB_RUNNING_TWOPHASE`.

The two phase subscriptions work like this: A subscriber uses `cdb_subscribe2()` with the type set to `CDB_SUB_RUNNING_TWOPHASE` to register as many subscription points as required. The `cdb_subscribe_done()` function is used to indicate that no more subscription points will be registered on that particular socket. Only after `cdb_subscribe_done()` is called will subscription notifications be delivered.

Once a transaction enters prepare state all CDB two phase subscribers will be notified in priority order (lowest priority first, subscribers with the same priority is delivered in parallel). The `cdb_read_subscription_socket2()` function will set type to `CDB_SUB_PREPARE`. Once all subscribers have acknowledged the notification by using the function `cdb_sync_subscription_socket(CDB_DONE_PRIORITY)` they will subsequently be notified when the transaction is committed. The `CDB_SUB_COMMIT` notification is the same as the current subscription mechanism, so when a transaction is committed all subscribers will be notified (again in priority order).

When a transaction is aborted, delivery of any remaining `CDB_SUB_PREPARE` notifications is cancelled. The subscribers that had already been notified with `CDB_SUB_PREPARE` will be notified with `CDB_SUB_ABORT` (This notification will be done in reverse order of the `CDB_SUB_PREPARE` notification). The transaction could be aborted because one of the subscribers that received `CDB_SUB_PREPARE` called `cdb_sub_abort_trans()`, but it could also be caused for other reasons, for example another data provider (than CDB) can abort the transaction.

> **Note**
>
> Two phase subscriptions are not supported for NCS.

> **Note**
>
> Operational and configuration subscriptions can be done on the same socket, but in that case the notifications may be arbitrarily interleaved, including operational notifications arriving between different configuration notifications for the same transaction. If this is a problem, use separate sockets for operational and configuration subscriptions.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOEXISTS

```
int cdb_subscribe_done(
int sock);
```

When a client is done registering all its subscriptions on a particular subscription socket it must call `cdb_subscribe_done()`. No notifications will be delivered until then.

```
int cdb_trigger_subscriptions(
int sock, int sub_points[], int len);
```

This function makes it possible to trigger CDB subscriptions for configuration data even though the configuration has not been modified. The caller will trigger all subscription points passed in the sub\_points array (or all subscribers if the array is of zero length) in priority order, and the call will not return until the last subscriber has called cdb\_sync\_subscription\_socket().

The call is blocking and doesn't return until all subscribers have acknowledged the notification. That means that it is not possible to use `cdb_trigger_subscriptions()` in a cdb subscriber process (without forking a process or spawning a thread) since it would cause a deadlock.

The subscription notification generated by this "synthetic" trigger will seem like a regular subscription notification to a subscription client. As such, it is possible to use `cdb_diff_iterate()` to traverse the changeset. CDB will make up this changeset in which all leafs in the configuration will appear to be set, and all list entries and presence containers will appear as if they are created.

If the client is a two-phase subscriber, a prepare notification will first be delivered and if any client aborts this synthetic transaction further delivery of subscription notification is suspended and an error is returned to the caller of `cdb_trigger_subscriptions()`. The error is the result of mapping the CONFD\_ERRCODE as set by the aborting client as described for MAAPI in the [EXTENDED ERROR REPORTING](section3.md#confd_lib_lib.extended_error_reporting) section in the [confd\_lib\_lib(3)](section3.md#confd_lib_lib) manpage. Note however that the configuration is still the way it is - so it is up to the caller of `cdb_trigger_subscriptions()` to take appropriate action (for example: raising an alarm, restarting a subsystem, or even rebooting the system).

If one or more subscription ids is passed in the subids array that are not valid, an error (`CONFD_ERR_PROTOUSAGE`) will be returned and no subscriptions will be triggered. If no subscription ids are passed this error can not occur (even if there aren't any subscribers).

```
int cdb_trigger_oper_subscriptions(
int sock, int sub_points[], int len, int flags);
```

This function works like `cdb_trigger_subscriptions()`, but for CDB subscriptions to operational data. The caller will trigger all subscription points passed in the `sub_points` array (or all operational data subscribers if the array is of zero length), and the call will not return until the last subscriber has called cdb\_sync\_subscription\_socket().

Since the generation of subscription notifications for operational data requires that the subscription lock is taken (see `cdb_start_session2()`), this function implicitly attempts to take a "global" subscription lock. If the subscription lock is already taken, the function will by default return CONFD\_ERR with `confd_errno` set to CONFD\_ERR\_LOCKED. To instead have it wait until the lock becomes available, CDB\_LOCK\_WAIT can be passed for the `flags` parameter.

```
int cdb_replay_subscriptions(
int sock, struct cdb_txid *txid, int sub_points[], int len);
```

This function makes it possible to replay the subscription events for the last configuration change to some or all CDB subscribers. This call is useful in a number of recovery scenarios, where some CDB subscribers lost connection to ConfD before having received all the changes in a transaction. The replay functionality is only available if it has been enabled in confd.conf

The caller specifies the transaction id of the last transaction that the application has completely seen and acted on. This verifies that the application has only missed (part of) the last transaction. If a different (older) transaction ID is specified, an error is returned and no subscriptions will be triggered. If the transaction id is the latest transaction ID (i.e. the caller is already up to date) nothing is triggered and CONFD\_OK is returned.

By calling this function, the caller will potentially trigger all subscription points passed in the sub\_points array (or all subscribers if the array is of zero length). The subscriptions will be triggered in priority order, and the call will not return until the last subscriber has called cdb\_sync\_subscription\_socket().

The call is blocking and doesn't return until all subscribers have acknowledged the notification. That means that it is not possible to use `cdb_replay_subscriptions()` in a cdb subscriber process (without forking a process or spawning a thread) since it would cause a deadlock.

The subscription notification generated by this "synthetic" trigger will seem like a regular subscription notification to a subscription client. It is possible to use `cdb_diff_iterate()` to traverse the changeset.

If the client is a two-phase subscriber, a prepare notification will first be delivered and if any client aborts this synthetic transaction further delivery of subscription notification is suspended and an error is returned to the caller of `cdb_replay_subscriptions()`. The error is the result of mapping the CONFD\_ERRCODE as set by the aborting client as described for MAAPI in the [EXTENDED ERROR REPORTING](section3.md#confd_lib_lib.extended_error_reporting) section in the [confd\_lib\_lib(3)](section3.md#confd_lib_lib) manpage.

```
int cdb_read_subscription_socket(
int sock, int sub_points[], int *resultlen);
```

The subscription socket - which is acquired through a call to `cdb_connect()` - must be part of the application poll set. Once the subscription socket has I/O ready to read, we must call `cdb_read_subscription_socket()` on the subscription socket.

The call will fill in the result in the array `sub_points` with a list of integer values containing _subscription points_ earlier acquired through calls to `cdb_subscribe()`. The global variable `cdb_active_subscriptions` can be read to find how many active subscriptions the application has. Make sure the `sub_points[]` array is at least this big, otherwise the confd library will write in unallocated memory.

The subscription points may be either for configuration data or operational data (if `cdb_oper_subscribe()` has been used on the same socket), but they will all be of the same "type" - i.e. a single call of the function will never deliver a mix of configuration and operational data subscription points.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS

```
int cdb_read_subscription_socket2(
int sock, enum cdb_sub_notification *type, int *flags, int *subpoints[], 
int *resultlen);
```

```c
enum cdb_sub_notification {
    CDB_SUB_PREPARE = 1,
    CDB_SUB_COMMIT = 2,
    CDB_SUB_ABORT = 3,
    CDB_SUB_OPER = 4
};
```

This is another version of the `cdb_read_subscription_socket()` with two important differences:

1. In this version _subpoints is allocated by the library_, and it is up to the caller of this function to `free()` it when it is done.
2. It is possible to retrieve the type of the subscription notification via the `type` return parameter.

All parameters except `sock` are return parameters. It is legal to pass in `flags` and `type` as `NULL` pointers (in which case type and flags cannot be retrieved). `subpoints` is an array of integers, the length is indicated in `resultlen`, it is allocated by the library, and _must be freed by the caller_. The `type` parameter is what the subscriber uses to distinguish the different types of subscription notifications.

The `flags` return parameter can have the following bits set:

`CDB_SUB_FLAG_IS_LAST`

> This bit is set when this notification is the last of its type for this subscription socket.

`CDB_SUB_FLAG_HA_IS_SECONDARY`

> This bit is set when NCS runs in HA mode, and the current node is an HA secondary. It is a convenient way for the subscriber to know when invoked on a secondary and adjust, or possibly skip, processing.

`CDB_SUB_FLAG_TRIGGER`

> This bit is set when the cause of the subscription notification is that someone called `cdb_trigger_subscriptions()`.

`CDB_SUB_FLAG_REVERT`

> If a confirming commit is aborted it will look to the CDB subscriber as if a transaction happened that is the reverse of what the original transaction was. This bit will be set when such a transaction is the cause of the notification. Note that for a two-phase subscriber both a prepare and a commit notification is delivered. However it is not possible to reply by calling `cdb_sub_abort_trans()` for the prepare notification in this case, instead the subscriber will have to take appropriate backup action if it needs to abort (for example: raise an alarm, restart, or even reboot the system).

`CDB_SUB_FLAG_HA_SYNC`

> This bit is set when the cause of the subscription notification is initial synchronization of a HA secondary from CDB on the primary.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS

```
int cdb_diff_iterate(
int sock, int subid, enum cdb_iter_ret (*iter
      kp, enum cdb_iter_op op, 
confd_value_t *oldv, confd_value_t *newv, void *state, int flags, void *initstate);
```

After reading the subscription socket the `cdb_diff_iterate()` function can be used to iterate over the changes made in CDB data that matched the particular subscription point given by `subid`.

The user defined function `iter()` will be called for each element that has been modified and matches the subscription. The `iter()` callback receives the `confd_hkeypath_t kp` which uniquely identifies which node in the data tree that is affected, the operation, and optionally the values it has before and after the transaction. The `op` parameter gives the modification as:

MOP\_CREATED

> The list entry, `presence` container, or leaf of type `empty` (unless in a `union`, see the C\_EMPTY section in [confd\_types(3)](section3.md#confd_types)) given by `kp` has been created.

MOP\_DELETED

> The list entry, `presence` container, or optional leaf given by `kp` has been deleted.
>
> If the subscription was triggered because an ancestor was deleted, the `iter()` function will not called at all if the delete was above the subscription point. However if the flag ITER\_WANT\_ANCESTOR\_DELETE is passed to `cdb_diff_iterate()` then deletes that trigger a descendant subscription will also generate a call to `iter()`, and in this case `kp` will be the path that was actually deleted.

MOP\_MODIFIED

> A descendant of the list entry given by `kp` has been modified.

MOP\_VALUE\_SET

> The value of the leaf given by `kp` has been set to `newv`.

MOP\_MOVED\_AFTER

> The list entry given by `kp`, in an `ordered-by user` list, has been moved. If `newv` is NULL, the entry has been moved first in the list, otherwise it has been moved after the entry given by `newv`. In this case `newv` is a pointer to an array of key values identifying an entry in the list. The array is terminated with an element that has type C\_NOEXISTS.

By setting the `flags` parameter ITER\_WANT\_REVERSE two-phase subscribers may use this function to traverse the reverse changeset in case of CDB\_SUB\_ABORT notification. In this scenario a two-phase subscriber traverses the changes in the prepare phase (CDB\_SUB\_PREPARE notification) and if the transaction is aborted the subscriber may iterate the inverse to the changes during the abort phase (CDB\_SUB\_ABORT notification).

For configuration subscriptions, the previous value of the node can also be passed to `iter()` if the `flags` parameter contains ITER\_WANT\_PREV, in which case `oldv` will be pointing to it (otherwise NULL). For operational data subscriptions, the ITER\_WANT\_PREV flag is ignored, and `oldv` is always NULL - there is no equivalent to CDB\_PRE\_COMMIT\_RUNNING that holds "old" operational data.

If `iter()` returns ITER\_STOP, no more iteration is done, and CONFD\_OK is returned. If `iter()` returns ITER\_RECURSE iteration continues with all children to the node. If `iter()` returns ITER\_CONTINUE iteration ignores the children to the node (if any), and continues with the node's sibling, and if `iter()` returns ITER\_UP the iteration is continued with the node's parents sibling. If, for some reason, the `iter()` function wants to return control to the caller of `cdb_diff_iterate()` _before_ all the changes has been iterated over it can return ITER\_SUSPEND. The caller then has to call `cdb_diff_iterate_resume()` to continue/finish the iteration.

The `state` parameter can be used for any user supplied state (i.e. whatever is supplied as `initstate` is passed as `state` to `iter()` in each invocation).

By default the traverse order is undefined but guaranteed to be the most efficient one. The traverse order may be changed by setting setting a bit in the `flags` parameter:

ITER\_WANT\_SCHEMA\_ORDER

> The `iter()` function will be invoked in _schema_ order (i.e. in the order in which the elements are defined in the YANG file).

ITER\_WANT\_LEAF\_FIRST\_ORDER

> The `iter()` function will be invoked for leafs first, then non-leafs.

ITER\_WANT\_LEAF\_LAST\_ORDER

> The `iter()` function will be invoked for non-leafs first, then leafs.

If the `flags` parameter ITER\_WANT\_SUPPRESS\_OPER\_DEFAULTS is given, operational default values will be skipped during iteration.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_BADSTATE, CONFD\_ERR\_PROTOUSAGE.

```
int cdb_diff_iterate_resume(
int sock, enum cdb_iter_ret reply, enum cdb_iter_ret (*iter
      kp, 
enum cdb_iter_op op, confd_value_t *oldv, confd_value_t *newv, void *state, 
void *resumestate);
```

The application _must_ call this function whenever an iterator function has returned `ITER_SUSPEND` to finish up the iteration. If the application does not wish to continue iteration it must at least call `cdb_diff_iterate_resume(s, ITER_STOP, NULL, NULL);` to clean up the state. The `reply` parameter is what the iterator function would have returned (i.e. normally ITER\_RECURSE or ITER\_CONTINUE) if it hadn't returned ITER\_SUSPEND. Note that it is up to the iterator function to somehow communicate that it has returned ITER\_SUSPEND to the caller of `cdb_diff_iterate()`, this can for example be a field in a struct for which a pointer to can passed back and forth in the `state`/`resumestate` variable.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_BADSTATE.

```
int cdb_diff_match(
int sock, int subid, struct xml_tag tags[], int tagslen);
```

This function can be invoked when a subscription point has fired. Similar to the `confd_hkp_tagmatch()` function it takes an argument which is an array of XML tags. The function will invoke `cdb_diff_iterate()` on a subscription socket. Using combinations of `ITER_STOP`, `ITER_CONTINUE` and `ITER_RECURSE` return values, the function checks a tagpath and decides whether any changes (under the subscription point) has occurred that also match the provided path `tags`. It is slightly easier to use this function than `cdb_diff_iterate()` but can also be slower since it is a general purpose matcher.

If we have a subscription point at /root, we could invoke this function as:

```
struct xml_tag tags[] = {{root_root, root__ns},
                         {root_servers, root__ns},
                         {root_server, root__ns}};
/* /root/servers/server */
int retv = cdb_diff_match(subsock, subpoint, tags, 3);
```

The function returns 1 if there were any changes under `subpoint` that matched `tags`, 0 if no match was found and `CONFD_ERR` on error.

```
int cdb_get_modifications(
int sock, int subid, int flags, confd_tag_value_t **values, int *nvalues, 
const char *fmt, ...);
```

The `cdb_get_modifications()` function can be called after reception of a subscription notification to retrieve all the changes that caused the subscription notification. The socket `s` is the subscription socket, the subscription id must also be provided. Optionally a path can be used to limit what is returned further (only changes below the supplied path will be returned), if this isn't needed fmt can be set to `NULL`.

When `cdb_get_modifications()` returns `CONFD_OK`, the results are in `values`, which is a tag value array with length `nvalues`. The library allocates memory for the results, which must be free:d by the caller. This can in all cases be done with code like this:

```
confd_tag_value_t *values;
int nvalues, i;

if (cdb_get_modifications(sock, subid, flags, &values, &nvalues,
                          "/some/path") == CONFD_OK) {
    ...
    for (i = 0; i < nvalues; i++)
        confd_free_value(CONFD_GET_TAG_VALUE(&values[i]));
    free(values);
}
```

The tag value array differs somewhat between how it is described in the [confd\_types(3)](section3.md#confd_types) manual page, most notably only the values that were modified in this transaction are included. In addition to that these are the different values of the tags depending on what happened in the transaction:

* A leaf of type `empty` that has been deleted has the value of `C_NOEXISTS`, and when it is created it has the value `C_XMLTAG`.
* A leaf or a leaf-list that has been set to a new value (or its default value) is included with that new value. If the leaf or leaf-list is optional, then when it is deleted the value is `C_NOEXISTS`.
* Presence containers are included when they are created or when they have modifications below them (by the usual `C_XMLBEGIN`, `C_XMLEND` pair). If a presence container has been deleted its tag is included, but has the value `C_NOEXISTS`.

By default `cdb_get_modifications()` does not include list instances (created, deleted, or modified) - but if the `CDB_GET_MODS_INCLUDE_LISTS` flag is included in the `flags` parameter, list instances will be included. To receive information about where a list instance in an ordered-by user list is moved, the `CDB_GET_MODS_INCLUDE_MOVES` flag must also be included in the `flags` parameter. To receive information about ancestor list entry or presence container deletion the `CDB_GET_MODS_WANT_ANCESTOR_DELETE` flag must also be included in the `flags` parameter. Created, modified and moved instances are included wrapped in the `C_XMLBEGIN` / `C_XMLEND` pair, with the keys first. A list instance moved to the beginning of the list is indicated by `C_XMLMOVEFIRST` after the keys. A list instance moved elsewhere is indicated by `C_XMLMOVEAFTER` after the keys, with the after-keys following directly after. Deleted list instances instead begin with `C_XMLBEGINDEL`, then follows the keys, immediately followed by a `C_XMLEND`.

If the `CDB_GET_MODS_SUPPRESS_DEFAULTS` flag is included in the `flags` parameter, a default value that comes into effect for a leaf due to an ancestor list entry or presence container being created will not be included, and a default value that comes into effect for a leaf due to a set value being deleted will be included as a deletion (i.e. with value `C_NOEXISTS`).

When processing a `CDB_SUB_ABORT` notification for a two phase subscription, it is also possible to request a list of "reverse" modifications instead of the normal "forward" list. This is done by including the `CDB_GET_MODS_REVERSE` flag in the `flags` parameter.

```
int cdb_get_modifications_iter(
int sock, int flags, confd_tag_value_t **values, int *nvalues);
```

The `cdb_get_modifications_iter()` is basically a convenient short-hand of the `cdb_get_modifications()` function intended to be used from within a iteration function started by `cdb_diff_iterate()`. In this case no subscription id is needed, and the path is implicitly the current position in the iteration.

Combining this call with `cdb_diff_iterate()` makes it for example possible to iterate over a list, and for each list instance fetch the changes using `cdb_get_modifications_iter()`, and then return `ITER_CONTINUE` to process next instance.

> **Note**
>
> Note: The `CDB_GET_MODS_REVERSE` flag is ignored by `cdb_get_modifications_iter()`. It will instead return a "forward" or "reverse" list of modifications for a `CDB_SUB_ABORT` notification according to whether the `ITER_WANT_REVERSE` flag was included in the `flags` parameter of the `cdb_diff_iterate()` call.

```
int cdb_get_modifications_cli(
int sock, int subid, int flags, char **str);
```

The `cdb_get_modifications_cli()` function can be called after reception of a subscription notification to retrieve all the changes that caused the subscription notification as a string in Cisco CLI format. The socket `s` is the subscription socket, the subscription id must also be provided. The `flags` parameter is a bitmask with the following bits:

ITER\_WANT\_CLI\_ORDER

> When subscription is triggered by `cdb_trigger_subscriptions()` this flag ensures that modifications are in the same order as they would be if triggered by a real commit. Use of this flag negatively impacts performance and memory consumption during the cdb\_get\_modifications\_cli call.

The CLI string is malloc(3)ed by the library, and the caller must free the memory using free(3) when it is not needed any longer.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS

```
int cdb_sync_subscription_socket(
int sock, enum cdb_subscription_sync_type st);
```

Once we have read the subscription notification through a call to `cdb_read_subscription_socket()` and optionally used the `cdb_diff_iterate()` to iterate through the changes as well as acted on the changes to CDB, we must synchronize with CDB so that CDB can continue and deliver further subscription messages to subscribers with higher priority numbers.

There are four different types of synchronization replies the application can use in the `enum cdb_subscription_sync_type` parameter:

`CDB_DONE_PRIORITY`

> This means that the application has acted on the subscription notification and CDB can continue to deliver further notifications.

`CDB_DONE_SOCKET`

> This means that we are done. But regardless of priority, CDB shall not send any further notifications to us on our socket that are related to the currently executing transaction.

`CDB_DONE_TRANSACTION`

> This means that CDB should not send any further notifications to any subscribers - including ourselves - related to the currently executing transaction.

`CDB_DONE_OPERATIONAL`

> This should be used when a subscription notification for operational data has been read. It is the only type that should be used in this case, since the operational data does not have transactions and the notifications do not have priorities.

When using two phase subscriptions and `cdb_read_subscription_socket2()` has returned the type as `CDB_SUB_PREPARE` or `CDB_SUB_ABORT` the only valid response is `CDB_DONE_PRIORITY`.

For configuration data, the transaction that generated the subscription notifications is pending until all notifications have been acknowledged. A read lock on CDB is in effect while notifications are being delivered, preventing writes until delivery is complete.

For operational data, the writer that generated the subscription notifications is not directly affected, but the "subscription lock" remains in effect until all notifications have been acknowledged - thus subsequent attempts to obtain a "global" subscription lock, or a subscription lock using CDB\_LOCK\_PARTIAL for a non-disjuct subtree, will fail or block while notifications are being delivered (see `cdb_start_session2()` above). Write operations that don't attempt to obtain the subscription lock will proceed independent of the delivery of subscription notifications.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS

```
int cdb_sub_progress(
int sock, const char *fmt, ...);
```

After receiving a subscription notification (using `cdb_read_subscription_socket()`) but before acknowledging it (or aborting, in the case of prepare subscriptions), it is possible to send progress reports back to ConfD using the `cdb_sub_progress()` function. The socket `sock` must be the subscription socket, and it is allowed to call the function more than once to display more than one message. It is also possible to use this function in the diff-iterate callback function. A newline at the end of the string isn't necessary.

Depending on which north-bound interface that triggered the transaction, the string passed may be reported by that interface. Currently this is only presented in the CLI when the operator requests detailed reporting using the `commit | details` command.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS

```
int cdb_sub_abort_trans(
int sock, enum confd_errcode code, uint32_t apptag_ns, uint32_t apptag_tag, 
const char *fmt);
```

This function is to be called instead of `cdb_sync_subscription_socket()` when the subscriber wishes to abort the current transaction. It is only valid to call after `cdb_read_subscription_socket2()` has returned with type set to `CDB_SUB_PREPARE`. The arguments after sock are the same as to `confd_X_seterr_extended()` and give the caller a way of indicating the reason for the failure. Details can be found in the [EXTENDED ERROR REPORTING](section3.md#confd_lib_lib.extended_error_reporting) section in the [confd\_lib\_lib(3)](section3.md#confd_lib_lib) manpage.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS

```
int cdb_sub_abort_trans_info(
int sock, enum confd_errcode code, uint32_t apptag_ns, uint32_t apptag_tag, 
const confd_tag_value_t *error_info, int n, const char *fmt);
```

This function does the same as `cdb_sub_abort_trans()`, and additionally gives the possibility to provide contents for the NETCONF \<error-info> element. See the [EXTENDED ERROR REPORTING](section3.md#confd_lib_lib.extended_error_reporting) section in the [confd\_lib\_lib(3)](section3.md#confd_lib_lib) manpage.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS

```
int cdb_get_user_session(
int sock);
```

Returns the user session id for the transaction that triggered the current subscription notification. This function uses a subscription socket, and can only be called when a subscription notification for configuration data has been received on that socket, before `cdb_sync_subscription_socket()` has been called. Additionally, it is not possible to call this function from the `iter()` function passed to `cdb_diff_iterate()`. To retrieve full information about the user session, use `maapi_get_user_session()` (see [confd\_lib\_maapi(3)](section3.md#confd_lib_maapi)).

> **Note**
>
> Note: When the ConfD High Availability functionality is used, the user session information is not available on secondary nodes.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADSTATE, CONFD\_ERR\_NOEXISTS

```
int cdb_get_transaction_handle(
int sock);
```

Returns the transaction handle for the transaction that triggered the current subscription notification. This function uses a subscription socket, and can only be called when a subscription notification for configuration data has been received on that socket, before `cdb_sync_subscription_socket()` has been called. Additionally, it is not possible to call this function from the `iter()` function passed to `cdb_diff_iterate()`.

> **Note**
>
> A CDB client is not expected to access the ConfD transaction store directly - this function should only be used for logging or debugging purposes.

> **Note**
>
> When the ConfD High Availability functionality is used, the transaction information is not available on secondary nodes.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADSTATE, CONFD\_ERR\_NOEXISTS

```
int cdb_get(
int sock, confd_value_t *v, const char *fmt, ...);
```

This function reads a value from the path in `fmt` and writes the result into the result parameter `confd_value_t`. The path must lead to a leaf element in the XML data tree. Note that for the C\_BUF, C\_BINARY, C\_LIST, C\_OBJECTREF, C\_OID, C\_QNAME, C\_HEXSTR, and C\_BITBIG `confd_value_t` types, the buffer(s) pointed to are allocated using malloc(3) - it is up to the user of this interface to free them using `confd_free_value()`.

_Errors_: CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADPATH, CONFD\_ERR\_BADTYPE

All the type safe versions of `cdb_get()` described below, as well as `cdb_vget()`, also have the same possible Errors. When the type of the read value is wrong, `confd_errno` is set to CONFD\_ERR\_BADTYPE and the function returns CONFD\_ERR. The YANG type is given in the descriptions below.

```
int cdb_get_int8(
int sock, int8_t *rval, const char *fmt, ...);
```

Type safe variant of `cdb_get()` which is used to read `int8` values.

```
int cdb_get_int16(
int sock, int16_t *rval, const char *fmt, ...);
```

Type safe variant of `cdb_get()` which is used to read `int16` values.

```
int cdb_get_int32(
int sock, int32_t *rval, const char *fmt, ...);
```

Type safe variant of `cdb_get()` which is used to read `int32` values.

```
int cdb_get_int64(
int sock, int64_t *rval, const char *fmt, ...);
```

Type safe variant of `cdb_get()` which is used to read `int64` values.

```
int cdb_get_u_int8(
int sock, uint8_t *rval, const char *fmt, ...);
```

Type safe variant of `cdb_get()` which is used to read `uint8` values.

```
int cdb_get_u_int16(
int sock, uint16_t *rval, const char *fmt, ...);
```

Type safe variant of `cdb_get()` which is used to read `uint16` values.

```
int cdb_get_u_int32(
int sock, uint32_t *rval, const char *fmt, ...);
```

Type safe variant of `cdb_get()` which is used to read `uint32` values.

```
int cdb_get_u_int64(
int sock, uint64_t *rval, const char *fmt, ...);
```

Type safe variant of `cdb_get()` which is used to read `uint64` values.

```
int cdb_get_bit32(
int sock, uint32_t *rval, const char *fmt, ...);
```

Type safe variant of `cdb_get()` which is used to read `bits` values where the highest assigned bit position for the type is 31.

```
int cdb_get_bit64(
int sock, uint64_t *rval, const char *fmt, ...);
```

Type safe variant of `cdb_get()` which is used to read `bits` values where the highest assigned bit position for the type is above 31 and below 64.

```
int cdb_get_bitbig(
int sock, unsigned char **rval, int *bufsiz, const char *fmt, ...);
```

Type safe variant of `cdb_get()` which is used to read `bits` values where the highest assigned bit position for the type is above 63. Upon successful return `rval` is pointing to a buffer of size `bufsiz`. It is up to the user of this function to free the buffer using free(3) when it is not needed any longer.

```
int cdb_get_ipv4(
int sock, struct in_addr *rval, const char *fmt, ...);
```

Type safe variant of `cdb_get()` which is used to read `inet:ipv4-address` values.

```
int cdb_get_ipv6(
int sock, struct in6_addr *rval, const char *fmt, ...);
```

Type safe variant of `cdb_get()` which is used to read `inet:ipv6-address` values.

```
int cdb_get_double(
int sock, double *rval, const char *fmt, ...);
```

Type safe variant of `cdb_get()` which is used to read `xs:float` and `xs:double` values.

```
int cdb_get_bool(
int sock, int *rval, const char *fmt, ...);
```

Type safe variant of `cdb_get()` which is used to read `boolean` values.

```
int cdb_get_datetime(
int sock, struct confd_datetime *rval, const char *fmt, ...);
```

Type safe variant of `cdb_get()` which is used to read `date-and-time` values.

```
int cdb_get_date(
int sock, struct confd_date *rval, const char *fmt, ...);
```

Type safe variant of `cdb_get()` which is used to read `xs:date` values.

```
int cdb_get_time(
int sock, struct confd_time *rval, const char *fmt, ...);
```

Type safe variant of `cdb_get()` which is used to read `xs:time` values.

```
int cdb_get_duration(
int sock, struct confd_duration *rval, const char *fmt, ...);
```

Type safe variant of `cdb_get()` which is used to read `xs:duration` values.

```
int cdb_get_enum_value(
int sock, int32_t *rval, const char *fmt, ...);
```

Type safe variant of `cdb_get()` which is used to read enumeration values. If we have:

```
typedef unboundedType {
  type enumeration {
    enum unbounded;
    enum infinity;
  }
}
```

The two enumeration values `unbounded` and `infinity` will occur as two #define integers in the .h file which is generated from the YANG module. Thus this function `cdb_get_enum_value()` populates an unsigned integer pointer.

```
int cdb_get_objectref(
int sock, confd_hkeypath_t **rval, const char *fmt, ...);
```

Type safe variant of `cdb_get()` which is used to read `instance-identifier` values. Upon successful return `rval` is pointing to an allocated `confd_hkeypath_t`. It is up to the user of this function to free the hkeypath using `confd_free_hkeypath()` when it is not needed any longer.

```
int cdb_get_oid(
int sock, struct confd_snmp_oid **rval, const char *fmt, ...);
```

Type safe variant of `cdb_get()` which is used to read `object-identifier` values. Upon successful return `rval` is pointing to an allocated `struct confd_snmp_oid`. It is up to the user of this function to free the struct using free(3) when it is not needed any longer.

```
int cdb_get_buf(
int sock, unsigned char **rval, int *bufsiz, const char *fmt, ...);
```

Type safe variant of `cdb_get()` which is used to read `string` values. Upon successful return `rval` is pointing to a buffer of size `bufsiz`. It is up to the user of this function to free the buffer using free(3) when it is not needed any longer.

```
int cdb_get_buf2(
int sock, unsigned char *rval, int *n, const char *fmt, ...);
```

Type safe variant of `cdb_get()` which is used to read `string` values. If the buffer returned by `cdb_get()` fits into `*n` bytes CONFD\_OK is returned and the buffer is copied into `*rval`. Upon successful return `*n` is set to the number of bytes copied into `*rval`.

```
int cdb_get_str(
int sock, char *rval, int n, const char *fmt, ...);
```

Type safe variant of `cdb_get()` which is used to read `string` values. If the buffer returned by `cdb_get()` plus a terminating NUL fits into `n` bytes CONFD\_OK is returned and the buffer is copied into `*rval` (as well as a terminating NUL character).

```
int cdb_get_binary(
int sock, unsigned char **rval, int *bufsiz, const char *fmt, ...);
```

Type safe variant of `cdb_get()`, as `cdb_get_buf()` but for `binary` values. Upon successful return `rval` is pointing to a buffer of size `bufsiz`. It is up to the user of this function to free the buffer using free(3) when it is not needed any longer.

```
int cdb_get_hexstr(
int sock, unsigned char **rval, int *bufsiz, const char *fmt, ...);
```

Type safe variant of `cdb_get()`, as `cdb_get_buf()` but for `yang:hex-string` values. Upon successful return `rval` is pointing to a buffer of size `bufsiz`. It is up to the user of this function to free the buffer using free(3) when it is not needed any longer.

```
int cdb_get_qname(
int sock, unsigned char **prefix, int *prefixsz, unsigned char **name, 
int *namesz, const char *fmt, ...);
```

Type safe variant of `cdb_get()` which is used to read `xs:QName` values. Note that `prefixsz` can be zero (in which case `*prefix` will be set to NULL). The space for prefix and name is allocated using `malloc()`, it is up to the user of this function to free them when no longer in use.

```
int cdb_get_list(
int sock, confd_value_t **values, int *n, const char *fmt, ...);
```

Type safe variant of `cdb_get()` which is used to read values of a YANG `leaf-list`. The function will `malloc()` an array of `confd_value_t` elements for the list, and return a pointer to the array via the `**values` parameter and the length of the array via the `*n` parameter. The caller must free the memory for the values (see `cdb_get()`) and the array itself. An example that reads and prints the elements of a list of strings:

```
confd_value_t *values = NULL;
int i, n = 0;

cdb_get_list(sock, &values, &n, "/system/cards");
for (i = 0; i < n; i++) {
    printf("card %d: %s\n", i, CONFD_GET_BUFPTR(&values[i]));
    confd_free_value(&values[i]);
}
free(values);
```

```
int cdb_get_ipv4prefix(
int sock, struct confd_ipv4_prefix *rval, const char *fmt, ...);
```

Type safe variant of `cdb_get()` which is used to read `inet:ipv4-prefix` values.

```
int cdb_get_ipv6prefix(
int sock, struct confd_ipv6_prefix *rval, const char *fmt, ...);
```

Type safe variant of `cdb_get()` which is used to read `inet:ipv6-prefix` values.

```
int cdb_get_decimal64(
int sock, struct confd_decimal64 *rval, const char *fmt, ...);
```

Type safe variant of `cdb_get()` which is used to read `decimal64` values.

```
int cdb_get_identityref(
int sock, struct confd_identityref *rval, const char *fmt, ...);
```

Type safe variant of `cdb_get()` which is used to read `identityref` values.

```
int cdb_get_ipv4_and_plen(
int sock, struct confd_ipv4_prefix *rval, const char *fmt, ...);
```

Type safe variant of `cdb_get()` which is used to read `tailf:ipv4-address-and-prefix-length` values.

```
int cdb_get_ipv6_and_plen(
int sock, struct confd_ipv6_prefix *rval, const char *fmt, ...);
```

Type safe variant of `cdb_get()` which is used to read `tailf:ipv6-address-and-prefix-length` values.

```
int cdb_get_dquad(
int sock, struct confd_dotted_quad *rval, const char *fmt, ...);
```

Type safe variant of `cdb_get()` which is used to read `yang:dotted-quad` values.

```
int cdb_vget(
int sock, confd_value_t *v, const char *fmt, va_list args);
```

This function does the same as `cdb_get()`, but takes a single `va_list` argument instead of a variable number of arguments - i.e. similar to `vprintf()`. Corresponding `va_list` variants exist for all the functions that take a path as a variable number of arguments.

```
int cdb_get_object(
int sock, confd_value_t *values, int n, const char *fmt, ...);
```

In some cases it can be motivated to read multiple values in one request - this will be more efficient since it only incurs a single round trip to ConfD, but usage is a bit more complex. This function reads at most `n` values from the container or list entry specified by the path, and places them in the `values` array, which is provided by the caller. The array is populated according to the specification of the _Value Array_ format in the _XML STRUCTURES_ section of the [confd\_types(3)](section3.md#confd_types) manual page.

When reading from a container or list entry with mixed configuration and operational data (i.e. a config container or list entry that has some number of operational elements), some elements will have the "wrong" type - i.e. operational data in a session for CDB\_RUNNING/CDB\_STARTUP, or config data in a session for CDB\_OPERATIONAL. Leaf elements of the "wrong" type will have a "value" of C\_NOEXISTS in the array, while static or (existing) optional sub-container elements will have C\_XMLTAG in all cases. Sub-containers or leafs provided by external data providers will always be represented with C\_NOEXISTS, whether config or not.

On success, the function returns the actual number of elements in the container or list entry. I.e. if the return value is bigger than `n`, only the values for the first `n` elements are in the array, and the remaining values have been discarded. Note that given the specification of the array contents, there is always a fixed upper bound on the number of actual elements, and if there are no presence sub-containers, the number is constant.

As an example, with the YANG fragment in the [PATHS](section3.md#confd_lib_cdb.paths) section above, this code could be used to read the values for interface "eth0" on host "buzz":

```
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
```

In this simple example, we assumed that the application was aware of the details of the data model, specifically that a `confd_value_t` array of length 4 would be sufficient for the values we wanted to retrieve, and at which positions in the array those values could be found. If we make use of schema information loaded from the ConfD daemon into the library (see [confd\_types(3)](section3.md#confd_types)), we can avoid "hardwiring" these details. The following, more complex, example does the same as the above, but using only the names (in the form of #defines from the header file generated by `confdc --emit-h`) of the relevant leafs:

```
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
```

See [confd\_lib\_lib(3)](section3.md#confd_lib_lib) for the specification of the `confd_max_object_size()` and `confd_next_object_node()` functions. Also worth noting is that the return value from `confd_max_object_size()` is a constant for a given node in a given data model - thus we could optimize the above by calling `confd_max_object_size()` only at the first invocation of `cdb_get_object()` for a given node, making use of the `opaque` element of `struct confd_cs_node` to store the value:

```
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
```

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADPATH

```
int cdb_get_objects(
int sock, confd_value_t *values, int n, int ix, int nobj, const char *fmt, 
...);
```

Similar to `cdb_get_object()`, but reads multiple entries of a list based on the "instance integer" otherwise given within square brackets in the path - here the path must specify the list without the instance integer. At most `n` values from each of `nobj` entries, starting at entry `ix`, are read and placed in the `values` array.

The array must be at least `n * nobj` elements long, and the values for list entry `ix + i` start at element `array[i * n]` (i.e. `ix` starts at `array[0]`, `ix+1` at `array[n]`, and so on). On success, the highest actual number of values in any of the list entries read is returned. An error (CONFD\_ERR\_NOEXISTS) will be returned if we attempt to read more entries than actually exist (i.e. if `ix + nobj - 1` is outside the range of actually existing list entries). Example - read the data for all interfaces on the host "buzz" (assuming that we have memory enough for that):

```
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
```

This simple example can of course be enhanced to use loaded schema information in a similar manner as for `cdb_get_object()` above.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOEXISTS

```
int cdb_get_values(
int sock, confd_tag_value_t *values, int n, const char *fmt, ...);
```

Read an arbitrary set of sub-elements of a container or list entry. The `values` array must be pre-populated with `n` values based on the specification of the _Tagged Value Array_ format in the _XML STRUCTURES_ section of the [confd\_types(3)](section3.md#confd_types) manual page, where the `confd_value_t` value element is given as follows:

* C\_NOEXISTS means that the value should be read from CDB and stored in the array.
* C\_PTR also means that the value should be read from CDB, but instead gives the expected type and a pointer to the type-specific variable where the value should be stored. Thus this gives a functionality similar to the type safe versions of `cdb_get()`.
* C\_XMLBEGIN and C\_XMLEND are used as per the specification.
* Key values to select list entries can be given with their values.
* As a special case, the "instance integer" can be used to select a list entry by using C\_CDBBEGIN instead of C\_XMLBEGIN (and no key values).

> **Note**
>
> When we use C\_PTR, we need to take special care to free any allocated memory. When we use C\_NOEXISTS and the value is stored in the array, we can just use `confd_free_value()` regardless of the type, since the `confd_value_t` has the type information. But with C\_PTR, only the actual value is stored in the pointed-to variable, just as for `cdb_get_buf()`, `cdb_get_binary()`, etc, and we need to free the memory specifically allocated for the types listed in the description of `cdb_get()` above. See the corresponding `cdb_get_xxx()` functions for the details of how to do this.

All elements have the same position in the array after the call, in order to simplify extraction of the values - this means that optional elements that were requested but didn't exist will have C\_NOEXISTS rather than being omitted from the array. However requesting a list entry that doesn't exist, or requesting non-CDB data, or operational vs config data, is an error. Note that when using C\_PTR, the only indication of a non-existing value is that the destination variable has not been modified - it's up to the application to set it to some "impossible" value before the call when optional leafs are read.

In this rather complex example we first read only the "name" and "enabled" values for all interfaces, and then read "ip" and "mask" for those that were enabled - a total of two requests. Note that since the "interface" list begin/end elements are in the array, the path must not include the "interface" component. When reading values from a single container, it is generally simpler to have the container component (and keys or instance integer) in the path instead.

```
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
```

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADPATH, CONFD\_ERR\_BADTYPE, CONFD\_ERR\_NOEXISTS

```
int cdb_get_case(
int sock, const char *choice, confd_value_t *rcase, const char *fmt, ...);
```

When we use the YANG `choice` statement in the data model, this function can be used to find the currently selected `case`, avoiding useless `cdb_get()` etc requests for elements that belong to other cases. The `fmt, ...` arguments give the path to the container or list entry where the choice is defined, and `choice` is the name of the choice. The case value is returned to the `confd_value_t` that `rcase` points to, as type C\_XMLTAG - i.e. we can use the `CONFD_GET_XMLTAG()` macro to retrieve the hashed tag value. If no case is currently selected (i.e. for an optional choice that doesn't have a default case), the function will fail with CONFD\_ERR\_NOEXISTS.

If we have "nested" choices, i.e. multiple levels of `choice` statements without intervening `container` or `list` statements in the data model, the `choice` argument must give a '/'-separated path with alternating choice and case names, from the data node given by the `fmt, ...` arguments to the specific choice that the request pertains to.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOEXISTS

```
int cdb_get_attrs(
int sock, uint32_t *attrs, int num_attrs, confd_attr_value_t **attr_vals, 
int *num_vals, const char *fmt, ...);
```

Retrieve attributes for a config node. These attributes are currently supported:

```
/* CONFD_ATTR_TAGS: value is C_LIST of C_BUF/C_STR */
#define CONFD_ATTR_TAGS       0x80000000
/* CONFD_ATTR_ANNOTATION: value is C_BUF/C_STR */
#define CONFD_ATTR_ANNOTATION 0x80000001
/* CONFD_ATTR_INACTIVE: value is C_BOOL 1 (i.e. "true") */
#define CONFD_ATTR_INACTIVE   0x00000000
/* CONFD_ATTR_BACKPOINTER: value is C?LIST of C_BUF/C_STR */
#define CONFD_ATTR_BACKPOINTER 0x80000003
/* CONFD_ATTR_ORIGIN: value is C_IDENTITYREF */
#define CONFD_ATTR_ORIGIN 0x80000007
/* CONFD_ATTR_ORIGINAL_VALUE: value is C_BUF/C_STR */
#define CONFD_ATTR_ORIGINAL_VALUE 0x80000005
/* CONFD_ATTR_WHEN: value is C_BUF/C_STR */
#define CONFD_ATTR_WHEN 0x80000004
/* CONFD_ATTR_REFCOUNT: value is C_UINT32 */
#define CONFD_ATTR_REFCOUNT 0x80000002
```

The `attrs` parameter is an array of attributes of length `num_attrs`, specifying the wanted attributes - if `num_attrs` is 0, all attributes are retrieved. If no attributes are found, `*num_vals` is set to 0, otherwise an array of `confd_attr_value_t` elements is allocated and populated, its address stored in `*attr_vals`, and `*num_vals` is set to the number of elements in the array. The `confd_attr_value_t` struct is defined as:

```c
typedef struct confd_attr_value {
    uint32_t attr;
    confd_value_t v;
} confd_attr_value_t;
```

If any attribute values are returned (`*num_vals` > 0), the caller must free the allocated memory by calling `confd_free_value()` for each of the `confd_value_t` elements, and `free(3)` for the `*attr_vals` array itself.

_Errors_: CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADPATH, CONFD\_ERR\_BADTYPE

```
int cdb_vget_attrs(
int sock, uint32_t *attrs, int num_attrs, confd_attr_value_t **attr_vals, 
int *num_vals, const char *fmt, va_list args);
```

This function does the same as `cdb_get_attrs()`, but takes a single `va_list` argument instead of a variable number of arguments - i.e. similar to `vprintf()`. Corresponding `va_list` variants exist for all the functions that take a path as a variable number of arguments.

### Operational Data

It is possible for an application to store operational data (i.e. status and statistical information) in CDB, instead of providing it on demand via the callback interfaces described in the [confd\_lib\_dp(3)](section3.md#confd_lib_dp) manual page. The operational database has no transactions and normally avoids the use of locks in order to provide light-weight access methods, however when the multi-value API functions below are used, all updates requested by a given function call are carried out atomically. Read about how to specify the storage of operational data in CDB via the `tailf:cdb-oper` extension in the [tailf\_yang\_extensions(5)](section5.md#tailf_yang_extensions) manual page.

To establish a session for operational data, the application needs to use `cdb_connect()` with CDB\_DATA\_SOCKET and `cdb_start_session()` with CDB\_OPERATIONAL. After this, all the read and access functions above are available for use with operational data, and additionally the write functions described below. Configuration data can not be accessed in a session for operational data, nor vice versa - however it is possible to have both types of sessions active simultaneously on two different sockets, or to alternate the use of one socket via `cdb_end_session()`. The write functions can never be used in a session for configuration data.

> **Note**
>
> In order to trigger subscriptions on operational data, we must obtain a subscription lock via the use of `cdb_start_session2()` instead of `cdb_start_session()`, see above.

In YANG it is possible to define a list of operational data without any keys. For this type of list, we use a single "pseudo" key which is always of type C\_INT64. This key isn't visible in the northbound agent interfaces, but is used in the functions described here just as if it was a "normal" key.

```
int cdb_set_elem(
int sock, confd_value_t *val, const char *fmt, ...);

int cdb_set_elem2(
int sock, const char *strval, const char *fmt, ...);
```

There are two different functions to set the value of a single leaf. The first takes the value from a `confd_value_t` struct, the second takes the string representation of the value.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADPATH, CONFD\_ERR\_BADTYPE, CONFD\_ERR\_NOT\_WRITABLE

```
int cdb_vset_elem(
int sock, confd_value_t *val, const char *fmt, va_list args);
```

This function does the same as `cdb_set_elem()`, but takes a single `va_list` argument instead of a variable number of arguments - i.e. similar to `vprintf()`. Corresponding `va_list` variants exist for all the functions that take a path as a variable number of arguments.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADPATH, CONFD\_ERR\_BADTYPE, CONFD\_ERR\_NOT\_WRITABLE

```
int cdb_create(
int sock, const char *fmt, ...);
```

Create a new list entry, presence container, or leaf of type `empty` (unless in a `union`, see the C\_EMPTY section in [confd\_types(3)](section3.md#confd_types)). Note that for list entries and containers, sub-elements will not exist until created or set via some of the other functions, thus doing implicit create via `cdb_set_object()` or `cdb_set_values()` may be preferred in this case.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOT\_WRITABLE, CONFD\_ERR\_NOTCREATABLE, CONFD\_ERR\_ALREADY\_EXISTS

```
int cdb_delete(
int sock, const char *fmt, ...);
```

Delete a list entry, presence container, or leaf of type `empty` (unless in a `union` see the C\_EMPTY section in [confd\_types(3)](section3.md#confd_types)), and all its child elements (if any).

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOT\_WRITABLE, CONFD\_ERR\_NOTDELETABLE, CONFD\_ERR\_NOEXISTS

```
int cdb_set_object(
int sock, const confd_value_t *values, int n, const char *fmt, ...);
```

Set all elements corresponding to the complete contents of a container or list entry, except for sub-lists. The `values` array must be populated with `n` values according to the specification of the _Value Array_ format in the _XML STRUCTURES_ section of the [confd\_types(3)](section3.md#confd_types) manual page.

If the container or list entry itself, or any sub-elements that are specified as existing, do not exist before this call, they will be created, otherwise the existing values will be updated. Non-mandatory leafs and presence containers that are specified as not existing in the array, i.e. with value C\_NOEXISTS, will be deleted if they existed before the call.

When writing to a container with mixed configuration and operational data (i.e. a config container or list entry that has some number of operational elements), all config leaf elements must be specified as C\_NOEXISTS in the corresponding array elements, while config sub-container elements are specified with C\_XMLTAG just as for operational data.

For a list entry, since the key elements must be present in the array, it is not required that the key values are included in the path given by `fmt`. If the key values _are_ included in the path, the values of the key elements in the array are ignored.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADPATH, CONFD\_ERR\_BADTYPE, CONFD\_ERR\_NOT\_WRITABLE

```
int cdb_set_values(
int sock, const confd_tag_value_t *values, int n, const char *fmt, ...);
```

Set arbitrary sub-elements of a container or list entry. The `values` array must be populated with `n` values according to the specification of the _Tagged Value Array_ format in the _XML STRUCTURES_ section of the [confd\_types(3)](section3.md#confd_types) manual page.

If the container or list entry itself, or any sub-elements that are specified as existing, do not exist before this call, they will be created, otherwise the existing values will be updated. Both mandatory and optional elements may be omitted from the array, and all omitted elements are left unchanged. To actually delete a non-mandatory leaf or presence container as described for `cdb_set_object()`, it may (as an extension of the format) be specified as C\_NOEXISTS instead of being omitted.

For a list entry, the key values can be specified either in the path or via key elements in the array - if the values are in the path, the key elements can be omitted from the array. For sub-lists present in the array, the key elements must of course always also be present though, immediately following the C\_XMLBEGIN element and in the order defined by the data model. It is also possible to delete a list entry by using a C\_XMLBEGINDEL element, followed by the keys in data model order, followed by a C\_XMLEND element.

For a list without keys (see above), the "pseudo" key may (or in some cases must) be present in the array, but of course there is no tag value for it, since it isn't present in the data model. In this case we must use a tag value of 0, i.e. it can be set with code like:

```
confd_tag_value_t tv[7];

CONFD_SET_TAG_INT64(&tv[1], 0, 42);
```

The same method is used when reading data from such a list with the `cdb_get_values()` function described above.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADPATH, CONFD\_ERR\_BADTYPE, CONFD\_ERR\_NOT\_WRITABLE

```
int cdb_set_case(
int sock, const char *choice, const char *scase, const char *fmt, ...);
```

When we use the YANG `choice` statement in the data model, this function can be used to select the current `case`. When configuration data is modified by northbound agents, the current case is implicitly selected (and elements for other cases potentially deleted) by the setting of elements in a choice. For operational data in CDB however, this is under direct control of the application, which needs to explicitly set the current case. Setting the case will also automatically delete elements belonging to other cases, but it is up to the application to not set any elements in the "wrong" case.

The `fmt, ...` arguments give the path to the container or list entry where the choice is defined, and `choice` and `scase` are the choice and case names. For an optional choice, it is possible to have no case at all selected. To indicate that the previously selected case should be deleted without selecting another case, we can pass NULL for the `scase` argument.

If we have "nested" choices, i.e. multiple levels of `choice` statements without intervening `container` or `list` statements in the data model, the `choice` argument must give a '/'-separated path with alternating choice and case names, from the data node given by the `fmt, ...` arguments to the specific choice that the request pertains to.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOTDELETABLE

```
int cdb_set_attr(
int sock, uint32_t attr, confd_value_t *v, const char *fmt, ...);
```

This function sets an attribute for a path in `fmt`. The path must lead to an operational config node. See `cdb_get_attrs` for the supported attributes.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADPATH, CONFD\_ERR\_BADTYPE, CONFD\_ERR\_NOT\_WRITABLE, CONFD\_ERR\_NOEXISTS

```
int cdb_vset_attr(
int sock, uint32_t attr, confd_value_t *v, const char *fmt, va_list args);
```

This function does the same as `cdb_set_attr()`, but takes a single `va_list` argument instead of a variable number of arguments - i.e. similar to `vprintf()`. Corresponding `va_list` variants exist for all the functions that take a path as a variable number of arguments.

### Ncs Specific Functions

```
struct confd_cs_node *cdb_cs_node_cd(
int sock, const char *fmt, ...);
```

Does the same thing as `confd_cs_node_cd()` (see [confd\_lib\_lib(3)](section3.md#confd_lib_lib)), but can handle paths that are ambiguous due to traversing a mount point, by sending a request to the NSO daemon. To be used when `confd_cs_node_cd()` returns `NULL` with `confd_errno` set to `CONFD_ERR_NO_MOUNT_ID`.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADPATH

### See Also

`confd_lib(3)` - Confd lib

`confd_types(3)` - ConfD C data types

The ConfD User Guide

***

## `confd_lib_dp`

`confd_lib_dp` - callback library for connecting data providers to ConfD

### Synopsis

```
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
```

### Library

ConfD Library, (`libconfd`, `-lconfd`)

### Description

The `libconfd` shared library is used to connect to the ConfD Data Provider API. The purpose of this API is to provide callback hooks so that user-written data providers can provide data stored externally to ConfD. ConfD needs this information in order to drive its northbound agents.

The library is also used to populate items in the data model which are not data or configuration items, such as statistics items from the device.

The library consists of a number of API functions whose purpose is to install different callback functions at different points in the data model tree which is the representation of the device configuration. Read more about callpoints in [tailf\_yang\_extensions(5)](section5.md#tailf_yang_extensions). Read more about how to use the library in the User Guide chapters on Operational data and External data.

### Functions

```
struct confd_daemon_ctx *confd_init_daemon(
const char *name);
```

Initializes a new daemon context or returns NULL on failure. For most of the library functions described here a daemon\_ctx is required, so we must create a daemon context before we can use them. The daemon context contains a `d_opaque` pointer which can be used by the application to pass application specific data into the callback functions.

The `name` parameter is used in various debug printouts and and is also used to uniquely identify the daemon. The `confd --status` will use this name when indicating which callpoints are registered.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_PROTOUSAGE

```
int confd_set_daemon_flags(
struct confd_daemon_ctx *dx, int flags);
```

This function modifies the API behaviour according to the flags ORed into the `flags` argument. It should be called immediately after creating the daemon context with `confd_init_daemon()`. The following flags are available:

`CONFD_DAEMON_FLAG_STRINGSONLY`

> If this flag is used, the callback functions described below will only receive string values for all instances of `confd_value_t` (i.e. the type is always `C_BUF`). The callbacks must also give only string values in their reply functions. This feature can be useful for proxy-type applications that are unaware of the types of all elements, i.e. data model agnostic.

`CONFD_DAEMON_FLAG_REG_REPLACE_DISCONNECT`

> By default, if one daemon replaces a callpoint registration made by another daemon, this is only logged, and no action is taken towards the daemon that has "lost" its registration. This can be useful in some scenarios, e.g. it is possible to have an "initial default" daemon providing "null" data for many callpoints, until the actual data provider daemons have registered. If a daemon uses the `CONFD_DAEMON_FLAG_REG_REPLACE_DISCONNECT` flag, it will instead be disconnected from ConfD if any of its registrations are replaced by another daemon, and can take action as appropriate.

`CONFD_DAEMON_FLAG_NO_DEFAULTS`

> This flag tells ConfD that the daemon does not store default values. By default, ConfD assumes that the daemon doesn't know about default values, and thus whenever default values come into effect, ConfD will issue `set_elem()` callbacks to set those values, even if they have not actually been set by the northbound agent. Similarly `set_case()` will be issued with the default case for choices that have one.
>
> When the `CONFD_DAEMON_FLAG_NO_DEFAULTS` flag is set, ConfD will only issue `set_elem()` callbacks when values have been explicitly set, and `set_case()` when a case has been selected by explicitly setting an element in the case. Specifically:
>
> * When a list entry or presence container is created, there will be no callbacks for descendant leafs with default value, or descendant choices with default case, unless values have been explicitly set.
> * When a leaf with a default value is deleted, a `remove()` callback will be issued instead of a `set_elem()` with the default value.
> * When the current case in a choice with default case is deleted without another case being selected, the `set_case()` callback will be invoked with the case value given as NULL instead of the default case.
>
> > \[!NOTE] A daemon that has the `CONFD_DAEMON_FLAG_NO_DEFAULTS` flag set _must_ reply to `get_elem()` and the other callbacks that request leaf values with a value of type C\_DEFAULT, rather than the actual default value, when the default value for a leaf is in effect. It _must_ also reply to `get_case()` with C\_DEFAULT when the default case is in effect.

`CONFD_DAEMON_FLAG_PREFER_BULK_GET`

> This flag requests that the `get_object()` callback rather than `get_elem()` should be used whenever possible, regardless of whether a "bulk hint" is given by the northbound agent. If `get_elem()` is not registered, the flag is not useful (it has no effect - `get_object()` is always used anyway), but in cases where the callpoint also covers leafs that cannot be retrieved with `get_object()`, the daemon _must_ register `get_elem()`.

`CONFD_DAEMON_FLAG_BULK_GET_CONTAINER`

> This flag tells ConfD that the data provider is prepared to handle a `get_object()` callback invocation for the toplevel ancestor container when a leaf is requested by a northbound agent, if there exists no ancestor list node but there exists such a container. If this flag is not set, `get_object()` is only invoked for list entries, and `get_elem()` is always used for leafs that do not have an ancestor list node. If both `get_object()` and `get_elem()` are registered, the choice between them is made as for list entries, i.e. based on a "bulk hint" from the northbound agent unless the flag `CONFD_DAEMON_FLAG_PREFER_BULK_GET` is also set (see above).

```
void confd_release_daemon(
struct confd_daemon_ctx *dx);
```

Returns all memory that has been allocated by `confd_init_daemon()` and other functions for the daemon context. The control socket as well as all the worker sockets must be closed by the application (before or after `confd_release_daemon()` has been called).

```
int confd_connect(
struct confd_daemon_ctx *dx, int sock, enum confd_sock_type type, const struct sockaddr *srv, 
int addrsz);
```

Connects to the ConfD daemon. The `dx` parameter is a daemon context acquired through a call to `confd_init_daemon()`.

There are two different types of connected sockets between an external daemon and ConfD.

`CONTROL_SOCKET`

> The first socket that is connected must always be a control socket. All requests from ConfD to create new transactions will arrive on the control socket, but it is also used for a number of other requests that are expected to complete quickly - the general rule is that all callbacks that do not have a corresponding `init()` callback are in fact control socket requests. There can only be one control socket for a given daemon context.

`WORKER_SOCKET`

> We must always create at least one worker socket. All transaction, data, validation, and action callbacks, except the `init()` callbacks, use a worker socket. It is possible for a daemon to have multiple worker sockets, and the `init()` callback (see e.g. `confd_register_trans_cb()`) must indicate which worker socket should be used for the subsequent requests. This makes it possible for an application to be multi-threaded, where different threads can be used for different transactions.

Returns CONFD\_OK when successful or CONFD\_ERR on connection error.

> **Note**
>
> All the callbacks that are invoked via these sockets are subject to timeouts configured in `confd.conf`, see [confd.conf(5)](section5.md#ncs.conf). The callbacks invoked via the control socket must generate a reply back to ConfD within the time configured for /confdConfig/capi/newSessionTimeout, the callbacks invoked via a worker socket within the time configured for /confdConfig/capi/queryTimeout. If either timeout is exceeded, the daemon will be considered dead, and ConfD will disconnect it by closing the control and worker sockets.

> **Note**
>
> If this call fails (i.e. does not return CONFD\_OK), the socket descriptor must be closed and a new socket created before the call is re-attempted.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_PROTOUSAGE

```
int confd_register_trans_cb(
struct confd_daemon_ctx *dx, const struct confd_trans_cbs *trans);
```

This function registers transaction callback functions. A transaction is a ConfD concept. There may be multiple sources of data for the device configuration.

In order to orchestrate transactions with multiple sources of data, ConfD implements a two-phase commit protocol towards all data sources that participate in a transaction.

Each NETCONF operation will be an individual ConfD transaction. These transactions are typically very short lived. Transactions originating from the CLI or the Web UI have longer life. The ConfD transaction can be viewed as a conceptual state machine where the different phases of the transaction are different states and the invocations of the callback functions are state transitions. The following ASCII art depicts the state machine.

```
               +-------+
               | START |
               +-------+
                   | init()
                   |
                   v
      read()   +------+          finish()
      ------>  | READ | --------------------> START
               +------+
                 ^  |
  trans_unlock() |  | trans_lock()
                 |  v
      read()  +----------+       finish()
      ------> | VALIDATE | -----------------> START
              +----------+
                   | write_start()
                   |
                   v
      write()  +-------+          finish()
      -------> | WRITE | -------------------> START
               +-------+
                   | prepare()
                   |
                   v
              +----------+   commit()   +-----------+
              | PREPARED | -----------> | COMMITTED |
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
                 START
```

The `struct confd_trans_cbs` is defined as:

```c
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

Transactions can be performed towards fours different kind of storages.

`CONFD_CANDIDATE`

> If the system has been configured so that the external database owns the candidate data share, we will have to execute candidate transactions here. Usually ConfD owns the candidate and in that case the external database will never see any CONFD\_CANDIDATE transactions.

`CONFD_RUNNING`

> This is a transaction towards the actual running configuration of the device. All write operations in a CONFD\_RUNNING transaction must be propagated to the individual subsystems that use this configuration data.

`CONFD_STARTUP`

> If the system has ben configured to support the NETCONF startup capability, this is a transaction towards the startup database.

`CONFD_OPERATIONAL`

> This value indicates a transaction towards writable operational data. This transaction is used only if there are non-config data marked as `tailf:writable true` in the YANG module.
>
> Currently, these transaction are only started by the SNMP agent, and only when writable operational data is SET over SNMP.

Which type we have is indicated through the `confd_dbname` field in the `confd_trans_ctx`.

A transaction, regardless of whether it originates from the NETCONF agent, the CLI or the Web UI, has several distinct phases:

`init()`

> This callback must always be implemented. All other callbacks are optional. This means that if the callback is set to NULL, ConfD will treat it as an implicit CONFD\_OK. `libconfd` will allocate a transaction context on behalf of the transaction and give this newly allocated structure as an argument to the `init()` callback. The structure is defined as:
>
> ```c
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
> ```c
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
> This callback is required to prepare for future read/write operations towards the data source. It could be that a file handle or socket must be established. The place to do that is usually the `init()` callback.
>
> The `init()` callback is conceptually invoked at the start of the transaction, but as an optimization, ConfD will as far as possible delay the actual invocation for a given daemon until it is required. In case of a read-only transaction, or a daemon that is only providing operational data, this can have the result that a daemon will not have any callbacks at all invoked (if none of the data elements that it provides are accessed).
>
> The callback must also indicate to `libconfd` which WORKER\_SOCKET should be used for future communications in this transaction. This is the mechanism which is used by libconfd to distribute work among multiple worker threads in the database application. If another thread than the thread which owns the CONTROL\_SOCKET should be used, it is up to the application to somehow notify that thread.
>
> The choice of descriptor is done through the API call `confd_trans_set_fd()` which sets the `fd` field in the transaction context.
>
> The callback must return CONFD\_OK, CONFD\_DELAYED\_RESPONSE or CONFD\_ERR.
>
> The transaction then enters READ state, where ConfD will perform a series of `read()` operations.

`trans_lock()`

> This callback is invoked when the validation phase of the transaction starts. If the underlying database supports real transactions, it is usually appropriate to start such a native transaction here.
>
> The callback must return CONFD\_OK, CONFD\_DELAYED\_RESPONSE, CONFD\_ERR, or CONFD\_ALREADY\_LOCKED. The transaction enters VALIDATE state, where ConfD will perform a series of `read()` operations.
>
> The trans lock is set until either `trans_unlock()` or `finish()` is called. ConfD ensures that a trans\_lock is set on a single transaction only. In the case of the CONFD\_DELAYED\_RESPONSE - to later indicate that the database is already locked, use the `confd_delayed_reply_error()` function with the special error string "locked". An alternate way to indicate that the database is already locked is to use `confd_trans_seterr_extended()` (see below) with CONFD\_ERRCODE\_IN\_USE - this is the only way to give a message in the "delayed" case. If this function is used, the callback must return CONFD\_ERR in the "normal" case, and in the "delayed" case `confd_delayed_reply_error()` must be called with a NULL argument after `confd_trans_seterr_extended()`.

`trans_unlock()`

> This callback is called when the validation of the transaction failed, or the validation is triggered explicitly (i.e. not part of a 'commit' operation). This is common in the CLI and the Web UI where the user can enter invalid data. Transactions that originate from NETCONF will never trigger this callback. If the underlying database supports real transactions and they are used, the transaction should be aborted here.
>
> The callback must return CONFD\_OK, CONFD\_DELAYED\_RESPONSE or CONFD\_ERR. The transaction re-enters READ state.

`write_start()`

> This callback is invoked when the validation succeeded and the write phase of the transaction starts. If the underlying database supports real transactions, it is usually appropriate to start such a native transaction here.
>
> The transaction enters the WRITE state. No more `read()` operations will be performed by ConfD.
>
> The callback must return CONFD\_OK, CONFD\_DELAYED\_RESPONSE, CONFD\_ERR, or CONFD\_IN\_USE.
>
> If CONFD\_IN\_USE is returned, the transaction is restarted, i.e. it effectively returns to the READ state. To give this return code after CONFD\_DELAYED\_RESPONSE, use the `confd_delayed_reply_error()` function with the special error string "in\_use". An alternative for both cases is to use `confd_trans_seterr_extended()` (see below) with CONFD\_ERRCODE\_IN\_USE - this is the only way to give a message in the "delayed" case. If this function is used, the callback must return CONFD\_ERR in the "normal" case, and in the "delayed" case `confd_delayed_reply_error()` must be called with a NULL argument after `confd_trans_seterr_extended()`.

`prepare()`

> If we have multiple sources of data it is highly recommended that the callback is implemented. The callback is called at the end of the transaction, when all read and write operations for the transaction have been performed and the transaction should prepare to commit.
>
> This callback should allocate the resources necessary for the commit, if any. The callback must return CONFD\_OK, CONFD\_DELAYED\_RESPONSE, CONFD\_ERR, or CONFD\_IN\_USE.
>
> If CONFD\_IN\_USE is returned, the transaction is restarted, i.e. it effectively returns to the READ state. To give this return code after CONFD\_DELAYED\_RESPONSE, use the `confd_delayed_reply_error()` function with the special error string "in\_use". An alternative for both cases is to use `confd_trans_seterr_extended()` (see below) with CONFD\_ERRCODE\_IN\_USE - this is the only way to give a message in the "delayed" case. If this function is used, the callback must return CONFD\_ERR in the "normal" case, and in the "delayed" case `confd_delayed_reply_error()` must be called with a NULL argument after `confd_trans_seterr_extended()`.

`commit()`

> This callback is optional. This callback is responsible for writing the data to persistent storage. Must return CONFD\_OK, CONFD\_DELAYED\_RESPONSE or CONFD\_ERR.

`abort()`

> This callback is optional. This callback is responsible for undoing whatever was done in the `prepare()` phase. Must return CONFD\_OK, CONFD\_DELAYED\_RESPONSE or CONFD\_ERR.

`finish()`

> This callback is optional. This callback is responsible for releasing resources allocated in the `init()` phase. In particular, if the application choose to use the `t_opaque` field in the `confd_trans_ctx` to hold any resources, these resources must be released here.

`interrupt()`

> This callback is optional. Unlike the other transaction callbacks, it does not imply a change of the transaction state, it is instead a notification that the user running the transaction requested that it should be interrupted (e.g. Ctrl-C in the CLI). Also unlike the other transaction callbacks, the callback request is sent asynchronously on the control socket. Registering this callback may be useful for a configuration data provider that has some (transaction or data) callbacks which require extensive processing - the callback could then determine whether one of these callbacks is being processed, and if feasible return an error from that callback instead of completing the processing. In that case, `confd_trans_seterr_extended()` with `code` `CONFD_ERRCODE_INTERRUPT` should be used.

All the callback functions (except `interrupt()`) must return CONFD\_OK, CONFD\_DELAYED\_RESPONSE or CONFD\_ERR.

It is often useful to associate an error string with a CONFD\_ERR return value. This can be done through a call to `confd_trans_seterr()` or `confd_trans_seterr_extended()`.

Depending on the situation (original caller) the error string gets propagated to the CLI, the Web UI or the NETCONF manager.

```
int confd_register_db_cb(
struct confd_daemon_ctx *dx, const struct confd_db_cbs *dbcbs);
```

We may also optionally have a set of callback functions which span over several ConfD transactions.

If the system is configured in such a way so that the external database owns the candidate data store we must implement four callback functions to do this. If ConfD owns the candidate the candidate callbacks should be set to NULL.

If ConfD owns the candidate, ConfD has been configured to support `confirmed-commit` and the _revertByCommit_ isn't enabled, then three checkpointing functions must be implemented; otherwise these should be set to NULL. When `confirmed-commit` is enabled, the user can commit the candidate with a timeout. Unless a confirming commit is given by the user before the timer expires, the system must rollback to the previous running configuration. This mechanism is controlled by the checkpoint callbacks. If the revertByCommit feature is enabled the potential rollback to previous running configuration is done using normal reversed commits, hence no checkpointing support is required in this case. See further below.

An external database may also (optionally) support the lock/unlock and lock\_partial/unlock\_partial operations. This is only interesting if there exists additional locking mechanisms towards the database - such as an external CLI which can lock the database, or if the external database owns the candidate.

Finally, the external database may optionally validate a candidate configuration. Configuration validation is preferably done through ConfD - however if a system already has implemented extensive configuration validation - the `candidate_validate()` callback can be used.

The `struct confd_db_cbs` structure looks like:

```c
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

If we have an externally implemented candidate, that is if confd.conf item /confdConfig/datastores/candidate/implementation is set to "external", we must implement the 5 candidate callbacks. Otherwise (recommended) they must be set to NULL.

If implementation is "external", all databases (if there are more than one) MUST take care of the candidate for their part of the configuration data tree. If ConfD is configured to use an external database for parts of the configuration, and the built-in CDB database is used for some parts, CDB will handle the candidate for its part. See also `misc/extern_candidate` in the examples collection.

The callback functions are are the following:

`candidate_commit()`

> This function should copy the candidate DB into the running DB. If `timeout` != 0, we should be prepared to do a rollback or act on a `candidate_confirming_commit()`. The `timeout` parameter can not be used to set a timer for when to rollback; this timer is handled by the ConfD daemon. If we terminate without having acted on the `candidate_confirming_commit()`, we MUST restart with a rollback. Thus we must remember that we are waiting for a `candidate_confirming_commit()` and we must do so on persistent storage. Must only be implemented when the external database owns the candidate.

`candidate_confirming_commit()`

> If the `timeout` in the `candidate_commit()` function is != 0, we will be either invoked here or in the `candidate_rollback_running()` function within `timeout` seconds. `candidate_confirming_commit()` should make the commit persistent, whereas a call to `candidate_rollback_running()` would copy back the previous running configuration to running.

`candidate_rollback_running()`

> If for some reason, apart from a timeout, something goes wrong, we get invoked in the `candidate_rollback_running()` function. The function should copy back the previous running configuration to running.

`candidate_reset()`

> This function is intended to copy the current running configuration into the candidate. It is invoked whenever the NETCONF operation `<discard-changes>` is executed or when a lock is released without committing.

`candidate_chk_not_modified()`

> This function should check to see if the candidate has been modified or not. Returns CONFD\_OK if no modifications has been done since the last commit or reset, and CONFD\_ERR if any uncommitted modifications exist.

`candidate_validate()`

> This callback is optional. If implemented, the task of the callback is to validate the candidate configuration. Note that the running database can be validated by the database in the `prepare()` callback. `candidate_validate()` is only meaningful when an explicit validate operation is received, e.g. through NETCONF.

`add_checkpoint_running()`

> This function should be implemented only when ConfD owns the candidate, confirmed-commit is enabled and revertByCommit is disabled.
>
> It is responsible for creating a checkpoint of the current running configuration and storing the checkpoint in non-volatile memory. When the system restarts this function should check if there is a checkpoint available, and use the checkpoint instead of running.

`del_checkpoint_running()`

> This function should delete a checkpoint created by `add_checkpoint_running()`. It is called by ConfD when a confirming commit is received unless revertByCommit is enabled.

`activate_checkpoint_running()`

> This function should rollback running to the checkpoint created by `add_checkpoint_running()`. It is called by ConfD when the timer expires or if the user session expires unless revertByCommit is enabled.

`copy_running_to_startup()`

> This function should copy running to startup. It only needs to be implemented if the startup data store is enabled.

`running_chk_not_modified()`

> This function should check to see if running has been modified or not. It only needs to be implemented if the startup data store is enabled. Returns CONFD\_OK if no modifications have been done since the last copy of running to startup, and CONFD\_ERR if any modifications exist.

`lock()`

> This should only be implemented if our database supports locking from other sources than through ConfD. In this case both the lock/unlock and lock\_partial/unlock\_partial callbacks must be implemented. If a lock on the whole database is set through e.g. NETCONF, ConfD will first make sure that no other ConfD transaction has locked the database. Then it will call `lock()` to make sure that the database is not locked by some other source (such as a non-ConfD CLI). Returns CONFD\_OK on success, and CONFD\_ERR if the lock was already held by an external entity.

`unlock()`

> Unlocks the database.

`lock_partial()`

> This should only be implemented if our database supports locking from other sources than through ConfD, see `lock()` above. This callback is invoked if a northbound agent requests a partial lock. The `paths[]` argument is an `npaths` long array of hkeypaths that identify the leafs and/or subtrees that are to be locked. The `lockid` is a reference that will be used on a subsequent corresponding `unlock_partial()` invocation.

`unlock_partial()`

> Unlocks the partial lock that was requested with `lockid`.

`delete_config()`

> Will be called for 'startup' or 'candidate' only. The database is supposed to be set to erased.

All the above callback functions must return either CONFD\_OK or CONFD\_ERR. If the system is configured so that ConfD owns the candidate, then obviously the candidate related functions need not be implemented. If the system is configured to not do confirmed commit, `candidate_confirming_commit()` and `candidate_commit()` need not to be implemented.

It is often interesting to associate an error string with a CONFD\_ERR return value. In particular the `validate()` callback must typically indicate which item was invalid and why. This can be done through a call to `confd_db_seterr()` or `confd_db_seterr_extended()`.

Depending on the situation (original caller) the error string is propagated to the CLI, the Web UI or the NETCONF manager.

```
int confd_register_data_cb(
struct confd_daemon_ctx *dx, const struct confd_data_cbs *data);
```

This function registers the data manipulation callbacks. The data model defines a number of "callpoints". Each callpoint must have an associated set of data callbacks.

Thus if our database application serves three different callpoints in the data model we must install three different sets of data manipulation callbacks - one set at each callpoint.

The data callbacks either return data back to ConfD or they do not. For example the `create()` callback does not return data whereas the `get_next()` callback does. All the callbacks that return data do so through API functions, not by means of return values from the function itself.

The `struct confd_data_cbs` is defined as:

```c
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

One of the parameters to the callback is a `confd_hkeypath_t` (h - as in hashed keypath). This is fully described in [confd\_types(3)](section3.md#confd_types).

The `cb_opaque` element can be used to pass arbitrary data to the callbacks, e.g. when the same set of callbacks is used for multiple callpoints. It is made available to the callbacks via an element with the same name in the transaction context (`tctx` argument), see the structure definition above.

If the `tailf:opaque` substatement has been used with the `tailf:callpoint` statement in the data model, the argument string is made available to the callbacks via the `callpoint_opaque` element in the transaction context.

The `flags` field in the `struct confd_data_cbs` can have the flag CONFD\_DATA\_WANT\_FILTER set. See the function `get_next()` for details.

When use of the `CONFD_ATTR_INACTIVE` attribute is enabled in the ConfD configuration (/confdConfig/enableAttributes and /confdConfig/enableInactive both set to `true`), read callbacks (`get_elem()` etc) for configuration data must observe the current value of the `hide_inactive` element in the transaction context. If it is non-zero, those callbacks must act as if data with the `CONFD_ATTR_INACTIVE` attribute set does not exist.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_PROTOUSAGE

`get_elem()`

> This callback function needs to return the value or the value with list of attributes, of a specific leaf. Assuming we have the following data model:
>
> ```
> container servers {
>   tailf:callpoint mycp;
>   list server {
>     key name;
>     max-elements 64;
>     leaf name {
>       type string;
>     }
>     leaf ip {
>       type inet:ip-address;
>     }
>     leaf port {
>       type inet:port-number;
>     }
>   }
> }
> ```
>
> For example the value of the ip leaf in the server entry whose key is "www" can be returned separately. The way to return a single data item is through `confd_data_reply_value()`. The value can optionally be returned with the attributes of the ip leaf through `confd_data_reply_value_attrs()`.
>
> The callback must return CONFD\_OK on success, CONFD\_ERR on error or CONFD\_DELAYED\_RESPONSE if the reply value is not yet available. In the latter case the application must at a later stage call `confd_data_reply_value()` or `confd_data_reply_value_attrs()` (or `confd_delayed_reply_ok()` for a write operation). If an error is discovered at the time of a delayed reply, the error is signaled through a call to `confd_delayed_reply_error()`
>
> If the leaf does not exist the callback must call `confd_data_reply_not_found()`. If the leaf has a default value defined in the data model, and no value has been set, the callback should use `confd_data_reply_value()` or `confd_data_reply_value_attrs()` with a value of type C\_DEFAULT - this makes it possible for northbound agents to leave such leafs out of the data returned to the user/manager (if requested).
>
> The implementation of `get_elem()` must be prepared to return values for all the leafs including the key(s). When ConfD invokes `get_elem()` on a key leaf it is an existence test. The application should verify whether the object exists or not.

`get_next()`

> This callback makes it possible for ConfD to traverse a set of list entries, or a set of leaf-list elements. The `next` parameter will be `-1` on the first invocation. This function should reply by means of the function `confd_data_reply_next_key()` or optionally `confd_data_reply_next_key_attrs()` that includes the attributes of list entry in the reply.
>
> If the list has a `tailf:secondary-index` statement (see [tailf\_yang\_extensions(5)](section5.md#tailf_yang_extensions)), and the entries are supposed to be retrieved according to one of the secondary indexes, the variable `tctx->secondary_index` will be set to a value greater than `0`, indicating which secondary-index is used. The first secondary-index in the definition is identified with the value `1`, the second with `2`, and so on. confdc can be used to generate `#define`s for the index names. If no secondary indexes are defined, or if the sort order should be according to the key values, `tctx->secondary_index` is `0`.
>
> If the flag CONFD\_DATA\_WANT\_FILTER is set in the `flags` fields in `struct confd_data_cbs`, ConfD may pass a filter to the data provider (e.g., if the list traversal is done due to an XPath evaluation). The filter can be seen as a hint to the data provider to optimize the list retrieval; the data provider can use the filter to ensure that it doesn't return any list entries that don't match the filter. Since it is a hint, it is ok if it returns entries that don't match the filter. However, if the data provider guarantees that all entries returned match the filter, it can set the flag CONFD\_TRANS\_CB\_FLAG\_FILTERED in `tctx->cb_flags` before calling `confd_data_reply_next_key` or `confd_data_reply_next_key_attrs()`. In this case, ConfD will not re-evaluate the filters. The CONFD\_TRANS\_CB\_FLAG\_FILTERED flag should only be set when a list filter is available.
>
> The function `confd_data_get_list_filter()` can be used by the data provider to get the filter when the first list entry is requested.
>
> To signal that no more entries exist, we reply with a NULL pointer as the key value in the `confd_data_reply_next_key()` or `confd_data_reply_next_key_attrs()` functions.
>
> The field `tctx->traversal_id` contains a unique identifier for each list traversal. I.e., it is set to a unique value before the first element is requested, and then this value is kept as the list is being traversed. If a new traversal is started, a new unique value is set.
>
> The callback must return CONFD\_OK on success, CONFD\_ERR on error or CONFD\_DELAYED\_RESPONSE if the reply value is not yet available. In the latter case the application must at a later stage call `confd_data_reply_next_key()` or `confd_data_reply_next_key_attrs()`.
>
> > \[!NOTE] For a list that does not specify a non-default sort order by means of an `ordered-by user` or `tailf:sort-order` statement, ConfD assumes that list entries are ordered strictly by increasing key (or secondary index) values. I.e., CDB's sort order. Thus, for correct operation, we must observe this order when returning list entries in a sequence of `get_next()` calls.
> >
> > A special case is the `union` type key. Entries are ordered by increasing key for their type while types are sorted in the order of appearance in 'enum confd\_vtype', see [confd\_types(3)](section3.md#confd_types). There are exceptions to this rule, namely these five types, which are always sorted at the end: `C_BUF`, `C_DURATION`, `C_INT32`, `C_UINT8`, and `C_UINT16`. Among these, `C_BUF` always comes first, and after that comes `C_DURATION`. Then follows the three integer types, `C_INT32`, `C_UINT8` and `C_UINT16`, which are sorted together in natural number order regardless of type.
> >
> > If CDB's sort order cannot be provided to ConfD for configuration data, /confdConfig/sortTransactions should be set to 'false'. See [confd.conf(5)](section5.md#ncs.conf).

`set_elem()`

> This callback writes the value of a leaf. Note that an optional leaf is created by a call to this function but `empty` leafs are treated specially. If `empty` is a member of a `union`, this callback is used. However, for backward compatibility, a different callback is used for type `empty` leafs outside of a `union`.
>
> The callback must return CONFD\_OK on success, CONFD\_ERR on error or CONFD\_DELAYED\_RESPONSE.
>
> > \[!NOTE] Type `empty` leafs part of a `union` are set using this function. Type `empty` leafs outside of `union` use `create()` and `exists()`.

`create()`

> This callback creates a new list entry, a `presence` container, a leaf of type `empty` (unless in a `union`, see the see the C\_EMPTY section in [confd\_types(3)](section3.md#confd_types)), or a leaf-list element. In the case of the servers data model above, this function need to create a new server entry. Must return CONFD\_OK on success, CONFD\_ERR on error, CONFD\_DELAYED\_RESPONSE or CONFD\_ACCUMULATE.
>
> The data provider is responsible for maintaining the order of list entries. If the list is marked as `ordered-by user` in the YANG data model, the `create()` callback must add the list entry to the end of the list.

`remove()`

> This callback is used to remove an existing list entry or `presence` container and all its sub nodes (if any), an optional leaf, or a leaf-list element. When we use the YANG `choice` statement in the data model, it may also be used to remove nodes that are not optional as such when a different `case` (or none) is selected. I.e. it must always be possible to remove cases in a choice.
>
> Must return CONFD\_OK on success, CONFD\_ERR on error, CONFD\_DELAYED\_RESPONSE or CONFD\_ACCUMULATE.

`exists_optional()`

> If we have `presence` containers or leafs of type `empty` (unless type `empty` is in a `union` or list key, see the C\_EMPTY section in [confd\_types(3)](section3.md#confd_types)), we cannot use the `get_elem()` callback to read the value of such a node, since it does not have a type. An example of a data model could be:
>
> ```
> container bs {
>   presence "";
>   tailf:callpoint bcp;
>   list b {
>     key name;
>     max-elements 64;
>     leaf name {
>       type string;
>     }
>     container opt {
>       presence "";
>       leaf ii {
>         type int32;
>       }
>     }
>     leaf foo {
>       type empty;
>     }
>   }
> }
> ```
>
> The above YANG fragment has 3 nodes that may or may not exist and that do not have a type. If we do not have any such elements, nor any operational data lists without keys (see below), we do not need to implement the `exists_optional()` callback and can set it to NULL.
>
> If we have the above data model, we must implement the `exists_optional()`, and our implementation must be prepared to reply on calls of the function for the paths /bs, /bs/b/opt, and /bs/b/foo. The leaf /bs/b/opt/ii is not mandatory, but it does have a type namely `int32`, and thus the existence of that leaf will be determined through a call to the `get_elem()` callback.
>
> The `exists_optional()` callback may also be invoked by ConfD as "existence test" for an entry in an operational data list without keys, or for a leaf-list entry. Normally this existence test is done with a `get_elem()` request for the first key, but since there are no keys, this callback is used instead. Thus if we have such lists, or leaf-lists, we must also implement this callback, and handle a request where the keypath identifies a list entry or a leaf-list element.
>
> The callback must reply to ConfD using either the `confd_data_reply_not_found()` or the `confd_data_reply_found()` function.
>
> The callback must return CONFD\_OK on success, CONFD\_ERR on error or CONFD\_DELAYED\_RESPONSE if the reply value is not yet available.

`find_next()`

> This optional callback can be registered to optimize cases where ConfD wants to start a list traversal at some other point than at the first entry of the list, or otherwise make a "jump" in a list traversal. If the callback is not registered, ConfD will use a sequence of `get_next()` calls to find the desired list entry.
>
> Where the `get_next()` callback provides a `next` parameter to indicate which keys should be returned, this callback instead provides a `type` parameter and a set of values to indicate which keys should be returned. Just like for `get_next()`, the callback should reply by calling `confd_data_reply_next_key()` or `confd_data_reply_next_key_attrs()` with the keys for the requested list entry.
>
> The `keys` parameter is a pointer to a `nkeys` elements long array of key values, or secondary index-leaf values (see below). The `type` can have one of two values:
>
> `CONFD_FIND_NEXT`
>
> > The callback should always reply with the key values for the first list entry _after_ the one indicated by the `keys` array, and a `next` value appropriate for retrieval of subsequent entries. The `keys` array may not correspond to an actual existing list entry - the callback must return the keys for the first existing entry that is "later" in the list order than the keys provided by the callback. Furthermore the number of values provided in the array (`nkeys`) may be fewer than the number of keys (or number of index-leafs for a secondary-index) in the data model, possibly even zero. This means that only the first `nkeys` values are provided, and the remaining ones should be taken to have a value "earlier" than the value for any existing list entry.
>
> `CONFD_FIND_SAME_OR_NEXT`
>
> > If the values in the `keys` array completely identify an actual existing list entry, the callback should reply with the keys for this list entry and a corresponding `next` value. Otherwise the same logic as described for `CONFD_FIND_NEXT` should be used.
>
> The `dp/find_next` example in the bundled examples collection has an implementation of the `find_next()` callback for a list with two integer keys. It shows how the `type` value and the provided keys need to be combined in order to find the requested entry - or find that no entry matching the request exists.
>
> If the list has a `tailf:secondary-index` statement (see [tailf\_yang\_extensions(5)](section5.md#tailf_yang_extensions)), the callback must examine the value of the `tctx->secondary_index` variable, as described for the `get_next()` callback. If `tctx->secondary_index` has a value greater than `0`, the `keys` and `nkeys` parameters do not represent key values, but instead values for the index leafs specified by the `tailf:index-leafs` statement for the secondary index. The callback should however still reply with the actual key values for the list entry in the `confd_data_reply_next_key()` or `confd_data_reply_next_key_attrs()` call.
>
> Once we have called `confd_data_reply_next_key()` or `confd_data_reply_next_key_attrs()`, ConfD will use `get_next()` (or `get_next_object()`) for any subsequent entry-by-entry list traversal - however we can request that this traversal should be done using `find_next()` (or `find_next_object()`) instead, by passing `-1` for the `next` parameter to `confd_data_reply_next_key()` or `confd_data_reply_next_key_attrs()`. In this case ConfD will always invoke `find_next()`/`find_next_object()` with `type` `CONFD_FIND_NEXT`, and the (complete) set of keys from the previous reply.
>
> > \[!NOTE] In the case of list traversal by means of a secondary index, the secondary index values must be unique for entry-by-entry traversal with `find_next()`/`find_next_object()` to be possible. Thus we can not pass `-1` for the `next` parameter to `confd_data_reply_next_key()` or `confd_data_reply_next_key_attrs()` in this case if the secondary index values are not unique.
>
> To signal that no entry matching the request exists, i.e. we have reached the end of the list while evaluating the request, we reply with a NULL pointer as the key value in the `confd_data_reply_next_key()` or `confd_data_reply_next_key_attrs()` function.
>
> The field `tctx->traversal_id` contains a unique identifier for each list traversal. I.e., it is set to a unique value before the first element is requested, and then this value is kept as the list is being traversed. If a new traversal is started, a new unique value is set.
>
> > \[!NOTE] For a list that does not specify a non-default sort order by means of an `ordered-by user` or `tailf:sort-order` statement, ConfD assumes that list entries are ordered strictly by increasing key (or secondary index) values. I.e., CDB's sort order. Thus, for correct operation, we must observe this order when returning list entries in a sequence of `get_next()` calls.
> >
> > A special case is the union type key. Entries are ordered by increasing key for their type while types are sorted in the order of appearance in 'enum confd\_vtype', see [confd\_types(3)](section3.md#confd_types). There are exceptions to this rule, namely these five types, which are always sorted at the end: `C_BUF`, `C_DURATION`, `C_INT32`, `C_UINT8`, and `C_UINT16`. Among these, `C_BUF` always comes first, and after that comes `C_DURATION`. Then follows the three integer types, `C_INT32`, `C_UINT8` and `C_UINT16`, which are sorted together in natural number order regardless of type.
> >
> > If CDB's sort order cannot be provided to ConfD for configuration data, /confdConfig/sortTransactions should be set to 'false'. See [confd.conf(5)](section5.md#ncs.conf).
>
> If we have registered `find_next()` (or `find_next_object()`), it is not strictly necessary to also register `get_next()` (or `get_next_object()`) - except for the case of traversal by secondary index when the secondary index values are not unique, see above. If a northbound agent does a get\_next request, and neither `get_next()` nor `get_next_object()` is registered, ConfD will instead invoke `find_next()` (or `find_next_object()`), the same way as if `-1` had been passed for the `next` parameter to `confd_data_reply_next_key()` or `confd_data_reply_next_key_attrs()` as described above - the actual `next` value passed is ignored. The very first get\_next request for a traversal (i.e. where the `next` parameter would be `-1`) will cause a find\_next invocation with `type` `CONFD_FIND_NEXT` and `nkeys` == 0, i.e. no keys provided.
>
> Similar to the `get_next()` callback, a filter may be used to optimize the list retrieval, if the flag CONFD\_DATA\_WANT\_FILTER is set in `tctx->flags` field. Otherwise this field should be set to 0.
>
> The callback must return CONFD\_OK on success, CONFD\_ERR on error or CONFD\_DELAYED\_RESPONSE if the reply value is not yet available. In the latter case the application must at a later stage call `confd_data_reply_next_key()` or `confd_data_reply_next_key_attrs()`.

`num_instances()`

> This callback can optionally be implemented. The purpose is to return the number of entries in a list, or the number of elements in a leaf-list. If the callback is set to NULL, whenever ConfD needs to calculate the number of entries in a certain list, ConfD will iterate through the entries by means of consecutive calls to the `get_next()` callback.
>
> If we have a large number of entries _and_ it is computationally cheap to calculate the number of entries in a list, it may be worth the effort to implement this callback for performance reasons.
>
> The number of entries is returned in an `confd_value_t` value of type C\_INT32. The value is returned through a call to `confd_data_reply_value()`, see code example below:
>
> ```
>     int num_instances;
>     confd_value_t v;
>
>     CONFD_SET_INT32(&v, num_instances);
>     confd_data_reply_value(trans_ctx, &v);
>     return CONFD_OK;
> ```
>
> Must return CONFD\_OK on success, CONFD\_ERR on error or CONFD\_DELAYED\_RESPONSE.

`get_object()`

> The implementation of this callback is also optional. The purpose of the callback is to return an entire object, i.e. a list entry, in one swoop. If the callback is not implemented, ConfD will retrieve the whole object through a series of calls to `get_elem()`.
>
> By default, the callback will only be called for list entries - i.e. `get_elem()` is still needed for leafs that are not defined in a list, but if there are no such leafs in the part of the data model covered by a given callpoint, the `get_elem()` callback may be omitted when `get_object()` is registered. This has the drawback that ConfD will have to invoke get\_object() even if only a single leaf in a list entry is needed though, e.g. for the existence test mentioned for `get_elem()`.
>
> However, if the `CONFD_DAEMON_FLAG_BULK_GET_CONTAINER` flag is set via `confd_set_daemon_flags()`, `get_object()` will also be used for the toplevel ancestor container (if any) when no ancestor list node exists. I.e. in this case, `get_elem()` is only needed for toplevel leafs - if there are any such leafs in the part of the data model covered by a given callpoint.
>
> When ConfD invokes the `get_elem()` callback, it is the responsibility of the application to issue calls to the reply function `confd_data_reply_value()`. The `get_object()` callback cannot use this function since it needs to return a sequence of values. The `get_object()` callback must use one of the three functions `confd_data_reply_value_array()`, `confd_data_reply_tag_value_array()` or `confd_data_reply_tag_value_attrs_array()`. See the description of these functions below for the details of the arguments passed. If the entry requested does not exist, the callback must call `confd_data_reply_not_found()`.
>
> Remember, the callback `exists_optional()` must always be implemented when we have `presence` containers or leafs of type `empty` (unless in a `union`, see the C\_EMPTY section in [confd\_types(3)](section3.md#confd_types)). If we also choose to implement the `get_object()` callback, ConfD can derive the existence of such a node through a previous call to `get_object()`. This is however not always the case, thus even if we implement `get_object()`, we must also implement `exists_optional()`if we have such nodes.
>
> If we pass an array of values which does not comply with the rules for the above functions, ConfD will notice and an error is reported to the agent which issued the request. A message is also logged to ConfD's developerLog.
>
> The callback must return CONFD\_OK on success, CONFD\_ERR on error or CONFD\_DELAYED\_RESPONSE if the reply value is not yet available.

`get_next_object()`

> The implementation of this callback is also optional. Similar to the `get_object()` callback the purpose of this callback is to return an entire object, or even multiple objects, in one swoop. It combines the functionality of `get_next()` and `get_object()` into a single callback, and adds the possibility to return multiple objects. Thus we need only implement this callback if it very important to be able to traverse a list very fast. If the callback is not implemented, ConfD will retrieve the whole object through a series of calls to `get_next()` and consecutive calls to either `get_elem()` or `get_object()`.
>
> When we have registered `get_next_object()`, it is not strictly necessary to also register `get_next()`, but omitting `get_next()` may have a serious performance impact, since there are cases (e.g. CLI tab completion) when ConfD only wants to retrieve the keys for a list. In such a case, if we have only registered `get_next_object()`, all the data for the list will be retrieved, but everything except the keys will be discarded. Also note that even if we have registered `get_next_object()`, at least one of the `get_elem()` and `get_object()` callbacks must be registered.
>
> Similar to the `get_next()` callback, if the `next` parameter is `-1` ConfD wants to retrieve the first entry in the list.
>
> Similar to the `get_next()` callback, if the `tctx->secondary_index` parameter is greater than `0` ConfD wants to retrieve the entries in the order defined by the secondary index.
>
> Similar to the `get_next()` callback, a filter may be used to optimize the list retrieval, if the flag CONFD\_DATA\_WANT\_FILTER is set in `tctx->flags` field. Otherwise this field should be set to 0.
>
> Similar to the `get_object()` callback, `get_next_object()` needs to reply with an entire object expressed as either an array of `confd_value_t` values or an array of `confd_tag_value_t` values. It must also indicate which is the _next_ entry in the list similar to the `get_next()` callback. The three functions `confd_data_reply_next_object_array()`, `confd_data_reply_next_object_tag_value_array()` and `confd_data_reply_next_object_tag_value_attrs_array()` are use to convey the return values for one object from the `get_next_object()` callback.
>
> If we want to reply with multiple objects, we must instead use one of the functions `confd_data_reply_next_object_arrays()`, `confd_data_reply_next_object_tag_value_arrays()` and `confd_data_reply_next_object_tag_value_attrs_arrays()`. These functions take an "array of object arrays", where each element in the array corresponds to the reply for a single object with `confd_data_reply_next_object_array()`, `confd_data_reply_next_object_tag_value_array()` and `confd_data_reply_next_object_tag_value_attrs_array()` respectively.
>
> If we pass an array of values which does not comply with the rules for the above functions, ConfD will notice and an error is reported to the agent which issued the request. A message is also logged to ConfD's developerLog.
>
> The callback must return CONFD\_OK on success, CONFD\_ERR on error or CONFD\_DELAYED\_RESPONSE if the reply value is not yet available.

`find_next_object()`

> The implementation of this callback is also optional. It relates to `get_next_object()` in exactly the same way as `find_next()` relates to `get_next()`. I.e. instead of a parameter `next`, we get a `type` parameter and a set of key values, or secondary index-leaf values, to indicate which object or objects to return to ConfD via one of the reply functions.
>
> Similar to the `get_next_object()` callback, if the `tctx->secondary_index` parameter is greater than `0` ConfD wants to retrieve the entries in the order defined by the secondary index. And as described for the `find_next()` callback, in this case the `keys` and `nkeys` parameters represent values for the index leafs specified by the `tailf:index-leafs` statement for the secondary index.
>
> Similar to the `get_next_object()` callback, the callback can use any of the functions `confd_data_reply_next_object_array()`, `confd_data_reply_next_object_tag_value_array()`, `confd_data_reply_next_object_tag_value_attrs_array()`, `confd_data_reply_next_object_arrays()`, `confd_data_reply_next_object_tag_value_arrays()` and `confd_data_reply_next_object_tag_value_attrs_arrays()` to return one or more objects to ConfD.
>
> If we pass an array of values which does not comply with the rules for the above functions, ConfD will notice and an error is reported to the agent which issued the request. A message is also logged to ConfD's developerLog.
>
> Similar to the `get_next()` callback, a filter may be used to optimize the list retrieval, if the flag CONFD\_DATA\_WANT\_FILTER is set in `tctx->flags` field.
>
> The callback must return CONFD\_OK on success, CONFD\_ERR on error or CONFD\_DELAYED\_RESPONSE if the reply value is not yet available.

`get_case()`

> This callback only needs to be implemented if we use the YANG `choice` statement in the part of the data model that our data provider is responsible for, but when we use choice, the callback is required. It should return the currently selected `case` for the choice given by the `choice` argument - `kp` is the path to the container or list entry where the choice is defined.
>
> In the general case, where there may be multiple levels of `choice` statements without intervening `container` or `list` statements in the data model, the choice is represented as an array of `confd_value_t` elements with the type C\_XMLTAG, terminated by an element with the type C\_NOEXISTS. This array gives a reversed path with alternating choice and case names, from the data node given by `kp` to the specific choice that the callback request pertains to - similar to how a `confd_hkeypath_t` gives a path through the data tree.
>
> If we don't have such "nested" choices in the data model, we can ignore this array aspect, and just treat the `choice` argument as a single `confd_value_t` value. The case is always represented as a `confd_value_t` with the type C\_XMLTAG. I.e. we can use CONFD\_GET\_XMLTAG() to get the choice tag from `choice` and CONFD\_SET\_XMLTAG() to set the case tag for the reply value. The callback should use `confd_data_reply_value()` to return the case value to ConfD, or `confd_data_reply_not_found()` for an optional choice without default case if no case is currently selected. If an optional choice with default case does not have a selected case, the callback should use `confd_data_reply_value()` with a value of type C\_DEFAULT.
>
> Must return CONFD\_OK on success, CONFD\_ERR on error, or CONFD\_DELAYED\_RESPONSE.

`set_case()`

> This callback is completely optional, and will only be invoked (if registered) if we use the YANG `choice` statement and provide configuration data. The callback sets the currently selected `case` for the choice given by the `kp` and `choice` arguments, and is mainly intended to make it easier to support the `get_case()` callback. ConfD will additionally invoke the `remove()` callback for all nodes in the previously selected case, i.e. if we register `set_case()`, we do not need to analyze `set_elem()` callbacks to determine the currently selected case, or figure out which nodes that should be deleted.
>
> For a choice without a `mandatory true` statement, it is possible to have no case at all selected. To indicate that the previously selected case should be deleted without selecting another case, the callback will be invoked with NULL for the `caseval` argument.
>
> The callback must return CONFD\_OK on success, CONFD\_ERR on error, CONFD\_DELAYED\_RESPONSE or CONFD\_ACCUMULATE.

`get_attrs()`

> This callback only needs to be implemented for callpoints specified for configuration data, and only if attributes are enabled in the ConfD configuration (/confdConfig/enableAttributes set to `true`). These are the currently supported attributes:
>
> ```
> /* CONFD_ATTR_TAGS: value is C_LIST of C_BUF/C_STR */
> #define CONFD_ATTR_TAGS       0x80000000
> /* CONFD_ATTR_ANNOTATION: value is C_BUF/C_STR */
> #define CONFD_ATTR_ANNOTATION 0x80000001
> /* CONFD_ATTR_INACTIVE: value is C_BOOL 1 (i.e. "true") */
> #define CONFD_ATTR_INACTIVE   0x00000000
> /* CONFD_ATTR_BACKPOINTER: value is C?LIST of C_BUF/C_STR */
> #define CONFD_ATTR_BACKPOINTER 0x80000003
> /* CONFD_ATTR_ORIGIN: value is C_IDENTITYREF */
> #define CONFD_ATTR_ORIGIN 0x80000007
> /* CONFD_ATTR_ORIGINAL_VALUE: value is C_BUF/C_STR */
> #define CONFD_ATTR_ORIGINAL_VALUE 0x80000005
> /* CONFD_ATTR_WHEN: value is C_BUF/C_STR */
> #define CONFD_ATTR_WHEN 0x80000004
> /* CONFD_ATTR_REFCOUNT: value is C_UINT32 */
> #define CONFD_ATTR_REFCOUNT 0x80000002
>
>           
> ```
>
> The `attrs` parameter is an array of attributes of length `num_attrs`, giving the requested attributes - if `num_attrs` is 0, all attributes are requested. If the node given by `kp` does not exist, the callback should reply by calling `confd_data_reply_not_found()`, otherwise it should call `confd_data_reply_attrs()`, even if no attributes are set.
>
> > \[!NOTE] It is very important to observe this distinction, i.e. to use `confd_data_reply_not_found()` when the node doesn't exist, since ConfD may use `get_attrs()` as an existence check when attributes are enabled. (This avoids doing one callback request for existence check and another to collect the attributes.)
>
> Must return CONFD\_OK on success, CONFD\_ERR on error, or CONFD\_DELAYED\_RESPONSE.

`set_attr()`

> This callback also only needs to be implemented for callpoints specified for configuration data, and only if attributes are enabled in the ConfD configuration (/confdConfig/enableAttributes set to `true`). See `get_attrs()` above for the supported attributes.
>
> The callback should set the attribute `attr` for the node given by `kp` to the value `v`. If the callback is invoked with NULL for the value argument, it means that the attribute should be deleted.
>
> The callback must return CONFD\_OK on success, CONFD\_ERR on error, CONFD\_DELAYED\_RESPONSE or CONFD\_ACCUMULATE.

`move_after()`

> This callback only needs to be implemented if we provide configuration data that has YANG lists or leaf-lists with a `ordered-by user` statement. The callback moves the list entry or leaf-list element given by `kp`. If `prevkeys` is NULL, the entry/element is moved first in the list/leaf-list, otherwise it is moved after the entry/element given by `prevkeys`. In this case, for a list, `prevkeys` is a pointer to an array of key values identifying an entry in the list. The array is terminated with an element that has type C\_NOEXISTS. For a leaf-list, `prevkeys` is a pointer to an array with the leaf-list element followed by an element that has type C\_NOEXISTS.
>
> The callback must return CONFD\_OK on success, CONFD\_ERR on error, CONFD\_DELAYED\_RESPONSE or CONFD\_ACCUMULATE.

`write_all()`

> This callback will only be invoked for a transaction hook specified with `tailf:invocation-mode per-transaction;`. It is also the only callback that is invoked for such a hook. The callback is expected to make all the modifications to the current transaction that hook functionality requires. The `kp` parameter is currently always NULL, since the callback does not pertain to any particular data node.
>
> The callback must return CONFD\_OK on success, CONFD\_ERR on error, or CONFD\_DELAYED\_RESPONSE.

The six write callbacks (excluding `write_all()`), namely `set_elem()`, `create()`, `remove()`, `set_case()`, `set_attr()`, and `move_after()` may return the value CONFD\_ACCUMULATE. If CONFD\_ACCUMULATE is returned the library will accumulate the written values as a linked list of operations. This list can later be traversed in either of the transaction callbacks `prepare()` or `commit()`.

This provides trivial transaction support for applications that want to implement the ConfD two-phase commit protocol but lacks an underlying database with proper transaction support. The write operations are available as a linked list of confd\_tr\_item structs:

```c
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

The list is available in the transaction context in the field `accumulated`. The entire list and its content will be automatically freed by the library once the transaction finishes.

```
int  confd_register_range_data_cb(
struct confd_daemon_ctx *dx, const struct confd_data_cbs *data, const confd_value_t *lower, 
const confd_value_t *upper, int numkeys, const char *fmt, ...);
```

This is a variant of `confd_register_data_cb()` which registers a set of callbacks for a range of list entries. There can thus be multiple sets of C functions registered on the same callpoint, even by different daemons. The `lower` and `upper` parameters are two `numkeys` long arrays of key values, which define the endpoints of the list range. It is also possible to do a "default" registration, by giving `lower` and `upper` as NULL (`numkeys` is ignored). The callbacks for the default registration will be invoked when the keys are not in any of the explicitly registered ranges.

The `fmt` and remaining parameters specify a string path for the list that the keys apply to, in the same form as for the [confd\_lib\_maapi(3)](section3.md#confd_lib_maapi) and [confd\_lib\_cdb(3)](section3.md#confd_lib_cdb) functions. However if the list is a sublist to another list, the key element for the parent list(s) may be completely omitted, to indicate that the registration applies to all entries for the parent list(s) (similar to CDB subscription paths).

An example that registers one set of callbacks for the range /servers/server{aaa} - /servers/server{mzz} and another set for /servers/server{naa} - /servers/server{zzz}:

```
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
```

In this example, as in most cases where this function is used, the data model defines a list with a single key, and `numkeys` is thus always `1`. However it can also be used for lists that have multiple keys, in which case the `upper` and `lower` arrays may be populated with multiple keys, upto however many keys the data model specifies for the list, and `numkeys` gives the number of keys in the arrays. If fewer keys than specified in the data model are given, the registration covers all possible values for the remaining keys, i.e. they are effectively wildcarded.

While traversal of a list with range registrations will always invoke e.g. `get_next()` only for actually registered ranges, it is also possible that a request from a northbound interface is made for data in a specific list entry. If the registrations do not cover all possible key values, such a request could be for a list entry that does not fall in any of the registered ranges, which will result in a "no registration" error. To avoid the error, we can either restrict the type of the keys such that only values that fall in the registered ranges are valid, or, for operational data, use a "default" registration as described above. In this case the daemon with the "default" registration would just reply with `confd_data_reply_not_found()` for all requests for specific data, and `confd_data_reply_next_key()` with NULL for the key values for all `get_next()` etc requests.

> **Note**
>
> For a given callpoint name, there can only be either one non-range registration or a number of range registrations that all pertain to the same list. If a range registration is done after a non-range registration or vice versa, or if a range registration is done with a different list path than earlier range registrations, the latest registration completely replaces the earlier one(s). If we want to register for the same ranges in different lists, we must thus have a unique callpoint for each list.

> **Note**
>
> Range registrations can not be used for lists that have the `tailf:secondary-index` extension, since there is no way for ConfD to traverse the registrations in secondary-index order.

```
int confd_register_usess_cb(
struct confd_daemon_ctx *dx, const struct confd_usess_cbs *ucb);
```

This function can be used to register information callbacks that are invoked for user session start and stop. The `struct confd_usess_cbs` is defined as:

```c
struct confd_usess_cbs {
    void (*start)(struct confd_daemon_ctx *dx, struct confd_user_info *uinfo);
    void (*stop)(struct confd_daemon_ctx *dx, struct confd_user_info *uinfo);
};
```

Both callbacks are optional. They can be used e.g. for a multi-threaded daemon to manage a pool of worker threads, by allocating worker threads to user sessions. In this case we would ideally allocate a worker thread the first time an `init()` callback for a given user session requires a worker socket to be assigned, and use only the `stop()` usess callback to release the worker thread - using the `start()` callback to allocate a worker thread would often mean that we allocated a thread that was never used. The `u_opaque` element in the `struct confd_user_info` can be used to manage such allocations.

> **Note**
>
> These callbacks will only be invoked if the daemon has also registered other callbacks. Furthermore, as an optimization, ConfD will delay the invocation of the `start()` callback until some other callback is invoked. This means that if no other callbacks for the daemon are invoked for the duration of a user session, neither `start()` nor `stop()` will be invoked for that user session. If we want timely notification of start and stop for all user sessions, we can subscribe to `CONFD_NOTIF_AUDIT` events, see [confd\_lib\_events(3)](section3.md#confd_lib_events).

> **Note**
>
> When we call `confd_register_done()` (see below), the `start()` callback (if registered) will be invoked for each user session that already exists.

```
int confd_register_done(
struct confd_daemon_ctx *dx);
```

When we have registered all the callbacks for a daemon (including the other types described below if we have them), we must call this function to synchronize with ConfD. No callbacks will be invoked until it has been called, and after the call, no further registrations are allowed.

```
int confd_fd_ready(
struct confd_daemon_ctx *dx, int fd);
```

The database application owns all data provider sockets to ConfD and is responsible for the polling of these sockets. When one of the ConfD sockets has I/O ready to read, the application must invoke `confd_fd_ready()` on the socket. This function will:

* Read data from ConfD
* Unmarshal this data
* Invoke the right callback with the right arguments

When this function reads the request from from ConfD it will block on `read()`, thus if it is important for the application to have nonblocking I/O, the application must dispatch I/O from ConfD in a separate thread.

The function returns the return value from the callback function, normally CONFD\_OK (0), or CONFD\_ERR (-1) on error and CONFD\_EOF (-2) when the socket to ConfD has been closed. Thus CONFD\_ERR can mean either that the callback function that was invoked returned CONFD\_ERR, or that some error condition occurred within the `confd_fd_ready()` function. These cases can be distinguished via `confd_errno`, which will be set to CONFD\_ERR\_EXTERNAL if CONFD\_ERR comes from the callback function. Thus a correct call to `confd_fd_ready()` looks like:

```
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
```

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_PROTOUSAGE, CONFD\_ERR\_EXTERNAL

```
void confd_trans_set_fd(
struct confd_trans_ctx *tctx, int sock);
```

Associate a worker socket with the transaction, or validation phase. This function must be called in the transaction and validation `init()` callbacks - a minimal implementation of a transaction `init()` callback looks like:

```
static int init(struct confd_trans_ctx *tctx)
{
    confd_trans_set_fd(tctx, workersock);
    return CONFD_OK;
}
```

```
int confd_data_get_list_filter(
struct confd_trans_ctx *tctx, struct confd_list_filter **filter);
```

This function is used from `get_next()`, `get_next_object()`, `find_next()`, or `find_next_object()` to get the filter associated with the list traversal. The filter is available if the flag CONFD\_DATA\_WANT\_FILTER is set in the `flags` fields in `struct confd_data_cbs` when the callback functions are registered.

The filter is only available when the first list entry is requested, either when the `next` parameter is -1 in `get_next()` or `get_next_object()`, or in `find_next()` or `find_next_object()`.

This function allocates the filter in `*filter`, and it must be freed by the data provider with `confd_free_list_filter()` when it is no longer used.

The filter is of type `struct confd_list_filter`:

If no filter is associated with the request, `*filter` will be set to NULL.

```c
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

```c
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
  CONFD_EXEC_CONTAINS             = 11
};
```

```c
struct confd_list_filter {
  enum confd_list_filter_type type;

  struct confd_list_filter *expr1; /* OR, AND, NOT */
  struct confd_list_filter *expr2; /* OR, AND */

  enum confd_expr_op op;           /* CMP, EXEC */
  struct xml_tag *node;            /* CMP, EXEC, EXISTS */
  int nodelen;                     /* CMP, EXEC, EXISTS */
  confd_value_t *val;              /* CMP, EXEC, ORIGIN */
};
```

The `confd_value_t val` parameter is always a C\_BUF, i.e., a string value, except when the function is `derived-from`, `derived-from-or-self` or the expression is `origin`. In this case the value is of type C\_IDENTITYREF.

The `node` array never goes into a nested list. In an `exists` expression, the `node` can refer to a leaf, leaf-list, container or list node. If it refers to a list node, the test is supposed to be true if the list is non-empty. In all other expressions, the `node` is guaranteed to refer to a leaf or leaf-list, possibly in a hierarchy of containers.

_Errors_: CONFD\_ERR\_MALLOC

```
void confd_free_list_filter(
struct confd_list_filter *filter);
```

Frees the `filter` which has been allocated by `confd_data_get_list_filter()`.

```
int confd_data_reply_value(
struct confd_trans_ctx *tctx, const confd_value_t *v);
```

This function is used to return a single data item to ConfD.

_Errors_: CONFD\_ERR\_PROTOUSAGE, CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADTYPE

```
int confd_data_reply_value_attrs(
struct confd_trans_ctx *tctx, const confd_value_t *v, const confd_attr_value_t *attrs, 
int num_attrs);
```

This function is used to return a single data item with its attributes to ConfD. It combines the functions of `confd_data_reply_value` and `confd_data_reply_attrs`.

```
int confd_data_reply_value_array(
struct confd_trans_ctx *tctx, const confd_value_t *vs, int n);
```

This function is used to return an array of values, corresponding to a complete list entry, to ConfD. It can be used by the optional `get_object()` callback. The `vs` array is populated with `n` values according to the specification of the Value Array format in the [XML STRUCTURES](section3.md#confd_types.xml_structures) section of the [confd\_types(3)](section3.md#confd_types) manual page.

Values for leaf-lists may be passed as a single array element with type C\_LIST (as described in the specification). A daemon that is _not_ using this flag can alternatively treat the leaf-list as a list, and pass an element with type C\_NOEXISTS in the array, in which case ConfD will issue separate callback invocations to retrieve the data for the leaf-list. In case the leaf-list does not exist, these extra invocations can be avoided by passing a C\_LIST with size 0 in the array.

In the easiest case, similar to the "servers" example above, we can construct a reply array as follows:

```
struct in_addr ip4 = my_get_ip(.....);
confd_value_t ret[3];

CONFD_SET_STR(&ret[0], "www");
CONFD_SET_IPV4(&ret[1], ip4);
CONFD_SET_UINT16(&ret[2], 80);
confd_data_reply_value_array(tctx, ret, 3);
```

Any containers inside the object must also be passed in the array. For example an entry in the b list used in the explanation for `exists_optional()` would have to be passed as:

```
confd_value_t ret[4];

CONFD_SET_STR(&ret[0], "b_name");
CONFD_SET_XMLTAG(&ret[1], myprefix_opt, myprefix__ns);
CONFD_SET_INT32(&ret[2], 77);
CONFD_SET_NOEXISTS(&ret[3]);

confd_data_reply_value_array(tctx, ret, 4);
```

Thus, a container or a leaf of type `empty` (unless in a `union`, see the C\_EMPTY section of [confd\_types(3)](section3.md#confd_types)) must be passed as its equivalent XML tag if it exists. But if the type `empty` leaf is inside a `union` then the `CONFD_SET_EMPTY` macro should be used. If a `presence` container or leaf of type `empty` does not exist, it must be passed as a value of C\_NOEXISTS. In the example above, the leaf foo does not exist, thus the contents of position `3` in the array.

If a `presence` container does not exist, its non existing values must not be passed - it suffices to say that the container itself does not exist. In the example above, the opt container did exist and thus we also had to pass the contained value(s), the ii leaf.

Hence, the above example represents:

```
<b>
   <name>b_name</name>
   <opt>
      <ii>77</ii>
   </opt>
</b>
```

```
int confd_data_reply_tag_value_array(
struct confd_trans_ctx *tctx, const confd_tag_value_t *tvs, int n);
```

This function is used to return an array of values, corresponding to a complete list entry, to ConfD. It can be used by the optional `get_object()` callback. The `tvs` array is populated with `n` values according to the specification of the Tagged Value Array format in the [XML STRUCTURES](section3.md#confd_types.xml_structures) section of the [confd\_types(3)](section3.md#confd_types) manual page.

I.e. the difference from `confd_data_reply_value_array()` is that the values are tagged with the node names from the data model - this means that non-existing values can simply be omitted from the array, per the specification above. Additionally the key leafs can be omitted, since they are already known by ConfD - if the key leafs are included, they will be ignored. Finally, in e.g. the case of a container with both config and non-config data, where the config data is in CDB and only the non-config data provided by the callback, the config elements can be omitted (for `confd_data_reply_value_array()` they must be included as C\_NOEXISTS elements).

However, although the tagged value array format can represent nested lists, these must not be passed via this function, since the `get_object()` callback only pertains to a single entry of one list. Nodes representing sub-lists must thus be omitted from the array, and ConfD will issue separate `get_object()` invocations to retrieve the data for those.

Values for leaf-lists may be passed as a single array element with type C\_LIST (as described in the specification). A daemon that is _not_ using this flag can alternatively treat the leaf-list as a list, and omit it from the array, in which case ConfD will issue separate callback invocations to retrieve the data for the leaf-list. In case the leaf-list does not exist, these extra invocations can be avoided by passing a C\_LIST with size 0 in the array.

Using the same examples as above, in the "servers" case, we can construct a reply array as follows:

```
struct in_addr ip4 = my_get_ip(.....);
confd_tag_value_t ret[2];
int n = 0;

CONFD_SET_TAG_IPV4(&ret[n], myprefix_ip, ip4); n++;
CONFD_SET_TAG_UINT16(&ret[n], myprefix_port, 80); n++;
confd_data_reply_tag_value_array(tctx, ret, n);
```

An entry in the b list used in the explanation for `exists_optional()` would be passed as:

```
confd_tag_value_t ret[3];
int n = 0;

CONFD_SET_TAG_XMLBEGIN(&ret[n], myprefix_opt, myprefix__ns); n++;
CONFD_SET_TAG_INT32(&ret[n], myprefix_ii, 77); n++;
CONFD_SET_TAG_XMLEND(&ret[n], myprefix_opt, myprefix__ns); n++;
confd_data_reply_tag_value_array(tctx, ret, n);
```

The C\_XMLEND element is not strictly necessary in this case, since there are no subsequent elements in the array. However it would have been required if the optional foo leaf had existed, thus it is good practice to always include both the C\_XMLBEGIN and C\_XMLEND elements for nested containers (if they exist, that is - otherwise neither must be included).

```
int confd_data_reply_tag_value_attrs_array(
struct confd_trans_ctx *tctx, const confd_tag_value_attr_t *tvas, int n);
```

This function is used to return an array of values and attributes, corresponding to a complete list entry, to ConfD. It can be used by the optional `get_object()` callback. The `tvas` array is populated with `n` values and attribute lists according to the specification of the Tagged Value Attribute Array format in the [XML STRUCTURES](section3.md#confd_types.xml_structures) section of the [confd\_types(3)](section3.md#confd_types) manual page.

I.e. the difference from `confd_data_reply_tag_value_array()` is that not only the values are tagged with the node names from the data model but also attributes for each node - this means that non-existing value-attribute pairs can simply be omitted from the array, per the specification above.

```
int confd_data_reply_next_key(
struct confd_trans_ctx *tctx, const confd_value_t *v, int num_vals_in_key, 
long next);
```

This function is used by the `get_next()` and `find_next()` callbacks to return the next key, or the next leaf-list element in case `get_next()` is invoked for a leaf-list. A list may have multiple key leafs specified in the data model. The parameter `num_vals_in_key` indicates the number of key values, i.e. the length of the `v` array. In the typical case with a list having just a single key leaf specified, `num_vals_in_key` is always 1. For a leaf-list, `num_vals_in_key` is always 1.

The `long next` will be passed into the next invocation of the `get_next()` callback if it has a value other than `-1`. Thus this value provides a means for the application to traverse the data. Since this is `long` it is possible to pass a `void*` pointing to the next list entry in the application - effectively passing a pointer to confd and getting it back in the next invocation of `get_next()`.

To indicate that no more entries exist, we reply with a NULL pointer for the `v` array. The values of the `num_vals_in_key` and `next` parameters are ignored in this case.

Passing the value `-1` for `next` has a special meaning. It tells ConfD that we want the next request for this list traversal to use the `find_next()` (or `find_next_object()`) callback instead of `get_next()` (or `get_next_object()`).

> **Note**
>
> In the case of list traversal by means of a secondary index, the secondary index values must be unique for entry-by-entry traversal with `find_next()`/`find_next_object()` to be possible. Thus we can not pass `-1` for the `next` parameter in this case if the secondary index values are not unique.

_Errors_: CONFD\_ERR\_PROTOUSAGE, CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADTYPE

```
int confd_data_reply_next_key_attrs(
struct confd_trans_ctx *tctx, const confd_value_t *v, int num_vals_in_key, 
long next, const confd_attr_value_t *attrs, int num_attrs);
```

This function is used by the `get_next()` and `find_next()` callbacks to return the next key and the list entry's attributes, or the next leaf-list element and its attributes in case `get_next()` is invoked for a leaf-list. It combines the functions of `confd_data_reply_next_key()` and `confd_data_reply_attrs`.

I.e. the difference from `confd_data_reply_next_key()` is that the next key is returned with the attributes of the list entry or the next leaf-list element is returned with its attributes in case `get_next()` is invoked for a leaf-list.

```
int confd_data_reply_not_found(
struct confd_trans_ctx *tctx);
```

This function is used by the `get_elem()` and `exists_optional()` callbacks to indicate to ConfD that a list entry or node does not exist.

_Errors_: CONFD\_ERR\_PROTOUSAGE, CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS

```
int confd_data_reply_found(
struct confd_trans_ctx *tctx);
```

This function is used by the `exists_optional()` callback to indicate to ConfD that a node does exist.

_Errors_: CONFD\_ERR\_PROTOUSAGE, CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS

```
int confd_data_reply_next_object_array(
struct confd_trans_ctx *tctx, const confd_value_t *v, int n, long next);
```

This function is used by the optional `get_next_object()` and `find_next_object()` callbacks to return an entire object including its keys, as well as the `next` parameter that has the same function as for `confd_data_reply_next_key()`. It combines the functions of `confd_data_reply_next_key()` and `confd_data_reply_value_array()`.

The array of `confd_value_t` elements must be populated in exactly the same manner as for `confd_data_reply_value_array()` and the `long next` is used in the same manner as the equivalent `next` parameter in `confd_data_reply_next_key()`. To indicate the end of the list we - similar to `confd_data_reply_next_key()` - pass a NULL pointer for the value array.

If we are replying to a `get_next_object()` or `find_next_object()` request for an operational data list without keys, we must include the "pseudo" key in the array, as the first element (i.e. preceding the actual leafs from the data model).

If we are replying to a `get_next_object()` request for a leaf-list, we must pass the value of the leaf-list element as the only element in the array.

_Errors_: CONFD\_ERR\_PROTOUSAGE, CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADTYPE

```
int confd_data_reply_next_object_tag_value_array(
struct confd_trans_ctx *tctx, const confd_tag_value_t *tv, int n, long next);
```

This function is used by the optional `get_next_object()` and `find_next_object()` callbacks to return an entire object including its keys, as well as the `next` parameter that has the same function as for `confd_data_reply_next_key()`. It combines the functions of `confd_data_reply_next_key()` and `confd_data_reply_tag_value_array()`.

Similar to how the `confd_data_reply_value_array()` has its companion function `confd_data_reply_tag_value_array()` if we want to return an object as an array of `confd_tag_value_t` values instead of an array of `confd_value_t` values, we can use this function instead of `confd_data_reply_next_object_array()` when we wish to return values from the `get_next_object()` callback.

The array of `confd_tag_value_t` elements must be populated in exactly the same manner as for `confd_data_reply_tag_value_array()` (except that the key values must be included), and the `long next` is used in the same manner as the equivalent `next` parameter in `confd_data_reply_next_key()`. The key leafs must always be given as the first elements of the array, and in the order specified in the data model. To indicate the end of the list we - similar to `confd_data_reply_next_key()` - pass a NULL pointer for the value array.

If we are replying to a `get_next_object()` or `find_next_object()` request for an operational data list without keys, the "pseudo" key must be included, as the first element in the array, with a tag value of 0 - i.e. it can be set with code like this:

```
confd_tag_value_t tv[7];

CONFD_SET_TAG_INT64(&tv[0], 0, 42);
```

Similarly, if we are replying to a `get_next_object()` request for a leaf-list, we must pass the value of the leaf-list element as the only element in the array, with a tag value of 0.

_Errors_: CONFD\_ERR\_PROTOUSAGE, CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADTYPE

```
int confd_data_reply_next_object_tag_value_attrs_array(
struct confd_trans_ctx *tctx, const confd_tag_value_attr_t *tva, int n, 
long next);
```

This function is used by the optional `get_next_object()` and `find_next_object()` callbacks. It combines the functions of `confd_data_reply_next_key_attrs()` and `confd_data_reply_tag_value_attrs_array()`.

Similar to how the `confd_data_reply_tag_value_array()` has its companion function `confd_data_reply_tag_value_attrs_array()` if we want to return an object as an array of `confd_tag_value_attr_t` values with lists of attributes instead of an array of `confd_tag_value_t` values, we can use this function instead of `confd_data_reply_next_object_tag_value_array()` when we wish to return values and attributes from the `get_next_object()` callback.

I.e. the difference from `confd_data_reply_next_object_tag_value_array()` is that the array of `confd_tag_value_attr_t` elements is used instead of `confd_tag_value_t` in exactly the same manner as for `confd_data_reply_tag_value_attrs_array()`

```
int confd_data_reply_next_object_arrays(
struct confd_trans_ctx *tctx, const struct confd_next_object *obj, int nobj, 
int timeout_millisecs);
```

This function is used by the optional `get_next_object()` and `find_next_object()` callbacks to return multiple objects including their keys, in `confd_value_t` form. The `struct confd_next_object` is defined as:

```c
struct confd_next_object {
    confd_value_t *v;
    int n;
    long next;
};
```

I.e. it corresponds exactly to the data provided for a call of `confd_data_reply_next_object_array()`. The parameter `obj` is a pointer to an `nobj` elements long array of such structs. We can also pass a timeout value for ConfD's caching of the returned data via `timeout_millisecs`. If we pass 0 for this parameter, the value configured via /confdConfig/capi/objectCacheTimeout in `confd.conf` (see [confd.conf(5)](section5.md#ncs.conf)) will be used.

The cache in ConfD may become invalid (e.g. due to timeout) before all the returned list entries have been used, and ConfD may then need to issue a new callback request based on an "intermediate" `next` value. This is done exactly as for the single-entry case, i.e. if `next` is `-1`, `find_next_object()` (or `find_next()`) will be used, with the keys from the "previous" entry, otherwise `get_next_object()` (or `get_next()`) will be used, with the given `next` value.

Thus a data provider can choose to give `next` values that uniquely identify list entries if that is convenient, or otherwise use `-1` for all `next` elements - or a combination, e.g. `-1` for all but the last entry. If any `next` value is given as `-1`, at least one of the `find_next()` and `find_next_object()` callbacks must be registered.

To indicate the end of the list we can either pass a NULL pointer for the `obj` array, or pass an array where the last `struct confd_next_object` element has the `v` element set to NULL. The latter is preferable, since we can then combine the final list entries with the end-of-list indication in the reply to a single callback invocation.

> **Note**
>
> When `next` values other than `-1` are used, these must remain valid even after the end of the list has been reached, since ConfD may still need to issue a new callback request based on an "intermediate" `next` value as described above. They can be discarded (e.g. allocated memory released) when a new `get_next_object()` or `find_next_object()` callback request for the same list in the same transaction has been received, or at the end of the transaction.

> **Note**
>
> In the case of list traversal by means of a secondary index, the secondary index values must be unique for entry-by-entry traversal with `find_next_object()`/`find_next()` to be possible. Thus we can not use `-1` for the `next` element in this case if the secondary index values are not unique.

_Errors_: CONFD\_ERR\_PROTOUSAGE, CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADTYPE

```
int confd_data_reply_next_object_tag_value_arrays(
struct confd_trans_ctx *tctx, const struct confd_tag_next_object *tobj, 
int nobj, int timeout_millisecs);
```

This function is used by the optional `get_next_object()` and `find_next_object()` callbacks to return multiple objects including their keys, in `confd_tag_value_t` form. The `struct confd_tag_next_object` is defined as:

```c
struct confd_tag_next_object {
    confd_tag_value_t *tv;
    int n;
    long next;
};
```

I.e. it corresponds exactly to the data provided for a call of `confd_data_reply_next_object_tag_value_array()`. The parameter `tobj` is a pointer to an `nobj` elements long array of such structs. We can also pass a timeout value for ConfD's caching of the returned data via `timeout_millisecs`. If we pass 0 for this parameter, the value configured via /confdConfig/capi/objectCacheTimeout in `confd.conf` (see [confd.conf(5)](section5.md#ncs.conf)) will be used.

The cache in ConfD may become invalid (e.g. due to timeout) before all the returned list entries have been used, and ConfD may then need to issue a new callback request based on an "intermediate" `next` value. This is done exactly as for the single-entry case, i.e. if `next` is `-1`, `find_next_object()` (or `find_next()`) will be used, with the keys from the "previous" entry, otherwise `get_next_object()` (or `get_next()`) will be used, with the given `next` value.

Thus a data provider can choose to give `next` values that uniquely identify list entries if that is convenient, or otherwise use `-1` for all `next` elements - or a combination, e.g. `-1` for all but the last entry. If any `next` value is given as `-1`, at least one of the `find_next()` and `find_next_object()` callbacks must be registered.

To indicate the end of the list we can either pass a NULL pointer for the `tobj` array, or pass an array where the last `struct confd_tag_next_object` element has the `tv` element set to NULL. The latter is preferable, since we can then combine the final list entries with the end-of-list indication in the reply to a single callback invocation.

> **Note**
>
> When `next` values other than `-1` are used, these must remain valid even after the end of the list has been reached, since ConfD may still need to issue a new callback request based on an "intermediate" `next` value as described above. They can be discarded (e.g. allocated memory released) when a new `get_next_object()` or `find_next_object()` callback request for the same list in the same transaction has been received, or at the end of the transaction.

> **Note**
>
> In the case of list traversal by means of a secondary index, the secondary index values must be unique for entry-by-entry traversal with `find_next_object()`/`find_next()` to be possible. Thus we can not use `-1` for the `next` element in this case if the secondary index values are not unique.

_Errors_: CONFD\_ERR\_PROTOUSAGE, CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADTYPE

```
int confd_data_reply_next_object_tag_value_attrs_arrays(
struct confd_trans_ctx *tctx, const struct confd_tag_next_object_attrs *toa, 
int nobj, int timeout_millisecs);
```

This function is used by the optional `get_next_object()` and `find_next_object()` callbacks to return multiple objects including their keys, in `confd_tag_value_attr_t` form. The `struct confd_tag_next_object_attrs` is defined as:

```c
struct confd_tag_next_object_attrs {
    confd_tag_value_attr_t *tva;
    int n;
    long next;
};
```

I.e. it corresponds exactly to the data provided for a call of `confd_data_reply_next_object_tag_value_attrs_array()`. The parameter `toa` is a pointer to an `nobj` elements long array of such structs.

I.e. the difference from `confd_data_reply_next_object_tag_value_arrays()` is that the `struct confd_tag_next_object_attrs` that has array of `tva` elements is used instead of `struct confd_tag_next_object` which has array of `tv`.

```
int confd_data_reply_attrs(
struct confd_trans_ctx *tctx, const confd_attr_value_t *attrs, int num_attrs);
```

This function is used by the `get_attrs()` callback to return the requested attribute values. The `attrs` array should be populated with `num_attrs` elements of type `confd_attr_value_t`, which is defined as:

```c
typedef struct confd_attr_value {
    uint32_t attr;
    confd_value_t v;
} confd_attr_value_t;
```

If multiple attributes were requested in the callback invocation, they should be given in the same order in the reply as in the request. Requested attributes that are not set should be omitted from the array. If none of the requested attributes are set, or no attributes at all are set when all attributes are requested, `num_attrs` should be given as 0, and the value of `attrs` is ignored.

_Errors_: CONFD\_ERR\_PROTOUSAGE, CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADTYPE

```
int confd_delayed_reply_ok(
struct confd_trans_ctx *tctx);
```

This function must be used to return the equivalent of CONFD\_OK when the actual callback returned CONFD\_DELAYED\_RESPONSE. I.e. it is appropriate for a transaction callback, a data callback for a write operation, or a validation callback, when the result is successful.

_Errors_: CONFD\_ERR\_PROTOUSAGE, CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS

```
int confd_delayed_reply_error(
struct confd_trans_ctx *tctx, const char *errstr);
```

This function must be used to return an error when the actual callback returned CONFD\_DELAYED\_RESPONSE. There are two cases where the value of `errstr` has a special significance:

"locked" after invocation of `trans_lock()`

> This is equivalent to returning CONFD\_ALREADY\_LOCKED from the callback.

"in\_use" after invocation of `write_start()` or `prepare()`

> This is equivalent to returning CONFD\_IN\_USE from the callback.

In all other cases, calling `confd_delayed_reply_error()` is equivalent to calling `confd_trans_seterr()` with the `errstr` value and returning CONFD\_ERR from the callback. It is also possible to first call `confd_trans_seterr()` (for the varargs format) or `confd_trans_seterr_extended()` etc (for [EXTENDED ERROR REPORTING](section3.md#confd_lib_lib.extended_error_reporting) as described in [confd\_lib\_lib(3)](section3.md#confd_lib_lib)), and then call `confd_delayed_reply_error()` with NULL for `errstr`.

_Errors_: CONFD\_ERR\_PROTOUSAGE, CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS

```
int confd_data_set_timeout(
struct confd_trans_ctx *tctx, int timeout_secs);
```

A data callback should normally complete "quickly", since e.g. the execution of a 'show' command in the CLI may require many data callback invocations. Thus it should be possible to set the /confdConfig/capi/queryTimeout in `confd.conf` (see above) such that it covers the longest possible execution time for any data callback. In some rare cases it may still be necessary for a data callback to have a longer execution time, and then this function can be used to extend (or shorten) the timeout for the current callback invocation. The timeout is given in seconds from the point in time when the function is called.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS

```
void confd_trans_seterr(
struct confd_trans_ctx *tctx, const char *fmt);
```

This function is used by the application to set an error string. The next transaction or data callback which returns CONFD\_ERR will have this error description attached to it. This error may propagate to the CLI, the NETCONF manager, the Web UI or the log files depending on the situation. We also use this function to propagate warning messages from the `validate()` callback if we are doing semantic validation in C. The `fmt` argument is a printf style format string.

```
void confd_trans_seterr_extended(
struct confd_trans_ctx *tctx, enum confd_errcode code, uint32_t apptag_ns, 
uint32_t apptag_tag, const char *fmt);
```

This function can be used to provide more structured error information from a transaction or data callback, see the section [EXTENDED ERROR REPORTING](section3.md#confd_lib_lib.extended_error_reporting) in [confd\_lib\_lib(3)](section3.md#confd_lib_lib).

```
int confd_trans_seterr_extended_info(
struct confd_trans_ctx *tctx, enum confd_errcode code, uint32_t apptag_ns, 
uint32_t apptag_tag, confd_tag_value_t *error_info, int n, const char *fmt);
```

This function can be used to provide structured error information in the same way as `confd_trans_seterr_extended()`, and additionally provide contents for the NETCONF \<error-info> element. See the section [EXTENDED ERROR REPORTING](section3.md#confd_lib_lib.extended_error_reporting) in [confd\_lib\_lib(3)](section3.md#confd_lib_lib).

```
void confd_db_seterr(
struct confd_db_ctx *dbx, const char *fmt);
```

This function is used by the application to set an error string. The next db callback function which returns CONFD\_ERR will have this error description attached to it. This error may propagate to the CLI, the NETCONF manager, the Web UI or the log files depending on the situation. The `fmt` argument is a printf style format string.

```
void confd_db_seterr_extended(
struct confd_db_ctx *dbx, enum confd_errcode code, uint32_t apptag_ns, 
uint32_t apptag_tag, const char *fmt);
```

This function can be used to provide more structured error information from a db callback, see the section [EXTENDED ERROR REPORTING](section3.md#confd_lib_lib.extended_error_reporting) in [confd\_lib\_lib(3)](section3.md#confd_lib_lib).

```
int confd_db_seterr_extended_info(
struct confd_db_ctx *dbx, enum confd_errcode code, uint32_t apptag_ns, 
uint32_t apptag_tag, confd_tag_value_t *error_info, int n, const char *fmt);
```

This function can be used to provide structured error information in the same way as `confd_db_seterr_extended()`, and additionally provide contents for the NETCONF \<error-info> element. See the section [EXTENDED ERROR REPORTING](section3.md#confd_lib_lib.extended_error_reporting) in [confd\_lib\_lib(3)](section3.md#confd_lib_lib).

```
int confd_db_set_timeout(
struct confd_db_ctx *dbx, int timeout_secs);
```

Some of the DB callbacks registered via `confd_register_db_cb()`, e.g. `copy_running_to_startup()`, may require a longer execution time than others, and in these cases the timeout specified for /confdConfig/capi/newSessionTimeout may be insufficient. This function can then be used to extend the timeout for the current callback invocation. The timeout is given in seconds from the point in time when the function is called.

```
int confd_aaa_reload(
const struct confd_trans_ctx *tctx);
```

When the ConfD AAA tree is populated by an external data provider (see the AAA chapter in the Admin Guide), this function can be used by the data provider to notify ConfD when there is a change to the AAA data. I.e. it is an alternative to executing the command `confd --clear-aaa-cache`. See also `maapi_aaa_reload()` in [confd\_lib\_maapi(3)](section3.md#confd_lib_maapi).

```
int confd_install_crypto_keys(
struct confd_daemon_ctx* dtx);
```

It is possible to define DES3 and AES keys inside confd.conf. These keys are used by ConfD to encrypt data which is entered into the system. The supported types are `tailf:des3-cbc-encrypted-string`, `tailf:aes-cfb-128-encrypted-string` and `tailf:aes-256-cfb-128-encrypted-string`. See [confd\_types(3)](section3.md#confd_types).

This function will copy those keys from ConfD (which reads confd.conf) into memory in the library. The parameter `dtx` is a daemon context which is connected through a call to `confd_connect()`.

> **Note**
>
> The function must be called before `confd_register_done()` is called. If this is impractical, or if the application doesn't otherwise use a daemon context, the equivalent function `maapi_install_crypto_keys()` may be more convenient to use, see [confd\_lib\_maapi(3)](section3.md#confd_lib_maapi).

### Ncs Service Callbacks

NCS service callbacks are invoked in a manner similar to the data callbacks described above, but require a registration for a service point, specified as `ncs:servicepoint` in the data model. The `init()` transaction callback must also be registered, and must use the `confd_trans_set_fd()` function to assign a worker socket for the transaction.

```
int ncs_register_service_cb(
struct confd_daemon_ctx *dx, const struct ncs_service_cbs *scb);
```

This function registers the service callbacks. The `struct ncs_service_cbs` is defined as:

```c
struct ncs_name_value {
    char *name;
    char *value;
};
```

```c
enum ncs_service_operation {
    NCS_SERVICE_CREATE = 0,
    NCS_SERVICE_UPDATE = 1,
    NCS_SERVICE_DELETE = 2
};
```

```c
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

The `create()` callback is invoked inside NCS FASTMAP when creation or update of a service instance is committed. It should attach to the FASTMAP transaction by means of `maapi_attach2()` (see [confd\_lib\_maapi(3)](section3.md#confd_lib_maapi)), passing the `fastmap_thandle` transaction handle as the `thandle` parameter to `maapi_attach2()`. The `usid` parameter for `maapi_attach2()` should be given as 0. To modify data in the FASTMAP transaction, the NCS-specific `maapi_shared_xxx()` functions must be used, see the section [NCS SPECIFIC FUNCTIONS](section3.md#confd_lib_maapi.ncs_functions) in the [confd\_lib\_maapi(3)](section3.md#confd_lib_maapi) manual page.

The `pre_modification()` and `post_modification()` callbacks are optional, and are invoked outside FASTMAP. `pre_modification()` is invoked before create, update, or delete of the service, as indicated by the `enum ncs_service_operation op` parameter. Conversely `post_modification()` is invoked after create, update, or delete of the service. These functions can be useful e.g. for allocations that should be stored and existing also when the service instance is removed.

All the callbacks receive a property list via the `proplist` and `num_props` parameters. This list is initially empty (`proplist` == NULL and `num_props` == 0), but it can be used to store and later modify persistent data outside the service model that might be needed.

> **Note**
>
> We must call the `confd_register_done()` function when we are done with all registrations for a daemon, see above.

```
int ncs_service_reply_proplist(
struct confd_trans_ctx *tctx, const struct ncs_name_value *proplist, int num_props);
```

This function must be called with the new property list, immediately prior to returning from the callback, if the stored property list should be updated. If a callback returns without calling `ncs_service_reply_proplist()`, the previous property list is retained. To completely delete the property list, call this function with the `num_props` parameter given as 0.

### Validation Callbacks

This library also supports the registration of callback functions on validation points in the data model. A validation point is a point in the data model where ConfD will invoke an external function to validate the associated data. The validation occurs before a transaction is committed. Similar to the state machine described for "external data bases" above where we install callback functions in the `struct confd_trans_cbs`, we have to install callback functions for each validation point. It does not matter if the database is CDB or an external database, the validation callbacks described here work equally well for both cases.

```
void confd_register_trans_validate_cb(
struct confd_daemon_ctx *dx, const struct confd_trans_validate_cbs *vcbs);
```

This function installs two callback functions for the `struct confd_daemon_ctx`. One function that gets called when the validation phase starts in a transaction and one when the validation phase stops in a transaction. In the `init()` callback we can use the MAAPI api to attach to the running transaction, this way we can later on, freely traverse the configuration and read data. The data we will be reading through MAAPI (see [confd\_lib\_maapi(3)](section3.md#confd_lib_maapi)) will be read from the shadow storage containing the _not-yet-committed_ data.

The `struct confd_trans_validate_cbs` is defined as:

```c
struct confd_trans_validate_cbs {
    int (*init)(struct confd_trans_ctx *tctx);
    int (*stop)(struct confd_trans_ctx *tctx);
};
```

It must thus be populated with two function pointers when we call this function.

The `init()` callback is conceptually invoked at the start of the validation phase, but just as for transaction callbacks, ConfD will as far as possible delay the actual invocation of the validation `init()` callback for a given daemon until it is required. This means that if none of the daemon's `validate()` callbacks need to be invoked (see below), `init()` and `stop()` will not be invoked either.

If we need to allocate memory or other resources for the validation this can also be done in the `init()` callback, with the resources being freed in the `stop()` callback. We can use the `t_opaque` element in the `struct confd_trans_ctx` to manage this, but in a daemon that implements both data and validation callbacks it is better to use the `v_opaque` element for validation, to be able to manage the allocations independently.

Similar to the `init()` callback for external data bases, we must in the `init()` callback associate a file descriptor with the transaction. This file descriptor will be used for the actual validation. Thus in a multi threaded application, we can have one thread performing validation for a transaction in parallel with other threads executing e.g. data callbacks. Thus a typical implementation of an `init()` callback for validation looks as:

```
static int init_validation(struct confd_trans_ctx *tctx)
{
    maapi_attach(maapi_socket, mtest__ns, tctx);
    confd_trans_set_fd(tctx, workersock);
    return CONFD_OK;
}
```

```
int confd_register_valpoint_cb(
struct confd_daemon_ctx *dx, const struct confd_valpoint_cb *vcb);
```

We must also install an actual validation function for each validation point, i.e. for each `tailf:validate` statement in the YANG data model.

A validation point has a name and an associated function pointer. The struct which must be populated for each validation point looks like:

```c
struct confd_valpoint_cb {
    char valpoint[MAX_CALLPOINT_LEN];
    int (*validate)(struct confd_trans_ctx *tctx, confd_hkeypath_t *kp,
                    confd_value_t *newval);
    void *cb_opaque; /* private user data */
};
```

> **Note**
>
> We must call the `confd_register_done()` function when we are done with all registrations for a daemon, see above.

See the user guide chapter "Semantic validation" for code examples. The `validate()` callback can return CONFD\_OK if all is well, or CONFD\_ERROR if the validation fails. If we wish a message to accompany the error we must prior to returning from the callback, call `confd_trans_seterr()` or `confd_trans_seterr_extended()`.

The `cb_opaque` element can be used to pass arbitrary data to the callback, e.g. when the same callback is used for multiple validation points. It is made available to the callback via the element `vcb_opaque` in the transaction context (`tctx` argument), see the structure definition above.

If the `tailf:opaque` substatement has been used with the `tailf:validate` statement in the data model, the argument string is made available to the callback via the `validate_opaque` element in the transaction context.

We also have yet another special return value which can be used (only) from the `validate()` callback which is CONFD\_VALIDATION\_WARN. Prior to return of this value we must call `confd_trans_seterr()` which provides a string describing the warning. The warnings will get propagated to the transaction engine, and depending on where the transaction originates, ConfD may or may not act on the warnings. If the transaction originates from the CLI or the Web UI, ConfD will interactively present the user with a choice - whereby the transaction can be aborted.

If the transaction originates from NETCONF - which does not have any interactive capabilities - the warnings are ignored. The warnings are primarily intended to alert inexperienced users that attempt to make - dangerous - configuration changes. There can be multiple warnings from multiple validation points in the same transaction.

It is also possible to let the `validate()` callback return CONFD\_DELAYED\_RESPONSE in which case the application at a later stage must invoke either `confd_delayed_reply_ok()`, `confd_delayed_reply_error()` or `confd_delayed_reply_validation_warn()`.

In some cases it may be necessary for the validation callbacks to verify the availability of resources that will be needed if the new configuration is committed. To support this kind of verification, the `validation_info` element in the `struct confd_trans_ctx` can carry one of these flags:

CONFD\_VALIDATION\_FLAG\_TEST

> When this flag is set, the current validation phase is a "test" validation, as in e.g. the CLI 'validate' command, and the transaction will return to the READ state regardless of the validation result. This flag is available in all of the `init()`, `validate()`, and `stop()` callbacks.

CONFD\_VALIDATION\_FLAG\_COMMIT

> When this flag is set, all requirements for a commit have been met, i.e. all validation as well as the write\_start and prepare transitions have been successful, and the actual commit will follow. This flag is only available in the `stop()` callback.

```
int confd_register_range_valpoint_cb(
struct confd_daemon_ctx *dx, struct confd_valpoint_cb *vcb, const confd_value_t *lower, 
const confd_value_t *upper, int numkeys, const char *fmt, ...);
```

A variant of `confd_register_valpoint_cb()` which registers a validation function for a range of key values. The `lower`, `upper`, `numkeys`, `fmt`, and remaining parameters are the same as for `confd_register_range_data_cb()`, see above.

```
int confd_delayed_reply_validation_warn(
struct confd_trans_ctx *tctx);
```

This function must be used to return the equivalent of CONFD\_VALIDATION\_WARN when the `validate()` callback returned CONFD\_DELAYED\_RESPONSE. Before calling this function, we must call `confd_trans_seterr()` to provide a string describing the warning.

_Errors_: CONFD\_ERR\_PROTOUSAGE, CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS

### Notification Streams

The application can generate notifications that are sent via the northbound protocols. Currently NETCONF notification streams are supported. The application generates the content for each notification and sends it via a socket to ConfD, which in turn manages the stream subscriptions and distributes the notifications accordingly.

A stream always has a "live feed", which is the sequence of new notifications, sent in real time as they are generated. Subscribers may also request "replay" of older, logged notifications if the stream supports this, perhaps transitioning to the live feed when the end of the log is reached. There may be one or more replays active simultaneously with the live feed. ConfD forwards replay requests from subscribers to the application via callbacks if the stream supports replay.

Each notification has an associated time stamp, the "event time". This is the time when the event that generated the notification occurred, rather than the time the notification is logged or sent, in case these times differ. The application must pass the event time to ConfD when sending a notification, and it is also needed when replaying logged events, see below.

```
int confd_register_notification_stream(
struct confd_daemon_ctx *dx, const struct confd_notification_stream_cbs *ncbs, 
struct confd_notification_ctx **nctx);
```

This function registers the notification stream and optionally two callback functions used for the replay functionality. If the stream does not support replay, the callback elements in the `struct confd_notification_stream_cbs` are set to NULL. A context pointer is returned via the `**nctx` argument - this must be used by the application for the sending of live notifications via `confd_notification_send()` and `confd_notification_send_path()` (see below).

The `confd_notification_stream_cbs` structure is defined as:

```c
struct confd_notification_stream_cbs {
    char streamname[MAX_STREAMNAME_LEN];
    int fd;
    int (*get_log_times)(struct confd_notification_ctx *nctx);
    int (*replay)(struct confd_notification_ctx *nctx,
                  struct confd_datetime *start, struct confd_datetime *stop);
    void *cb_opaque; /* private user data */
};
```

The `fd` element must be set to a previously connected worker socket. This socket may be used for multiple notification streams, but not for any of the callback processing described above. Since it is only used for sending data to ConfD, there is no need for the application to poll the socket. Note that the control socket must be connected before registration even if the callbacks are not registered.

> **Note**
>
> We must call the `confd_register_done()` function when we are done with all registrations for a daemon, see above.

The `get_log_times()` callback is called by ConfD to find out a) the creation time of the current log and b) the event time of the last notification aged out of the log, if any. The application provides the times via the `confd_notification_reply_log_times()` function (see below) and returns CONFD\_OK.

The `replay()` callback is called by ConfD to request replay. The `nctx` context pointer must be saved by the application and used when sending the replay notifications via `confd_notification_send()` (or `confd_notification_send_path()`), as well as for the `confd_notification_replay_complete()` (or `confd_notification_replay_failed()`) call (see below) - the callback should return without waiting for the replay to complete. The pointer references allocated memory, which is freed by the `confd_notification_replay_complete()` (or `confd_notification_replay_failed()`) call.

The times given by `*start` and `*stop` specify the extent of the replay. The start time will always be given and specify a time in the past, however the stop time may be either in the past or in the future or even omitted, i.e. the `stop` argument is NULL. This means that the subscriber has requested that the subscription continues indefinitely with the live feed when the logged notifications have been sent.

If the stop time is given:

* The application sends all logged notifications that have an event time later than the start time but not later than the stop time, and then calls `confd_notification_replay_complete()`. Note that if the stop time is in the future when the replay request arrives, this includes notifications logged while the replay is in progress (if any), as long as their event time is not later than the stop time.

If the stop time is _not_ given:

* The application sends all logged notifications that have an event time later than the start time, and then calls `confd_notification_replay_complete()`. Note that this includes notifications logged after the request was received (if any).

ConfD will if needed switch the subscriber over to the live feed and then end the subscription when the stop time is reached. The callback may analyze the `start` and `stop` arguments to determine start and stop positions in the log, but if the analysis is postponed until after the callback has returned, the `confd_datetime` structure(s) must be copied by the callback.

The `replay()` callback may optionally select a separate worker socket to be used for the replay notifications. In this case it must call `confd_notification_set_fd()` to indicate which socket should be used.

Note that unlike the callbacks for external data bases and validation, these callbacks do not use a worker socket for the callback processing, and consequently there is no `init()` callback to request one. The callbacks are invoked, and the reply is sent, via the daemon control socket.

The `cb_opaque` element in the `confd_notification_stream_cbs` structure can be used to pass arbitrary data to the callbacks in much the same way as for callpoint and validation point registrations, see the description of the `struct confd_data_cbs` structure above. However since the callbacks are not associated with a transaction, this element is instead made available in the `confd_notification_ctx` structure.

```
int confd_notification_send(
struct confd_notification_ctx *nctx, struct confd_datetime *time, confd_tag_value_t *values, 
int nvalues);
```

This function is called by the application to send a notification, defined at the top level of a YANG module, whether "live" or replay.

`confd_notification_send()` is asynchronous and a CONFD\_OK return value only states that the notification was successfully queued for delivery, the actual send operation can still fail and such a failure will be logged to ConfD's developerLog.

The `nctx` pointer is provided by ConfD as described above. The `time` argument specifies the event time for the notification. The `values` argument is an array of length `nvalues`, populated with the content of the notification as described for the Tagged Value Array format in the [XML STRUCTURES](section3.md#confd_types.xml_structures) section of the [confd\_types(3)](section3.md#confd_types) manual page.

> **Note**
>
> The order of the tags in the array must be the same order as in the YANG model.

For example, with this definition at the top level of the YANG module "test":

```
notification linkUp {
  leaf ifIndex {
    type leafref {
      path "/interfaces/interface/ifIndex";
    }
    mandatory true;
  }
}
```

a NETCONF notification of the form:

```
<notification
 xmlns="urn:ietf:params:xml:ns:netconf:notification:1.0">
  <eventTime>2007-08-17T08:56:05Z</eventTime>
  <linkUp xmlns="http://example.com/ns/test">
    <ifIndex>3</ifIndex>
  </linkUp>
</notification>
```

could be sent with the following code:

```
struct confd_notification_ctx *nctx;
struct confd_datetime event_time = {2007, 8, 17, 8, 56, 5, 0, 0, 0};
confd_tag_value_t notif[3];
int n = 0;

CONFD_SET_TAG_XMLBEGIN(&notif[n], test_linkUp, test__ns); n++;
CONFD_SET_TAG_UINT32(&notif[n], test_ifIndex, 3); n++;
CONFD_SET_TAG_XMLEND(&notif[n], test_linkUp, test__ns); n++;
confd_notification_send(nctx, &event_time, notif, n);
```

```
int confd_notification_send_path(
struct confd_notification_ctx *nctx, struct confd_datetime *time, confd_tag_value_t *values, 
int nvalues, const char *fmt, ...);
```

This function does the same as `confd_notification_send()`, but for the "inline" notifications that are added in YANG 1.1, i.e. notifications that are defined as a child of a container or list. The `nctx`, `time`, `values`, and `nvalues` arguments are the same as for `confd_notification_send()`, while the `fmt` and remaining arguments specify a string path for the container or list entry that is the parent of the notification, in the same form as for the [confd\_lib\_maapi(3)](section3.md#confd_lib_maapi) and [confd\_lib\_cdb(3)](section3.md#confd_lib_cdb) functions. Giving "/" for the path is equivalent to calling `confd_notification_send()`.

> **Note**
>
> The path must be fully instantiated, i.e. all list nodes in the path must have all their keys specified.

For example, with this definition at the top level of the YANG module "test":

```
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
```

a NETCONF notification of the form:

```
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
```

could be sent with the following code:

```
struct confd_notification_ctx *nctx;
struct confd_datetime event_time = {2018, 7, 17, 8, 56, 5, 0, 0, 0};
confd_tag_value_t notif[3];
int n = 0;

CONFD_SET_TAG_XMLBEGIN(&notif[n], test_link_state, test__ns); n++;
CONFD_SET_TAG_STR(&notif[n], test_state, "up"); n++;
CONFD_SET_TAG_XMLEND(&notif[n], test_link_state, test__ns); n++;
confd_notification_send_path(nctx, &event_time, notif, n,
                             "/interfaces/interface{3}");
```

> **Note**
>
> While it is possible to use separate threads to send live and replay notifications for a given stream, or to send different streams on a given worker socket, this is not recommended. This is because it involves rather complex synchronization problems that can only be fully solved by the application, in particular in the case where a replay switches over to the live feed.

```
int confd_notification_replay_complete(
struct confd_notification_ctx *nctx);
```

The application calls this function to notify ConfD that the replay is complete, using the `nctx` pointer received in the corresponding `replay()` callback invocation.

```
int confd_notification_replay_failed(
struct confd_notification_ctx *nctx);
```

In case the application fails to complete the replay as requested (e.g. the log gets overwritten while the replay is in progress), the application should call this function _instead_ of `confd_notification_replay_complete()`. An error message describing the reason for the failure can be supplied by first calling `confd_notification_seterr()` or `confd_notification_seterr_extended()`, see below. The `nctx` pointer received in the corresponding `replay()` callback invocation is used for both calls.

```
void confd_notification_set_fd(
struct confd_notification_ctx *nctx, int fd);
```

This function may optionally be called by the `replay()` callback to request that the worker socket given by `fd` should be used for the replay. Otherwise the socket specified in the `confd_notification_stream_cbs` at registration will be used.

```
int confd_notification_reply_log_times(
struct confd_notification_ctx *nctx, struct confd_datetime *creation, 
struct confd_datetime *aged);
```

Reply function for use in the `get_log_times()` callback invocation. If no notifications have been aged out of the log, give NULL for the `aged` argument.

```
void confd_notification_seterr(
struct confd_notification_ctx *nctx, const char *fmt);
```

In some cases the callbacks may be unable to carry out the requested actions, e.g. the capacity for simultaneous replays might be exceeded, and they can then return CONFD\_ERR. This function allows the callback to associate an error message with the failure. It can also be used to supply an error message before calling `confd_notification_replay_failed()`.

```
void confd_notification_seterr_extended(
struct confd_notification_ctx *nctx, enum confd_errcode code, uint32_t apptag_ns, 
uint32_t apptag_tag, const char *fmt);
```

This function can be used to provide more structured error information from a notification callback, see the section [EXTENDED ERROR REPORTING](section3.md#confd_lib_lib.extended_error_reporting) in [confd\_lib\_lib(3)](section3.md#confd_lib_lib).

```
int confd_notification_seterr_extended_info(
struct confd_notification_ctx *nctx, enum confd_errcode code, uint32_t apptag_ns, 
uint32_t apptag_tag, confd_tag_value_t *error_info, int n, const char *fmt);
```

This function can be used to provide structured error information in the same way as `confd_notification_seterr_extended()`, and additionally provide contents for the NETCONF \<error-info> element. See the section [EXTENDED ERROR REPORTING](section3.md#confd_lib_lib.extended_error_reporting) in [confd\_lib\_lib(3)](section3.md#confd_lib_lib).

```
int confd_register_snmp_notification(
struct confd_daemon_ctx *dx, int fd, const char *notify_name, const char *ctx_name, 
struct confd_notification_ctx **nctx);
```

SNMP notifications can also be sent via the notification framework, however most aspects of the stream concept described above do not apply for SNMP. This function is used to register a worker socket, the snmpNotifyName (`notify_name`), and SNMP context (`ctx_name`) to be used for the notifications.

The `fd` parameter must give a previously connected worker socket. This socket may be used for different notifications, but not for any of the callback processing described above. Since it is only used for sending data to ConfD, there is no need for the application to poll the socket. Note that the control socket must be connected before registration, even if none of the callbacks described below are registered.

The context pointer returned via the `**nctx` argument must be used by the application for the subsequent sending of the notifications via `confd_notification_send_snmp()` or `confd_notification_send_snmp_inform()` (see below).

When a notification is sent using one of these functions, it is delivered to the management targets defined for the `snmpNotifyName` in the `snmpNotifyTable` in SNMP-NOTIFICATION-MIB for the specified SNMP context. If `notify_name` is NULL or the empty string (""), the notification is sent to all management targets. If `ctx_name` is NULL or the empty string (""), the default context ("") is used.

> **Note**
>
> We must call the `confd_register_done()` function when we are done with all registrations for a daemon, see above.

```
int confd_notification_send_snmp(
struct confd_notification_ctx *nctx, const char *notification, struct confd_snmp_varbind *varbinds, 
int num_vars);
```

Sends the SNMP notification specified by `notification`, without requesting inform-request delivery information. This is equivalent to calling `confd_notification_send_snmp_inform()` (see below) with NULL as the `cb_id` argument. I.e. if the common arguments are the same, the two functions will send the exact same set of traps and inform-requests.

```
int confd_register_notification_snmp_inform_cb(
struct confd_daemon_ctx *dx, const struct confd_notification_snmp_inform_cbs *cb);
```

If we want to receive information about the delivery of SNMP inform-requests, we must register two callbacks for this. The `struct confd_notification_snmp_inform_cbs` is defined as:

```c
struct confd_notification_snmp_inform_cbs {
    char cb_id[MAX_CALLPOINT_LEN];
    void (*targets)(struct confd_notification_ctx *nctx, int ref,
                    struct confd_snmp_target *targets, int num_targets);
    void (*result)(struct confd_notification_ctx *nctx, int ref,
                   struct confd_snmp_target *target, int got_response);
    void *cb_opaque; /* private user data */
};
```

The callback identifier `cb_id` can be chosen arbitrarily, it is only used when sending SNMP notifications with `confd_notification_send_snmp_inform()` - however each inform callback registration must use a unique `cb_id`. The callbacks are invoked via the control socket, i.e. the application must poll it and invoke `confd_fd_ready()` when data is available.

When a notification is sent, the `target()` callback will be invoked once with `num_targets` (possibly 0) inform-request targets in the `targets` array, followed by `num_targets` invocations of the `result()` callback, one for each target. The `ref` argument (passed from the `confd_notification_send_snmp_inform()` call) allows for tracking the result of multiple notifications with delivery overlap.

> **Note**
>
> We must call the `confd_register_done()` function when we are done with all registrations for a daemon, see above.

```
int confd_notification_send_snmp_inform(
struct confd_notification_ctx *nctx, const char *notification, struct confd_snmp_varbind *varbinds, 
int num_vars, const char *cb_id, int ref);
```

Sends the SNMP notification specified by `notification`. If `cb_id` is not NULL, the callbacks registered for `cb_id` will be invoked with the `ref` argument as described above, otherwise no inform-request delivery information will be provided. The `varbinds` array should be populated with `num_vars` elements as described in the Notifications section of the SNMP Agent chapter in the User Guide.

If `notification` is the empty string, no notification is looked up; instead `varbinds` defines the notification, including the notification id (variable name "snmpTrapOID"). This is especially useful for forwarding a notification which has been received from the SNMP gateway (see `confd_register_notification_sub_snmp_cb()` below).

If `varbinds` does not contain a timestamp (variable name "sysUpTime"), one will be supplied by the agent.

```
void confd_notification_set_snmp_src_addr(
struct confd_notification_ctx *nctx, const struct confd_ip *src_addr);
```

By default, the source address for the SNMP notifications that are sent by the above functions is chosen by the IP stack of the OS. This function may be used to select a specific source address, given by `src_addr`, for the SNMP notifications subsequently sent using the `nctx` context. The default can be restored by calling the function with a `src_addr` where the `af` element is set to `AF_UNSPEC`.

```
int confd_notification_set_snmp_notify_name(
struct confd_notification_ctx *nctx, const char *notify_name);
```

This function can be used to change the snmpNotifyName (`notify_name`) for the `nctx` context. The new snmpNotifyName is used for notifications sent by subsequent calls to `confd_notification_send_snmp()` and `confd_notification_send_snmp_inform()` that use the `nctx` context.

```
int confd_register_notification_sub_snmp_cb(
struct confd_daemon_ctx *dx, const struct confd_notification_sub_snmp_cb *cb);
```

Registers a callback function to be called when an SNMP notification is received by the SNMP gateway.

The `struct confd_notification_sub_snmp_cb` is defined as:

```c
struct confd_notification_sub_snmp_cb {
    char sub_id[MAX_CALLPOINT_LEN];
    int (*recv)(struct confd_notification_ctx *nctx, char *notification,
                struct confd_snmp_varbind *varbinds, int num_vars,
                confd_value_t *src_addr, uint16_t src_port);
    void *cb_opaque; /* private user data */
};
```

The `sub_id` element is the subscription id for the notifications. The `recv()` callback will be called when a notification is received. See the section "Receiving and Forwarding Traps" in the chapter "The SNMP gateway" in the Users Guide.

> **Note**
>
> We must call the `confd_register_done()` function when we are done with all registrations for a daemon, see above.

```
int confd_notification_flush(
struct confd_notification_ctx *nctx);
```

Notifications are sent asynchronously, i.e. normally without blocking the caller of the send functions described above. This means that in some cases, ConfD's sending of the notifications on the northbound interfaces may lag behind the send calls. If we want to make sure that the notifications have actually been sent out, e.g. in some shutdown procedure, we can call `confd_notification_flush()`. This function will block until all notifications sent using the given `nctx` context have been fully processed by ConfD. It can be used both for notification streams and for SNMP notifications (however it will not wait for replies to SNMP inform-requests to arrive).

### Push On-Change Callbacks

The application can generate push notifications based on data changes that are sent via the NETCONF protocol. The application generates content for each subscription according to filters and other parameters specified by the subscription callback and sends it via a socket to ConfD. Push notifications that are received by ConfD are then published to the NETCONF subscribers.

> \[!WARNING] _Experimental_. The PUSH ON-CHANGE CALLBACKS are not subject to libconfd protocol version policy. Non-backwards compatible changes or removal may occur in any future release.

> **Note**
>
> ConfD implements a YANG-Push server and the push on-change callbacks provide a complementary mechanism for ConfD to publish updates from the data managed by data providers. Thus, it is recommended to be familiar with YANG-Push (RFC 8641) and YANG Patch (RFC 8072) standards.

```
int confd_register_push_on_change(
struct confd_daemon_ctx *dx, const struct confd_push_on_change_cbs *pcbs);
```

This function registers two mandatory callback functions used to subscribe to and unsubscribe from on-change push notifications.

The `confd_push_on_change_cbs` structure is defined as:

```c
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

The `fd` element must be set to a previously connected worker socket. This socket may be used for multiple notification streams, but not for any of the callback processing described above. Since it is only used for sending data to ConfD, there is no need for the application to poll the socket. Note that the control socket must be connected before registration.

> **Note**
>
> We must call the `confd_register_done()` function when we are done with all registrations for a daemon, see above.

The `subscribe_on_change()` callback is called by ConfD to initiate a subscription on specified data with specified trigger options passed by the context pointer: `pctx` argument. The argument must be used by the application for the sending of push notifications via `confd_push_on_change()` (see below for details).

The `unsubscribe_on_change()` callback is called by ConfD to remove a specified subscription by the context pointer `pctx` argument.

The `push_ctxs` is an array of contextual data that belongs to the current subscriptions under the registered callback instance. The `push_ctxs`, `push_ctxs_len` and `num_push_ctxs` are for internal use of libconfd.

The `cb_opaque` element is reserved for future use.

The `struct confd_push_on_change_ctx` structure is defined as:

```c
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

The `subid` is the subscription identity provided by ConfD to identify the subscription on NETCONF session.

The `usid` is the user id corresponding to the user of the NETCONF session. The user id can be used to optionally identify and obtain the user session, which can be used to authorize the push notifications.

> \[!WARNING] ConfD will always check access rights on the data that is pushed from the applications, unless the configuration parameter `enableExternalAccessCheck` is set to _true_. If `enableExternalAccessCheck` is true and the application sets the `CONFD_PATCH_FLAG_AAA_CHECKED` flag, then ConfD will not perform access right checks on the received data.

The optional `xpath_filter` element is the string representation of the XPath filter provided for the subscription to identify a portion of data in the data tree. The `xpath_filter` is present if the NETCONF subscription is specified with an XPath filter instead of a subtree filter. Applications are requested to provide the data changes occurring in the portion of the data where the XPath expression evaluates to.

The `hkeypaths` element is an array of `struct confd_hkeypath_t *`, each path specifies the data sub-tree that the subscription is interested in for occurring data changes. Applications are requested to provide the data changes occurring at and under the data sub-tree pointed by the provided hkeypaths. If an application is able to evaluate the XPath expression specified by the `xpath_filter`, then it might not be needed to take hkeypaths in consideration and the application may provide data contents of the notifications according to the XPath evaluation it performs. For the subscriptions with an XPath filter, hkeypaths are populated in best effort manner and the data content of the notifications might need to be filtered again by ConfD. The `hkeypaths` must be used if `xpath_filter` is not provided.

The `npaths` integer specifies the size of the `hkeypaths` array.

The `dampening_period` element specifies the time interval that has to pass before successive push notification can be sent. The `dampening_period` is specified in centiseconds. Any notification that is sent before the specified amount of time passed after previous notification will be dampened by ConfD. Note that ConfD can dampen the notification even if the application sends the successive notification after the period ends. This can happen in cases where ConfD itself have generated a notification for another portion of the data tree and pushed it to the NETCONF session.

The `excluded_changes` is an integer specifying which kind of changes should not be included in push notifications. The application needs to check which bits in the `excluded_changes` are set and compare it with the enumerated change codes below, defined by `enum confd_data_op`.

```c
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

```
int confd_push_on_change(
struct confd_push_on_change_ctx *pctx, struct confd_datetime *time, const struct confd_data_patch *patch);
```

This function is called by the application to send a push notification upon data changes occurring in the subscribed portion of the data tree. `confd_push_on_change()` is asynchronous and a CONFD\_OK return value only states that the notification was successfully passed to ConfD. The actual NETCONF notification might differ according to the ConfD configuration and its state.

The `pctx` pointer is provided by ConfD as it is described above. The `time` argument specifies the event time for the notification. The `patch` argument of type `struct confd_data_patch*` is populated with the content of the push notification as described below. The structure of the `struct confd_data_patch*` conforms to YANG Patch media type specified by RFC 8072.

The `struct confd_data_patch` structure is defined as:

```c
struct confd_data_patch {
    char *patch_id;
    char *comment;
    struct confd_data_edit *edits;
    int nedits;
    int flags;
};
```

The application must set `patch_id` to a string for identification of the patch. The application should attempt to generate unique values to distinguish between transactions from multiple clients in any audit logs maintained by ConfD. The `patch_id` string is not used by ConfD when publishing push change update notifications via NETCONF, but it may be used for auditing in the future.

The application can optionally set `comment` to a string to describe the patch.

The `edits` is an array of `struct confd_data_edit*` type, which also conforms to the edit list in YANG Patch specified by RFC 8072. Each edit instance represents one type of change on targeted portions of datastore. (See below for detailed description of the `struct confd_data_edit*`).

The application must set the `nedits` integer value according to the number of edits populated in the `edits` array.

The application must set the `flags` integer value by setting the bits corresponding to the below macros and their conditions.

```
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
```

> \[!WARNING] Currently ConfD can not apply an XPath or Subtree filter on the data provided in push notifications. If the `CONFD_PATCH_FLAG_FILTER` flag is set, ConfD can only filter out the edits with operations that are specified in excluded changes.

The `struct confd_data_edit` structure is defined as:

```c
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

An edit may be defined as in the example below and the struct member values can be initialized using `CONFD_DATA_EDIT()` macro.

```
struct confd_data_edit *edit =
    (struct confd_data_edit *) malloc(sizeof(struct confd_data_edit));
*edit = CONFD_DATA_EDIT();
```

The application must set an arbitrary string to `edit_id` as an identifier for the edit.

The mandatory `op` element of type `enum confd_data_op` must be set to one of the enumerated values. (See above for the definition).

The mandatory `target` element identifies the target data node for the edit. The `target` can be set using the convenience macro `CONFD_DATA_EDIT_SET_PATH`, where a `fmt` argument and variable arguments can be passed to set the path to target.

```
CONFD_DATA_EDIT_SET_PATH(edit, target, "/if:interfaces/interface{eth%d}", 1);
```

The conditional `point` element identifies the position of the data node when the value of `op` is `CONFD_DATA_INSERT` or `CONFD_DATA_MOVE`; and also the value of `where` is `CONFD_DATA_BEFORE` or `CONFD_DATA_AFTER`. The `point` can be set using the convenience macro `CONFD_DATA_EDIT_SET_PATH`, similar to the `target` element.

```
CONFD_DATA_EDIT_SET_PATH(edit, point, "/if:interfaces/interface{eth%d}", 0);
```

The conditional `where` element of type `enum confd_data_where` identifies the relative position of the data node when the value of `op` is `CONFD_DATA_INSERT` or `CONFD_DATA_MOVE`. The `enum confd_data_where` is defined as below.

```c
enum confd_data_where {
    CONFD_DATA_BEFORE = 0,
    CONFD_DATA_AFTER = 1,
    CONFD_DATA_FIRST = 2,
    CONFD_DATA_LAST = 3
};
```

The conditional `data` element is an array of type `struct confd_tag_value_t*` and must be populated when the edit's `op` value is `CONFD_DATA_CREATE`, `CONFD_DATA_MERGE`, `CONFD_DATA_REPLACE`, or `CONFD_DATA_INSERT`. The data array is populated with values according to the specification of the Tagged Value Array format in the [XML STRUCTURES](section3.md#confd_types.xml_structures) section of the [confd\_types(3)](section3.md#confd_types) manual page.

> **Note**
>
> The order of the tags in the array must be the same order as in the YANG model.

The conditional `ndata` must be set to an integer value if `data` is set, according to the number of `struct confd_tag_value_t` instances populated in `data` array.

The `flags` element is reserved for future use.

The `set_path` function pointer is for internal use. It provides a convenience function for setting `target` and `point` elements of type void pointers.

Example: a NETCONF YANG-Push notification of the form:

```
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
```

could be sent with the following code:

```
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
```

### Confd Actions

The use of action callbacks can be specified either via a `rpc` statement or via a `tailf:action` statement in the YANG data model, see the YANG specification and [tailf\_yang\_extensions(5)](section5.md#tailf_yang_extensions). In both cases the use of a `tailf:actionpoint` statement specifies that the action is implemented as a callback function. This section describes how such callback functions should be implemented and registered with ConfD.

Unlike the callbacks for data and validation, there is not always a transaction associated with an action callback. However an action is always associated with a user session (NETCONF, CLI, etc), and only one action at a time can be invoked from a given user session. Hence a pointer to the associated `struct confd_user_info` is passed to the callbacks.

The action callback mechanism is also used for command and completion callbacks configured for the CLI, either in a YANG module using tailf extension statements, or in a [clispec(5)](section5.md#clispec). As the parameter structure is significantly different, special callbacks are used for these functions.

```
int confd_register_action_cbs(
struct confd_daemon_ctx *dx, const struct confd_action_cbs *acb);
```

This function registers up to five callback functions, two of which will be called in sequence when an action is invoked. The `struct confd_action_cbs` is defined as:

```c
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

The `init()` callback, and at least one of the `action()`, `command()`, and `completion()` callbacks, must be specified. It is in principle possible to use a single "point name" for more than one of these callback types, and have the corresponding callback invoked in each case, but in typical usage we would only register one of the callbacks `action()`, `command()`, and `completion()`. Below, the term "action callback" is used to refer to any of these three.

Similar to the `init()` callback for external data bases, we must in the `init()` callback associate a worker socket with the action. This socket will be used for the invocation of the action callback, which actually carries out the action. Thus in a multi threaded application, actions can be dispatched to different threads.

However note that unlike the callbacks for external data bases and validation, both `init()` and action callbacks are registered for each action point (i.e. different action points can have different `init()` callbacks), and there is no `finish()` callback - the action is completed when the action callback returns.

The `struct confd_action_ctx actx` element inside the `struct confd_user_info` holds action-specific data, in particular the `t_opaque` element could be used to pass data from the `init()` callback to the action callback, if needed. If the action is associated with a transaction, the `thandle` element is set to the transaction handle, and can be used with a call to `maapi_attach2()` (see [confd\_lib\_maapi(3)](section3.md#confd_lib_maapi)), otherwise `thandle` will be -1. It is up to the northbound interface whether to invoke the action with a transaction handle, and the action implementer must check if the thandle is -1 or a proper transaction handle if the action intends to use it. The CLI will always invoke an action with a transaction handle (it will pass a handle to a read\_write transaction when in configure mode, and a read transaction otherwise). The NETCONF interface will do so if the tailf extension `<start-transaction/>` was used before the action was invoked. A transaction handle will also be passed to the callback when invoked via `maapi_request_action_th()` (see [confd\_lib\_maapi(3)](section3.md#confd_lib_maapi)).

The `cb_opaque` element in the `confd_action_cbs` structure can be used to pass arbitrary data to the callbacks in much the same way as for callpoint and validation point registrations, see the description of the `struct confd_data_cbs` structure above. This element is made available in the `confd_action_ctx` structure.

If the `tailf:opaque` substatement has been used with the `tailf:actionpoint` statement in the data model, the argument string is made available to the callbacks via the `actionpoint_opaque` element in the `confd_action_ctx` structure.

> **Note**
>
> We must call the `confd_register_done()` function when we are done with all registrations for a daemon, see above.

The `action()` callback receives all the parameters pertaining to the action: The `name` argument is a pointer to the action name as defined in the data model, the `kp` argument gives the path through the data model for an action defined via `tailf:action` (it is a NULL pointer for an action defined via `rpc`), and finally the `params` argument is a representation of the inout parameters provided when the action is invoked. The `params` argument is an array of length `nparams`, populated as described for the Tagged Value Array format in the [XML STRUCTURES](section3.md#confd_types.xml_structures) section of the [confd\_types(3)](section3.md#confd_types) manual page.

The `command()` callback is invoked for CLI callback commands. It must always result in a call of `confd_action_reply_command()`. As the parameters in this case are all in string form, they are passed in the traditional Unix `argc`, `argv` manner - i.e. `argv` is an array of `argc` pointers to NUL-terminated strings plus a final NULL pointer element, and `argv[0]` is the name of the command. Additionally the full path of the command is available via the `path` argument.

The `completion()` callback is invoked for CLI completion and information. It must result in a call of `confd_action_reply_completion()`, except for the case when the callback is invoked via a `tailf:cli-custom-range-enumerator` statement in the data model (see below). The `cli_style` argument gives the style of the CLI session as a character: 'J', 'C', or 'I'. The `token` argument is a NUL-terminated string giving the parameter of the CLI command line that the callback invocation pertains to, and `completion_char` is the character that the user typed, i.e. TAB ('\t'), SPACE (' '), or '?'. If the callback pertains to a data model element, `kp` identifies that element, otherwise it is NULL. The `cmdpath` is a NUL-terminated string giving the full path of the command. If a `cli-completion-id` is specified in the YANG module, or a `completionId` is specified in the clispec, it is given as a NUL-terminated string via `cmdparam_id`, otherwise this argument is NULL. If the invocation pertains to an element that has a type definition, the `simpleType` argument identifies the type with namespace and type name, otherwise it is NULL. The `extra` argument is currently unused (always NULL).

When `completion()` is invoked via a `tailf:cli-custom-range-enumerator` statement in the data model, it is a request to provide possible key values for creation of an entry in a list with a custom range specification. The callback must in this case result in a call of `confd_action_reply_range_enum()`. Refer to the `cli/range_create` example in the bundled examples collection to see an implementation of such a callback.

The action callbacks must return CONFD\_OK, CONFD\_ERR, or CONFD\_DELAYED\_RESPONSE. CONFD\_DELAYED\_RESPONSE implies that the application must later reply asynchronously.

The optional `abort()` callback is called whenever an action is aborted, e.g. when a user invokes an action from one of the northbound agents and aborts it before it has completed. The `abort()` callback will be invoked on the control socket. It is the responsibility of the `abort()` callback to make sure that the pending reply from the action callback is sent. This is required to allow the worker socket to be used for further queries. There are several possible ways for an application to support aborting. E.g. the application can return CONFD\_DELAYED\_RESPONSE from the action callback. Then, when the `abort()` callback is called, it can terminate the executing action and use e.g. `confd_action_delayed_reply_error()`. Alternatively an application can use threads where the action callback is executed in a separate thread. In this case the `abort()` callback could inform the thread executing the action that it should be terminated, and that thread can just return from the action callback.

```
int confd_register_range_action_cbs(
struct confd_daemon_ctx *dx, const struct confd_action_cbs *acb, const confd_value_t *lower, 
const confd_value_t *upper, int numkeys, const char *fmt, ...);
```

A variant of `confd_register_action_cbs()` which registers action callbacks for a range of key values. The `lower`, `upper`, `numkeys`, `fmt`, and remaining parameters are the same as for `confd_register_range_data_cb()`, see above.

> **Note**
>
> This function can not be used for registration of the `command()` or `completion()` callbacks - only actions specified in the data model are invoked via a keypath that can be used for selection of the corresponding callbacks.

```
void confd_action_set_fd(
struct confd_user_info *uinfo, int sock);
```

Associate a worker socket with the action. This function must be called in the `init()` callback - a typical implementation of an `init()` callback looks as:

```
static int init_action(struct confd_user_info *uinfo)
{
    confd_action_set_fd(uinfo, workersock);
    return CONFD_OK;
}
```

```
int confd_action_reply_values(
struct confd_user_info *uinfo, confd_tag_value_t *values, int nvalues);
```

If the action definition specifies that the action should return data, it must invoke this function in response to the `action()` callback. The `values` argument points to an array of length `nvalues`, populated with the output parameters in the same way as the `params` array above.

> **Note**
>
> This function must only be called for an `action()` callback.

```
int confd_action_reply_command(
struct confd_user_info *uinfo, char **values, int nvalues);
```

If a CLI callback command should return data, it must invoke this function in response to the `command()` callback. The `values` argument points to an array of length `nvalues`, populated with pointers to NUL-terminated strings.

> **Note**
>
> This function must only be called for a `command()` callback.

```
int confd_action_reply_rewrite(
struct confd_user_info *uinfo, char **values, int nvalues, char **unhides, 
int nunhides);
```

This function can be called instead of `confd_action_reply_command()` as a response to a show path rewrite callback invocation. The `values` argument points to an array of length `nvalues`, populated with pointers to NUL-terminated strings representing the tokens of the new path. The `unhides` argument points to an array of length `nunhides`, populated with pointers to NUL-terminated strings representing hide groups to temporarily unhide during evaluation of the show command.

> **Note**
>
> This function must only be called for a `command()` callback.

```
int confd_action_reply_rewrite2(
struct confd_user_info *uinfo, char **values, int nvalues, char **unhides, 
int nunhides, struct confd_rewrite_select **selects, int nselects);
```

This function can be called instead of `confd_action_reply_command()` as a response to a show path rewrite callback invocation. The `values` argument points to an array of length `nvalues`, populated with pointers to NUL-terminated strings representing the tokens of the new path. The `unhides` argument points to an array of length `nunhides`, populated with pointers to NUL-terminated strings representing hide groups to temporarily unhide during evaluation of the show command. The `selects` argument points to an array of length `nselects`, populated with pointers to confd\_rewrite\_select structs representing additional select targets.

> **Note**
>
> This function must only be called for a `command()` callback.

```
int confd_action_reply_completion(
struct confd_user_info *uinfo, struct confd_completion_value *values, 
int nvalues);
```

This function must normally be called in response to the `completion()` callback. The `values` argument points to an `nvalues` long array of `confd_completion_value` elements:

```c
enum confd_completion_type {
    CONFD_COMPLETION,
    CONFD_COMPLETION_INFO,
    CONFD_COMPLETION_DESC,
    CONFD_COMPLETION_DEFAULT
};
```

```c
struct confd_completion_value {
    enum confd_completion_type type;
    char *value;
    char *extra;
};
```

For a completion alternative, `type` is set to CONFD\_COMPLETION, `value` gives the alternative as a NUL-terminated string, and `extra` gives explanatory text as a NUL-terminated string - if there is no such text, `extra` is set to NULL. For "info" or "desc" elements, `type` is set to CONFD\_COMPLETION\_INFO or CONFD\_COMPLETION\_DESC, respectively, and `value` gives the text as a NUL-terminated string (the `extra` element is ignored).

In order to fallback to the normal completion behavior, `type` should be set to CONFD\_COMPLETION\_DEFAULT. CONFD\_COMPLETION\_DEFAULT cannot be combined with the other completion types, implying the `values` array always must have length `1` which is indicated by `nvalues` setting.

> **Note**
>
> This function must only be called for a `completion()` callback.

```
int confd_action_reply_range_enum(
struct confd_user_info *uinfo, char **values, int keysize, int nkeys);
```

This function must be called in response to the `completion()` callback when it is invoked via a `tailf:cli-custom-range-enumerator` statement in the data model. The `values` argument points to a `keysize` `*` `nkeys` long array of strings giving the possible key values, where `keysize` is the number of keys for the list in the data model and `nkeys` is the number of list entries for which keys are provided. I.e. the array gives entry1-key1, entry1-key2, ..., entry2-key1, entry2-key2, ... and so on. See the `cli/range_create` example in the bundled examples collection for details.

> **Note**
>
> This function must only be called for a `completion()` callback.

```
void confd_action_seterr(
struct confd_user_info *uinfo, const char *fmt);
```

If action callback encounters fatal problems that can not be expressed via the reply function, it may call this function with an appropriate message and return CONFD\_ERR instead of CONFD\_OK.

```
void confd_action_seterr_extended(
struct confd_user_info *uinfo, enum confd_errcode code, uint32_t apptag_ns, 
uint32_t apptag_tag, const char *fmt);
```

This function can be used to provide more structured error information from an action callback, see the section [EXTENDED ERROR REPORTING](section3.md#confd_lib_lib.extended_error_reporting) in [confd\_lib\_lib(3)](section3.md#confd_lib_lib).

```
int confd_action_seterr_extended_info(
struct confd_user_info *uinfo, enum confd_errcode code, uint32_t apptag_ns, 
uint32_t apptag_tag, confd_tag_value_t *error_info, int n, const char *fmt);
```

This function can be used to provide structured error information in the same way as `confd_action_seterr_extended()`, and additionally provide contents for the NETCONF \<error-info> element. See the section [EXTENDED ERROR REPORTING](section3.md#confd_lib_lib.extended_error_reporting) in [confd\_lib\_lib(3)](section3.md#confd_lib_lib).

```
int confd_action_delayed_reply_ok(
struct confd_user_info *uinfo);

int confd_action_delayed_reply_error(
struct confd_user_info *uinfo, const char *errstr);
```

If we use the CONFD\_DELAYED\_RESPONSE as a return value from the action callback, we must later asynchronously reply. If we use one of the `confd_action_reply_xxx()` functions, this is a complete reply. Otherwise we must use the `confd_action_delayed_reply_ok()` function to signal success, or the `confd_action_delayed_reply_error()` function to signal an error.

```
int confd_action_set_timeout(
struct confd_user_info *uinfo, int timeout_secs);
```

Some action callbacks may require a significantly longer execution time than others, and this time may not even be possible to determine statically (e.g. a file download). In such cases the /confdConfig/capi/queryTimeout setting in `confd.conf` (see above) may be insufficient, and this function can be used to extend (or shorten) the timeout for the current callback invocation. The timeout is given in seconds from the point in time when the function is called.

Examples on how to work with actions are available in the User Guide and in the bundled examples collection.

### Authentication Callback

We can register a callback with ConfD's AAA subsystem, to be invoked whenever AAA has completed processing of an authentication attempt. In the case where the authentication was otherwise successful, the callback can still cause it to be rejected. This can be used to implement specific access policies, as an alternative to using PAM or "External" authentication for this purpose. The callback will only be invoked if it is both enabled via /confdConfig/aaa/authenticationCallback/enabled in `confd.conf` (see [confd.conf(5)](section5.md#ncs.conf)) and registered as described here.

> **Note**
>
> If the callback is enabled in `confd.conf` but not registered, or invocation keeps failing for some reason, _all_ authentication attempts will fail.

> **Note**
>
> This callback can not be used to actually _perform_ the authentication. If we want to implement the authentication outside of ConfD, we need to use PAM or "External" authentication, see the AAA chapter in the Admin Guide.

```
int confd_register_auth_cb(
struct confd_daemon_ctx *dx, const struct confd_auth_cb *acb);
```

Registers the authentication callback. The `struct confd_auth_cb` is defined as:

```c
struct confd_auth_cb {
    int (*auth)(struct confd_auth_ctx *actx);
};
```

The `auth()` callback is invoked with a pointer to an authentication context that provides information about the result of the authentication so far. The callback must return CONFD\_OK or CONFD\_ERR, see below. The `struct confd_auth_ctx` is defined as:

```c
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

The `uinfo` element points to a `struct confd_user_info` with details about the user logging in, specifically user name, password (if used), source IP address, context, and protocol. Note that the user session does not actually exist at this point, even if the AAA authentication was successful - it will only be created if the callback accepts the authentication, hence e.g. the `usid` element is always 0.

The `method` string gives the authentication method used, as follows:

"password"

> Password authentication. This generic term is used if the authentication failed.

"local", "pam", "external"

> Password authentication. On successful authentication, the specific method that succeeded is given. See the AAA chapter in the Admin Guide for an explanation of these methods.

"publickey"

> Public key authentication via the internal SSH server.

Other

> Authentication with an unknown or unsupported method with this name was attempted via the internal SSH server.

If `success` is non-zero, the AAA authentication succeeded, and `groups` is an array of length `ngroups` that gives the groups that will be assigned to the user at login. If the callback returns CONFD\_OK, the complete authentication succeeds and the user is logged in. If it returns CONFD\_ERR (or an invalid return value), the authentication fails.

If `success` is zero, the AAA authentication failed (with `logno` set to `CONFD_AUTH_LOGIN_FAIL`), and the explanatory string `reason`. This invocation is only for informational purposes - the callback return value has no effect on the authentication, and should normally be CONFD\_OK.

```
void confd_auth_seterr(
struct confd_auth_ctx *actx, const char *fmt, ...);
```

This function can be used to provide a text message when the callback returns CONFD\_ERR. If used when rejecting a successful authentication, the message will be logged in ConfD's audit log (otherwise a generic "rejected by application callback" message is logged).

### Authorization Callbacks

We can register two authorization callbacks with ConfD's AAA subsystem. These will be invoked when the northbound agents check that a command or a data access is allowed by the AAA access rules. The callbacks can partially or completely replace the access checks done within the AAA subsystem, and they may accept or reject the access. Typically many access checks are done during the processing of commands etc, and using these callbacks can thus have a significant performance impact. Unless it is a requirement to query an external authorization mechanism, it is far better to only configure access rules in the AAA data model (see the AAA chapter in the Admin Guide).

The callbacks will only be invoked if they are both enabled via /confdConfig/aaa/authorization/callback/enabled in `confd.conf` (see [confd.conf(5)](section5.md#ncs.conf)) and registered as described here.

> **Note**
>
> If the callbacks are enabled in `confd.conf` but no registration has been done, or if invocation keeps failing for some reason, _all_ access checks will be rejected.

```
int confd_register_authorization_cb(
struct confd_daemon_ctx *dx, const struct confd_authorization_cbs *acb);
```

Registers the authorization callbacks. The `struct confd_authorization_cbs` is defined as:

```c
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

Both callbacks are optional, i.e. we can set the function pointer in `struct confd_authorization_cbs` to NULL if we don't want the corresponding callback invocation. In this case the AAA subsystem will handle the access check as if the callback was registered, but always replied with `CONFD_ACCESS_RESULT_DEFAULT` (see below).

The `cmd_filter` and `data_filter` elements can be used to prevent access checks from causing invocation of a callback even though it is registered. If we do not want any filtering, they must be set to zero. The value is a bitmask obtained by ORing together values: For `cmd_filter`, we can use the possible values for `cmdop` (see below), preventing the corresponding invocations of `chk_cmd_access()`. For `data_filter`, we can use the possible values for `dataop` and `how` (see below), preventing the corresponding invocation of `chk_data_access()`. If the callback invocation is prevented by filtering, the AAA subsystem will handle the access check as if the callback had replied with `CONFD_ACCESS_RESULT_CONTINUE` (see below).

Both callbacks are invoked with a pointer to an authorization context that provides information about the user session that the access check pertains to, and the group list for that session. The `struct confd_authorization_ctx` is defined as:

```c
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

`chk_cmd_access()`

> This callback is invoked for command authorization, i.e. it corresponds to the rules under /aaa/authorization/cmdrules in the AAA data model. `cmdtokens` is an array of `ntokens` NUL-terminated strings representing the command to be checked, corresponding to the command leaf in the cmdrule list. If /confdConfig/cli/modeInfoInAAA is enabled in `confd.conf` (see [confd.conf(5)](section5.md#ncs.conf)), mode names will be prepended in the `cmdtokens` array. The `cmdop` parameter gives the operation, corresponding to the ops leaf in the cmdrule list. The possible values for `cmdop` are:
>
> `CONFD_ACCESS_OP_READ`
>
> > Read access. The CLI will use this during command completion, to filter out alternatives that are disallowed by AAA.
>
> `CONFD_ACCESS_OP_EXECUTE`
>
> > Execute access. This is used when a command is about to be executed.
>
> > \[!NOTE] This callback may be invoked with `actx->uinfo == NULL`, meaning that no user session has been established for the user yet. This will occur e.g. when the CLI checks whether a user attempting to log in is allowed to (implicitly) execute the command "request system logout user" (J-CLI) or "logout" (C/I-CLI) when the maximum number of sessions has already been reached (if allowed, the CLI will ask whether the user wants to terminate one of the existing sessions).

`chk_data_access()`

> This callback is invoked for data authorization, i.e. it corresponds to the rules under /aaa/authorization/datarules in the AAA data model. `hashed_ns` and `hkp` give the namespace and hkeypath of the data node to be checked, corresponding to the namespace and keypath leafs in the datarule list. The `hkp` parameter may be NULL, which means that access to the entire namespace given by `hashed_ns` is requested. When a hkeypath is provided, some key elements in the path may be without key values (i.e. hkp->v\[n]\[0].type == C\_NOEXISTS). This indicates "wildcard" keys, used for CLI tab completion when keys are not fully specified. The `dataop` parameter gives the operation, corresponding the ops leaf in the datarule list. The possible values for `dataop` are:
>
> `CONFD_ACCESS_OP_READ`
>
> > Read access.
>
> `CONFD_ACCESS_OP_EXECUTE`
>
> > Execute access.
>
> `CONFD_ACCESS_OP_CREATE`
>
> > Create access.
>
> `CONFD_ACCESS_OP_UPDATE`
>
> > Update access.
>
> `CONFD_ACCESS_OP_DELETE`
>
> > Delete access.
>
> `CONFD_ACCESS_OP_WRITE`
>
> > Write access. This is used when the specific write operation (create/update/delete) isn't known yet, e.g. in CLI command completion or processing of a NETCONF `edit-config`.
>
> The `how` parameter is one of:
>
> `CONFD_ACCESS_CHK_INTERMEDIATE`
>
> > Access to the given data node _or_ its descendants is requested. This is used e.g. in CLI command completion or processing of a NETCONF `edit-config`.
>
> `CONFD_ACCESS_CHK_FINAL`
>
> > Access to the specific data node is requested.
>
> `CONFD_ACCESS_CHK_DESCENDANT`
>
> > Access to the descendants of given data node is requested. For example this is used in CLI completion or processing of a NETCONF `edit-config`.

```
int confd_access_reply_result(
struct confd_authorization_ctx *actx, int result);
```

The callbacks must call this function to report the result of the access check to ConfD, and should normally return CONFD\_OK. If any other value is returned, it will cause the access check to be rejected. The `actx` parameter is the pointer to the authorization context passed in the callback invocation, and `result` must be one of:

`CONFD_ACCESS_RESULT_ACCEPT`

> The access is allowed. This is a "final verdict", analogous to a "full match" when the AAA rules are used.

`CONFD_ACCESS_RESULT_REJECT`

> The access is denied.

`CONFD_ACCESS_RESULT_CONTINUE`

> The access is allowed "so far". I.e. access to sub-elements is not necessarily allowed. This result is mainly useful when `chk_cmd_access()` is called with `cmdop` == `CONFD_ACCESS_OP_READ` or `chk_data_access()` is called with `how` == `CONFD_ACCESS_CHK_INTERMEDIATE`.

`CONFD_ACCESS_RESULT_DEFAULT`

> The request should be handled according to the rules configured in the AAA data model.

```
int confd_authorization_set_timeout(
struct confd_authorization_ctx *actx, int timeout_secs);
```

The authorization callbacks are invoked on the daemon control socket, and as such are expected to complete quickly, within the timeout specified for /confdConfig/capi/newSessionTimeout. However in case they send requests to a remote server, and such a request needs to be retried, this function can be used to extend the timeout for the current callback invocation. The timeout is given in seconds from the point in time when the function is called.

### Error Formatting Callback

It is possible to register a callback function to generate customized error messages for ConfD's internally generated errors. All the customizable errors are defined with a type and a code in the XML document `$CONFD_DIR/src/confd/errors/errcode.xml` in the ConfD release. To use this functionality, the application must `#include` the file `confd_errcode.h`, which defines C constants for the types and codes.

```
int confd_register_error_cb(
struct confd_daemon_ctx *dx, const struct confd_error_cb *ecb);
```

Registers the error formatting callback. The `struct confd_error_cb` is defined as:

```c
struct confd_error_cb {
    int error_types;
    void (*format_error)(struct confd_user_info *uinfo,
                         struct confd_errinfo *errinfo, char *default_msg);
};
```

The `error_types` element is the logical OR of the error types that the callback should handle. An application daemon can only register one error formatting callback, and only one daemon can register for each error type. The available types are:

`CONFD_ERRTYPE_VALIDATION`

> Errors detected by ConfD's internal semantic validation of the data model constraints, e.g. mandatory elements that are unset, dangling references, etc. The codes for this type are the `confd_errno` values corresponding to the validation errors, as resulting e.g. from a call to `maapi_apply_trans()` (see [confd\_lib\_maapi(3)](section3.md#confd_lib_maapi)). I.e. CONFD\_ERR\_NOTSET, CONFD\_ERR\_BAD\_KEYREF, etc - see the 'id' attribute in `errcode.xml`.

`CONFD_ERRTYPE_BAD_VALUE`

> Type errors, i.e. errors generated when an invalid value is given for a leaf in the data model. The codes for this type are defined in `confd_errcode.h` as CONFD\_BAD\_VALUE\_XXX, where "XXX" is the all-uppercase form of the code name given in `errcode.xml`.

`CONFD_ERRTYPE_CLI`

> CLI-specific errors. The codes for this type are defined in `confd_errcode.h` as CONFD\_CLI\_XXX in the same way as for `CONFD_ERRTYPE_BAD_VALUE`.

`CONFD_ERRTYPE_MISC`

> Miscellaneous errors, which do not fit into the other categories. The codes for this type are defined in `confd_errcode.h` as CONFD\_MISC\_XXX in the same way as for `CONFD_ERRTYPE_BAD_VALUE`.

`CONFD_ERRTYPE_NCS`

> NCS errors, which is a broad class of errors, ranging from authentication failures towards devices to case errors. The codes for this type are defined in `confd_errcode.h` as CONFD\_NCS\_XXX in the same way as for `CONFD_ERRTYPE_BAD_VALUE`.

`CONFD_ERRTYPE_OPERATION`

> The same set of errors and codes as for `CONFD_ERRTYPE_VALIDATION`, but detected in validation of input parameters for an rpc or action.

The `format_error()` callback is invoked with a pointer to a `struct confd_errinfo`, which gives the error type and type-specific structured information about the details of the error. It is defined as:

```c
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

For `CONFD_ERRTYPE_VALIDATION` and `CONFD_ERRTYPE_OPERATION`, the `struct confd_errinfo_validation validation` gives the detailed information, using an `info` union that has a specific struct member for each code:

```c
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

The member structs are named as the `confd_errno` values that are used for the `code` elements, i.e. `notset` for CONFD\_ERR\_NOTSET, etc. For `CONFD_ERRTYPE_VALIDATION`, the callback also has full information about the transaction that failed validation via the `struct confd_trans_ctx *tctx` element - it is even possible to use `maapi_attach()` (see [confd\_lib\_maapi(3)](section3.md#confd_lib_maapi)) to attach to the transaction and read arbitrary data from it, in case the data directly related to the error (as given in the code-specific struct) is not sufficient.

For the other error types, the corresponding `confd_errinfo_xxx` struct gives the code and an array with the parameters for the default error message, as defined by the \<fmt> element in `errcode.xml`:

```c
enum confd_errinfo_ptype {
    CONFD_ERRINFO_KEYPATH,
    CONFD_ERRINFO_STRING
};
```

```c
struct confd_errinfo_param {
    enum confd_errinfo_ptype type;
    union {
        confd_hkeypath_t *kp;
        char *str;
    } val;
};
```

```c
struct confd_errinfo_bad_value {
    int code;
    int n_params;
    struct confd_errinfo_param *params;
};
```

The parameters in the `params` array are given in the order they appear in the \<fmt> specification. Parameters that are specified as `{path}` have `params[n].type` set to `CONFD_ERRINFO_KEYPATH`, and are represented as a `confd_hkeypath_t` that can be accessed via `params[n].val.kp`. All other parameters are represented as strings, i.e. `params[n].type` is `CONFD_ERRINFO_STR` and the string value can be accessed via `params[n].val.str`. The `struct confd_errinfo_cli cli` and `struct confd_errinfo_misc misc` union members have the same form as `struct confd_errinfo_bad_value` shown above.

Finally, the `default_msg` callback parameter gives the default error message that will be reported to the user if the `format_error()` function does not generate a replacement.

```
void confd_error_seterr(
struct confd_user_info *uinfo, const char *fmt, ...);
```

This function must be called by `format_error()` to provide a replacement of the default error message. If `format_error()` returns without calling `confd_error_seterr()`, the default message will be used.

Here is an example that targets a specific validation error for a specific element in the data model. For this case only, it replaces ConfD's internally generated messages of the form:

`"too many 'protocol bgp', 2 configured, at most 1 must be configured"`

with

`"Only 1 bgp instance is supported, cannot define 2"`

```
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
```

The CLI-specific "Aborted: " prefix is not included in the message for this error type - if we wanted to replace that too, we could include the `CONFD_ERRTYPE_CLI` error type in the registration and process the `CONFD_CLI_COMMAND_ABORTED` error code for this type, see `errcode.xml`.

### See Also

`confd.conf(5)` - ConfD daemon configuration file format

The ConfD User Guide

***

## `confd_lib_events`

`confd_lib_events` - library for subscribing to NSO event notifications

### Synopsis

```
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
```

### Library

NSO Library, (`libconfd`, `-lconfd`)

### Description

The `libconfd` shared library is used to connect to NSO and subscribe to certain events generated by NSO. The API to receive events from NSO is a socket based API whereby the application connects to NSO and receives events on a socket. See also the Notifications chapter in Northbound APIs. The program `misc/notifications/confd_notifications.c` in the examples collection illustrates subscription and processing for all these events, and can also be used standalone in a development environment to monitor NSO events.

> **Note**
>
> Any event may allocate memory dynamically inside the `struct confd_notification`, thus we must always call `confd_free_notification()` after receiving and processing an event.

### Events

The following events can be subscribed to:

`CONFD_NOTIF_AUDIT`

> All audit log events are sent from ConfD on the event notification socket.

`CONFD_NOTIF_AUDIT_SYNC`

> This flag modifies the behavior of a subscription for the `CONFD_NOTIF_AUDIT` event - it has no effect unless `CONFD_NOTIF_AUDIT` is also present. If this flag is present, ConfD will stop processing in the user session that causes an audit notification to be sent, and continue processing in that user session only after all subscribers with this flag have called `confd_sync_audit_notification()`.

`CONFD_NOTIF_DAEMON`

> All log events that also goes to the /confdConf/logs/confdLog log are sent from ConfD on the event notification socket.

`CONFD_NOTIF_NETCONF`

> All log events that also goes to the /confdConf/logs/netconfLog log are sent from ConfD on the event notification socket.

`CONFD_NOTIF_DEVEL`

> All log events that also goes to the /confdConf/logs/developerLog log are sent from ConfD on the event notification socket.

`CONFD_NOTIF_JSONRPC`

> All log events that also goes to the /confdConf/logs/jsonrpcLog log are sent from ConfD on the event notification socket.

`CONFD_NOTIF_WEBUI`

> All log events that also goes to the /confdConf/logs/webuiAccessLog log are sent from ConfD on the event notification socket.

`CONFD_NOTIF_TAKEOVER_SYSLOG`

> If this flag is present, ConfD will stop syslogging. The idea behind the flag is that we want to configure syslogging for ConfD in order to let ConfD log its startup sequence. Once ConfD is started we wish to subsume the syslogging done by ConfD. Typical applications that use this flag want to pick up all log messages, reformat them and use some local logging method.
>
> Once all subscriber sockets with this flag set are closed, ConfD will resume to syslog.

`CONFD_NOTIF_COMMIT_SIMPLE`

> An event indicating that a user has somehow modified the configuration.

`CONFD_NOTIF_COMMIT_DIFF`

> An event indicating that a user has somehow modified the configuration. The main difference between this event and the abovementioned CONFD\_NOTIF\_COMMIT\_SIMPLE is that this event is synchronous, i.e. the entire transaction hangs until we have explicitly called `confd_diff_notification_done()`. The purpose of this event is to give the applications a chance to read the configuration diffs from the transaction before it finishes. A user subscribing to this event can use MAAPI to attach (`maapi_attach()`) to the running transaction and use `maapi_diff_iterate()` to iterate through the diff. This feature can also be used to produce a complete audit trail of who changed what and when in the system. It is up to the application to format that audit trail.

`CONFD_NOTIF_COMMIT_FAILED`

> This event is generated when a data provider fails in its commit callback. ConfD executes a two-phase commit procedure towards all data providers when committing transactions. When a provider fails in commit, the system is an unknown state. See [confd\_lib\_maapi(3)](section3.md#confd_lib_maapi) and the function `maapi_get_running_db_state()`. If the provider is "external", the name of failing daemon is provided. If the provider is another NETCONF agent, the IP address and port of that agent is provided.

`CONFD_NOTIF_CONFIRMED_COMMIT`

> This event is generated when a user has started a confirmed commit, when a confirming commit is issued, or when a confirmed commit is aborted; represented by `enum confd_confirmed_commit_type`.
>
> For a confirmed commit, the timeout value is also present in the notification.

`CONFD_NOTIF_COMMIT_PROGRESS`

> This event provides progress information about the commit of a transaction. The application receives a `struct confd_progress_notification` which gives details for the specific transaction along with the progress information, see `confd_events.h`.

`CONFD_NOTIF_PROGRESS`

> This event provides progress information about the commit of a transaction or an action being applied. The application receives a `struct confd_progress_notification` which gives details for the specific transaction/action along with the progress information, see `confd_events.h`.

`CONFD_NOTIF_USER_SESSION`

> An event related to user sessions. There are 6 different user session related event types, defined in `enum confd_user_sess_type`: session starts/stops, session locks/unlocks database, session starts/stop database transaction.

`CONFD_NOTIF_HA_INFO`

> An event related to ConfDs perception of the current cluster configuration.

`CONFD_NOTIF_HA_INFO_SYNC`

> This flag modifies the behavior of a subscription for the `CONFD_NOTIF_HA_INFO` event - it has no effect unless `CONFD_NOTIF_HA_INFO` is also present. If this flag is present, ConfD will stop all HA processing, and continue only after all subscribers with this flag have called `confd_sync_ha_notification()`.

`CONFD_NOTIF_SUBAGENT_INFO`

> Only sent if ConfD runs as a primary agent with subagents enabled. This event is sent when the subagent connection is lost or reestablished. There are two event types, defined in `enum confd_subagent_info_type`: subagent up and subagent down.

`CONFD_NOTIF_SNMPA`

> This event is generated whenever an SNMP pdu is processed by ConfD. The application receives a `struct confd_snmpa_notification` structure. The structure contains a series of fields describing the sent or received SNMP pdu. It contains a list of all varbinds in the pdu.
>
> Each varbind contains a `confd_value_t` with the string representation of the SNMP value. Thus the type of the value in a varbind is always C\_BUF. See `confd_events.h` include file for the details of the received structure.

`CONFD_NOTIF_FORWARD_INFO`

> This event is generated whenever ConfD forwards (proxies) a northbound agent.

`CONFD_NOTIF_UPGRADE_EVENT`

> This event is generated for the different phases of an in-service upgrade, i.e. when the data model is upgraded while ConfD is running. The application receives a `struct confd_upgrade_notification` where the `enum confd_upgrade_event_type event` gives the specific upgrade event, see `confd_events.h`. The events correspond to the invocation of the MAAPI functions that drive the upgrade, see [confd\_lib\_maapi(3)](section3.md#confd_lib_maapi).

`CONFD_NOTIF_HEARTBEAT`

> This event can be be used by applications that wish to monitor the health and liveness of ConfD itself. It needs to be requested through a call to `confd_notifications_connect2()`, where the required `heartbeat_interval` can be provided via the `struct confd_notifications_data` parameter. ConfD will continuously generate heartbeat events on the notification socket. If ConfD fails to do so, ConfD is hung, or prevented from getting the CPU time required to send the event. The timeout interval is measured in milliseconds. Recommended value is 10000 milliseconds to cater for truly high load situations. Values less than 1000 are changed to 1000.

`CONFD_NOTIF_HEALTH_CHECK`

> This event is similar to `CONFD_NOTIF_HEARTBEAT`, in that it can be be used by applications that wish to monitor the health and liveness of ConfD itself. However while `CONFD_NOTIF_HEARTBEAT` will be generated as long as ConfD is not completely hung, `CONFD_NOTIF_HEALTH_CHECK` will only be generated after a basic liveness check of the different ConfD subsystems has completed successfully. This event also needs to be requested through a call to `confd_notifications_connect2()`, where the required `health_check_interval` can be provided via the `struct confd_notifications_data` parameter. Since the event generation incurs more processing than `CONFD_NOTIF_HEARTBEAT`, a longer interval than 10000 milliseconds is recommended, but in particular the application must be prepared for the actual interval to be significantly longer than the requested one in high load situations. Values less than 1000 are changed to 1000.

`CONFD_NOTIF_REOPEN_LOGS`

> This event indicates that NSO will close and reopen its log files, i.e. that `ncs --reload` or `maapi_reopen_logs()` (e.g. via `ncs_cmd -c reopen_logs`) has been used.

`CONFD_NOTIF_STREAM_EVENT`

> This event is generated for a notification stream, i.e. event notifications sent by an application as described in the [NOTIFICATION STREAMS](section3.md#confd_lib_dp.notification_streams) section of [confd\_lib\_dp(3)](section3.md#confd_lib_dp). The application receives a `struct confd_stream_notification` where the `enum confd_stream_notif_type type` gives the specific event that occurred, see `confd_events.h`. This can be either an actual event notification (`CONFD_STREAM_NOTIFICATION_EVENT`), one of `CONFD_STREAM_NOTIFICATION_COMPLETE` or `CONFD_STREAM_REPLAY_COMPLETE`, which indicates that a requested replay has completed, or `CONFD_STREAM_REPLAY_FAILED`, which indicates that a requested replay could not be carried out. In all cases except `CONFD_STREAM_NOTIFICATION_EVENT`, no further `CONFD_NOTIF_STREAM_EVENT` events will be delivered on the socket.
>
> This event also needs to be requested through a call to `confd_notifications_connect2()`, where the required `stream_name` must be provided via the `struct confd_notifications_data` parameter. The additional elements in the struct can be used as follows:
>
> * The `start_time` element can be given to request a replay, in which case `stop_time` can also be given to specify the end of the replay (or "live feed"). The `start_time` and `stop_time` must be set to the type C\_NOEXISTS to indicate that no value is given, otherwise values of type C\_DATETIME must be given.
> * The `xpath_filter` element may be used to specify an XPath filter to be applied to the notification stream. If no filtering is wanted, `xpath_filter` must be set to NULL.
> * The `usid` element may be used to specify the id of an existing user session for filtering based on AAA rules. Only notifications that are allowed by the access rights of that user session will be received. If no AAA restrictions are wanted, `usid` must be set to `0`.

`CONFD_NOTIF_COMPACTION`

> This event is generated after each CDB compaction performed by NSO. The application receives a `struct confd_compaction_notification` where the `enum confd_compaction_dbfile` indicates which datastore was compacted, and `enum confd_compaction_type` indicates whether the compaction was triggered manually or automatically by the system. The notification contains additional information on compaction time, datastore sizes and the number of transactions since the last compaction. See `confd_events.h` for more information.

`NCS_NOTIF_PACKAGE_RELOAD`

> This event is generated whenever NSO has completed a package reload.

`NCS_NOTIF_CQ_PROGRESS`

> This event is generated to report the progress of commit queue entries.
>
> The application receives a `struct ncs_cq_progress_notification` where the `enum ncs_cq_progress_notif_type type` gives the specific event that occurred, see `confd_events.h`. This can be one of `NCS_CQ_ITEM_WAITING` (waiting on another executing entry), `NCS_CQ_ITEM_EXECUTING`, `NCS_CQ_ITEM_LOCKED` (stalled by parent queue in cluster), `NCS_CQ_ITEM_COMPLETED`, `NCS_CQ_ITEM_FAILED` or `NCS_CQ_ITEM_DELETED`.

`NCS_NOTIF_CALL_HOME_INFO`

> This event is generated for a NETCONF Call Home connection. The application receives a `struct ncs_call_home_notification` structure. See `confd_events.h` include file for the details of the received structure.

`NCS_NOTIF_AUDIT_NETWORK`

> This event is generated whenever any config change is sent southbound towards a device.

`NCS_NOTIF_AUDIT_NETWORK_SYNC`

> This flag modifies the behavior of a subscription for the `NCS_NOTIF_AUDIT_NETWORK` event - it has no effect unless `NCS_NOTIF_AUDIT_NETWORK` is also present. If this flag is present, NSO will stop processing in the user session that causes an audit network notification to be sent, and continue processing in that user session only after all subscribers with this flag have called `ncs_sync_audit_network_notification()`.

Several of the above notification messages contain a lognumber which identifies the event. All log numbers are listed in the file `confd_logsyms.h`. Furthermore the array `confd_log_symbols[]` can be indexed with the lognumber and it contains the symbolic name of each error. The array `confd_log_descriptions[]` can also be indexed with the lognumber and it contains a textual description of the logged event.

### Functions

The API to receive events from ConfD is:

```
int confd_notifications_connect(
int sock, const struct sockaddr* srv, int srv_sz, confd_notification_type mask);

int confd_notifications_connect2(
int sock, const struct sockaddr* srv, int srv_sz, confd_notification_type mask, 
struct confd_notifications_data *data);
```

These functions create a notification socket. The `mask` is a bitmask of one or several `confd_notification_type` values.

The `confd_notifications_connect2()` variant is required if we wish to subscribe to `CONFD_NOTIF_HEARTBEAT`, `CONFD_NOTIF_HEALTH_CHECK`, or `CONFD_NOTIF_STREAM_EVENT` events. The `struct confd_notifications_data` is defined as:

```c
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

When requesting the `CONFD_NOTIF_STREAM_EVENT` event, `confd_notifications_connect2()` may fail and return CONFD\_ERR, with some specific `confd_errno` values:

`CONFD_ERR_NOEXISTS`

> The stream name given by `stream_name` does not exist.

`CONFD_ERR_XPATH`

> The XPath filter provided via `xpath_filter` failed to compile.

`CONFD_ERR_NOSESSION`

> The user session id given by `usid` does not identify an existing user session.

> **Note**
>
> If these calls fail (i.e. do not return CONFD\_OK), the socket descriptor must be closed and a new socket created before the call is re-attempted.

```
int confd_read_notification(
int sock, struct confd_notification *n);
```

The application is responsible for polling the notification socket. Once data is available to be read on the socket the application must call `confd_read_notification()` to read the data from the socket. On success the function returns CONFD\_OK and populates the `struct confd_notification*` pointer. See `confd_events.h` for the definition of the `struct confd_notification` structure.

If the application is not reading from the socket and a write() from ConfD hangs for more than 15 seconds, ConfD will close the socket and log the event to the confdLog

```
void confd_free_notification(
struct confd_notification *n);
```

The `struct confd_notification` can sometimes have memory dynamically allocated inside it. This function must be called to free any memory allocated inside the received notification structure.

For those notification structures that do not have any memory allocated, this function is a no-op, thus it is always safe to call this function after a notification structure has been processed.

```
int confd_diff_notification_done(
int sock, struct confd_trans_ctx  *tctx);
```

If the received event was CONFD\_NOTIF\_COMMIT\_DIFF it is important that we call this function when we are done reading the transaction diffs over MAAPI. The transaction is hanging until this function gets called. This function also releases memory associated to the transaction in the library.

```
int confd_sync_audit_notification(
int sock, int usid);
```

If the received event was CONFD\_NOTIF\_AUDIT, and we are subscribing to notifications with the flag CONFD\_NOTIF\_AUDIT\_SYNC, this function must be called when we are done processing the notification. The user session is hanging until this function gets called.

```
int confd_sync_ha_notification(
int sock);
```

If the received event was CONFD\_NOTIF\_HA\_INFO, and we are subscribing to notifications with the flag CONFD\_NOTIF\_HA\_INFO\_SYNC, this function must be called when we are done processing the notification. All HA processing is blocked until this function gets called.

```
int ncs_sync_audit_network_notification(
int sock, int usid);
```

If the received event was NCS\_NOTIF\_AUDIT\_NETWORK, and we are subscribing to notifications with the flag NCS\_NOTIF\_AUDIT\_NETWORK\_SYNC, this function must be called when we are done processing the notification. The user session will hang until this function is called.

### See Also

The ConfD User Guide

***

## `confd_lib_ha`

`confd_lib_ha` - library for connecting to NSO HA subsystem

### Synopsis

```
#include <confd_lib.h>
#include <confd_ha.h>

int confd_ha_connect(
int sock, const struct sockaddr* srv, int srv_sz, const char *token);

int confd_ha_beprimary(
int sock, confd_value_t *mynodeid);

int confd_ha_besecondary(
int sock, confd_value_t *mynodeid, struct confd_ha_node *primary, int waitreply);

int confd_ha_berelay(
int sock);

int confd_ha_benone(
int sock);

int confd_ha_get_status(
int sock, struct confd_ha_status *stat);

int confd_ha_secondary_dead(
int sock, confd_value_t *nodeid);
```

### Library

ConfD Library, (`libconfd`, `-lconfd`)

### Description

The `libconfd` shared library is used to connect to the NSO High Availability (HA) subsystem. NSO can replicate the configuration data on several nodes in a cluster. The purpose of this API is to manage the HA functionality. The details on usage of the HA API are described in the chapter High Availability in the Admin Guide.

### Functions

```
int confd_ha_connect(
int sock, const struct sockaddr* srv, int srv_sz, const char *token);
```

Connect a HA socket which can be used to control a NSO HA node. The token is a secret string that must be shared by all participants in the cluster. There can only be one HA socket towards NSO, a new call to `confd_ha_connect()` makes NSO close the previous connection and reset the token to the new value. Returns CONFD\_OK or CONFD\_ERR.

> **Note**
>
> If this call fails (i.e. does not return CONFD\_OK), the socket descriptor must be closed and a new socket created before the call is re-attempted.

```
int confd_ha_beprimary(
int sock, confd_value_t *mynodeid);
```

Instruct a HA node to be primary and also give the node a name. Returns CONFD\_OK or CONFD\_ERR.

_Errors:_ CONFD\_ERR\_HA\_BIND if we cannot bind the TCP socket, CONFD\_ERR\_BADSTATE if NSO is still in start phase 0.

```
int confd_ha_besecondary(
int sock, confd_value_t *mynodeid, struct confd_ha_node *primary, int waitreply);
```

Instruct a NSO HA node to be secondary to a named primary. The `waitreply` is a boolean int. If 1, the function is synchronous and it will hang until the node has initialized its CDB database. This may mean that the CDB database is copied in its entirety from the primary. If 0, we do not wait for the reply, but it is possible to use a notifications socket and get notified asynchronously via a HA\_INFO\_BESECONDARY\_RESULT notification. In both cases, it is also possible to use a notifications socket and get notified asynchronously when CDB at the secondary is initialized.

If the call of this function fails with `confd_errno` CONFD\_ERR\_HA\_CLOSED, it means that the initial synchronization with the primary failed, either due to the socket being closed or due to a timeout while waiting for a response from the primary. The function will fail with error CONFD\_ERR\_BADSTATE if NSO is still in start phase 0.

_Errors:_ CONFD\_ERR\_HA\_CONNECT, CONFD\_ERR\_HA\_BADNAME, CONFD\_ERR\_HA\_BADTOKEN, CONFD\_ERR\_HA\_BADFXS, CONFD\_ERR\_HA\_BADVSN, CONFD\_ERR\_HA\_CLOSED, CONFD\_ERR\_BADSTATE, CONFD\_ERR\_HA\_BADCONFIG

```
int confd_ha_berelay(
int sock);
```

Instruct an established HA secondary node to be a relay for other secondaries. This can be useful in certain deployment scenarios, but makes the management of the cluster more complex. Returns CONFD\_OK or CONFD\_ERR.

_Errors:_ CONFD\_ERR\_HA\_BIND if we cannot bind the TCP socket, CONFD\_ERR\_BADSTATE if the node is not already a secondary.

```
int confd_ha_benone(
int sock);
```

Instruct a node to resume the initial state, i.e. neither primary nor secondary.

_Errors:_ CONFD\_ERR\_BADSTATE if NSO is still in start phase 0.

```
int confd_ha_get_status(
int sock, struct confd_ha_status *stat);
```

Query a NSO HA node for its status. If successful, the function populates the confd\_ha\_status structure. This is the only HA related function which is possible to call while the NSO daemon is still in start phase 0.

```
int confd_ha_secondary_dead(
int sock, confd_value_t *nodeid);
```

This function must be used by the application to inform NSO HA subsystem that another node which is possibly connected to NSO is dead.

_Errors:_ CONFD\_ERR\_BADSTATE if NSO is still in start phase 0.

### See Also

`confd.conf(5)` - ConfD daemon configuration file format

The NSO User Guide

***

## `confd_lib_lib`

`confd_lib_lib` - common library functions for applications connecting to NSO

### Synopsis

```
#include <confd_lib.h>

void confd_init(
const char *name, FILE *estream, const enum confd_debug_level debug);

int confd_set_debug(
enum confd_debug_level debug, FILE *estream);

void confd_fatal(
const char *fmt);

int confd_load_schemas(
const struct sockaddr* srv, int srv_sz);

int confd_load_schemas_list(
const struct sockaddr* srv, int srv_sz, int flags, const uint32_t *nshash, 
const int *nsflags, int num_ns);

int confd_mmap_schemas_setup(
void *addr, size_t size, const char *filename, int flags);

int confd_mmap_schemas(
const char *filename);

void confd_free_schemas(
void);

int confd_svcmp(
const char *s, const confd_value_t *v);

int confd_pp_value(
char *buf, int bufsiz, const confd_value_t *v);

int confd_ns_pp_value(
char *buf, int bufsiz, const confd_value_t *v, int ns);

int confd_pp_kpath(
char *buf, int bufsiz, const confd_hkeypath_t *hkeypath);

int confd_pp_kpath_len(
char *buf, int bufsiz, const confd_hkeypath_t *hkeypath, int len);

char *confd_xmltag2str(
uint32_t ns, uint32_t xmltag);

int confd_xpath_pp_kpath(
char *buf, int bufsiz, uint32_t ns, const confd_hkeypath_t *hkeypath);

int confd_format_keypath(
char *buf, int bufsiz, const char *fmt, ...);

int confd_vformat_keypath(
char *buf, int bufsiz, const char *fmt, va_list ap);

int confd_get_nslist(
struct confd_nsinfo **listp);

char *confd_ns2prefix(
uint32_t ns);

char *confd_hash2str(
uint32_t hash);

uint32_t confd_str2hash(
const char *str);

struct confd_cs_node *confd_find_cs_root(
uint32_t ns);

struct confd_cs_node *confd_find_cs_node(
const confd_hkeypath_t *hkeypath, int len);

struct confd_cs_node *confd_find_cs_node_child(
const struct confd_cs_node *parent, struct xml_tag xmltag);

struct confd_cs_node *confd_cs_node_cd(
const struct confd_cs_node *start, const char *fmt, ...);

enum confd_vtype confd_get_base_type(
struct confd_cs_node *node);

int confd_max_object_size(
struct confd_cs_node *object);

struct confd_cs_node *confd_next_object_node(
struct confd_cs_node *object, struct confd_cs_node *cur, confd_value_t *value);

struct confd_type *confd_find_ns_type(
uint32_t nshash, const char *name);

struct confd_type *confd_get_leaf_list_type(
struct confd_cs_node *node);

int confd_val2str(
struct confd_type *type, const confd_value_t *val, char *buf, int bufsiz);

int confd_str2val(
struct confd_type *type, const char *str, confd_value_t *val);

char *confd_val2str_ptr(
struct confd_type *type, const confd_value_t *val);

int confd_get_decimal64_fraction_digits(
struct confd_type *type);

int confd_get_bitbig_size(
struct confd_type *type);

int confd_hkp_tagmatch(
struct xml_tag tags[], int tagslen, confd_hkeypath_t *hkp);

int confd_hkp_prefix_tagmatch(
struct xml_tag tags[], int tagslen, confd_hkeypath_t *hkp);

int confd_val_eq(
const confd_value_t *v1, const confd_value_t *v2);

void confd_free_value(
confd_value_t *v);

confd_value_t *confd_value_dup_to(
const confd_value_t *v, confd_value_t *newv);

void confd_free_dup_to_value(
confd_value_t *v);

confd_value_t *confd_value_dup(
const confd_value_t *v);

void confd_free_dup_value(
confd_value_t *v);

confd_hkeypath_t *confd_hkeypath_dup(
const confd_hkeypath_t *src);

confd_hkeypath_t *confd_hkeypath_dup_len(
const confd_hkeypath_t *src, int len);

void confd_free_hkeypath(
confd_hkeypath_t *hkp);

void confd_free_authorization_info(
struct confd_authorization_info *ainfo);

char *confd_lasterr(
void);

char *confd_strerror(
int code);

struct xml_tag *confd_last_error_apptag(
void);

int confd_register_ns_type(
uint32_t nshash, const char *name, struct confd_type *type);

int confd_register_node_type(
struct confd_cs_node *node, struct confd_type *type);

int confd_type_cb_init(
struct confd_type_cbs **cbs);

int confd_decrypt(
const char *ciphertext, int len, char *output);

int confd_stream_connect(
int sock, const struct sockaddr* srv, int srv_sz, int id, int flags);

int confd_deserialize(
struct confd_deserializable *s, unsigned char *buf);

int confd_serialize(
struct confd_serializable *s, unsigned char *buf, int bufsz, int *bytes_written, 
unsigned char **allocated);

void confd_deserialized_free(
struct confd_deserializable *s);
```

### Library

NSO Library, (`libconfd`, `-lconfd`)

### Description

The `libconfd` shared library is used to connect to NSO. This manual page describes functions and data structures that are not specific to any one of the APIs that are described in the other confd\_lib\_xxx(3) manual pages.

### Functions

```
void confd_init(
const char *name, FILE *estream, const enum confd_debug_level debug);
```

Initializes the ConfD library. Must be called before any other NSO API functions are called.

The `debug` parameter is used to control the debug level. The following levels are available:

`CONFD_SILENT`

> No printouts whatsoever are produced by the library.

`CONFD_DEBUG`

> Various printouts will occur for various error conditions. This is a decent value to have as default. If syslog is enabled for the library, these printouts will be logged at syslog level `LOG_ERR`, except for errors where `confd_errno` is `CONFD_ERR_INTERNAL`, which are logged at syslog level `LOG_CRIT`.

`CONFD_TRACE`

> The execution of callback functions and CDB/MAAPI API calls will be traced. This is very verbose and very useful during debugging. If syslog is enabled for the library, these printouts will be logged at syslog level `LOG_DEBUG`.

`CONFD_PROTO_TRACE`

> The low-level protocol exchange between the application and NSO will be traced. This is even more verbose than `CONFD_TRACE`, and normally only of interest to Cisco support. These printouts will not be logged via syslog, i.e. a non-NULL value for the `estream` parameter must be provided.

The `estream` parameter is used by all printouts from the library. The `name` parameter is typically included in most of the debug printouts. If the `estream` parameter is NULL, no printouts to a file will occur. Independent of the `estream` parameter, syslog can be enabled for the library by setting the global variable `confd_lib_use_syslog` to `1`. See [SYSLOG AND DEBUG](section3.md#confd_lib_lib.syslog_and_debug) in this man page.

```
int confd_set_debug(
enum confd_debug_level debug, FILE *estream);
```

This function can be used to change the `estream` and `debug` parameters for the library.

```
int confd_load_schemas(
const struct sockaddr* srv, int srv_sz);
```

Utility function that uses `maapi_load_schemas()` (see [confd\_lib\_maapi(3)](section3.md#confd_lib_maapi)) to load schema information from NSO. This function connects to NSO and loads all the schema information in NSO for all loaded "fxs" files into the library. This is necessary in order to get proper printouts of e.g. confd\_hkeypaths which otherwise just contains arrays of integers. This function should typically always be called when we initialize the library. See [confd\_types(3)](section3.md#confd_types).

Use of this utility function is discouraged as the caller has no control over how the socket communicating with NSO is created. We recommend calling `maapi_load_schemas()` directly (see [confd\_lib\_maapi(3)](section3.md#confd_lib_maapi)).

```
int confd_load_schemas_list(
const struct sockaddr* srv, int srv_sz, int flags, const uint32_t *nshash, 
const int *nsflags, int num_ns);
```

Utility function that uses `maapi_load_schemas_list()` to load a subset of the schema information from NSO. See the description of `maapi_load_schemas_list()` in [confd\_lib\_maapi(3)](section3.md#confd_lib_maapi) for the details of how to use the `flags`, `nshash`, `nsflags`, and `num_ns` parameters.

Use of this utility function is discouraged as the caller has no control over how the socket communicating with NSO is created. We recommend calling `maapi_load_schemas_list()` directly (see [confd\_lib\_maapi(3)](section3.md#confd_lib_maapi)).

```
int confd_mmap_schemas_setup(
void *addr, size_t size, const char *filename, int flags);
```

This function sets up for a subsequent call of one of the schema-loading functions (`confd_load_schemas()` etc) to load the schema information into a shared memory segment instead of into the process' heap. The `addr` and (potentially) `size` arguments are passed to `mmap(2)`, and `filename` specifies the pathname of a file to use as backing store. The `flags` parameter can be given as `CONFD_MMAP_SCHEMAS_KEEP_SIZE` to request that the shared memory segment should be exactly the size given by the (non-zero) `size` argument - if this size is insufficient to hold the schema information, the schema-loading function will fail.

```
int confd_mmap_schemas(
const char *filename);
```

Map a shared memory segment, previously created by `confd_mmap_schemas_setup()` and subsequent schema loading, into the current process' address space, and make it ready for use. The `filename` argument specifies the pathname of the file that is used as backing store. See also /ncs-config/enable-shared-memory-schema in [ncs.conf(5)](section5.md#ncs.conf) and `maapi_get_schema_file_path()` in [confd\_lib\_maapi(3)](section3.md#confd_lib_maapi).

```
void confd_free_schemas(
void);
```

Free or unmap the memory allocated or mapped by schema loading, undoing the result of loading - i.e. schema information will no longer be available. There is normally no need to call this function, since the memory will be automatically freed/unmapped if a new schema loading is done, or when the process terminates, but it may be useful in some cases.

```
int confd_svcmp(
const char *s, const confd_value_t *v);
```

Utility function with similar semantics to `strcmp()` which compares a `confd_value_t` to a `char*`.

```
int confd_pp_value(
char *buf, int bufsiz, const confd_value_t *v);
```

Utility function which pretty prints up to `bufsiz` characters into `buf`, giving a string representation of the value `v`. Since only the "primitive" type as defined by the `enum confd_vtype` is available, `confd_pp_value()` can not produce a true string representation in all cases, see the list below. If this is a problem, use `confd_val2str()` instead.

`C_ENUM_VALUE`

> The value is printed as "enum\<N>", where N is the integer value.

`C_BIT32`

> The value is printed as "bits\<X>", where X is an unsigned integer in hexadecimal format.

`C_BIT64`

> The value is printed as "bits\<X>", where X is an unsigned integer in hexadecimal format.

`C_BITBIG`

> The value is printed as "bits\<X>", where X is an unsigned integer (possibly very large) in hexadecimal format.

`C_BINARY`

> The string representation for `xs:hexBinary` is used, i.e. a sequence of hexadecimal characters.

`C_DECIMAL64`

> If the value of the `fraction_digits` element is within the possible range (1..18), it is assumed to be correct for the type and used for the string representation. Otherwise the value is printed as "invalid64\<N>", where N is the value of the `value` element.

`C_XMLTAG`

> The string representation is printed if schema information has been loaded into the library. Otherwise the value is printed as "tag\<N>", where N is the integer value.

`C_IDENTITYREF`

> The string representation is printed if schema information has been loaded into the library. Otherwise the value is printed as "idref\<N>", where N is the integer value.

All the `pp` pretty print functions, i.e. `confd_pp_value()` `confd_ns_pp_value()`, `confd_pp_kpath()` and `confd_xpath_pp_kpath()`, as well as the `confd_format_keypath()` and `confd_val2str()` functions, return the number of characters printed (not including the trailing NUL used to end output to strings) if there is enough space.

The formatting functions do not write more than `bufsiz` bytes (including the trailing NUL). If the output was truncated due to this limit then the return value is the number of characters (not including the trailing NUL) which would have been written to the final string if enough space had been available. Thus, a return value of `bufsiz` or more means that the output was truncated.

Except for `confd_val2str()`, these functions will never return CONFD\_ERR or any other negative value.

```
int confd_ns_pp_value(
char *buf, int bufsiz, const confd_value_t *v, int ns);
```

This function is deprecated, but will remain for backward compatibility. It just calls `confd_pp_value()` - use `confd_pp_value()` directly, or `confd_val2str()` (see below), instead.

```
int confd_pp_kpath(
char *buf, int bufsiz, const confd_hkeypath_t *hkeypath);
```

Utility function which pretty prints up to `bufsiz` characters into `buf`, giving a string representation of the path `hkeypath`. This will use the NSO curly brace notation, i.e. "/servers/server{www}/ip". Requires that schema information is available to the library, see [confd\_types(3)](section3.md#confd_types). Same return value as `confd_pp_value()`.

```
int confd_pp_kpath_len(
char *buf, int bufsiz, const confd_hkeypath_t *hkeypath, int len);
```

A variant of `confd_pp_kpath()` that prints only the first `len` elements of `hkeypath`.

```
int confd_format_keypath(
char *buf, int bufsiz, const char *fmt, ...);
```

Several of the functions in [confd\_lib\_maapi(3)](section3.md#confd_lib_maapi) and [confd\_lib\_cdb(3)](section3.md#confd_lib_cdb) take a variable number of arguments which are then, similar to printf, used to generate the path passed to NSO - see the [PATHS](section3.md#confd_lib_cdb.paths) section of confd\_lib\_cdb(3). This function takes the same arguments, but only formats the path as a string, writing at most `bufsiz` characters into `buf`. If the path is absolute and schema information is available to the library, key values referenced by a "%x" modifier will be printed according to their specific type, i.e. effectively using `confd_val2str()`, otherwise `confd_pp_value()` is used. Same return value as `confd_pp_value()`.

```
int confd_vformat_keypath(
char *buf, int bufsiz, const char *fmt, va_list ap);
```

Does the same as `confd_format_keypath()`, but takes a single va\_list argument instead of a variable number of arguments - i.e. similar to vprintf. Same return value as `confd_pp_value()`.

```
char *confd_xmltag2str(
uint32_t ns, uint32_t xmltag);
```

This function is deprecated, but will remain for backward compatibility. It just calls `confd_hash2str()` - use `confd_hash2str()` directly instead, see below.

```
int confd_xpath_pp_kpath(
char *buf, int bufsiz, uint32_t ns, const confd_hkeypath_t *hkeypath);
```

Similar to `confd_pp_kpath()` except that the path is formatted as an XPath path, i.e. "/servers:servers/server\[name="www"]/ip". This function can also take the namespace integer as an argument. If `0` is passed as `ns`, the namespace is derived from the hkeypath. Requires that schema information is available to the library, see [confd\_types(3)](section3.md#confd_types). Same return value as `confd_pp_value()`.

```
int confd_get_nslist(
struct confd_nsinfo **listp);
```

Provides a list of the namespaces known to the library as an array of `struct confd_nsinfo` structures:

```c
struct confd_nsinfo {
    const char *uri;
    const char *prefix;
    uint32_t hash;
    const char *revision;
    const char *module;
};
```

A pointer to the array is stored in `*listp`, and the function returns the number of elements in the array. The `module` element in `struct confd_nsinfo` will give the module name for namespaces defined by YANG modules, otherwise it is NULL. The `revision` element will give the revision for YANG modules that have a `revision` statement, otherwise it is NULL.

```
char *confd_ns2prefix(
uint32_t ns);
```

Returns a NUL-terminated string giving the namespace prefix for the namespace `ns`, if the namespace is known to the library - otherwise it returns NULL.

```
char *confd_hash2str(
uint32_t hash);
```

Returns a NUL-terminated string representing the node name given by `hash`, or NULL if the hash value is not found. Requires that schema information has been loaded from the NSO daemon into the library, see [confd\_types(3)](section3.md#confd_types) - otherwise it always returns NULL.

```
uint32_t confd_str2hash(
const char *str);
```

Returns the hash value representing the node name given by `str`, or 0 if the string is not found. Requires that schema information has been loaded from the NSO daemon into the library, see [confd\_types(3)](section3.md#confd_types) - otherwise it always returns 0.

```
struct confd_cs_node *confd_find_cs_root(
uint32_t ns);
```

When schema information is available to the library, this function returns the root of the tree representaton of the namespace given by `ns`, i.e. a pointer to the `struct confd_cs_node` for the (first) toplevel node. For namespaces that are augmented into other namespaces such that they do not have a toplevel node, this function returns NULL - the nodes of such a namespace are found below the `augment` target node(s) in other tree(s). See [confd\_types(3)](section3.md#confd_types).

```
struct confd_cs_node *confd_find_cs_node(
const confd_hkeypath_t *hkeypath, int len);
```

Utility function which finds the `struct confd_cs_node` corresponding to the `len` first elements of the hashed keypath. To make the search consider the full keypath, pass the `len` element from the `confd_hkeypath_t` structure (i.e. `mykeypath->len`). See [confd\_types(3)](section3.md#confd_types).

```
struct confd_cs_node *confd_find_cs_node_child(
const struct confd_cs_node *parent, struct xml_tag xmltag);
```

Utility function which finds the `struct confd_cs_node` corresponding to the child node given as `xmltag`. See [confd\_types(3)](section3.md#confd_types).

```
struct confd_cs_node *confd_cs_node_cd(
const struct confd_cs_node *start, const char *fmt, ...);
```

Utility function which finds the resulting `struct confd_cs_node` given an (optional) starting node and a (relative or absolute) string keypath. I.e. this function navigates the tree in a manner corresponding to `cdb_cd()`/`maapi_cd()`. Note however that the `confd_cs_node` tree does not have a node corresponding to "/". It is possible to pass `start` as `NULL`, in which case the path must be absolute (i.e. start with a "/").

Since the key values are not relevant for the tree navigation, the key elements can be omitted, i.e. a "tagpath" can be used - if present, key elements are ignored, whether given in the {...} form or the CDB-only \[N] form. See [confd\_types(3)](section3.md#confd_types).

If the path can not be found, `NULL` is returned, `confd_errno` is set to `CONFD_ERR_BADPATH`, and `confd_lasterr()` can be used to retrieve a string that describes the reason for the failure.

If `NULL` is returned and `confd_errno` is set to `CONFD_ERR_NO_MOUNT_ID`, it means that the path is ambiguous due to traversing a mount point. In this case `maapi_cs_node_cd()` or `cdb_cs_node_cd()` must be used instead, with a path that is fully instantiated (i.e. all keys provided).

```
enum confd_vtype confd_get_base_type(
struct confd_cs_node *node);
```

This function returns the base type of a leaf node, as a `confd_vtype` value.

```
int confd_max_object_size(
struct confd_cs_node *object);
```

Utility function which returns the maximum size (i.e. the needed length of the `confd_value_t` array) for an "object" retrieved by `cdb_get_object()`, `maapi_get_object()`, and corresponding multi-object functions. The `object` parameter is a pointer to the list or container `confd_cs_node` node for which we want to find the maximum size. See the description of `cdb_get_object()` in [confd\_lib\_cdb(3)](section3.md#confd_lib_cdb) for usage examples.

```
struct confd_cs_node *confd_next_object_node(
struct confd_cs_node *object, struct confd_cs_node *cur, confd_value_t *value);
```

Utility function to allow navigation of the `confd_cs_node` schema tree in parallel with the `confd_value_t` array populated by `cdb_get_object()`, `maapi_get_object()`, and corresponding multi-object functions. The `object` parameter is a pointer to the list or container node as for `confd_max_object_size()`, the `cur` parameter is a pointer to the `confd_cs_node` node for the current value, and the `value` parameter is a pointer to the current value in the array. The function returns a pointer to the `confd_cs_node` node for the next value in the array, or NULL when the complete object has been traversed. In the initial call for a given traversal, we must pass `object->children` for the `cur` parameter - this always points to the `confd_cs_node` node for the first value in the array. See the description of `cdb_get_object()` in [confd\_lib\_cdb(3)](section3.md#confd_lib_cdb) for usage examples.

```
struct confd_type *confd_find_ns_type(
uint32_t nshash, const char *name);
```

Returns a pointer to a type definition for the type named `name`, which is defined in the namespace identified by `nshash`, or NULL if the type could not be found. If `nshash` is 0, the type name will be looked up among the ConfD built-in types (i.e. the YANG built-in types, the types defined in the YANG "tailf-common" module, and the types defined in the "confd" and "xs" namespaces). The type definition pointer can be used with the `confd_val2str()` and `confd_str2val()` functions, see below. If `nshash` is not 0, the function requires that schema information has been loaded from the NSO daemon into the library, see [confd\_types(3)](section3.md#confd_types) - otherwise it returns NULL.

```
struct confd_type *confd_get_leaf_list_type(
struct confd_cs_node *node);
```

For a leaf-list node, the `type` field in the `struct confd_cs_node_info` (see [confd\_types(3)](section3.md#confd_types)) identifies a "list type" for the leaf-list "itself". This function takes a pointer to the `struct confd_cs_node` for a leaf-list node as argument, and returns the type of the elements in the leaf-list, i.e. corresponding to the `type` substatement for the leaf-list in the YANG module. If called for a node that is not a leaf-list, it returns NULL and sets `confd_errno` to `CONFD_ERR_PROTOUSAGE`. Requires that schema information has been loaded from the NSO daemon into the library, see [confd\_types(3)](section3.md#confd_types) - otherwise it returns NULL and sets `confd_errno` to `CONFD_ERR_UNAVAILABLE`.

```
int confd_val2str(
struct confd_type *type, const confd_value_t *val, char *buf, int bufsiz);
```

Prints the string representation of `val` into `buf`, which has the length `bufsiz`, using type information from the data model. Returns the length of the string as described for `confd_pp_value()`, or CONFD\_ERR if the value could not be converted (e.g. wrong type). The `type` pointer can be obtained either from the `struct confd_cs_node` corresponding to the leaf that `val` pertains to, or via the `confd_find_ns_type()` function above. The `struct confd_cs_node` can in turn be obtained by various combinations of the functions that operate on the `confd_cs_node` trees (see above), or by user-defined functions for navigating those trees. Requires that schema information has been loaded from the NSO daemon into the library, see [confd\_types(3)](section3.md#confd_types).

```
int confd_str2val(
struct confd_type *type, const char *str, confd_value_t *val);
```

Stores the value corresponding to the NUL-terminated string `str` in `val`, using type information from the data model. Returns CONFD\_OK, or CONFD\_ERR if the string could not be converted. See `confd_val2str()` for a description of the `type` argument. Requires that schema information has been loaded from the NSO daemon into the library, see [confd\_types(3)](section3.md#confd_types).

A special case is that CONFD\_ERR is returned, with `confd_errno` set to `CONFD_ERR_NO_MOUNT_ID`. This will only happen when the type is a YANG instance-identifier, and means that the Xpath expression (i.e. the string representation) is ambiguous due to traversing a mount point. In this case `maapi_xpath2kpath_th()` must be used to translate the string into a `confd_hkeypath_t`, which can then be used with `CONFD_SET_OBJECTREF()` to create the `confd_value_t` value.

> **Note**
>
> When the resulting value is of one of the C\_BUF, C\_BINARY, C\_LIST, C\_OBJECTREF, C\_OID, C\_QNAME, C\_HEXSTR, or C\_BITBIG `confd_value_t` types, the library has allocated memory to hold the value. It is up to the user of this function to free the memory using `confd_free_value()`.

```
char *confd_val2str_ptr(
struct confd_type *type, const confd_value_t *val);
```

A variant of `confd_val2str()` that can be used only when the string representation is a constant, i.e. C\_ENUM\_VALUE values. In this case it returns a pointer to the string, otherwise NULL. See `confd_val2str()` for a description of the `type` argument. Requires that schema information has been loaded from the NSO daemon into the library, see [confd\_types(3)](section3.md#confd_types).

```
int confd_get_decimal64_fraction_digits(
struct confd_type *type);
```

Utility function to obtain the value of the argument to the `fraction-digits` statement for a YANG `decimal64` type. This is useful when we want to create a `confd_value_t` for such a type, since the `value` element must be scaled according to the fraction-digits value. The function returns the fraction-digits value, or 0 if the `type` argument does not refer to a `decimal64` type. Requires that schema information has been loaded from the NSO daemon into the library, see [confd\_types(3)](section3.md#confd_types).

```
int confd_get_bitbig_size(
struct confd_type *type);
```

Utility function to obtain the maximum size needed for the byte array for the C\_BITBIG `confd_value_t` representation used when a YANG `bits` type has a highest bit position above 63. This is useful when we want to create a `confd_value_t` for such a type, since an array of this size can hold the values for all the bits defined for the type. Applications may however provide a confd\_value\_t with a shorter (but not longer) array to NSO. The file generated by `ncsc --emit-h` also includes a `#define` symbol for this size. The function returns 0 if the `type` argument does not refer to a `bits` type with a highest bit position above 63. Requires that schema information has been loaded from the NSO daemon into the library, see [confd\_types(3)](section3.md#confd_types).

```
int confd_hkp_tagmatch(
struct xml_tag tags[], int tagslen, confd_hkeypath_t *hkp);
```

When checking the hkeypaths that get passed into each iteration in e.g. `cdb_diff_iterate()` we can either explicitly check the paths, or use this function to do the job. The `tags` array (typically statically initialized) specifies a tagpath to match against the hkeypath. See `cdb_diff_match()`. The function returns one of these values:

```
#define CONFD_HKP_MATCH_NONE 0
#define CONFD_HKP_MATCH_TAGS (1 << 0)
#define CONFD_HKP_MATCH_HKP  (1 << 1)
#define CONFD_HKP_MATCH_FULL (CONFD_HKP_MATCH_TAGS|CONFD_HKP_MATCH_HKP)

    
```

`CONFD_HKP_MATCH_TAGS` means that the whole tagpath was matched by the hkeypath, and `CONFD_HKP_MATCH_HKP` means that the whole hkeypath was matched by the tagpath.

```
int confd_hkp_prefix_tagmatch(
struct xml_tag tags[], int tagslen, confd_hkeypath_t *hkp);
```

A simplified version of `confd_hkp_tagmatch()` - it returns 1 if the tagpath matches a prefix of the hkeypath, i.e. it is equivalent to calling `confd_hkp_tagmatch()` and checking if the return value includes `CONFD_HKP_MATCH_TAGS`.

```
int confd_val_eq(
const confd_value_t *v1, const confd_value_t *v2);
```

Utility function which compares two values. Returns positive value if equal, 0 otherwise.

```
void confd_fatal(
const char *fmt);
```

Utility function which formats a string, prints it to stderr and exits with exit code 1.

```
void confd_free_value(
confd_value_t *v);
```

When we retrieve values via the CDB or MAAPI interfaces, or convert strings to values via `confd_str2val()`, and these values are of either of the types C\_BUF, C\_BINARY, C\_QNAME, C\_OBJECTREF, C\_OID, C\_LIST, C\_HEXSTR, or C\_BITBIG, the library has allocated memory to hold the values. This memory must be freed by the application when it is done with the value. This function frees memory for all `confd_value_t` types. Note that this function does not free the structure itself, only possible internal pointers inside the struct. Typically we use `confd_value_t` variables as automatic variables allocated on the stack. If the held value is of fixed size, e.g. integers, xmltags etc, the `confd_free_value()` function does nothing.

> **Note**
>
> Memory for values received as parameters to callback functions is always managed by the library - the application must _not_ call `confd_free_value()` for those (on the other hand values of the types listed above that are received as parameters to a callback function must be copied if they are to persist beyond the callback invocation).

```
confd_value_t *confd_value_dup_to(
const confd_value_t *v, confd_value_t *newv);
```

This function copies the contents of `*v` to `*newv`, allocating memory for the actual value for the types that need it. It returns `newv`, or NULL if allocation failed. The allocated memory (if any) can be freed with `confd_free_dup_to_value()`.

```
void confd_free_dup_to_value(
confd_value_t *v);
```

Frees memory allocated by `confd_value_dup_to()`. Note this is not the same as `confd_free_value()`, since `confd_value_dup_to()` also allocates memory for values of type C\_STR - such values are not freed by `confd_free_value()`.

```
confd_value_t *confd_value_dup(
const confd_value_t *v);
```

This function allocates memory and duplicates `*v`, i.e. a `confd_value_t` struct is always allocated, memory for the actual value is also allocated for the types that need it. Returns a pointer to the new `confd_value_t`, or NULL if allocation failed. The allocated memory can be freed with `confd_free_dup_value()`.

```
void confd_free_dup_value(
confd_value_t *v);
```

Frees memory allocated by `confd_value_dup()`. Note this is not the same as `confd_free_value()`, since `confd_value_dup()` also allocates the actual `confd_value_t` struct, and allocates memory for values of type C\_STR - such values are not freed by `confd_free_value()`.

```
confd_hkeypath_t *confd_hkeypath_dup(
const confd_hkeypath_t *src);
```

This function allocates memory and duplicates a `confd_hkeypath_t`.

```
confd_hkeypath_t *confd_hkeypath_dup_len(
const confd_hkeypath_t *src, int len);
```

Like `confd_hkeypath_dup()`, but duplicates only the first `len` elements of the `confd_hkeypath_t`. I.e. the elements are shifted such that `v[0][0]` still refers to the last element.

```
void confd_free_hkeypath(
confd_hkeypath_t *hkp);
```

This function will free memory allocated by e.g. `confd_hkeypath_dup()`.

```
void confd_free_authorization_info(
struct confd_authorization_info *ainfo);
```

This function will free memory allocated by `maapi_get_authorization_info()`.

```
int confd_decrypt(
const char *ciphertext, int len, char *output);
```

When data is read over the CDB interface, the MAAPI interface or received in event notifications, the data for the two builtin types `tailf:des3-cbc-encrypted-string` or `tailf:aes-cfb-128-encrypted-string` is encrypted.

This function decrypts `len` bytes of data from `ciphertext` and writes the clear text to the `output` pointer. The `output` pointer must point to an area that is at least `len` bytes long.

> **Note**
>
> One of the functions `confd_install_crypto_keys()` and `maapi_install_crypto_keys()` must have been called before `confd_decrypt()` can be used.

### User-Defined Types

It is possible to define new types, i.e. mappings between a textual representation and a `confd_value_t` representation that are not pre-defined in the NSO daemon. Read more about this in the [confd\_types(3)](section3.md#confd_types) manual page.

```
int confd_type_cb_init(
struct confd_type_cbs **cbs);
```

This is the prototype for the function that a shared object implementing one or more user-defined types must provide. See [confd\_types(3)](section3.md#confd_types).

```
int confd_register_ns_type(
uint32_t nshash, const char *name, struct confd_type *type);
```

This function can be used to register a user-defined type with the libconfd library, to make it possible for `confd_str2val()` and `confd_val2str()` to provide local string<->value translation in the application. See [confd\_types(3)](section3.md#confd_types).

```
int confd_register_node_type(
struct confd_cs_node *node, struct confd_type *type);
```

This function provides an alternate way to register a user-defined type with the libconfd library, in particular when the user-defined type is specified "inline" in a `leaf` or `leaf-list` statement. See [confd\_types(3)](section3.md#confd_types).

### Confd Streams

Some functions in the NSO lib stream data. Either from NSO to the application of from the application to NSO. The individual functions that use this feature will explicitly indicate that the data is passed over a `stream socket`.

```
int confd_stream_connect(
int sock, const struct sockaddr* srv, int srv_sz, int id, int flags);
```

Connects a stream socket to NSO. The `id` and the `flags` take different values depending on the usage scenario. This is indicated for each individual function that makes use of a stream socket.

> **Note**
>
> If this call fails (i.e. does not return CONFD\_OK), the socket descriptor must be closed and a new socket created before the call is re-attempted.

### Marshalling

In various distributed scenarios we may want to send confd\_lib datatypes over the network. We have support to marshall and unmarshall some key datatypes.

```
int confd_serialize(
struct confd_serializable *s, unsigned char *buf, int bufsz, int *bytes_written, 
unsigned char **allocated);
```

This function takes a `confd_serializable` struct as parameter. We have:

```c
enum confd_serializable_type {
    CONFD_SERIAL_NONE      = 0,
    CONFD_SERIAL_VALUE_T   = 1,
    CONFD_SERIAL_HKEYPATH  = 2,
    CONFD_SERIAL_TAG_VALUE = 3
};
```

```c
struct confd_serializable {
    enum confd_serializable_type type;
    union {
        confd_value_t *value;
        confd_hkeypath_t *hkp;
        confd_tag_value_t *tval;
    } u;
};
```

The structure must be populated with a valid type and also a value to be serialized. The serialized data will be written into the provided buffer. If the size of the buffer is insufficient, the function returns the required size as a positive integer. If the provided buffer is NULL, the function will allocate a buffer and it is the responsibility of the caller to free the buffer. The optionally allocated buffer is then returned in the output char \*\* parameter `allocated`. The function returns 0 on success and -1 on failures.

```
int confd_deserialize(
struct confd_deserializable *s, unsigned char *buf);
```

This function takes a `confd_deserializable` struct as parameter. We have:

```c
struct confd_deserializable {
    enum confd_serializable_type type;
    union {
        confd_value_t value;
        confd_hkeypath_t hkp;
        confd_tag_value_t tval;
    } u;
    void *internal;  // internal structure containing memory
                     // for the above datatypes to point _into_
                     // freed by a call to confd_deserialize_free()
};
```

This function is the reverse of `confd_serialize()`. It populates the provided `confd_deserializable` structure with a type indicator and a reproduced value of the correct type. The structure contains allocated memory that must subsequently be freed with `confd_deserialiaze()`.

```
void confd_deserialized_free(
struct confd_deserializable *s);
```

A populated `confd_deserializable` struct contains allocated memory that must be freed. This function traverses a `confd_deserializable` struct as populated by the `confd_deserialize()` function and frees all allocated memory.

### Extended Error Reporting

The data provider callback functions described in [confd\_lib\_dp(3)](section3.md#confd_lib_dp) can pass error information back to NSO either as a simple string using `confd_xxx_seterr()`, or in a more structured/detailed form using the corresponding `confd_xxx_seterr_extended()` function. This form is also used when a CDB subscriber wishes to abort the current transaction with `cdb_sub_abort_trans()`, see [confd\_lib\_cdb(3)](section3.md#confd_lib_cdb). There is also a set of `confd_xxx_seterr_extended_info()` functions and a `cdb_sub_abort_trans_info()` function, that can alternatively be used if we want to provide contents for the NETCONF \<error-info> element. The description below uses the functions for transaction callbacks as an example, but the other functions follow the same pattern:

```
void confd_trans_seterr_extended(
struct confd_trans_ctx *tctx, enum confd_errcode code, uint32_t apptag_ns, 
uint32_t apptag_tag, const char *fmt);
```

The function can be used also after a data provider callback has returned CONFD\_DELAYED\_RESPONSE, but in that case it must be followed by a call of `confd_delayed_reply_error()` (see [confd\_lib\_dp(3)](section3.md#confd_lib_dp)) with NULL for the `errstr` pointer.

One of the following values can be given for the `code` argument:

`CONFD_ERRCODE_IN_USE`

> Locking a data store was not possible because it was already locked.

`CONFD_ERRCODE_RESOURCE_DENIED`

> General resource unavailability, e.g. insufficient memory to carry out an operation.

`CONFD_ERRCODE_INCONSISTENT_VALUE`

> A request parameter had an unacceptable/invalid value

`CONFD_ERRCODE_ACCESS_DENIED`

> The request could not be fulfilled because authorization did not allow it. (No additional error information will be reported by the northbound agent, to avoid any security breach.)

`CONFD_ERRCODE_APPLICATION`

> Unspecified error.

`CONFD_ERRCODE_APPLICATION_INTERNAL`

> As CONFD\_ERRCODE\_APPLICATION, but the additional error information is only for logging/debugging, and should not be reported by northbound agents.

`CONFD_ERRCODE_DATA_MISSING`

> A request could not be completed because the relevant data model content does not exist.

`CONFD_ERRCODE_INTERRUPT`

> Processing of a request was terminated due to user interrupt - see the description of the `interrupt()` transaction callback in [confd\_lib\_dp(3)](section3.md#confd_lib_dp).

There is currently limited support for specifying one of a set of fixed error tags via `apptag_ns` and `apptag_tag`: `apptag_ns` should be 0, and `apptag_tag` can be either 0 or the hash value for a data model node.

The `fmt` and remaining arguments can specify an arbitrary string as for `confd_trans_seterr()`, but when used with one of the `code` values that has a specific meaning, it should only be given if it has some additional information - e.g. passing "In use" with CONFD\_ERRCODE\_IN\_USE is not meaningful, and will typically result in duplicated information being reported by the northbound agent. If there is no additional information, just pass an empty string ("") for `fmt`.

A call of confd\_trans\_seterr(tctx, "string") is equivalent to confd\_trans\_seterr\_extended(tctx, CONFD\_ERRCODE\_APPLICATION, 0, 0, "string").

When the extended error reporting is used, the northbound agents will, where possible, use the extended error information to give protocol-specific error reports to the managers, as described in the following tables. (The CONFD\_ERRCODE\_INTERRUPT code does not have a mapping here, since these interfaces do not provide the possibility to interrupt a transaction.)

For SNMP, the `code` argument is mapped to SNMP ErrorStatus

| `code`                               | SNMP ErrorStatus      |
| ------------------------------------ | --------------------- |
| `CONFD_ERRCODE_IN_USE`               | `resourceUnavailable` |
| `CONFD_ERRCODE_RESOURCE_DENIED`      | `resourceUnavailable` |
| `CONFD_ERRCODE_INCONSISTENT_VALUE`   | `inconsistentValue`   |
| `CONFD_ERRCODE_ACCESS_DENIED`        | `noAccess`            |
| `CONFD_ERRCODE_APPLICATION`          | `genErr`              |
| `CONFD_ERRCODE_APPLICATION_INTERNAL` | `genErr`              |
| `CONFD_ERRCODE_DATA_MISSING`         | `inconsistentValue`   |

For NETCONF the `code` argument is mapped to \<error-tag>:

| `code`                               | NETCONF error-tag  |
| ------------------------------------ | ------------------ |
| `CONFD_ERRCODE_IN_USE`               | `in-use`           |
| `CONFD_ERRCODE_RESOURCE_DENIED`      | `resource-denied`  |
| `CONFD_ERRCODE_INCONSISTENT_VALUE`   | `invalid-value`    |
| `CONFD_ERRCODE_ACCESS_DENIED`        | `access-denied`    |
| `CONFD_ERRCODE_APPLICATION_`         | `operation-failed` |
| `CONFD_ERRCODE_APPLICATION_INTERNAL` | `operation-failed` |
| `CONFD_ERRCODE_DATA_MISSING`         | `data-missing`     |

The tag specified by `apptag_ns`/`apptag_tag` will be reported as \<error-app-tag>.

For MAAPI the `code` argument is mapped to `confd_errno`:

| `code`                               | `confd_errno`                    |
| ------------------------------------ | -------------------------------- |
| `CONFD_ERRCODE_IN_USE`               | `CONFD_ERR_INUSE`                |
| `CONFD_ERRCODE_RESOURCE_DENIED`      | `CONFD_ERR_RESOURCE_DENIED`      |
| `CONFD_ERRCODE_INCONSISTENT_VALUE`   | `CONFD_ERR_INCONSISTENT_VALUE`   |
| `CONFD_ERRCODE_ACCESS_DENIED`        | `CONFD_ERR_ACCESS_DENIED`        |
| `CONFD_ERRCODE_APPLICATION`          | `CONFD_ERR_EXTERNAL`             |
| `CONFD_ERRCODE_APPLICATION_INTERNAL` | `CONFD_ERR_APPLICATION_INTERNAL` |
| `CONFD_ERRCODE_DATA_MISSING`         | `CONFD_ERR_DATA_MISSING`         |

The tag (if any) can be retrieved by calling

```
struct xml_tag *confd_last_error_apptag(
void);
```

If no tag was provided by the callback (e.g. plain `confd_trans_seterr()` was used, or the error did not originate from a data provider callback at all), this function returns a pointer to a `struct xml_tag` with both the `ns` and the `tag` element set to 0.

In the CLI and Web UI a text string is produced through some combination of the `code` and the string given by `fmt, ...`.

```
int confd_trans_seterr_extended_info(
struct confd_trans_ctx *tctx, enum confd_errcode code, uint32_t apptag_ns, 
uint32_t apptag_tag, confd_tag_value_t *error_info, int n, const char *fmt);
```

This function can be used to provide structured error information in the same way as `confd_trans_seterr_extended()`, and additionally provide contents for the NETCONF \<error-info> element. The `error_info` argument is an array of length `n`, populated as described for the Tagged Value Array format in the [XML STRUCTURES](section3.md#confd_types.xml_structures) section of the [confd\_types(3)](section3.md#confd_types) manual page. The `error_info` information is discarded for other northbound agents than NETCONF.

The `tailf:error-info` statement (see [tailf\_yang\_extensions(5)](section5.md#tailf_yang_extensions)) must have been used in one or more YANG modules to declare the data nodes for \<error-info>. As an example, we could have this `error-info` declaration:

```
module mod {
  namespace "http://tail-f.com/test/mod";
  prefix mod;

  import tailf-common {
    prefix tailf;
  }

  ...

  tailf:error-info {
    leaf severity {
      type enumeration {
        enum info;
        enum error;
        enum critical;
      }
    }
    container detail {
      leaf class {
        type uint8;
      }
      leaf code {
        type uint8;
      }
    }
  }

  ...

}
```

A call of `confd_trans_seterr_extended_info()` to populate the \<error-info> could then look like this:

```
confd_tag_value_t error_info[10];
int i = 0;

CONFD_SET_TAG_ENUM_VALUE(&error_info[i],
                         mod_severity, mod_error);
CONFD_SET_TAG_NS(&error_info[i], mod__ns);          i++;
CONFD_SET_TAG_XMLBEGIN(&error_info[i],
                       mod_detail, mod__ns);        i++;
CONFD_SET_TAG_UINT8(&error_info[i], mod_class, 42); i++;
CONFD_SET_TAG_UINT8(&error_info[i], mod_code, 17);  i++;
CONFD_SET_TAG_XMLEND(&error_info[i],
                     mod_detail, mod__ns);          i++;
OK(confd_trans_seterr_extended_info(tctx, CONFD_ERRCODE_APPLICATION,
                                    0, 0, error_info, i,
                                    "Operation failed"));
```

> **Note**
>
> The toplevel elements in the `confd_tag_value_t` array _must_ have the `ns` element of the `struct xml_tag` set. The `CONFD_SET_TAG_XMLBEGIN()` macro will set this element, but for toplevel leaf elements the `CONFD_SET_TAG_NS()` macro needs to be used, as shown above.

The \<error-info> section resulting from the above would look like this:

```
    <error-info>
      ...
      <severity xmlns="http://tail-f.com/test/mod">error</severity>
      <detail xmlns="http://tail-f.com/test/mod">
        <class>42</class>
        <code>17</code>
      </detail>
    </error-info>
```

### Errors

All functions in `libconfd` signal errors through the return of the #defined CONFD\_ERR - which has the value -1 - or alternatively CONFD\_EOF (-2) which means that NSO closed its end of the socket.

Data provider callbacks (see [confd\_lib\_dp(3)](section3.md#confd_lib_dp)) can also signal errors by returning CONFD\_ERR from the callback. This can be done for all different kinds of callbacks. It is possible to provide additional error information from one of these callbacks by using one of the functions:

`confd_trans_seterr(), confd_trans_seterr_extended(), confd_trans_seterr_extended_info()`

> For transaction callbacks

`confd_db_seterr(), confd_db_seterr_extended(), confd_db_seterr_extended_info()`

> For db callbacks

`confd_action_seterr(), confd_action_seterr_extended(), confd_action_seterr_extended_info()`

> For action callbacks

`confd_notification_seterr(), confd_notification_seterr_extended(), confd_notification_seterr_extended_info()`

> For notification callbacks

CDB two phase subscribers (see [confd\_lib\_cdb(3)](section3.md#confd_lib_cdb)) can also provide error information when `cdb_read_subscription_socket2()` has returned with type set to `CDB_SUB_PREPARE`, using one of the functions `cdb_sub_abort_trans()` and `cdb_sub_abort_trans_info()`.

Whenever CONFD\_ERR is returned from any API function in `libconfd` it is possible to obtain additional information on the error through the symbol `confd_errno`. Additionally there may be an error text associated with the error. A call to the function

```
char *confd_lasterr(
void);
```

returns a string which contains additional textual information on the error. Furthermore, the function

```
char *confd_strerror(
int code);
```

returns a string which describes a particular error code. When one of the The following error codes are available:

`CONFD_ERR_NOEXISTS` (1)

> Typically we tried to read a value through CDB or MAAPI which does not exist.

`CONFD_ERR_ALREADY_EXISTS` (2)

> We tried to create something which already exists.

`CONFD_ERR_ACCESS_DENIED` (3)

> Access to an object was denied due to AAA authorization rules.

`CONFD_ERR_NOT_WRITABLE` (4)

> We tried to write an object which is not writable.

`CONFD_ERR_BADTYPE` (5)

> We tried to create or write an object which is specified to have another type (see [confd\_types(3)](section3.md#confd_types)) than the one we provided.

`CONFD_ERR_NOTCREATABLE` (6)

> We tried to create an object which is not possible to create.

`CONFD_ERR_NOTDELETABLE` (7)

> We tried to delete an object which is not possible to delete.

`CONFD_ERR_BADPATH` (8)

> We provided a bad path in any of the printf style functions which take a variable number of arguments.

`CONFD_ERR_NOSTACK` (9)

> We tried to pop without a preceding push.

`CONFD_ERR_LOCKED` (10)

> We tried to lock something which is already locked.

`CONFD_ERR_INUSE` (11)

> We tried to commit while someone else holds a lock.

`CONFD_ERR_NOTSET` (12)

> A mandatory leaf does not have a value, either because it has been deleted, or not set after a create.

`CONFD_ERR_NON_UNIQUE` (13)

> A group of leafs specified with the `unique` statement are not unique.

`CONFD_ERR_BAD_KEYREF` (14)

> Dangling pointer.

`CONFD_ERR_TOO_FEW_ELEMS` (15)

> A `min-elements` violation. A node has fewer elements or entries than specified with `min-elements`.

`CONFD_ERR_TOO_MANY_ELEMS` (16)

> A `max-elements` violation. A node has fewer elements or entries than specified with `max-elements`.

`CONFD_ERR_BADSTATE` (17)

> Some function, such as the MAAPI commit functions that require several functions to be called in a specific order, was called out of order.

`CONFD_ERR_INTERNAL` (18)

> An internal error. This normally indicates a bug in NSO or libconfd (if nothing else the lack of a better error code), please report it to Cisco support.

`CONFD_ERR_EXTERNAL` (19)

> All errors that originate in user code.

`CONFD_ERR_MALLOC` (20)

> Failed to allocate memory.

`CONFD_ERR_PROTOUSAGE` (21)

> Usage of API functions or callbacks was wrong. It typically means that we invoke a function when we shouldn't. For example if we invoke the `confd_data_reply_next_key()` in a `get_elem()` callback we get this error.

`CONFD_ERR_NOSESSION` (22)

> A session must be established prior to executing the function.

`CONFD_ERR_TOOMANYTRANS` (23)

> A new MAAPI transaction was rejected since the transaction limit threshold was reached.

`CONFD_ERR_OS` (24)

> An error occurred in a call to some operating system function, such as `write()`. The proper errno from libc should then be read and used as failure indicator.

`CONFD_ERR_HA_CONNECT` (25)

> Failed to connect to a remote HA node.

`CONFD_ERR_HA_CLOSED` (26)

> A remote HA node closed its connection to us, or there was a timeout waiting for a sync response from the primary during a call of `confd_ha_besecondary()`.

`CONFD_ERR_HA_BADFXS` (27)

> A remote HA node had a different set of fxs files compared to us. It could also be that the set is the same, but the version of some fxs file is different.

`CONFD_ERR_HA_BADTOKEN` (28)

> A remote HA node has a different token than us.

`CONFD_ERR_HA_BADNAME` (29)

> A remote ha node has a different name than the name we think it has.

`CONFD_ERR_HA_BIND` (30)

> Failed to bind the ha socket for incoming HA connects.

`CONFD_ERR_HA_NOTICK` (31)

> A remote HA node failed to produce the interval live ticks.

`CONFD_ERR_VALIDATION_WARNING` (32)

> `maapi_validate()` returned warnings.

`CONFD_ERR_SUBAGENT_DOWN` (33)

> An operation towards a mounted NETCONF subagent failed due to the subagent not being up.

`CONFD_ERR_LIB_NOT_INITIALIZED` (34)

> The confd library has not been properly initialized by a call to `confd_init()`.

`CONFD_ERR_TOO_MANY_SESSIONS` (35)

> Maximum number of sessions reached.

`CONFD_ERR_BAD_CONFIG` (36)

> An error in a configuration.

`CONFD_ERR_RESOURCE_DENIED` (37)

> A data provider callback returned CONFD\_ERRCODE\_RESOURCE\_DENIED (see EXTENDED ERROR REPORTING above).

`CONFD_ERR_INCONSISTENT_VALUE` (38)

> A data provider callback returned CONFD\_ERRCODE\_INCONSISTENT\_VALUE (see EXTENDED ERROR REPORTING above).

`CONFD_ERR_APPLICATION_INTERNAL` (39)

> A data provider callback returned CONFD\_ERRCODE\_APPLICATION\_INTERNAL (see EXTENDED ERROR REPORTING above).

`CONFD_ERR_UNSET_CHOICE` (40)

> No `case` has been selected for a mandatory `choice` statement.

`CONFD_ERR_MUST_FAILED` (41)

> A `must` constraint is not satisfied.

`CONFD_ERR_MISSING_INSTANCE` (42)

> The value of an `instance-identifier` leaf with `require-instance true` does not specify an existing instance.

`CONFD_ERR_INVALID_INSTANCE` (43)

> The value of an `instance-identifier` leaf does not conform to the specified path filters.

`CONFD_ERR_UNAVAILABLE` (44)

> We tried to use some unavailable functionality, e.g. get/set attributes on an operational data element.

`CONFD_ERR_EOF` (45)

> This value is used when a function returns CONFD\_EOF. Thus it is not strictly necessary to check whether the return value is CONFD\_ERR or CONFD\_EOF - if the function should return CONFD\_OK on success, but the return value is something else, the reason can always be found via confd\_errno.

`CONFD_ERR_NOTMOVABLE` (46)

> We tried to move an object which is not possible to move.

`CONFD_ERR_HA_WITH_UPGRADE` (47)

> We tried to perform an in-service data model upgrade on a HA node that was either an HA primary or secondary, or we tried to make the node a HA primary or secondary while an in-service data model upgrade was in progress.

`CONFD_ERR_TIMEOUT` (48)

> An operation did not complete within the specified timeout.

`CONFD_ERR_ABORTED` (49)

> An operation was aborted.

`CONFD_ERR_XPATH` (50)

> Compilation or evaluation of an XPath expression failed.

`CONFD_ERR_NOT_IMPLEMENTED` (51)

> A request was made for an operation that wasn't implemented. This will typically occur if an application uses a version of `libconfd` that is more recent than the version of the NSO daemon, and a CDB or MAAPI function is used that is only implemented in the library version.

`CONFD_ERR_HA_BADVSN` (52)

> A remote HA node had an incompatible protocol version.

`CONFD_ERR_POLICY_FAILED` (53)

> A user-defined policy expression evaluated to false.

`CONFD_ERR_POLICY_COMPILATION_FAILED` (54)

> A user-defined policy XPath expression could not be compiled.

`CONFD_ERR_POLICY_EVALUATION_FAILED` (55)

> A user-defined policy expression failed XPath evaluation.

`NCS_ERR_CONNECTION_REFUSED` (56)

> NCS failed to connect to a device.

`CONFD_ERR_START_FAILED` (57)

> NSO daemon failed to proceed to next start-phase.

`CONFD_ERR_DATA_MISSING` (58)

> A data provider callback returned CONFD\_ERRCODE\_DATA\_MISSING (see EXTENDED ERROR REPORTING above).

`CONFD_ERR_CLI_CMD` (59)

> Execution of a CLI command failed.

`CONFD_ERR_UPGRADE_IN_PROGRESS` (60)

> A request was made for an operation that is not allowed when in-service data model upgrade is in progress.

`CONFD_ERR_NOTRANS` (61)

> An invalid transaction handle was passed to a MAAPI function - i.e. the handle did not refer to a transaction that was either started on, or attached to, the MAAPI socket.

`NCS_ERR_SERVICE_CONFLICT` (62)

> An NCS service invocation running outside the transaction lock modified data that was also modified by a service invocation in another transaction.

`CONFD_ERR_NO_MOUNT_ID` (67)

> A path is ambiguous due to traversing a mount point.

`CONFD_ERR_STALE_INSTANCE` (68)

> The value of an `instance-identifier` leaf with `require-instance true` has stale data after upgrading.

`CONFD_ERR_HA_BADCONFIG` (69)

> A remote HA node has a bad configuration of at least one HA application which prevents it from functioning properly. The reason can be that the remote HA node has a different NETCONF event notification configuration compared to the primary node, i.e. the remote HA node has one or more NETCONF event notification streams that have different stream name when built-in replay store is enabled.

### Miscellaneous

The library will always set the default signal handler for SIGPIPE to be SIG\_IGN. All libconfd APIs are socket based and the library must be able to detect failed write operations in a controlled manner.

The include file `confd_lib.h` includes `assert.h` and uses assert macros in the specialized `CONFD_GET_XXX()` macros. If the behavior of assert is not wanted in a production environment, we can define NDEBUG before including `confd_lib.h` (or `confd.h`), see assert(3). Alternatively we can define a `CONFD_ASSERT()` macro before including `confd_lib.h`. The assert macros are invoked via `CONFD_ASSERT()`, which is defined by:

```
#ifndef CONFD_ASSERT
#define CONFD_ASSERT(E) assert(E)
#endif
```

I.e. by defining a different version of `CONFD_ASSERT()`, we can get our own error handler invoked instead of assert(3), for example:

```
void log_error(char *file, int line, char *expr);

#define CONFD_ASSERT(E) \
            ((E) ? (void)0 : log_error(__FILE__, __LINE__, #E))

#include <confd_lib.h>
    
```

### Syslog And Debug

When developing applications with `libconfd` we always need to indicate to the library which verbosity level should be used by the library. There are three different levels to choose from: CONFD\_SILENT where the library never writes anything, CONFD\_DEBUG where the library reports all errors and finally CONFD\_TRACE where the library traces the execution and invocations of all the various callback functions.

There are two different destinations for all library printouts. When we call `confd_init()`, we always need to supply a `FILE*` stream which should be used for all printouts. This parameter can be set to NULL if we never want any `FILE*` printouts to occur.

The second destination is syslog, i.e. the library will syslog if told to. This is controlled by the global integer variable `confd_lib_use_syslog`. If we set this variable to `1`, `libconfd` will syslog all output. If we set it to `0` the library will not syslog. It is the responsibility of the application to (optionally) call `openlog()` before initializing the NSO library. The default value is `0`.

There also exists a hook point at which a library user can install their own printer. This done by assigning to a global variable `confd_user_log_hook`, as in:

```
void mylogger(int syslogprio, const char *fmt, va_list ap) {
    char buf[BUFSIZ];
    sprintf(buf, "MYLOG:(%d) ", syslogprio); strcat(buf, fmt);
    vfprintf(stderr, buf, ap);
}

confd_user_log_hook = mylogger;
```

The `syslogprio` is LOG\_ERR or LOG\_CRIT for error messages, and LOG\_DEBUG for trace messages, see the description of `confd_init()`.

Thus a good combination of values in a target environment is to set the `FILE*` handle to NULL and `confd_lib_use_syslog` to `1`. This way we do not get the overhead of file logging and at the same time get all errors reported to syslog.

### See Also

`ncs(5)` - NSO daemon configuration file format

The NSO User Guide

***

## `confd_lib_maapi`

`confd_lib_maapi` - MAAPI (Management Agent API). A library for connecting to NCS

### Synopsis

```
#include <confd_lib.h>
#include <confd_maapi.h>

int maapi_start_user_session(
int sock, const char *username, const char *context, const char **groups, 
int numgroups, const struct confd_ip *src_addr, enum confd_proto prot);

int maapi_start_user_session2(
int sock, const char *username, const char *context, const char **groups, 
int numgroups, const struct confd_ip *src_addr, int src_port, enum confd_proto prot);

int maapi_start_trans(
int sock, enum confd_dbname dbname, enum confd_trans_mode readwrite);

int maapi_start_trans2(
int sock, enum confd_dbname dbname, enum confd_trans_mode readwrite, int usid);

int maapi_start_trans_flags(
int sock, enum confd_dbname dbname, enum confd_trans_mode readwrite, int usid, 
int flags);

int maapi_connect(
int sock, const struct sockaddr* srv, int srv_sz);

int maapi_load_schemas(
int sock);

int maapi_load_schemas_list(
int sock, int flags, const uint32_t *nshash, const int *nsflags, int num_ns);

int maapi_get_schema_file_path(
int sock, char **buf);

int maapi_close(
int sock);

int maapi_start_user_session_gen(
int sock, const char *username, const char *context, const char **groups, 
int numgroups, const char *vendor, const char *product, const char *version, 
const char *client_id);

int maapi_start_user_session3(
int sock, const char *username, const char *context, const char **groups, 
int numgroups, const struct confd_ip *src_addr, int src_port, enum confd_proto prot, 
const char *vendor, const char *product, const char *version, const char *client_id);

int maapi_end_user_session(
int sock);

int maapi_kill_user_session(
int sock, int usessid);

int maapi_get_user_sessions(
int sock, int res[], int n);

int maapi_get_user_session(
int sock, int usessid, struct confd_user_info *us);

int maapi_get_my_user_session_id(
int sock);

int maapi_set_user_session(
int sock, int usessid);

int maapi_get_user_session_identification(
int sock, int usessid, struct confd_user_identification *uident);

int maapi_get_user_session_opaque(
int sock, int usessid, char **opaque);

int maapi_get_authorization_info(
int sock, int usessid, struct confd_authorization_info **ainfo);

int maapi_set_next_user_session_id(
int sock, int usessid);

int maapi_lock(
int sock, enum confd_dbname name);

int maapi_unlock(
int sock, enum confd_dbname name);

int maapi_is_lock_set(
int sock, enum confd_dbname name);

int maapi_lock_partial(
int sock, enum confd_dbname name, char *xpaths[], int nxpaths, int *lockid);

int maapi_unlock_partial(
int sock, int lockid);

int maapi_candidate_validate(
int sock);

int maapi_delete_config(
int sock, enum confd_dbname name);

int maapi_candidate_commit(
int sock);

int maapi_candidate_commit_persistent(
int sock, const char *persist_id);

int maapi_candidate_commit_info(
int sock, const char *persist_id, const char *label, const char *comment);

int maapi_candidate_confirmed_commit(
int sock, int timeoutsecs);

int maapi_candidate_confirmed_commit_persistent(
int sock, int timeoutsecs, const char *persist, const char *persist_id);

int maapi_candidate_confirmed_commit_info(
int sock, int timeoutsecs, const char *persist, const char *persist_id, 
const char *label, const char *comment);

int maapi_candidate_abort_commit(
int sock);

int maapi_candidate_abort_commit_persistent(
int sock, const char *persist_id);

int maapi_candidate_reset(
int sock);

int maapi_confirmed_commit_in_progress(
int sock);

int maapi_copy_running_to_startup(
int sock);

int maapi_is_running_modified(
int sock);

int maapi_is_candidate_modified(
int sock);

int maapi_start_trans_flags2(
int sock, enum confd_dbname dbname, enum confd_trans_mode readwrite, int usid, 
int flags, const char *vendor, const char *product, const char *version, 
const char *client_id);

int maapi_start_trans_in_trans(
int sock, enum confd_trans_mode readwrite, int usid, int thandle);

int maapi_finish_trans(
int sock, int thandle);

int maapi_validate_trans(
int sock, int thandle, int unlock, int forcevalidation);

int maapi_prepare_trans(
int sock, int thandle);

int maapi_prepare_trans_flags(
int sock, int thandle, int flags);

int maapi_commit_trans(
int sock, int thandle);

int maapi_abort_trans(
int sock, int thandle);

int maapi_apply_trans(
int sock, int thandle, int keepopen);

int maapi_apply_trans_flags(
int sock, int thandle, int keepopen, int flags);

int maapi_ncs_apply_trans_params(
int sock, int thandle, int keepopen, confd_tag_value_t *params, int nparams, 
confd_tag_value_t **values, int *nvalues);

int maapi_ncs_get_trans_params(
int sock, int thandle, confd_tag_value_t **values, int *nvalues);

int maapi_commit_queue_result(
int sock, int thandle, int timeoutsecs, struct ncs_commit_queue_result *result);

int maapi_get_rollback_id(
int sock, int thandle, int *fixed_id);

int maapi_set_namespace(
int sock, int thandle, int hashed_ns);

int maapi_cd(
int sock, int thandle, const char *fmt, ...);

int maapi_pushd(
int sock, int thandle, const char *fmt, ...);

int maapi_popd(
int sock, int thandle);

int maapi_getcwd(
int sock, int thandle, size_t strsz, char *curdir);

int maapi_getcwd2(
int sock, int thandle, size_t *strsz, char *curdir);

int maapi_getcwd_kpath(
int sock, int thandle, confd_hkeypath_t **kp);

int maapi_exists(
int sock, int thandle, const char *fmt, ...);

int maapi_num_instances(
int sock, int thandle, const char *fmt, ...);

int maapi_get_elem(
int sock, int thandle, confd_value_t *v, const char *fmt, ...);

int maapi_get_int8_elem(
int sock, int thandle, int8_t *rval, const char *fmt, ...);

int maapi_get_int16_elem(
int sock, int thandle, int16_t *rval, const char *fmt, ...);

int maapi_get_int32_elem(
int sock, int thandle, int32_t *rval, const char *fmt, ...);

int maapi_get_int64_elem(
int sock, int thandle, int64_t *rval, const char *fmt, ...);

int maapi_get_u_int8_elem(
int sock, int thandle, uint8_t *rval, const char *fmt, ...);

int maapi_get_u_int16_elem(
int sock, int thandle, uint16_t *rval, const char *fmt, ...);

int maapi_get_u_int32_elem(
int sock, int thandle, uint32_t *rval, const char *fmt, ...);

int maapi_get_u_int64_elem(
int sock, int thandle, uint64_t *rval, const char *fmt, ...);

int maapi_get_ipv4_elem(
int sock, int thandle, struct in_addr *rval, const char *fmt, ...);

int maapi_get_ipv6_elem(
int sock, int thandle, struct in6_addr *rval, const char *fmt, ...);

int maapi_get_double_elem(
int sock, int thandle, double *rval, const char *fmt, ...);

int maapi_get_bool_elem(
int sock, int thandle, int *rval, const char *fmt, ...);

int maapi_get_datetime_elem(
int sock, int thandle, struct confd_datetime *rval, const char *fmt, ...);

int maapi_get_date_elem(
int sock, int thandle, struct confd_date *rval, const char *fmt, ...);

int maapi_get_time_elem(
int sock, int thandle, struct confd_time *rval, const char *fmt, ...);

int maapi_get_duration_elem(
int sock, int thandle, struct confd_duration *rval, const char *fmt, ...);

int maapi_get_enum_value_elem(
int sock, int thandle, int32_t *rval, const char *fmt, ...);

int maapi_get_bit32_elem(
int sock, int thandle, uint32_t *rval, const char *fmt, ...);

int maapi_get_bit64_elem(
int sock, int thandle, uint64_t *rval, const char *fmt, ...);

int maapi_get_bitbig_elem(
int sock, int thandle, unsigned char **rval, int *bufsiz, const char *fmt, 
...);

int maapi_get_objectref_elem(
int sock, int thandle, confd_hkeypath_t **rval, const char *fmt, ...);

int maapi_get_oid_elem(
int sock, int thandle, struct confd_snmp_oid **rval, const char *fmt, 
...);

int maapi_get_buf_elem(
int sock, int thandle, unsigned char **rval, int *bufsiz, const char *fmt, 
...);

int maapi_get_str_elem(
int sock, int thandle, char *buf, int n, const char *fmt, ...);

int maapi_get_binary_elem(
int sock, int thandle, unsigned char **rval, int *bufsiz, const char *fmt, 
...);

int maapi_get_hexstr_elem(
int sock, int thandle, unsigned char **rval, int *bufsiz, const char *fmt, 
...);

int maapi_get_qname_elem(
int sock, int thandle, unsigned char **prefix, int *prefixsz, unsigned char **name, 
int *namesz, const char *fmt, ...);

int maapi_get_list_elem(
int sock, int thandle, confd_value_t **values, int *n, const char *fmt, 
...);

int maapi_get_ipv4prefix_elem(
int sock, int thandle, struct confd_ipv4_prefix *rval, const char *fmt, 
...);

int maapi_get_ipv6prefix_elem(
int sock, int thandle, struct confd_ipv6_prefix *rval, const char *fmt, 
...);

int maapi_get_decimal64_elem(
int sock, int thandle, struct confd_decimal64 *rval, const char *fmt, 
...);

int maapi_get_identityref_elem(
int sock, int thandle, struct confd_identityref *rval, const char *fmt, 
...);

int maapi_get_ipv4_and_plen_elem(
int sock, int thandle, struct confd_ipv4_prefix *rval, const char *fmt, 
...);

int maapi_get_ipv6_and_plen_elem(
int sock, int thandle, struct confd_ipv6_prefix *rval, const char *fmt, 
...);

int maapi_get_dquad_elem(
int sock, int thandle, struct confd_dotted_quad *rval, const char *fmt, 
...);

int maapi_vget_elem(
int sock, int thandle, confd_value_t *v, const char *fmt, va_list args);

int maapi_init_cursor(
int sock, int thandle, struct maapi_cursor *mc, const char *fmt, ...);

int maapi_get_next(
struct maapi_cursor *mc);

int maapi_find_next(
struct maapi_cursor *mc, enum confd_find_next_type type, confd_value_t *inkeys, 
int n_inkeys);

void maapi_destroy_cursor(
struct maapi_cursor *mc);

int maapi_set_elem(
int sock, int thandle, confd_value_t *v, const char *fmt, ...);

int maapi_set_elem2(
int sock, int thandle, const char *strval, const char *fmt, ...);

int maapi_vset_elem(
int sock, int thandle, confd_value_t *v, const char *fmt, va_list args);

int maapi_create(
int sock, int thandle, const char *fmt, ...);

int maapi_delete(
int sock, int thandle, const char *fmt, ...);

int maapi_get_object(
int sock, int thandle, confd_value_t *values, int n, const char *fmt, 
...);

int maapi_get_objects(
struct maapi_cursor *mc, confd_value_t *values, int n, int *nobj);

int maapi_get_values(
int sock, int thandle, confd_tag_value_t *values, int n, const char *fmt, 
...);

int maapi_set_object(
int sock, int thandle, const confd_value_t *values, int n, const char *fmt, 
...);

int maapi_set_values(
int sock, int thandle, const confd_tag_value_t *values, int n, const char *fmt, 
...);

int maapi_get_case(
int sock, int thandle, const char *choice, confd_value_t *rcase, const char *fmt, 
...);

int maapi_get_attrs(
int sock, int thandle, uint32_t *attrs, int num_attrs, confd_attr_value_t **attr_vals, 
int *num_vals, const char *fmt, ...);

int maapi_set_attr(
int sock, int thandle, uint32_t attr, confd_value_t *v, const char *fmt, 
...);

int maapi_delete_all(
int sock, int thandle, enum maapi_delete_how how);

int maapi_revert(
int sock, int thandle);

int maapi_set_flags(
int sock, int thandle, int flags);

int maapi_set_delayed_when(
int sock, int thandle, int on);

int maapi_set_label(
int sock, int thandle, const char *label);

int maapi_set_comment(
int sock, int thandle, const char *comment);

int maapi_copy(
int sock, int from_thandle, int to_thandle);

int maapi_copy_path(
int sock, int from_thandle, int to_thandle, const char *fmt, ...);

int maapi_copy_tree(
int sock, int thandle, const char *from, const char *tofmt, ...);

int maapi_insert(
int sock, int thandle, const char *fmt, ...);

int maapi_move(
int sock, int thandle, confd_value_t* tokey, int n, const char *fmt, ...);

int maapi_move_ordered(
int sock, int thandle, enum maapi_move_where where, confd_value_t* tokey, 
int n, const char *fmt, ...);

int maapi_shared_create(
int sock, int thandle, int flags, const char *fmt, ...);

int maapi_shared_set_elem(
int sock, int thandle, confd_value_t *v, int flags, const char *fmt, ...);

int maapi_shared_set_elem2(
int sock, int thandle, const char *strval, int flags, const char *fmt, 
...);

int maapi_shared_set_values(
int sock, int thandle, const confd_tag_value_t *values, int n, int flags, 
const char *fmt, ...);

int maapi_shared_insert(
int sock, int thandle, int flags, const char *fmt, ...);

int maapi_shared_copy_tree(
int sock, int thandle, int flags, const char *from, const char *tofmt, 
...);

int maapi_ncs_apply_template(
int sock, int thandle, char *template_name, const struct ncs_name_value *variables, 
int num_variables, int flags, const char *rootfmt, ...);

int maapi_shared_ncs_apply_template(
int sock, int thandle, char *template_name, const struct ncs_name_value *variables, 
int num_variables, int flags, const char *rootfmt, ...);

int maapi_ncs_get_templates(
int sock, char ***templates, int *num_templates);

int maapi_ncs_write_service_log_entry(
int sock, const char *msg, confd_value_t *type, confd_value_t *level, 
const char *fmt, ...);

int maapi_report_progress(
int sock, int thandle, enum confd_progress_verbosity verbosity, const char *msg);

int maapi_report_progress2(
int sock, int thandle, enum confd_progress_verbosity verbosity, const char *msg, 
const char *package);

unsigned long long maapi_report_progress_start(
int sock, int thandle, enum confd_progress_verbosity verbosity, const char *msg, 
const char *package);

int maapi_report_progress_stop(
int sock, int thandle, enum confd_progress_verbosity verbosity, const char *msg, 
const char *annotation, const char *package, unsigned long long timestamp);

int maapi_report_service_progress(
int sock, int thandle, enum confd_progress_verbosity verbosity, const char *msg, 
const char *fmt, ...);

int maapi_report_service_progress2(
int sock, int thandle, enum confd_progress_verbosity verbosity, const char *msg, 
const char *package, const char *fmt, ...);

unsigned long long maapi_report_service_progress_start(
int sock, int thandle, enum confd_progress_verbosity verbosity, const char *msg, 
const char *package, const char *fmt, ...);

int maapi_report_service_progress_stop(
int sock, int thandle, enum confd_progress_verbosity verbosity, const char *msg, 
const char *annotation, const char *package, unsigned long long timestamp, 
const char *fmt, ...);

int maapi_start_progress_span(
int sock, confd_progress_span *result, const char *msg, enum confd_progress_verbosity verbosity, 
const struct ncs_name_value *attrs, int num_attrs, const struct confd_progress_link *links, 
int num_links, const char *path_fmt, ...);

int maapi_start_progress_span_th(
int sock, int thandle, confd_progress_span *result, const char *msg, enum confd_progress_verbosity verbosity, 
const struct ncs_name_value *attrs, int num_attrs, const struct confd_progress_link *links, 
int num_links, const char *path_fmt, ...);

int maapi_progress_info(
int sock, const char *msg, enum confd_progress_verbosity verbosity, const struct ncs_name_value *attrs, 
int num_attrs, const struct confd_progress_link *links, int num_links, 
const char *path_fmt, ...);

int maapi_progress_info_th(
int sock, int thandle, const char *msg, enum confd_progress_verbosity verbosity, 
const struct ncs_name_value *attrs, int num_attrs, const struct confd_progress_link *links, 
int num_links, const char *path_fmt, ...);

int maapi_end_progress_span(
int sock, const confd_progress_span *span, const char *annotation);

int maapi_cs_node_children(
int sock, int thandle, struct confd_cs_node *mount_point, struct confd_cs_node ***children, 
int *num_children, const char *fmt, ...);

int maapi_authenticate(
int sock, const char *user, const char *pass, char *groups[], int n);

int maapi_authenticate2(
int sock, const char *user, const char *pass, const struct confd_ip *src_addr, 
int src_port, const char *context, enum confd_proto prot, char *groups[], 
int n);

int maapi_validate_token(
int sock, const char *token, const struct confd_ip *src_addr, int src_port, 
const char *context, enum confd_proto prot, char *groups[], int n);

int maapi_attach(
int sock, int hashed_ns, struct confd_trans_ctx *ctx);

int maapi_attach2(
int sock, int hashed_ns, int usid, int thandle);

int maapi_attach_init(
int sock, int *thandle);

int maapi_detach(
int sock, struct confd_trans_ctx *ctx);

int maapi_detach2(
int sock, int thandle);

int maapi_diff_iterate(
int sock, int thandle, enum maapi_iter_ret (*iter
      kp, enum maapi_iter_op op, 
confd_value_t *oldv, confd_value_t *newv, void *state, int flags, void *initstate);

int maapi_keypath_diff_iterate(
int sock, int thandle, enum maapi_iter_ret (*iter
      kp, enum maapi_iter_op op, 
confd_value_t *oldv, confd_value_t *newv, void *state, int flags, void *initstate, 
const char *fmtpath, ...);

int maapi_diff_iterate_resume(
int sock, enum maapi_iter_ret reply, enum maapi_iter_ret (*iter
      kp, 
enum maapi_iter_op op, confd_value_t *oldv, confd_value_t *newv, void *state, 
void *resumestate);

int maapi_iterate(
int sock, int thandle, enum maapi_iter_ret (*iter
      kp, confd_value_t *v, 
confd_attr_value_t *attr_vals, int num_attr_vals, void *state, int flags, 
void *initstate, const char *fmtpath, ...);

int maapi_iterate_resume(
int sock, enum maapi_iter_ret reply, enum maapi_iter_ret (*iter
      kp, 
confd_value_t *v, confd_attr_value_t *attr_vals, int num_attr_vals, void *state, 
void *resumestate);

struct confd_cs_node *maapi_cs_node_cd(
int sock, int thandle, const char *fmt, ...);

int maapi_get_running_db_status(
int sock);

int maapi_set_running_db_status(
int sock, int status);

int maapi_list_rollbacks(
int sock, struct maapi_rollback *rp, int *rp_size);

int maapi_load_rollback(
int sock, int thandle, int rollback_num);

int maapi_load_rollback_fixed(
int sock, int thandle, int fixed_num);

int maapi_request_action(
int sock, confd_tag_value_t *params, int nparams, confd_tag_value_t **values, 
int *nvalues, int hashed_ns, const char *fmt, ...);

int maapi_request_action_th(
int sock, int thandle, confd_tag_value_t *params, int nparams, confd_tag_value_t **values, 
int *nvalues, const char *fmt, ...);

int maapi_request_action_str_th(
int sock, int thandle, char **output, const char *cmd_fmt, const char *path_fmt, 
...);

int maapi_xpath2kpath(
int sock, const char *xpath, confd_hkeypath_t **hkp);

int maapi_xpath2kpath_th(
int sock, int thandle, const char *xpath, confd_hkeypath_t **hkp);

int maapi_user_message(
int sock, const char *to, const char *message, const char *sender);

int maapi_sys_message(
int sock, const char *to, const char *message);

int maapi_prio_message(
int sock, const char *to, const char *message);

int maapi_cli_diff_cmd(
int sock, int thandle, int thandle_old, char *res, int size, int flags, 
const char *fmt, ...);

int maapi_cli_diff_cmd2(
int sock, int thandle, int thandle_old, char *res, int *size, int flags, 
const char *fmt, ...);

int maapi_cli_accounting(
int sock, const char *user, const int usid, const char *cmdstr);

int maapi_cli_path_cmd(
int sock, int thandle, char *res, int size, int flags, const char *fmt, 
...);

int maapi_cli_cmd_to_path(
int sock, const char *line, char *ns, int nsize, char *path, int psize);

int maapi_cli_cmd_to_path2(
int sock, int thandle, const char *line, char *ns, int nsize, char *path, 
int psize);

int maapi_cli_prompt(
int sock, int usess, const char *prompt, int echo, char *res, int size);

int maapi_cli_prompt2(
int sock, int usess, const char *prompt, int echo, int timeout, char *res, 
int size);

int maapi_cli_prompt_oneof(
int sock, int usess, const char *prompt, char **choice, int count, char *res, 
int size);

int maapi_cli_prompt_oneof2(
int sock, int usess, const char *prompt, char **choice, int count, int timeout, 
char *res, int size);

int maapi_cli_read_eof(
int sock, int usess, int echo, char *res, int size);

int maapi_cli_read_eof2(
int sock, int usess, int echo, int timeout, char *res, int size);

int maapi_cli_write(
int sock, int usess, const char *buf, int size);

int maapi_cli_cmd(
int sock, int usess, const char *buf, int size);

int maapi_cli_cmd2(
int sock, int usess, const char *buf, int size, int flags);

int maapi_cli_cmd3(
int sock, int usess, const char *buf, int size, int flags, const char *unhide, 
int usize);

int maapi_cli_cmd4(
int sock, int usess, const char *buf, int size, int flags, char **unhide, 
int usize);

int maapi_cli_cmd_io(
int sock, int usess, const char *buf, int size, int flags, const char *unhide, 
int usize);

int maapi_cli_cmd_io2(
int sock, int usess, const char *buf, int size, int flags, char **unhide, 
int usize);

int maapi_cli_cmd_io_result(
int sock, int id);

int maapi_cli_printf(
int sock, int usess, const char *fmt);

int maapi_cli_vprintf(
int sock, int usess, const char *fmt, va_list args);

int maapi_cli_set(
int sock, int usess, const char *opt, const char *value);

int maapi_cli_get(
int sock, int usess, const char *opt, char *res, int size);

int maapi_set_readonly_mode(
int sock, int flag);

int maapi_disconnect_remote(
int sock, const char *address);

int maapi_disconnect_sockets(
int sock, int *sockets, int nsocks);

int maapi_save_config(
int sock, int thandle, int flags, const char *fmtpath, ...);

int maapi_save_config_result(
int sock, int id);

int maapi_load_config(
int sock, int thandle, int flags, const char *filename);

int maapi_load_config_cmds(
int sock, int thandle, int flags, const char *cmds, const char *fmt, ...);

int maapi_load_config_stream(
int sock, int thandle, int flags);

int maapi_load_config_stream_result(
int sock, int id);

int maapi_roll_config(
int sock, int thandle, const char *fmtpath, ...);

int maapi_roll_config_result(
int sock, int id);

int maapi_get_stream_progress(
int sock, int id);

int maapi_xpath_eval(
int sock, int thandle, const char *expr, int (*result
      kp, confd_value_t *v, 
void *state, void (*trace, void *initstate, const char *fmtpath, ...);

int maapi_xpath_eval_expr(
int sock, int thandle, const char *expr, char **res, void (*trace, const char *fmtpath, 
...);

int maapi_query_start(
int sock, int thandle, const char *expr, const char *context_node, int chunk_size, 
int initial_offset, enum confd_query_result_type result_as, int nselect, 
const char *select[], int nsort, const char *sort[]);

int maapi_query_startv(
int sock, int thandle, const char *expr, const char *context_node, int chunk_size, 
int initial_offset, enum confd_query_result_type result_as, int select_nparams, 
...);

int maapi_query_result(
int sock, int qh, struct confd_query_result **qrs);

int maapi_query_result_count(
int sock, int qh);

int maapi_query_free_result(
struct confd_query_result *qrs);

int maapi_query_reset_to(
int sock, int qh, int offset);

int maapi_query_reset(
int sock, int qh);

int maapi_query_stop(
int sock, int qh);

int maapi_do_display(
int sock, int thandle, const char *fmtpath, ...);

int maapi_install_crypto_keys(
int sock);

int maapi_init_upgrade(
int sock, int timeoutsecs, int flags);

int maapi_perform_upgrade(
int sock, const char **loadpathdirs, int n);

int maapi_commit_upgrade(
int sock);

int maapi_abort_upgrade(
int sock);

int maapi_aaa_reload(
int sock, int synchronous);

int maapi_aaa_reload_path(
int sock, int synchronous, const char *fmt, ...);

int maapi_snmpa_reload(
int sock, int synchronous);

int maapi_start_phase(
int sock, int phase, int synchronous);

int maapi_wait_start(
int sock, int phase);

int maapi_reload_config(
int sock);

int maapi_reopen_logs(
int sock);

int maapi_stop(
int sock, int synchronous);

int maapi_rebind_listener(
int sock, int listener);

int maapi_clear_opcache(
int sock, const char *fmt, ...);

int maapi_netconf_ssh_call_home(
int sock, confd_value_t *host, int port);

int maapi_netconf_ssh_call_home_opaque(
int sock, confd_value_t *host, const char *opaque, int port);

int maapi_hide_group(
int sock, int thandle, const char *group_name);

int maapi_unhide_group(
int sock, int thandle, const char *group_name);
```

### Library

NCS Library, (`libconfd`, `-lconfd`)

### Description

The `libconfd` shared library is used to connect to the NSO transaction manager. The API described in this man page has several purposes. We can use MAAPI when we wish to implement our own proprietary management agent. We also use MAAPI to attach to already existing NSO transactions, for example when we wish to implement semantic validation of configuration data in C, and also when we wish to implement CLI wizards in C.

### Paths

The majority of the functions described here take as their two last arguments a format string and a variable number of extra arguments as in: `char *` `fmt`, `...``);`

The paths for MAAPI work like paths for CDB (see [confd\_lib\_cdb(3)](section3.md#confd_lib_cdb.paths)) with the exception that the bracket notation '\[n]' is not allowed for MAAPI paths.

All the functions that take a path on this form also have a `va_list` variant, of the same form as `maapi_vget_elem()` and `maapi_vset_elem()`, which are the only ones explicitly documented below. I.e. they have a prefix "maapi\_v" instead of "maapi\_", and take a single va\_list argument instead of a variable number of arguments.

### Functions

All functions return CONFD\_OK (0), CONFD\_ERR (-1) or CONFD\_EOF (-2) unless otherwise stated. Whenever CONFD\_ERR is returned from any API function in confd\_lib\_maapi it is possible to obtain additional information on the error through the symbol `confd_errno`, see the ERRORS section of [confd\_lib\_lib(3)](section3.md#confd_lib_lib).

In the case of CONFD\_EOF it means that the socket to NCS has been closed.

```
int maapi_connect(
int sock, const struct sockaddr* srv, int srv_sz);
```

The application has to connect to NCS before it can interact with NCS.

> **Note**
>
> If this call fails (i.e. does not return CONFD\_OK), the socket descriptor must be closed and a new socket created before the call is re-attempted.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS

```
int maapi_load_schemas(
int sock);
```

This function dynamically loads schema information from the NSO daemon into the library, where it is available to all the library components as described in the [confd\_types(3)](section3.md#confd_types) and [confd\_lib\_lib(3)](section3.md#confd_lib_lib) man pages. See also `confd_load_schemas()` in [confd\_lib\_lib(3)](section3.md#confd_lib_lib).

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS

```
int maapi_load_schemas_list(
int sock, int flags, const uint32_t *nshash, const int *nsflags, int num_ns);
```

A variant of `maapi_load_schemas()` that allows for loading a subset of the schema information from the NSO daemon into the library. This means that the loading can be significantly faster in the case of a system with many large data models, with the drawback that the functions that use the schema information will have limited functionality or not work at all.

The `flags` parameter can be given as `CONFD_LOAD_SCHEMA_HASH` to request that the global mapping between strings and hash values for the data model nodes should be loaded. If `flags` is given as 0, this mapping is not loaded. The mapping is required for use of the functions `confd_hash2str()`, `confd_str2hash()`, `confd_cs_node_cd()`, and `confd_xpath_pp_kpath()`. Additionally, without the mapping, `confd_pp_value()`, `confd_pp_kpath()`, and `confd_pp_kpath_len()`, as well as the trace printouts from the library, will print nodes as "tag\<N>", where N is the hash value, instead of the node name.

The `nshash` parameter is a `num_ns` elements long array of namespace hash values, requesting that schema information should be loaded for the listed namespaces according to the corresponding element of the `nsflags` array (also `num_ns` elements long). For each namespace, either or both of these flags may be given:

`CONFD_LOAD_SCHEMA_NODES`

> This flag requests that the `confd_cs_node` tree (see [confd\_types(3)](section3.md#confd_types)) for the namespace should be loaded. This tree is required for the use of the functions `confd_find_cs_root()`, `confd_find_cs_node()`, `confd_find_cs_node_child()`, `confd_cs_node_cd()`, `confd_register_node_type()`, `confd_get_leaf_list_type()`, and `confd_xpath_pp_kpath()` for the namespace. Additionally, the above functions that print a `confd_hkeypath_t`, as well as the library trace printouts, will attempt to use this tree and the type information (see below) to find the correct string representation for key values - if the tree isn't available, key values will be printed as described for `confd_pp_value()`.

`CONFD_LOAD_SCHEMA_TYPES`

> This flag requests that information about the types defined in the namespace should be loaded. The type information is required for use of the functions `confd_val2str()`, `confd_str2val()`, `confd_find_ns_type()`, `confd_get_leaf_list_type()`, `confd_register_ns_type()`, and `confd_register_node_type()` for the namespace. Additionally the `confd_hkeypath_t`-printing functions and the library trace printouts will also fall back to `confd_pp_value()` as described above if the type information isn't available.
>
> Type definitions may refer to types defined in other namespaces. If the `CONFD_LOAD_SCHEMA_TYPES` flag has been given for a namespace, and the types defined there have such type references to namespaces that are not included in the `nshash` array, the referenced type information will also be loaded, if necessary recursively, until the types have a complete definition.

See also `confd_load_schemas_list()` in [confd\_lib\_lib(3)](section3.md#confd_lib_lib).

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS

```
int maapi_get_schema_file_path(
int sock, char **buf);
```

If shared memory schema support has been enabled via /ncs-config/enable-shared-memory-schema in `ncs.conf`, this function will return the pathname of the file used for the shared memory mapping, which can then be passed to `confd_mmap_schemas()` (see [confd\_lib\_lib(3)](section3.md#confd_lib_lib)). If the call is successful, `buf` is set to point to a dynamically allocated string, which must be freed by the application by means of calling `free(3)`.

If creation of the schema file is in progress when the function is called, the call will block until the creation has completed. If shared memory schema support has not been enabled, or if the creation of the schema file failed, the function returns CONFD\_ERR with `confd_errno` set to CONFD\_ERR\_NOEXISTS.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int maapi_close(
int sock);
```

Effectively a call to `maapi_end_user_session()` and also closes the socket.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION

Even if the call returns an error, the socket will be closed.

### Session Management

```
int maapi_start_user_session(
int sock, const char *username, const char *context, const char **groups, 
int numgroups, const struct confd_ip *src_addr, enum confd_proto prot);
```

Once we have created a MAAPI socket, we must also establish a user session on the socket. It is up to the user of the MAAPI library to authenticate users. The library user can ask NCS to perform the actual authentication through a call to `maapi_authenticate()` but authentication may very well occur through some other external means.

Thus, when we use this function to create a user session, we must provide all relevant information about the user. If we wish to execute read/write transactions over the MAAPI interface, we must first have an established user session.

A user session corresponds to a NETCONF manager who has just established an authenticated SSH connection, but not yet sent any NETCONF commands on the SSH connection.

The `struct confd_ip` is defined in `confd_lib.h` and must be properly populated before the call. For example:

```
struct confd_ip ip;
ip.af = AF_INET;
inet_aton("10.0.0.33", &ip.ip.v4);
```

The `context` parameter can be any string. The string provided here is precisely the context string which will be used to authorize all data access through the AAA system. Each AAA rule has a context string which must match in order for a AAA rule to match. (See the AAA chapter in the User Guide.)

Using the string "system" for `context` has special significance:

* The session is exempt from all maxSessions limits in confd.conf.
* There will be no authorization checks done by the AAA system.
* The session is not logged in the audit log.
* The session is not shown in 'show users' in CLI etc.
* The session may be started already in NCS start phase 0. (However read-write transactions can not be started until phase 1, i.e. transactions started in phase 0 must use parameter `readwrite` == `CONFD_READ`).

Thus this can be useful e.g. when we need to create the user session for an "internal" transaction done by an application, without relation to a session from a northbound agent. Of course the implications of the above need to be carefully considered in each case.

It is not possible to create new user sessions until NSO has reached start phase 2 (See [confd(1)](section1.md#ncs)), with the above exception of a session with the context set to "system".

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_ALREADY\_EXISTS, CONFD\_ERR\_BADSTATE

```
int maapi_start_user_session2(
int sock, const char *username, const char *context, const char **groups, 
int numgroups, const struct confd_ip *src_addr, int src_port, enum confd_proto prot);
```

This function does the same as `maapi_start_user_session()`, but allows for the TCP/UDP source port to be passed to NCS. Calling `maapi_start_user_session()` is equivalent to calling `maapi_start_user_session2()` with `src_port` 0.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_ALREADY\_EXISTS, CONFD\_ERR\_BADSTATE

```
int maapi_start_user_session3(
int sock, const char *username, const char *context, const char **groups, 
int numgroups, const struct confd_ip *src_addr, int src_port, enum confd_proto prot, 
const char *vendor, const char *product, const char *version, const char *client_id);
```

This function does the same as `maapi_start_user_session2()`, but allows additional information about the session to be passed to NCS. Calling `maapi_start_user_session2()` is equivalent to calling `maapi_start_user_session3()` with `vendor`, `product` and `version` set to NULL, and `client_id` set to \_\_MAAPI\_CLIENT\_ID\_\_. The \_\_MAAPI\_CLIENT\_ID\_\_ macro (defined in confd\_maapi.h) will expand to a string representation of \_\_FILE\_\_:\_\_LINE\_\_.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_ALREADY\_EXISTS, CONFD\_ERR\_BADSTATE

```
int maapi_end_user_session(
int sock);
```

Ends our own user session. If the MAAPI socket is closed, the user session is automatically ended.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION

```
int maapi_kill_user_session(
int sock, int usessid);
```

Kill the user session identified by `usessid`.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int maapi_get_user_sessions(
int sock, int res[], int n);
```

Get the usessid for all current user sessions. The `res` array is populated with at most `n` usessids, and the total number of user sessions is returned (i.e. if the return value is larger than `n`, the array was too short to hold all usessids).

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS

```
int maapi_get_user_session(
int sock, int usessid, struct confd_user_info *us);
```

Populate the `confd_user_info` structure with the data for the user session identified by `usessid`.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int maapi_get_my_user_session_id(
int sock);
```

A user session is identified through an integer index, a usessid. This function returns the usessid associated with the MAAPI socket `sock`.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int maapi_set_user_session(
int sock, int usessid);
```

Associate the socket with an already existing user session. This can be used instead of `maapi_start_user_session()` when we really do not want to start a new user session, e.g. if we want to call an action on behalf of a given user session.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int maapi_get_user_session_identification(
int sock, int usessid, struct confd_user_identification *uident);
```

If the flag `CONFD_USESS_FLAG_HAS_IDENTIFICATION` is set in the `flags` field of the `confd_user_info` structure, additional identification information has been provided by the northbound client. This information can then be retrieved into a `confd_user_identification` structure (see `confd_lib.h`) by calling this function. The elements of `confd_user_identification` are either NULL (if the corresponding information was not provided) or point to a string. The strings must be freed by the application by means of calling `free(3)`.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int maapi_get_user_session_opaque(
int sock, int usessid, char **opaque);
```

If the flag `CONFD_USESS_FLAG_HAS_OPAQUE` is set in the `flags` field of the `confd_user_info` structure, "opaque" information has been provided by the northbound client (see the `-O` option in [confd\_cli(1)](section1.md#confd_cli)). The information can then be retrieved by calling this function. If the call is successful, `opaque` is set to point to a dynamically allocated string, which must be freed by the application by means of calling `free(3)`.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int maapi_get_authorization_info(
int sock, int usessid, struct confd_authorization_info **ainfo);
```

This function retrieves authorization info for a user session, i.e. the groups that the user has been assigned to. The `struct confd_authorization_info` is defined as:

```c
struct confd_authorization_info {
    int ngroups;
    char **groups;
};
```

If the call is successful, `ainfo` is set to point to a dynamically allocated structure, which must be freed by the application by means of calling `confd_free_authorization_info()` (see [confd\_lib\_lib(3)](section3.md#confd_lib_lib)) .

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int maapi_set_next_user_session_id(
int sock, int usessid);
```

Set the user session id that will be assigned to the next user session started. The given value is silently forced to be in the range 100 .. 2^31-1. This function can be used to ensure that session ids for user sessions started by northbound agents or via MAAPI are unique across a NCS restart.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS

### Locks

```
int maapi_lock(
int sock, enum confd_dbname name);

int maapi_unlock(
int sock, enum confd_dbname name);
```

These functions can be used to manipulate locks on the 3 different database types. If `maapi_lock()` is called and the database is already locked, CONFD\_ERR is returned, and `confd_errno` will be set to CONFD\_ERR\_LOCKED. If `confd_errno` is CONFD\_ERR\_EXTERNAL it means that a callback has been invoked in an external database to lock/unlock which in its turn returned an error. (See [confd\_lib\_dp(3)](section3.md#confd_lib_dp) for external database callback API)

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_LOCKED, CONFD\_ERR\_EXTERNAL, CONFD\_ERR\_NOSESSION

```
int maapi_is_lock_set(
int sock, enum confd_dbname name);
```

Returns a positive integer being the usid of the current lock owner if the lock is set, and 0 if the lock is not set.

```
int maapi_lock_partial(
int sock, enum confd_dbname name, char *xpaths[], int nxpaths, int *lockid);

int maapi_unlock_partial(
int sock, int lockid);
```

We can also manipulate partial locks on the databases, i.e. locks on a specified set of leafs and/or subtrees. The specification of what to lock is given via the `xpaths` array, which is populated with `nxpaths` pointers to XPath expressions. If the lock succeeds, `maapi_lock_partial()` returns CONFD\_OK, and a lock identifier to use with `maapi_unlock_partial()` is stored in `*lockid`.

If CONFD\_ERR is returned, some values of `confd_errno` are of particular interest:

CONFD\_ERR\_LOCKED

> Some of the requested nodes are already locked.

CONFD\_ERR\_EXTERNAL

> A callback has been invoked in an external database to lock\_partial/unlock\_partial which in its turn returned an error (see [confd\_lib\_dp(3)](section3.md#confd_lib_dp) for external database callback API).

CONFD\_ERR\_NOEXISTS

> The list of XPath expressions evaluated to an empty set of nodes - i.e. there is nothing to lock.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_LOCKED, CONFD\_ERR\_EXTERNAL, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_NOEXISTS

### Candidate Manipulation

All the candidate manipulation functions require that the candidate data store is enabled in `confd.conf` - otherwise they will set `confd_errno` to CONFD\_ERR\_NOEXISTS. If the candidate data store is enabled, `confd_errno` may be set to CONFD\_ERR\_NOEXISTS for other reasons, as described below.

All these functions may also set `confd_errno` to CONFD\_ERR\_EXTERNAL. This value can only be set when the candidate is owned by the external database. When NCS owns the candidate, which is the most common configuration scenario, the candidate manipulation function will never set `confd_errno` to CONFD\_ERR\_EXTERNAL.

```
int maapi_candidate_validate(
int sock);
```

This function validates the candidate. The function should only be used when the candidate is not owned by NCS, i.e. when the candidate is owned by an external database.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_EXTERNAL

```
int maapi_candidate_commit(
int sock);
```

This function copies the candidate to running. It is also used to confirm a previous call to `maapi_candidate_confirmed_commit()`, i.e. to prevent the automatic rollback if a confirmed commit is not confirmed.

If `confd_errno` is CONFD\_ERR\_INUSE it means that some other user session is doing a confirmed commit or has a lock on the database. CONFD\_ERR\_NOEXISTS means that there is an ongoing persistent confirmed commit (see below) - i.e. there is no confirmed commit that this function call can apply to.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_INUSE, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_EXTERNAL

```
int maapi_candidate_confirmed_commit(
int sock, int timeoutsecs);
```

This function also copies the candidate into running. However if a call to `maapi_candidate_commit()` is not done within `timeoutsecs` an automatic rollback will occur. It can also be used to "extend" a confirmed commit that is already in progress, i.e. set a new timeout or add changes.

If `confd_errno` is CONFD\_ERR\_NOEXISTS it means that there is an ongoing persistent confirmed commit (see below).

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_INUSE, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_EXTERNAL

```
int maapi_candidate_abort_commit(
int sock);
```

This function cancels an ongoing confirmed commit.

If `confd_errno` is CONFD\_ERR\_NOEXISTS it means that some other user session initiated the confirmed commit, or that there is an ongoing persistent confirmed commit (see below).

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_EXTERNAL

```
int maapi_candidate_confirmed_commit_persistent(
int sock, int timeoutsecs, const char *persist, const char *persist_id);
```

This function can be used to start or extend a persistent confirmed commit. The `persist` parameter sets the cookie for the persistent confirmed commit, while the `persist_id` gives the cookie for an already ongoing persistent confirmed commit. This gives the following possibilities:

`persist` = "cookie", `persist_id` = NULL

> Start a persistent confirmed commit with the cookie "cookie", or extend an already ongoing non-persistent confirmed commit and turn it into a persistent confirmed commit.

`persist` = "newcookie", `persist_id` = "oldcookie"

> Extend an ongoing persistent confirmed commit that uses the cookie "oldcookie" and change the cookie to "newcookie".

`persist` = NULL, `persist_id` = "cookie"

> Extend an ongoing persistent confirmed commit that uses the cookie "oldcookie" and turn it into a non-persistent confirmed commit.

`persist` = NULL, `persist_id` = NULL

> Does the same as `maapi_candidate_confirmed_commit()`.

Typical usage is to start a persistent confirmed commit with `persist` = "cookie", `persist_id` = NULL, and to extend it with `persist` = "cookie", `persist_id` = "cookie".

If `confd_errno` is CONFD\_ERR\_NOEXISTS it means that there is an ongoing persistent confirmed commit, but `persist_id` didn't give the right cookie for it.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_INUSE, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_EXTERNAL

```
int maapi_candidate_confirmed_commit_info(
int sock, int timeoutsecs, const char *persist, const char *persist_id, 
const char *label, const char *comment);
```

This function does the same as `maapi_candidate_confirmed_commit_persistent()`, but allows for setting the "Label" and/or "Comment" that is stored in the rollback file when the candidate is committed to running. To set only the "Label", give `comment` as NULL, and to set only the "Comment", give `label` as NULL. If both `label` and `comment` are NULL, the function does exactly the same as `maapi_candidate_confirmed_commit_persistent()`.

> **Note**
>
> To ensure that the "Label" and/or "Comment" are stored in the rollback file in all cases when doing a confirmed commit, they must be given both with the confirmed commit (using this function) and with the confirming commit (using `maapi_candidate_commit_info()`).

If `confd_errno` is CONFD\_ERR\_NOEXISTS it means that there is an ongoing persistent confirmed commit, but `persist_id` didn't give the right cookie for it.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_INUSE, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_EXTERNAL

```
int maapi_candidate_commit_persistent(
int sock, const char *persist_id);
```

Confirm an ongoing persistent confirmed commit with the cookie given by `persist_id`. If `persist_id` is NULL, it does the same as `maapi_candidate_commit()`.

If `confd_errno` is CONFD\_ERR\_NOEXISTS it means that there is an ongoing persistent confirmed commit, but `persist_id` didn't give the right cookie for it.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_INUSE, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_EXTERNAL

```
int maapi_candidate_commit_info(
int sock, const char *persist_id, const char *label, const char *comment);
```

This function does the same as `maapi_candidate_commit_persistent()`, but allows for setting the "Label" and/or "Comment" that is stored in the rollback file when the candidate is committed to running. To set only the "Label", give `comment` as NULL, and to set only the "Comment", give `label` as NULL. If both `label` and `comment` are NULL, the function does exactly the same as `maapi_candidate_commit_persistent()`.

> **Note**
>
> To ensure that the "Label" and/or "Comment" are stored in the rollback file in all cases when doing a confirmed commit, they must be given both with the confirmed commit (using `maapi_candidate_confirmed_commit_info()`) and with the confirming commit (using this function).

If `confd_errno` is CONFD\_ERR\_NOEXISTS it means that there is an ongoing persistent confirmed commit, but `persist_id` didn't give the right cookie for it.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_INUSE, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_EXTERNAL

```
int maapi_candidate_abort_commit_persistent(
int sock, const char *persist_id);
```

Cancel an ongoing persistent confirmed commit with the cookie given by `persist_id`. (If `persist_id` is NULL, it does the same as `maapi_candidate_abort_commit()`.)

If `confd_errno` is CONFD\_ERR\_NOEXISTS it means that there is an ongoing persistent confirmed commit, but `persist_id` didn't give the right cookie for it.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_INUSE, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_EXTERNAL

```
int maapi_candidate_reset(
int sock);
```

This function copies running into candidate.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_INUSE, CONFD\_ERR\_EXTERNAL, CONFD\_ERR\_NOSESSION

```
int maapi_confirmed_commit_in_progress(
int sock);
```

Checks whether a confirmed commit is ongoing. Returns a positive integer being the usid of confirmed commit operation in progress or 0 if no confirmed commit is in progress.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS

```
int maapi_copy_running_to_startup(
int sock);
```

This function copies running to startup.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_INUSE, CONFD\_ERR\_EXTERNAL, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_NOEXISTS

```
int maapi_is_running_modified(
int sock);
```

Returns 1 if running has been modified since the last copy to startup, 0 if it has not been modified.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_NOEXISTS

```
int maapi_is_candidate_modified(
int sock);
```

Returns 1 if candidate has been modified, i.e if there are any outstanding non committed changes to the candidate, 0 if no changes are done

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_NOEXISTS

### Transaction Control

```
int maapi_start_trans(
int sock, enum confd_dbname name, enum confd_trans_mode readwrite);
```

The main purpose of MAAPI is to provide read and write access into the NCS transaction manager. Regardless of whether data is kept in CDB or in some (or several) external data bases, the same API is used to access data. ConfD acts as a mediator and multiplexes the different commands to the code which is responsible for each individual data node.

This function creates a new transaction towards the data store specified by `name`, which can be one of `CONFD_CANDIDATE`, `CONFD_OPERATIONAL`, `CONFD_RUNNING`, or `CONFD_STARTUP` (however updating the startup data store is better done via `maapi_copy_running_to_startup()`). The `readwrite` parameter can be either `CONFD_READ`, to start a readonly transaction, or `CONFD_READ_WRITE`, to start a read-write transaction.

A readonly transaction will incur less resource usage, thus if no writes will be done (e.g. the purpose of the transaction is only to read operational data), it is best to use `CONFD_READ`. There are also some cases where starting a read-write transaction is not allowed, e.g. if we start a transaction towards the running data store and /confdConfig/datastores/running/access is set to "writable-through-candidate" in `confd.conf`, or if ConfD is running in HA secondary mode.

If start of the transaction is successful, the function returns a new transaction handle, a non-negative integer `thandle` which must be used as a parameter in all API functions which manipulate the transaction.

We will drive this transaction forward through the different states a ConfD transaction goes through. See the ascii arts in [confd\_lib\_dp(3)](section3.md#confd_lib_dp) for a picture of these states. If an external database is used, and it has registered callback functions for the different transaction states, those callbacks will be called when we in MAAPI invoke the different MAAPI transaction manipulation functions. For example when we call `maapi_start_trans()` the `init()` callback will be invoked in all external databases. (However ConfD may delay the actual invocation of `init()` as an optimization, see [confd\_lib\_dp(3)](section3.md#confd_lib_dp).) If data is kept in CDB, ConfD will handle everything internally.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_TOOMANYTRANS, CONFD\_ERR\_BADSTATE, CONFD\_ERR\_NOT\_WRITABLE

```
int maapi_start_trans2(
int sock, enum confd_dbname name, enum confd_trans_mode readwrite, int usid);
```

If we want to start new transactions inside actions, we can use this function to execute the new transaction within the existing user session. It is equivalent to calling `maapi_set_user_session()` and then `maapi_start_trans()`.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_TOOMANYTRANS, CONFD\_ERR\_BADSTATE, CONFD\_ERR\_NOT\_WRITABLE

```
int maapi_start_trans_flags(
int sock, enum confd_dbname name, enum confd_trans_mode readwrite, int usid, 
int flags);
```

This function makes it possible to set the flags that can otherwise be used with `maapi_set_flags()` already when starting a transaction, as well as setting the `MAAPI_FLAG_HIDE_INACTIVE`, `MAAPI_FLAG_HIDE_ALL_HIDEGROUPS` and `MAAPI_FLAG_DELAYED_WHEN` flags that can only be used with `maapi_start_trans_flags()`. See the description of `maapi_set_flags()` for the available flags. It also incorporates the functionality of `maapi_start_trans()` and `maapi_start_trans2()` with respect to user sessions: If `usid` is 0, the transaction will be started within the user session associated with the MAAPI socket (like `maapi_start_trans()`), otherwise it will be started within the user session given by `usid` (like `maapi_start_trans2()`).

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_TOOMANYTRANS, CONFD\_ERR\_BADSTATE, CONFD\_ERR\_NOT\_WRITABLE

```
int maapi_start_trans_flags2(
int sock, enum confd_dbname dbname, enum confd_trans_mode readwrite, int usid, 
int flags, const char *vendor, const char *product, const char *version, 
const char *client_id);
```

This function does the same as `maapi_start_trans_flags()` but allows additional information about the transaction to be passed to NCS. Calling `maapi_start_trans_flags()` is equivalent to calling `maapi_start_trans_flags2()` with `vendor`, `product` and `version` set to NULL, and `client_id` set to \_\_MAAPI\_CLIENT\_ID\_\_. The \_\_MAAPI\_CLIENT\_ID\_\_ macro (defined in confd\_maapi.h) will expand to a string representation of \_\_FILE\_\_:\_\_LINE\_\_.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_TOOMANYTRANS, CONFD\_ERR\_BADSTATE, CONFD\_ERR\_NOT\_WRITABLE

```
int maapi_start_trans_in_trans(
int sock, enum confd_trans_mode readwrite, int usid, int thandle);
```

This function makes it possible to start a transaction with another transaction as backend, instead of an actual data store. This can be useful if we want to make a set of related changes, and then either apply or discard them all based on some criterion, while other changes remain unaffected. The `thandle` identifies the backend transaction to use. If `usid` is 0, the transaction will be started within the user session associated with the MAAPI socket, otherwise it will be started within the user session given by `usid`. If we call `maapi_apply_trans()` for this "transaction in a transaction", the changes (if any) will be applied to the backend transaction. To discard the changes, call `maapi_finish_trans()` without calling `maapi_apply_trans()` first.

The changes in this transaction can be validated by calling `maapi_validate_trans()` with a non-zero value for `forcevalidation`, but calling `maapi_apply_trans()` will not do any validation - in either case, the resulting configuration will be validated when the backend transaction is committed to the running data store. Note though that unlike the case with a transaction directly towards a data store, no transaction lock is taken on the underlying data store when doing validation of this type of transaction - thus it is possible for the contents of the data store to change (due to commit of another transaction) during the validation.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_TOOMANYTRANS, CONFD\_ERR\_BADSTATE

```
int maapi_finish_trans(
int sock, int thandle);
```

This will finish the transaction. If the transaction is implemented by an external database, this will invoke the `finish()` callback.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_NOEXISTS

The error CONFD\_ERR\_NOEXISTS is set for all API functions which use a `thandle`, the return value from `maapi_start_trans()`, whenever no transaction is started.

```
int maapi_validate_trans(
int sock, int thandle, int unlock, int forcevalidation);
```

This function validates all data written in the transaction. This includes all data model constraints and all defined semantic validation in C, i.e. user programs that have registered functions under validation points.

If this function returns CONFD\_ERR, the transaction is open for further editing. There are two special `confd_errno` values which are of particular interest here.

CONFD\_ERR\_EXTERNAL

> this means that an external validation program in C returns CONFD\_ERR i.e. that the semantic validation failed. The reason for the failure can be found in `confd_lasterr()`

CONFD\_ERR\_VALIDATION\_WARNING

> This means that an external semantic validation program in C returned CONFD\_VALIDATION\_WARN. The string `confd_lasterr()` is organized as a series of NUL terminated strings as in `keypath1, reason1, keypath2, reason2 ...` where the sequence is terminated with an additional NUL

If `unlock` is 1, the transaction is open for further editing even if validation succeeds. If `unlock` is 0 and the function returns CONFD\_OK, the next function to be called MUST be `maapi_prepare_trans()` or `maapi_finish_trans()`.

`unlock` = 1 can be used to implement a 'validate' command which can be given in the middle of an editing session. The first thing that happens is that a lock is set. If `unlock` == 1, the lock is released on success. The lock is always released on failure.

The `forcevalidation` parameter should normally be 0. It has no effect for a transaction towards the running or startup data stores, validation is always performed. For a transaction towards the candidate data store, validation will not be done unless `forcevalidation` is non-zero. Avoiding this validation is preferable if we are going to commit the candidate to running (e.g. with `maapi_candidate_commit()`), since otherwise the validation will be done twice. However if we are implementing a 'validate' command, we should give a non-zero value for `forcevalidation`.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_NOTSET, CONFD\_ERR\_NON\_UNIQUE, CONFD\_ERR\_BAD\_KEYREF, CONFD\_ERR\_TOO\_FEW\_ELEMS, CONFD\_ERR\_TOO\_MANY\_ELEMS, CONFD\_ERR\_UNSET\_CHOICE, CONFD\_ERR\_MUST\_FAILED, CONFD\_ERR\_MISSING\_INSTANCE, CONFD\_ERR\_INVALID\_INSTANCE, CONFD\_ERR\_STALE\_INSTANCE, CONFD\_ERR\_INUSE, CONFD\_ERR\_BADTYPE, CONFD\_ERR\_EXTERNAL, CONFD\_ERR\_BADSTATE

```
int maapi_prepare_trans(
int sock, int thandle);
```

This function must be called as first part of two-phase commit. After this function has been called `maapi_commit_trans()` or `maapi_abort_trans()` must be called.

It will invoke the prepare callback in all participants in the transaction. If all participants reply with CONFD\_OK, the second phase of the two-phase commit procedure is commenced.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_EXTERNAL, CONFD\_ERR\_NOTSET, CONFD\_ERR\_BADSTATE, CONFD\_ERR\_INUSE

```
int maapi_commit_trans(
int sock, int thandle);

int maapi_abort_trans(
int sock, int thandle);
```

Finally at the last stage, either commit or abort must be called. A call to one of these functions must also eventually be followed by a call to `maapi_finish_trans()` which will terminate the transaction.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_EXTERNAL, CONFD\_ERR\_BADSTATE

```
int maapi_apply_trans(
int sock, int thandle, int keepopen);
```

Invoking the above transaction functions in exactly the right order can be a bit complicated. The right order to invoke the functions is `maapi_validate_trans()`, `maapi_prepare_trans()`, `maapi_commit_trans()` (or `maapi_abort_trans()`). Usually we do not require this fine grained control over the two-phase commit protocol. It is easier to use `maapi_apply_trans()` which validates, prepares and eventually commits or aborts.

A call to `maapi_apply_trans()` must also eventually be followed by a call to `maapi_finish_trans()` which will terminate the transaction.

> **Note**
>
> For a readonly transaction, i.e. one started with `readwrite` == `CONFD_READ`, or for a read-write transaction where we haven't actually done any writes, we do not need to call any of the validate/prepare/commit/abort or apply functions, since there is nothing for them to do. Calling `maapi_finish_trans()` to terminate the transaction is sufficient.

The parameter `keepopen` can optionally be set to `1`, then the changes to the transaction are not discarded if validation fails. This feature is typically used by management applications that wish to present the validation errors to an operator and allow the operator to fix the validation errors and then later retry the apply sequence.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_NOTSET, CONFD\_ERR\_NON\_UNIQUE, CONFD\_ERR\_BAD\_KEYREF, CONFD\_ERR\_TOO\_FEW\_ELEMS, CONFD\_ERR\_TOO\_MANY\_ELEMS, CONFD\_ERR\_UNSET\_CHOICE, CONFD\_ERR\_MUST\_FAILED, CONFD\_ERR\_MISSING\_INSTANCE, CONFD\_ERR\_INVALID\_INSTANCE, CONFD\_ERR\_STALE\_INSTANCE, CONFD\_ERR\_INUSE, CONFD\_ERR\_BADTYPE, CONFD\_ERR\_EXTERNAL, CONFD\_ERR\_BADSTATE

```
int maapi_ncs_apply_trans_params(
int sock, int thandle, int keepopen, confd_tag_value_t *params, int nparams, 
confd_tag_value_t **values, int *nvalues);
```

This is the version of `maapi_apply_trans()` for NCS which allows to pass commit parameters in form of _Tagged Value Array_ according to the input parameters for `rpc prepare-transaction` as defined in `tailf-netconf-ncs.yang` module.

The function will populate the `values` array with the result of applying transaction. The result follows the model for the output parameters for `rpc prepare-transaction` (if dry-run was requested) or the output parameters for `rpc commit-transaction` as defined in `tailf-netconf-ncs.yang` module. If the list of result values is empty, then `nvalues` will be 0 and `values` will be NULL.

Just like with `maapi_apply_trans()`, the call to `maapi_ncs_apply_trans_params()` must be followed by the call to `maapi_finish_trans()`. It is also only applicable to read-write transactions.

If any attribute values are returned (`*nvalues` > 0), the caller must free the allocated memory by calling `confd_free_value()` for each of the `confd_value_t` elements, and `free(3)` for the `*values` array itself.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_NOTSET, CONFD\_ERR\_NON\_UNIQUE, CONFD\_ERR\_BAD\_KEYREF, CONFD\_ERR\_TOO\_FEW\_ELEMS, CONFD\_ERR\_TOO\_MANY\_ELEMS, CONFD\_ERR\_UNSET\_CHOICE, CONFD\_ERR\_MUST\_FAILED, CONFD\_ERR\_MISSING\_INSTANCE, CONFD\_ERR\_INVALID\_INSTANCE, CONFD\_ERR\_STALE\_INSTANCE, CONFD\_ERR\_INUSE, CONFD\_ERR\_BADTYPE, CONFD\_ERR\_EXTERNAL, CONFD\_ERR\_BADSTATE, CONFD\_ERR\_PROTOUSAGE, CONFD\_ERR\_UNAVAILABLE, NCS\_ERR\_CONNECTION\_REFUSED, NCS\_ERR\_SERVICE\_CONFLICT, NCS\_ERR\_CONNECTION\_TIMEOUT, NCS\_ERR\_CONNECTION\_CLOSED, NCS\_ERR\_DEVICE, NCS\_ERR\_TEMPLATE

```
int maapi_ncs_get_trans_params(
int sock, int thandle, confd_tag_value_t **values, int *nvalues);
```

This function will return the current commit parameters for the given transaction. The function will populate the `values` array with the commit parameters in the form of _Tagged Value Array_ according to the input parameters for `rpc prepare-transaction` as defined in the `tailf-netconf-ncs.yang` module.

If any attribute values are returned (`*nvalues` > 0), the caller must free the allocated memory by calling `confd_free_value()` for each of the `confd_value_t` elements, and `free(3)` for the `*values` array itself.

_Errors_: CONFD\_ERR\_NO\_TRANS, CONFD\_ERR\_PROTOUSAGE, CONFD\_ERR\_BADSTATE

```
int maapi_hide_group(
int sock, int thandle, const char *group_name);

int maapi_unhide_group(
int sock, int thandle, const char *group_name);
```

Hide/Unhide all nodes belonging to a hide group in a transaction that was started with flag `MAAPI_FLAG_HIDE_ALL_HIDEGROUPS`.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_PROTOUSAGE, CONFD\_ERR\_NOSESSION

```
int maapi_get_rollback_id(
int sock, int thandle, int *fixed_id);
```

After successfully invoking `maapi_commit_trans()` `maapi_get_rollback_id()` can be used to retrieve the fixed rollback id generated for this commit.

If a rollback id was generated a non-negative rollback id is returned. If rollbacks are disabled or no rollback was created -1 is returned.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION

### Read/Write Functions

```
int maapi_set_namespace(
int sock, int thandle, int hashed_ns);
```

If we want to read or write data where the toplevel element name is not unique, we must indicate which namespace we are going to use. It is possible to change the namespace several times during a transaction.

The `hashed_ns` integer is the integer which is defined for the namespace in the .h file which is generated by the 'confdc' compiler. It is also possible to indicate which namespace to use through the namespace prefix when we read and write data. Thus the path /foo:bar/baz will get us /bar/baz in the namespace with prefix "foo" regardless of what the "set" namespace is. And if there is only one toplevel element called "bar" across all namespaces, we can use /bar/baz without the prefix and without calling `maapi_set_namespace()`.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_NOEXISTS

```
int maapi_cd(
int sock, int thandle, const char *fmt, ...);
```

This function mimics the behavior of the UNIX "cd" command. It changes our working position in the data tree. If we are worried about performance, it is more efficient to invoke `maapi_cd()` to some position in the tree and there perform a series of operations using relative paths than it is to perform the equivalent series of operations using absolute paths. Note that this function can not be used as an existence test.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOEXISTS

```
int maapi_pushd(
int sock, int thandle, const char *fmt, ...);
```

Behaves like `maapi_cd()` with the exception that we can subsequently call `maapi_popd()` and returns to the previous position in the data tree.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOSTACK, CONFD\_ERR\_NOEXISTS

```
int maapi_popd(
int sock, int thandle);
```

Pops the top position of the directory stack and changes directory.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOSTACK, CONFD\_ERR\_NOEXISTS

```
int maapi_getcwd(
int sock, int thandle, size_t strsz, char *curdir);
```

Returns the current position as previously set by `maapi_cd()`, `maapi_pushd()`, or `maapi_popd()` as a string. Note that what is returned is a pretty-printed version of the internal representation of the current position, it will be the shortest unique way to print the path but it might not exactly match the string given to `maapi_cd()`. The buffer in \*curdir will be NULL terminated, and no more characters than strsz-1 will be written to it.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_NOEXISTS

```
int maapi_getcwd2(
int sock, int thandle, size_t *strsz, char *curdir);
```

Same as `maapi_getcwd()` but \*strsz will be updated to full length of the path on success.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_NOEXISTS

```
int maapi_getcwd_kpath(
int sock, int thandle, confd_hkeypath_t **kp);
```

Returns the current position like `maapi_getcwd()`, but as a pointer to a hashed keypath instead of as a string. The hkeypath is dynamically allocated, and may further contain dynamically allocated elements. The caller must free the allocated memory, easiest done by calling `confd_free_hkeypath()`.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_NOEXISTS

```
int maapi_exists(
int sock, int thandle, const char *fmt, ...);
```

Return 1 if the path refers to an existing node in the data tree, 0 if it does not, and CONFD\_ERR if something goes wrong.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_ACCESS\_DENIED

```
int maapi_num_instances(
int sock, int thandle, const char *fmt, ...);
```

Returns the number of entries for a list in the data tree.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_BADPATH, CONFD\_ERR\_UNAVAILABLE, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_ACCESS\_DENIED

```
int maapi_get_elem(
int sock, int thandle, confd_value_t *v, const char *fmt, ...);
```

This function reads a value from the path in `fmt` and writes the result into the result parameter `confd_value_t`. The path must lead to a leaf node in the data tree. Note that for the C\_BUF, C\_BINARY, C\_LIST, C\_OBJECTREF, C\_OID, C\_QNAME, C\_HEXSTR, and C\_BITBIG `confd_value_t` types, the buffer(s) pointed to are allocated using malloc(3) - it is up to the user of this interface to free them using `confd_free_value()`.

The maapi interface also contains a long list of access functions that accompany the `maapi_get_elem()` function which is a general access function that returns a `confd_value_t`. The accompanying functions all have the format `maapi_get_<type>_elem()` where \<type> is one of the actual C types a `confd_value_t` can have. For example the function:

```
maapi_get_int64_elem(int sock, int thandle, int64_t *rval,
                                const char *fmt, ...);
```

is used to read a signed 64 bit integer. It fills in the provided `int64_t` parameter. This corresponds to the YANG datatype int64, see [confd\_types(3)](section3.md#confd_types). Similar access functions are provided for all the different builtin types.

One access function that needs additional explaining is the `maapi_get_str_elem()`. This function copies at most `n-1` characters into a user provided buffer, and terminates the string with a NUL character. If the buffer is not sufficiently large CONFD\_ERR is returned, and `confd_errno` is set to CONFD\_ERR\_PROTOUSAGE. Note it is always possible to use maapi\_get\_elem() to get hold of the `confd_value_t`, which in the case of a string buffer contains the length.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_ACCESS\_DENIED, CONFD\_ERR\_PROTOUSAGE, CONFD\_ERR\_BADTYPE

```
int maapi_get_int8_elem(
int sock, int thandle, int8_t *rval, const char *fmt, ...);

int maapi_get_int16_elem(
int sock, int thandle, int16_t *rval, const char *fmt, ...);

int maapi_get_int32_elem(
int sock, int thandle, int32_t *rval, const char *fmt, ...);

int maapi_get_int64_elem(
int sock, int thandle, int64_t *rval, const char *fmt, ...);

int maapi_get_u_int8_elem(
int sock, int thandle, uint8_t *rval, const char *fmt, ...);

int maapi_get_u_int16_elem(
int sock, int thandle, uint16_t *rval, const char *fmt, ...);

int maapi_get_u_int32_elem(
int sock, int thandle, uint32_t *rval, const char *fmt, ...);

int maapi_get_u_int64_elem(
int sock, int thandle, uint64_t *rval, const char *fmt, ...);

int maapi_get_ipv4_elem(
int sock, int thandle, struct in_addr *rval, const char *fmt, ...);

int maapi_get_ipv6_elem(
int sock, int thandle, struct in6_addr *rval, const char *fmt, ...);

int maapi_get_double_elem(
int sock, int thandle, double *rval, const char *fmt, ...);

int maapi_get_bool_elem(
int sock, int thandle, int *rval, const char *fmt, ...);

int maapi_get_datetime_elem(
int sock, int thandle, struct confd_datetime *rval, const char *fmt, ...);

int maapi_get_date_elem(
int sock, int thandle, struct confd_date *rval, const char *fmt, ...);

int maapi_get_gyearmonth_elem(
int sock, int thandle, struct confd_gYearMonth *rval, const char *fmt, 
...);

int maapi_get_gyear_elem(
int sock, int thandle, struct confd_gYear *rval, const char *fmt, ...);

int maapi_get_time_elem(
int sock, int thandle, struct confd_time *rval, const char *fmt, ...);

int maapi_get_gday_elem(
int sock, int thandle, struct confd_gDay *rval, const char *fmt, ...);

int maapi_get_gmonthday_elem(
int sock, int thandle, struct confd_gMonthDay *rval, const char *fmt, 
...);

int maapi_get_month_elem(
int sock, int thandle, struct confd_gMonth *rval, const char *fmt, ...);

int maapi_get_duration_elem(
int sock, int thandle, struct confd_duration *rval, const char *fmt, ...);

int maapi_get_enum_value_elem(
int sock, int thandle, int32_t *rval, const char *fmt, ...);

int maapi_get_bit32_elem(
int sock, int th, int32_t *rval, const char *fmt, ...);

int maapi_get_bit64_elem(
int sock, int th, int64_t *rval, const char *fmt, ...);

int maapi_get_oid_elem(
int sock, int th, struct confd_snmp_oid **rval, const char *fmt, ...);

int maapi_get_buf_elem(
int sock, int thandle, unsigned char **rval, int *bufsiz, const char *fmt, 
...);

int maapi_get_str_elem(
int sock, int th, char *buf, int n, const char *fmt, ...);

int maapi_get_binary_elem(
int sock, int thandle, unsigned char **rval, int *bufsiz, const char *fmt, 
...);

int maapi_get_qname_elem(
int sock, int thandle, unsigned char **prefix, int *prefixsz, unsigned char **name, 
int *namesz, const char *fmt, ...);

int maapi_get_list_elem(
int sock, int th, confd_value_t **values, int *n, const char *fmt, ...);

int maapi_get_ipv4prefix_elem(
int sock, int thandle, struct confd_ipv4_prefix *rval, const char *fmt, 
...);

int maapi_get_ipv6prefix_elem(
int sock, int thandle, struct confd_ipv6_prefix *rval, const char *fmt, 
...);
```

Similar to the CDB API, MAAPI also includes typesafe variants for all the builtin types. See [confd\_types(3)](section3.md#confd_types).

```
int maapi_vget_elem(
int sock, int thandle, confd_value_t *v, const char *fmt, va_list args);
```

This function does the same as `maapi_get_elem()`, but takes a single `va_list` argument instead of a variable number of arguments - i.e. similar to `vprintf()`. Corresponding `va_list` variants exist for all the functions that take a path as a variable number of arguments.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_ACCESS\_DENIED, CONFD\_ERR\_PROTOUSAGE, CONFD\_ERR\_BADTYPE

```
int maapi_init_cursor(
int sock, int thandle, struct maapi_cursor *mc, const char *fmt, ...);
```

Whenever we wish to iterate over the entries in a list in the data tree, we must first initialize a cursor. The cursor is subsequently used in a while loop.

For example if we have:

```
container servers {
  list server {
    key name;
    max-elements 64;
    leaf name {
      type string;
    }
    leaf ip {
      type inet:ip-address;
    }
    leaf port {
      type inet:port-number;
      mandatory true;
    }
  }
}
```

We can have the following C code which iterates over all server entries.

```
struct maapi_cursor mc;

maapi_init_cursor(sock, th, &mc, "/servers/server");
maapi_get_next(&mc);
while (mc.n != 0) {
   ... do something
   maapi_get_next(&mc);
}
maapi_destroy_cursor(&mc);
```

When a `tailf:secondary-index` statement is used in the data model (see [tailf\_yang\_extensions(5)](section5.md#tailf_yang_extensions)), we can set the `secondary_index` element of the `struct maapi_cursor` to indicate the name of a chosen secondary index - this must be done after the call to `maapi_init_cursor()` (which sets `secondary_index` to NULL) and before any call to `maapi_get_next()`, `maapi_get_objects()` or `maapi_find_next()`. In this case, `secondary_index` must point to a NUL-terminated string that is valid throughout the iteration.

> **Note**
>
> ConfD will not sort the uncommitted rows. In this particular case, setting the `secondary_index` element will not work.

The list can be filtered by setting the `xpath_expr` field of the `struct maapi_cursor` to an XPath expression - this must be done after the call to `maapi_init_cursor()` (which sets `xpath_expr` to NULL) and before any call to `maapi_get_next()` or `maapi_get_objects()`. The XPath expression is evaluated for each list entry, and if it evaluates to true, the list entry is returned in `maapi_get_next`. For example, we can filter the list above on the port number:

```
mc.xpath_expr = "port < 1024";
```

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_ACCESS\_DENIED

```
int maapi_get_next(
struct maapi_cursor *mc);
```

Iterates and gets the keys for the next entry in a list. The key(s) can be used to retrieve further data. The key(s) are stored as `confd_value_t` structures in an array inside the `struct maapi_cursor`. The array of keys will be deallocated by the library.

For example to read the port leaf from an entry in the server list above, we would do:

```
....
maapi_init_cursor(sock, th, &mc, "/servers/server");
maapi_get_next(&mc);
while (mc.n != 0) {
   confd_value_t v;
   maapi_get_elem(sock, th, &v, "/servers/server{%x}/port", &mc.keys[0]);
   ....
   maapi_get_next(&mc);
}
```

The '%\*x' modifier (see the PATHS section in [confd\_lib\_cdb(3)](section3.md#confd_lib_cdb.paths)) is especially useful when working with a maapi cursor. The example above assumes that we know that the /servers/server list has exactly one key. But we can alternatively write `maapi_get_elem(sock, th, &v, "/servers/server{%*x}/port", mc.n, mc.keys);` - which works regardless of the number of keys that the list has.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_ACCESS\_DENIED

```
int maapi_find_next(
struct maapi_cursor *mc, enum confd_find_next_type type, confd_value_t *inkeys, 
int n_inkeys);
```

Update the cursor `mc` with the key(s) for the list entry designated by the `type` and `inkeys` parameters. This function may be used to start a traversal from an arbitrary entry in a list. Keys for subsequent entries may be retrieved with the `maapi_get_next()` function.

The `inkeys` array is populated with `n_inkeys` values that designate the starting point in the list. Normally the array is populated with key values for the list, but if the `secondary_index` element of the cursor has been set, the array must instead be populated with values for the corresponding secondary index-leafs. The `type` can have one of two values:

`CONFD_FIND_NEXT`

> The keys for the first list entry _after_ the one indicated by the `inkeys` array are requested. The `inkeys` array does not have to correspond to an actual existing list entry. Furthermore the number of values provided in the array (`n_inkeys`) may be fewer than the number of keys (or number of index-leafs for a secondary-index) in the data model, possibly even zero. This indicates that only the first `n_inkeys` values are provided, and the remaining ones should be taken to have a value "earlier" than the value for any existing list entry.

`CONFD_FIND_SAME_OR_NEXT`

> If the values in the `inkeys` array completely identify an actual existing list entry, the keys for this entry are requested. Otherwise the same logic as described for `CONFD_FIND_NEXT` is used.

The following example will traverse the server list starting with the first entry (if any) that has a key value that is after "smtp" in the list order:

```
....
confd_value_t inkeys[1];

maapi_init_cursor(sock, th, &mc, "/servers/server");
CONFD_SET_STR(&inkeys[0], "smtp");

maapi_find_next(&mc, CONFD_FIND_NEXT, inkeys, 1);
while (mc.n != 0) {
   confd_value_t v;
   maapi_get_elem(sock, th, &v, "/servers/server{%x}/port", &mc.keys[0]);
   ....
   maapi_get_next(&mc);
}
```

The field `xpath_expr` in the cursor has no effect on `maapi_find_next()`.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_ACCESS\_DENIED

```
void maapi_destroy_cursor(
struct maapi_cursor *mc);
```

Deallocates memory which is associated with the cursor.

```
int maapi_set_elem(
int sock, int thandle, confd_value_t *v, const char *fmt, ...);

int maapi_set_elem2(
int sock, int thandle, const char *strval, const char *fmt, ...);
```

We have two different functions to set values. One where the value is a string and one where the value to set is a `confd_value_t`. The string version is useful when we have implemented a management agent where the user enters values as strings. The version with `confd_value_t` is useful when we are setting values which we have just read.

Another note which might effect users is that if the type we are writing is any of the encrypt or hash types, the `maapi_set_elem2()` will perform the asymmetric conversion of values whereas the `maapi_set_elem()` will not. See [confd\_types(3)](section3.md#confd_types), the types `tailf:md5-digest-string`, `tailf:des3-cbc-encrypted-string`, `tailf:aes-cfb-128-encrypted-string` and `tailf:aes-256-cfb-128-encrypted-string`.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_BADTYPE, CONFD\_ERR\_ACCESS\_DENIED, CONFD\_ERR\_NOT\_WRITABLE, CONFD\_ERR\_INUSE

```
int maapi_vset_elem(
int sock, int thandle, confd_value_t *v, const char *fmt, va_list args);
```

This function does the same as `maapi_set_elem()`, but takes a single `va_list` argument instead of a variable number of arguments - i.e. similar to `vprintf()`. Corresponding `va_list` variants exist for all the functions that take a path as a variable number of arguments.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_BADTYPE, CONFD\_ERR\_ACCESS\_DENIED, CONFD\_ERR\_NOT\_WRITABLE, CONFD\_ERR\_INUSE

```
int maapi_create(
int sock, int thandle, const char *fmt, ...);
```

Create a new list entry, a `presence` container, or a leaf of type `empty` (unless in a `union`, see the C\_EMPTY section in [confd\_types(3)](section3.md#confd_types)) in the data tree. For example: `maapi_create(sock,th,"/servers/server{www}");`

If we are creating a new server entry as above, we must also populate all other data nodes below, which do not have a default value in the data model. Thus we must also do e.g.:

`maapi_set_elem2(sock, th, "80", "/servers/server{www}/port");`

before we try to commit the data.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_BADTYPE, CONFD\_ERR\_ACCESS\_DENIED, CONFD\_ERR\_NOT\_WRITABLE, CONFD\_ERR\_NOTCREATABLE, CONFD\_ERR\_INUSE, CONFD\_ERR\_ALREADY\_EXISTS

```
int maapi_delete(
int sock, int thandle, const char *fmt, ...);
```

Delete an existing list entry, a `presence` container, or an optional leaf and all its children (if any) from the data tree.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_BADTYPE, CONFD\_ERR\_ACCESS\_DENIED, CONFD\_ERR\_NOT\_WRITABLE, CONFD\_ERR\_NOTDELETABLE, CONFD\_ERR\_INUSE

```
int maapi_get_object(
int sock, int thandle, confd_value_t *values, int n, const char *fmt, 
...);
```

This function reads at most `n` values from the list entry or container specified by the path, and places them in the `values` array, which is provided by the caller. The array is populated according to the specification of the Value Array format in the [XML STRUCTURES](section3.md#confd_types.xml_structures) section of the [confd\_types(3)](section3.md#confd_types) manual page.

On success, the function returns the actual number of elements needed. I.e. if the return value is bigger than `n`, only the values for the first `n` elements are in the array, and the remaining values have been discarded. Note that given the specification of the array contents, there is always a fixed upper bound on the number of actual elements, and if there are no `presence` sub-containers, the number is constant. See the description of `cdb_get_object()` in [confd\_lib\_cdb(3)](section3.md#confd_lib_cdb) for usage examples - they apply to `maapi_get_object()` as well.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_ACCESS\_DENIED

```
int maapi_get_objects(
struct maapi_cursor *mc, confd_value_t *values, int n, int *nobj);
```

Similar to `maapi_get_object()`, but reads multiple list entries based on a `struct maapi_cursor`. At most `n` values from each of at most `*nobj` list entries, starting at the entry after the one given by `*mc`, are read and placed in the `values` array. The cursor must have been initialized with `maapi_init_cursor()` at some point before the call, but in principle it is possible to mix calls to `maapi_get_next()` and `maapi_get_objects()` using the same cursor.

The array must be at least `n * *nobj` elements long, and the values for entry `i` start at element `array[i * n]` (i.e. the first entry read starts at `array[0]`, the second at `array[n]`, and so on). On success, the highest actual number of values in any of the entries read is returned. If we attempt to read more entries than actually exist (i.e. if there are less than `*nobj` entries after the entry indicated by `*mc`), `*nobj` is updated with the actual number (possibly 0) of entries read. In this case the `n` element of the cursor is set to 0 as for `maapi_get_next()`. Example - read the data for all entries in the "server" list above, in chunks of 10:

```
#define VALUES_PER_ENTRY 3
#define ENTRIES_PER_REQUEST 10

struct maapi_cursor mc;
confd_value_t v[ENTRIES_PER_REQUEST*VALUES_PER_ENTRY];
int nobj, ret, i;

maapi_init_cursor(sock, th, &mc, "/servers/server");
do {
    nobj = ENTRIES_PER_REQUEST;
    ret = maapi_get_objects(&mc, v, VALUES_PER_ENTRY, &nobj);
    if (ret >= 0) {
        for (i = 0; i < nobj; i++) {
            ... process entry starting at v[i*VALUES_PER_ENTRY] ...
        }
    } else {
        ... handle error ...
    }
} while (ret >= 0 && mc.n != 0);
maapi_destroy_cursor(&mc);
```

See also the description of `cdb_get_object()` in [confd\_lib\_cdb(3)](section3.md#confd_lib_cdb) for examples on how to use loaded schema information to avoid "hardwiring" constants like VALUES\_PER\_ENTRY above, and the relative position of individual leaf values in the value array.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_BADPATH, CONFD\_ERR\_PROTOUSAGE, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_ACCESS\_DENIED

```
int maapi_get_values(
int sock, int thandle, confd_tag_value_t *values, int n, const char *fmt, 
...);
```

Read an arbitrary set of sub-elements of a container or list entry. The `values` array must be pre-populated with `n` values based on the specification of the _Tagged Value Array_ format in the _XML STRUCTURES_ section of the [confd\_types(3)](section3.md#confd_types) manual page, where the `confd_value_t` value element is given as follows:

* C\_NOEXISTS means that the value should be read from the transaction and stored in the array.
* C\_PTR also means that the value should be read from the transaction, but instead gives the expected type and a pointer to the type-specific variable where the value should be stored. Thus this gives a functionality similar to the type safe `maapi_get_xxx_elem()` functions.
* C\_XMLBEGIN and C\_XMLEND are used as per the specification.
* Keys to select list entries can be given with their values.

> **Note**
>
> When we use C\_PTR, we need to take special care to free any allocated memory. When we use C\_NOEXISTS and the value is stored in the array, we can just use `confd_free_value()` regardless of the type, since the `confd_value_t` has the type information. But with C\_PTR, only the actual value is stored in the pointed-to variable, just as for `maapi_get_buf_elem()`, `maapi_get_binary_elem()`, etc, and we need to free the memory specifically allocated for the types listed in the description of `maapi_get_elem()` above. The details of how to do this are not given for the `maapi_get_xxx_elem()` functions here, but it is the same as for the corresponding `cdb_get_xxx()` functions, see [confd\_lib\_cdb(3)](section3.md#confd_lib_cdb).

All elements have the same position in the array after the call, in order to simplify extraction of the values - this means that optional elements that were requested but didn't exist will have C\_NOEXISTS rather than being omitted from the array. However requesting a list entry that doesn't exist is an error. Note that when using C\_PTR, the only indication of a non-existing value is that the destination variable has not been modified - it's up to the application to set it to some "impossible" value before the call when optional leafs are read.

> **Note**
>
> Selection of a list entry by its "instance integer", which can be done with `cdb_get_values()` by using C\_CDBBEGIN, can _not_ be done with `maapi_get_values()`

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_BADPATH, CONFD\_ERR\_BADTYPE, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_ACCESS\_DENIED

```
int maapi_set_object(
int sock, int thandle, const confd_value_t *values, int n, const char *fmt, 
...);
```

Set all leafs corresponding to the complete contents of a list entry or container, excluding for sub-lists. The `values` array must be populated with `n` values according to the specification of the Value Array format in the [XML STRUCTURES](section3.md#confd_types.xml_structures) section of the [confd\_types(3)](section3.md#confd_types) manual page. Additionally, since operational data cannot be written, array elements corresponding to operational data leafs or containers must have the value C\_NOEXISTS.

If the node specified by the path, or any sub-nodes that are specified as existing, do not exist before this call, they will be created, otherwise the existing values will be updated. Nodes that can be deleted and are specified as not existing in the array, i.e. with value C\_NOEXISTS, will be deleted if they existed before the call.

For a list entry, since the key values must be present in the array, it is not required that the key values are included in the path given by `fmt`. If the key values _are_ included in the path, the key values in the array are ignored.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_BADTYPE, CONFD\_ERR\_ACCESS\_DENIED, CONFD\_ERR\_NOT\_WRITABLE, CONFD\_ERR\_INUSE

```
int maapi_set_values(
int sock, int thandle, const confd_tag_value_t *values, int n, const char *fmt, 
...);
```

Set arbitrary sub-elements of a container or list entry. The `values` array must be populated with `n` values according to the specification of the _Tagged Value Array_ format in the _XML STRUCTURES_ section of the [confd\_types(3)](section3.md#confd_types) manual page.

If the container or list entry itself, or any sub-elements that are specified as existing, do not exist before this call, they will be created, otherwise the existing values will be updated. Both mandatory and optional elements may be omitted from the array, and all omitted elements are left unchanged. To actually delete a non-mandatory leaf or presence container as described for `maapi_set_object()`, it may (as an extension of the format) be specified as C\_NOEXISTS instead of being omitted.

For a list entry, the key values can be specified either in the path or via key elements in the array - if the values are in the path, the key elements can be omitted from the array. For sub-lists present in the array, the key elements must of course always also be present though, immediately following the C\_XMLBEGIN element and in the order defined by the data model. It is also possible to delete a list entry by using a C\_XMLBEGINDEL element, followed by the keys in data model order, followed by a C\_XMLEND element.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_BADTYPE, CONFD\_ERR\_ACCESS\_DENIED, CONFD\_ERR\_NOT\_WRITABLE, CONFD\_ERR\_INUSE

```
int maapi_get_case(
int sock, int thandle, const char *choice, confd_value_t *rcase, const char *fmt, 
...);
```

When we use the YANG `choice` statement in the data model, this function can be used to find the currently selected `case`, avoiding useless `maapi_get_elem()` etc requests for nodes that belong to other cases. The `fmt, ...` arguments give the path to the list entry or container where the choice is defined, and `choice` is the name of the choice. The case value is returned to the `confd_value_t` that `rcase` points to, as type C\_XMLTAG - i.e. we can use the `CONFD_GET_XMLTAG()` macro to retrieve the hashed tag value.

If we have "nested" choices, i.e. multiple levels of `choice` statements without intervening `container` or `list` statements in the data model, the `choice` argument must give a '/'-separated path with alternating choice and case names, from the data node given by the `fmt, ...` arguments to the specific choice that the request pertains to.

For a choice without a `mandatory true` statement where no case is currently selected, the function will fail with CONFD\_ERR\_NOEXISTS if the choice doesn't have a default case. If it has a default case, it will be returned unless the MAAPI\_FLAG\_NO\_DEFAULTS flag is in effect (see `maapi_set_flags()` below) - if the flag is set, the value returned via `rcase` will have type C\_DEFAULT.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_ACCESS\_DENIED

```
int maapi_get_attrs(
int sock, int thandle, uint32_t *attrs, int num_attrs, confd_attr_value_t **attr_vals, 
int *num_vals, const char *fmt, ...);
```

Retrieve attributes for a configuration node. These attributes are currently supported:

```
/* CONFD_ATTR_TAGS: value is C_LIST of C_BUF/C_STR */
#define CONFD_ATTR_TAGS       0x80000000
/* CONFD_ATTR_ANNOTATION: value is C_BUF/C_STR */
#define CONFD_ATTR_ANNOTATION 0x80000001
/* CONFD_ATTR_INACTIVE: value is C_BOOL 1 (i.e. "true") */
#define CONFD_ATTR_INACTIVE   0x00000000
/* CONFD_ATTR_BACKPOINTER: value is C?LIST of C_BUF/C_STR */
#define CONFD_ATTR_BACKPOINTER 0x80000003
/* CONFD_ATTR_ORIGIN: value is C_IDENTITYREF */
#define CONFD_ATTR_ORIGIN 0x80000007
/* CONFD_ATTR_ORIGINAL_VALUE: value is C_BUF/C_STR */
#define CONFD_ATTR_ORIGINAL_VALUE 0x80000005
/* CONFD_ATTR_WHEN: value is C_BUF/C_STR */
#define CONFD_ATTR_WHEN 0x80000004
/* CONFD_ATTR_REFCOUNT: value is C_UINT32 */
#define CONFD_ATTR_REFCOUNT 0x80000002
```

The `attrs` parameter is an array of attributes of length `num_attrs`, specifying the wanted attributes - if `num_attrs` is 0, all attributes are retrieved. If no attributes are found, `*num_vals` is set to 0, otherwise an array of `confd_attr_value_t` elements is allocated and populated, its address stored in `*attr_vals`, and `*num_vals` is set to the number of elements in the array. The `confd_attr_value_t` struct is defined as:

```c
typedef struct confd_attr_value {
    uint32_t attr;
    confd_value_t v;
} confd_attr_value_t;
```

If any attribute values are returned (`*num_vals` > 0), the caller must free the allocated memory by calling `confd_free_value()` for each of the `confd_value_t` elements, and `free(3)` for the `*attr_vals` array itself.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_ACCESS\_DENIED, CONFD\_ERR\_UNAVAILABLE

```
int maapi_set_attr(
int sock, int thandle, uint32_t attr, confd_value_t *v, const char *fmt, 
...);
```

Set an attribute for a configuration node. See `maapi_get_attrs()` above for the supported attributes. To delete an attribute, call the function with a value of type C\_NOEXISTS.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_BADPATH, CONFD\_ERR\_BADTYPE, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_ACCESS\_DENIED, CONFD\_ERR\_UNAVAILABLE

```
int maapi_delete_all(
int sock, int thandle, enum maapi_delete_how how);
```

This function can be used to delete "all" the configuration data within a transaction. The `how` argument specifies the extent of "all":

`MAAPI_DEL_SAFE`

> Delete everything except namespaces that were exported to none (with `tailf:export none`). Toplevel nodes that cannot be deleted due to AAA rules are silently left in place, but descendant nodes will still be deleted if the AAA rules allow it.

`MAAPI_DEL_EXPORTED`

> Delete everything except namespaces that were exported to none (with `tailf:export none`). AAA rules are ignored, i.e. nodes are deleted even if the AAA rules don't allow it.

`MAAPI_DEL_ALL`

> Delete everything. AAA rules are ignored.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_NOEXISTS

```
int maapi_revert(
int sock, int thandle);
```

This function removes all changes done to the transaction.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_NOEXISTS

```
int maapi_set_flags(
int sock, int thandle, int flags);
```

We can modify some aspects of the read/write session by calling this function - these values can be used for the `flags` argument (ORed together if more than one) with this function and/or with `maapi_start_trans_flags()`:

```
#define MAAPI_FLAG_HINT_BULK           (1 << 0)
#define MAAPI_FLAG_NO_DEFAULTS         (1 << 1)
#define MAAPI_FLAG_CONFIG_ONLY         (1 << 2)
/* maapi_start_trans_flags() only */
#define MAAPI_FLAG_HIDE_INACTIVE       (1 << 3)
/* maapi_start_trans_flags() only */
#define MAAPI_FLAG_DELAYED_WHEN        (1 << 6)
/* maapi_start_trans_flags() only */
#define MAAPI_FLAG_HIDE_ALL_HIDEGROUPS (1 << 8)
```

MAAPI\_FLAG\_HINT\_BULK tells the ConfD backplane that we will be reading substantial amounts of data. This has the effect that the `get_object()` and `get_next_object()` callbacks (if available) are used towards external data providers when we call `maapi_get_elem()` etc and `maapi_get_next()`. The `maapi_get_object()` function always operates as if this flag was set.

MAAPI\_FLAG\_NO\_DEFAULTS says that we want to be informed when we read leafs with default values that have not had a value set. This is indicated by the returned value being of type C\_DEFAULT instead of the actual value. The default value for such leafs can be obtained from the `confd_cs_node` tree provided by the library (see [confd\_types(3)](section3.md#confd_types)).

MAAPI\_FLAG\_CONFIG\_ONLY will make the maapi\_get\_xxx() functions return config nodes only - if we attempt to read operational data, it will be treated as if the nodes did not exist. This is mainly useful in conjunction with `maapi_get_object()` and list entries or containers that have both config and operational data (the operational data nodes in the returned array will have the "value" C\_NOEXISTS), but the other functions also obey the flag.

MAAPI\_FLAG\_HIDE\_INACTIVE can only be used with `maapi_start_trans_flags()`, and only when starting a readonly transaction (parameter `readwrite` == `CONFD_READ`). It will hide configuration data that has the `CONFD_ATTR_INACTIVE` attribute set, i.e. it will appear as if that data does not exist.

MAAPI\_FLAG\_DELAYED\_WHEN can also only be used with `maapi_start_trans_flags()`, but regardless of whether the flag is used or not, the "delayed when" mode can subsequently be changed with `maapi_set_delayed_when()`. The flag is only meaningful when starting a read-write transaction (parameter `readwrite` == `CONFD_READ_WRITE`), and will cause "delayed when" mode to be enabled from the beginning of the transaction. See the description of `maapi_set_delayed_when()` for information about the "delayed when" mode.

MAAPI\_FLAG\_HIDE\_ALL\_HIDEGROUPS can only be used with `maapi_start_trans_flags()`. It will hide all nodes with `tailf:hidden` statement.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_NOEXISTS

```
int maapi_set_delayed_when(
int sock, int thandle, int on);
```

This function enables (`on` non-zero) or disables (`on` == 0) the "delayed when" mode of a transaction. When successful, it returns 1 or 0 as indication of whether "delayed when" was enabled or disabled before the call. See also the `MAAPI_FLAG_DELAYED_WHEN` flag for `maapi_start_trans_flags()`.

The YANG `when` statement makes its parent data definition statement conditional. This can be problematic in cases where we don't have control over the order of writing different data nodes. E.g. when loading configuration from a file, the data that will satisfy the `when` condition may occur after the data that the `when` applies to, making it impossible to actually write the latter data into the transaction - since the `when` isn't satisfied, the data nodes effectively do not exist in the schema.

This is addressed by the "delayed when" mode for a transaction. When "delayed when" is enabled, it is possible to write to data nodes even though they are conditional on a `when` that isn't satisfied. It has no effect on reading though - trying to read data that is conditional on an unsatisfied `when` will always result in CONFD\_ERR\_NOEXISTS or equivalent. When disabling "delayed when", any "delayed" `when` statements will take effect immediately - i.e. if the `when` isn't satisfied at that point, the conditional nodes and any data values for them will be deleted. If we don't explicitly disable "delayed when" by calling this function, it will be automatically disabled when the transaction enters the VALIDATE state (e.g. due to call of `maapi_apply_trans()`).

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_NOEXISTS

```
int maapi_set_label(
int sock, int thandle, const char *label);
```

Set the "Label" that is stored in the rollback file when a transaction towards running is committed. Setting the "Label" for transactions via candidate can be done when the candidate is committed to running, by using the `maapi_candidate_commit_info()` function. For a confirmed commit, the "Label" must also be given via the `maapi_candidate_confirmed_commit_info()` function.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_NOEXISTS

```
int maapi_set_comment(
int sock, int thandle, const char *comment);
```

Set the "Comment" that is stored in the rollback file when a transaction towards running is committed. Setting the "Comment" for transactions via candidate can be done when the candidate is committed to running, by using the `maapi_candidate_commit_info()` function. For a confirmed commit, the "Comment" must also be given via the `maapi_candidate_confirmed_commit_info()` function.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_NOEXISTS

### Ncs Specific Functions

The functions in this sections can only be used with NCS, and specifically the maapi\_shared\_xxx() functions must be used for NCS FASTMAP, i.e. in the service `create()` callback. Those functions maintain attributes that are necessary when multiple service instances modify the same data.

```
int maapi_shared_create(
int sock, int thandle, int flags, const char *fmt, ...);
```

FASTMAP version of `maapi_create()`. The `flags` parameter must be given as 0.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_BADTYPE, CONFD\_ERR\_ACCESS\_DENIED, CONFD\_ERR\_NOT\_WRITABLE, CONFD\_ERR\_NOTCREATABLE, CONFD\_ERR\_INUSE

```
int maapi_shared_set_elem(
int sock, int thandle, confd_value_t *v, int flags, const char *fmt, ...);

int maapi_shared_set_elem2(
int sock, int thandle, const char *strval, int flags, const char *fmt, 
...);
```

FASTMAP versions of `maapi_set_elem()` and `maapi_set_elem2()`. The `flags` parameter is currently unused and should be given as 0.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_BADTYPE, CONFD\_ERR\_ACCESS\_DENIED, CONFD\_ERR\_NOT\_WRITABLE, CONFD\_ERR\_INUSE

```
int maapi_shared_insert(
int sock, int thandle, int flags, const char *fmt, ...);
```

FASTMAP version of `maapi_insert()`. The `flags` parameter must be given as 0.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_ACCESS\_DENIED, CONFD\_ERR\_BADTYPE, CONFD\_ERR\_NOT\_WRITABLE, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_NOTDELETABLE

```
int maapi_shared_set_values(
int sock, int thandle, const confd_tag_value_t *values, int n, int flags, 
const char *fmt, ...);
```

FASTMAP version of `maapi_set_values()`. The `flags` parameter must be given as 0.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_BADTYPE, CONFD\_ERR\_ACCESS\_DENIED, CONFD\_ERR\_NOT\_WRITABLE, CONFD\_ERR\_INUSE

```
int maapi_shared_copy_tree(
int sock, int thandle, int flags, const char *from, const char *tofmt, 
...);
```

FASTMAP version of `maapi_copy_tree()`. The `flags` parameter must be given as 0.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_ACCESS\_DENIED, CONFD\_ERR\_NOT\_WRITABLE, CONFD\_ERR\_BADPATH

```
int maapi_ncs_apply_template(
int sock, int thandle, char *template_name, const struct ncs_name_value *variables, 
int num_variables, int flags, const char *rootfmt, ...);
```

Apply a template that has been loaded into NCS. The `template_name` parameter gives the name of the template. The `variables` parameter is an `num_variables` long array of variables and names for substitution into the template. The `struct ncs_name_value` is defined as:

```c
struct ncs_name_value {
    char *name;
    char *value;
};
```

The `flags` parameter is currently unused and should be given as 0.

> **Note**
>
> If this function is called under FASTMAP it will have the same behavior as the corresponding FASTMAP function `maapi_shared_ncs_apply_template()`.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_ACCESS\_DENIED, CONFD\_ERR\_NOT\_WRITABLE, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_XPATH

```
int maapi_shared_ncs_apply_template(
int sock, int thandle, char *template_name, const struct ncs_name_value *variables, 
int num_variables, int flags, const char *rootfmt, ...);
```

FASTMAP version of `maapi_ncs_apply_template()`. Normally the `flags` parameter should be given as 0.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_ACCESS\_DENIED, CONFD\_ERR\_NOT\_WRITABLE, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_XPATH

```
int maapi_ncs_get_templates(
int sock, char ***templates, int *num_templates);
```

Retrieve a list of the templates currently loaded into NCS. On success, a pointer to an array of template names is stored in `templates` and the length of the array is stored in `num_templates`. The library allocates memory for the result, and the caller is responsible for freeing it. This can in all cases be done with code like this:

```
char **templates;
int num_templates, i;

if (maapi_ncs_get_templates(sock, &templates, &num_templates) == CONFD_OK) {
    ...
    for (i = 0; i < num_templates; i++) {
        free(templates[i]);
    }
    if (num_templates > 0) {
        free(templates);
    }
}
```

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS

```
int maapi_cs_node_children(
int sock, int thandle, struct confd_cs_node *mount_point, struct confd_cs_node ***children, 
int *num_children, const char *fmt, ...);
```

Retrieve a list of the children nodes of the node given by `mount_point` that are valid for the path given by `fmt`. The `mount_point` node must be a mount point (i.e. have the flag `CS_NODE_HAS_MOUNT_POINT` set), and the path must lead to a specific instance of this node (including the final keys if `mount_point` is a list node). The `thandle` parameter is optional, i.e. it can be given as `-1` if a transaction is not available.

On success, a pointer to an array of pointers to `struct confd_cs_node` is stored in `children` and the length of the array is stored in `num_children`. The library allocates memory for the array, and the caller is responsible for freeing it by means of a call to `free(3)`.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_BADPATH

```
struct confd_cs_node *maapi_cs_node_cd(
int sock, int thandle, const char *fmt, ...);
```

Does the same thing as `confd_cs_node_cd()` (see [confd\_lib\_lib(3)](section3.md#confd_lib_lib)), but can handle paths that are ambiguous due to traversing a mount point, by sending a request to the NSO daemon. To be used when `confd_cs_node_cd()` returns `NULL` with `confd_errno` set to `CONFD_ERR_NO_MOUNT_ID`.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_BADPATH

### Miscellaneous Functions

```
int maapi_delete_config(
int sock, enum confd_dbname name);
```

This function empties a data store.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_EXTERNAL

```
int maapi_copy(
int sock, int from_thandle, int to_thandle);
```

If we open two transactions from the same user session but towards different data stores, such as one transaction towards startup and one towards running, we can copy all data from one data store to the other with this function. This is a replace operation - any configuration that exists in the transaction given by `to_handle` but not in the one given by `from_handle` will be deleted from the `to_handle` transaction.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_ACCESS\_DENIED, CONFD\_ERR\_NOT\_WRITABLE

```
int maapi_copy_path(
int sock, int from_thandle, int to_thandle, const char *fmt, ...);
```

Similar to `maapi_copy()`, but does a replacing copy only of the subtree rooted at the path given by `fmt` and remaining arguments.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_ACCESS\_DENIED, CONFD\_ERR\_NOT\_WRITABLE

```
int maapi_copy_tree(
int sock, int thandle, const char *from, const char *tofmt, ...);
```

This function copies the entire configuration tree rooted at `from` to `tofmt`. List entries are created accordingly. If the destination already exists, `from` is copied on top of the destination. This function is typically used inside actions where we for example could use `maapi_copy_tree()` to copy a template configuration into a new list entry. The `from` path must be pre-formatted, e.g. using `confd_format_keypath()`, whereas the destination path is formatted by this function.

> **Note**
>
> The data models for the source and destination trees must match - i.e. they must either be identical, or the data model for the source tree must be a proper subset of the data model for the destination tree. This is always fulfilled when copying from one entry to another in a list, or if both source and destination tree have been defined via YANG `uses` statements referencing the same `grouping` definition. If a data model mismatch is detected, e.g. an existing data node in the source tree does not exist in the destination data model, or an existing leaf in the source tree has a value that is incompatible with the type of the leaf in the destination data model, `maapi_copy_tree()` will return CONFD\_ERR with `confd_errno` set to CONFD\_ERR\_BADPATH.
>
> To provide further explanation, a tree is a proper subset of another tree if it has less information than the other. For example, a tree with the leaves a,b,c is a proper subset of a tree with the leaves a,b,c,d,e. It is important to note that it is less information and not different information. Therefore, a tree with different default values than another tree is not a proper subset, or, a tree with an non-presence container can not be a proper subset of a tree with a presence container.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_ACCESS\_DENIED, CONFD\_ERR\_NOT\_WRITABLE, CONFD\_ERR\_BADPATH

```
int maapi_insert(
int sock, int thandle, const char *fmt, ...);
```

This function inserts a new entry in a list that uses the `tailf:indexed-view` statement. The key must be of type integer. If the inserted entry already exists, the existing and subsequent entries will be renumbered as needed, unless renumbering would require an entry to have a key value that is outside the range of the type for the key. In that case, the function returns CONFD\_ERR with `confd_errno` set to CONFD\_ERR\_BADTYPE.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_ACCESS\_DENIED, CONFD\_ERR\_BADTYPE, CONFD\_ERR\_NOT\_WRITABLE, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_NOTDELETABLE

```
int maapi_move(
int sock, int thandle, confd_value_t* tokey, int n, const char *fmt, ...);
```

This function moves an existing list entry, i.e. renames the entry using the `tokey` parameter, which is an array containing `n` keys.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_ACCESS\_DENIED, CONFD\_ERR\_NOT\_WRITABLE, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_NOTMOVABLE, CONFD\_ERR\_ALREADY\_EXISTS

```
int maapi_move_ordered(
int sock, int thandle, enum maapi_move_where where, confd_value_t* tokey, 
int n, const char *fmt, ...);
```

For a list with the YANG `ordered-by user` statement, this function can be used to change the order of entries, by moving one entry to a new position. When new entries in such a list are created with `maapi_create()`, they are always placed last in the list. The path given by `fmt` and the remaining arguments identifies the entry to move, and the new position is given by the `where` argument:

MAAPI\_MOVE\_FIRST

> Move the entry first in the list. The `tokey` and `n` arguments are ignored, and can be given as NULL and 0.

MAAPI\_MOVE\_LAST

> Move the entry last in the list. The `tokey` and `n` arguments are ignored, and can be given as NULL and 0.

MAAPI\_MOVE\_BEFORE

> Move the entry to the position before the entry given by the `tokey` argument, which is an array of key values with length `n`.

MAAPI\_MOVE\_AFTER

> Move the entry to the position after the entry given by the `tokey` argument, which is an array of key values with length `n`.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_ACCESS\_DENIED, CONFD\_ERR\_NOT\_WRITABLE, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_NOTMOVABLE

```
int maapi_authenticate(
int sock, const char *user, const char *pass, char *groups[], int n);
```

If we are implementing a proprietary management agent with MAAPI API, the function `maapi_start_user_session()` requires the application to tell ConfD which groups the user are member of. ConfD itself has the capability to authenticate users. A MAAPI application can use `maapi_authenticate()` to let ConfD authenticate the user, as per the AAA configuration in confd.conf

If the authentication is successful, the function returns `1`, and the `groups[]` array is populated with at most `n-1` NUL-terminated strings containing the group names, followed by a NULL pointer that indicates the end of the group list. The strings are dynamically allocated, and it is up to the caller to free the memory by calling `free(3)` for each string. If the function is used in a context where the group names are not needed, pass `1` for the `n` parameter.

If the authentication fails, the function returns `0`, and `confd_lasterr()` (see [confd\_lib\_lib(3)](section3.md#confd_lib_lib)) will return a message describing the reason for the failure.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION

```
int maapi_authenticate2(
int sock, const char *user, const char *pass, const struct confd_ip *src_addr, 
int src_port, const char *context, enum confd_proto prot, char *groups[], 
int n);
```

This function does the same thing as `maapi_authenticate()`, but allows for passing of the additional parameters `src_addr`, `src_port`, `context`, and `prot`, which otherwise are passed only to `maapi_start_user_session()`/`maapi_start_user_session2()`. These parameters are not used when ConfD performs the authentication, but they will be passed to an external authentication executable (see the if /confdConfig/aaa/externalAuthentication/includeExtra is set to "true" in `confd.conf`, see [confd.conf(5)](section5.md#ncs.conf). They will also be made available to the authentication callback that can be registered by an application (see [confd\_lib\_dp(3)](section3.md#confd_lib_dp.authentication_callback)).

_Errors_: CONFD\_ERR\_PROTOUSAGE, CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION

```
int maapi_attach(
int sock, int hashed_ns, struct confd_trans_ctx *ctx);
```

While ConfD is executing a transaction, we have a number of situations where we wish to invoke user C code which can interact in the transaction. One such situation is when we wish to write semantic validation code which is invoked in the validation phase of a ConfD transaction. This code needs to execute within the context of the executing transaction, it must thus have access to the "shadow" storage where all not-yet-committed data is kept.

This function attaches to a existing transaction.

Another situation where we wish to attach to the executing transaction is when we are using the notifications API and subscribe to notification of type CONFD\_NOTIF\_COMMIT\_DIFF and wish to read the committed diffs from the transaction.

The `hashed_ns` parameter is basically just there to save a call to `maapi_set_namespace()`. We can call `maapi_set_namespace()` any number of times to change from the one we passed to `maapi_attach()`, and we can also give the namespace in prefix form in the path parameter to the read/write functions - see the `maapi_set_namespace()` description.

If we do not want to give a specific namespace when invoking `maapi_attach()`, we can give 0 for the `hashed_ns` parameter (-1 works too but is deprecated). We can still call the read/write functions as long as the toplevel element in the path is unique, but otherwise we must call `maapi_set_namespace()`, or use a prefix in the path.

```
int maapi_attach2(
int sock, int hashed_ns, int usid, int thandle);
```

When we write proprietary CLI commands in C and we wish those CLI commands to be able to use MAAPI to read and write data inside the same transaction the CLI command was invoked in, we do not have an initialized transaction structure available. Then we must use this function. CLI commands get the `usid` passed in UNIX environment variable `CONFD_MAAPI_USID` and the `thandle` passed in environment variable `CONFD_MAAPI_THANDLE`. We also need to use this function when implementing such CLI commands via action `command()` callbacks, see the [confd\_lib\_dp(3)](section3.md#confd_lib_dp) man page. In this case the `usid` is provided via `uinfo->usid` and the `thandle` via `uinfo->actx.thandle`. To use the user session id that is the owner of the transaction, set `usid` to 0. If the namespace does not matter set `hashed_ns` to 0, see `maapi_attach()`.

```
int maapi_attach_init(
int sock, int *thandle);
```

This function is used to attach the MAAPI socket to the special transaction available in phase0 used for CDB initialization and upgrade. The function is also used if we need to modify CDB data during in-service data model upgrade. The transaction handle, which is used in subsequent calls to MAAPI, is filled in by the function upon successful return. See the CDB chapter in the Development Guide.

```
int maapi_detach(
int sock, struct confd_trans_ctx *ctx);
```

Detaches an attached MAAPI socket. This function is typically called in the `stop()` callback in validation code. An attached MAAPI socket will be automatically detached when the ConfD transaction terminates. This function performs an explicit detach.

```
int maapi_detach2(
int sock, int thandle);
```

Detaches an attached MAAPI socket when we do not have an initialized transaction structure available, see `maapi_attach2()` above. This is mainly useful in an action `command()` callback.

```
int maapi_diff_iterate(
int sock, int thandle, enum maapi_iter_ret (*iter
      kp, enum maapi_iter_op op, 
confd_value_t *oldv, confd_value_t *newv, void *state, int flags, void *initstate);
```

This function can be called from an attached MAAPI session. The purpose of the function is to iterate through the transaction diff. It can typically be used in conjunction with the notification API when we subscribe to CONFD\_NOTIF\_COMMIT\_DIFF events. It can also be used inside validation callbacks.

For all diffs in the transaction the supplied callback function `iter()` will be called. The `iter()` callback receives the `confd_hkeypath_t kp` which uniquely identifies which node in the data tree that is affected, the operation, and an optional value. The `op` parameter gives the modification as:

MOP\_CREATED

> The list entry, `presence` container, or leaf of type `empty` (unless in a `union`, see the C\_EMPTY section in [confd\_types(3)](section3.md#confd_types)) given by `kp` has been created.

MOP\_DELETED

> The list entry, `presence` container, or optional leaf given by `kp` has been deleted.

MOP\_MODIFIED

> A descendant of the list entry given by `kp` has been modified.

MOP\_VALUE\_SET

> The value of the leaf given by `kp` has been set to `newv`. If the MAAPI\_FLAG\_NO\_DEFAULTS flag has been set and the default value for the leaf has come into effect, `newv` will be of type C\_DEFAULT instead of giving the default value.

MOP\_MOVED\_AFTER

> The list entry given by `kp`, in an `ordered-by user` list, has been moved. If `newv` is NULL, the entry has been moved first in the list, otherwise it has been moved after the entry given by `newv`. In this case `newv` is a pointer to an array of key values identifying an entry in the list. The array is terminated with an element that has type C\_NOEXISTS.
>
> If a list entry has been created and moved at the same time, the callback is first called with MOP\_CREATED and then with MOP\_MOVED\_AFTER.
>
> If a list entry has been modified and moved at the same time, the callback is first called with MOP\_MODIFIED and then with MOP\_MOVED\_AFTER.

MOP\_ATTR\_SET

> An attribute for the node given by `kp` has been modified (see the description of `maapi_get_attrs()` for the supported attributes). The `iter()` callback will only get this invocation when attributes are enabled in `confd.conf` (/confdConfig/enableAttributes, see [confd.conf(5)](section5.md#ncs.conf)) _and_ the flag `ITER_WANT_ATTR` has been passed to `maapi_diff_iterate()`. The `newv` parameter is a pointer to a 2-element array, where the first element is the attribute represented as a `confd_value_t` of type `C_UINT32` and the second element is the value the attribute was set to. If the attribute has been deleted, the second element is of type `C_NOEXISTS`.

The `oldv` parameter passed to `iter()` is always NULL.

If `iter()` returns ITER\_STOP, no more iteration is done, and CONFD\_OK is returned. If `iter()` returns ITER\_RECURSE iteration continues with all children to the node. If `iter()` returns ITER\_CONTINUE iteration ignores the children to the node (if any), and continues with the node's sibling. If, for some reason, the `iter()` function wants to return control to the caller of `maapi_diff_iterate()` _before_ all the changes have been iterated over it can return ITER\_SUSPEND. The caller then has to call `maapi_diff_iterate_resume()` to continue/finish the iteration.

The `flags` parameter is a bitmask with the following bits:

ITER\_WANT\_ATTR

> Enable `MOP_ATTR_SET` invocations of the `iter()` function.

ITER\_WANT\_P\_CONTAINER

> Invoke `iter()` for modified presence-containers.

The `state` parameter can be used for any user supplied state (i.e. whatever is supplied as `init_state` is passed as `state` to `iter()` in each invocation).

The `iter()` invocations are not subjected to AAA checks, i.e. regardless of which path we have and which context was used to create the MAAPI socket, all changes are provided.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_BADSTATE.

CONFD\_ERR\_BADSTATE is returned when we try to iterate on a transaction which is in the wrong state and not attached.

```
int maapi_keypath_diff_iterate(
int sock, int thandle, enum maapi_iter_ret (*iter
      kp, enum maapi_iter_op op, 
confd_value_t *oldv, confd_value_t *newv, void *state, int flags, void *initstate, 
const char *fmtpath, ...);
```

This function behaves precisely like the `maapi_diff_iterate()` function except that it takes an additional format path argument. This path prunes the diff and only changes below the provided path are considered.

```
int maapi_diff_iterate_resume(
int sock, enum maapi_iter_ret reply, enum maapi_iter_ret (*iter
      kp, 
enum maapi_iter_op op, confd_value_t *oldv, confd_value_t *newv, void *state, 
void *resumestate);
```

The application _must_ call this function to finish up the iteration whenever an iterator function for `maapi_diff_iterate()` or `maapi_keypath_diff_iterate()` has returned ITER\_SUSPEND. If the application does not wish to continue iteration, it must at least call `maapi_diff_iterate_resume(s, ITER_STOP, NULL, NULL);` to clean up the state. The `reply` parameter is what the iterator function would have returned (i.e. normally ITER\_RECURSE or ITER\_CONTINUE) if it hadn't returned ITER\_SUSPEND. Note that it is up to the iterator function to somehow communicate that it has returned ITER\_SUSPEND to the caller of `maapi_diff_iterate()` or `maapi_keypath_diff_iterate()`, this can for example be a field in a struct for which a pointer can be passed back and forth via the `state`/`resumestate` parameters.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_BADSTATE.

```
int maapi_iterate(
int sock, int thandle, enum maapi_iter_ret (*iter
      kp, confd_value_t *v, 
confd_attr_value_t *attr_vals, int num_attr_vals, void *state, int flags, 
void *initstate, const char *fmtpath, ...);
```

This function can be used to iterate over all the data in a transaction and the underlying data store, as opposed to iterating over only the changes like `maapi_diff_iterate()` and `maapi_keypath_diff_iterate()` do. The `fmtpath` parameter can be used to prune the iteration to cover only the subtree below the given path, similar to `maapi_keypath_diff_iterate()` - if `fmtpath` is given as `"/"`, there will not be any such pruning. Additionally, if the flag `MAAPI_FLAG_CONFIG_ONLY` is in effect (see `maapi_set_flags()`), all operational data subtrees will be excluded from the iteration.

The supplied callback function `iter()` will be called for each node in the data tree included in the iteration. It receives the `kp` parameter which uniquely identifies the node, and if the node is a leaf with a type, also the value of the leaf as the `v` parameter - otherwise `v` is NULL.

The `flags` parameter is a bitmask with the following bits:

ITER\_WANT\_ATTR

> If this flag is given and the node has any attributes set, the `attr_vals` parameter will point to a `num_attr_vals` long array of attributes and values (see `maapi_get_attrs()`), otherwise `attr_vals` is NULL.

The return value from `iter()` has the same effect as for `maapi_diff_iterate()`, except that if ITER\_SUSPEND is returned, the caller then has to call `maapi_iterate_resume()` to continue/finish the iteration.

```
int maapi_iterate_resume(
int sock, enum maapi_iter_ret reply, enum maapi_iter_ret (*iter
      kp, 
confd_value_t *v, confd_attr_value_t *attr_vals, int num_attr_vals, void *state, 
void *resumestate);
```

The application _must_ call this function to finish up the iteration whenever an iterator function for `maapi_iterate()` has returned ITER\_SUSPEND. If the application does not wish to continue iteration, it must at least call `maapi_iterate_resume(s, ITER_STOP, NULL, NULL);` to clean up the state. The `reply` parameter is what the iterator function would have returned (i.e. normally ITER\_RECURSE or ITER\_CONTINUE) if it hadn't returned ITER\_SUSPEND. Note that it is up to the iterator function to somehow communicate that it has returned ITER\_SUSPEND to the caller of `maapi_iterate()`, this can for example be a field in a struct for which a pointer can be passed back and forth via the `state`/`resumestate` parameters.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_BADSTATE.

```
int maapi_get_running_db_status(
int sock);
```

If a transaction fails in the commit() phase, the configuration database is in in a possibly inconsistent state. This function queries ConfD on the consistency state. Returns 1 if the configuration is consistent and 0 otherwise.

```
int maapi_set_running_db_status(
int sock, int status);
```

This function explicitly sets ConfDs notion of the consistency state.

```
int maapi_list_rollbacks(
int sock, struct maapi_rollback *rp, int *rp_size);
```

List at most `*rp_size` number of rollback files. The number of existing rollback files is reported in \*rp\_size as well. The function will populate an array of maapi\_rollback structs.

```
int maapi_load_rollback(
int sock, int thandle, int rollback_num);
```

Install a rollback file.

```
int maapi_load_rollback_fixed(
int sock, int thandle, int fixed_num);
```

Install a rollback file using fixed numbering.

```
int maapi_request_action(
int sock, confd_tag_value_t *params, int nparams, confd_tag_value_t **values, 
int *nvalues, int hashed_ns, const char *fmt, ...);
```

Invoke an action defined in the data model. The `params` and `values` arrays are the parameters for and results from the action, respectively, and use the Tagged Value Array format described in the [XML STRUCTURES](section3.md#confd_types.xml_structures) section of the [confd\_types(3)](section3.md#confd_types) manual page. The library allocates memory for the result values, and the caller is responsible for freeing it. This can in all cases be done with code like this:

```
confd_tag_value_t *values;
int nvalues = 0, i;

if (maapi_request_action(sock, params, nparams,
                         &values, &nvalues, myprefix__ns,
                         "/path/to/action") == CONFD_OK) {
    ...
    for (i = 0; i < nvalues; i++)
        confd_free_value(CONFD_GET_TAG_VALUE(&values[i]));
    if (nvalues > 0)
        free(values);
}
```

However if the value array is known not to include types that require memory allocation (see `maapi_get_elem()` above), only the array itself needs to be freed.

The socket must have an established user session. The path given by `fmt` and the varargs list is the full path to the action, i.e. the final element must be the name of the action in the data model. Since actions are not associated with ConfD transactions, the namespace must be provided and the path must be absolute - but see `maapi_request_action_th()` below.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_BADTYPE, CONFD\_ERR\_ACCESS\_DENIED, CONFD\_ERR\_EXTERNAL

```
int maapi_request_action_th(
int sock, int thandle, confd_tag_value_t *params, int nparams, confd_tag_value_t **values, 
int *nvalues, const char *fmt, ...);
```

Does the same thing as `maapi_request_action()`, but uses the current namespace, the path position, and the user session from the transaction indicated by `thandle`, and makes the transaction handle available to the action() callback, see [confd\_lib\_dp(3)](section3.md#confd_lib_dp) (this is the only relation to the transaction, and the transaction is not affected in any way by the call itself). This function may be convenient in some cases where actions are invoked in conjunction with a transaction, and it must be used if the action needs to access the transaction store.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_BADTYPE, CONFD\_ERR\_ACCESS\_DENIED, CONFD\_ERR\_EXTERNAL

```
int maapi_request_action_str_th(
int sock, int thandle, char **output, const char *cmd_fmt, const char *path_fmt, 
...);
```

Does the same thing as `maapi_request_action_th()`, but takes the parameters as a string and returns the result as a string. The library allocates memory for the result string, and the caller is responsible for freeing it. This can in all cases be done with code like this:

```
char *output = NULL;

if (maapi_request_action_str_th(sock, th, &output,
    "test reverse listint [ 1 2 3 4 ]", "/path/to/action") == CONFD_OK) {
    ...
    free(output);
}
```

The varargs in the end of the function must contain all values listed in both format strings (that is `cmd_fmt` and `path_fmt`) in the same order as they occur in the strings. Here follows an equivalent example which uses the format strings:

```
char *output = NULL;

if (maapi_request_action_str_th(sock, th, &output,
    "test %s [ 1 2 3 %d ]", "%s/action",
    "reverse listint", 4, "/path/to") == CONFD_OK) {
    ...
    free(output);
}
```

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_BADTYPE, CONFD\_ERR\_ACCESS\_DENIED, CONFD\_ERR\_EXTERNAL

```
int maapi_start_progress_span(
int sock, confd_progress_span *result, const char *msg, enum confd_progress_verbosity verbosity, 
const struct ncs_name_value *attrs, int num_attrs, const struct confd_progress_link *links, 
int num_links, const char *path_fmt, ...);
```

Starts a progress span. Progress spans are trace messages written to the progress trace and the developer log. A progress span consists of a start and a stop event which can be used to calculate the duration between the two. Those events can be identified with unique span-ids. Inside the span it is possible to start new spans, which will then become child spans, the parent-span-id is set to the previous spans' span-id. A child span can be used to calculate the duration of a sub task, and is started from consecutive `maapi_start_progress_span()` calls, and is ended with `maapi_end_progress_span()`.

The concepts of traces, trace-id and spans are highly influenced by https://opentelemetry.io/docs/concepts/signals/traces/#spans

If the filters in a configured progress trace matches and the `verbose` is the same as /progress/trace/verbosity or higher then a message `msg` will be written to the trace. Other fields than the message can be set by the following: `attributes` a key-value list of user defined attributes. `links` is a list of already existing trace\_id's and/or span\_id's. `path` is a keypath, e.g. of an action/leaf/service/etc.

If successful `result` when non-NULL are set to span\_id and the trace\_id of the span.

```
confd_progress_span sp1, sp11, sp12;
struct ncs_name_value attrs[] = {
    {"mem", "9001 GB"},
    {"city", "Gnarp"},
    {"sys", "Windows Me"}
};
struct confd_progress_link links[] = {
    {"893786b8-9120-49d5-95a4-f687e77cf013", "903a0b0a4ac9da83"},
    {"99d9b7d3-33dc-4cd7-938f-0c7b0ad94b8e", "655ca8f697871597"}
};
char *ann = NULL;

memset(&sp1, 0, sizeof(sp1));
memset(&sp11, 0, sizeof(sp11));
memset(&sp12, 0, sizeof(sp12));

// root span
maapi_start_progress_span(ms, &sp1,
    "Refresh DNS",
    CONFD_VERBOSITY_NORMAL, attrs, 3, links, 2,
    "/dns/server{2620:119:35::35}/refresh");
printf("got span-id=%s trace-id=%s\n", sp1.span_id, sp1.trace_id);

// child span 1
maapi_start_progress_span(ms, &sp11,
    "Defragmenting hard drive",
    CONFD_VERBOSITY_DEBUG, NULL, 0, NULL, 0, "/");
defrag_hdd();
maapi_end_progress_span(ms, &sp11, NULL);

// child span 2
maapi_start_progress_span(ms, &sp12, "Flush DNS cache",
    CONFD_VERBOSITY_DEBUG, NULL, 0, NULL, 0, "/");
if (flush_cache() == 0) {
    ann = "successful";
} else {
    ann = "failed";
}
maapi_end_progress_span(ms, &sp12, ann);

// info event
maapi_progress_info(ms, "5 servers updated",
    CONFD_VERBOSITY_DEBUG, NULL, 0, NULL, 0, "/");

maapi_end_progress_span(ms, &sp1, NULL);
```

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_BADTYPE, CONFD\_ERR\_EXTERNAL

```
int maapi_start_progress_span_th(
int sock, int thandle, confd_progress_span *result, const char *msg, enum confd_progress_verbosity verbosity, 
const struct ncs_name_value *attrs, int num_attrs, const struct confd_progress_link *links, 
int num_links, const char *path_fmt, ...);
```

Does the same thing as `maapi_start_progress_span()`, but uses the current namespace, and the user session from the transaction indicated by `thandle`

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_BADTYPE, CONFD\_ERR\_EXTERNAL

```
int maapi_progress_info(
int sock, const char *msg, enum confd_progress_verbosity verbosity, const struct ncs_name_value *attrs, 
int num_attrs, const struct confd_progress_link *links, int num_links, 
const char *path_fmt, ...);
```

While spans represents a pair of data points: start and stop; info events are instead singular events, one point in time. Call `maapi_progress_info()` to write a progress span info event to the progress trace. The info event will have the same span-id as the start and stop events of the currently ongoing progress span in the active user session or transaction. See `maapi_start_progress_span()` for more information.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_BADTYPE, CONFD\_ERR\_EXTERNAL

```
int maapi_progress_info_th(
int sock, int thandle, const char *msg, enum confd_progress_verbosity verbosity, 
const struct ncs_name_value *attrs, int num_attrs, const struct confd_progress_link *links, 
int num_links, const char *path_fmt, ...);
```

Does the same thing as `maapi_progress_info()`, but uses the current namespace and the user session from the transaction indicated by `thandle`

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NOEXISTS, CONFD\_ERR\_BADTYPE, CONFD\_ERR\_EXTERNAL

```
int maapi_end_progress_span(
int sock, const confd_progress_span *span, const char *annotation);
```

Ends progress spans started from `maapi_start_progress_span()` or `maapi_start_progress_span_th()`, a call to this function writes the stop event to the progress trace. Ending a parent span implicitly ends the child spans as well.

`annotation` when non-NULL writes a message on the stop event to the progress trace.

If successful, the function returns the timestamp of the stop event.

_Errors_: CONFD\_ERR\_OS, CONFD\_ERR\_NOSESSION

```
int maapi_xpath2kpath(
int sock, const char *xpath, confd_hkeypath_t **hkp);
```

Convert a XPath path to a hashed keypath. The XPath expression must be an "instance identifier", i.e. all elements and keys must be fully specified. Namespace prefixes are optional, unless required to resolve ambiguities (e.g. when multiple namespaces have the same root element).

The conversion will fail with CONFD\_ERR\_NO\_MOUNT\_ID if the provided XPath traverses a mount point.

The returned keypath is dynamically allocated, and may further contain dynamically allocated elements. The caller must free the allocated memory, easiest done by calling `confd_free_hkeypath()`.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADPATH, CONFD\_ERR\_NO\_MOUNT\_ID

```
int maapi_xpath2kpath_th(
int sock, int thandle, const char *xpath, confd_hkeypath_t **hkp);
```

Does the same thing as `maapi_xpath2kpath`, but is capable of traversing mount points using the transaction indicated by `thandle` to read mount point information.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADPATH

```
int maapi_user_message(
int sock, const char *to, const char *message, const char *sender);
```

Send a message to a specific user, a specific user session or all users depending on the `to` parameter. If set to a user name, then `message` will be delivered to all CLI and Web UI sessions by that user. If set to an integer string, eg "10", then `message` will be delivered to that specific user session, CLI or Web UI. If set to "all" then all users will get the `message`.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int maapi_sys_message(
int sock, const char *to, const char *message);
```

Send a message to a specific user, a specific user session or all users depending on the `to` parameter. If set to a user name, then `message` will be delivered to all CLI and Web UI sessions by that user. If set to an integer string, eg "10", then `message` will be delivered to that specific user session, CLI or Web UI. If set to "all" then all users will get the `message`. No formatting of the message is performed as opposed to the user message where a timestamp and sender information is added to the message.

System messages will be buffered until the ongoing command is finished or is terminated by the user. In case of receiving too many system messages during an ongoing command, the corresponding CLI process may choke and slow down throughput which, in turn, causes memory to grow over time. In order to prevent this from happening, buffered messages are limited to 1000 and any incoming messages will be discarded once this limit is exceeded.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int maapi_prio_message(
int sock, const char *to, const char *message);
```

Send a high priority message to a specific user, a specific user session or all users depending on the `to` parameter. If set to a user name, then `message` will be delivered to all CLI and Web UI sessions by that user. If set to an integer string, eg "10", then `message` will be delivered to that specific user session, CLI or Web UI. If set to "all" then all users will get the `message`. No formatting of the message is performed as opposed to the user message where a timestamp and sender information is added to the message.

The message will not be delayed until the user terminates any ongoing command but will be output directly to the terminal without delay. Messages sent using the maapi\_sys\_message and maapi\_user\_message, on the other hand, are not displayed in the middle of some other output but delayed until the any ongoing commands have terminated.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int maapi_cli_prompt(
int sock, int usess, const char *prompt, int echo, char *res, int size);
```

Prompt user for a string. The `echo` parameter is used to control if the input should be echoed or not. If set to CONFD\_ECHO all input will be visible and if set to CONFD\_NOECHO only stars will be shown instead of the actual characters entered by the user. The resulting string will be stored in `res` and it will be NUL terminated.

This function is intended to be called from inside an action callback when invoked from the CLI.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int maapi_cli_prompt2(
int sock, int usess, const char *prompt, int echo, int timeout, char *res, 
int size);
```

This function does the same as `maapi_cli_prompt()`, but also takes a non-negative `timeout` parameter, which controls how long (in seconds) to wait for input before aborting.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_EOF, CONFD\_ERR\_NOEXISTS

```
int maapi_cli_prompt_oneof(
int sock, int usess, const char *prompt, char **choice, int count, char *res, 
int size);
```

Prompt user for one of the strings given in the `choice` parameter. For example:

```
int res;
char buf[BUFSIZ];
char *choice[] = {"yes","no"};

...

res = maapi_cli_prompt_oneof(sock, uinfo->usid,
                             "Do you want to proceed (yes/no): ",
                             choice, 2, buf, BUFSIZ);
```

The user can enter a unique prefix of the choice but the value returned in buf will always be one of the strings provided in the `choice` parameter or an empty string if the user hits the enter key without entering any value. The result string stored in buf is NUL terminated. If the user enters a value not in `choice` he will automatically be re-prompted. For example:

```
Do you want to proceed (yes/no): maybe
The value must be one of: yes,no.
Do you want to proceed (yes/no):
```

This function is intended to be called from inside an action callback when invoked from the CLI.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int maapi_cli_prompt_oneof2(
int sock, int usess, const char *prompt, char **choice, int count, int timeout, 
char *res, int size);
```

This function does the same as `maapi_cli_promt_oneof()`, but also takes a `timeout` parameter. If no activity is seen for `timeout` seconds an error is returned.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int maapi_cli_read_eof(
int sock, int usess, int echo, char *res, int size);
```

Read a multi line string from the CLI. The user has to end the input using ctrl-D. The entered characters will be stored NUL terminated in res. The `echo` parameters controls if the entered characters should be echoed or not. If set to CONFD\_ECHO they will be visible and if set to CONFD\_NOECHO stars will be echoed instead.

This function is intended to be called from inside an action callback when invoked from the CLI.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int maapi_cli_read_eof2(
int sock, int usess, int echo, int timeout, char *res, int size);
```

This function does the same as `maapi_cli_read_eof()`, but also takes a `timeout` parameter, which indicates how long the user may be idle (in seconds) before the reading is aborted.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int maapi_cli_write(
int sock, int usess, const char *buf, int size);
```

Write to the CLI.

This function is intended to be called from inside an action callback when invoked from the CLI.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int maapi_cli_printf(
int sock, int usess, const char *fmt);
```

Write to the CLI using printf formatting. This function is intended to be called from inside an action callback when invoked from the CLI.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int maapi_cli_vprintf(
int sock, int usess, const char *fmt, va_list args);
```

Does the same as `maapi_cli_printf()`, but takes a single `va_list` argument instead of a variable number of arguments, like `vprintf()`.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int maapi_cli_accounting(
int sock, const char *user, const int usid, const char *cmdstr);
```

Generate an audit log entry in the CLI audit log.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int maapi_cli_diff_cmd(
int sock, int thandle, int thandle_old, char *res, int size, int flags, 
const char *fmt, ...);
```

Get the diff between two sessions as C-/I-style CLI commands.

If no changes exist between the two sessions for the given path CONFD\_ERR\_BADPATH will be returned.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int maapi_cli_diff_cmd2(
int sock, int thandle, int thandle_old, char *res, int *size, int flags, 
const char *fmt, ...);
```

Same as `maapi_cli_diff_cmd()` but \*size will be updated to full length of the result on success.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int maapi_cli_path_cmd(
int sock, int thandle, char *res, int size, int flags, const char *fmt, 
...);
```

This function tries to determine which C-/I-style CLI command can be associated with a given path in the data model in context of a given transaction. This is determined by running the formatting code used by the 'show running-config' command for the subtree given by the path, and the looking for text lines associated with the given path. Consequentcly, if the path does not exist in the transaction no output will be generated, or if tailf:cli- annotations have been used to suppress the 'show running-config' text for a path then no such command can be derived.

The `flags` can be given as `MAAPI_FLAG_EMIT_PARENTS` to enable the commands to reach the submode for the path to be emitted.

The `flags` can be given as `MAAPI_FLAG_DELETE` to emit the command to delete the given path.

The `flags` can be given as `MAAPI_FLAG_NON_RECURSIVE` to prevent that all children to a container or list item are displayed.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int maapi_cli_cmd_to_path(
int sock, const char *line, char *ns, int nsize, char *path, int psize);
```

Given a data model path formatted as a C- and I-style command, try to determine the corresponding namespace and path. If the string cannot be interpreted as a path an error message is given indicating that the string is either an operational mode command, a configuration mode command, or just badly formatted. The string is interpreted in the context of the current running configuration, ie all xpath expressions in the data model are evaluated in the context of the running config. Note that the same input may result in a correct answer when invoked with one state of the running config, and an error if the running config has another state due to different list elements being present, or xpath (when and display-when) expressions are being evaluated differently.

This function requires that the socket has an established user session.

The `line` is the NUL terminated string of command tokens to be interpreted.

The `ns` and `path` parameters are used for storing the resulting namespace and path.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int maapi_cli_cmd_to_path2(
int sock, int thandle, const char *line, char *ns, int nsize, char *path, 
int psize);
```

Given a data model path formatted as a C- and I-style command, try to determine the corresponding namespace and path. If the string cannot be interpreted as a path an error message is given indicating that the string is either an operational mode command, a configuration mode command, or just badly formatted. The string is interpreted in the context of the provided transaction handler, ie all xpath expressions in the data model are evaluated in the context of the transaction. Note that the same input may result in a correct answer when invoked with one state of one config, and an error when given another config due to different list elements being present, or xpath (when and display-when) expressions are being evaluated differently.

This function requires that the socket has an established user session.

The `th` is a transaction handler.

The `line` is the NUL terminated string of command tokens to be interpreted.

The `ns` and `path` parameters are used for storing the resulting namespace and path.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int maapi_cli_cmd(
int sock, int usess, const char *buf, int size);
```

Execute CLI command in ongoing CLI session.

This function is intended to be called from inside an action callback when invoked from the CLI.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int maapi_cli_cmd2(
int sock, int usess, const char *buf, int size, int flags);
```

Execute CLI command in ongoing CLI session.

This function is intended to be called from inside an action callback when invoked from the CLI. The flags field is used to disable certain checks during the execution. The value is a bitmask.

MAAPI\_CMD\_NO\_FULLPATH

> Do not perform the fullpath check on show commands.

MAAPI\_CMD\_NO\_HIDDEN

> Allows execution of hidden CLI commands.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int maapi_cli_cmd3(
int sock, int usess, const char *buf, int size, int flags, const char *unhide, 
int usize);
```

Execute CLI command in ongoing CLI session.

This function is intended to be called from inside an action callback when invoked from the CLI. The flags field is used to disable certain checks during the execution. The value is a bitmask.

MAAPI\_CMD\_NO\_FULLPATH

> Do not perform the fullpath check on show commands.

MAAPI\_CMD\_NO\_HIDDEN

> Allows execution of hidden CLI commands.

The unhide parameter is used for passing a hide group which is unhidden during the execution of the command.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int maapi_cli_cmd4(
int sock, int usess, const char *buf, int size, int flags, char **unhide, 
int usize);
```

Execute CLI command in ongoing CLI session.

This function is intended to be called from inside an action callback when invoked from the CLI. The flags field is used to disable certain checks during the execution. The value is a bitmask.

MAAPI\_CMD\_NO\_FULLPATH

> Do not perform the fullpath check on show commands.

MAAPI\_CMD\_NO\_HIDDEN

> Allows execution of hidden CLI commands.

The unhide parameter is used for passing hide groups which are unhidden during the execution of the command.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int maapi_cli_cmd_io(
int sock, int usess, const char *buf, int size, int flags, const char *unhide, 
int usize);
```

Execute CLI command in ongoing CLI session and output result on socket.

This function is intended to be called from inside an action callback when invoked from the CLI. The flags field is used to disable certain checks during the execution. The value is a bitmask.

MAAPI\_CMD\_NO\_FULLPATH

> Do not perform the fullpath check on show commands.

MAAPI\_CMD\_NO\_HIDDEN

> Allows execution of hidden CLI commands.

The unhide parameter is used for passing a hide group which is unhidden during the execution of the command.

The function returns `CONFD_ERR` on error or a positive integer id that can subsequently be used together with `confd_stream_connect()`. ConfD will write all data in a stream on that socket and when done, ConfD will close its end of the socket.

Once the stream socket is connected we can read the output from the cli command data on the socket. We need to continue reading until we receive EOF on the socket. To check if the command was successful we use the function. `maapi_cli_cmd_io_result()`.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int maapi_cli_cmd_io2(
int sock, int usess, const char *buf, int size, int flags, char **unhide, 
int usize);
```

Execute CLI command in ongoing CLI session and output result on socket.

This function is intended to be called from inside an action callback when invoked from the CLI. The flags field is used to disable certain checks during the execution. The value is a bitmask.

MAAPI\_CMD\_NO\_FULLPATH

> Do not perform the fullpath check on show commands.

MAAPI\_CMD\_NO\_HIDDEN

> Allows execution of hidden CLI commands.

The unhide parameter is used for passing hide groups which are unhidden during the execution of the command.

The function returns `CONFD_ERR` on error or a positive integer id that can subsequently be used together with `confd_stream_connect()`. ConfD will write all data in a stream on that socket and when done, ConfD will close its end of the socket.

Once the stream socket is connected we can read the output from the cli command data on the socket. We need to continue reading until we receive EOF on the socket. To check if the command was successful we use the function. `maapi_cli_cmd_io_result()`.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int maapi_cli_cmd_io_result(
int sock, int id);
```

We use this function to read the status of executing a cli command and streaming the result over a socket. The `sock` parameter must be the same maapi socket we used for `maapi_cli_cmd_io()` and the `id` parameter is the `id` returned by `maapi_cli_cmd_io()`.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_ACCESS\_DENIED, CONFD\_ERR\_EXTERNAL

```
int maapi_cli_get(
int sock, int usess, const char *opt, char *res, int size);
```

Read CLI session parameter or attribute.

This function is intended to be called from inside an action callback when invoked from the CLI.

Possible params are complete-on-space, idle-timeout, ignore-leading-space, paginate, "output file", "screen length", "screen width", terminal, history, autowizard, "show defaults", and if enabled, display-level. In addition to this the attributes called annotation, tags and inactive can be read.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int maapi_cli_set(
int sock, int usess, const char *opt, const char *value);
```

Set CLI session parameter.

This function is intended to be called from inside an action callback when invoked from the CLI.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int maapi_set_readonly_mode(
int sock, int flag);
```

There are certain situations where we want to explicitly control if a ConfD instance should be able to handle write operations from the northbound agents. In certain high-availability scenarios we may want to ensure that a node is a true readonly node, i.e. it should not be possible to initiate new write transactions on that node.

It can also be interesting in upgrade scenarios where we are interested in making sure that no configuration changes can occur during some interval.

This function toggles the readonly mode of a ConfD instance. If the `flag` parameter is non-zero, ConfD will be set in readonly mode, if it is zero, ConfD will be taken out of readonly mode. It is also worth to note that when a ConfD HA node is a secondary as instructed by the application, no write transactions can occur regardless of the value of the flag set by this function.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int maapi_disconnect_remote(
int sock, const char *address);
```

Disconnect all remote connections between `CONFD_IPC_PORT` and `address`.

Since ConfD clients, e.g. CDB readers/subscribers, are connected using TCP it is also possible to do this remotely over a network. However since TCP doesn't offer a fast and reliable way of detecting that the other end has disappeared ConfD can get stuck waiting for a reply from such a disconnected client.

In some environments there will be an alternative supervision method that can detect when a remote host is unavailable, and in that situation this function can be used to instruct ConfD to drop all remote connections to a particular host. The address parameter is an IP address as a string, and the socket is a maapi socket obtained using `maapi_connect()`. On success, the function returns the number of connections that were closed.

> **Note**
>
> ConfD will close all its sockets with remote address `address`, _except_ HA connections. For HA use `confd_ha_secondary_dead()` or an HA state transition.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADTYPE, CONFD\_ERR\_UNAVAILABLE

```
int maapi_disconnect_sockets(
int sock, int *sockets, int nsocks);
```

This function is an alternative to `maapi_disconnect_remote()` that can be useful in particular when using the "External IPC" functionality. In this case ConfD does not have any knowledge of the remote address of the IPC connections, and thus `maapi_disconnect_remote()` is not applicable. The `maapi_disconnect_sockets()` instead takes an array of `nsocks` socket file descriptor numbers for the `sockets` parameter.

ConfD will close all connected sockets whose local file descriptor number is included the `sockets` array. The file descriptor numbers can be obtained e.g. via the `lsof(8)` command, or some similar tool in case `lsof` does not support the IPC mechanism that is being used.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADTYPE

```
int maapi_save_config(
int sock, int thandle, int flags, const char *fmtpath, ...);
```

This function can be used to save the entire config (or a subset thereof) in different formats. The `flags` parameter controls the saving as follows. The value is a bitmask.

`MAAPI_CONFIG_XML`

> The configuration format is XML.

`MAAPI_CONFIG_XML_PRETTY`

> The configuration format is pretty printed XML.

`MAAPI_CONFIG_JSON`

> The configuration is in JSON format.

`MAAPI_CONFIG_J`

> The configuration is in curly bracket Juniper CLI format.

`MAAPI_CONFIG_C`

> The configuration is in Cisco XR style format.

`MAAPI_CONFIG_TURBO_C`

> The configuration is in Cisco XR style format. And a faster parser than the normal CLI will be used.

`MAAPI_CONFIG_C_IOS`

> The configuration is in Cisco IOS style format.

`MAAPI_CONFIG_XPATH`

> The `fmtpath` and remaining arguments give an XPath filter instead of a keypath. Can only be used with `MAAPI_CONFIG_XML` and `MAAPI_CONFIG_XML_PRETTY`.

`MAAPI_CONFIG_WITH_DEFAULTS`

> Default values are part of the configuration dump.

`MAAPI_CONFIG_SHOW_DEFAULTS`

> Default values are also shown next to the real configuration value. Applies only to the CLI formats.

`MAAPI_CONFIG_WITH_OPER`

> Include operational data in the dump.

`MAAPI_CONFIG_HIDE_ALL`

> Hide all hidden nodes (see below).

`MAAPI_CONFIG_UNHIDE_ALL`

> Unhide all hidden nodes (see below).

`MAAPI_CONFIG_WITH_SERVICE_META`

> Include NCS service-meta-data attributes (refcounter, backpointer, and original-value) in the dump.

`MAAPI_CONFIG_NO_PARENTS`

> When a path is provided its parent nodes are by default included. With this option the output will begin immediately at path - skipping any parents.

`MAAPI_CONFIG_OPER_ONLY`

> Include _only_ operational data, and ancestors to operational data nodes, in the dump.

`MAAPI_CONFIG_NO_BACKQUOTE`

> This option can only be used together with MAAPI\_CONFIG\_C and MAAPI\_CONFIG\_C\_IOS. When set backslash will not be quoted in strings.

`MAAPI_CONFIG_CDB_ONLY`

> Include only data stored in CDB in the dump. By default only configuration data is included, but the flag can be combined with either `MAAPI_CONFIG_WITH_OPER` or `MAAPI_CONFIG_OPER_ONLY` to save both configuration and operational data, or only operational data, respectively.

`MAAPI_CONFIG_READ_WRITE_ACCESS_ONLY`

> Include only data that the user has read\_write access to in the dump. If using `maapi_save_config()` without this flag, the dump will include data that the user has read access to.

The provided path indicates which part(s) of the configuration to save. By default it is interpreted as a keypath as for other MAAPI functions, and thus identifies the root of a subtree to save. However it is possible to indicate wildcarding of list keys by completely omitting key elements - i.e. this requests save of a subtree for each entry of the corresponding list. For `MAAPI_CONFIG_XML` and `MAAPI_CONFIG_XML_PRETTY` it is alternatively possible to give an XPath filter, by including the flag `MAAPI_CONFIG_XPATH`.

If for example `fmtpath` is "/aaa:aaa/authentication/users" we dump a subtree of the AAA data, while if it is "/aaa:aaa/authentication/users/user/homedir", we dump only the homedir leaf for each user in the AAA data. If `fmtpath` is NULL, the entire configuration is dumped, except that namespaces with restricted export (from `tailf:export`) are treated as follows:

* When the `MAAPI_CONFIG_XML` or `MAAPI_CONFIG_XML_PRETTY` formats are used, the context of the user session that started the transaction is used to select namespaces with restricted export. If the "system" context is used, all namespaces are selected, regardless of export restriction.
* When one of the CLI formats is used, the context used to select namespaces with restricted export is always "cli".

By default, the treatment of nodes with a `tailf:hidden` statement depends on the state of the transaction. For a transaction started via MAAPI, no nodes are hidden, while for a transaction started by another northbound agent (e.g. CLI) and attached to, the nodes that are hidden are the same as in that agent session. The default can be overridden by using one of the flags:

* `MAAPI_FLAG_HIDE_ALL_HIDEGROUPS` use with `maapi_start_trans_flags()`.
* `MAAPI_CONFIG_HIDE_ALL` use with `maapi_save_config()` and `maapi_load_config()`.
* `MAAPI_CONFIG_UNHIDE_ALL` use with `maapi_save_config()` and `maapi_load_config()`.

The function returns `CONFD_ERR` on error or a positive integer id that can subsequently be used together with `confd_stream_connect()`. Thus this function doesn't save the configuration to a file, but rather it returns an integer than is used together with a ConfD stream socket. ConfD will write all data in a stream on that socket and when done, ConfD will close its end of the socket. Thus the following code snippet indicates the usage pattern of this function.

```
int id;
int streamsock;
struct sockaddr_in addr;

id = maapi_save_config(sock, th, flags, path);
if (id < 0) {
    ... handle error ...
}

addr.sin_addr.s_addr = inet_addr("127.0.0.1");
addr.sin_family = AF_INET;
addr.sin_port = htons(CONFD_PORT);

streamsock = socket(PF_INET, SOCK_STREAM, 0);
confd_stream_connect(streamsock, (struct sockaddr*)&addr,
                      sizeof(struct sockaddr_in), id, 0);
```

Once the stream socket is connected we can read the configuration data on the socket. We need to continue reading until we receive EOF on the socket. To check if the configuration retrieval was successful we use the function `maapi_save_config_result()`.

The stream socket must be connected within 10 seconds after the id is received.

> **Note**
>
> The `maapi_save_config()` function can not be used with an attached transaction in a data callback (see [confd\_lib\_dp(3)](section3.md#confd_lib_dp)), since it requires active participation by the transaction manager, which is blocked waiting for the callback to return. However it is possible to use it with a transaction started via `maapi_start_trans_in_trans()` with the attached transaction as backend.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BAD\_TYPE

```
int maapi_save_config_result(
int sock, int id);
```

We use this function to verify that we received the entire configuration over the stream socket. The `sock` parameter must be the same maapi socket we used for `maapi_save_config()` and the `id` parameter is the `id` returned by `maapi_save_config()`.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_ACCESS\_DENIED, CONFD\_ERR\_EXTERNAL

```
int maapi_load_config(
int sock, int thandle, int flags, const char *filename);
```

This function loads a configuration from `filename` into ConfD. The `th` parameter is a transaction handle. This can be either for a transaction created by the application, in which case the application must also apply the transaction, or for an attached transaction (which must not be applied by the application). The format of the file can be either XML, curly bracket Juniper CLI format, Cisco XR style format, or Cisco IOS style format. The caller of the function has to indicate which it is by using one of the `MAAPI_CONFIG_XML`, `MAAPI_CONFIG_J`, `MAAPI_CONFIG_C`, `MAAPI_CONFIG_TURBO_C`, or `MAAPI_CONFIG_C_IOS` flags, with the same meanings as for `maapi_save_config()`. If the name of the file ends in .gz (or .Z) then the file is assumed to be gzipped, and will be uncompressed as it is loaded.

> **Note**
>
> If you use a relative pathname for `filename`, it is taken as relative to the working directory of the ConfD daemon, i.e. the directory where the daemon was started.

By default the complete configuration (as allowed by the user of the current transaction) is deleted before the file is loaded. To merge the contents of the file use the `MAAPI_CONFIG_MERGE` flag. To replace only the part of the configuration that is present in the file, use the `MAAPI_CONFIG_REPLACE` flag.

If the transaction `th` is started against the data store `CONFD_OPERATIONAL` config false data is loaded. The existing config false data is not deleted before the file is loaded. Rather it is the responsibility of the client.

The only supported format for loading 'config false' data is `MAAPI_CONFIG_XML`.

Additional flags for `MAAPI_CONFIG_XML`:

`MAAPI_CONFIG_WITH_OPER`

> Any operational data in the file should be ignored (instead of producing an error).

`MAAPI_CONFIG_XML_LOAD_LAX`

> Lax loading. Ignore unknown namespaces, elements, and attributes.

`MAAPI_CONFIG_OPER_ONLY`

> Load _only_ operational data, and ancestors to operational data nodes.

Additional flag for `MAAPI_CONFIG_C` and `MAAPI_CONFIG_C_IOS`:

`MAAPI_CONFIG_AUTOCOMMIT`

> A commit should be performed after each line. In this case the transaction identified by `th` is not used for the loading.

`MAAPI_CONFIG_NO_BACKQUOTE`

> No special treatment is given go back quotes, ie \ when parsing the commands. This means that certain string values cannot be entered, eg \n, \t, but also that no quoting is needed for backslash.

Additional flags for all CLI formats, i.e. `MAAPI_CONFIG_J`, `MAAPI_CONFIG_C`, and `MAAPI_CONFIG_C_IOS`:

`MAAPI_CONFIG_CONTINUE_ON_ERROR`

> Do not abort the load when an error is encountered.

`MAAPI_CONFIG_SUPPRESS_ERRORS`

> Do not display the long error message but instead a oneline error with the line number.

The other `flags` parameters are the same as for `maapi_save_config()`, however the flags `MAAPI_CONFIG_WITH_SERVICE_META`, `MAAPI_CONFIG_NO_PARENTS`, and `MAAPI_CONFIG_CDB_ONLY` are ignored.

> **Note**
>
> The `maapi_load_config()` function can not be used with an attached transaction in a data callback (see [confd\_lib\_dp(3)](section3.md#confd_lib_dp)), since it requires active participation by the transaction manager, which is blocked waiting for the callback to return. However it is possible to use it with a transaction started via `maapi_start_trans_in_trans()` with the attached transaction as backend, writing the changes to the attached transaction by invoking `maapi_apply_trans()` for the "trans-in-trans".

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADTYPE, CONFD\_ERR\_BADPATH, CONFD\_ERR\_BAD\_CONFIG, CONFD\_ERR\_ACCESS\_DENIED, CONFD\_ERR\_PROTOUSAGE, CONFD\_ERR\_EXTERNAL, CONFD\_ERR\_NOEXISTS

```
int maapi_load_config_cmds(
int sock, int thandle, int flags, const char *cmds, const char *fmt, ...);
```

This function loads a configuration like `maapi_load_config()`, but reads the configuration from the string `cmds` instead of from a file. The `th` and `flags` parameters are the same as for `maapi_load_config()`.

An optional `chroot` path can be given.

> **Note**
>
> The same restriction as for `maapi_load_config()` regarding an attached transaction in a data callback applies also to `maapi_load_config_cmds()`

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADTYPE, CONFD\_ERR\_BADPATH, CONFD\_ERR\_BAD\_CONFIG, CONFD\_ERR\_ACCESS\_DENIED, CONFD\_ERR\_PROTOUSAGE, CONFD\_ERR\_EXTERNAL, CONFD\_ERR\_NOEXISTS

```
int maapi_load_config_stream(
int sock, int thandle, int flags);
```

This function loads a configuration like `maapi_load_config()`, but reads the configuration from a ConfD stream socket instead of from a file. The `th` and `flags` parameters are the same as for `maapi_load_config()`.

The function returns `CONFD_ERR` on error or a positive integer id that can subsequently be used together with `confd_stream_connect()`. ConfD will read all data from the stream socket until it receives EOF. Thus the following code snippet indicates the usage pattern of this function.

```
int id;
int streamsock;
struct sockaddr_in addr;

id = maapi_load_config_stream(sock, th, flags);
if (id < 0) {
    ... handle error ...
}

addr.sin_addr.s_addr = inet_addr("127.0.0.1");
addr.sin_family = AF_INET;
addr.sin_port = htons(CONFD_PORT);

streamsock = socket(PF_INET, SOCK_STREAM, 0);
confd_stream_connect(streamsock, (struct sockaddr*)&addr,
                      sizeof(struct sockaddr_in), id, 0);
```

Once the stream socket is connected we can write the configuration data on the socket. When we have written the complete configuration, we must close the socket, to make ConfD receive EOF. To check if the configuration load was successful we use the function `maapi_load_config_stream_result()`.

The stream socket must be connected within 10 seconds after the id is received.

> **Note**
>
> The same restriction as for `maapi_load_config()` regarding an attached transaction in a data callback applies also to `maapi_load_config_stream()`

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADTYPE, CONFD\_ERR\_PROTOUSAGE, CONFD\_ERR\_EXTERNAL

```
int maapi_load_config_stream_result(
int sock, int id);
```

We use this function to verify that the configuration we wrote on the stream socket was successfully loaded. The `sock` parameter must be the same maapi socket we used for `maapi_load_config_stream()` and the `id` parameter is the `id` returned by `maapi_load_config_stream()`.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADTYPE, CONFD\_ERR\_BADPATH, CONFD\_ERR\_BAD\_CONFIG, CONFD\_ERR\_ACCESS\_DENIED, CONFD\_ERR\_EXTERNAL

```
int maapi_roll_config(
int sock, int thandle, const char *fmtpath, ...);
```

This function can be used to save the equivalent of a rollback file for a given configuration before it is committed (or a subtree thereof) in curly bracket format.

The provided path indicates where we want the configuration to be rooted. It must be a prefix prepended keypath. If `fmtpath` is NULL, a rollback config for the entire configuration is dumped. If for example `fmtpath` is "/aaa:aaa/authentication/users" we create a rollback config for a part of the AAA data. It is not possible to extract non-config data using this function.

The function returns `CONFD_ERR` on error or a positive integer id that can subsequently be used together with `confd_stream_connect()`. Thus this function doesn't save the rollback configuration to a file, but rather it returns an integer that is used together with a ConfD stream socket. ConfD will write all data in a stream on that socket and when done, ConfD will close its end of the socket. Thus the following code snippet indicates the usage pattern of this function.

```
int id;
int streamsock;
struct sockaddr_in addr;

id = maapi_roll_config(sock, tid, path);
addr.sin_addr.s_addr = inet_addr("127.0.0.1");
addr.sin_family = AF_INET;
addr.sin_port = htons(CONFD_PORT);

streamsock = socket(PF_INET, SOCK_STREAM, 0);
confd_stream_connect(streamsock, (struct sockaddr*)&addr,
                      sizeof (struct sockaddr_in), id,0);
```

Once the stream socket is connected we can read the configuration data on the socket. We need to continue reading until we receive EOF on the socket. To check if the configuration retrieval was successful we use the function `maapi_roll_config_result()`.

The stream socket must be connected within 10 seconds after the id is received.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BAD\_TYPE

```
int maapi_roll_config_result(
int sock, int id);
```

We use this function to assert that we received the entire rollback configuration over a stream socket. The `sock` parameter must be the same maapi socket we used for `maapi_roll_config()` and the `id` parameter is the `id` returned by `maapi_roll_config()`.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_ACCESS\_DENIED, CONFD\_ERR\_EXTERNAL

```
int maapi_get_stream_progress(
int sock, int id);
```

In some cases (e.g. an action or custom command that can be interrupted by the user) it may be useful to be able to terminate ConfD's reading of data from a stream socket (by closing the socket) without waiting for a potentially large amount of data written to the socket to be consumed by ConfD. This function allows us to limit the amount of data "in flight" between the application and ConfD, by reporting the amount of data read by ConfD so far.

The `sock` parameter must be the maapi socket used for a function call that required a stream socket for writing to ConfD (currently the only such function is `maapi_load_config_stream()`), and the `id` parameter is the `id` returned by that function. `maapi_get_stream_progress()` returns the number of bytes that ConfD has read from the stream socket. If `id` does not identify a stream socket that is currently being read by ConfD, the function returns CONFD\_ERR with `confd_errno` set to CONFD\_ERR\_NOEXISTS. This can be due to e.g. that the socket has been closed, or that an error has occurred - but also that ConfD has determined that all the data has been read (e.g. the end of an XML document has been read). To avoid the latter case, the function should only be called when we have more data to write, and before the writing of that data. The following code shows a possible way to use this function.

```
#define MAX_IN_FLIGHT 4096

char buf[BUFSIZ];
int sock, streamsock, id;
int n, n_written = 0, n_read = 0;
int result;
...

while (!do_abort() && (n = get_data(buf, sizeof(buf))) > 0) {
    while (n_written - n_read > MAX_IN_FLIGHT) {
        if ((n_read = maapi_get_stream_progress(sock, id)) < 0) {
            ... handle error ...
        }
    }
    if (write(streamsock, buf, n) != n) {
        ... handle error ...
    }
    n_written += n;
}
close(streamsock);
result = maapi_load_config_stream_result(sock, id);
```

> **Note**
>
> A call to `maapi_get_stream_progress()` does not return until the number of bytes read has increased from the previous call (or if there is an error). This means that the above code does not imply busy-looping, but also that if the code was to call `maapi_get_stream_progress()` when `n_read` == `n_written`, the result would be a deadlock.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_NOEXISTS

```
int maapi_xpath_eval(
int sock, int thandle, const char *expr, int (*result
      kp, confd_value_t *v, 
void *state, void (*trace, void *initstate, const char *fmtpath, ...);
```

This function evaluates the XPath Path expression as supplied in `expr`. For each node in the resulting node set the function `result` is called with the keypath to the resulting node as the first argument, and, if the node is a leaf and has a value, the value of that node as the second argument. The expression will be evaluated using the root node as the context node, unless a path to an existing node is given as the last argument. For each invocation the `result()` function should return `ITER_CONTINUE` to tell the XPath evaluator to continue with the next resulting node. To stop the evaluation the `result()` can return `ITER_STOP` instead.

The `trace` is a pointer to a function that takes a single string as argument. If supplied it will be invoked when the xpath implementation has trace output for the current expression. (For an easy start, for example the `puts(3)` will print the trace output to stdout). If no trace is wanted `NULL` can be given.

The `initstate` parameter can be used for any user supplied opaque data (i.e. whatever is supplied as `initstate` is passed as `state` to the `result()` function for each invocation).

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADPATH, CONFD\_ERR\_XPATH

```
int maapi_xpath_eval_expr(
int sock, int thandle, const char *expr, char **res, void (*trace, const char *fmtpath, 
...);
```

Evaluate the XPath expression given in `expr` and return the result as a string, pointed to by `res`. If the call succeeds, `res` will point to a malloc:ed string that the caller needs to free. If the call fails `res` will be set to `NULL`.

It is possible to supply a path which will be treated as the initial context node when evaluating `expr` (i.e. if the path is relative, this is treated as the starting point, and this is also the node that `current()` will return when used in the XPath expression). If NULL is given, the current maapi position is used.

The `trace` is a pointer to a function that takes a single string as argument. If supplied it will be invoked when the xpath implementation has trace output for the current expression. (For an easy start, for example the `puts(3)` will print the trace output to stdout). If no trace is wanted `NULL` can be given.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADPATH, CONFD\_ERR\_XPATH

```
int maapi_query_start(
int sock, int thandle, const char *expr, const char *context_node, int chunk_size, 
int initial_offset, enum confd_query_result_type result_as, int nselect, 
const char *select[], int nsort, const char *sort[]);
```

Start a new query attached to the transaction given in `th`. If successful a query handle is returned (the query handle is then used in subsequent calls to `maapi_query_result()` etc). Brief summary of all parameters:

`sock`

> A previously opened maapi socket.

`th`

> A transaction handle to a previously started transaction.

`expr`

> The primary XPath expression.

`context_node`

> The context node (an ikeypath) for the primary expression. `NULL` is legal, and means that the context node will be `/`.

`chunk_size`

> How many results to return at a time. If set to 0 a default number will be used.

`initial_offset`

> Which result in line to begin with (1 means to start from the begining).

`result_as`

> The format the results will be returned in.

`nselect`

> The number of expressions in the `select` parameter.

`select`

> An array of XPath "select" expressions, of length `nselect`.

`nsort`

> The number of expressions in the `sort` parameter.

`sort`

> An array of XPath expressions which will be used for sorting, of length `nselect`.

A query is a way of evaluating an XPath expression and returning the results in chunks. The usage pattern is as follows: a primary expression in provided in the `expr` argument, which must evaluate to a node-set, the "results". For each node in the results node-set every "select" expression is evaluated with the result node as its context node. For example, given the YANG snippet:

```
  list interface {
    key name;
    unique number;
    leaf name {
      type string;
    }
    leaf number {
      type uint32;
      mandatory true;
    }
    leaf enabled {
      type boolean;
      default true;
    }
  ...
  }
```

and given that we want to find the name and number of all enabled interfaces - the `expr` could be `"/interface[enabled='true']"`, and the select expressions would be `{ "name", "number" }`. Note that the select expressions can have any valid XPath expression, so if you wanted to find out an interfaces name, and whether its number is even or not, the expressions would be: `{ "name", "(number mod 2) == 0" }`.

The results are then fetched using the `maapi_query_result()` function, which returns the results on the format specified by the `result_as` parameter. There are four different types of result, as defined by the type `enum confd_query_result_type`:

```c
enum confd_query_result_type {
    CONFD_QUERY_STRING = 0,
    CONFD_QUERY_HKEYPATH = 1,
    CONFD_QUERY_HKEYPATH_VALUE = 2,
    CONFD_QUERY_TAG_VALUE = 3
};
```

I.e. the results can be returned as strings, hkeypaths, hkeypaths and values, or tags and values. The string is just the resulting string of evaluating the select XPath expression. For hkeypaths, tags, and values it is the path/tag/value of the _node that the select XPath expression evaluates to_. This means that care must be taken so that the combination of select expression and return types actually yield sensible results (for example "1 + 2" is a valid select XPath expression, and would result in the string "3" when setting the result type to `CONFD_QUERY_STRING` - but it is not a node, and thus have no hkeypath, tag, or value). A complete example:

```
  qh = maapi_query_start(s, th, "/interface[enabled='true']", NULL,
                         1000, 1, CONFD_QUERY_TAG_VALUE,
                         2, (char *[]){ "name", "number" }, 0, NULL);
  n = 0;
  do {
    maapi_query_result(s, qh, &qr);
    n = qr->nresults;
    for (i=0; i<n; i++) {
      printf("result %d:\n", i + qr->offset);
      for (j=0; j<qr->nelements; j++) {
        // We know the type is tag-value
        char *tag = confd_hash2str(qr->results[i].tv[j].tag.tag);
        confd_pp_value(tmpbuf, BUFSIZ, &qr->results[i].tv[j].v);
        printf("  %s: %s\n", tag, tmpbuf);
      }
    }
    maapi_query_free_result(qr);
  } while (n > 0);
  maapi_query_stop(s, qh);
     
```

It is possible to sort the results using the built-in XPath function `sort-by()` (see the [tailf\_yang\_extensions(5)](section5.md#tailf_yang_extensions) man page)

It is also possible to sort the result using any expressions passed in the `sort` array. These array will be used to construct a temporary index which will live as long as the query is active. For example to start a query sorting first on the enabled leaf, and then on number one would call:

```
qh = maapi_query_start(s, th, "/interface[enabled='true']", NULL,
                       1000, 1, CONFD_QUERY_TAG_VALUE,
                       3, (char *[]){ "name", "number", "enabled" },
                       2, (char *[]){ "enabled", "number" });
...
     
```

Note that the index the query constructs is kept in memory, which will be released when the query is stopped.

```
int maapi_query_result(
int sock, int qh, struct confd_query_result **qrs);
```

Fetch the next available chunk of results associated with query handle `qh`. The results are returned in a `struct confd_query_result`, which is allocated by the library. The structure is defined as:

```c
struct confd_query_result {
    enum confd_query_result_type type;
    int offset;
    int nresults;
    int nelements;
    union {
        char **str;
        confd_hkeypath_t *hkp;
        struct {
            confd_hkeypath_t hkp;
            confd_value_t    val;
        } *kv;
        confd_tag_value_t *tv;
    } *results;
    void *__internal;           /* confd_lib internal housekeeping */
};
```

The `type` will always be the same as was requested in the call to `maapi_query_start()`, it is there to indicate which of the pointers in the union to use. The `offset` is the number of the first result in this chunk (i.e. for the first chunk it will be 1). How many results that are in this chunk is indicated in `nresults`, when there are no more available results it will be set to 0. Each result consists of `nelements` elements (this number is the same as the number of select parameters given in the call to `maapi_query_start()`.

All data pointed to in the result struct (as well as the struct itself) is allocated by the library - and when finished processing the result the user must call `maapi_query_free_result()` to free this data.

```
int maapi_query_free_result(
struct confd_query_result *qrs);
```

The `struct confd_query_result` returned by `maapi_query_result()` is dynamically allocated (and it also contains pointers to other dynamically allocated data) and so it needs to be freed when the result has been processed. Use this function to free the `struct confd_query_result` (and its accompanying data) returned by `maapi_query_result()`.

```
int maapi_query_reset(
int sock, int qh);
```

Reset / rewind a running query so that it starts from the beginning again. Next call to `maapi_query_result()` will then return the first chunk of results. The function can be called at any time (i.e. both after all results have been returned to essentially run the same query again, as well as after fetching just one or a couple of results).

```
int maapi_query_reset_to(
int sock, int qh, int offset);
```

Like `maapi_query_reset()`, except after the query has been reset it is restarted with the initial offset set to `offset`. Next call to `maapi_query_result()` will then return the first chunk of results at that offset. The function can be called at any time (i.e. both after all results have been returned to essentially run the same query again, as well as after fetching just one or a couple of results).

```
int maapi_query_stop(
int sock, int qh);
```

Stops the running query identified by `qh`, and makes ConfD free up any internal resources associated with the query. If a query isn't explicitly closed using this call it will be cleaned up when the transaction the query is linked to ends.

```
int maapi_install_crypto_keys(
int sock);
```

It is possible to define DES3 and AES keys inside confd.conf. These keys are used by ConfD to encrypt data which is entered into the system. The supported types are `tailf:des3-cbc-encrypted-string`, `tailf:aes-cfb-128-encrypted-string` and `tailf:aes-256-cfb-128-encrypted-string`. See [confd\_types(3)](section3.md#confd_types).

This function will copy those keys from ConfD (which reads confd.conf) into memory in the library. To decrypt data of these types, use the function `confd_decrypt()`, see [confd\_lib\_lib(3)](section3.md#confd_lib_lib).

```
int maapi_do_display(
int sock, int thandle, const char *fmtpath, ...);
```

If the data model uses the YANG `when` or `tailf:display-when` statement, this function can be used to determine if the item given by `fmtpath, ...` should be displayed or not.

```
int maapi_init_upgrade(
int sock, int timeoutsecs, int flags);
```

This is the first of three functions that must be called in sequence to perform an in-service data model upgrade, i.e. replace fxs files etc without restarting the ConfD daemon.

This function initializes the upgrade procedure. The `timeoutsecs` parameter specifies a maximum time to wait for users to voluntarily exit from "configure mode" sessions in CLI and Web UI. If transactions are still active when the timeout expires, the function will by default fail with CONFD\_ERR\_TIMEOUT. If the flag MAAPI\_UPGRADE\_KILL\_ON\_TIMEOUT was given via the `flags` parameter, such transactions will instead be forcibly terminated, allowing the initialization to complete successfully.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_LOCKED, CONFD\_ERR\_BADSTATE, CONFD\_ERR\_HA\_WITH\_UPGRADE, CONFD\_ERR\_TIMEOUT, CONFD\_ERR\_ABORTED

```
int maapi_perform_upgrade(
int sock, const char **loadpathdirs, int n);
```

When `maapi_init_upgrade()` has completed successfully, this function must be called to instruct ConfD to load the new data model files. The `loadpathdirs` parameter is an array of `n` strings that specify the directories to load from, corresponding to the /confdConfig/loadPath/dir elements in `confd.conf` (see [confd.conf(5)](section5.md#ncs.conf)).

These directories will also be searched for CDB "init files" (see the CDB chapter in the Development Guide). I.e. if the upgrade needs such files, we can place them in one of the new load path directories - or we can include directories that are used _only_ for CDB "init files" in the `loadpathdirs` array, corresponding to the /confdConfig/cdb/initPath/dir elements that can be specified in `confd.conf`.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADSTATE, CONFD\_ERR\_BAD\_CONFIG

```
int maapi_commit_upgrade(
int sock);
```

When also `maapi_perform_upgrade()` has completed successfully, this function must be called to make the upgrade permanent. This includes committing the CDB upgrade transaction when CDB is used, and we can thus get all the different validation errors that can otherwise result from `maapi_apply_trans()`.

When `maapi_commit_upgrade()` has completed successfully, the program driving the upgrade must also make sure that the /confdConfig/loadPath/dir elements in `confd.conf` reference the new directories. If CDB "init files" are used in the upgrade as described for `maapi_commit_upgrade()` above, the program should also make sure that the /confdConfig/cdb/initPath/dir elements reference the directories where those files are located.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADSTATE, CONFD\_ERR\_NOTSET, CONFD\_ERR\_NON\_UNIQUE, CONFD\_ERR\_BAD\_KEYREF, CONFD\_ERR\_TOO\_FEW\_ELEMS, CONFD\_ERR\_TOO\_MANY\_ELEMS, CONFD\_ERR\_UNSET\_CHOICE, CONFD\_ERR\_MUST\_FAILED, CONFD\_ERR\_MISSING\_INSTANCE, CONFD\_ERR\_INVALID\_INSTANCE, CONFD\_ERR\_STALE\_INSTANCE, CONFD\_ERR\_BADTYPE, CONFD\_ERR\_EXTERNAL

```
int maapi_abort_upgrade(
int sock);
```

Calling this function at any point before the call of `maapi_commit_upgrade()` will abort the upgrade.

> **Note**
>
> `maapi_abort_upgrade()` should _not_ be called if any of the three previous functions fail - in that case, ConfD will do an internal abort of the upgrade.

### Confd Daemon Control

```
int maapi_aaa_reload(
int sock, int synchronous);
```

When the ConfD AAA tree is populated by an external data provider (see the AAA chapter in the Admin Guide), this function can be used by the data provider to notify ConfD when there is a change to the AAA data. I.e. it is an alternative to executing the command `confd --clear-aaa-cache`.

If the `synchronous` parameter is 0, the function will only initiate the loading of the AAA data, just like `confd --clear-aaa-cache` does, and return CONFD\_OK as long as the communication with ConfD succeeded. Otherwise it will wait for the loading to complete, and return CONFD\_OK only if the loading was successful.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_EXTERNAL

```
int maapi_aaa_reload_path(
int sock, int synchronous, const char *fmt, ...);
```

A variant of `maapi_aaa_reload()` that causes only the AAA subtree given by the path in `fmt` to be loaded. This may be useful to load changes to the AAA data when loading the complete AAA tree from an external data provider takes a long time. Obviously care must be taken to make sure that all changes actually get loaded, and a complete load using e.g. `maapi_aaa_reload()` should be done at least when ConfD is started. The path may specify a container or list entry, but not a specific leaf.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_EXTERNAL

```
int maapi_snmpa_reload(
int sock, int synchronous);
```

When the ConfD SNMP Agent config is implemented by an external data provider, this function must be used by the data provider to notify ConfD when there is a change to the data.

If the `synchronous` parameter is 0, the function will only initiate the loading of the data, and return CONFD\_OK as long as the communication with ConfD succeeded. Otherwise it will wait for the loading to complete, and return CONFD\_OK only if the loading was successful.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_EXTERNAL

```
int maapi_start_phase(
int sock, int phase, int synchronous);
```

Once the ConfD daemon has been started in phase0 it is possible to use this function to tell the daemon to proceed to startphase 1 or 2 (as indicated in the `phase` parameter). If `synchronous` is non-zero the call does not return until the daemon has completed the transition to the requested start phase.

Note that start-phase1 can fail, (see documentation of `--start-phase1` in [confd(1)](section1.md#ncs)) in particular if CDB fails. In that case `maapi_start_phase()` will return CONFD\_ERR, with confderrno set to CONFD\_ERR\_START\_FAILED. However if ConfD stops before it has a chance to send back the error CONFD\_EOF might be returned.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_START\_FAILED

```
int maapi_wait_start(
int sock, int phase);
```

To synchronize startup with ConfD this function can be used to wait for ConfD to reach a particular start phase (0, 1, or 2). Note that to implement an equivalent of [`confd --wait-started`](section1.md#ncs) or [`confd --wait-phase0`](section1.md#ncs) case must also be taken to retry `maapi_connect()`, which will fail until ConfD has started enough to accept connections to its IPC port.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_PROTOUSAGE

```
int maapi_stop(
int sock, int synchronous);
```

Request the ConfD daemon to stop, if `synchronous` is non-zero the call will wait until ConfD has come to a complete halt. Note that since the daemon exits, the socket won't be re-usable after this call. Equivalent to [`confd --stop`](section1.md#ncs).

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS

```
int maapi_reload_config(
int sock);
```

Request that the ConfD daemon reloads its configuration files. The daemon will also close and re-open its log files. Equivalent to [`confd --reload`](section1.md#ncs).

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS

```
int maapi_reopen_logs(
int sock);
```

Request that the ConfD daemon closes and re-opens its log files, useful for logrotate(8).

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS

```
int maapi_rebind_listener(
int sock, int listener);
```

Request that the subsystem(s) specified by `listener` rebinds its listener socket(s). Currently open sockets (if any) will be closed, and new sockets created and bound via `bind(2)` and `listen(2)`. This is useful e.g. if /confdConfig/ignoreBindErrors/enabled is set to "true" in `confd.conf`, and some bindings have failed due to a problem that subsequently has been fixed. Calling this function then avoids the disable/enable config change that would otherwise be required to cause a rebind.

The following values can be used for the `listener` parameter, ORed together if more than one:

```
#define CONFD_LISTENER_IPC             (1 << 0)
#define CONFD_LISTENER_NETCONF         (1 << 1)
#define CONFD_LISTENER_SNMP            (1 << 2)
#define CONFD_LISTENER_CLI             (1 << 3)
#define CONFD_LISTENER_WEBUI           (1 << 4)
#define NCS_LISTENER_NETCONF_CALL_HOME (1 << 5)
```

> **Note**
>
> It is not possible to rebind sockets for northbound listeners during the transition from start phase 1 to start phase 2. If this is attempted, the call will fail (and do nothing) with `confd_errno` set to CONFD\_ERR\_BADSTATE.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADSTATE

```
int maapi_clear_opcache(
int sock, const char *fmt, ...);
```

Request clearing of the operational data cache. A path can be given via the `fmt` and subsequent parameters, to clear only the cached data for the subtree designated by that path. To clear the whole cache, pass NULL or "/" for `fmt`.

_Errors_: CONFD\_ERR\_MALLOC, CONFD\_ERR\_OS, CONFD\_ERR\_BADPATH

```
int maapi_netconf_ssh_call_home(
int sock, confd_value_t *host, int port);
```

Request that ConfD daemon initiates a NETCONF SSH Call Home connection (see RFC 8071) to the NETCONF client running on `host` and listening on `port`.

The parameter `host` is either an IP address (C\_IPV4 or C\_IPV6) or a host name (C\_BUF or C\_STR).

```
int maapi_netconf_ssh_call_home_opaque(
int sock, confd_value_t *host, const char *opaque, int port);
```

Request that ConfD daemon initiates a NETCONF SSH Call Home connection (see RFC 8071) to the NETCONF client running on `host` passing an opaque value `opaque` the client listening on `port`.

The parameter `host` is either an IP address (C\_IPV4 or C\_IPV6) or a host name (C\_BUF or C\_STR).

### See Also

`confd_lib(3)` - Confd lib

`confd_types(3)` - ConfD C data types

The ConfD User Guide

***

## `confd_types`

`confd_types` - NSO value representation in C

### Synopsis

```
#include <confd_lib.h>
```

### Description

The `libconfd` library manages data values such as elements received over the NETCONF protocol. This man page describes how these values as well as the XML paths (`confd_hkeypath_t`) identifying the values are represented in the C language.

### Typedefs

The following `enum` defines the different types. These are used to represent data model types from several different sources - see the section [DATA MODEL TYPES](section3.md#confd_types.data_model) at the end of this manual page for a full specification of how the data model types map to these types.

```c
enum confd_vtype {
    C_NOEXISTS    = 1,  /* end marker                              */
    C_XMLTAG      = 2,  /* struct xml_tag                          */
    C_SYMBOL      = 3,  /* not yet used                            */
    C_STR         = 4,  /* NUL-terminated strings                  */
    C_BUF         = 5,  /* confd_buf_t (string ...)                */
    C_INT8        = 6,  /* int8_t                                  */
    C_INT16       = 7,  /* int16_t                                 */
    C_INT32       = 8,  /* int32_t                                 */
    C_INT64       = 9,  /* int64_t                                 */
    C_UINT8       = 10, /* uint8_t                                 */
    C_UINT16      = 11, /* uint16_t                                */
    C_UINT32      = 12, /* uint32_t                                */
    C_UINT64      = 13, /* uint64_t                                */
    C_DOUBLE      = 14, /* double (xs:float,xs:double)             */
    C_IPV4        = 15, /* struct in_addr in NBO                   */
                        /*  (inet:ipv4-address)                    */
    C_IPV6        = 16, /* struct in6_addr in NBO                  */
                        /*  (inet:ipv6-address)                    */
    C_BOOL        = 17, /* int       (boolean)                     */
    C_QNAME       = 18, /* struct confd_qname (xs:QName)           */
    C_DATETIME    = 19, /* struct confd_datetime                   */
                        /*  (yang:date-and-time)                   */
    C_DATE        = 20, /* struct confd_date (xs:date)             */
    C_TIME        = 23, /* struct confd_time (xs:time)             */
    C_DURATION    = 27, /* struct confd_duration (xs:duration)     */
    C_ENUM_VALUE  = 28, /* int32_t (enumeration)                   */
    C_BIT32       = 29, /* uint32_t (bits size 32)                 */
    C_BIT64       = 30, /* uint64_t (bits size 64)                 */
    C_LIST        = 31, /* confd_list (leaf-list)                  */
    C_XMLBEGIN    = 32, /* struct xml_tag, start of container or   */
                        /*  list entry                             */
    C_XMLEND      = 33, /* struct xml_tag, end of container or     */
                        /*  list entry                             */
    C_OBJECTREF   = 34, /* struct confd_hkeypath*                  */
                        /*  (instance-identifier)                  */
    C_UNION       = 35, /* (union) - not used in API functions     */
    C_PTR         = 36, /* see cdb_get_values in confd_lib_cdb(3)  */
    C_CDBBEGIN    = 37, /* as C_XMLBEGIN, with CDB instance index  */
    C_OID         = 38, /* struct confd_snmp_oid*                  */
                        /*  (yang:object-identifier)               */
    C_BINARY      = 39, /* confd_buf_t (binary ...)                */
    C_IPV4PREFIX  = 40, /* struct confd_ipv4_prefix                */
                        /*  (inet:ipv4-prefix)                     */
    C_IPV6PREFIX  = 41, /* struct confd_ipv6_prefix                */
                        /*  (inet:ipv6-prefix)                     */
    C_DEFAULT     = 42, /* default value indicator                 */
    C_DECIMAL64   = 43, /* struct confd_decimal64 (decimal64)      */
    C_IDENTITYREF = 44, /* struct confd_identityref (identityref)  */
    C_XMLBEGINDEL = 45, /* as C_XMLBEGIN, but for a deleted list   */
                        /*  entry                                  */
    C_DQUAD       = 46, /* struct confd_dotted_quad                */
                        /*  (yang:dotted-quad)                     */
    C_HEXSTR      = 47, /* confd_buf_t (yang:hex-string)           */
    C_IPV4_AND_PLEN = 48, /* struct confd_ipv4_prefix              */
                        /*  (tailf:ipv4-address-and-prefix-length) */
    C_IPV6_AND_PLEN = 49, /* struct confd_ipv6_prefix              */
                        /*  (tailf:ipv6-address-and-prefix-length) */
    C_BITBIG      = 50, /* confd_buf_t (bits size > 64)            */
    C_XMLMOVEFIRST = 51, /* OBU list entry moved/inserted first    */
    C_XMLMOVEAFTER = 52, /* OBU list entry moved after             */
    C_EMPTY = 53,       /* Represents type empty in list keys      */
                        /* and unions.                             */
    C_MAXTYPE           /* maximum marker; add new values above    */
};
```

A concrete value is represented as a `confd_value_t` C struct:

```c
typedef struct confd_value {
    enum confd_vtype type;  /* as defined above */
    union {
        struct xml_tag xmltag;
        uint32_t symbol;
        confd_buf_t buf;
        confd_buf_const_t c_buf;
        char *s;
        const char *c_s;
        int8_t i8;
        int16_t i16;
        int32_t i32;
        int64_t i64;
        uint8_t u8;
        uint16_t u16;
        uint32_t u32;
        uint64_t u64;
        double d;
        struct in_addr ip;
        struct in6_addr ip6;
        int boolean;
        struct confd_qname qname;
        struct confd_datetime datetime;
        struct confd_date date;
        struct confd_time time;
        struct confd_duration duration;
        int32_t enumvalue;
        uint32_t b32;
        uint64_t b64;
        struct confd_list list;
        struct confd_hkeypath *hkp;
        struct confd_vptr ptr;
        struct confd_snmp_oid *oidp;
        struct confd_ipv4_prefix ipv4prefix;
        struct confd_ipv6_prefix ipv6prefix;
        struct confd_decimal64 d64;
        struct confd_identityref idref;
        struct confd_dotted_quad dquad;
        uint32_t enumhash; /* backwards compat */
    } val;
} confd_value_t;
```

`C_NOEXISTS`

> This is used internally by ConfD, as an end marker in `confd_hkeypath_t` arrays, and as a "value does not exist" indicator in arrays of values.

`C_DEFAULT`

> This is used to indicate that an element with a default value defined in the data model does not have a value set. When reading data from ConfD, we will only get this indication if we specifically request it, otherwise the default value is returned.

`C_XMLTAG`

> An C\_XMLTAG value is represented as a struct:
>
> ```c
> struct xml_tag {
>     uint32_t tag;
>     uint32_t ns;
> };
> ```
>
> When a YANG module is compiled by the [confdc(1)](section1.md#confdc) compiler, the `--emit-h` flag is used to generate a .h file containing definitions for all the nodes in the module. For example if we compile the following YANG module:
>
> ```
> # cat blaster.yang
> module blaster {
>   namespace "http://tail-f.com/ns/blaster";
>   prefix blaster;
>
>   import tailf-common {
>     prefix tailf;
>   }
>
>   typedef Fruit {
>     type enumeration {
>       enum apple;
>       enum orange;
>       enum pear;
>     }
>   }
>   container tiny {
>     tailf:callpoint xcp;
>     leaf foo {
>       type int8;
>     }
>     leaf bad {
>       type int16;
>     }
>   }
> }
>
> # confdc -c blaster.yang
> # confdc --emit-h blaster.h blaster.fxs
> ```
>
> We get the following contents in blaster.h
>
> ```
> # cat blaster.h
> /*
>  * BEWARE BEWARE BEWARE BEWARE BEWARE BEWARE BEWARE BEWARE BEWARE
>  * This file has been auto-generated by the confdc compiler.
>  * Source: blaster.fxs
>  * BEWARE BEWARE BEWARE BEWARE BEWARE BEWARE BEWARE BEWARE BEWARE
>  */
>
> #ifndef _BLASTER_H_
> #define _BLASTER_H_
>
> #ifdef __cplusplus
> extern "C" {
> #endif /* __cplusplus */
>
> #ifndef blaster__ns
> #define blaster__ns 670579579
> #define blaster__ns_id "http://tail-f.com/ns/blaster"
> #define blaster__ns_uri "http://tail-f.com/ns/blaster"
> #endif
>
> #define blaster_orange 1
> #define blaster_apple 0
> #define blaster_pear 2
> #define blaster_foo 161968632
> #define blaster_tiny 1046642021
> #define blaster_bad 1265139696
> #define blaster__callpointid_xcp "xcp"
>
> #ifdef __cplusplus
> }
> #endif
>
> #endif
> ```
>
> The integers in the .h file are used in the `struct xml_tag`, thus the container node tiny is represented as a `xml_tag` C struct `{tag=1046642021, ns=670579579}` or, using the #defines `{tag=blaster_tiny, ns=blaster__ns}`.
>
> Each callpoint, actionpoint, and validate statement also yields a preprocessor symbol. If the symbol is used rather than the literal string in calls to ConfD, the C compiler will catch the potential problem when the id in the data model has changed but the C code hasn't been updated.
>
> Sometimes we wish to retrieve a string representation of defined hash values. This can be done with the function `confd_hash2str()`, see the [USING SCHEMA INFORMATION](section3.md#confd_types.using_schema_information) section below.

`C_BUF`

> This type is used to represent the YANG built-in type `string` and the `xs:token` type. The struct which is used is:
>
> ```c
> typedef struct confd_buf {
>     unsigned int size;
>     unsigned char *ptr;
> } confd_buf_t;
> ```
>
> Strings passed to the application from ConfD are always NUL-terminated. When values of this type are received by the callback functions in [confd\_lib\_dp(3)](section3.md#confd_lib_dp), the `ptr` field is a pointer to libconfd private memory, and the data will not survive unless copied by the application.
>
> To create and extract values of type C\_BUF we do:
>
> ```
> confd_value_t myval;
> char *x; int len;
>
> CONFD_SET_BUF(&myval, "foo", 3)
> x = CONFD_GET_BUFPTR(&myval);
> len = CONFD_GET_BUFSIZE(&myval);
> ```
>
> It is important to realize that C\_BUF data received by the application through either `maapi_get_elem()` or `cdb_get()` which are of type C\_BUF must be freed by the application.

`C_STR`

> This tag is never received by the application. Values and keys received in the various data callbacks (See `confd_register_data_cb()` in [confd\_lib\_dp(3)](section3.md#confd_lib_dp) never have this type. It is only used when the application replies with values to ConfD. (See `confd_data_reply_value()` in [confd\_lib\_dp(3)](section3.md#confd_lib_dp)).
>
> It is used to represent regular NUL-terminated char\* values. Example:
>
> ```
> confd_value_t myval;
> myval.type = C_STR;
> myval.val.s = "Zaphod";
> /* or alternatively and recommended */
> CONFD_SET_STR(&myval, "Beeblebrox");
> ```

`C_INT8`

> Used to represent the YANG built-in type `int8`, which is a signed 8 bit integer. The corresponding C type is `int8_t`. Example:
>
> ```
> int8_t ival;
> confd_value_t myval;
>
> CONFD_SET_INT8(&myval, -32);
> ival = CONFD_GET_INT8(&myval);
> ```

`C_INT16`

> Used to represent the YANG built-in type `int16`, which is a signed 16 bit integer. The corresponding C type is `int16_t`. Example:
>
> ```
> int16_t ival;
> confd_value_t myval;
>
> CONFD_SET_INT16(&myval, -3277);
> ival = CONFD_GET_INT16(&myval);
> ```

`C_INT32`

> Used to represent the YANG built-in type `int32`, which is a signed 32 bit integer. The corresponding C type is `int32_t`. Example:
>
> ```
> int32_t ival;
> confd_value_t myval;
>
> CONFD_SET_INT32(&myval, -77732);
> ival = CONFD_GET_INT32(&myval);
> ```

`C_INT64`

> Used to represent the YANG built-in type `int64`, which is a signed 64 bit integer. The corresponding C type is `int64_t`. Example:
>
> ```
> int64_t ival;
> confd_value_t myval;
>
> CONFD_SET_INT64(&myval, -32);
> ival = CONFD_GET_INT64(&myval);
> ```

`C_UINT8`

> Used to represent the YANG built-in type `uint8`, which is an unsigned 8 bit integer. The corresponding C type is `uint8_t`. Example:
>
> ```
> uint8_t ival;
> confd_value_t myval;
>
> CONFD_SET_UINT8(&myval, 32);
> ival = CONFD_GET_UINT8(&myval);
> ```

`C_UINT16`

> Used to represent the YANG built-in type `uint16`, which is an unsigned 16 bit integer. The corresponding C type is `uint16_t`. Example:
>
> ```
> uint16_t ival;
> confd_value_t myval;
>
> CONFD_SET_UINT16(&myval, 3277);
> ival = CONFD_GET_UINT16(&myval);
> ```

`C_UINT32`

> Used to represent the YANG built-in type `uint32`, which is an unsigned 32 bit integer. The corresponding C type is `uint32_t`. Example:
>
> ```
> uint32_t ival;
> confd_value_t myval;
>
> CONFD_SET_UINT32(&myval, 77732);
> ival = CONFD_GET_UINT32(&myval);
> ```

`C_UINT64`

> Used to represent the YANG built-in type `uint64`, which is an unsigned 64 bit integer. The corresponding C type is `uint64_t`. Example:
>
> ```
> uint64_t ival;
> confd_value_t myval;
>
> CONFD_SET_UINT64(&myval, 32);
> ival = CONFD_GET_UINT64(&myval);
> ```

`C_DOUBLE`

> Used to represent the XML schema types `xs:decimal`, `xs:float` and `xs:double`. They are all coerced into the C type `double`. Example:
>
> ```
> double d;
> confd_value_t myval;
>
> CONFD_SET_DOUBLE(&myval, 3.14);
> d = CONFD_GET_DOUBLE(&myval);
> ```

`C_BOOL`

> Used to represent the YANG built-in type `boolean`. The C representation is an integer with `0` representing false and non-zero representing true. Example:
>
> ```
> int bool
> confd_value_t myval;
>
> CONFD_SET_BOOL(&myval, 1);
> b = CONFD_GET_BOOL(&myval);
> ```

`C_QNAME`

> Used to represent XML Schema type `xs:QName` which consists of a pair of strings, `prefix` and a `name`. Data is allocated by the library as for C\_BUF. Example:
>
> ```
> unsigned char* prefix, *name;
> int prefix_len, name_len;
> confd_value_t myval;
>
> CONFD_SET_QNAME(&myval, "myprefix", 8, "myname", 6);
> prefix = CONFD_GET_QNAME_PREFIX_PTR(&myval);
> prefix_len = CONFD_GET_QNAME_PREFIX_SIZE(&myval);
> name = CONFD_GET_QNAME_NAME_PTR(&myval);
> name_len = CONFD_GET_QNAME_NAME_SIZE(&myval);
> ```

`C_DATETIME`

> Used to represent the YANG type `yang:date-and-time`. The C representation is a struct:
>
> ```c
> struct confd_datetime {
>     int16_t year;
>     uint8_t month;
>     uint8_t day;
>     uint8_t hour;
>     uint8_t min;
>     uint8_t sec;
>     uint32_t micro;
>     int8_t timezone;
>     int8_t timezone_minutes;
> };
> ```
>
> ConfD does not try to convert the data values into timezone independent C structs. The timezone and timezone\_minutes fields are integers where:
>
> `timezone == 0 && timezone_minutes == 0`
>
> > represents UTC. This corresponds to a timezone specification in the string form of "Z" or "+00:00".
>
> `-14 <= timezone && timezone <= 14`
>
> > represents an offset in hours from UTC. In this case `timezone_minutes` represents a fraction of an hour in minutes if the offset from UTC isn't an integral number of hours, otherwise it is 0. If `timezone != 0`, its sign gives the direction of the offset, and `timezone_minutes` is always `>= 0` - otherwise the sign of `timezone_minutes` gives the direction of the offset. E.g. `timezone == 5 && timezone_minutes == 30` corresponds to a timezone specification in the string form of "+05:30".
>
> `timezone == CONFD_TIMEZONE_UNDEF`
>
> > means that the string form indicates lack of timezone information with "-00:00".
>
> It is up to the application to transform these structs into more UNIX friendly structs such as `struct tm` from `<time.h>`. Example:
>
> ```
> #include <time.h>
> confd_value_t myval;
> struct confd_datetime dt;
> struct tm *tm = localtime(time(NULL));
>
> dt.year = tm->tm_year + 1900; dt.month = tm->tm_mon + 1;
> dt.day = tm->tm_mday; dt->hour = tm->tm_hour;
> dt.min = tm->tm_min; dt->sec = tm->tm_sec;
> dt.micro = 0; dt.timezone = CONFD_TIMEZONE_UNDEF;
> CONFD_SET_DATETIME(&myval, dt);
> dt = CONFD_GET_DATETIME(&myval);
> ```

`C_DATE`

> Used to represent the XML Schema type `xs:date`. The C representation is a struct:
>
> ```c
> struct confd_date {
>     int16_t year;
>     uint8_t month;
>     uint8_t day;
>     int8_t timezone;
>     int8_t timezone_minutes;
> };
> ```
>
> Example:
>
> ```
> confd_value_t myval;
> struct confd_date dt;
>
> dt.year = 1960, dt.month = 3,
> dt.day = 31; dt.timezone = CONFD_TIMEZONE_UNDEF;
> CONFD_SET_DATE(&myval, dt);
> dt = CONFD_GET_DATE(&myval);
> ```

`C_TIME`

> Used to represent the XML Schema type `xs:time`. The C representation is a struct:
>
> ```c
> struct confd_time {
>     uint8_t hour;
>     uint8_t min;
>     uint8_t sec;
>     uint32_t micro;
>     int8_t timezone;
>     int8_t timezone_minutes;
> };
> ```
>
> Example:
>
> ```
> confd_value_t myval;
> struct confd_time dt;
>
> dt.hour = 19, dt.min = 3,
> dt.sec = 31; dt.timezone = CONFD_TIMEZONE_UNDEF;
> CONFD_SET_TIME(&myval, dt);
> dt = CONFD_GET_TIME(&myval);
> ```

`C_DURATION`

> Used to represent the XML Schema type `xs:duration`. The C representation is a struct:
>
> ```c
> struct confd_duration {
>     uint32_t years;
>     uint32_t months;
>     uint32_t days;
>     uint32_t hours;
>     uint32_t mins;
>     uint32_t secs;
>     uint32_t micros;
> };
> ```
>
> Example of something that is supposed to last 3 seconds:
>
> ```
> confd_value_t myval;
> struct confd_duration dt;
>
> memset(&dt, 0, sizeof(struct confd_duration));
> dt.secs = 3;
> CONFD_SET_DURATION(&myval, dt);
> dt = CONFD_GET_DURATION(&myval);
> ```

`C_IPV4`

> Used to represent the YANG type `inet:ipv4-address`. The C representation is a `struct in_addr` Example:
>
> ```
> struct in_addr ip;
> confd_value_t myval;
>
> ip.s_addr = inet_addr("192.168.1.2");
> CONFD_SET_IPV4(&myval, ip);
> ip = CONFD_GET_IPV4(&myval);
> ```

`C_IPV6`

> Used to represent the YANG type `inet:ipv6-address`. The C representation is as `struct in6_addr` Example:
>
> ```
> struct in6_addr ip6;
> confd_value_t myval;
>
> inet_pton(AF_INET6, "FFFF::192.168.42.2", &ip6);
> CONFD_SET_IPV6(&myval, ip6);
> ip6 = CONFD_GET_IPV6(&myval);
> ```

`C_ENUM_VALUE`

> Used to represent the YANG built-in type `enumeration` - like the Fruit enumeration from the beginning of this man page.
>
> ```
> enum fruit {
>    ORANGE = blaster_orange,
>    APPLE = blaster_apple,
>    PEAR = blaster_pear
> };
>
> enum fruit f;
> confd_value_t myval;
> CONFD_SET_ENUM_VALUE(&myval, APPLE);
> f = CONFD_GET_ENUM_VALUE(&myval);
> ```
>
> Thus leafs that have type `enumeration` in the YANG module do not have values that are strings in the C code, but integer values according to the YANG standard. The file generated by `confdc --emit-h` includes `#define` symbols for these integer values.

`C_BIT32`; `C_BIT64`

> Used to represent the YANG built-in type `bits` when the highest bit position assigned is below 64. In C the value representation for a bitmask is either a 32 bit or a 64 bit unsigned integer, depending on the highest bit position assigned. The file generated by `confdc --emit-h` includes `#define` symbols giving bitmask values for the defined bit names.
>
> ```
> uint32_t mask = 77;
> confd_value_t myval;
> CONFD_SET_BIT32(&myval, mask);
> mask = CONFD_GET_BIT32(&myval);
> ```

`C_BITBIG`

> Used to represent the YANG built-in type `bits` when the highest bit position assigned is above 63. In C the value representation for a bitmask in this case is a "little-endian" byte array (confd\_buf\_t), i.e. byte 0 holds bits 0-7, byte 1 holds bit 8-15, and so on. The file generated by `confdc --emit-h` includes `#define` symbols giving position values for the defined bit names, as well as the size needed for a byte array that can hold the values for all the defined bits.
>
> ```
> unsigned char mask[myns__size_mytype];
> unsigned char *mask2;
> confd_value_t myval;
> memset(mask, 0, sizeof(mask));
> CONFD_BITBIG_SET_BIT(mask, myns__pos_mytype_somebit);
> CONFD_SET_BITBIG(&myval, mask, sizeof(mask));
> mask2 = CONFD_GET_BITBIG_PTR(&myval);
> ```

`C_EMPTY`

> Used to represent the YANG built-in type `empty`, when placed in a `union` or a list key. It is not used for regular type `empty` leafs to preserve backward compatibility. Regular leafs are represented by C\_XMLTAG.
>
> Leafs with type `C_EMPTY` will be set using `set_elem()` and read using `get_elem()`. Like before, regular type `empty` leafs outside of `union` are set using `create()` and "read" using `exists()`.
>
> ```
> confd_value_t myval;
> CONFD_SET_EMPTY(&myval);
> ```

`C_LIST`

> Used to represent a YANG `leaf-list`. In C the value representation for is:
>
> ```c
> struct confd_list {
>     unsigned int size;
>     struct confd_value *ptr;
> };
> ```
>
> Similar to the C\_BUF type, the confd library will allocate data when an element of type `C_LIST` is retrieved via `maapi_get_elem()` or `cdb_get()`. Using `confd_free_value()` (see [confd\_lib\_lib(3)](section3.md#confd_lib_lib)) to free allocated data is especially convenient for C\_LIST, as the individual list elements may also have allocated data (e.g. a YANG `leaf-list` of type `string`).
>
> To set a value of type C\_LIST we have to populate the list array separately, for example:
>
> ```
> confd_value_t arr[5];
> confd_value_t v;
> confd_value_t *vp;
> int i, size;
>
> for (i=0; i<5; i++)
>      CONFD_SET_INT32(&arr[i], i);
> CONFD_SET_LIST(&v, &arr[0], 5);
>
> vp = CONFD_GET_LIST(&v);
> size = CONFD_GET_LISTSIZE(&v);
> ```

`C_XMLBEGIN`; `C_XMLEND`

> These are only used in the "Tagged Value Array" and "Tagged Value Attribute Array" formats for representing XML structures, see below. The representation is the same as for C\_XMLTAG.

`C_OBJECTREF`

> This is used to represent the YANG built-in type `instance-identifier`. Values are represented as `confd_hkeypath_t` pointers. Data is allocated by the library as for C\_BUF. When we read an `instance-identifier` via e.g. `cdb_get()` we can retrieve the pointer to the keypath as:
>
> ```
> confd_value_t v;
> confd_hkeypath_t *hkp;
>
> cdb_get(sock, &v, mypath);
> hkp = CONFD_GET_OBJECTREF(&v);
> ```
>
> To retrieve the value which is identified by the `instance-identifier` we can e.g. use the "%h" modifier in the format string used with the CDB and MAAPI API functions.

`C_OID`

> This is used to represent the YANG `yang:object-identifier` and `yang:object-identifier-128` types, i.e. SNMP Object Identifiers. The value is a pointer to a struct:
>
> ```c
> struct confd_snmp_oid {
>     uint32_t oid[128];
>     int len;
> };
> ```
>
> Data is allocated by the library as for C\_BUF. When using values of this type, we set or get the `len` element, and the individual OID elements in the `oid` array. This example will store the string "0.1.2" in `buf`:
>
> ```
> struct confd_snmp_oid myoid;
> confd_value_t myval;
> char buf[BUFSIZ];
> int i;
>
> for (i = 0; i < 3; i++)
>     myoid.oid[i] = i;
> myoid.len = 3;
> CONFD_SET_OID(&myval, &myoid);
>
> confd_pp_value(buf, sizeof(buf), &myval);
> ```

`C_BINARY`

> This type is used to represent arbitrary binary data. The YANG built-in type `binary`, the ConfD built-in types `tailf:hex-list` and `tailf:octet-list`, and the XML Schema primitive type `xs:hexBinary` all use this type. The value representation is the same as for C\_BUF. Binary (C\_BINARY) data received by the application from ConfD is always NUL terminated, but since the data may also contain NUL bytes, it is generally necessary to use the size given by the representation.
>
> ```c
> typedef struct confd_buf {
>     unsigned int size;
>     unsigned char *ptr;
> } confd_buf_t;
> ```
>
> Data is also allocated by the library as for C\_BUF. Example:
>
> ```
> confd_value_t myval, myval2;
> unsigned char *bin;
> int len;
>
> bin = CONFD_GET_BINARY_PTR(&myval);
> len = CONFD_GET_BINARY_SIZE(&myval);
> CONFD_SET_BINARY(&myval2, bin, len);
> ```

`C_IPV4PREFIX`

> Used to represent the YANG data type `inet:ipv4-prefix`. The C representation is a struct as follows:
>
> ```c
> struct confd_ipv4_prefix {
>     struct in_addr ip;
>     uint8_t len;
> };
> ```
>
> Example:
>
> ```
> struct confd_ipv4_prefix prefix;
> confd_value_t myval;
>
> prefix.ip.s_addr = inet_addr("10.0.0.0");
> prefix.len = 8;
> CONFD_SET_IPV4PREFIX(&myval, prefix);
> prefix = CONFD_GET_IPV4PREFIX(&myval);
> ```

`C_IPV6PREFIX`

> Used to represent the YANG data type `inet:ipv6-prefix`. The C representation is a struct as follows:
>
> ```c
> struct confd_ipv6_prefix {
>     struct in6_addr ip6;
>     uint8_t len;
> };
> ```
>
> Example:
>
> ```
> struct confd_ipv6_prefix prefix;
> confd_value_t myval;
>
> inet_pton(AF_INET6, "2001:DB8::1428:57A8", &prefix.ip6);
> prefix.len = 125;
> CONFD_SET_IPV6PREFIX(&myval, prefix);
> prefix = CONFD_GET_IPV6PREFIX(&myval);
> ```

`C_DECIMAL64`

> Used to represent the YANG built-in type `decimal64`, which is a decimal number with 64 bits of precision. The C representation is a struct as follows:
>
> ```c
> struct confd_decimal64 {
>     int64_t value;
>     uint8_t fraction_digits;
> };
> ```
>
> The `value` element is scaled with the value of the `fraction_digits` element, to be able to represent it as a 64-bit integer. Note that `fraction_digits` is a constant for any given instance of a decimal64 type. It is provided whenever we receive a C\_DECIMAL64 from ConfD. When we provide a C\_DECIMAL64 to ConfD, we can set `fraction_digits` either to the correct value or to 0 - however the `value` element must always be correctly scaled. See also `confd_get_decimal64_fraction_digits()` in the [confd\_lib\_lib(3)](section3.md#confd_lib_lib) man page.
>
> Example:
>
> ```
> struct confd_decimal64 d64;
> confd_value_t myval;
>
> d64.value = 314159;
> d64.fraction_digits = 5;
> CONFD_SET_DECIMAL64(&myval, d64);
> d64 = CONFD_GET_DECIMAL64(&myval);
> ```

`C_IDENTITYREF`

> Used to represent the YANG built-in type `identityref`, which references an existing `identity`. The C representation is a struct as follows:
>
> ```c
> struct confd_identityref {
>     uint32_t ns;
>     uint32_t id;
> };
> ```
>
> The `ns` and `id` elements are hash values that represent the namespace of the module that defines the identity, and the identity within that module.
>
> Example:
>
> ```
> struct confd_identityref idref;
> confd_value_t myval;
>
> idref.ns = des__ns;
> idref.id = des_des3
> CONFD_SET_IDENTITYREF(&myval, idref);
> idref = CONFD_GET_IDENTITYREF(&myval);
> ```

`C_DQUAD`

> Used to represent the YANG data type `yang:dotted-quad`. The C representation is a struct as follows:
>
> ```c
> struct confd_dotted_quad {
>     unsigned char quad[4];
> };
> ```
>
> Example:
>
> ```
> struct confd_dotted_quad dquad;
> confd_value_t myval;
>
> dquad.quad[0] = 1;
> dquad.quad[1] = 2;
> dquad.quad[2] = 3;
> dquad.quad[3] = 4;
> CONFD_SET_DQUAD(&myval, dquad);
> dquad = CONFD_GET_DQUAD(&myval);
> ```

`C_HEXSTR`

> Used to represent the YANG data type `yang:hex-string`. The value representation is the same as for C\_BUF and C\_BINARY. C\_HEXSTR data received by the application from ConfD is always NUL terminated, but since the data may also contain NUL bytes, it is generally necessary to use the size given by the representation.
>
> ```c
> typedef struct confd_buf {
>     unsigned int size;
>     unsigned char *ptr;
> } confd_buf_t;
> ```
>
> Data is also allocated by the library as for C\_BUF/C\_BINARY. Example:
>
> ```
> confd_value_t myval, myval2;
> unsigned char *hex;
> int len;
>
> hex = CONFD_GET_HEXSTR_PTR(&myval);
> len = CONFD_GET_HEXSTR_SIZE(&myval);
> CONFD_SET_HEXSTR(&myval2, bin, len);
> ```

`C_IPV4_AND_PLEN`

> Used to represent the ConfD built-in data type `tailf:ipv4-address-and-prefix-length`. The C representation is the same struct that is used for C\_IPV4PREFIX, as follows:
>
> ```c
> struct confd_ipv4_prefix {
>     struct in_addr ip;
>     uint8_t len;
> };
> ```
>
> Example:
>
> ```
> struct confd_ipv4_prefix ip_and_len;
> confd_value_t myval;
>
> ip_and_len.ip.s_addr = inet_addr("172.16.1.2");
> ip_and_len.len = 16;
> CONFD_SET_IPV4_AND_PLEN(&myval, ip_and_len);
> ip_and_len = CONFD_GET_IPV4_AND_PLEN(&myval);
> ```

`C_IPV6_AND_PLEN`

> Used to represent the ConfD built-in data type `tailf:ipv6-address-and-prefix-length`. The C representation is the same struct that is used for C\_IPV6PREFIX, as follows:
>
> ```c
> struct confd_ipv6_prefix {
>     struct in6_addr ip6;
>     uint8_t len;
> };
> ```
>
> Example:
>
> ```
> struct confd_ipv6_prefix ip_and_len;
> confd_value_t myval;
>
> inet_pton(AF_INET6, "2001:DB8::1428:57A8", &ip_and_len.ip6);
> ip_and_len.len = 64;
> CONFD_SET_IPV6_AND_PLEN(&myval, ip_and_len);
> ip_and_len = CONFD_GET_IPV6_AND_PLEN(&myval);
> ```

### Xml Paths

Almost all of the callback functions the user is supposed write for the [confd\_lib\_dp(3)](section3.md#confd_lib_dp) library takes a parameter of type `confd_hkeypath_t`. This type includes an array of the type `confd_value_t` described above. The `confd_hkeypath_t` is defined as a C struct:

```c
typedef struct confd_hkeypath {
    int len;
    confd_value_t v[MAXDEPTH][MAXKEYLEN];
} confd_hkeypath_t;
```

Where:

```
#define MAXDEPTH 20   /* max depth of data model tree
                         (max KP length + 1) */
#define MAXKEYLEN 9   /* max number of key elems
                         (max keys + 1) */
```

For example, assume we have a YANG module with:

```
container servers {
  tailf:callpoint mycp;
  list server {
    key name;
    max-elements 64;
    leaf name {
      type string;
    }
    leaf ip {
      type inet:ip-address;
    }
    leaf port {
      type inet:port-number;
    }
  }
}
```

Assuming a server entry with the name "www" exists, then the path /servers/server{www}/ip is valid and identifies the ip leaf in the server entry whose key is "www".

The `confd_hkeypath_t` which corresponds to /servers/server{www}/ip is received in reverse order so the following holds assuming the variable holding a pointer to the keypath is called `hkp`.

`hkp->v[0][0]` is the last element, the "ip" element. It is a data model node, and `CONFD_GET_XMLTAG(&hkp->v[0][0])` will evaluate to a hashed integer (which can be found in the confdc generated .h file as a #define)

`hkp->v[1][0]` is the next element in the path. The key element is called "name". This is a `string` value - thus `strcmp("www", CONFD_GET_BUFPTR(&hkp->v[1][0])) == 0` holds.

If we had chosen to use multiple keys in our data model - for example if we had chosen to use both the "name" and the "ip" leafs as keys:

```
key "name ip";
```

The hkeypaths would be different since two keys are required. A valid path identifying a port leaf would be /servers/server{www 10.2.3.4}/port. In this case we can get to the ip part of the key with:

```
struct in_addr ip;
ip = CONFD_GET_IPV4(&hkp->v[1][1])
```

### User-Defined Types

We can define new types in addition to those listed in the TYPEDEFS section above. This can be useful if none of the predefined types, nor a derivation of one of those types via standard YANG restrictions, is suitable. Of course it is always possible to define a type as a derivation of `string` and have the application parse the string whenever a value needs to be processed, but with a user-defined type ConfD will do the string <-> value translation just as for the predefined types.

A user-defined type will always have a value representation that uses a confd\_value\_t with one of the `enum confd_vtype` values listed above, but the textual representation and the range(s) of allowed values are defined by the user. The `misc/user_type` example in the collection delivered with the ConfD release shows implementation of several user-defined types - it will be useful to refer to it for the description below.

The choice of `confd_vtype` to use for the value representation can be whatever suits the actual data values best, with one exception:

> **Note**
>
> The C\_LIST `confd_vtype` value can _not_ be used for a leaf that is a key in a YANG list. The "normal" C\_LIST usage is only for representation of leaf-lists, and a leaf-list can of course not be a key. Thus the ConfD code is not prepared to handle this kind of "value" for a key. It is a strong recommendation to _never_ use C\_LIST for a user-defined type, since even if the type is not initially used for key leafs, subsequent development may see a need for this, at which point it may be cumbersome to change to a different representation.

The example uses C\_INT32, C\_IPV4PREFIX, and C\_IPV6PREFIX for the value representation of the respective types, but in many cases the opaque byte array provided by C\_BINARY will be most suitable - this can e.g. be mapped to/from an arbitrary C struct.

When we want to implement a user-defined type, we need to specify the type as `string`, and add a `tailf:typepoint` statement - see [tailf\_yang\_extensions(5)](section5.md#tailf_yang_extensions). We can use `tailf:typepoint` wherever a built-in or derived type can be specified, i.e. as sub-statement to `typedef`, `leaf`, or `leaf-list`:

```
typedef myType {
  type string;
  tailf:typepoint my_type;
}

container c {
  leaf one {
    type myType;
  }
  leaf two {
    type string;
    tailf:typepoint two_type;
  }
}
```

The argument to the `tailf:typepoint` statement is used to locate the type implementation, similar to how "callpoints" are used to locate data providers, but the actual mechanism is different, as described below.

To actually implement the type definition, we need to write three callback functions that are defined in the `struct confd_type`:

```c
struct confd_type {
    /* If a derived type point at the parent */
    struct confd_type *parent;

    /* not used in confspecs, but used in YANG */
    struct confd_type *defval;

    /* parse value located in str, and validate.
     * returns CONFD_TRUE if value is syntactically correct
     * and CONFD_FALSE otherwise.
     */
    int (*str_to_val)(struct confd_type *self,
                      struct confd_type_ctx *ctx,
                      const char *str, unsigned int len,
                      confd_value_t *v);

    /* print the value to str.
     * does not print more than len bytes, including trailing NUL.
     * return value as snprintf - i.e. if the value is correct for
     * the type, it returns the length of the string form regardless
     * of the len limit - otherwise it returns a negative number.
     * thus, the NUL terminated output has been completely written
     * if and only if the returned value is nonnegative and less
     * than len.
     * If strp is non-NULL and the string form is constant (i.e.
     * C_ENUM_VALUE), a pointer to the string is stored in *strp.
     */
    int (*val_to_str)(struct confd_type *self,
                      struct confd_type_ctx *ctx,
                      const confd_value_t *v,
                      char *str, unsigned int len,
                      const char **strp);

    /* returns CONFD_TRUE if value is correct, otherwise CONFD_FALSE
     */
    int (*validate)(struct confd_type *self,
                    struct confd_type_ctx *ctx,
                    const confd_value_t *v);

    /* data optionally used by the callbacks */
    void *opaque;
};
```

I.e. `str_to_val()` and `val_to_str()` are responsible for the string to value and value to string translations, respectively, and `validate()` may be called to verify that a given value adheres to any restrictions on the values allowed for the type. The `errstr` element in the `struct confd_type_ctx *ctx` passed to these functions can be used to return an error message when the function fails - in this case `errstr` must be set to the address of a dynamically allocated string. The other elements in `ctx` are currently unused.

Including user-defined types in a YANG `union` may need some special consideration. Per the YANG specification, the string form of a value is matched against the union member types in the order they are specified until a match is found, and this procedure determines the type of the value. A corresponding procedure is used by ConfD when the value needs to be converted to a string, but this conversion does not include any evaluation of restrictions etc - the values are assumed to be correct for their type. Thus the `val_to_str()` function for the member types are tried in order until one succeeds, and the resulting string is used. This means that a) `val_to_str()` must verify that the value is of the correct type, i.e. that it has the expected `confd_vtype`, and b) if the value representation is the same for multiple member types, there is no guarantee that the same member type as for the string to value conversion is chosen.

The `opaque` element in the `struct confd_type` can be used for any auxiliary (static) data needed by the functions (on invocation they can reference it as self->opaque). The `parent` and `defval` elements are not used in this context, and should be NULL.

> **Note**
>
> The `str_to_val()` function _must_ allocate space (using e.g. malloc(3)) for the actual data value for those confd\_value\_t types that are listed as having allocated data above, i.e. C\_BUF, C\_QNAME, C\_LIST, C\_OBJECTREF, C\_OID, C\_BINARY, and C\_HEXSTR.

We make the implementation available to ConfD by creating one or more shared objects (.so files) containing the above callback functions. Each shared object may implement one or more types, and at startup the ConfD daemon will search the directories specified for /confdConfig/loadPath in `confd.conf` for files with a name that match the pattern "confd\_type\*.so" and load them.

Each shared object must also implement an "init" callback:

```
int confd_type_cb_init(
struct confd_type_cbs **cbs);
```

When the object has been loaded, ConfD will call this function. It must return a pointer to an array of type callback structures via the `cbs` argument, and the number of elements in the array as return value. The `struct confd_type_cbs` is defined as:

```c
struct confd_type_cbs {
    char *typepoint;
    struct confd_type *type;
};
```

These structures are then used by ConfD to locate the implementation of a given type, by searching for a `typepoint` string that matches the `tailf:typepoint` argument in the YANG data model.

> **Note**
>
> Since our callbacks are executed directly by the ConfD daemon, it is critically important that they do not have a negative impact on the daemon. No other processing can be done by ConfD while the callbacks are executed, and e.g. a NULL pointer dereference in one of the callbacks will cause ConfD to crash. Thus they should be simple, purely algorithmic functions, never referencing any external resources.

> **Note**
>
> When user-defined types are present, the ConfD daemon also needs to load the libconfd.so shared library, otherwise used only by applications. This means that either this library must be in one of the system directories that are searched by the OS runtime loader (typically /lib and /usr/lib), or its location must be given by setting the LD\_LIBRARY\_PATH environment variable before starting ConfD, or the default location $CONFD\_DIR/lib is used, where $CONFD\_DIR is the installation directory of ConfD.

The above is enough for ConfD to use the types that we have defined, but the libconfd library can also do local string<->value translation if we have loaded the schema information, as described in the [USING SCHEMA INFORMATION](section3.md#confd_types.using_schema_information) section below. For this to work for user-defined types, we must register the type definitions with the library, using one of these functions:

```
int confd_register_ns_type(
uint32_t nshash, const char *name, struct confd_type *type);
```

Here we must pass the hash value for the namespace where the type is defined as `nshash`, and the name of the type from a `typedef` statement (i.e. _not_ the typepoint name if they are different) as `name`. Thus we can not use this function to register a user-defined type that is specified "inline" in a `leaf` or `leaf-list` statement, since we don't have a name for the type.

```
int confd_register_node_type(
struct confd_cs_node *node, struct confd_type *type);
```

This function takes a pointer to a schema node (see the section [USING SCHEMA INFORMATION](section3.md#confd_types.using_schema_information)) that uses the type instead of namespace and type name. It is necessary to use this for registration of user-defined types that are specified "inline", but it can also be used for user-defined types specified via `typedef`. In the latter case it will be equivalent to calling `confd_register_ns_type()` for the typedef, i.e. a single registration will apply to all nodes using the typedef.

The functions can only be called _after_ `confd_load_schemas()` or `maapi_load_schemas()` (see below) has been called, and if `confd_load_schemas()`/ `maapi_load_schemas()` is called again, the registration must be re-done. The `misc/user_type` example shows a way to use the exact same code for the shared object and for this registration.

Schema upgrades when the data is stored in CDB requires special consideration for user-defined types. Normally CDB can handle any type changes automatically, and this is true also when changing to/from/between user-defined types, provided that the following requirements are fulfilled:

1. A given typepoint name always refers to the exact same implementation - i.e. same value representation, same range restrictions, etc.
2. Shared objects providing implementations for all the typepoint ids used in the new _and_ the old schema are made available to ConfD.

I.e. if we change the implementation of a type, we also change the typepoint name, and keep the old implementation around. If requirement 1 isn't fulfilled, we can end up with the case of e.g. a changed value representation between schema versions even though the types are indistinguishable for CDB. This can still be handled by using MAAPI to modify CDB during the upgrade as described in the User Guide, but if that is not done, CDB will just carry the old values over, which in effect results in a corrupt database.

### Using Schema Information

Schema information from the data model can be loaded from the ConfD daemon at runtime using the `maapi_load_schemas()` function, see the [confd\_lib\_maapi(3)](section3.md#confd_lib_maapi) manual page. Information for all namespaces loaded into ConfD is then made available. In many cases it may be more convenient to use the `confd_load_schemas()` utility function. For details about this function and those discussed below, see [confd\_lib\_lib(3)](section3.md#confd_lib_lib). After loading the data, we can call `confd_get_nslist()` to find which namespaces are known to the library as a result.

Note that all pointers returned (directly or indirectly) by the functions discussed here reference dynamically allocated memory maintained by the library - they will become invalid if `confd_load_schemas()` or `maapi_load_schemas()` is subsequently called again.

The [confdc(1)](section1.md#confdc) compiler can also optionally generate a C header file that has #define symbols for the integer values corresponding to data model nodes and enumerations.

When the schema information has been made available to the library, we can format an arbitrary instance of a `confd_value_t` value using `confd_pp_value()` or `confd_ns_pp_value()`, or an arbitrary hkeypath using `confd_pp_kpath()` or `confd_xpath_pp_kpath()`. We can also get a pointer to the string representing a data model node using `confd_hash2str()`.

Furthermore a tree representation of the data model is available, which contains a `struct confd_cs_node` for every node in the data model. There is one tree for each namespace that has toplevel elements.

```
/* flag bits in confd_cs_node_info */
#define CS_NODE_IS_LIST             (1 << 0)
#define CS_NODE_IS_WRITE            (1 << 1)
#define CS_NODE_IS_CDB              (1 << 2)
#define CS_NODE_IS_ACTION           (1 << 3)
#define CS_NODE_IS_PARAM            (1 << 4)
#define CS_NODE_IS_RESULT           (1 << 5)
#define CS_NODE_IS_NOTIF            (1 << 6)
#define CS_NODE_IS_CASE             (1 << 7)
#define CS_NODE_IS_CONTAINER        (1 << 8)
#define CS_NODE_HAS_WHEN            (1 << 9)
#define CS_NODE_HAS_DISPLAY_WHEN    (1 << 10)
#define CS_NODE_HAS_META_DATA       (1 << 11)
#define CS_NODE_IS_WRITE_ALL        (1 << 12)
#define CS_NODE_IS_LEAF_LIST        (1 << 13)
#define CS_NODE_IS_LEAFREF          (1 << 14)
#define CS_NODE_HAS_MOUNT_POINT     (1 << 15)
#define CS_NODE_IS_STRING_AS_BINARY (1 << 16)
#define CS_NODE_IS_DYN CS_NODE_IS_LIST /* backwards compat */

/* cmp values in confd_cs_node_info */
#define CS_NODE_CMP_NORMAL        0
#define CS_NODE_CMP_SNMP          1
#define CS_NODE_CMP_SNMP_IMPLIED  2
#define CS_NODE_CMP_USER          3
#define CS_NODE_CMP_UNSORTED      4

struct confd_cs_node_info {
    uint32_t *keys;
    int minOccurs;
    int maxOccurs;   /* -1 if unbounded */
    enum confd_vtype shallow_type;
    struct confd_type *type;
    confd_value_t *defval;
    struct confd_cs_choice *choices;
    int flags;
    uint8_t cmp;
    struct confd_cs_meta_data *meta_data;
};

struct confd_cs_meta_data {
    char* key;
    char* value;
};

struct confd_cs_node {
    uint32_t tag;
    uint32_t ns;
    struct confd_cs_node_info info;
    struct confd_cs_node *parent;
    struct confd_cs_node *children;
    struct confd_cs_node *next;
    void *opaque;   /* private user data */
};

struct confd_cs_choice {
    uint32_t tag;
    uint32_t ns;
    int minOccurs;
    struct confd_cs_case *default_case;
    struct confd_cs_node *parent;         /* NULL if parent is case */
    struct confd_cs_case *cases;
    struct confd_cs_choice *next;
    struct confd_cs_case *case_parent;    /* NULL if parent is node */
};

struct confd_cs_case {
    uint32_t tag;
    uint32_t ns;
    struct confd_cs_node *first;
    struct confd_cs_node *last;
    struct confd_cs_choice *parent;
    struct confd_cs_case *next;
    struct confd_cs_choice *choices;
};
```

Each `confd_cs_node` is linked to its related nodes: `parent` is a pointer to the parent node, `next` is a pointer to the next sibling node, and `children` is a pointer to the first child node - for each of these, a NULL pointer has the obvious meaning.

Each `confd_cs_node` also contains an information structure: For a list node, the `keys` field is a zero-terminated array of integers - these are the `tag` values for the children nodes that are key elements. This makes it possible to find the name of a key element in a keypath. If the `confd_cs_node` is not a list node, the `keys` field is NULL. The `shallow_type` field gives the "primitive" type for the element, i.e. the `enum confd_vtype` value that is used in the `confd_value_t` representation.

Typed leaf nodes also carry a complete type definition via the `type` pointer, which can be used with the `conf_str2val()` and `confd_val2str()` functions, as well as the leaf's default value (if any) via the `defval` pointer.

If the YANG `choice` statement is used in the data model, additional structures are created by the schema loading. For list and container nodes that have `choice` statements, the `choices` element in `confd_cs_node_info` is a pointer to a linked list of `confd_cs_choice` structures representing the choices. Each `confd_cs_choice` has a pointer to the parent node and a `cases` pointer to a linked list of `confd_cs_case` structures representing the cases for that choice. Finally, each `confd_cs_case` structure has pointers to the parent `confd_cs_choice` structure, and to the `confd_cs_node` structures representing the first and last element in the case. Those `confd_cs_node` structures, i.e. the "toplevel" elements of a case, have the CS\_NODE\_IS\_CASE flag set. Note that it is possible for a case to be "empty", i.e. there are no elements in the case - then the `first` and `last` pointers in the `confd_cs_case` structure are NULL.

For a list node, the sort order is indicated by the `cmp` element in `confd_cs_node_info`. The value CS\_NODE\_CMP\_NORMAL means an ordinary, system ordered, list. CS\_NODE\_CMP\_SNMP is system ordered, but ordered according to SNMP lexicographical order, and CS\_NODE\_CMP\_SNMP\_IMPLIED is an SNMP lexicographical order where the last key has an IMPLIED keyword. CS\_NODE\_CMP\_UNSORTED is system ordered, but is not sorted. The value CS\_NODE\_CMP\_USER denotes an "ordered-by user" list.

If the `tailf:meta-data` extension is used for a node, the `meta_data` element points to an array of `struct confd_cs_meta_data`, otherwise it is NULL. In the array, the `key` element is the argument of `tailf:meta-data`, and the `value` element is the argument of the `tailf:meta-value` substatement, if any - otherwise it is NULL. The end of the array is indicated by a struct where the `key` element is NULL.

Action and notification specifications are included in the tree in the same way as the config/data elements - they are indicated by the CS\_NODE\_IS\_ACTION flag being set on the action node, and the CS\_NODE\_IS\_NOTIF flag being set on the notification node, respectively. Furthermore the nodes corresponding to the sub-statements of the action's `input` statement have the CS\_NODE\_IS\_PARAM flag set, and those corresponding to the sub-statements of the action's `output` statement have the CS\_NODE\_IS\_RESULT flag set. Note that the `input` and `output` statements do not have corresponding nodes in the tree.

The `confd_find_cs_root()` function returns the root of the tree for a given namespace, and the `confd_find_cs_node()`, `confd_find_cs_node_child()`, and `confd_cs_node_cd()` functions are useful for navigating the tree. Assume that we have the following data model:

```
container servers {
  list server {
    key name;
    max-elements 64;
    leaf name {
      type string;
    }
    leaf ip {
      type inet:ip-address;
    }
    leaf port {
      type inet:port-number;
    }
  }
}
```

Then, given the keypath /servers/server{www} in `confd_hkeypath_t` form, a call to `confd_find_cs_node()` would return a `struct confd_cs_node`, i.e. a pointer into the tree, as in:

```
struct confd_cs_node *csp;
char *name;
csp = confd_find_cs_node(mykeypath, mykeypath->len);
name = confd_hash2str(csp->info.keys[0])
```

and the C variable `name` will have the value `"name"`. These functions make it possible to format keypaths in various ways.

If we have a keypath which identifies a node below the one we are interested in, such as /servers/server{www}/ip, we can use the `len` parameter as in `confd_find_cs_node(kp, 3)` where `3` is the length of the keypath we wish to consider.

The equivalent of the above `confd_find_cs_node()` example, but using a string keypath, could be written as:

```
csp = confd_cs_node_cd(confd_find_cs_root(mynamespace),
                       "/servers/server{www}");
```

The `type` field in the `struct confd_cs_node_info` can be used for data model aware string <-> value translations. E.g. assuming that we have a `confd_hkeypath_t *kp` representing the element /servers/server{www}/ip, we can do the following:

```
confd_value_t v;
csp = confd_find_cs_node(kp, kp->len);
confd_str2val(csp->info.type, "10.0.0.1", &v);
```

The `confd_value_t v` will then be filled in with the corresponding C\_IPV4 value. This technique is generally necessary for translating C\_ENUM\_VALUE values to the corresponding strings (or vice versa), since there isn't a type-independent mapping. But `confd_val2str()` (or `confd_str2val()`) can always do the translation, since it is given the full type information. E.g. this will store the string "nonVolatile" in `buf`:

```
confd_value_t v;
char buf[64];

CONFD_SET_ENUM_VALUE(&v, 3);
root = confd_find_cs_root(SNMP_COMMUNITY_MIB__ns);
csp = confd_cs_node_cd(root, "/SNMP-COMMUNITY-MIB/snmpCommunityTable/"
                       "snmpCommunityEntry/snmpCommunityStorageType");
confd_val2str(csp->info.type, &v, buf, sizeof(buf));
```

The type information can also be found by using the `confd_find_ns_type()` function to look up the type name as a string in the namespace where it is defined - i.e. we could alternatively have achieved the same result with:

```
CONFD_SET_ENUM_VALUE(&v, 3);
type = confd_find_ns_type(SNMPv2_TC__ns, "StorageType");
confd_val2str(type, &v, buf, sizeof(buf));
```

If we give `0` for the `nshash` argument to `confd_find_ns_type()`, the type name will be looked up among the ConfD built-in types (i.e. the YANG built-in types, the types defined in the YANG "tailf-common" module, and the types defined in the pre-defined "confd" and/or "xs" namespaces) - e.g. the type information for /servers/server{www}/name could be found with `confd_find_ns_type(0, "string")`.

### Xml Structures

Three different methods are used to represent a subtree of data nodes. ["Value Array"](section3.md#confd_types.xml_structures.array) describes a format that is simpler but has some limitations, while ["Tagged Value Array"](section3.md#confd_types.xml_structures.tagged_array) and ["Tagged Value Attribute Array"](section3.md#confd_types.xml_structures.tagged_attr_array) describe formats that are more complex but can represent an arbitrary subtree.

#### Value Array

The simpler format is an array of `confd_value_t` elements corresponding to the complete contents of a list entry or container. The content of sub-list entries cannot be represented. The array is populated through a "depth first" traversal of the data tree as follows:

1. Optional leafs or `presence` containers that do not exist use a single array element, with type C\_NOEXISTS (value ignored).
2. List nodes use a single array element, with type C\_NOEXISTS (value ignored), regardless of the actual number of entries or their contents.
3. Leaf-list nodes use a single array element, with type C\_LIST and the leaf-list elements as values.
4. Leafs with a type other than `empty` use an array element with their type and value as usual. If type `empty` is placed in a `union`, then an array element is still used.
5. Leafs of type `empty` use an array element with type C\_XMLTAG, and `tag` and `ns` set according to the leaf name. Unless type `empty` is placed in a `union` as per above.
6. Containers use one array element with type C\_XMLTAG, and `tag` and `ns` set according to the element name, followed by array elements for the sub-nodes according to this list.

Note that the list or container node corresponding to the complete array is not included in the array, and that there is no array element for the "end" of a container.

As an example, the array corresponding to the /servers/server{www} list entry above could be populated as:

```
confd_value_t v[3];
struct in_addr ip;

CONFD_SET_STR(&v[0], "www");
ip.s_addr = inet_addr("192.168.1.2");
CONFD_SET_IPV4(&v[1], ip);
CONFD_SET_UINT16(&v[2], 80);
```

#### Tagged Value Array

This format uses an array of `confd_tag_value_t` elements. This is a structure defined as:

```c
typedef struct confd_tag_value {
    struct xml_tag tag;
    confd_value_t v;
} confd_tag_value_t;
```

I.e. each value element is associated with the `struct xml_tag` that identifies the node in the data model. The `ns` element of the `struct xml_tag` can normally be set to 0, with the meaning "current namespace". The array is populated, normally through a "depth first" traversal of the data tree, as follows:

1. Optional leafs or `presence` containers that do not exist are omitted entirely from the array.
2. List and container nodes use one array element where the value has type C\_XMLBEGIN, and `tag` and `ns` set according to the node name, followed by array elements for the sub-nodes according to this list, followed by one array element where the value has type C\_XMLEND, and `tag` and `ns` set according to the node name.
3. Leaf-list nodes use a single array element, with type C\_LIST and the leaf-list elements as values.
4. Leafs with a type other than `empty` use an array element with their type and value as usual. If type `empty` is placed in a `union`, then an array element is still used.
5. Leafs of type `empty` use an array element with type C\_XMLTAG, and `tag` and `ns` set according to the leaf name. Unless type `empty` is placed in a `union` as per above.

Note that the list or container node corresponding to the complete array is not included in the array. In some usages, non-optional nodes may also be omitted from the array - refer to the relevant API documentation to see whether this is allowed and the semantics of doing so.

A set of CONFD\_SET\_TAG\_XXX() macros corresponding to the CONFD\_SET\_XXX() macros described above are provided - these set the `ns` element to 0 and the `tag` element to their second argument. The array corresponding to the /servers/server{www} list entry above could be populated as:

```
confd_tag_value_t tv[3];
struct in_addr ip;

CONFD_SET_TAG_STR(&tv[0], servers_name, "www");
ip.s_addr = inet_addr("192.168.1.2");
CONFD_SET_TAG_IPV4(&tv[1], servers_ip, ip);
CONFD_SET_TAG_UINT16(&tv[2], servers_port, 80);
```

There are also macros to access the components of the `confd_tag_value_t` elements:

```
confd_tag_value_t tv;
uint16_t port;

if (CONFD_GET_TAG_TAG(&tv) == servers_port)
    port = CONFD_GET_UINT16(CONFD_GET_TAG_VALUE(&tv));
```

#### Tagged Value Attribute Array

This format uses an array of `confd_tag_value_attr_t` elements. This is a structure defined as:

```c
typedef struct confd_tag_value_attr {
    struct xml_tag tag;
    confd_value_t v;
    confd_attr_value_t *attrs;
    int num_attrs;
} confd_tag_value_attr_t;
```

I.e. the difference from Tagged Value Array is that not only the value element is associated with the `struct xml_tag` but also the attribute element. The `attrs` element should point to an array with `num_attrs` elements of `confd_attr_value_t` - for a node without attributes, these should be given as NULL and 0, respectively.

Attributes for a container are given for the C\_XMLBEGIN array element that indicates the start of the container, and attributes for a list entry are given for the array element that represents the first key leaf for the list (key leafs do not have attributes).

A set of CONFD\_SET\_TAG\_ATTR\_XXX() macros corresponding to the CONFD\_SET\_TAG\_XXX() macros described above are provided - these set the `attrs` element to their forth argument and the `num_attrs` element to their fifth argument. The array corresponding to the /servers/server{www} list entry above could be populated as:

```
confd_tag_value_attr_t tva[3];
struct in_addr ip;
confd_attr_value_t origin;

origin.attr = CONFD_ATTR_ORIGIN;
struct confd_identityref idref = {.ns = or__ns, .id = or_system};
CONFD_SET_IDENTITYREF(&origin.v, idref);

CONFD_SET_TAG_ATTR_STR(&tva[0], servers_name, "www", NULL, 0);
ip.s_addr = inet_addr("192.168.1.2");
CONFD_SET_TAG_ATTR_IPV4(&tva[1], servers_ip, ip, &origin, 1);
CONFD_SET_TAG_ATTR_UINT16(&tva[2], servers_port, 80, &origin, 1);
        
```

### Data Model Types

This section describes the types that can be used in YANG data modeling, and their C representation. Also listed is the corresponding SMIv2 type, which is used when a data model is translated into a MIB. In several cases, the data model type cannot easily be translated into a native SMIv2 type. In those cases, the type `OCTET STRING` is used in the translation. The SNMP agent in ConfD will in those cases send the string representation of the value over SNMP. For example, the `xs:float` value `3.14` is sent as the string "3.14".

These subsections describe the following sets of types, which can be used with YANG data modeling:

* [YANG built-in types](section3.md#confd_types.data_model.yang_builtin_types)
* [The ietf-yang-types YANG module](section3.md#confd_types.data_model.ietf_yang_types)
* [The ietf-inet-types YANG module](section3.md#confd_types.data_model.ietf_inet_types)
* [The tailf-common YANG module](section3.md#confd_types.data_model.tailf_common)
* [The tailf-xsd-types YANG module](section3.md#confd_types.data_model.tailf_xsd_types)

#### YANG built-in types

These types are built-in to the YANG language, and also built-in to ConfD.

`int8`

> A signed 8-bit integer.
>
> * `value.type` = C\_INT8
> * union element = `i8`
> * C type = `int8_t`
> * SMIv2 type = `Integer32 (-128 .. 127)`

`int16`

> A signed 16-bit integer.
>
> * `value.type` = C\_INT16
> * union element = `i16`
> * C type = `int16_t`
> * SMIv2 type = `Integer32 (-32768 .. 32767)`

`int32`

> A signed 32-bit integer.
>
> * `value.type` = C\_INT32
> * union element = `i32`
> * C type = `int32_t`
> * SMIv2 type = `Integer32`

`int64`

> A signed 64-bit integer.
>
> * `value.type` = C\_INT64
> * union element = `i64`
> * C type = `int64_t`
> * SMIv2 type = `OCTET STRING`

`uint8`

> An unsigned 8-bit integer.
>
> * `value.type` = C\_UINT8
> * union element = `u8`
> * C type = `uint8_t`
> * SMIv2 type = `Unsigned32 (0 .. 255)`

`uint16`

> An unsigned 16-bit integer.
>
> * `value.type` = C\_UINT16
> * union element = `u16`
> * C type = `uint16_t`
> * SMIv2 type = `Unsigned32 (0 .. 65535)`

`uint32`

> An unsigned 32-bit integer.
>
> * `value.type` = C\_UINT32
> * union element = `u32`
> * C type = `uint32_t`
> * SMIv2 type = `Unsigned32`

`uint64`

> An unsigned 64-bit integer.
>
> * `value.type` = C\_UINT64
> * union element = `u64`
> * C type = `uint64_t`
> * SMIv2 type = `OCTET STRING`

`decimal64`

> A decimal number with 64 bits of precision. The C representation uses a struct with a 64-bit signed integer for the scaled value, and an unsigned 8-bit integer in the range 1..18 for the number of fraction digits specified by the `fraction-digits` sub-statement.
>
> * `value.type` = C\_DECIMAL64
> * union element = `d64`
> * C type = `struct confd_decimal64`
> * SMIv2 type = `OCTET STRING`

`string`

> The `string` type is represented as a struct `confd_buf_t` when _received_ from ConfD in the C code. I.e. it is NUL-terminated and also has a size given.
>
> However, when the C code wants to produce a value of the `string` type it is possible to use a `confd_value_t` with the value type C\_BUF or C\_STR (which requires a NUL-terminated string)
>
> * `value.type` = C\_BUF
> * union element = `buf`
> * C type = `confd_buf_t`
> * SMIv2 type = `OCTET STRING`

`boolean`

> The boolean values "true" and "false".
>
> * `value.type` = C\_BOOL
> * union element = `boolean`
> * C type = `int`
> * SMIv2 type = `TruthValue`

`enumeration`

> Enumerated strings with associated numeric values. The C representation uses the numeric values.
>
> * `value.type` = C\_ENUM\_VALUE
> * union element = `enumvalue`
> * C type = `int32_t`
> * SMIv2 type = `INTEGER`

`bits`

> A set of bits or flags. Depending on the highest argument given to a `position` sub-statement, the C representation uses either C\_BIT32, C\_BIT64, or C\_BITBIG.
>
> * `value.type` = C\_BIT32, C\_BIT64, or C\_BITBIG
> * union element = `b32`, `b64`, or `buf`
> * C type = `uint32_t`, `uint64_t`, or `confd_buf_t`
> * SMIv2 type = `Unsigned32` or `OCTET STRING`

`binary`

> Any binary data.
>
> * `value.type` = C\_BINARY
> * union element = `buf`
> * C type = `confd_buf_t`
> * SMIv2 type = `OCTET STRING`

`identityref`

> A reference to an abstract identity.
>
> * `value.type` = C\_IDENTITYREF
> * union element = `idref`
> * C type = `struct confd_identityref`
> * SMIv2 type = `OCTET STRING`

`union`

> The `union` type has no special `confd_value_t` representation - elements are represented as one of the member types according to the current value instantiation. This means that for unions that comprise different "primitive" types, applications must check the `type` element to determine the type, and the type safe alternatives to the `cdb_get()` and `maapi_get_elem()` functions can not be used.
>
> Note that the YANG specification stipulates that when a value of type `union` is validated, the _first_ matching member type should be chosen. Consider this YANG fragment:
>
> ```
> leaf uni {
>   type union {
>     type int32;
>     type int64;
>   }
> }
> ```
>
> If we set the leaf to the value `2`, it should thus be of type `int32`, not type `int64`. This is enforced when ConfD converts a string to an internal value, but not when setting values "directly" via e.g. `maapi_set_elem()` or `cdb_set_elem()`. It is thus possible to set the leaf to a `C_INT64` with the value `2`, but this is formally an invalid value.
>
> Applications setting values of type `union` must thus take care to choose the member type correctly, or alternatively provide the value as a string via one of the functions `maapi_set_elem2()`, `cdb_set_elem2()`, or `confd_str2val()`. These functions will always turn the string "2" into a `C_INT32` with the above definition.
>
> The SMIv2 type is an `OCTET STRING`.

`instance-identifier`

> The instance-identifier built-in type is used to uniquely identify a particular instance node in the data tree. The syntax for an instance-identifier is a subset of the XPath abbreviated syntax.
>
> * `value.type` = C\_OBJECTREF
> * union element = `hkp`
> * C type = `confd_hkeypath_t`
> * SMIv2 type = `OCTET STRING`

**The `leaf-list` statement**

The values of a YANG `leaf-list` node is represented as an element with a list of values of the type given by the `type` sub-statement.

* `value.type` = C\_LIST
* union element = `list`
* C type = `struct confd_list`
* SMIv2 type = `OCTET STRING`

#### The ietf-yang-types YANG module

This module contains a collection of generally useful derived YANG data types. They are defined in the [urn:ietf:params:xml:ns:yang:ietf-yang-types](urn:ietf:params:xml:ns:yang:ietf-yang-types) namespace.

`yang:counter32, yang:zero-based-counter32`

> 32-bit counters, corresponding to the Counter32 type and the ZeroBasedCounter32 textual convention of the SMIv2.
>
> * `value.type` = C\_UINT32
> * union element = `u32`
> * C type = `uint32_t`
> * SMIv2 type = `Counter32`

`yang:counter64, yang:zero-based-counter64`

> 64-bit counters, corresponding to the Counter64 type and the ZeroBasedCounter64 textual convention of the SMIv2.
>
> * `value.type` = C\_UINT64
> * union element = `u64`
> * C type = `uint64_t`
> * SMIv2 type = `Counter64`

`yang:gauge32`

> 32-bit gauge value, corresponding to the Gauge32 type of the SMIv2.
>
> * `value.type` = C\_UINT32
> * union element = `u32`
> * C type = `uint32_t`
> * SMIv2 type = `Counter32`

`yang:gauge64`

> 64-bit gauge value, corresponding to the CounterBasedGauge64 SMIv2 textual convention.
>
> * `value.type` = C\_UINT64
> * union element = `u64`
> * C type = `uint64_t`
> * SMIv2 type = `Counter64`

`yang:object-identifier, yang:object-identifier-128`

> An SNMP OBJECT IDENTIFIER (OID). This is a sequence of integers which identifies an object instance for example "1.3.6.1.4.1.24961.1".
>
> > \[!NOTE] The `tailf:value-length` restriction is measured in integer elements for `object-identifier` and `object-identifier-128`.
>
> * `value.type` = C\_OID
> * union element = `oidp`
> * C type = `confd_snmp_oid`
> * SMIv2 type = `OBJECT IDENTIFIER`

`yang:yang-identifier`

> A YANG identifier string as defined by the 'identifier' rule in Section 12 of RFC 6020.
>
> * `value.type` = C\_BUF
> * union element = `buf`
> * C type = `confd_buf_t`
> * SMIv2 type = `OCTET STRING`

`yang:date-and-time`

> The date-and-time type is a profile of the ISO 8601 standard for representation of dates and times using the Gregorian calendar.
>
> * `value.type` = C\_DATETIME
> * union element = `datetime`
> * C type = `struct confd_datetime`
> * SMIv2 type = `DateAndTime`

`yang:timeticks, yang:timestamp`

> Time ticks and time stamps, measured in hundredths of seconds. Corresponding to the TimeTicks type and the TimeStamp textual convention of the SMIv2.
>
> * `value.type` = C\_UINT32
> * union element = `u32`
> * C type = `uint32_t`
> * SMIv2 type = `Counter32`

`yang:phys-address`

> Represents media- or physical-level addresses represented as a sequence octets, each octet represented by two hexadecimal digits. Octets are separated by colons.
>
> > \[!NOTE] The `tailf:value-length` restriction is measured in number of octets for `phys-address`.
>
> * `value.type` = C\_BINARY
> * union element = `buf`
> * C type = `confd_buf_t`
> * SMIv2 type = `OCTET STRING`

`yang:mac-address`

> The mac-address type represents an IEEE 802 MAC address.
>
> The length of the ConfD C\_BINARY representation is always 6.
>
> * `value.type` = C\_BINARY
> * union element = `buf`
> * C type = `confd_buf_t`
> * SMIv2 type = `OCTET STRING`

`yang:xpath1.0`

> This type represents an XPATH 1.0 expression.
>
> * `value.type` = C\_BUF
> * union element = `buf`
> * C type = `confd_buf_t`
> * SMIv2 type = `OCTET STRING`

`yang:hex-string`

> A hexadecimal string with octets represented as hex digits separated by colons.
>
> > \[!NOTE] The `tailf:value-length` restriction is measured in number of octets for `hex-string`.
>
> * `value.type` = C\_HEXSTR
> * union element = `buf`
> * C type = `confd_buf_t`
> * SMIv2 type = `OCTET STRING`

`yang:uuid`

> A Universally Unique Identifier in the string representation defined in RFC 4122.
>
> * `value.type` = C\_BUF
> * union element = `buf`
> * C type = `confd_buf_t`
> * SMIv2 type = `OCTET STRING`

`yang:dotted-quad`

> An unsigned 32-bit number expressed in the dotted-quad notation.
>
> * `value.type` = C\_DQUAD
> * union element = `dquad`
> * C type = `struct confd_dotted_quad`
> * SMIv2 type = `OCTET STRING`

#### The ietf-inet-types YANG module

This module contains a collection of generally useful derived YANG data types for Internet addresses and related things. They are defined in the [urn:ietf:params:xml:ns:yang:inet-types](urn:ietf:params:xml:ns:yang:inet-types) namespace.

`inet:ip-version`

> This value represents the version of the IP protocol.
>
> * `value.type` = C\_ENUM\_VALUE
> * union element = `enumvalue`
> * C type = `int32_t`
> * SMIv2 type = `INTEGER`

`inet:dscp`

> The dscp type represents a Differentiated Services Code-Point.
>
> * `value.type` = C\_UINT8
> * union element = `u8`
> * C type = `uint8_t`
> * SMIv2 type = `Unsigned32 (0 .. 255)`

`inet:ipv6-flow-label`

> The flow-label type represents flow identifier or Flow Label in an IPv6 packet header.
>
> * `value.type` = C\_UINT32
> * union element = `u32`
> * C type = `uint32_t`
> * SMIv2 type = `Unsigned32`

`inet:port-number`

> The port-number type represents a 16-bit port number of an Internet transport layer protocol such as UDP, TCP, DCCP or SCTP.
>
> The value space and representation is identical to the built-in `uint16` type.

`inet:as-number`

> The as-number type represents autonomous system numbers which identify an Autonomous System (AS).
>
> The value space and representation is identical to the built-in `uint32` type.

`inet:ip-address`

> The ip-address type represents an IP address and is IP version neutral. The format of the textual representations implies the IP version.
>
> This is a `union` of the `inet:ipv4-address` and `inet:ipv6-address` types defined below. The representation is thus identical to the representation for one of these types.
>
> The SMIv2 type is an `OCTET STRING (SIZE (4|16))`.

`inet:ipv4-address`

> The ipv4-address type represents an IPv4 address in dotted-quad notation.
>
> The use of a zone index is not supported by ConfD.
>
> * `value.type` = C\_IPV4
> * union element = `ip`
> * C type = `struct in_addr`
> * SMIv2 type = `IpAddress`

`inet:ipv6-address`

> The ipv6-address type represents an IPv6 address in full, mixed, shortened and shortened mixed notation.
>
> The use of a zone index is not supported by ConfD.
>
> * `value.type` = C\_IPV6
> * union element = `ip6`
> * C type = `struct in6_addr`
> * SMIv2 type = `IPV6-MIB:Ipv6Address`

`inet:ip-prefix`

> The ip-prefix type represents an IP prefix and is IP version neutral. The format of the textual representations implies the IP version.
>
> This is a `union` of the `inet:ipv4-prefix` and `inet:ipv6-prefix` types defined below. The representation is thus identical to the representation for one of these types.
>
> The SMIv2 type is an `OCTET STRING (SIZE (5|17))`.

`inet:ipv4-prefix`

> The ipv4-prefix type represents an IPv4 address prefix. The prefix length is given by the number following the slash character and must be less than or equal to 32.
>
> A prefix length value of n corresponds to an IP address mask which has n contiguous 1-bits from the most significant bit (MSB) and all other bits set to 0.
>
> The IPv4 address represented in dotted quad notation must have all bits that do not belong to the prefix set to zero.
>
> An example: 10.0.0.0/8
>
> * `value.type` = C\_IPV4PREFIX
> * union element = `ipv4prefix`
> * C type = `struct confd_ipv4_prefix`
> * SMIv2 type = `OCTET STRING (SIZE (5))`

`inet:ipv6-prefix`

> The ipv6-prefix type represents an IPv6 address prefix. The prefix length is given by the number following the slash character and must be less than or equal 128.
>
> A prefix length value of n corresponds to an IP address mask which has n contiguous 1-bits from the most significant bit (MSB) and all other bits set to 0.
>
> The IPv6 address must have all bits that do not belong to the prefix set to zero.
>
> An example: 2001:DB8::1428:57AB/125
>
> * `value.type` = C\_IPV6PREFIX
> * union element = `ipv6prefix`
> * C type = `struct confd_ipv6_prefix`
> * SMIv2 type = `OCTET STRING (SIZE (17))`

`inet:domain-name`

> The domain-name type represents a DNS domain name. The name SHOULD be fully qualified whenever possible.
>
> * `value.type` = C\_BUF
> * union element = `buf`
> * C type = `confd_buf_t`
> * SMIv2 type = `OCTET STRING`

`inet:host`

> The host type represents either an IP address or a DNS domain name.
>
> This is a `union` of the `inet:ip-address` and `inet:domain-name` types defined above. The representation is thus identical to the representation for one of these types.
>
> The SMIv2 type is an `OCTET STRING`, which contains the textual representation of the domain name or address.

`inet:uri`

> The uri type represents a Uniform Resource Identifier (URI) as defined by STD 66.
>
> * `value.type` = C\_BUF
> * union element = `buf`
> * C type = `confd_buf_t`
> * SMIv2 type = `OCTET STRING`

#### The iana-crypt-hash YANG module

This module defines a type for storing passwords using a hash function, and features to indicate which hash functions are supported by an implementation. The type is defined in the [urn:ietf:params:xml:ns:yang:iana-crypt-hash](urn:ietf:params:xml:ns:yang:iana-crypt-hash) namespace.

`ianach:crypt-hash`

> The crypt-hash type is used to store passwords using a hash function. The algorithms for applying the hash function and encoding the result are implemented in various UNIX systems as the function crypt(3). A value of this type matches one of the forms:
>
> ```
> $0$<clear text password>
> $<id>$<salt>$<password hash>
> $<id>$<parameter>$<salt>$<password hash>
> ```
>
> The "$0$" prefix indicates that the value is clear text. When such a value is received by the server, a hash value is calculated, and the string "$\<id>$\<salt>$" or $\<id>$\<parameter>$\<salt>$ is prepended to the result. This value is stored in the configuration data store.
>
> If a value starting with "$\<id>$", where \<id> is not "0", is received, the server knows that the value already represents a hashed value, and stores it "as is" in the data store. Note that the "as is" behavior may cause confusion if a value that does not conform to the regular expression pattern is entered for the SHA-256 or SHA-512 types. The expectation may be that value would be rejected as it would for values of other types, but special processing in the Tail-f implementation will accept the values as entered (i.e. "as-is") in order to conform to the RFC.
>
> In the Tail-f implementation, this type is logically a union of the types tailf:md5-digest-string, tailf:sha-256-digest-string, and tailf:sha-512-digest-string - see the section [The tailf-common YANG module](section3.md#confd_types.data_model.tailf_common) below. All the hashed values of these types are accepted, and the choice of algorithm to use for hashing clear text is specified via the /confdConfig/cryptHash/algorithm parameter in `confd.conf` (see [confd.conf(5)](section5.md#ncs.conf)). If the algorithm is set to "sha-256" or "sha-512", it can be tuned via the /confdConfig/cryptHash/rounds parameter in `confd.conf`.
>
> * `value.type` = C\_BUF
> * union element = `buf`
> * C type = `confd_buf_t`
> * SMIv2 type = `OCTET STRING`

#### The tailf-common YANG module

This module defines Tail-f common YANG types, that are built-in to ConfD.

`tailf:size`

> A value that represents a number of bytes. An example could be S1G8M7K956B; meaning 1GB+8MB+7KB+956B = 1082138556 bytes. The value must start with an S. Any byte magnifier can be left out, i.e. S1K1B equals 1025 bytes. The order is significant though, i.e. S1B56G is not a valid byte size.
>
> The value space and representation is identical to the built-in `uint64` type.

`tailf:octet-list`

> A list of dot-separated octets for example "192.168.255.1.0".
>
> > \[!NOTE] The `tailf:value-length` restriction is measured in number of octets for `octet-list`.
>
> * `value.type` = C\_BINARY
> * union element = `buf`
> * C type = `confd_buf_t`
> * SMIv2 type = `OCTET STRING`

`tailf:hex-list`

> A list of colon-separated hexa-decimal octets for example "4F:4C:41:71".
>
> > \[!NOTE] The `tailf:value-length` restriction is measured in octets of binary data for `hex-list`.
>
> * `value.type` = C\_BINARY
> * union element = `buf`
> * C type = `confd_buf_t`
> * SMIv2 type = `OCTET STRING`

`tailf:md5-digest-string`

> The md5-digest-string type automatically computes a MD5 digest for a value adhering to this type.
>
> This is best explained using an example. Suppose we have a leaf:
>
> ```
> leaf key {
>   type tailf:md5-digest-string;
> }
> ```
>
> A valid configuration is:
>
> ```
> <key>$0$My plain text.</key>
> ```
>
> The "$0$" prefix indicates that this is plain text and that this value should be represented as a MD5 digest from now. ConfD computes a MD5 digest for the value and prepends "$1$\<salt>$", where \<salt> is a random eight character salt used to generate the digest. When this value later on is fetched from ConfD the following is returned:
>
> ```
> <key>$1$fB$ndk2z/PIS0S1SvzWLqTJb.</key>
> ```
>
> A value adhering to md5-digest-string must have "$0$" or a "$1$\<salt>$" prefix.
>
> The digest algorithm is the same as the md5 crypt function used for encrypting passwords for various UNIX systems, e.g. [http://www.freebsd.org/cgi/cvsweb.cgi/\~checkout\~/src/lib/libcrypt/crypt.c?rev=1.5\&content-type=text/plain](http://www.freebsd.org/cgi/cvsweb.cgi/~checkout~/src/lib/libcrypt/crypt.c?rev=1.5\&content-type=text/plain)
>
> > \[!NOTE] The `pattern` restriction can not be used with this type.
>
> * `value.type` = C\_BUF
> * union element = `buf`
> * C type = `confd_buf_t`
> * SMIv2 type = `OCTET STRING`

`tailf:sha-256-digest-string`

> The sha-256-digest-string type automatically computes a SHA-256 digest for a value adhering to this type. A value of this type matches one of the forms:
>
> ```
> $0$<clear text password>
> $5$<salt>$<password hash>
> $5$rounds=<number>$<salt>$<password hash>
> ```
>
> The "$0$" prefix indicates that this is plain text. When a plain text value is received by the server, a SHA-256 digest is calculated, and the string "$5$\<salt>$" is prepended to the result, where \<salt> is a random 16 character salt used to generate the digest. This value is stored in the configuration data store. The algorithm can be tuned via the /confdConfig/cryptHash/rounds parameter in `confd.conf` (see [confd.conf(5)](section5.md#ncs.conf)), which if set to a number other than the default will cause "$5$rounds=\<number>$\<salt>$" to be prepended instead of only "$5$\<salt>$".
>
> If a value starting with "$5$" is received, the server knows that the value already represents a SHA-256 digest, and stores it as is in the data store.
>
> The digest algorithm used is the same as the SHA-256 crypt function used for encrypting passwords for various UNIX systems, see e.g. [http://www.akkadia.org/drepper/SHA-crypt.txt](http://www.akkadia.org/drepper/SHA-crypt.txt)
>
> * `value.type` = C\_BUF
> * union element = `buf`
> * C type = `confd_buf_t`
> * SMIv2 type = `OCTET STRING`

`tailf:sha-512-digest-string`

> The sha-512-digest-string type automatically computes a SHA-512 digest for a value adhering to this type. A value of this type matches one of the forms:
>
> ```
> $0$<clear text password>
> $6$<salt>$<password hash>
> $6$rounds=<number>$<salt>$<password hash>
> ```
>
> The "$0$" prefix indicates that this is plain text. When a plain text value is received by the server, a SHA-512 digest is calculated, and the string "$6$\<salt>$" is prepended to the result, where \<salt> is a random 16 character salt used to generate the digest. This value is stored in the configuration data store. The algorithm can be tuned via the /confdConfig/cryptHash/rounds parameter in `confd.conf` (see [confd.conf(5)](section5.md#ncs.conf)), which if set to a number other than the default will cause "$6$rounds=\<number>$\<salt>$" to be prepended instead of only "$6$\<salt>$".
>
> If a value starting with "$6$" is received, the server knows that the value already represents a SHA-512 digest, and stores it as is in the data store.
>
> The digest algorithm used is the same as the SHA-512 crypt function used for encrypting passwords for various UNIX systems, see e.g. [http://www.akkadia.org/drepper/SHA-crypt.txt](http://www.akkadia.org/drepper/SHA-crypt.txt)
>
> * `value.type` = C\_BUF
> * union element = `buf`
> * C type = `confd_buf_t`
> * SMIv2 type = `OCTET STRING`

`tailf:des3-cbc-encrypted-string`

> > \[!NOTE] This type has been deprecated and will be removed in a future release. Please use a stronger algorithm such as tailf:aes-256-cfb-128-encrypted-string.
>
> The des3-cbc-encrypted-string type automatically encrypts a value adhering to this type using DES in CBC mode followed by a base64 conversion. If the value isn't encrypted already, that is.
>
> This is best explained using an example. Suppose we have a leaf:
>
> ```
> leaf enc {
>   type tailf:des3-cbc-encrypted-string;
> }
> ```
>
> A valid configuration is:
>
> ```
> <enc>$0$My plain text.</enc>
> ```
>
> The "$0$" prefix indicates that this is plain text. When a plain text value is received by the server, the value is DES3/Base64 encrypted, and the string "$7$" is prepended. The resulting string is stored in the configuration data store.
>
> When a value of this type is read, the encrypted value is always returned. In the example above, the following value could be returned:
>
> ```
> <enc>$7$Qxxsn8BVzxphCdflqRwZm6noKKmt0QoSWnRnhcXqocg=</enc>
> ```
>
> If a value starting with "$7$" is received, the server knows that the value is already encrypted, and stores it as is in the data store.
>
> A value adhering to this type must have a "$0$" or a "$7$" prefix.
>
> ConfD uses a configurable set of encryption keys to encrypt the string. For details, see the description of the encryptedStrings configurable in the [confd.conf(5)](section5.md#ncs.conf) manual page.
>
> > \[!NOTE] The `pattern` restriction can not be used with this type.
>
> * `value.type` = C\_BUF
> * union element = `buf`
> * C type = `confd_buf_t`
> * SMIv2 type = `OCTET STRING`

`tailf:aes-cfb-128-encrypted-string`

> The aes-cfb-128-encrypted-string works exactly like des3-cbc-encrypted-string but AES/128bits in CFB mode is used to encrypt the string. The prefix for encrypted values is "$8$".
>
> > \[!NOTE] The `pattern` restriction can not be used with this type.
>
> * `value.type` = C\_BUF
> * union element = `buf`
> * C type = `confd_buf_t`
> * SMIv2 type = `OCTET STRING`

`tailf:ip-address-and-prefix-length`

> The ip-address-and-prefix-length type represents a combination of an IP address and a prefix length and is IP version neutral. The format of the textual representations implies the IP version.
>
> This is a `union` of the `tailf:ipv4-address-and-prefix-length` and `tailf:ipv6-address-and-prefix-length` types defined below. The representation is thus identical to the representation for one of these types.
>
> The SMIv2 type is an `OCTET STRING (SIZE (5|17))`.

`tailf:ipv4-address-and-prefix-length`

> The ipv4-address-and-prefix-length type represents a combination of an IPv4 address and a prefix length. The prefix length is given by the number following the slash character and must be less than or equal to 32.
>
> An example: 172.16.1.2/16
>
> * `value.type` = C\_IPV4\_AND\_PLEN
> * union element = `ipv4prefix`
> * C type = `struct confd_ipv4_prefix`
> * SMIv2 type = `OCTET STRING (SIZE (5))`

`tailf:ipv6-address-and-prefix-length`

> The ipv6-address-and-prefix-length type represents a combination of an IPv6 address and a prefix length. The prefix length is given by the number following the slash character and must be less than or equal to 128.
>
> An example: 2001:DB8::1428:57AB/64
>
> * `value.type` = C\_IPV6\_AND\_PLEN
> * union element = `ipv6prefix`
> * C type = `struct confd_ipv6_prefix`
> * SMIv2 type = `OCTET STRING (SIZE (17))`

`tailf:node-instance-identifier`

> This is the same type as the node-instance-identifier defined in the ietf-netconf-acm module, replicated here to make it possible for Tail-f YANG modules to avoid a dependency on ietf-netconf-acm.
>
> * `value.type` = C\_BUF
> * union element = `buf`
> * C type = `confd_buf_t`
> * SMIv2 type = `OCTET STRING`

#### The tailf-xsd-types YANG module

"This module contains useful XML Schema Datatypes that are not covered by YANG types directly.

`xs:duration`

> * `value.type` = C\_DURATION
> * union element = `duration`
> * C type = `struct confd_duration`
> * SMIv2 type = `OCTET STRING`

`xs:date`

> * `value.type` = C\_DATE
> * union element = `date`
> * C type = `struct confd_date`
> * SMIv2 type = `OCTET STRING`

`xs:time`

> * `value.type` = C\_TIME
> * union element = `time`
> * C type = `struct confd_time`
> * SMIv2 type = `OCTET STRING`

`xs:token`

> * `value.type` = C\_BUF
> * union element = `buf`
> * C type = `confd_buf_t`
> * SMIv2 type = `OCTET STRING`

`xs:hexBinary`

> * `value.type` = C\_BINARY
> * union element = `buf`
> * C type = `confd_buf_t`
> * SMIv2 type = `OCTET STRING`

`xs:QName`

> * `value.type` = C\_QNAME
> * union element =`qname`
> * C type = `struct confd_qname`
> * SMIv2 type = \<not applicable>

`xs:decimal, xs:float, xs:double`

> * `value.type` = C\_DOUBLE
> * union element = `d`
> * C type = `double`
> * SMIv2 type = `OCTET STRING`

### See Also

The NSO User Guide

`confd_lib(3)` - confd C library.

`confd.conf(5)` - confd daemon configuration file format
