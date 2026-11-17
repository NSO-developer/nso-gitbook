# Python ncs.ha Module

High-level API for the HA (High Availability) subsystem.

An HA cluster is a group of nodes that keep the same configuration. One
node is the primary. The other nodes are secondaries, and they get the
changes from the primary. Use this module to set the HA role of a node
and to read the HA status of a node.

This module is for an external HA framework: an application that
decides which node is the primary and then sets the role of each node.
In NSO, use it only for External HA. HA Raft does not use this API.
Rule-based HA sends its own role orders to the same HA subsystem, and
each order opens a new HA connection, which closes yours. Do not use
this module with HA Raft or rule-based HA.

The framework also needs the HA notifications, for example when a
secondary loses its primary. This module does not receive them. Use
the low-level events module (`_ncs.events` or `_confd.events`).

Example:

    import ncs

    with ncs.ha.HaConnection(token='secret') as ha:
        ha.be_primary('node0')
        status = ha.status()
        print(status.state.name, status.secondaries)

Types
-----

* `HaState`  -- the HA role of a node
* `HaNode`   -- a node in an HA cluster (node_id, address)
* `HaStatus` -- the result of a status query (state, primary, secondaries)
* `HaConnection` -- a connection that controls one HA node

Errors
------

A failed call raises `error.Error`. Its code attribute is an `ErrorCode`
member that tells the cause. The Raises section of each method lists
the codes. If a node cannot connect to another HA node, or the other
node closes the connection, the call raises
`error.HaRemoteConnectionError` (`ErrorCode.HA_CONNECT` or
`ErrorCode.HA_CLOSED`). A retry can then succeed. In NSO, a wrong name
for the primary also raises `error.HaRemoteConnectionError`, and a retry
does not help. The other HA codes show a problem in the token, the node
names, the data models, the version or the configuration of the nodes. A
retry does not help until you fix the problem.

## Classes

### _class_ **HaConnection**

A connection that controls one HA node.

The constructor connects to the node. You can use the object in a
with block. At the end of the block, the connection closes. You can
also call close(). After close(), each method raises `RuntimeError`.

A node accepts only one HA connection at a time. When you open a new
HaConnection to a node, the node closes the old connection and uses
the token of the new one. This also occurs when you open a connection
only to call status(). Thus, do not open a second connection to a node
that another part of your application controls.

If you give a socket to the constructor, you own the socket.
HaConnection does not close it, and you must close it yourself.

Each node name is a str. The low-level functions also accept a Value
as a node name, but this class does not.

Example:

    import ncs

    with ncs.ha.HaConnection(token='secret') as ha:
        ha.be_primary('node0')
        print(ha.status().state.name)

```python
HaConnection(token: 'str', *, ip: 'str' = '127.0.0.1', port: 'int | None' = None, path: 'str | None' = '/tmp/nso/nso-ipc', sock: '_socket.socket | None' = None) -> 'None'
```

Connect to the HA subsystem of a node.

If port is not None, the connection uses TCP to ip and port. If
port is None, the connection uses the IPC socket file at path.

The defaults come from environment variables. The module reads
them when you import it:

* NSO: `NCS_IPC_ADDR`, `NCS_IPC_PORT` and `NCS_IPC_PATH`.
* ConfD: `CONFD_IPC_ADDR` and `CONFD_IPC_PORT`.

Args:

* `token` -- The shared secret of the HA cluster. All the nodes in
             the cluster must use the same token.
* `ip` -- The IPv4 or IPv6 address of the node. The connection
          uses ip only if port is not None.
* `port` -- The port of the node. If port is None, the connection
            uses path.
* `path` -- The file name of the IPC socket of the node. The
            connection uses path only if port is None.
* `sock` -- A socket that is not connected. Its family must agree
            with ip, port and path. Give a socket if you must set it
            up before the connection, for example to bind a source
            address or to set socket options. Do not set a timeout,
            because the connection needs a blocking socket. If sock
            is None, `HaConnection` makes the socket and closes it in
            `close()`. If you give a socket, `HaConnection` does not
            close it, even if the connection fails.

Raises:
    `TypeError`: If token is not a str, or if sock is not a socket.
    `ValueError`: If port and path are both None.
    `error.Error`: If the connection to the node fails. If the node
        does not run, the code is `ErrorCode.OS`.

Members:

<details>

<summary>be_none(...)</summary>

Method:

```python
be_none(self) -> 'None'
```

Remove the HA role of this node.

After this call, the node is not the primary and not a secondary.
Its state is HaState.NONE.

Raises:

