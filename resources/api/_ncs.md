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

