# confd_lib_ha Man Page

`confd_lib_ha` - library for connecting to NSO HA subsystem

## Synopsis

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

## Library

ConfD Library, (`libconfd`, `-lconfd`)

## Description

The `libconfd` shared library is used to connect to the NSO High
Availability (HA) subsystem. NSO can replicate the configuration data on
several nodes in a cluster. The purpose of this API is to manage the HA
functionality. The details on usage of the HA API are described in the
chapter High Availability in the Admin Guide.

## Functions

    int confd_ha_connect(
    int sock, const struct sockaddr* srv, int srv_sz, const char *token);

Connect a HA socket which can be used to control a NSO HA node. The
token is a secret string that must be shared by all participants in the
cluster. There can only be one HA socket towards NSO, a new call to
`confd_ha_connect()` makes NSO close the previous connection and reset
the token to the new value. Returns CONFD_OK or CONFD_ERR.

<div class="note">

If this call fails (i.e. does not return CONFD_OK), the socket
descriptor must be closed and a new socket created before the call is
re-attempted.

</div>

    int confd_ha_beprimary(
    int sock, confd_value_t *mynodeid);

Instruct a HA node to be primary and also give the node a name. Returns
CONFD_OK or CONFD_ERR.

*Errors:* CONFD_ERR_HA_BIND if we cannot bind the TCP socket,
CONFD_ERR_BADSTATE if NSO is still in start phase 0.

    int confd_ha_besecondary(
    int sock, confd_value_t *mynodeid, struct confd_ha_node *primary, int waitreply);

Instruct a NSO HA node to be secondary to a named primary. The
`waitreply` is a boolean int. If 1, the function is synchronous and it
will hang until the node has initialized its CDB database. This may mean
that the CDB database is copied in its entirety from the primary. If 0,
we do not wait for the reply, but it is possible to use a notifications
socket and get notified asynchronously via a HA_INFO_BESECONDARY_RESULT
notification. In both cases, it is also possible to use a notifications
socket and get notified asynchronously when CDB at the secondary is
initialized.

If the call of this function fails with `confd_errno`
CONFD_ERR_HA_CLOSED, it means that the initial synchronization with the
primary failed, either due to the socket being closed or due to a
timeout while waiting for a response from the primary. The function will
fail with error CONFD_ERR_BADSTATE if NSO is still in start phase 0.

*Errors:* CONFD_ERR_HA_CONNECT, CONFD_ERR_HA_BADNAME,
CONFD_ERR_HA_BADTOKEN, CONFD_ERR_HA_BADFXS, CONFD_ERR_HA_BADVSN,
CONFD_ERR_HA_CLOSED, CONFD_ERR_BADSTATE, CONFD_ERR_HA_BADCONFIG

    int confd_ha_berelay(
    int sock);

Instruct an established HA secondary node to be a relay for other
secondaries. This can be useful in certain deployment scenarios, but
makes the management of the cluster more complex. Returns CONFD_OK or
CONFD_ERR.

*Errors:* CONFD_ERR_HA_BIND if we cannot bind the TCP socket,
CONFD_ERR_BADSTATE if the node is not already a secondary.

    int confd_ha_benone(
    int sock);

Instruct a node to resume the initial state, i.e. neither primary nor
secondary.

*Errors:* CONFD_ERR_BADSTATE if NSO is still in start phase 0.

    int confd_ha_get_status(
    int sock, struct confd_ha_status *stat);

Query a NSO HA node for its status. If successful, the function
populates the confd_ha_status structure. This is the only HA related
function which is possible to call while the NSO daemon is still in
start phase 0.

    int confd_ha_secondary_dead(
    int sock, confd_value_t *nodeid);

This function must be used by the application to inform NSO HA subsystem
that another node which is possibly connected to NSO is dead.

*Errors:* CONFD_ERR_BADSTATE if NSO is still in start phase 0.

## See Also

`confd.conf(5)` - ConfD daemon configuration file format

The NSO User Guide