* `error.Error`: With `ErrorCode.BADSTATE`, if the node cannot
    change its role now, for example in start phase 0.

</details>

<details>

<summary>be_primary(...)</summary>

Method:

```python
be_primary(self, node_id: 'str') -> 'None'
```

Make this node the primary, and set the name of the node.

Args:

* `node_id` -- The name of this node.

Raises:

* `TypeError`: If node_id is not a str.
* `error.Error`: If the node cannot become the primary. The code
        is `ErrorCode.HA_BIND` if the node cannot listen for
        secondaries, `ErrorCode.BADSTATE` if the node cannot change
        its role now, for example in start phase 0, or
        `ErrorCode.HA_WITH_UPGRADE` during an upgrade.

</details>

<details>

<summary>be_secondary(...)</summary>

Method:

```python
be_secondary(self, node_id: 'str', primary: 'HaNode', *, wait_reply: 'bool' = True) -> 'None'
```

Make this node a secondary of a primary node.

If wait_reply is True, the call waits until CDB (the configuration
database) on this node is ready. Sometimes the node first copies
the full database from the primary. If wait_reply is False, the
call returns immediately. Use status() to find out when the node
joined the cluster.

If wait_reply is False and the join fails, status() does not tell
you the reason. The server sends the result only as an HA
notification, and this module cannot receive notifications. To
get the result, use the low-level events module (_ncs.events or
_confd.events).

Args:

* `node_id` -- The name of this node.
* `primary` -- The primary node. Its address must be an IPv4 or IPv6
             address.
* `wait_reply` -- If True, wait until CDB on this node is ready. The
                default is True.

Raises:
* `TypeError`: If `node_id` or `primary.node_id` is not a str, if
    primary is not an `HaNode`, or if `wait_reply` is not a bool.
* `ValueError`: If `primary.address` is not an IPv4 or IPv6 address.
* `error.HaRemoteConnectionError`: If `wait_reply` is True and this node
    cannot connect to the primary (`ErrorCode.HA_CONNECT`), or
    loses the connection (`ErrorCode.HA_CLOSED`). In NSO, the code
    is also `ErrorCode.HA_CONNECT` if `primary.node_id` is not the
    name of the primary. A retry does not help in that case.
* `error.Error`: If `wait_reply` is True and the primary does not
    accept this node. The code is `ErrorCode.HA_BADTOKEN` (the
    tokens differ, ConfD only), `ErrorCode.HA_BADNAME`
    (another node uses `node_id`, or, in ConfD only,
    `primary.node_id` is not the name of the primary),
    `ErrorCode.HA_BADFXS` (the data models differ),
    `ErrorCode.HA_BADVSN` (the versions differ) or
    `ErrorCode.HA_BADCONFIG` (the configurations do not agree).
    The code can also be `ErrorCode.BADSTATE` or
    `ErrorCode.HA_WITH_UPGRADE`, as for `be_primary()`.

</details>

<details>

<summary>close(...)</summary>

Method:

```python
close(self) -> 'None'
```

Close the connection. A second call does nothing.

If you gave a socket to the constructor, close() does not close
the socket. The methods of this object stop using it.

</details>

<details>

<summary>mark_secondary_dead(...)</summary>

Method:

```python
mark_secondary_dead(self, node_id: 'str') -> 'None'
```

Tell the primary that one of its secondaries is dead.

Call this method on the primary when your application finds that
a secondary does not respond. The primary drops the secondary,
even if the secondary still has an open connection. On a
secondary or on a node with no HA role, the call does nothing.

Args:

* `node_id` -- The name of the dead secondary.

Raises:

* `TypeError`: If node_id is not a str.
* `error.Error`: With `ErrorCode.BADSTATE`, if the node cannot
    change the cluster now, for example in start phase 0, or if
    this node is a relay (ConfD only).

</details>

<details>

<summary>status(...)</summary>

Method:

```python
status(self) -> 'HaStatus'
```

Get the HA status of the node.

Returns:
    An HaStatus with the HA role of the node, its primary and its
    secondaries.

</details>

### _class_ **HaNode**

A node in an HA cluster.

Attributes:

* `node_id` -- The name of the node.
* `address` -- The address of the node, as an IPv4 or IPv6 address. If
             the node uses external IPC (a transport that the application
             supplies), this is the address string that the node reported.
             If the address is not known, this is None.

```python
HaNode(node_id: 'str', address: 'str | None') -> None
```

Members:

_None_

### _class_ **HaState**

The HA role of a node.

Members:

