# Alarms

```
alarm-type
    ha-alarm
        certificate-expiration
        ha-node-down-alarm
            ha-primary-down
            ha-secondary-down
    ncs-cluster-alarm
        cluster-subscriber-failure
    ncs-dev-manager-alarm
        abort-error
        bad-user-input
        commit-through-queue-blocked
        commit-through-queue-failed
        commit-through-queue-rollback-failed
        configuration-error
        connection-failure
        final-commit-error
        missing-transaction-id
        ned-live-tree-connection-failure
        out-of-sync
        revision-error
    ncs-package-alarm
        package-load-failure
        package-operation-failure
    ncs-service-manager-alarm
        service-activation-failure
    ncs-snmp-notification-receiver-alarm
        receiver-configuration-error
    time-violation-alarm
        transaction-lock-time-violation
```

## Alarm Type Descriptions

<details>

<summary><code>abort-error</code></summary>

* **Initial Perceived Severity**  
  major
* **Description**  
  An error happened while aborting or reverting a transaction. Device's
configuration is likely to be inconsistent with the NCS CDB.
* **Recommended Action**  
  Inspect the configuration difference with compare-config,
  resolve conflicts with sync-from or sync-to if any.
* **Clear Condition(s)**  
  If NCS achieves sync with the device, or receives a transaction
  id for a netconf session towards the device, the alarm is cleared.
* **Alarm Message(s)**  
  * `Device {dev} is locked`
  * `Device {dev} is southbound locked`
  * `abort error`

</details>

<details>

<summary><code>alarm-type</code></summary>

* **Description**  
  Base identity for alarm types.  A unique identification of the
fault, not including the managed object.  Alarm types are used
to identify if alarms indicate the same problem or not, for
lookup into external alarm documentation, etc.  Different
managed object types and instances can share alarm types.  If
the same managed object reports the same alarm type, it is to
be considered to be the same alarm.  The alarm type is a
simplification of the different X.733 and 3GPP alarm IRP alarm
correlation mechanisms and it allows for hierarchical
extensions.  
A 'specific-problem' can be used in addition to the alarm type
in order to have different alarm types based on information not
known at design-time, such as values in textual SNMP
Notification varbinds.

</details>

<details>

<summary><code>bad-user-input</code></summary>

* **Initial Perceived Severity**  
  critical
* **Description**  
  Invalid input from user. NCS cannot recognize parameters needed to
connect to device.
* **Recommended Action**  
  Verify that the user supplied input are correct.
* **Clear Condition(s)**  
  This alarm is not cleared.
* **Alarm Message(s)**  
  * `Resource {resource} doesn't exist`

</details>

<details>

<summary><code>certificate-expiration</code></summary>

* **Description**  
  The certificate is nearing its expiry or has already expired.
The severity depends on the time left to expiry, it ranges from
warning to critical.
* **Recommended Action**  
  Replace certificate.
* **Clear Condition(s)**  
  This alarm is cleared when the certificate is no longer loaded.
* **Alarm Message(s)**  
  * `Certificate expires in less than {days} day(s)/Certificate has expired.`

</details>

<details>

<summary><code>cluster-subscriber-failure</code></summary>

* **Initial Perceived Severity**  
  critical
* **Description**  
  Failure to establish a notification subscription towards
a remote node.
* **Recommended Action**  
  Verify IP connectivity between cluster nodes.
* **Clear Condition(s)**  
  This alarm is cleared if NCS succeeds to establish a
  subscription towards the remote node, or when the subscription
  is explicitly stopped.
* **Alarm Message(s)**  
  * `Failed to establish netconf notification
  subscription to node ~s, stream ~s`
  * `Commit queue items with remote nodes will not receive required
  event notifications.`

</details>

<details>

<summary><code>commit-through-queue-blocked</code></summary>

* **Initial Perceived Severity**  
  warning
* **Description**  
  A commit was queued behind a queue item waiting to be able to
connect to one of its devices. This is potentially dangerous
since one unreachable device can potentially fill up the commit
queue indefinitely.
* **Clear Condition(s)**  
  An alarm raised due to a transient error will be cleared
  when NCS is able to reconnect to the device.
* **Alarm Message(s)**  
  * `Commit queue item ~p is blocked because item ~p cannot connect to ~s`

</details>

<details>

<summary><code>commit-through-queue-failed</code></summary>

* **Initial Perceived Severity**  
  critical
* **Description**  
  A queued commit failed.
* **Recommended Action**  
  Resolve with rollback if possible.
* **Clear Condition(s)**  
  This alarm is not cleared.
* **Alarm Message(s)**  
  * `Failed to connect to device {dev}: {reason}`
  * `Connection to {dev} timed out`
  * `Failed to authenticate towards device {device}: {reason}`
  * `The configuration database is locked for device {dev}: {reason}`
  * `the configuration database is locked by session {id} {identification}`
  * `Device {dev} is locked`
  * `the configuration database is locked by session {id} {identification}`
  * `{Reason}`
  * `{Dev}: Device is locked in a {Op} operation by session {session-id}`
  * `resource denied`
  * `Device {dev} is southbound locked`
  * `Commit queue item {CqId} rollback invoked`
  * `Commit queue item {CqId} has failed: Operation failed because:
  inconsistent database`
  * `Remote commit queue item ~p cannot be unlocked:
  cluster node not configured correctly`

