# Python _ncs.ha Module

Low level module for connecting to NCS HA subsystem.

This module is used to connect to the NCS High Availability (HA)
subsystem. NCS can replicate the configuration data on several nodes
in a cluster. The purpose of this API is to manage the HA
functionality. The details on usage of the HA API are described in the
chapter High availability in the User Guide.

This documentation should be read together with the [confd_lib_ha(3)](../../resources/man/confd_lib_ha.3.md) man page.

## Functions

### benone

```python
benone(sock) -> None
```

This function is deprecated and will be removed in a future release.
Use `ncs.ha.HaConnection.be_none()` instead.

Instruct a node to resume the initial state, i.e. neither become primary
nor secondary.

Keyword arguments:

* sock -- a previously connected HA socket

### beprimary

```python
beprimary(sock, mynodeid) -> None
```

This function is deprecated and will be removed in a future release.
Use `ncs.ha.HaConnection.be_primary()` instead.

Instruct a HA node to be primary and also give the node a name.

Keyword arguments:

* sock -- a previously connected HA socket
* mynodeid -- name of the node (Value or string)

### besecondary

```python
besecondary(sock, mynodeid, primary_id, primary_ip, waitreply) -> None
```

This function is deprecated and will be removed in a future release.
Use `ncs.ha.HaConnection.be_secondary()` instead.

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

### connect

```python
connect(sock, token, ip, port, path) -> None
```

This function is deprecated and will be removed in a future release.
Use `ncs.ha.HaConnection` instead.

Connect a HA socket which can be used to control a NCS HA node. The token
is a secret string that must be shared by all participants in the cluster.
There can only be one HA socket towards NCS. A new call to `ha_connect()`
makes NCS close the previous connection and reset the token to
the new value.

Keyword arguments:

* sock -- a Python socket instance
* token -- secret string
* ip -- the ip address if socket is AF_INET or AF_INET6 (optional)
* port -- the port if socket is AF_INET or AF_INET6 (optional)
* path -- a filename if socket is AF_UNIX (optional).

### secondary_dead

```python
secondary_dead(sock, nodeid) -> None
```

This function is deprecated and will be removed in a future release.
Use `ncs.ha.HaConnection.mark_secondary_dead()` instead.

This function must be used by the application to inform NCS HA subsystem
that another node which is possibly connected to NCS is dead.

Keyword arguments:

* sock -- a previously connected HA socket
* nodeid -- name of the node (Value or string)

### status

```python
status(sock) -> tuple
```

This function is deprecated and will be removed in a future release.
Use `ncs.ha.HaConnection.status()` instead.

Query a ConfD HA node for its status.

Returns a 2-tuple (state, nodes). state is the HA state of the node:
STATE_NONE, STATE_SECONDARY or STATE_PRIMARY.
nodes is a list of the primary/secondary(s) connected with the node.
Each node is a dict with the keys 'nodeid' and 'address'. The address
is an IPv4 or IPv6 address string, the address string of a node that
uses external IPC, or None if it is not known.

Keyword arguments:

* sock -- a previously connected HA socket


## Predefined Values

```python

STATE_NONE = 1
STATE_PRIMARY = 3
STATE_SECONDARY = 2
```
