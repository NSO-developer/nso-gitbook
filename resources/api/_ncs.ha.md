# Python _ncs.ha Module

Low level module for connecting to NCS HA subsystem.

This module is used to connect to the NCS High Availability (HA)
subsystem. NCS can replicate the configuration data on several nodes
in a cluster. The purpose of this API is to manage the HA
functionality. The details on usage of the HA API are described in the
chapter High availability in the User Guide.

This documentation should be read together with the [confd_lib_ha(3)](../man/section3.md#confd_lib_ha) man page.

## Functions

<details>

<summary>bemaster</summary>

```python
bemaster(sock, mynodeid) -> None
```

This function is deprecated and will be removed.
Use beprimary() instead.

</details>

<details>

<summary>benone</summary>

```python
benone(sock) -> None
```

Instruct a node to resume the initial state, i.e. neither become primary
nor secondary.

Keyword arguments:

* sock -- a previously connected HA socket

</details>

<details>

<summary>beprimary</summary>

```python
beprimary(sock, mynodeid) -> None
```

Instruct a HA node to be primary and also give the node a name.

Keyword arguments:

* sock -- a previously connected HA socket
* mynodeid -- name of the node (Value or string)

</details>

<details>

<summary>berelay</summary>

```python
berelay(sock) -> None
```

Instruct an established HA secondary node to be a relay for other
secondary nodes.

Keyword arguments:

* sock -- a previously connected HA socket

</details>

<details>

<summary>besecondary</summary>

```python
besecondary(sock, mynodeid, primary_id, primary_ip, waitreply) -> None
```

Instruct a NCS HA node to be a secondary node with a named primary node.
If waitreply is True the function is synchronous and it will hang until the
node has initialized its CDB database. This may mean that the CDB database
is copied in its entirety from the primary node. If False, we do not wait
for the reply, but it is possible to use a notifications socket and get
notified asynchronously via a HA_INFO_BESECONDARY_RESULT notification.
In both cases, it is also possible to use a notifications socket and get
notified asynchronously when CDB at the secondary node is initialized.

Keyword arguments:

* sock       -- a previously connected HA socket
* mynodeid   -- name of this secondary node (Value or string)
* primary_id -- name of the primary node (Value or string)
* primary_ip -- ip address of the primary node
* waitreply  -- synchronous or not (bool)

</details>

<details>

<summary>beslave</summary>

```python
beslave(sock, mynodeid, primary_id, primary_ip, waitreply) -> None
```

This function is deprecated and will be removed.
Use besecondary() instead.

</details>

<details>

<summary>connect</summary>

```python
connect(sock, token, ip, port, pstr) -> None
```

Connect a HA socket which can be used to control a NCS HA node. The token
is a secret string that must be shared by all participants in the cluster.
There can only be one HA socket towards NCS. A new call to
ha_connect() makes NCS close the previous connection and reset the token to
the new value.

Keyword arguments:

* sock -- a Python socket instance
* token -- secret string
* ip -- the ip address if socket is AF_INET or AF_INET6 (optional)
* port -- the port if socket is AF_INET or AF_INET6 (optional)
* pstr -- a filename if socket is AF_UNIX (optional).

</details>

<details>

<summary>secondary_dead</summary>

```python
secondary_dead(sock, nodeid) -> None
```

This function must be used by the application to inform NCS HA subsystem
that another node which is possibly connected to NCS is dead.

Keyword arguments:

* sock -- a previously connected HA socket
* nodeid -- name of the node (Value or string)

</details>

<details>

<summary>slave_dead</summary>

```python
slave_dead(sock, nodeid) -> None
```

This function is deprecated and will be removed.
Use secondary_dead() instead.

</details>

<details>

<summary>status</summary>

```python
status(sock) -> None
```

Query a ConfD HA node for its status.

Returns a 2-tuple of the HA status of the node in the format
(State,[list_of_nodes]) where 'list_of_nodes' is the primary/secondary(s)
connected with node.

Keyword arguments:

* sock -- a previously connected HA socket

</details>