</details>

<details>

<summary><code>commit-through-queue-rollback-failed</code></summary>

* **Initial Perceived Severity**  
  critical
* **Description**  
  Rollback of a commit-queue item failed.
* **Recommended Action**  
  Investigate the status of the device and resolve the
  situation by issuing the appropriate action, i.e., service
  redeploy or a sync operation.
* **Clear Condition(s)**  
  This alarm is not cleared.
* **Alarm Message(s)**  
  * `{Reason}`

</details>

<details>

<summary><code>configuration-error</code></summary>

* **Initial Perceived Severity**  
  critical
* **Description**  
  Invalid configuration of NCS managed device, NCS cannot recognize
parameters needed to connect to device.
* **Recommended Action**  
  Verify that the configuration parameters defined in
  tailf-ncs-devices.yang submodule are consistent for this device.
* **Clear Condition(s)**  
  The alarm is cleared when NCS reads the configuration
  parameters for the device, and is raised again if the
  parameters are invalid.
* **Alarm Message(s)**  
  * `Failed to resolve IP address for {dev}`
  * `the configuration database is locked by session {id} {identification}`
  * `{Reason}`
  * `Resource {resource} doesn't exist`

</details>

<details>

<summary><code>connection-failure</code></summary>

* **Initial Perceived Severity**  
  major
* **Description**  
  NCS failed to connect to a managed device before the timeout expired.
* **Recommended Action**  
  Verify address, port, authentication, check that the device is up
  and running. If the error occurs intermittently, increase
  connect-timeout.
* **Clear Condition(s)**  
  If NCS successfully reconnects to the device, the alarm is cleared.
* **Alarm Message(s)**  
  * `The connection to {dev} was closed`
  * `Failed to connect to device {dev}: {reason}`

</details>

<details>

<summary><code>final-commit-error</code></summary>

* **Initial Perceived Severity**  
  critical
* **Description**  
  A managed device validated a configuration change, but failed to
commit.  When this happens, NCS and the device are out of sync.
* **Recommended Action**  
  Reconcile by comparing and sync-from or sync-to.
* **Clear Condition(s)**  
  If NCS achieves sync with a device, the alarm is cleared.
* **Alarm Message(s)**  
  * `The connection to {dev} was closed`
  * `External error in the NED implementation for device {dev}: {reason}`
  * `Internal error in the NED NCS framework affecting device {dev}: {reason}`

</details>

<details>

<summary><code>ha-alarm</code></summary>

* **Description**  
  Base type for all alarms related to high availablity.
This is never reported, sub-identities for the specific
high availability alarms are used in the alarms.

</details>

<details>

<summary><code>ha-node-down-alarm</code></summary>

* **Description**  
  Base type for all alarms related to nodes going down in
high availablity. This is never reported, sub-identities
for the specific node down alarms are used in the alarms.

</details>

<details>

<summary><code>ha-primary-down</code></summary>

* **Initial Perceived Severity**  
  critical
* **Description**  
  The node lost the connection to the primary node.
* **Recommended Action**  
  Make sure the HA cluster is operational, investigate why
  the primary went down and bring it up again.
* **Clear Condition(s)**  
  This alarm is never automatically cleared and has to be cleared
  manually when the HA cluster has been restored.
* **Alarm Message(s)**  
  * `Lost connection to primary due to: Primary closed connection`
  * `Lost connection to primary due to: Tick timeout`
  * `Lost connection to primary due to: code {Code}`

</details>

<details>

<summary><code>ha-secondary-down</code></summary>

* **Initial Perceived Severity**  
  critical
* **Description**  
  The node lost the connection to a secondary node.
* **Recommended Action**  
  Investigate why the secondary node went down, fix the
  connectivity issue and reconnect the secondary to the
  HA cluster.
* **Clear Condition(s)**  
  This alarm is cleared when the secondary node is reconnected
  to the HA cluster.
* **Alarm Message(s)**  
  * `Lost connection to secondary`

</details>

<details>

<summary><code>missing-transaction-id</code></summary>

* **Initial Perceived Severity**  
  warning
* **Description**  
  A device announced in its NETCONF hello message that
it supports the transaction-id as defined in
http://tail-f.com/yang/netconf-monitoring.  However when
NCS tries to read the transaction-id no data is returned.
The NCS check-sync feature will not work. This is usually
a case of misconfigured NACM rules on the managed device.
* **Recommended Action**  
  Verify NACM rules on the concerned device.
* **Clear Condition(s)**  
  If NCS successfully reads a transaction id for which
  it had previously failed to do so, the alarm is cleared.
* **Alarm Message(s)**  
  * `{Reason}`

</details>

<details>

<summary><code>ncs-cluster-alarm</code></summary>

* **Description**  
  Base type for all alarms related to cluster.
This is never reported, sub-identities for the specific
cluster alarms are used in the alarms.

</details>

<details>

<summary><code>ncs-dev-manager-alarm</code></summary>

