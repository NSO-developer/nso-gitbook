# confd_lib_lib Man Page

`confd_lib_lib` - common library functions for applications connecting
to NSO

## Synopsis

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

## Library

NSO Library, (`libconfd`, `-lconfd`)

## Description

The `libconfd` shared library is used to connect to NSO. This manual
page describes functions and data structures that are not specific to
any one of the APIs that are described in the other confd_lib_xxx(3)
manual pages.

## Functions

    void confd_init(
    const char *name, FILE *estream, const enum confd_debug_level debug);

Initializes the ConfD library. Must be called before any other NSO API
functions are called.

The `debug` parameter is used to control the debug level. The following
levels are available:

`CONFD_SILENT`  
> No printouts whatsoever are produced by the library.

`CONFD_DEBUG`  
> Various printouts will occur for various error conditions. This is a
> decent value to have as default. If syslog is enabled for the library,
> these printouts will be logged at syslog level `LOG_ERR`, except for
> errors where `confd_errno` is `CONFD_ERR_INTERNAL`, which are logged
> at syslog level `LOG_CRIT`.

`CONFD_TRACE`  
> The execution of callback functions and CDB/MAAPI API calls will be
> traced. This is very verbose and very useful during debugging. If
> syslog is enabled for the library, these printouts will be logged at
> syslog level `LOG_DEBUG`.

`CONFD_PROTO_TRACE`  
> The low-level protocol exchange between the application and NSO will
> be traced. This is even more verbose than `CONFD_TRACE`, and normally
> only of interest to Cisco support. These printouts will not be logged
> via syslog, i.e. a non-NULL value for the `estream` parameter must be
> provided.

