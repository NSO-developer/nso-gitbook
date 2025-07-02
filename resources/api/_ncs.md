# Python _ncs Module

NCS Python low level module.

This module and its submodules provide Python bindings for the C APIs,
described by the [confd_lib(3)](../man/section3.md#confd_lib) man page.

The companion high level module, ncs, provides an abstraction layer on top of
this module and may be easier to use.

## Submodules

- [_ncs.cdb](_ncs.cdb.md): Low level module for connecting to NCS built-in XML database (CDB).
- [_ncs.dp](_ncs.dp.md): Low level callback module for connecting data providers to NCS.
- [_ncs.error](_ncs.error.md): This module defines new NCS Python API exception classes.
- [_ncs.events](_ncs.events.md): Low level module for subscribing to NCS event notifications.
- [_ncs.ha](_ncs.ha.md): Low level module for connecting to NCS HA subsystem.
- [_ncs.maapi](_ncs.maapi.md): Low level module for connecting to NCS with a read/write interface
inside transactions.

## Functions

### cs_node_cd

```python
cs_node_cd(start, path) -> Union[CsNode, None]
```

Utility function which finds the resulting CsNode given an (optional)
starting node and a (relative or absolute) string keypath.

Keyword arguments:

* start -- a CsNode instance or None
* path -- the path

### decrypt

```python
decrypt(ciphertext) -> str
```

When data is read over the CDB interface, the MAAPI interface or received
in event notifications, the data for the builtin types
tailf:aes-cfb-128-encrypted-string and
tailf:aes-256-cfb-128-encrypted-string is encrypted.
This function decrypts ciphertext and returns the clear text as
a string.

Keyword arguments:

* ciphertext -- encrypted string

### expr_op2str

```python
expr_op2str(op) -> str
```

Convert confd_expr_op value to a string.

Keyword arguments:

* op -- confd_expr_op integer value

### fatal

```python
fatal(str) -> None
```

Utility function which formats a string, prints it to stderr and exits with
exit code 1. This function will never return.

Keyword arguments:

* str -- a message string

### find_cs_node

```python
find_cs_node(hkeypath, len) -> Union[CsNode, None]
```

Utility function which finds the CsNode corresponding to the len first
elements of the hashed keypath. To make the search consider the full
keypath leave out the len parameter.

Keyword arguments:

* hkeypath -- a HKeypathRef instance
* len -- number of elements to return (optional)

### find_cs_node_child

```python
find_cs_node_child(parent, xmltag) -> Union[CsNode, None]
```

Utility function which finds the CsNode corresponding to the child node
given as xmltag.

See confd_find_cs_node_child() in [confd_lib_lib(3)](../man/section3.md#confd_lib_lib).

Keyword arguments:

* parent -- the parent CsNode
* xmltag -- the child node

### find_cs_root

```python
find_cs_root(ns) -> Union[CsNode, None]
```

When schema information is available to the library, this function returns
the root of the tree representaton of the namespace given by ns for the
(first) toplevel node. For namespaces that are augmented into other
namespaces such that they do not have a toplevel node, this function returns
None - the nodes of such a namespace are found below the augment target
node(s) in other tree(s).

Keyword arguments:

* ns -- the namespace id

### find_ns_type

```python
find_ns_type(nshash, name) -> Union[CsType, None]
```

Returns a CsType type definition for the type named name, which is defined
in the namespace identified by nshash, or None if the type could not be
found. If nshash is 0, the type name will be looked up among the built-in
types (i.e. the YANG built-in types, the types defined in the YANG
"tailf-common" module, and the types defined in the "confd" and "xs"
namespaces).

Keyword arguments:

* nshash -- a namespace hash or 0 (0 searches for built-in types)
* name -- the name of the type

### get_leaf_list_type

```python
get_leaf_list_type(node) -> CsType
```

For a leaf-list node, the type() method in the CsNodeInfo identifies a
"list type" for the leaf-list "itself". This function returns the type
of the elements in the leaf-list, i.e. corresponding to the type
substatement for the leaf-list in the YANG module.

Keyword arguments:

* node -- The CsNode of the leaf-list

### get_nslist

```python
get_nslist() -> list
```

Provides a list of the namespaces known to the library as a list of
five-tuples. Each tuple contains the the namespace hash (int), the prefix
(string), the namespace uri (string), the revision (string), and the
module name (string).

If schemas are not loaded an empty list will be returned.

### hash2str

```python
hash2str(hash) -> Union[str, None]
```

Returns a string representing the node name given by hash, or None if the
hash value is not found. Requires that schema information has been loaded
from the NCS daemon into the library - otherwise it always returns None.

Keyword arguments:

* hash -- a hash

### hkeypath_dup

```python
hkeypath_dup(hkeypath) -> HKeypathRef
```

Duplicates a HKeypathRef object.

Keyword arguments:

* hkeypath -- a HKeypathRef instance

### hkeypath_dup_len

```python
hkeypath_dup_len(hkeypath, len) -> HKeypathRef
```

Duplicates the first len elements of hkeypath.

Keyword arguments:

* hkeypath -- a HKeypathRef instance
* len -- number of elements to include in the copy

### hkp_prefix_tagmatch

```python
hkp_prefix_tagmatch(hkeypath, tags) -> bool
```

A simplified version of hkp_tagmatch() - it returns True if the tagpath
matches a prefix of the hkeypath, i.e. it is equivalent to calling
hkp_tagmatch() and checking if the return value includes CONFD_HKP_MATCH_TAGS.

Keyword arguments:

* hkeypath -- a HKeypathRef instance
* tags -- a list of XmlTag instances

### hkp_tagmatch

```python
hkp_tagmatch(hkeypath, tags) -> int
```

When checking the hkeypaths that get passed into each iteration in e.g.
cdb_diff_iterate() we can either explicitly check the paths, or use this
function to do the job. The tags list (typically statically initialized)
specifies a tagpath to match against the hkeypath. See cdb_diff_match().

Keyword arguments:

* hkeypath -- a HKeypathRef instance
* tags -- a list of XmlTag instances

### init

```python
init(name, file, level) -> None
```

Initializes the ConfD library. Must be called before any other NCS API
functions are called. There should be no need to call this function
directly. It is called internally when the Python module is loaded.

Keyword arguments:

* name -- e
* file -- (optional)
* level -- (optional)

### internal_connect

```python
internal_connect(id, sock, ip, port, path) -> None
```

Internal function used by NCS Python VM.

### list_filter_type2str

```python
list_filter_type2str(op) -> str
```

Convert confd_list_filter_type value to a string.

Keyword arguments:

* type -- confd_list_filter_type integer value

### max_object_size

```python
max_object_size(object) -> int
```

Utility function which returns the maximum size (i.e. the needed length of
the confd_value_t array) for an "object" retrieved by cdb_get_object(),
maapi_get_object(), and corresponding multi-object functions.

Keyword arguments:

* object -- the CsNode

### mmap_schemas

```python
mmap_schemas(filename) -> None
```

If shared memory schema support has been enabled, this function will
will map a shared memory segment into the current process address space
and make it ready for use.

The filename can be obtained by using the get_schema_file_path() function

The filename argument specifies the pathname of the file that is used as
backing store.

Keyword arguments:

* filename -- a filename string

### next_object_node

```python
next_object_node(object, cur, value) -> Union[CsNode, None]
```

Utility function to allow navigation of the confd_cs_node schema tree in
parallel with the confd_value_t array populated by cdb_get_object(),
maapi_get_object(), and corresponding multi-object functions.

The cur parameter is the CsNode for the current value, and the value
parameter is the current value in the array. The function returns a CsNode
for the next value in the array, or None when the complete object has been
traversed. In the initial call for a given traversal, we must pass
self.children() for the cur parameter - this always points to the CsNode
for the first value in the array.

Keyword arguments:

* object -- CsNode of the list container node
* cur -- The CsNode of the current value
* value -- The current value

### ns2prefix

```python
ns2prefix(ns) -> Union[str, None]
```

Returns a string giving the namespace prefix for the namespace ns, if the
namespace is known to the library - otherwise it returns None.

Keyword arguments:

* ns -- a namespace hash

### pp_kpath

```python
pp_kpath(hkeypath) -> str
```

Utility function which pretty prints a string representation of the path
hkeypath. This will use the NCS curly brace notation, i.e.
"/servers/server{www}/ip". Requires that schema information is available
to the library.

Keyword arguments:

* hkeypath -- a HKeypathRef instance

### pp_kpath_len

```python
pp_kpath_len(hkeypath, len) -> str
```

A variant of pp_kpath() that prints only the first len elements of hkeypath.

Keyword arguments:

* hkeypath -- a _lib.HKeypathRef instance
* len -- number of elements to print

### set_debug

```python
set_debug(level, file) -> None
```

Sets the debug level

Keyword arguments:

* file -- (optional)
* level -- (optional)

### set_kill_child_on_parent_exit

```python
set_kill_child_on_parent_exit() -> bool
```

Instruct the operating system to kill this process if the parent process
exits.

### str2hash

```python
str2hash(str) -> int
```

Returns the hash value representing the node name given by str, or 0 if the
string is not found.  Requires that schema information has been loaded from
the NCS daemon into the library - otherwise it always returns 0.

Keyword arguments:

* str -- a name string

### stream_connect

```python
stream_connect(sock, id, flags, ip, port, path) -> None
```

Connects a stream socket to NCS.

Keyword arguments:

* sock -- a Python socket instance
* id -- id
* flags -- flags
* ip -- ip address - if sock family is AF_INET or AF_INET6 (optional)
* port -- port - if sock family is AF_INET or AF_INET6 (optional)
* path -- a filename - if sock family is AF_UNIX (optional)

### xpath_pp_kpath

```python
xpath_pp_kpath(hkeypath) -> str
```

Utility function which pretty prints a string representation of the path
hkeypath. This will format the path as an XPath, i.e.
"/servers/server[name="www"']/ip". Requires that schema information is
available to the library.

Keyword arguments:

* hkeypath -- a HKeypathRef instance


## Classes

### _class_ **AttrValue**

This type represents the c-type confd_attr_value_t.

The contructor for this type has the following signature:

AttrValue(attr, v) -> object

Keyword arguments:

* attr -- attribute type
* v -- value

Members:

<details>

<summary>attr</summary>

attribute type (int)

</details>

<details>

<summary>v</summary>

attribute value (Value)

</details>

### _class_ **AuthorizationInfo**

This type represents the c-type struct confd_authorization_info.

AuthorizationInfo cannot be directly instantiated from Python.

Members:

<details>

<summary>groups</summary>

authorization groups (list of strings)

</details>

### _class_ **CsCase**

This type represents the c-type struct confd_cs_case.

CsCase cannot be directly instantiated from Python.

Members:

<details>

<summary>choices(...)</summary>

Method:

```python
choices() -> Union[CsChoice, None]
```

Returns the CsCase choices.

</details>

<details>

<summary>first(...)</summary>

Method:

```python
first() -> Union[CsNode, None]
```

Returns the CsCase first.

</details>

<details>

<summary>last(...)</summary>

Method:

```python
last() -> Union[CsNode, None]
```

Returns the CsCase last.

</details>

<details>

<summary>next(...)</summary>

Method:

```python
next() -> Union[CsCase, None]
```

Returns the CsCase next.

</details>

<details>

<summary>ns(...)</summary>

Method:

```python
ns() -> int
```

Returns the CsCase ns hash.

</details>

<details>

<summary>parent(...)</summary>

Method:

```python
parent() -> Union[CsChoice, None]
```

Returns the CsCase parent.

</details>

<details>

<summary>tag(...)</summary>

Method:

```python
tag() -> int
```

Returns the CsCase tag hash.

</details>

### _class_ **CsChoice**

This type represents the c-type struct confd_cs_choice.

CsChoice cannot be directly instantiated from Python.

Members:

<details>

<summary>case_parent(...)</summary>

Method:

```python
case_parent() -> Union[CsCase, None]
```

Returns the CsChoice case parent.

</details>

<details>

<summary>cases(...)</summary>

Method:

```python
cases() -> Union[CsCase, None]
```

Returns the CsChoice cases.

</details>

<details>

<summary>default_case(...)</summary>

Method:

```python
default_case() -> Union[CsCase, None]
```

Returns the CsChoice default case.

</details>

<details>

<summary>min_occurs(...)</summary>

Method:

```python
min_occurs() -> int
```

Returns the CsChoice minOccurs.

</details>

<details>

<summary>next(...)</summary>

Method:

```python
next() -> Union[CsChoice, None]
```

Returns the CsChoice next.

</details>

<details>

<summary>ns(...)</summary>

Method:

```python
ns() -> int
```

Returns the CsChoice ns hash.

</details>

<details>

<summary>parent(...)</summary>

Method:

```python
parent() -> Union[CsNode, None]
```

Returns the CsChoice parent CsNode.

</details>

<details>

<summary>tag(...)</summary>

Method:

```python
tag() -> int
```

Returns the CsChoice tag hash.

</details>

### _class_ **CsNode**

This type represents the c-type struct confd_cs_node.

CsNode cannot be directly instantiated from Python.

Members:

<details>

<summary>children(...)</summary>

Method:

```python
children() -> Union[CsNode, None]
```

Returns the children CsNode or None.

</details>

<details>

<summary>has_display_when(...)</summary>

Method:

```python
has_display_when() -> bool
```

Returns True if CsNode has YANG 'tailf:display-when' statement(s).

</details>

<details>

<summary>has_when(...)</summary>

Method:

```python
has_when() -> bool
```

Returns True if CsNode has YANG 'when' statement(s).

</details>

<details>

<summary>info(...)</summary>

Method:

```python
info() -> CsNodeInfo
```

Returns a CsNodeInfo.

</details>

<details>

<summary>is_action(...)</summary>

Method:

```python
is_action() -> bool
```

Returns True if CsNode is an action.

</details>

<details>

<summary>is_action_param(...)</summary>

Method:

```python
is_action_param() -> bool
```

Returns True if CsNode is an action parameter.

</details>

<details>

<summary>is_action_result(...)</summary>

Method:

```python
is_action_result() -> bool
```

Returns True if CsNode is an action result.

</details>

<details>

<summary>is_case(...)</summary>

Method:

```python
is_case() -> bool
```

Returns True if CsNode is a case.

</details>

<details>

<summary>is_container(...)</summary>

Method:

```python
is_container() -> bool
```

Returns True if CsNode is a container.

</details>

<details>

<summary>is_empty_leaf(...)</summary>

Method:

```python
is_empty_leaf() -> bool
```

Returns True if CsNode is a leaf which is empty.

</details>

<details>

<summary>is_key(...)</summary>

Method:

```python
is_key() -> bool
```

Returns True if CsNode is a key.

</details>

<details>

<summary>is_leaf(...)</summary>

Method:

```python
is_leaf() -> bool
```

Returns True if CsNode is a leaf.

</details>

<details>

<summary>is_leaf_list(...)</summary>

Method:

```python
is_leaf_list() -> bool
```

Returns True if CsNode is a leaf-list.

</details>

<details>

<summary>is_leafref(...)</summary>

Method:

```python
is_leafref() -> bool
```

Returns True if CsNode is a YANG 'leafref'.

</details>

<details>

<summary>is_list(...)</summary>

Method:

```python
is_list() -> bool
```

Returns True if CsNode is a list.

</details>

<details>

<summary>is_mount_point(...)</summary>

Method:

```python
is_mount_point() -> bool
```

Returns True if CsNode is a mount point.

</details>

<details>

<summary>is_non_empty_leaf(...)</summary>

Method:

```python
is_non_empty_leaf() -> bool
```

Returns True if CsNode is a leaf which is not of type empty.

</details>

<details>

<summary>is_notif(...)</summary>

Method:

```python
is_notif() -> bool
```

Returns True if CsNode is a notification.

</details>

<details>

<summary>is_np_container(...)</summary>

Method:

```python
is_np_container() -> bool
```

Returns True if CsNode is a non presence container.

</details>

<details>

<summary>is_oper(...)</summary>

Method:

```python
is_oper() -> bool
```

Returns True if CsNode is OPER data.

</details>

<details>

<summary>is_p_container(...)</summary>

Method:

```python
is_p_container() -> bool
```

Returns True if CsNode is a presence container.

</details>

<details>

<summary>is_union(...)</summary>

Method:

```python
is_union() -> bool
```

Returns True if CsNode is a union.

</details>

<details>

<summary>is_writable(...)</summary>

Method:

```python
is_writable() -> bool
```

Returns True if CsNode is writable.

</details>

<details>

<summary>next(...)</summary>

Method:

```python
next() -> Union[CsNode, None]
```

Returns the next CsNode or None.

</details>

<details>

<summary>ns(...)</summary>

Method:

```python
ns() -> int
```

Returns the namespace value.

</details>

<details>

<summary>parent(...)</summary>

Method:

```python
parent() -> Union[CsNode, None]
```

Returns the parent CsNode or None.

</details>

<details>

<summary>tag(...)</summary>

Method:

```python
tag() -> int
```

Returns the tag value.

</details>

### _class_ **CsNodeInfo**

This type represents the c-type struct confd_cs_node_info.

CsNodeInfo cannot be directly instantiated from Python.

Members:

<details>

<summary>choices(...)</summary>

Method:

```python
choices() -> Union[CsChoice, None]
```

Returns CsNodeInfo choices.

</details>

<details>

<summary>cmp(...)</summary>

Method:

```python
cmp() -> int
```

Returns CsNodeInfo cmp.

</details>

<details>

<summary>defval(...)</summary>

Method:

```python
defval() -> Value
```

Returns CsNodeInfo value.

</details>

<details>

<summary>flags(...)</summary>

Method:

```python
flags() -> int
```

Returns CsNodeInfo flags.

</details>

<details>

<summary>keys(...)</summary>

Method:

```python
keys() -> List[int]
```

Returns a list of hashed key values.

</details>

<details>

<summary>max_occurs(...)</summary>

Method:

```python
max_occurs() -> int
```

Returns CsNodeInfo max_occurs.

</details>

<details>

<summary>meta_data(...)</summary>

Method:

```python
meta_data() -> Union[Dict, None]
```

Returns CsNodeInfo meta_data.

</details>

<details>

<summary>min_occurs(...)</summary>

Method:

```python
min_occurs() -> int
```

Returns CsNodeInfo min_occurs.

</details>

<details>

<summary>shallow_type(...)</summary>

Method:

```python
shallow_type() -> int
```

Returns CsNodeInfo shallow_type.

</details>

<details>

<summary>type(...)</summary>

Method:

```python
type() -> int
```

Returns CsNodeInfo type.

</details>

### _class_ **CsType**

This type represents the c-type struct confd_type.

CsType cannot be directly instantiated from Python.

Members:

<details>

<summary>bitbig_size(...)</summary>

Method:

```python
bitbig_size() -> int
```

Returns the maximum size needed for the byte array for the BITBIG value
when a YANG bits type has a highest position above 63. If this is not a
BITBIG value or if the highest position is 63 or less, this function will
return 0.

</details>

<details>

<summary>defval(...)</summary>

Method:

```python
defval() -> Union[CsType, None]
```

Returns the CsType defval.

</details>

<details>

<summary>parent(...)</summary>

Method:

```python
parent() -> Union[CsType, None]
```

Returns the CsType parent.

</details>

### _class_ **DateTime**

This type represents the c-type struct confd_datetime.

The contructor for this type has the following signature:

DateTime(year, month, day, hour, min, sec, micro, timezone,
         timezone_minutes) -> object

Keyword arguments:

* year -- the year (int)
* month -- the month (int)
* day -- the day (int)
* hour -- the hour (int)
* min -- minutes (int)
* sec -- seconds (int)
* micro -- micro seconds (int)
* timezone -- the timezone (int)
* timezone_minutes -- number of timezone_minutes (int)

Members:

<details>

<summary>day</summary>

the day

</details>

<details>

<summary>hour</summary>

the hour

</details>

<details>

<summary>micro</summary>

micro seconds

</details>

<details>

<summary>min</summary>

minutes

</details>

<details>

<summary>month</summary>

the month

</details>

<details>

<summary>sec</summary>

seconds

</details>

<details>

<summary>timezone</summary>

timezone

</details>

<details>

<summary>timezone_minutes</summary>

timezone minutes

</details>

<details>

<summary>year</summary>

the year

</details>

### _class_ **HKeypathRef**

This type represents the c-type confd_hkeypath_t.

HKeypathRef implements some sequence methods which enables indexing,
iteration and length checking. There is also support for slicing, e.g:

Lets say the variable hkp is a valid hkeypath pointing to '/foo/bar{a}/baz'
and we slice that object like this:

    newhkp = hkp[1:]

In this case newhkp will be a new hkeypath pointing to '/foo/bar{a}'.
Note that the last element must always be included, so trying to create
a slice with hkp[1:2] will fail.

The example above could also be written using the dup_len() method:

    newhkp = hkp.dup_len(3)

Retrieving an element of the HKeypathRef when the underlying Value is of
type C_XMLTAG returns a XmlTag instance. In all other cases a tuple of
Values is returned.

When receiving an HKeypathRef object as on argument in a callback method,
the underlying object is only borrowed, so this particular instance is only
valid inside that callback method. If one, for some reason, would like
to keep the HKeypathRef object 'alive' for any longer than that, use
dup() or dup_len() to get a copy of it. Slicing also creates a copy.

HKeypathRef cannot be directly instantiated from Python.

Members:

<details>

<summary>dup(...)</summary>

Method:

```python
dup() -> HKeypathRef
```

Duplicates this hkeypath.

</details>

<details>

<summary>dup_len(...)</summary>

Method:

```python
dup_len(len) -> HKeypathRef
```

Duplicates the first len elements of this hkeypath.

Keyword arguments:

* len -- number of elements to include in the copy

</details>

### _class_ **ProgressLink**

This type represents the c-type struct confd_progress_link.

confdProgressLink cannot be directly instantiated from Python.

Members:

<details>

<summary>span_id</summary>

span id (string)

</details>

<details>

<summary>trace_id</summary>

trace id (string)

</details>

### _class_ **QueryResult**

This type represents the c-type struct confd_query_result.

QueryResult implements some sequence methods which enables indexing,
iteration and length checking.

QueryResult cannot be directly instantiated from Python.

Members:

<details>

<summary>nelements</summary>

number of elements (int)

</details>

<details>

<summary>nresults</summary>

number of results (int)

</details>

<details>

<summary>offset</summary>

the offset (int)

</details>

<details>

<summary>type</summary>

the query result type (int)

</details>

### _class_ **SnmpVarbind**

This type represents the c-type struct confd_snmp_varbind.

The contructor for this type has the following signature:

SnmpVarbind(type, val, vartype, name, oid, cr) -> object

Keyword arguments:

* type -- SNMP_VARIABLE, SNMP_OID or SNMP_COL_ROW (int)
* val -- value (Value)
* vartype -- snmp type (optional)
* name -- mandatory if type is SNMP_VARIABLE (string)
* oid -- mandatory if type is SNMP_OID (list of integers)
* cr -- mandatory if type is SNMP_COL_ROW (described below)

When type is SNMP_COL_ROW the cr argument must be provided. It is built up
as a 2-tuple like this: tuple(string, list(int)).

The first element of the 2-tuple is the column name.

The second element (the row index) is a list of up to 128 integers.

Members:

<details>

<summary>type</summary>

the SnmpVarbind type

</details>

### _class_ **TagValue**

This type represents the c-type confd_tag_value_t.

In addition to the 'ns' and 'tag' attributes there is an additional
attribute 'v' which containes the Value object.

The contructor for this type has the following signature:

TagValue(xmltag, v, tag, ns) -> object

There are two ways to contruct this object. The first one requires that both
xmltag and v are specified. The second one requires that both tag and ns are
specified.

Keyword arguments:

* xmltag -- a XmlTag instance (optional)
* v -- a Value instance (optional)
* tag -- tag hash (optional)
* ns -- namespace hash (optional)

Members:

<details>

<summary>ns</summary>

namespace hash

</details>

<details>

<summary>tag</summary>

tag hash

</details>

### _class_ **TransCtxRef**

This type represents the c-type struct confd_trans_ctx.

Available attributes:

* fd -- worker socket (int)
* th -- transaction handle (int)
* secondary_index -- secondary index number for list traversal (int)
* username -- from user session (string) DEPRECATED, see uinfo
* context -- from user session (string) DEPRECATED, see uinfo
* uinfo -- user session (UserInfo)
* accumulated -- if the data provider is using the accumulate functionality
                 this attribute will contain the first dp.TrItemRef object
                 in the linked list, otherwise if will be None
* traversal_id -- unique id for the get_next* invocation

TransCtxRef cannot be directly instantiated from Python.

Members:

_None_

### _class_ **UserInfo**

This type represents the c-type struct confd_user_info.

UserInfo cannot be directly instantiated from Python.

Members:

<details>

<summary>actx_thandle</summary>

actx_thandle -- action context transaction handle

</details>

<details>

<summary>addr</summary>

addr -- ip address (string)

</details>

<details>

<summary>af</summary>

af -- address family AF_INIT or AF_INET6 (int)

</details>

<details>

<summary>clearpass</summary>

clearpass -- password if available (string)

</details>

<details>

<summary>context</summary>

context -- the context (string)

</details>

<details>

<summary>flags</summary>

flags -- CONFD_USESS_FLAG_... (int)

</details>

<details>

<summary>lmode</summary>

lmode -- the lock we have (int)

</details>

<details>

<summary>logintime</summary>

logintime -- time for login (long)

</details>

<details>

<summary>port</summary>

port -- source port (int)

</details>

<details>

<summary>proto</summary>

proto -- protocol (int)

</details>

<details>

<summary>snmp_v3_ctx</summary>

snmp_v3_ctx -- SNMP context (string)

</details>

<details>

<summary>username</summary>

username -- the username (string)

</details>

<details>

<summary>usid</summary>

usid -- user session id (int)

</details>

### _class_ **Value**

This type represents the c-type confd_value_t.

The contructor for this type has the following signature:

Value(init, type) -> object

If type is not provided it will be automatically set by inspecting the type
of argument init according to this table:

Python type      |  Value type
-----------------|------------
bool             |  C_BOOL
int              |  C_INT32
long             |  C_INT64
float            |  C_DOUBLE
string           |  C_BUF

If any other type is provided for the init argument, the type will be set to
C_BUF and the value will be the string representation of init.

For types C_XMLTAG, C_XMLBEGIN and C_XMLEND the init argument must be a
2-tuple which specifies the ns and tag values like this: (ns, tag).

For type C_IDENTITYREF the init argument must be a
2-tuple which specifies the ns and id values like this: (ns, id).

For types C_IPV4, C_IPV6, C_DATETIME, C_DATE, C_TIME, C_DURATION, C_OID,
C_IPV4PREFIX and C_IPV6PREFIX, the init argument must be a string.

For type C_DECIMAL64 the init argument must be a string, or a 2-tuple which
specifies value and fraction digits like this: (value, fraction_digits).

For type C_BINARY the init argument must be a bytes instance.

Keyword arguments:

* init -- the initial value
* type -- type (optional, see confd_types(3))

Members:

<details>

<summary>as_decimal64(...)</summary>

Method:

```python
as_decimal64() -> Tuple[int, int]
```

Returns a tuple containing (value, fraction_digits) if this value is of
type C_DECIMAL64.

</details>

<details>

<summary>as_list(...)</summary>

Method:

```python
as_list() -> list
```

Returns a list of Value's if this value is of type C_LIST.

</details>

<details>

<summary>as_pyval(...)</summary>

Method:

```python
as_pyval() -> Any
```

Tries to convert a Value to a native Python type. If possible the object
returned will be of the same type as used when initializing a Value object.
If the type cannot be represented as something useful in Python a string
will be returned. Note that not all Value types are supported.

E.g. assuming you already have a value object, this should be possible
in most cases:

  newvalue = Value(value.as_pyval(), value.confd_type())

</details>

<details>

<summary>as_xmltag(...)</summary>

Method:

```python
as_xmltag() -> XmlTag
```

Returns a XmlTag instance if this value is of type C_XMLTAG.

</details>

<details>

<summary>confd_type(...)</summary>

Method:

```python
confd_type() -> int
```

Returns the confd type.

</details>

<details>

<summary>confd_type_str(...)</summary>

Method:

```python
confd_type_str() -> str
```

Returns a string representation for the Value type.

</details>

<details>

<summary>str2val(...)</summary>

Class method:

```python
str2val(value, schema_type) -> Value
(class method)
```

Create and return a Value from a string. The schema_type argument must be
either a 2-tuple with namespace and keypath, a CsNode instance or a CsType
instance.

Keyword arguments:

* value -- string value
* schema_type -- either (ns, keypath), a CsNode or a CsType

</details>

<details>

<summary>val2str(...)</summary>

Method:

```python
val2str(schema_type) -> str
```

Return a string representation of Value. The schema_type argument must be
either a 2-tuple with namespace and keypath, a CsNode instance or a CsType
instance.

Keyword arguments:

* schema_type -- either (ns, keypath), a CsNode or a CsType

</details>

### _class_ **XmlTag**

This type represent the c-type struct xml_tag.

The contructor for this type has the following signature:

XmlTag(ns, tag) -> object

Keyword arguments:

* ns -- namespace hash
* tag -- tag hash

Members:

<details>

<summary>ns</summary>

namespace hash value (unsigned int)

</details>

<details>

<summary>tag</summary>

tag hash value (unsigned int)

</details>

## Predefined Values

```python

ACCUMULATE = 1
ADDR = '127.0.0.1'
ALREADY_LOCKED = -4
ATTR_ANNOTATION = 2147483649
ATTR_BACKPOINTER = 2147483651
ATTR_INACTIVE = 0
ATTR_ORIGIN = 2147483655
ATTR_ORIGINAL_VALUE = 2147483653
ATTR_OUT_OF_BAND = 2147483664
ATTR_REFCOUNT = 2147483650
ATTR_TAGS = 2147483648
ATTR_WHEN = 2147483652
CANDIDATE = 1
CMP_EQ = 1
CMP_GT = 3
CMP_GTE = 4
CMP_LT = 5
CMP_LTE = 6
CMP_NEQ = 2
CMP_NOP = 0
CONFD_EOF = -2
CONFD_ERR = -1
CONFD_OK = 0
CONFD_PORT = 4565
CS_NODE_CMP_NORMAL = 0
CS_NODE_CMP_SNMP = 1
CS_NODE_CMP_SNMP_IMPLIED = 2
CS_NODE_CMP_UNSORTED = 4
CS_NODE_CMP_USER = 3
CS_NODE_HAS_DISPLAY_WHEN = 1024
CS_NODE_HAS_META_DATA = 2048
CS_NODE_HAS_MOUNT_POINT = 32768
CS_NODE_HAS_WHEN = 512
CS_NODE_IS_ACTION = 8
CS_NODE_IS_CASE = 128
CS_NODE_IS_CDB = 4
CS_NODE_IS_CONTAINER = 256
CS_NODE_IS_DYN = 1
CS_NODE_IS_LEAFREF = 16384
CS_NODE_IS_LEAF_LIST = 8192
CS_NODE_IS_LIST = 1
CS_NODE_IS_NOTIF = 64
CS_NODE_IS_PARAM = 16
CS_NODE_IS_RESULT = 32
CS_NODE_IS_STRING_AS_BINARY = 65536
CS_NODE_IS_WRITE = 2
CS_NODE_IS_WRITE_ALL = 4096
C_BINARY = 39
C_BIT32 = 29
C_BIT64 = 30
C_BITBIG = 50
C_BOOL = 17
C_BUF = 5
C_CDBBEGIN = 37
C_DATE = 20
C_DATETIME = 19
C_DECIMAL64 = 43
C_DEFAULT = 42
C_DOUBLE = 14
C_DQUAD = 46
C_DURATION = 27
C_EMPTY = 53
C_ENUM_HASH = 28
C_ENUM_VALUE = 28
C_HEXSTR = 47
C_IDENTITYREF = 44
C_INT16 = 7
C_INT32 = 8
C_INT64 = 9
C_INT8 = 6
C_IPV4 = 15
C_IPV4PREFIX = 40
C_IPV4_AND_PLEN = 48
C_IPV6 = 16
C_IPV6PREFIX = 41
C_IPV6_AND_PLEN = 49
C_LIST = 31
C_NOEXISTS = 1
C_OBJECTREF = 34
C_OID = 38
C_PTR = 36
C_QNAME = 18
C_STR = 4
C_SYMBOL = 3
C_TIME = 23
C_UINT16 = 11
C_UINT32 = 12
C_UINT64 = 13
C_UINT8 = 10
C_UNION = 35
C_XMLBEGIN = 32
C_XMLBEGINDEL = 45
C_XMLEND = 33
C_XMLMOVEAFTER = 52
C_XMLMOVEFIRST = 51
C_XMLTAG = 2
DB_INVALID = 0
DB_VALID = 1
DEBUG = 1
DELAYED_RESPONSE = 2
EOF = -2
ERR = -1
ERRCODE_ACCESS_DENIED = 3
ERRCODE_APPLICATION = 4
ERRCODE_APPLICATION_INTERNAL = 5
ERRCODE_DATA_MISSING = 8
ERRCODE_INCONSISTENT_VALUE = 2
ERRCODE_INTERNAL = 7
ERRCODE_INTERRUPT = 9
ERRCODE_IN_USE = 0
ERRCODE_PROTO_USAGE = 6
ERRCODE_RESOURCE_DENIED = 1
ERRINFO_KEYPATH = 0
ERRINFO_STRING = 1
ERR_ABORTED = 49
ERR_ACCESS_DENIED = 3
ERR_ALREADY_EXISTS = 2
ERR_APPLICATION_INTERNAL = 39
ERR_BADPATH = 8
ERR_BADSTATE = 17
ERR_BADTYPE = 5
ERR_BAD_CONFIG = 36
ERR_BAD_KEYREF = 14
ERR_CLI_CMD = 59
ERR_DATA_MISSING = 58
ERR_EOF = 45
ERR_EXTERNAL = 19
ERR_HA_ABORT = 71
ERR_HA_BADCONFIG = 69
ERR_HA_BADFXS = 27
ERR_HA_BADNAME = 29
ERR_HA_BADTOKEN = 28
ERR_HA_BADVSN = 52
ERR_HA_BIND = 30
ERR_HA_CLOSED = 26
ERR_HA_CONNECT = 25
ERR_HA_NOTICK = 31
ERR_HA_WITH_UPGRADE = 47
ERR_INCONSISTENT_VALUE = 38
ERR_INTERNAL = 18
ERR_INUSE = 11
ERR_INVALID_INSTANCE = 43
ERR_LIB_NOT_INITIALIZED = 34
ERR_LOCKED = 10
ERR_MALLOC = 20
ERR_MISSING_INSTANCE = 42
ERR_MUST_FAILED = 41
ERR_NOEXISTS = 1
ERR_NON_UNIQUE = 13
ERR_NOSESSION = 22
ERR_NOSTACK = 9
ERR_NOTCREATABLE = 6
ERR_NOTDELETABLE = 7
ERR_NOTMOVABLE = 46
ERR_NOTRANS = 61
ERR_NOTSET = 12
ERR_NOT_IMPLEMENTED = 51
ERR_NOT_WRITABLE = 4
ERR_NO_MOUNT_ID = 67
ERR_OS = 24
ERR_POLICY_COMPILATION_FAILED = 54
ERR_POLICY_EVALUATION_FAILED = 55
ERR_POLICY_FAILED = 53
ERR_PROTOUSAGE = 21
ERR_RESOURCE_DENIED = 37
ERR_STALE_INSTANCE = 68
ERR_START_FAILED = 57
ERR_SUBAGENT_DOWN = 33
ERR_TIMEOUT = 48
ERR_TOOMANYTRANS = 23
ERR_TOO_FEW_ELEMS = 15
ERR_TOO_MANY_ELEMS = 16
ERR_TOO_MANY_SESSIONS = 35
ERR_TRANSACTION_CONFLICT = 70
ERR_UNAVAILABLE = 44
ERR_UNSET_CHOICE = 40
ERR_UPGRADE_IN_PROGRESS = 60
ERR_VALIDATION_WARNING = 32
ERR_XPATH = 50
EXEC_COMPARE = 13
EXEC_CONTAINS = 11
EXEC_DERIVED_FROM = 9
EXEC_DERIVED_FROM_OR_SELF = 10
EXEC_RE_MATCH = 8
EXEC_STARTS_WITH = 7
EXEC_STRING_COMPARE = 12
FALSE = 0
FIND_NEXT = 0
FIND_SAME_OR_NEXT = 1
HKP_MATCH_FULL = 3
HKP_MATCH_HKP = 2
HKP_MATCH_NONE = 0
HKP_MATCH_TAGS = 1
INTENDED = 7
IN_USE = -5
ITER_CONTINUE = 3
ITER_RECURSE = 2
ITER_STOP = 1
ITER_SUSPEND = 4
ITER_UP = 5
ITER_WANT_ANCESTOR_DELETE = 2
ITER_WANT_ATTR = 4
ITER_WANT_CLI_ORDER = 1024
ITER_WANT_CLI_STR = 8
ITER_WANT_LEAF_FIRST_ORDER = 32
ITER_WANT_LEAF_LAST_ORDER = 64
ITER_WANT_PREV = 1
ITER_WANT_P_CONTAINER = 256
ITER_WANT_REVERSE = 128
ITER_WANT_SCHEMA_ORDER = 16
ITER_WANT_SUPPRESS_OPER_DEFAULTS = 2048
LF_AND = 1
LF_CMP = 3
LF_CMP_LL = 7
LF_EXEC = 5
LF_EXISTS = 4
LF_NOT = 2
LF_OR = 0
LF_ORIGIN = 6
LIB_API_VSN = 134610944
LIB_API_VSN_STR = '08060000'
LIB_PROTO_VSN = 86
LIB_PROTO_VSN_STR = '86'
LIB_VSN = 134610944
LIB_VSN_STR = '08060000'
LISTENER_CLI = 8
LISTENER_IPC = 1
LISTENER_NETCONF = 2
LISTENER_SNMP = 4
LISTENER_WEBUI = 16
LOAD_SCHEMA_HASH = 65536
LOAD_SCHEMA_NODES = 1
LOAD_SCHEMA_TYPES = 2
MMAP_SCHEMAS_FIXED_ADDR = 2
MMAP_SCHEMAS_KEEP_SIZE = 1
MOP_ATTR_SET = 6
MOP_CREATED = 1
MOP_DELETED = 2
MOP_MODIFIED = 3
MOP_MOVED_AFTER = 5
MOP_VALUE_SET = 4
NCS_ERR_CONNECTION_CLOSED = 64
NCS_ERR_CONNECTION_REFUSED = 56
NCS_ERR_CONNECTION_TIMEOUT = 63
NCS_ERR_DEVICE = 65
NCS_ERR_SERVICE_CONFLICT = 62
NCS_ERR_TEMPLATE = 66
NCS_LISTENER_NETCONF_CALL_HOME = 32
NCS_PORT = 4569
NO_DB = 0
OK = 0
OPERATIONAL = 4
PATH = None
PORT = 4569
PRE_COMMIT_RUNNING = 6
PROGRESS_INFO = 3
PROGRESS_START = 1
PROGRESS_STOP = 2
PROTO_CONSOLE = 4
PROTO_HTTP = 6
PROTO_HTTPS = 7
PROTO_SSH = 2
PROTO_SSL = 5
PROTO_SYSTEM = 3
PROTO_TCP = 1
PROTO_TLS = 9
PROTO_TRACE = 3
PROTO_UDP = 8
PROTO_UNKNOWN = 0
QUERY_HKEYPATH = 1
QUERY_HKEYPATH_VALUE = 2
QUERY_STRING = 0
QUERY_TAG_VALUE = 3
READ = 1
READ_WRITE = 2
RUNNING = 2
SERIAL_HKEYPATH = 2
SERIAL_NONE = 0
SERIAL_TAG_VALUE = 3
SERIAL_VALUE_T = 1
SILENT = 0
SNMP_COL_ROW = 3
SNMP_Counter32 = 6
SNMP_Counter64 = 9
SNMP_INTEGER = 1
SNMP_Interger32 = 2
SNMP_IpAddress = 5
SNMP_NULL = 0
SNMP_OBJECT_IDENTIFIER = 4
SNMP_OCTET_STRING = 3
SNMP_OID = 2
SNMP_Opaque = 8
SNMP_TimeTicks = 7
SNMP_Unsigned32 = 10
SNMP_VARIABLE = 1
STARTUP = 3
TIMEZONE_UNDEF = -111
TRACE = 2
TRANSACTION = 5
TRANS_CB_FLAG_FILTERED = 1
TRUE = 1
USESS_FLAG_FORWARD = 1
USESS_FLAG_HAS_IDENTIFICATION = 2
USESS_FLAG_HAS_OPAQUE = 4
USESS_LOCK_MODE_EXCLUSIVE = 2
USESS_LOCK_MODE_NONE = 0
USESS_LOCK_MODE_PRIVATE = 1
USESS_LOCK_MODE_SHARED = 3
VALIDATION_FLAG_COMMIT = 2
VALIDATION_FLAG_TEST = 1
VALIDATION_WARN = -3
VERBOSITY_DEBUG = 3
VERBOSITY_NORMAL = 0
VERBOSITY_VERBOSE = 1
VERBOSITY_VERY_VERBOSE = 2
```