* **Description**  
  Base type for all alarms related to the device manager
This is never reported, sub-identities for the specific
device alarms are used in the alarms.

</details>

<details>

<summary><code>ncs-package-alarm</code></summary>

* **Description**  
  Base type for all alarms related to packages.
This is never reported, sub-identities for the specific
package alarms are used in the alarms.

</details>

<details>

<summary><code>ncs-service-manager-alarm</code></summary>

* **Description**  
  Base type for all alarms related to the service manager
This is never reported, sub-identities for the specific
service alarms are used in the alarms.

</details>

<details>

<summary><code>ncs-snmp-notification-receiver-alarm</code></summary>

* **Description**  
  Base type for SNMP notification receiver Alarms. This is never
reported, sub-identities for specific SNMP notification receiver
alarms are used in the alarms.

</details>

<details>

<summary><code>ned-live-tree-connection-failure</code></summary>

* **Initial Perceived Severity**  
  major
* **Description**  
  NCS failed to connect to a managed device using one of the optional
live-status-protocol NEDs.
* **Recommended Action**  
  Verify the configuration of the optional NEDs.
  If the error occurs intermittently, increase connect-timeout.
* **Clear Condition(s)**  
  If NCS successfully reconnects to the managed device,
  the alarm is cleared.
* **Alarm Message(s)**  
  * `The connection to {dev} was closed`
  * `Failed to connect to device {dev}: {reason}`

</details>

<details>

<summary><code>out-of-sync</code></summary>

* **Initial Perceived Severity**  
  major
* **Description**  
  A managed device is out of sync with NCS. Usually it means that the
device has been configured out of band from NCS point of view.
* **Recommended Action**  
  Inspect the difference with compare-config, reconcile by
  invoking sync-from or sync-to.
* **Clear Condition(s)**  
  If NCS achieves sync with a device, the alarm is cleared.
* **Alarm Message(s)**  
  * `Device {dev} is out of sync`
  * `Out of sync due to no-networking or failed commit-queue commits.`
  * `got: ~s expected: ~s.`

</details>

<details>

<summary><code>package-load-failure</code></summary>

* **Initial Perceived Severity**  
  critical
* **Description**  
  NCS failed to load a package.
* **Recommended Action**  
  Check the package for the reason.
* **Clear Condition(s)**  
  If NCS successfully loads a package for which an alarm
  was previously raised, it will be cleared.
* **Alarm Message(s)**  
  * `failed to open file {file}: {str}`
  * `Specific to the concerned package.`

</details>

<details>

<summary><code>package-operation-failure</code></summary>

* **Initial Perceived Severity**  
  critical
* **Description**  
  A package has some problem with its operation.
* **Recommended Action**  
  Check the package for the reason.
* **Clear Condition(s)**  
  This alarm is not cleared.

</details>

<details>

<summary><code>receiver-configuration-error</code></summary>

* **Initial Perceived Severity**  
  major
* **Description**  
  The snmp-notification-receiver could not setup its configuration,
either at startup or when reconfigured. SNMP notifications will now
be missed.
* **Recommended Action**  
  Check the error-message and change the configuration.
* **Clear Condition(s)**  
  This alarm will be cleared when the NCS is configured
  to successfully receive SNMP notifications
* **Alarm Message(s)**  
  * `Configuration has errors.`

</details>

<details>

<summary><code>revision-error</code></summary>

* **Initial Perceived Severity**  
  major
* **Description**  
  A managed device arrived with a known module, but too new revision.
* **Recommended Action**  
  Upgrade the Device NED using the new YANG revision in order
  to use the new features in the device.
* **Clear Condition(s)**  
  If all device yang modules are supported by NCS,
  the alarm is cleared.
* **Alarm Message(s)**  
  * `The device has YANG module revisions not supported by
  NCS. Use the /devices/device/check-yang-modules
  action to check which modules that are not compatible.`

</details>

<details>

<summary><code>service-activation-failure</code></summary>

* **Initial Perceived Severity**  
  critical
* **Description**  
  A service failed during re-deploy.
* **Recommended Action**  
  Corrective action and another re-deploy is needed.
* **Clear Condition(s)**  
  If the service is successfully redeployed, the alarm is cleared.
* **Alarm Message(s)**  
  * `Multiple device errors:
{str}`

</details>

<details>

<summary><code>time-violation-alarm</code></summary>

* **Description**  
  Base type for all alarms related to time violations.
This is never reported, sub-identities for the specific
time violation alarms are used in the alarms.

</details>

<details>

<summary><code>transaction-lock-time-violation</code></summary>

* **Initial Perceived Severity**  
  warning
* **Description**  
  The transaction lock time exceeded its threshold and might be stuck
in the critical section. This threshold is configured in
/ncs-config/transaction-lock-time-violation-alarm/timeout.
* **Recommended Action**  
  Investigate if the transaction is stuck and possibly
  interrupt it by closing the user session which it is
  attached to.
* **Clear Condition(s)**  
  This alarm is cleared when the transaction has finished.
* **Alarm Message(s)**  
  * `Transaction lock time exceeded threshold.`

</details>