The `estream` parameter is used by all printouts from the library. The
`name` parameter is typically included in most of the debug printouts.
If the `estream` parameter is NULL, no printouts to a file will occur.
Independent of the `estream` parameter, syslog can be enabled for the
library by setting the global variable `confd_lib_use_syslog` to `1`.
See [SYSLOG AND DEBUG](confd_lib_lib.3.md#syslog_and_debug) in this
man page.

    int confd_set_debug(
    enum confd_debug_level debug, FILE *estream);

This function can be used to change the `estream` and `debug` parameters
for the library.

    int confd_load_schemas(
    const struct sockaddr* srv, int srv_sz);

Utility function that uses `maapi_load_schemas()` (see
[confd_lib_maapi(3)](confd_lib_maapi.3.md)) to load schema information
from NSO. This function connects to NSO and loads all the schema
information in NSO for all loaded "fxs" files into the library. This is
necessary in order to get proper printouts of e.g. confd_hkeypaths which
otherwise just contains arrays of integers. This function should
typically always be called when we initialize the library. See
[confd_types(3)](confd_types.3.md).

Use of this utility function is discouraged as the caller has no control
over how the socket communicating with NSO is created. We recommend
calling `maapi_load_schemas()` directly (see
[confd_lib_maapi(3)](confd_lib_maapi.3.md)).

    int confd_load_schemas_list(
    const struct sockaddr* srv, int srv_sz, int flags, const uint32_t *nshash, 
    const int *nsflags, int num_ns);

Utility function that uses `maapi_load_schemas_list()` to load a subset
of the schema information from NSO. See the description of
`maapi_load_schemas_list()` in
[confd_lib_maapi(3)](confd_lib_maapi.3.md) for the details of how to
use the `flags`, `nshash`, `nsflags`, and `num_ns` parameters.

Use of this utility function is discouraged as the caller has no control
over how the socket communicating with NSO is created. We recommend
calling `maapi_load_schemas_list()` directly (see
[confd_lib_maapi(3)](confd_lib_maapi.3.md)).

    int confd_mmap_schemas_setup(
    void *addr, size_t size, const char *filename, int flags);

This function sets up for a subsequent call of one of the schema-loading
functions (`confd_load_schemas()` etc) to load the schema information
into a shared memory segment instead of into the process' heap. The
`addr` and (potentially) `size` arguments are passed to `mmap(2)`, and
`filename` specifies the pathname of a file to use as backing store. The
`flags` parameter can be given as `CONFD_MMAP_SCHEMAS_KEEP_SIZE` to
request that the shared memory segment should be exactly the size given
by the (non-zero) `size` argument - if this size is insufficient to hold
the schema information, the schema-loading function will fail.

    int confd_mmap_schemas(
    const char *filename);

Map a shared memory segment, previously created by
`confd_mmap_schemas_setup()` and subsequent schema loading, into the
current process' address space, and make it ready for use. The
`filename` argument specifies the pathname of the file that is used as
backing store. See also /ncs-config/enable-shared-memory-schema in
[ncs.conf(5)](ncs.conf.5.md) and `maapi_get_schema_file_path()` in
[confd_lib_maapi(3)](confd_lib_maapi.3.md).

    void confd_free_schemas(
    void);

Free or unmap the memory allocated or mapped by schema loading, undoing
the result of loading - i.e. schema information will no longer be
available. There is normally no need to call this function, since the
memory will be automatically freed/unmapped if a new schema loading is
done, or when the process terminates, but it may be useful in some
cases.

    int confd_svcmp(
    const char *s, const confd_value_t *v);

Utility function with similar semantics to `strcmp()` which compares a
`confd_value_t` to a `char*`.

    int confd_pp_value(
    char *buf, int bufsiz, const confd_value_t *v);

Utility function which pretty prints up to `bufsiz` characters into
`buf`, giving a string representation of the value `v`. Since only the
"primitive" type as defined by the `enum confd_vtype` is available,
`confd_pp_value()` can not produce a true string representation in all
cases, see the list below. If this is a problem, use `confd_val2str()`
instead.

`C_ENUM_VALUE`  
> The value is printed as "enum\<N\>", where N is the integer value.

`C_BIT32`  
> The value is printed as "bits\<X\>", where X is an unsigned integer in
> hexadecimal format.

`C_BIT64`  
> The value is printed as "bits\<X\>", where X is an unsigned integer in
> hexadecimal format.

`C_BITBIG`  
> The value is printed as "bits\<X\>", where X is an unsigned integer
> (possibly very large) in hexadecimal format.

`C_BINARY`  
> The string representation for `xs:hexBinary` is used, i.e. a sequence
> of hexadecimal characters.

`C_DECIMAL64`  
> If the value of the `fraction_digits` element is within the possible
> range (1..18), it is assumed to be correct for the type and used for
> the string representation. Otherwise the value is printed as
> "invalid64\<N\>", where N is the value of the `value` element.

`C_XMLTAG`  
> The string representation is printed if schema information has been
> loaded into the library. Otherwise the value is printed as "tag\<N\>",
> where N is the integer value.

`C_IDENTITYREF`  
> The string representation is printed if schema information has been
> loaded into the library. Otherwise the value is printed as
> "idref\<N\>", where N is the integer value.

All the `pp` pretty print functions, i.e. `confd_pp_value()`
`confd_ns_pp_value()`, `confd_pp_kpath()` and `confd_xpath_pp_kpath()`,
as well as the `confd_format_keypath()` and `confd_val2str()` functions,
return the number of characters printed (not including the trailing NUL
used to end output to strings) if there is enough space.

The formatting functions do not write more than `bufsiz` bytes
(including the trailing NUL). If the output was truncated due to this
limit then the return value is the number of characters (not including
the trailing NUL) which would have been written to the final string if
enough space had been available. Thus, a return value of `bufsiz` or
more means that the output was truncated.

Except for `confd_val2str()`, these functions will never return
CONFD_ERR or any other negative value.

    int confd_ns_pp_value(
    char *buf, int bufsiz, const confd_value_t *v, int ns);

This function is deprecated, but will remain for backward compatibility.
It just calls `confd_pp_value()` - use `confd_pp_value()` directly, or
`confd_val2str()` (see below), instead.

    int confd_pp_kpath(
    char *buf, int bufsiz, const confd_hkeypath_t *hkeypath);

Utility function which pretty prints up to `bufsiz` characters into
`buf`, giving a string representation of the path `hkeypath`. This will
use the NSO curly brace notation, i.e. "/servers/server{www}/ip".
Requires that schema information is available to the library, see
[confd_types(3)](confd_types.3.md). Same return value as
`confd_pp_value()`.

    int confd_pp_kpath_len(
    char *buf, int bufsiz, const confd_hkeypath_t *hkeypath, int len);

A variant of `confd_pp_kpath()` that prints only the first `len`
elements of `hkeypath`.

    int confd_format_keypath(
    char *buf, int bufsiz, const char *fmt, ...);

Several of the functions in [confd_lib_maapi(3)](confd_lib_maapi.3.md)
and [confd_lib_cdb(3)](confd_lib_cdb.3.md) take a variable number of
arguments which are then, similar to printf, used to generate the path
passed to NSO - see the [PATHS](confd_lib_cdb.3.md#paths) section of
confd_lib_cdb(3). This function takes the same arguments, but only
formats the path as a string, writing at most `bufsiz` characters into
`buf`. If the path is absolute and schema information is available to
the library, key values referenced by a "%x" modifier will be printed
according to their specific type, i.e. effectively using
`confd_val2str()`, otherwise `confd_pp_value()` is used. Same return
value as `confd_pp_value()`.

    int confd_vformat_keypath(
    char *buf, int bufsiz, const char *fmt, va_list ap);

Does the same as `confd_format_keypath()`, but takes a single va_list
argument instead of a variable number of arguments - i.e. similar to
vprintf. Same return value as `confd_pp_value()`.

    char *confd_xmltag2str(
    uint32_t ns, uint32_t xmltag);

This function is deprecated, but will remain for backward compatibility.
It just calls `confd_hash2str()` - use `confd_hash2str()` directly
instead, see below.

    int confd_xpath_pp_kpath(
    char *buf, int bufsiz, uint32_t ns, const confd_hkeypath_t *hkeypath);

Similar to `confd_pp_kpath()` except that the path is formatted as an
XPath path, i.e. "/servers:servers/server\[name="www"\]/ip". This
function can also take the namespace integer as an argument. If `0` is
passed as `ns`, the namespace is derived from the hkeypath. Requires
that schema information is available to the library, see
[confd_types(3)](confd_types.3.md). Same return value as
`confd_pp_value()`.

    int confd_get_nslist(
    struct confd_nsinfo **listp);

Provides a list of the namespaces known to the library as an array of
`struct confd_nsinfo` structures:

<div class="informalexample">

``` c
struct confd_nsinfo {
    const char *uri;
    const char *prefix;
    uint32_t hash;
    const char *revision;
    const char *module;
};
```

</div>

A pointer to the array is stored in `*listp`, and the function returns
the number of elements in the array. The `module` element in
`struct confd_nsinfo` will give the module name for namespaces defined
by YANG modules, otherwise it is NULL. The `revision` element will give
the revision for YANG modules that have a `revision` statement,
otherwise it is NULL.

    char *confd_ns2prefix(
    uint32_t ns);

Returns a NUL-terminated string giving the namespace prefix for the
namespace `ns`, if the namespace is known to the library - otherwise it
returns NULL.

    char *confd_hash2str(
    uint32_t hash);

Returns a NUL-terminated string representing the node name given by
`hash`, or NULL if the hash value is not found. Requires that schema
information has been loaded from the NSO daemon into the library, see
[confd_types(3)](confd_types.3.md) - otherwise it always returns NULL.

    uint32_t confd_str2hash(
    const char *str);

Returns the hash value representing the node name given by `str`, or 0
if the string is not found. Requires that schema information has been
loaded from the NSO daemon into the library, see
[confd_types(3)](confd_types.3.md) - otherwise it always returns 0.

    struct confd_cs_node *confd_find_cs_root(
    uint32_t ns);

When schema information is available to the library, this function
returns the root of the tree representaton of the namespace given by
`ns`, i.e. a pointer to the `struct confd_cs_node` for the (first)
toplevel node. For namespaces that are augmented into other namespaces
such that they do not have a toplevel node, this function returns NULL -
the nodes of such a namespace are found below the `augment` target
node(s) in other tree(s). See [confd_types(3)](confd_types.3.md).

    struct confd_cs_node *confd_find_cs_node(
    const confd_hkeypath_t *hkeypath, int len);

Utility function which finds the `struct confd_cs_node` corresponding to
the `len` first elements of the hashed keypath. To make the search
consider the full keypath, pass the `len` element from the
`confd_hkeypath_t` structure (i.e. `mykeypath->len`). See
[confd_types(3)](confd_types.3.md).

    struct confd_cs_node *confd_find_cs_node_child(
    const struct confd_cs_node *parent, struct xml_tag xmltag);

Utility function which finds the `struct confd_cs_node` corresponding to
the child node given as `xmltag`. See
[confd_types(3)](confd_types.3.md).

    struct confd_cs_node *confd_cs_node_cd(
    const struct confd_cs_node *start, const char *fmt, ...);

Utility function which finds the resulting `struct confd_cs_node` given
an (optional) starting node and a (relative or absolute) string keypath.
I.e. this function navigates the tree in a manner corresponding to
`cdb_cd()`/`maapi_cd()`. Note however that the `confd_cs_node` tree does
not have a node corresponding to "/". It is possible to pass `start` as
`NULL`, in which case the path must be absolute (i.e. start with a "/").

Since the key values are not relevant for the tree navigation, the key
elements can be omitted, i.e. a "tagpath" can be used - if present, key
elements are ignored, whether given in the {...} form or the CDB-only
\[N\] form. See [confd_types(3)](confd_types.3.md).

If the path can not be found, `NULL` is returned, `confd_errno` is set
to `CONFD_ERR_BADPATH`, and `confd_lasterr()` can be used to retrieve a
string that describes the reason for the failure.

If `NULL` is returned and `confd_errno` is set to
`CONFD_ERR_NO_MOUNT_ID`, it means that the path is ambiguous due to
traversing a mount point. In this case `maapi_cs_node_cd()` or
`cdb_cs_node_cd()` must be used instead, with a path that is fully
instantiated (i.e. all keys provided).

    enum confd_vtype confd_get_base_type(
    struct confd_cs_node *node);

This function returns the base type of a leaf node, as a `confd_vtype`
value.

    int confd_max_object_size(
    struct confd_cs_node *object);

Utility function which returns the maximum size (i.e. the needed length
of the `confd_value_t` array) for an "object" retrieved by
`cdb_get_object()`, `maapi_get_object()`, and corresponding multi-object
functions. The `object` parameter is a pointer to the list or container
`confd_cs_node` node for which we want to find the maximum size. See the
description of `cdb_get_object()` in
[confd_lib_cdb(3)](confd_lib_cdb.3.md) for usage examples.

    struct confd_cs_node *confd_next_object_node(
    struct confd_cs_node *object, struct confd_cs_node *cur, confd_value_t *value);

Utility function to allow navigation of the `confd_cs_node` schema tree
in parallel with the `confd_value_t` array populated by
`cdb_get_object()`, `maapi_get_object()`, and corresponding multi-object
functions. The `object` parameter is a pointer to the list or container
node as for `confd_max_object_size()`, the `cur` parameter is a pointer
to the `confd_cs_node` node for the current value, and the `value`
parameter is a pointer to the current value in the array. The function
returns a pointer to the `confd_cs_node` node for the next value in the
array, or NULL when the complete object has been traversed. In the
initial call for a given traversal, we must pass `object->children` for
the `cur` parameter - this always points to the `confd_cs_node` node for
the first value in the array. See the description of `cdb_get_object()`
in [confd_lib_cdb(3)](confd_lib_cdb.3.md) for usage examples.

    struct confd_type *confd_find_ns_type(
    uint32_t nshash, const char *name);

Returns a pointer to a type definition for the type named `name`, which
is defined in the namespace identified by `nshash`, or NULL if the type
could not be found. If `nshash` is 0, the type name will be looked up
among the ConfD built-in types (i.e. the YANG built-in types, the types
defined in the YANG "tailf-common" module, and the types defined in the
"confd" and "xs" namespaces). The type definition pointer can be used
with the `confd_val2str()` and `confd_str2val()` functions, see below.
If `nshash` is not 0, the function requires that schema information has
been loaded from the NSO daemon into the library, see
[confd_types(3)](confd_types.3.md) - otherwise it returns NULL.

    struct confd_type *confd_get_leaf_list_type(
    struct confd_cs_node *node);

For a leaf-list node, the `type` field in the
`struct confd_cs_node_info` (see [confd_types(3)](confd_types.3.md))
identifies a "list type" for the leaf-list "itself". This function takes
a pointer to the `struct confd_cs_node` for a leaf-list node as
argument, and returns the type of the elements in the leaf-list, i.e.
corresponding to the `type` substatement for the leaf-list in the YANG
module. If called for a node that is not a leaf-list, it returns NULL
and sets `confd_errno` to `CONFD_ERR_PROTOUSAGE`. Requires that schema
information has been loaded from the NSO daemon into the library, see
[confd_types(3)](confd_types.3.md) - otherwise it returns NULL and
sets `confd_errno` to `CONFD_ERR_UNAVAILABLE`.

    int confd_val2str(
    struct confd_type *type, const confd_value_t *val, char *buf, int bufsiz);

Prints the string representation of `val` into `buf`, which has the
length `bufsiz`, using type information from the data model. Returns the
length of the string as described for `confd_pp_value()`, or CONFD_ERR
if the value could not be converted (e.g. wrong type). The `type`
pointer can be obtained either from the `struct confd_cs_node`
corresponding to the leaf that `val` pertains to, or via the
`confd_find_ns_type()` function above. The `struct confd_cs_node` can in
turn be obtained by various combinations of the functions that operate
on the `confd_cs_node` trees (see above), or by user-defined functions
for navigating those trees. Requires that schema information has been
loaded from the NSO daemon into the library, see
[confd_types(3)](confd_types.3.md).

    int confd_str2val(
    struct confd_type *type, const char *str, confd_value_t *val);

Stores the value corresponding to the NUL-terminated string `str` in
`val`, using type information from the data model. Returns CONFD_OK, or
CONFD_ERR if the string could not be converted. See `confd_val2str()`
for a description of the `type` argument. Requires that schema
information has been loaded from the NSO daemon into the library, see
[confd_types(3)](confd_types.3.md).

A special case is that CONFD_ERR is returned, with `confd_errno` set to
`CONFD_ERR_NO_MOUNT_ID`. This will only happen when the type is a YANG
instance-identifier, and means that the Xpath expression (i.e. the
string representation) is ambiguous due to traversing a mount point. In
this case `maapi_xpath2kpath_th()` must be used to translate the string
into a `confd_hkeypath_t`, which can then be used with
`CONFD_SET_OBJECTREF()` to create the `confd_value_t` value.

<div class="note">

When the resulting value is of one of the C_BUF, C_BINARY, C_LIST,
C_OBJECTREF, C_OID, C_QNAME, C_HEXSTR, or C_BITBIG `confd_value_t`
types, the library has allocated memory to hold the value. It is up to
the user of this function to free the memory using `confd_free_value()`.

</div>

    char *confd_val2str_ptr(
    struct confd_type *type, const confd_value_t *val);

A variant of `confd_val2str()` that can be used only when the string
representation is a constant, i.e. C_ENUM_VALUE values. In this case it
returns a pointer to the string, otherwise NULL. See `confd_val2str()`
for a description of the `type` argument. Requires that schema
information has been loaded from the NSO daemon into the library, see
[confd_types(3)](confd_types.3.md).

    int confd_get_decimal64_fraction_digits(
    struct confd_type *type);

Utility function to obtain the value of the argument to the
`fraction-digits` statement for a YANG `decimal64` type. This is useful
when we want to create a `confd_value_t` for such a type, since the
`value` element must be scaled according to the fraction-digits value.
The function returns the fraction-digits value, or 0 if the `type`
argument does not refer to a `decimal64` type. Requires that schema
information has been loaded from the NSO daemon into the library, see
[confd_types(3)](confd_types.3.md).

    int confd_get_bitbig_size(
    struct confd_type *type);

Utility function to obtain the maximum size needed for the byte array
for the C_BITBIG `confd_value_t` representation used when a YANG `bits`
type has a highest bit position above 63. This is useful when we want to
create a `confd_value_t` for such a type, since an array of this size
can hold the values for all the bits defined for the type. Applications
may however provide a confd_value_t with a shorter (but not longer)
array to NSO. The file generated by `ncsc --emit-h` also includes a
`#define` symbol for this size. The function returns 0 if the `type`
argument does not refer to a `bits` type with a highest bit position
above 63. Requires that schema information has been loaded from the NSO
daemon into the library, see [confd_types(3)](confd_types.3.md).

    int confd_hkp_tagmatch(
    struct xml_tag tags[], int tagslen, confd_hkeypath_t *hkp);

When checking the hkeypaths that get passed into each iteration in e.g.
`cdb_diff_iterate()` we can either explicitly check the paths, or use
this function to do the job. The `tags` array (typically statically
initialized) specifies a tagpath to match against the hkeypath. See
`cdb_diff_match()`. The function returns one of these values:

<div class="informalexample">

    #define CONFD_HKP_MATCH_NONE 0
    #define CONFD_HKP_MATCH_TAGS (1 << 0)
    #define CONFD_HKP_MATCH_HKP  (1 << 1)
    #define CONFD_HKP_MATCH_FULL (CONFD_HKP_MATCH_TAGS|CONFD_HKP_MATCH_HKP)

        

</div>

`CONFD_HKP_MATCH_TAGS` means that the whole tagpath was matched by the
hkeypath, and `CONFD_HKP_MATCH_HKP` means that the whole hkeypath was
matched by the tagpath.

    int confd_hkp_prefix_tagmatch(
    struct xml_tag tags[], int tagslen, confd_hkeypath_t *hkp);

A simplified version of `confd_hkp_tagmatch()` - it returns 1 if the
tagpath matches a prefix of the hkeypath, i.e. it is equivalent to
calling `confd_hkp_tagmatch()` and checking if the return value includes
`CONFD_HKP_MATCH_TAGS`.

    int confd_val_eq(
    const confd_value_t *v1, const confd_value_t *v2);

Utility function which compares two values. Returns positive value if
equal, 0 otherwise.

    void confd_fatal(
    const char *fmt);

Utility function which formats a string, prints it to stderr and exits
with exit code 1.

    void confd_free_value(
    confd_value_t *v);

When we retrieve values via the CDB or MAAPI interfaces, or convert
strings to values via `confd_str2val()`, and these values are of either
of the types C_BUF, C_BINARY, C_QNAME, C_OBJECTREF, C_OID, C_LIST,
C_HEXSTR, or C_BITBIG, the library has allocated memory to hold the
values. This memory must be freed by the application when it is done
with the value. This function frees memory for all `confd_value_t`
types. Note that this function does not free the structure itself, only
possible internal pointers inside the struct. Typically we use
`confd_value_t` variables as automatic variables allocated on the stack.
If the held value is of fixed size, e.g. integers, xmltags etc, the
`confd_free_value()` function does nothing.

<div class="note">

Memory for values received as parameters to callback functions is always
managed by the library - the application must *not* call
`confd_free_value()` for those (on the other hand values of the types
listed above that are received as parameters to a callback function must
be copied if they are to persist beyond the callback invocation).

</div>

    confd_value_t *confd_value_dup_to(
    const confd_value_t *v, confd_value_t *newv);

This function copies the contents of `*v` to `*newv`, allocating memory
for the actual value for the types that need it. It returns `newv`, or
NULL if allocation failed. The allocated memory (if any) can be freed
with `confd_free_dup_to_value()`.

    void confd_free_dup_to_value(
    confd_value_t *v);

Frees memory allocated by `confd_value_dup_to()`. Note this is not the
same as `confd_free_value()`, since `confd_value_dup_to()` also
allocates memory for values of type C_STR - such values are not freed by
`confd_free_value()`.

    confd_value_t *confd_value_dup(
    const confd_value_t *v);

This function allocates memory and duplicates `*v`, i.e. a
`confd_value_t` struct is always allocated, memory for the actual value
is also allocated for the types that need it. Returns a pointer to the
new `confd_value_t`, or NULL if allocation failed. The allocated memory
can be freed with `confd_free_dup_value()`.

    void confd_free_dup_value(
    confd_value_t *v);

Frees memory allocated by `confd_value_dup()`. Note this is not the same
as `confd_free_value()`, since `confd_value_dup()` also allocates the
actual `confd_value_t` struct, and allocates memory for values of type
C_STR - such values are not freed by `confd_free_value()`.

    confd_hkeypath_t *confd_hkeypath_dup(
    const confd_hkeypath_t *src);

This function allocates memory and duplicates a `confd_hkeypath_t`.

    confd_hkeypath_t *confd_hkeypath_dup_len(
    const confd_hkeypath_t *src, int len);

Like `confd_hkeypath_dup()`, but duplicates only the first `len`
elements of the `confd_hkeypath_t`. I.e. the elements are shifted such
that `v[0][0]` still refers to the last element.

    void confd_free_hkeypath(
    confd_hkeypath_t *hkp);

This function will free memory allocated by e.g. `confd_hkeypath_dup()`.

    void confd_free_authorization_info(
    struct confd_authorization_info *ainfo);

This function will free memory allocated by
`maapi_get_authorization_info()`.

    int confd_decrypt(
    const char *ciphertext, int len, char *output);

When data is read over the CDB interface, the MAAPI interface or
received in event notifications, the data for the two builtin types
`tailf:aes-cfb-128-encrypted-string` or
`tailf:aes-256-cfb-128-encrypted-string` is encrypted.

This function decrypts `len` bytes of data from `ciphertext` and writes
the clear text to the `output` pointer. The `output` pointer must point
to an area that is at least `len` bytes long.

<div class="note">

One of the functions `confd_install_crypto_keys()` and
`maapi_install_crypto_keys()` must have been called before
`confd_decrypt()` can be used.

</div>

## User-Defined Types

It is possible to define new types, i.e. mappings between a textual
representation and a `confd_value_t` representation that are not
pre-defined in the NSO daemon. Read more about this in the
[confd_types(3)](confd_types.3.md) manual page.

    int confd_type_cb_init(
    struct confd_type_cbs **cbs);

This is the prototype for the function that a shared object implementing
one or more user-defined types must provide. See
[confd_types(3)](confd_types.3.md).

    int confd_register_ns_type(
    uint32_t nshash, const char *name, struct confd_type *type);

This function can be used to register a user-defined type with the
libconfd library, to make it possible for `confd_str2val()` and
`confd_val2str()` to provide local string\<-\>value translation in the
application. See [confd_types(3)](confd_types.3.md).

    int confd_register_node_type(
    struct confd_cs_node *node, struct confd_type *type);

This function provides an alternate way to register a user-defined type
with the libconfd library, in particular when the user-defined type is
specified "inline" in a `leaf` or `leaf-list` statement. See
[confd_types(3)](confd_types.3.md).

## Confd Streams

Some functions in the NSO lib stream data. Either from NSO to the
application of from the application to NSO. The individual functions
that use this feature will explicitly indicate that the data is passed
over a `stream socket`.

    int confd_stream_connect(
    int sock, const struct sockaddr* srv, int srv_sz, int id, int flags);

Connects a stream socket to NSO. The `id` and the `flags` take different
values depending on the usage scenario. This is indicated for each
individual function that makes use of a stream socket.

<div class="note">

If this call fails (i.e. does not return CONFD_OK), the socket
descriptor must be closed and a new socket created before the call is
re-attempted.

</div>

## Marshalling

In various distributed scenarios we may want to send confd_lib datatypes
over the network. We have support to marshall and unmarshall some key
datatypes.

    int confd_serialize(
    struct confd_serializable *s, unsigned char *buf, int bufsz, int *bytes_written, 
    unsigned char **allocated);

This function takes a `confd_serializable` struct as parameter. We have:

<div class="informalexample">

``` c
enum confd_serializable_type {
    CONFD_SERIAL_NONE      = 0,
    CONFD_SERIAL_VALUE_T   = 1,
    CONFD_SERIAL_HKEYPATH  = 2,
    CONFD_SERIAL_TAG_VALUE = 3
};
```

``` c
struct confd_serializable {
    enum confd_serializable_type type;
    union {
        confd_value_t *value;
        confd_hkeypath_t *hkp;
        confd_tag_value_t *tval;
    } u;
};
```

</div>

The structure must be populated with a valid type and also a value to be
serialized. The serialized data will be written into the provided
buffer. If the size of the buffer is insufficient, the function returns
the required size as a positive integer. If the provided buffer is NULL,
the function will allocate a buffer and it is the responsibility of the
caller to free the buffer. The optionally allocated buffer is then
returned in the output char \*\* parameter `allocated`. The function
returns 0 on success and -1 on failures.

    int confd_deserialize(
    struct confd_deserializable *s, unsigned char *buf);

This function takes a `confd_deserializable` struct as parameter. We
have:

<div class="informalexample">

``` c
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

</div>

This function is the reverse of `confd_serialize()`. It populates the
provided `confd_deserializable` structure with a type indicator and a
reproduced value of the correct type. The structure contains allocated
memory that must subsequently be freed with `confd_deserialiaze()`.

    void confd_deserialized_free(
    struct confd_deserializable *s);

A populated `confd_deserializable` struct contains allocated memory that
must be freed. This function traverses a `confd_deserializable` struct
as populated by the `confd_deserialize()` function and frees all
allocated memory.

## Extended Error Reporting

The data provider callback functions described in
[confd_lib_dp(3)](confd_lib_dp.3.md) can pass error information back
to NSO either as a simple string using `confd_xxx_seterr()`, or in a
more structured/detailed form using the corresponding
`confd_xxx_seterr_extended()` function. This form is also used when a
CDB subscriber wishes to abort the current transaction with
`cdb_sub_abort_trans()`, see [confd_lib_cdb(3)](confd_lib_cdb.3.md).
There is also a set of `confd_xxx_seterr_extended_info()` functions and
a `cdb_sub_abort_trans_info()` function, that can alternatively be used
if we want to provide contents for the NETCONF \<error-info\> element.
The description below uses the functions for transaction callbacks as an
example, but the other functions follow the same pattern:

    void confd_trans_seterr_extended(
    struct confd_trans_ctx *tctx, enum confd_errcode code, uint32_t apptag_ns, 
    uint32_t apptag_tag, const char *fmt);

The function can be used also after a data provider callback has
returned CONFD_DELAYED_RESPONSE, but in that case it must be followed by
a call of `confd_delayed_reply_error()` (see
[confd_lib_dp(3)](confd_lib_dp.3.md)) with NULL for the `errstr`
pointer.

One of the following values can be given for the `code` argument:

`CONFD_ERRCODE_IN_USE`  
> Locking a data store was not possible because it was already locked.

`CONFD_ERRCODE_RESOURCE_DENIED`  
> General resource unavailability, e.g. insufficient memory to carry out
> an operation.

`CONFD_ERRCODE_INCONSISTENT_VALUE`  
> A request parameter had an unacceptable/invalid value

`CONFD_ERRCODE_ACCESS_DENIED`  
> The request could not be fulfilled because authorization did not allow
> it. (No additional error information will be reported by the
> northbound agent, to avoid any security breach.)

`CONFD_ERRCODE_APPLICATION`  
> Unspecified error.

`CONFD_ERRCODE_APPLICATION_INTERNAL`  
> As CONFD_ERRCODE_APPLICATION, but the additional error information is
> only for logging/debugging, and should not be reported by northbound
> agents.

`CONFD_ERRCODE_DATA_MISSING`  
> A request could not be completed because the relevant data model
> content does not exist.

`CONFD_ERRCODE_INTERRUPT`  
> Processing of a request was terminated due to user interrupt - see the
> description of the `interrupt()` transaction callback in
> [confd_lib_dp(3)](confd_lib_dp.3.md).

There is currently limited support for specifying one of a set of fixed
error tags via `apptag_ns` and `apptag_tag`: `apptag_ns` should be 0,
and `apptag_tag` can be either 0 or the hash value for a data model
node.

The `fmt` and remaining arguments can specify an arbitrary string as for
`confd_trans_seterr()`, but when used with one of the `code` values that
has a specific meaning, it should only be given if it has some
additional information - e.g. passing "In use" with CONFD_ERRCODE_IN_USE
is not meaningful, and will typically result in duplicated information
being reported by the northbound agent. If there is no additional
information, just pass an empty string ("") for `fmt`.

A call of confd_trans_seterr(tctx, "string") is equivalent to
confd_trans_seterr_extended(tctx, CONFD_ERRCODE_APPLICATION, 0, 0,
"string").

When the extended error reporting is used, the northbound agents will,
where possible, use the extended error information to give
protocol-specific error reports to the managers, as described in the
following tables. (The CONFD_ERRCODE_INTERRUPT code does not have a
mapping here, since these interfaces do not provide the possibility to
interrupt a transaction.)

For SNMP, the `code` argument is mapped to SNMP ErrorStatus

| `code`                               | SNMP ErrorStatus      |
|--------------------------------------|-----------------------|
| `CONFD_ERRCODE_IN_USE`               | `resourceUnavailable` |
| `CONFD_ERRCODE_RESOURCE_DENIED`      | `resourceUnavailable` |
| `CONFD_ERRCODE_INCONSISTENT_VALUE`   | `inconsistentValue`   |
| `CONFD_ERRCODE_ACCESS_DENIED`        | `noAccess`            |
| `CONFD_ERRCODE_APPLICATION`          | `genErr`              |
| `CONFD_ERRCODE_APPLICATION_INTERNAL` | `genErr`              |
| `CONFD_ERRCODE_DATA_MISSING`         | `inconsistentValue`   |

For NETCONF the `code` argument is mapped to \<error-tag\>:

| `code`                               | NETCONF error-tag  |
|--------------------------------------|--------------------|
| `CONFD_ERRCODE_IN_USE`               | `in-use`           |
| `CONFD_ERRCODE_RESOURCE_DENIED`      | `resource-denied`  |
| `CONFD_ERRCODE_INCONSISTENT_VALUE`   | `invalid-value`    |
| `CONFD_ERRCODE_ACCESS_DENIED`        | `access-denied`    |
| `CONFD_ERRCODE_APPLICATION_`         | `operation-failed` |
| `CONFD_ERRCODE_APPLICATION_INTERNAL` | `operation-failed` |
| `CONFD_ERRCODE_DATA_MISSING`         | `data-missing`     |

The tag specified by `apptag_ns`/`apptag_tag` will be reported as
\<error-app-tag\>.

For MAAPI the `code` argument is mapped to `confd_errno`:

| `code`                               | `confd_errno`                    |
|--------------------------------------|----------------------------------|
| `CONFD_ERRCODE_IN_USE`               | `CONFD_ERR_INUSE`                |
| `CONFD_ERRCODE_RESOURCE_DENIED`      | `CONFD_ERR_RESOURCE_DENIED`      |
| `CONFD_ERRCODE_INCONSISTENT_VALUE`   | `CONFD_ERR_INCONSISTENT_VALUE`   |
| `CONFD_ERRCODE_ACCESS_DENIED`        | `CONFD_ERR_ACCESS_DENIED`        |
| `CONFD_ERRCODE_APPLICATION`          | `CONFD_ERR_EXTERNAL`             |
| `CONFD_ERRCODE_APPLICATION_INTERNAL` | `CONFD_ERR_APPLICATION_INTERNAL` |
| `CONFD_ERRCODE_DATA_MISSING`         | `CONFD_ERR_DATA_MISSING`         |

The tag (if any) can be retrieved by calling

    struct xml_tag *confd_last_error_apptag(
    void);

If no tag was provided by the callback (e.g. plain
`confd_trans_seterr()` was used, or the error did not originate from a
data provider callback at all), this function returns a pointer to a
`struct xml_tag` with both the `ns` and the `tag` element set to 0.

In the CLI and Web UI a text string is produced through some combination
of the `code` and the string given by `fmt, ...`.

    int confd_trans_seterr_extended_info(
    struct confd_trans_ctx *tctx, enum confd_errcode code, uint32_t apptag_ns, 
    uint32_t apptag_tag, confd_tag_value_t *error_info, int n, const char *fmt);

This function can be used to provide structured error information in the
same way as `confd_trans_seterr_extended()`, and additionally provide
contents for the NETCONF \<error-info\> element. The `error_info`
argument is an array of length `n`, populated as described for the
Tagged Value Array format in the [XML
STRUCTURES](confd_types.3.md#xml_structures) section of the
[confd_types(3)](confd_types.3.md) manual page. The `error_info`
information is discarded for other northbound agents than NETCONF.

The `tailf:error-info` statement (see
[tailf_yang_extensions(5)](tailf_yang_extensions.5.md)) must have been
used in one or more YANG modules to declare the data nodes for
\<error-info\>. As an example, we could have this `error-info`
declaration:

<div class="informalexample">

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

</div>

A call of `confd_trans_seterr_extended_info()` to populate the
\<error-info\> could then look like this:

<div class="informalexample">

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

</div>

<div class="note">

The toplevel elements in the `confd_tag_value_t` array *must* have the
`ns` element of the `struct xml_tag` set. The `CONFD_SET_TAG_XMLBEGIN()`
macro will set this element, but for toplevel leaf elements the
`CONFD_SET_TAG_NS()` macro needs to be used, as shown above.

</div>

The \<error-info\> section resulting from the above would look like
this:

<div class="informalexample">

        <error-info>
          ...
          <severity xmlns="http://tail-f.com/test/mod">error</severity>
          <detail xmlns="http://tail-f.com/test/mod">
            <class>42</class>
            <code>17</code>
          </detail>
        </error-info>

</div>

## Errors

All functions in `libconfd` signal errors through the return of the
\#defined CONFD_ERR - which has the value -1 - or alternatively
CONFD_EOF (-2) which means that NSO closed its end of the socket.

Data provider callbacks (see [confd_lib_dp(3)](confd_lib_dp.3.md)) can
also signal errors by returning CONFD_ERR from the callback. This can be
done for all different kinds of callbacks. It is possible to provide
additional error information from one of these callbacks by using one of
the functions:

`confd_trans_seterr(), confd_trans_seterr_extended(), confd_trans_seterr_extended_info()`  
> For transaction callbacks

`confd_db_seterr(), confd_db_seterr_extended(), confd_db_seterr_extended_info()`  
> For db callbacks

`confd_action_seterr(), confd_action_seterr_extended(), confd_action_seterr_extended_info()`  
> For action callbacks

`confd_notification_seterr(), confd_notification_seterr_extended(), confd_notification_seterr_extended_info()`  
> For notification callbacks

CDB two phase subscribers (see [confd_lib_cdb(3)](confd_lib_cdb.3.md))
can also provide error information when
`cdb_read_subscription_socket2()` has returned with type set to
`CDB_SUB_PREPARE`, using one of the functions `cdb_sub_abort_trans()`
and `cdb_sub_abort_trans_info()`.

Whenever CONFD_ERR is returned from any API function in `libconfd` it is
possible to obtain additional information on the error through the
symbol `confd_errno`. Additionally there may be an error text associated
with the error. A call to the function

    char *confd_lasterr(
    void);

returns a string which contains additional textual information on the
error. Furthermore, the function

    char *confd_strerror(
    int code);

returns a string which describes a particular error code. When one of
the The following error codes are available:

`CONFD_ERR_NOEXISTS` (1)  
> Typically we tried to read a value through CDB or MAAPI which does not
> exist.

`CONFD_ERR_ALREADY_EXISTS` (2)  
> We tried to create something which already exists.

`CONFD_ERR_ACCESS_DENIED` (3)  
> Access to an object was denied due to AAA authorization rules.

`CONFD_ERR_NOT_WRITABLE` (4)  
> We tried to write an object which is not writable.

`CONFD_ERR_BADTYPE` (5)  
> We tried to create or write an object which is specified to have
> another type (see [confd_types(3)](confd_types.3.md)) than the one
> we provided.

`CONFD_ERR_NOTCREATABLE` (6)  
> We tried to create an object which is not possible to create.

`CONFD_ERR_NOTDELETABLE` (7)  
> We tried to delete an object which is not possible to delete.

`CONFD_ERR_BADPATH` (8)  
> We provided a bad path in any of the printf style functions which take
> a variable number of arguments.

`CONFD_ERR_NOSTACK` (9)  
> We tried to pop without a preceding push.

`CONFD_ERR_LOCKED` (10)  
> We tried to lock something which is already locked.

`CONFD_ERR_INUSE` (11)  
> We tried to commit while someone else holds a lock.

`CONFD_ERR_NOTSET` (12)  
> A mandatory leaf does not have a value, either because it has been
> deleted, or not set after a create.

`CONFD_ERR_NON_UNIQUE` (13)  
> A group of leafs specified with the `unique` statement are not unique.

`CONFD_ERR_BAD_KEYREF` (14)  
> Dangling pointer.

`CONFD_ERR_TOO_FEW_ELEMS` (15)  
> A `min-elements` violation. A node has fewer elements or entries than
> specified with `min-elements`.

`CONFD_ERR_TOO_MANY_ELEMS` (16)  
> A `max-elements` violation. A node has fewer elements or entries than
> specified with `max-elements`.

`CONFD_ERR_BADSTATE` (17)  
> Some function, such as the MAAPI commit functions that require several
> functions to be called in a specific order, was called out of order.

`CONFD_ERR_INTERNAL` (18)  
> An internal error. This normally indicates a bug in NSO or libconfd
> (if nothing else the lack of a better error code), please report it to
> Cisco support.

`CONFD_ERR_EXTERNAL` (19)  
> All errors that originate in user code.

`CONFD_ERR_MALLOC` (20)  
> Failed to allocate memory.

`CONFD_ERR_PROTOUSAGE` (21)  
> Usage of API functions or callbacks was wrong. It typically means that
> we invoke a function when we shouldn't. For example if we invoke the
> `confd_data_reply_next_key()` in a `get_elem()` callback we get this
> error.

`CONFD_ERR_NOSESSION` (22)  
> A session must be established prior to executing the function.

`CONFD_ERR_TOOMANYTRANS` (23)  
> A new MAAPI transaction was rejected since the transaction limit
> threshold was reached.

`CONFD_ERR_OS` (24)  
> An error occurred in a call to some operating system function, such as
> `write()`. The proper errno from libc should then be read and used as
> failure indicator.

`CONFD_ERR_HA_CONNECT` (25)  
> Failed to connect to a remote HA node.

`CONFD_ERR_HA_CLOSED` (26)  
> A remote HA node closed its connection to us, or there was a timeout
> waiting for a sync response from the primary during a call of
> `confd_ha_besecondary()`.

`CONFD_ERR_HA_BADFXS` (27)  
> A remote HA node had a different set of fxs files compared to us. It
> could also be that the set is the same, but the version of some fxs
> file is different.

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
> An operation towards a mounted NETCONF subagent failed due to the
> subagent not being up.

`CONFD_ERR_LIB_NOT_INITIALIZED` (34)  
> The confd library has not been properly initialized by a call to
> `confd_init()`.

`CONFD_ERR_TOO_MANY_SESSIONS` (35)  
> Maximum number of sessions reached.

`CONFD_ERR_BAD_CONFIG` (36)  
> An error in a configuration.

`CONFD_ERR_RESOURCE_DENIED` (37)  
> A data provider callback returned CONFD_ERRCODE_RESOURCE_DENIED (see
> EXTENDED ERROR REPORTING above).

`CONFD_ERR_INCONSISTENT_VALUE` (38)  
> A data provider callback returned CONFD_ERRCODE_INCONSISTENT_VALUE
> (see EXTENDED ERROR REPORTING above).

`CONFD_ERR_APPLICATION_INTERNAL` (39)  
> A data provider callback returned CONFD_ERRCODE_APPLICATION_INTERNAL
> (see EXTENDED ERROR REPORTING above).

`CONFD_ERR_UNSET_CHOICE` (40)  
> No `case` has been selected for a mandatory `choice` statement.

`CONFD_ERR_MUST_FAILED` (41)  
> A `must` constraint is not satisfied.

`CONFD_ERR_MISSING_INSTANCE` (42)  
> The value of an `instance-identifier` leaf with
> `require-instance true` does not specify an existing instance.

`CONFD_ERR_INVALID_INSTANCE` (43)  
> The value of an `instance-identifier` leaf does not conform to the
> specified path filters.

`CONFD_ERR_UNAVAILABLE` (44)  
> We tried to use some unavailable functionality, e.g. get/set
> attributes on an operational data element.

`CONFD_ERR_EOF` (45)  
> This value is used when a function returns CONFD_EOF. Thus it is not
> strictly necessary to check whether the return value is CONFD_ERR or
> CONFD_EOF - if the function should return CONFD_OK on success, but the
> return value is something else, the reason can always be found via
> confd_errno.

`CONFD_ERR_NOTMOVABLE` (46)  
> We tried to move an object which is not possible to move.

`CONFD_ERR_HA_WITH_UPGRADE` (47)  
> We tried to perform an in-service data model upgrade on a HA node that
> was either an HA primary or secondary, or we tried to make the node a
> HA primary or secondary while an in-service data model upgrade was in
> progress.

`CONFD_ERR_TIMEOUT` (48)  
> An operation did not complete within the specified timeout.

`CONFD_ERR_ABORTED` (49)  
> An operation was aborted.

`CONFD_ERR_XPATH` (50)  
> Compilation or evaluation of an XPath expression failed.

`CONFD_ERR_NOT_IMPLEMENTED` (51)  
> A request was made for an operation that wasn't implemented. This will
> typically occur if an application uses a version of `libconfd` that is
> more recent than the version of the NSO daemon, and a CDB or MAAPI
> function is used that is only implemented in the library version.

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
> A data provider callback returned CONFD_ERRCODE_DATA_MISSING (see
> EXTENDED ERROR REPORTING above).

`CONFD_ERR_CLI_CMD` (59)  
> Execution of a CLI command failed.

`CONFD_ERR_UPGRADE_IN_PROGRESS` (60)  
> A request was made for an operation that is not allowed when
> in-service data model upgrade is in progress.

`CONFD_ERR_NOTRANS` (61)  
> An invalid transaction handle was passed to a MAAPI function - i.e.
> the handle did not refer to a transaction that was either started on,
> or attached to, the MAAPI socket.

`NCS_ERR_SERVICE_CONFLICT` (62)  
> An NCS service invocation running outside the transaction lock
> modified data that was also modified by a service invocation in
> another transaction.

`CONFD_ERR_NO_MOUNT_ID` (67)  
> A path is ambiguous due to traversing a mount point.

`CONFD_ERR_STALE_INSTANCE` (68)  
> The value of an `instance-identifier` leaf with
> `require-instance true` has stale data after upgrading.

`CONFD_ERR_HA_BADCONFIG` (69)  
> A remote HA node has a bad configuration of at least one HA
> application which prevents it from functioning properly. The reason
> can be that the remote HA node has a different NETCONF event
> notification configuration compared to the primary node, i.e. the
> remote HA node has one or more NETCONF event notification streams that
> have different stream name when built-in replay store is enabled.

## Miscellaneous

The library will always set the default signal handler for SIGPIPE to be
SIG_IGN. All libconfd APIs are socket based and the library must be able
to detect failed write operations in a controlled manner.

The include file `confd_lib.h` includes `assert.h` and uses assert
macros in the specialized `CONFD_GET_XXX()` macros. If the behavior of
assert is not wanted in a production environment, we can define NDEBUG
before including `confd_lib.h` (or `confd.h`), see assert(3).
Alternatively we can define a `CONFD_ASSERT()` macro before including
`confd_lib.h`. The assert macros are invoked via `CONFD_ASSERT()`, which
is defined by:

<div class="informalexample">

    #ifndef CONFD_ASSERT
    #define CONFD_ASSERT(E) assert(E)
    #endif

</div>

I.e. by defining a different version of `CONFD_ASSERT()`, we can get our
own error handler invoked instead of assert(3), for example:

<div class="informalexample">

    void log_error(char *file, int line, char *expr);

    #define CONFD_ASSERT(E) \
                ((E) ? (void)0 : log_error(__FILE__, __LINE__, #E))

    #include <confd_lib.h>
        

</div>

## Syslog And Debug

When developing applications with `libconfd` we always need to indicate
to the library which verbosity level should be used by the library.
There are three different levels to choose from: CONFD_SILENT where the
library never writes anything, CONFD_DEBUG where the library reports all
errors and finally CONFD_TRACE where the library traces the execution
and invocations of all the various callback functions.

There are two different destinations for all library printouts. When we
call `confd_init()`, we always need to supply a `FILE*` stream which
should be used for all printouts. This parameter can be set to NULL if
we never want any `FILE*` printouts to occur.

The second destination is syslog, i.e. the library will syslog if told
to. This is controlled by the global integer variable
`confd_lib_use_syslog`. If we set this variable to `1`, `libconfd` will
syslog all output. If we set it to `0` the library will not syslog. It
is the responsibility of the application to (optionally) call
`openlog()` before initializing the NSO library. The default value is
`0`.

There also exists a hook point at which a library user can install their
own printer. This done by assigning to a global variable
`confd_user_log_hook`, as in:

<div class="informalexample">

    void mylogger(int syslogprio, const char *fmt, va_list ap) {
        char buf[BUFSIZ];
        sprintf(buf, "MYLOG:(%d) ", syslogprio); strcat(buf, fmt);
        vfprintf(stderr, buf, ap);
    }

    confd_user_log_hook = mylogger;

</div>

The `syslogprio` is LOG_ERR or LOG_CRIT for error messages, and
LOG_DEBUG for trace messages, see the description of `confd_init()`.

Thus a good combination of values in a target environment is to set the
`FILE*` handle to NULL and `confd_lib_use_syslog` to `1`. This way we do
not get the overhead of file logging and at the same time get all errors
reported to syslog.

## See Also

`ncs(5)` - NSO daemon configuration file format

The NSO User Guide