* `NONE` -- The node is not in an HA cluster.
* `SECONDARY` -- The node is a secondary.
* `PRIMARY` -- The node is the primary.
* `SECONDARY_RELAY` -- The node is a secondary that sends the changes from
  the primary to other secondaries. Only ConfD has relays. NSO does not
  support them.

```python
HaState(*values)
```

Members:

<details>

<summary>NONE</summary>

```python
NONE = 1
```


</details>

<details>

<summary>PRIMARY</summary>

```python
PRIMARY = 3
```


</details>

<details>

<summary>SECONDARY</summary>

```python
SECONDARY = 2
```


</details>

<details>

<summary>SECONDARY_RELAY</summary>

```python
SECONDARY_RELAY = 4
```


</details>

<details>

<summary>as_integer_ratio(...)</summary>

Method:

```python
as_integer_ratio(self, /)
```

Return a pair of integers, whose ratio is equal to the original int.

The ratio is in lowest terms and has a positive denominator.

>>> (10).as_integer_ratio()
(10, 1)
>>> (-10).as_integer_ratio()
(-10, 1)
>>> (0).as_integer_ratio()
(0, 1)

</details>

<details>

<summary>bit_count(...)</summary>

Method:

```python
bit_count(self, /)
```

Number of ones in the binary representation of the absolute value of self.

Also known as the population count.

>>> bin(13)
'0b1101'
>>> (13).bit_count()
3

</details>

<details>

<summary>bit_length(...)</summary>

Method:

```python
bit_length(self, /)
```

Number of bits necessary to represent self in binary.

>>> bin(37)
'0b100101'
>>> (37).bit_length()
6

</details>

<details>

<summary>conjugate(...)</summary>

Method:

Returns self, the complex conjugate of any int.

</details>

<details>

<summary>denominator</summary>

the denominator of a rational number in lowest terms

</details>

<details>

<summary>from_bytes(...)</summary>

Class method:

```python
from_bytes(type, /, bytes, byteorder='big', *, signed=False)
```

Return the integer represented by the given array of bytes.

bytes
  Holds the array of bytes to convert.  The argument must either
  support the buffer protocol or be an iterable object producing bytes.
  Bytes and bytearray are examples of built-in objects that support the
  buffer protocol.
byteorder
  The byte order used to represent the integer.  If byteorder is 'big',
  the most significant byte is at the beginning of the byte array.  If
  byteorder is 'little', the most significant byte is at the end of the
  byte array.  To request the native byte order of the host system, use
  `sys.byteorder' as the byte order value.  Default is to use 'big'.
signed
  Indicates whether two's complement is used to represent the integer.

</details>

<details>

<summary>imag</summary>

the imaginary part of a complex number

</details>

<details>

<summary>is_integer(...)</summary>

Method:

```python
is_integer(self, /)
```

Returns True. Exists for duck type compatibility with float.is_integer.

</details>

<details>

<summary>name</summary>

The name of the Enum member.

</details>

<details>

<summary>numerator</summary>

the numerator of a rational number in lowest terms

</details>

<details>

<summary>real</summary>

the real part of a complex number

</details>

<details>

<summary>to_bytes(...)</summary>

Method:

```python
to_bytes(self, /, length=1, byteorder='big', *, signed=False)
```

Return an array of bytes representing an integer.

length
  Length of bytes object to use.  An OverflowError is raised if the
  integer is not representable with the given number of bytes.  Default
  is length 1.
byteorder
  The byte order used to represent the integer.  If byteorder is 'big',
  the most significant byte is at the beginning of the byte array.  If
  byteorder is 'little', the most significant byte is at the end of the
  byte array.  To request the native byte order of the host system, use
  `sys.byteorder' as the byte order value.  Default is to use 'big'.
signed
  Determines whether two's complement is used to represent the integer.
  If signed is False and a negative integer is given, an OverflowError
  is raised.

</details>

<details>

<summary>value</summary>

The value of the Enum member.

</details>

### _class_ **HaStatus**

The HA status of one node.

Attributes:

* `state` -- The HA role of the node, as an `HaState`.
* `primary` -- The primary of this node, as an `HaNode`. It is None if
  this node is the primary or has no HA role.
* `secondaries` -- The secondaries that connect to this node, as a
  tuple of `HaNode` objects. A primary has all its secondaries here, and
  a relay (ConfD only) has the secondaries that connect through it.
  For other nodes the tuple is empty.

```python
HaStatus(state: 'HaState', primary: 'HaNode | None', secondaries: 'tuple[HaNode, ...]') -> None
```

Members:

_None_

## Predefined Values

```python

STATE_NONE = 1
STATE_PRIMARY = 3
STATE_SECONDARY = 2
STATE_SECONDARY_RELAY = 4
```
