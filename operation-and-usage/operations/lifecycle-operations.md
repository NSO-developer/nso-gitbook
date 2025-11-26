---
description: Manipulate and manage existing services and devices.
---

# Lifecycle Operations

Devices and services are the most important entities in NSO. Once created, they may be manipulated in several different ways. The three main categories of operations that affect the state of services and devices are:

* **Commit Flags:** Commit flags modify the transaction semantics.
* **Device Actions:** Explicit actions that modify the devices.
* **Service Actions:** Explicit actions that modify the services.

The purpose of this section is more of a quick reference guide, an enumeration of commonly used commands. The context in which these commands should be used is found in other parts of the documentation.

## Commit Flags <a href="#d5e5048" id="d5e5048"></a>

Commit flags may be present when issuing a `commit` command:

```
commit <flag>
```

Some of these flags may be configured to apply globally for all commits, under `/devices/global-settings`, or per device profile, under `/devices/profiles`.

Some of the more important flags are:

* `and-quit`: Exit to (CLI operational mode) after commit.
* `check`: Validate the pending configuration changes. Equivalent to `validate` command (See [NSO CLI](../cli/introduction-to-nso-cli.md) ).
* `comment | label`: Add a commit comment/label visible in compliance reports, rollback files, etc.
* `dry-run`: Validate and display the configuration changes but do not perform the actual commit. Neither CDB nor the devices are affected. Instead, the effects that would have taken place are shown in the returned output. The output format can be set with the `outformat` option. Possible output formats are: `xml`, `cli`, and `native`.
  * The `xml` format displays all changes in the whole data model. The changes will be displayed in NETCONF XML edit-config format, i.e., the edit-config that would be applied locally (at NCS) to get a config that is equal to that of the managed device.
  * The `cli` format displays all changes in the whole data model. The changes will be displayed in CLI curly bracket format.
  * The `native` format displays only changes under `/devices/device/config`. The changes will be displayed in native device format. The `native` format can be used with the `reverse` option to display the device commands for getting back to the current running state in the network if the commit is successfully executed. Beware that if any changes are done later on the same data, the `reverse` device commands returned are invalid.
*   `no-networking`: Validate the configuration changes, and update the CDB but do not update the actual devices. This is equivalent to first setting the admin state to southbound locked, then issuing a standard commit. In both cases, the configuration changes are prevented from being sent to the actual devices.

    {% hint style="danger" %}
    If the commit implies changes, it will make the device out-of-sync.

    The `sync-to` command can then be used to push the change to the network.
    {% endhint %}
*   `no-out-of-sync-check`: Commit even if the device is out of sync. This can be used in scenarios where you know that the change you are doing is not in conflict with what is on the device and do not want to perform the action `sync-from` first. Verify the result by using the action `compare-config.`

    {% hint style="danger" %}
    The device's sync state is assumed to be unknown after such commit and the stored `last-transaction-id` value is cleared.
    {% endhint %}
*   `no-overwrite`: NSO will check that the data that should be modified has not changed on the device compared to NSO's view of the data. This is a fine-granular sync check; NSO verifies that NSO and the device are in sync regarding the data that will be modified. If they are not in sync, the transaction is aborted.\
    \
    This parameter is particularly useful in brownfield scenarios where the device is always out of sync due to being directly modified by operators or other management systems.

    {% hint style="danger" %}
    The device's sync state is assumed to be unknown after such commit and the stored `last-transaction-id` value is cleared.
    {% endhint %}
* `no-revision-drop`: Fail if one or more devices have obsolete device models.\
  When NSO connects to a managed device the version of the device data model is discovered. Different devices in the network might have different versions. When NSO is requested to send configuration to devices, NSO defaults to drop any configuration that only exists in later models than the device supports. This flag forces NSO to never silently drop any data set operations towards a device.
* `no-deploy`: Commit without invoking the service create method, i.e., write the service instance data without activating the service(s). The service(s) can later be redeployed to write the changes of the service(s) to the network.
* `reconcile`: Reconcile the service data. All data which existed before the service was created will now be owned by the service. When the service is removed, that data will also be removed. In technical terms, the reference count will be decreased by one for everything that existed before the service. If manually configured data exists below in the configuration tree that data is kept unless the option `discard-non-service-config` is used.
* `use-lsa`: Force handling of the LSA nodes as such. This flag tells NSO to propagate applicable commit flags and actions to the LSA nodes without applying them on the upper NSO node itself. The commit flags affected are `dry-run`, `no-networking`, `no-out-of-sync-check`, `no-overwrite`, and `no-revision-drop`.
* `no-lsa`: Do not handle any of the LSA nodes as such. These nodes will be handled as any other device.
* `commit-queue`: Commit through the commit queue (see [Commit Queue](nso-device-manager.md#user_guide.devicemanager.commit-queue)). While the configuration change is committed to CDB immediately it is not committed to the actual device but rather queued for eventual commit to increase transaction throughput. This enables the use of the commit queue feature for individual `commit` commands without enabling it by default.\
  \
  Possible operation modes are `async`, `sync`, and `bypass`.
  * If the `async` mode is set, the operation returns successfully if the transaction data has been successfully placed in the queue.
  * The `sync` mode will cause the operation to not return until the transaction data has been sent to all devices, or a timeout occurs. If the timeout occurs the transaction data stays in the queue and the operation returns successfully. The timeout value can be specified with the `timeout` or `infinity` option. By default, the timeout value is determined by what is configured in `/devices/global-settings/commit-queue/sync`.
  * The `bypass` mode means that if `/devices/global-settings/commit-queue/enabled-by-default` is `true`, the data in this transaction will bypass the commit queue. The data will be written directly to the devices. The operation will still fail if the commit queue contains one or more entries affecting the same device(s) as the transaction to be committed.\
    \
    In addition, the `commit-queue` flag has a number of other useful options that affect the resulting queue item:
  * The `tag` option sets a user-defined opaque tag that is present in all notifications and events sent referencing the queue item.
  * The `block-others` option will cause the resulting queue item to block subsequent queue items which use any of the devices in this queue item, from being queued.
  * The `lock` option will place a lock on the resulting queue item. The queue item will not be processed until it has been unlocked, see the actions `unlock` and `lock` in `/devices/commit-queue/queue-item`. No following queue items, using the same devices, will be allowed to execute as long as the lock is in place.
  * The `atomic` option sets the atomic behavior of the resulting queue item. If this is set to `false`, the devices contained in the resulting queue item can start executing if the same devices in other non-atomic queue items ahead of it in the queue are completed. If set to `true`, the atomic integrity of the queue item is preserved.
  *   Depending on the selected `error-option`, NSO will store the reverse of the original transaction to be able to undo the transaction changes and get back to the previous state. This data is stored in the `/devices/commit-queue/completed` tree from where it can be viewed and invoked with the `rollback` action. When invoked, the data will be removed. Possible values are: `continue-on-error`, `rollback-on-error`, and `stop-on-error`.

      * The `continue-on-error` value means that the commit queue will continue on errors. No rollback data will be created.
      * The `rollback-on-error` value means that the commit queue item will roll back on errors. The commit queue will place a lock on the failed queue item, thus blocking other queue items with overlapping devices from being executed. The `rollback` action will then automatically be invoked when the queue item has finished its execution. The lock will be removed as part of the rollback.
      * The `stop-on-error` means that the commit queue will place a lock on the failed queue item, thus blocking other queue items with overlapping devices from being executed. The lock must then either manually be released when the error is fixed, or the `rollback` action under `/devices/commit-queue/completed` be invoked.

      Read about error recovery in [Commit Queue](nso-device-manager.md#user_guide.devicemanager.commit-queue) for a more detailed explanation.
* `trace-id`: Use the provided trace ID as part of the log messages emitted while processing. If no trace ID is given, NSO is going to generate and assign a trace ID to the processing.

All commands in NSO can also have pipe commands. A useful pipe command for commit is `details`:

```cli
ncs% commit | details
```

This will give feedback on the steps performed in the commit.

When working with templates, there is a pipe command `debug` which can be used to troubleshoot templates. To enable debugging on all templates use:

```cli
ncs% commit | debug template
```

When configuring using many templates the debug output can be overwhelming. For this reason, there is an option to only get debug information for one template, in this example, a template named `l3vpn`:

```cli
ncs% commit | debug template l3vpn
```

## Device Actions <a href="#d5e5227" id="d5e5227"></a>

Actions for devices can be performed globally on the `/devices` path and for individual devices on `/devices/device/name`. Many actions are also available on device groups as well as device ranges.

<details>

<summary><code>add-capability</code></summary>

This action adds a capability to the list of capabilities. If `uri` is specified, then it is parsed as a YANG capability string and `module`, `revision`, `feature` and `deviation` parameters are derived from the string. If `module` is specified, then the namespace is looked up in the list of loaded namespaces, and the capability string is constructed automatically. If the `module` is specified and the attempt to look it up fails, then the action does nothing. If `module` is specified or can be derived from the capability string, then the `module` is also added/replaced in the list of modules. This action is only intended to be used for pre-provisioning; it is not possible to override capabilities and modules provided by the NED implementation using this action.

</details>

<details>

<summary><code>apply-template</code></summary>

Take a named template and apply its configuration here.

If the `accept-empty-capabilities` parameter is included, the template is applied to devices even if the capability of the device is unknown.

This action will behave differently depending on whether it is invoked with a transaction or not. When invoked with a transaction (such as via the CLI) it will apply the template to it and leave it to the user to commit or revert the resulting changes. If invoked without a transaction (for example when invoked via RESTCONF), the action will automatically create one and commit the resulting changes. An error will be returned and the transaction aborted if the template failed to apply on any of the devices.

</details>

<details>

<summary><code>check-sync</code></summary>

Check if the NSO copy of the device configuration is in sync with the actual device configuration, using device-specific mechanisms. This operation is usually cheap as it only compares a signature of the configuration from the device rather than comparing the entire configuration.

Depending on the device the signature is implemented as a transaction-id, timestamp, hash-sum or not at all. The capability must be supported by the corresponding NED. The output might say unsupported, and then the only way to perform this would be to do a full `compare-config` command.

As some NEDs implement the signature as a hash-sum of the entire configuration, this operation might for some devices be just as expensive as performing a full `compare-config` command.

</details>

<details>

<summary><code>check-yang-modules</code></summary>

Check if the device YANG modules loaded by NSO have revisions that are compatible with the ones reported by the device.

This can indicate for example that the device has a YANG module of later revision than the corresponding NED.

</details>

<details>

<summary><code>clear-trace</code></summary>

Clear all trace files for all active traces for all managed devices.

</details>

<details>

<summary><code>compare-config</code></summary>

Retrieve the config from the device and compare it to the NSO locally stored copy.

</details>

<details>

<summary><code>connect</code></summary>

Set up a session to the unlocked device. This is not used in real operational scenarios. NSO automatically establishes connections on demand. However, it is useful for test purposes when installing new NEDs, adding devices, etc.

When a device is southbound locked, all southbound communication is turned off. The `override-southbound-locked` flag overrides the southbound lock for connection attempts. Thus, this is a way to update the capabilities including revision information for a managed device although the device is southbound locked.

</details>

<details>

<summary><code>copy-capabilities</code></summary>

This action copies the list of capabilities and the list of modules from another device or profile. When used on a device, this action is only intended to be used for pre-provisioning: it is not possible to override capabilities and modules provided by the NED implementation using this action.

Note that this action overwrites the existing list of capabilities.

</details>

<details>

<summary><code>delete-config</code></summary>

Delete the device configuration in NSO without executing the corresponding delete on the managed device.

</details>

<details>

<summary><code>disconnect</code></summary>

Close all sessions to the device.

</details>

<details>

<summary><code>fetch-ssh-host-keys</code></summary>

Retrieve the SSH host keys from all devices, or all devices in the given device group, and store them in each device's `ssh/host-key` list. Successfully retrieved new or updated keys are always committed by the action.

</details>

<details>

<summary><code>find-capabilities</code></summary>

This action populates the list of capabilities based on the configured ned-id for the device, if possible. NSO will look up the package corresponding to the ned-id and add all the modules from these packages to the list of device capabilities and list of modules. It is the responsibility of the caller to verify that the automatically populated list of capabilities matches the actual device's capabilities. The list of capabilities can then be fine-tuned using `add-capability` and `capability/remove` actions. Currently, this approach will only work for CLI and generic devices. This action is only intended to be used for pre-provisioning: it is not possible to override capabilities and modules provided by the NED implementation using this action.

Note that this action overwrites the existing list of capabilities.

</details>

<details>

<summary><code>instantiate-from-other-device</code></summary>

Instantiate the configuration for the device as a copy of the configuration of some other already working device.

</details>

<details>

<summary><code>load-native-config</code></summary>

Load configuration data in native format into the transaction. This action is only applicable to devices with NETCONF, CLI, and generic NEDs.

The action can load the configuration data either from a file in the local filesystem or as a string through the northbound client. If loading XML the data must be a valid XML document, either with a single namespace or wrapped in a config node with the http://tail-f.com/ns/config/1.0 namespace.

The `verbose` option can be used to show additional parse information reported by the NED. By default, the behavior is to merge the configuration that is applied. This can be changed by setting the `mode` option to replace. This will replace the entire device configuration.

This action will behave differently depending on if it is invoked with a transaction or not. When invoked with a transaction (such as via the CLI), it will load the configuration into it and leave it to the user to commit or revert the resulting changes. If invoked without a transaction (for example, when invoked via RESTCONF), the action will automatically create one and commit the resulting changes.

</details>

<details>

<summary><code>migrate</code></summary>

Change the NED identity and migrate all data. As a side-effect reads and commits the actual device configuration.

The action reports what paths have been modified and the services affected by those changes. If the `verbose` option is used, all service instances are reported instead of just the service points. If the `dry-run` option is used, the action simply reports what it would do.

If the `no-networking` option is used, no southbound traffic is generated toward the devices. Only the device configuration in CDB is used for the migration. If used, NSO can not know if the device is in sync. To determine this, the **compare-config** or the **sync-from** action must be used.

</details>

<details>

<summary><code>partial-sync-from</code></summary>

Synchronize parts of the devices' configuration by pulling from the network.

</details>

<details>

<summary><code>ping</code></summary>

ICMP ping the device.

</details>

<details>

<summary><code>scp-from</code></summary>

Secure copy the file from the device.

The `port` option specifies the port to connect to on the device. If this leaf is not configured, NSO will use the port for the management interface of the device.

The `preserve` option preserves modification times, access times, and modes from the original file. This is not always supported by the device.

</details>

<details>

<summary><code>scp-to</code></summary>

Secure copy file to the device.

The `port` option specifies the port to connect to on the device. If this leaf is not configured, NSO will use the port for the management interface of the device.

The `preserve` option preserves modification times, access times, and modes from the original file. This is not always supported by the device.

</details>

<details>

<summary><code>sync-from</code></summary>

Synchronize the NSO copy of the device configuration by reading the actual device configuration. The change will be immediately committed to NSO.

If the `dry-run` option is used, the action simply reports (in different formats) what it would do. The `verbose` option can be used to show additional parse information reported by the NED.

If you have any services that has created configuration on the device the corresponding service might be out-of-sync. Use the commands `check-sync` and `re-deploy` to reconcile this.

</details>

<details>

<summary><code>sync-to</code></summary>

Synchronize the device configuration by pushing the NSO copy to the device.

NSO pushes a minimal diff to the device. The diff is calculated by reading the configuration from the device and comparing it with the configuration in NSO.

If the `dry-run` option is used, the action simply reports (in different formats) what it would do.

Some of the operations above can't be performed while the device is being committed to (or waiting in the commit queue). This is to avoid getting inconsistent data when reading the configuration. The `wait-for-lock` option in these specifies a timeout to wait for a device lock to be placed in the commit queue. The lock will be automatically released once the action has been executed. If the `no-wait-for-lock` option is specified, the action will fail immediately for the device if the lock is taken for the device or if the device is placed in the commit queue. The `wait-for-lock` and the `no-wait-for-lock` options are device settings as well, they can be set as a device profile, device, and global setting. The `no-wait-for-lock` option is set in the global settings by default. If neither `wait-for-lock` and the `no-wait-for-lock` options are provided together with the action, the device setting is used.

</details>

## Service Actions <a href="#d5e5403" id="d5e5403"></a>

Service actions are performed on the service instance.

<details>

<summary><code>check-sync</code></summary>

Check if the service has been undermined, i.e., if the service was to be re-deployed, would it do anything? This action will invoke the FASTMAP code to create the change set that is compared to the existing data in CDB locally.

If `outformat` is a boolean, `true` is returned if the service is in sync, i.e., a re-deploy would do nothing. If `outformat` is `cli`, `xml` or `native`, the changes that the service would do to the network if re-deployed are returned.

If configuration changes have been made out-of-band then `deep-check-sync` is needed to detect an out-of-sync condition.

The `deep` option is used to recursively `check-sync` stacked services. The `shallow` option only `check-sync` the topmost service.

</details>

<details>

<summary><code>deep-check-sync</code></summary>

Check if the service has been undermined on the device itself. The action `check-sync` compares the output of the service code to what is stored in CDB locally. This action retrieves the configuration from the devices touched by the service and compares the forward diff set of the service to the retrieved data. This is thus a fairly heavy-weight operation. As opposed to the `check-sync` action that invokes the FASTMAP code, this action re-applies the forward diff-set. This is the same output you see when inspecting the `get-modifications` operational field in the service instance.

If the device is in sync with CDB, the output of this action is identical to the output of the cheaper `check-sync` action.

</details>

<details>

<summary><code>get-modifications</code></summary>

Returns the data the service modified, either in CLI curly bracket format or NETCONF XML edit-config format. The modifications are shown as if the service instance was the only instance that modifies the data. This data is only available if the parameter `/services/global-settings/collect-forward-diff` is set to true.

If the parameter `reverse` is given, the modifications needed to reverse the effect of the service is shown. The modifications are shown as if this service instance was the last service instance. This will be applied if the service is deleted. This data is always available.

The `deep` option is used to recursively `get-modifications` for stacked services. The `shallow` option only `get-modifications` for the topmost service.

</details>

<details>

<summary><code>re-deploy</code></summary>

Run the service code again, possibly writing the changes of the service to the network once again. There are several reasons for performing this operation such as:

* a `device sync-from` action has been performed to incorporate an out-of-band change.
* data referenced by the service has changed such as topology information, QoS policy definitions, etc.

The `deep` option is used to recursively `re-deploy` stacked services. The `shallow` option only `re-deploy` the topmost service.

If the `dry-run` option is used, the action simply reports (in different formats) what it would do.

Use the option `reconcile` if the service should reconcile original data, i.e., take control of that data. This option acknowledges other services controlling the same data. All data which existed before the service was created will now be owned by the service. When the service is removed that data will also be removed. In technical terms, the reference count will be decreased by one for everything that existed prior to the service. If manually configured data exists below in the configuration tree that data is kept unless the option `discard-non-service-config` is used.

Note: The action is idempotent. If no configuration diff exists then nothing needs to be done.

Note: The NSO general principle of minimum change applies.

</details>

<details>

<summary><code>reactive-re-deploy</code></summary>

This is a tailored `re-deploy` intended to be used in the reactive FASTMAP scenario. It differs from the ordinary `re-deploy` in that this action does not take any commit parameters.

This action will `re-deploy` the services as a shallow depth `re-deploy`. It will be performed with the same user as the original commit. Also, the commit parameters will be identical to the latest commit involving this service.

By default, this action is asynchronous and returns nothing. Use the `sync` leaf to get synchronous behavior and block until the service `re-deploy` transaction is committed. The `sync` leaf also means that the action will possibly return a commit result, such as commit queue ID if any, or an error if the transaction failed.

</details>

<details>

<summary><code>touch</code></summary>

This action marks the service as changed.

Executing the action `touch` followed by a commit is the same as executing the action `re-deploy shallow`.

By using the action `touch`, several re-deploys can be performed in the same transaction.

</details>

<details>

<summary><code>un-deploy</code></summary>

Undo the effects of the service instance but keep the service itself. The service can later be re-deployed. This is a means to deactivate a service while keeping it in the system.

</details>
