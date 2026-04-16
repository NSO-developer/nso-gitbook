---
description: Manipulate and manage existing services and devices.
---

# Lifecycle Operations

Devices and services are the most important entities in NSO. Once created, they may be manipulated in several different ways. The three main categories of operations that affect the state of services and devices are:

* **Commit Parameters:** Commit parameters modify the transaction semantics. In the CLI they are exposed as commit flags.
* **Device Actions:** Explicit actions that modify the devices.
* **Service Actions:** Explicit actions that modify the services.

The purpose of this section is more of a quick reference guide, an enumeration of available commands. The context in which these commands should be used is found in other parts of the documentation.

## Commit Parameters <a href="#d5e5048" id="d5e5048"></a>

NSO uses the shared YANG module `tailf-ncs-commit-params.yang` to define commit parameters, dry-run parameters, and commit results for northbound interfaces and SDK APIs. The groupings and `sx:structure` definitions in this module are reused by NSO modules such as `tailf-netconf-ncs.yang`, `tailf-restconf-ncs.yang`, `tailf-yang-patch-ncs.yang`, `tailf-ncs-rollback.yang`, `tailf-ncs-services.yang`, and `tailf-ncs-devices.yang`.

In the CLI, these parameters are exposed as commit flags:

```cli
commit label nightly-batch no-networking
```

The same shared model is used by the main northbound interfaces:

* JSON-RPC passes a structured `params` object that matches `tailf-ncs-commit-params:commit-params`.
* RESTCONF passes the same structure as base64-encoded JSON in the `params` query parameter or the `X-Cisco-NSO-Commit-Params` header. The header form is an alternative to the `params` query parameter when the client prefers not to place the often long, URL-encoded base64 commit-parameter payload in the request URI, for example when other query parameters are also used.
* NETCONF augments `commit`, `edit-config`, `copy-config`, and `prepare-transaction` with the same parameters.
* MAAPI and the language SDKs expose helpers for the built-in parameters and generic tagged-value or XML access for augmented parameters.

Some of these parameters may be configured to apply globally for all commits under `/devices/global-settings`, or per device profile under `/devices/profiles`.

The shared commit parameters are:

* `label`, `comment`: Add user-defined metadata to the transaction. The data is visible in rollback files, compliance reports, notifications, and events. If supported, it is also propagated to participating devices.
* `dry-run`: Validate and return the resulting changes without updating CDB or devices.
  The `outformat` leaf selects `xml`, `cli`, `native`, or `cli-c`.
  The `reverse` leaf can be used with `native` or `cli-c` output to show the commands needed to return to the current running state.
  The `with-service-meta-data` leaf includes FASTMAP service metadata in the diff.
* `confirm-network-state`: Check device state as part of the commit and process out-of-band changes according to policy.
  The `re-evaluate-policies` leaf also reprocesses out-of-band policies for services touched by the commit.
* `no-networking`: Update CDB but do not send configuration southbound. The affected devices become out of sync until the change is pushed later, for example with `sync-to`.
* `no-out-of-sync-check`: Continue even if NSO detects that a device is out of sync.
* `no-overwrite`: Perform a fine-grained check that the data NSO is about to modify has not changed on the device compared to NSO's view.
* `no-revision-drop`: Fail instead of silently dropping configuration that is not supported by an older device model revision.
* `no-deploy`: Write service data without invoking the service create callback.
* `reconcile`: Reconcile service ownership for existing configuration.
  The `keep-non-service-config`, `discard-non-service-config`, `attach-non-service-config`, and `detach-non-service-config` leafs control how non-service-owned data is handled.
  The `include` and `exclude` leaf-lists limit reconciliation to selected service configuration paths.
* `use-lsa`, `no-lsa`: Control whether LSA nodes are handled as LSA nodes or as ordinary devices.
* `commit-queue`: Commit through the commit queue instead of pushing configuration transactionally in the same operation.
  The `async`, `sync`, and `bypass` leafs select the queue behavior.
  The `sync` container accepts either `timeout` or `infinity`.
  The `lock`, `block-others`, `atomic`, and `error-option` leafs control the resulting queue item.
  See [Commit Queue](nso-device-manager.md#user_guide.devicemanager.commit-queue) for details and error-recovery behavior.
* `trace-id`: Legacy trace identifier support as a commit parameter.
  Prefer Trace Context where available.

The model enforces parameter combinations. For example, `dry-run` cannot be combined with `no-overwrite`, `no-out-of-sync-check`, or `commit-queue`, and `use-lsa` cannot be combined with `no-lsa`.

The CLI also has local commit modifiers such as `check` and `and-quit`. These affect CLI behavior but are not part of `tailf-ncs-commit-params.yang`.

### Augmenting Commit Parameters

Developers can augment the `sx:structure commit-params` structure in `tailf-ncs-commit-params.yang` with their own parameters. Once augmented, the new parameters become available wherever the shared commit-parameter model is used, including propagation to lower LSA nodes.

```yang
module example-commit-params {
  yang-version 1.1;
  namespace "http://example.com/example-commit-params";
  prefix ecp;

  import ietf-yang-structure-ext {
    prefix sx;
  }
  import tailf-ncs-commit-params {
    prefix ncp;
  }

  sx:augment-structure "/ncp:commit-params" {
    container audit-context {
      presence "Attach extra audit information to the commit";
      leaf ticket-id {
        type string;
      }
    }
  }
}
```

### Accessing From User Code

Augmented commit parameters are accessible through MAAPI together with the built-in ones:

* Python: Use `trans.get_params()` or `trans.get_trans_params()`. Built-in parameters have helper methods on `CommitParams`, while augmented parameters can be read through `CommitParams.root` or `CommitParams.get_tagvalues()`.
* Java: Use `maapi.getTransParams(th)`. Built-in parameters have helper methods on `CommitParams`, while augmented parameters can be inspected through `CommitParams.getConfXMLParam()`.
* Lower-level MAAPI APIs expose the same data as tagged values or XML parameter arrays.

The [examples.ncs/sdk-api/maapi-commit-parameters](https://github.com/NSO-developer/nso-examples/tree/6.6/sdk-api/maapi-commit-parameters) example shows how to augment the shared commit-parameter model, how to access built-in commit parameters from Python and Java user code, and how to access augmented parameters from Python and Java user code. The Java package also illustrates the lower-level `CommitParams.getConfXMLParam()` access pattern for augmented parameters. A northbound example covering CLI, RESTCONF, NETCONF, and JSON-RPC is available in [examples.ncs/northbound-interfaces/commit-parameters](https://github.com/NSO-developer/nso-examples/tree/6.6/northbound-interfaces/commit-parameters).

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

The `device-select` option takes an XPath 1.0 expression that applies the action to the selected devices. The XPath expression can be a location path or an expression evaluated as a predicate to the `/devices/device` list. The `device-group` option takes a list of group names that expand to their group members. The `device`, `device-select`, and `device-group` options can be combined.

</details>

<details>

<summary><code>check-sync</code></summary>

Check if the NSO copy of the device configuration is in sync with the actual device configuration, using device-specific mechanisms. This operation is usually cheap as it only compares a signature of the configuration from the device rather than comparing the entire configuration.

Depending on the device the signature is implemented as a transaction-id, timestamp, hash-sum, or not at all. The capability must be supported by the corresponding NED. The output might say unsupported, and then the only way to perform this would be to do a full `compare-config` command.

As some NEDs implement the signature as a hash-sum of the entire configuration, this operation might for some devices be just as expensive as performing a full `compare-config` command.

The `device-select` option takes an XPath 1.0 expression that applies the action to the selected devices. The XPath expression can be a location path or an expression evaluated as a predicate to the `/devices/device` list. The `device-group` option takes a list of group names that expand to their group members. The `device`, `device-select`, and `device-group` options can be combined.

</details>

<details>

<summary><code>check-yang-modules</code></summary>

Check if the device YANG modules loaded by NSO have revisions that are compatible with the ones reported by the device.

This can indicate for example that the device has a YANG module of later revision than the corresponding NED.

The `device-select` option takes an XPath 1.0 expression that applies the action to the selected devices. The XPath expression can be a location path or an expression evaluated as a predicate to the `/devices/device` list. The `device-group` option takes a list of group names that expand to their group members. The `device`, `device-select`, and `device-group` options can be combined.

</details>

<details>

<summary><code>clear-trace</code></summary>

Clear all trace files for all active traces for all managed devices.

The `device-select` option takes an XPath 1.0 expression that applies the action to the selected devices. The XPath expression can be a location path or an expression evaluated as a predicate to the `/devices/device` list. The `device-group` option takes a list of group names that expand to their group members. The `device`, `device-select`, and `device-group` options can be combined.

</details>

<details>

<summary><code>compare-config</code></summary>

Retrieve the config from the device and compare it to the NSO locally stored copy.

</details>

<details>

<summary><code>connect</code></summary>

Set up a session to the unlocked device. This is not used in real operational scenarios. NSO automatically establishes connections on demand. However, it is useful for test purposes when installing new NEDs, adding devices, etc.

When a device is southbound locked, all southbound communication is turned off. The `override-southbound-locked` flag overrides the southbound lock for connection attempts. Thus, this is a way to update the capabilities including revision information for a managed device although the device is southbound locked.

The `device-select` option takes an XPath 1.0 expression that applies the action to the selected devices. The XPath expression can be a location path or an expression evaluated as a predicate to the `/devices/device` list. The `device-group` option takes a list of group names that expand to their group members. The `device`, `device-select`, and `device-group` options can be combined.oup members. The `device`, `device-select`, and `device-group` options can be combined.

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

The `device-select` option takes an XPath 1.0 expression that applies the action to the selected devices. The XPath expression can be a location path or an expression evaluated as a predicate to the `/devices/device` list. The `device-group` option takes a list of group names that expand to their group members. The `device`, `device-select`, and `device-group` options can be combined.

</details>

<details>

<summary><code>fetch-ssh-host-keys</code></summary>

Retrieve the SSH host keys from all devices, or all devices in the given device group, and store them in each device's `ssh/host-key` list. Successfully retrieved new or updated keys are always committed by the action.

The `device-select` option takes an XPath 1.0 expression that applies the action to the selected devices. The XPath expression can be a location path or an expression evaluated as a predicate to the `/devices/device` list. The `device-group` option takes a list of group names that expand to their group members. The `device`, `device-select`, and `device-group` options can be combined.

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

Since NSO 6.4 the `load-native-config` will create list entries with sharedCreate() and set leafs with sharedSet() if invoked inside a service for refcounters and backpointers to be created or updated.

</details>

<details>

<summary><code>migrate</code></summary>

Change the NED identity and migrate all data. As a side-effect reads and commits the actual device configuration.

The action reports what paths have been modified and the services affected by those changes. If the `verbose` option is used, all service instances are reported instead of just the service points. If the `dry-run` option is used, the action simply reports what it would do.

If the `no-networking` option is used, no southbound traffic is generated toward the devices. Only the device configuration in CDB is used for the migration. If used, NSO can not know if the device is in sync. To determine this, the **compare-config** or the **sync-from** action must be used.

The `device-select` option takes an XPath 1.0 expression that applies the action to the selected devices. The XPath expression can be a location path or an expression evaluated as a predicate to the `/devices/device` list. The `device-group` option takes a list of group names that expand to their group members. The `device`, `device-select`, and `device-group` options can be combined.

</details>

<details>

<summary><code>partial-sync-from</code></summary>

Synchronize parts of the devices' configuration by pulling from the network.

</details>

<details>

<summary><code>ping</code></summary>

ICMP pings the device.

</details>

<details>

<summary><code>scp-from</code></summary>

Securely copy the file from the device.

The `port` option specifies the port to connect to on the device. If this leaf is not configured, NSO will use the port for the management interface of the device.

The `preserve` option preserves modification times, access times, and modes from the original file. This is not always supported by the device.

The `protocol` option selects which protocol to use for the file transfer. SCP (default) or SFTP.

</details>

<details>

<summary><code>scp-to</code></summary>

Securely copy the file to the device.

The `port` option specifies the port to connect to on the device. If this leaf is not configured, NSO will use the port for the management interface of the device.

The `preserve` option preserves modification times, access times, and modes from the original file. This is not always supported by the device.

The `protocol` option selects which protocol to use for the file transfer. SCP (default) or SFTP.

The `device-select` option takes an XPath 1.0 expression that applies the action to the selected devices. The XPath expression can be a location path or an expression evaluated as a predicate to the `/devices/device` list. The `device-group` option takes a list of group names that expand to their group members. The `device`, `device-select`, and `device-group` options can be combined.

</details>

<details>

<summary><code>sync-from</code></summary>

Synchronize the NSO copy of the device configuration by reading the actual device configuration. The change will be immediately committed to NSO.

If the `dry-run` option is used, the action simply reports (in different formats) what it would do. The `verbose` option can be used to show additional parse information reported by the NED.

If you have any services that have created a configuration on the device, the corresponding service might be out of sync. Use the commands `check-sync` and `re-deploy` to reconcile this.

</details>

<details>

<summary><code>sync-to</code></summary>

Synchronize the device configuration by pushing the NSO copy to the device.

NSO pushes a minimal diff to the device. The diff is calculated by reading the configuration from the device and comparing it with the configuration in NSO.

If the `dry-run` option is used, the action simply reports (in different formats) what it would do.

Some of the operations above can't be performed while the device is being committed to (or waiting in the commit queue). This is to avoid getting inconsistent data when reading the configuration. The `wait-for-lock` option in these specifies a timeout to wait for a device lock to be placed in the commit queue. The lock will be automatically released once the action has been executed. If the `no-wait-for-lock` option is specified, the action will fail immediately for the device if the lock is taken for the device or if the device is placed in the commit queue. The `wait-for-lock` and the `no-wait-for-lock` options are device settings as well; they can be set as a device profile, device, and global setting. The `no-wait-for-lock` option is set in the global settings by default. If neither `wait-for-lock` and the `no-wait-for-lock` options are provided together with the action, the device setting is used.

The `device-select` option takes an XPath 1.0 expression that applies the action to the selected devices. The XPath expression can be a location path or an expression evaluated as a predicate to the `/devices/device` list. The `device-group` option takes a list of group names that expand to their group members. The `device`, `device-select`, and `device-group` options can be combined.

</details>

## Service Actions <a href="#d5e5403" id="d5e5403"></a>

Service actions are performed on the service instance.

<details>

<summary><code>check-sync</code></summary>

Check if the service has been undermined, i.e., if the service was to be redeployed, would it do anything? This action will invoke the FASTMAP code to create the change set that is compared to the existing data in CDB locally.

If `outformat` is a boolean, `true` is returned if the service is in sync, i.e., a re-deploy would do nothing. If `outformat` is `cli`, `xml` or `native`, the changes that the service would do to the network if re-deployed are returned.

If configuration changes have been made out-of-band, then `deep-check-sync` is needed to detect an out-of-sync condition.

The `deep` option is used to recursively `check-sync` stacked services. The `shallow` option only `check-sync` the topmost service.

If the parameter `with-service-meta-data` is given, service meta-data will also be considered when determining if the service is in sync. This provides a more comprehensive check that includes both configuration data and service meta-data.

</details>

<details>

<summary><code>deep-check-sync</code></summary>

Check if the service has been undermined on the device itself. The action `check-sync` compares the output of the service code to what is stored in CDB locally. This action retrieves the configuration from the devices touched by the service and compares the forward diff set of the service to the retrieved data. This is thus a fairly heavyweight operation. As opposed to the `check-sync` action that invokes the FASTMAP code, this action re-applies the forward diff-set. This is the same output you see when inspecting the `get-modifications` operational field in the service instance.

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

Run the service code again, possibly writing the changes of the service to the network once again. There are several reasons for performing this operation, such as:

* a `device sync-from` action has been performed to incorporate an out-of-band change.
* data referenced by the service has changed such as topology information, QoS policy definitions, etc.

The `deep` option is used to recursively `re-deploy` stacked services. The `shallow` option only `re-deploy` the topmost service.

If the `dry-run` option is used, the action simply reports (in different formats) what it would do. When the parameters `dry-run` and `with-service-meta-data` are used together with `outformat cli` or `outformat cli-c`, any changes to service meta-data that would be affected by the re-deploy operation will be included in the diff output.

Use the option `reconcile` if the service should reconcile original data, i.e., take control of that data. This option acknowledges other services controlling the same data. All data that existed before the service was created will now be owned by the service. When the service is removed, that data will also be removed. In technical terms, the reference count will be decreased by one for everything that existed prior to the service. If manually configured data exists below in the configuration tree that data is kept unless the option `discard-non-service-config` is used.

To control which configurations are to be reconciled, use option `include` / `exclude` together with option `reconcile`. Both options `include` and `exclude` will accept a list of instance identifiers as parameters.

* Option `include` will specify which configurations are to be reconciled in the scope of the redeployed service.
* Option `exclude` will specify which configurations are to be ignored during reconciliation. Note that `exclude` option can only be used with configuration subtrees whose root is not a child of any node created by the same service. This restriction ensures that when the service is removed, the parent of the excluded subtree is not deleted, which would otherwise result in the unintended removal of all child nodes, including those in the excluded subtree.

**Note**: The action is idempotent. If no configuration diff exists, then nothing needs to be done.

**Note**: The NSO general principle of minimum change applies.

</details>

<details>

<summary><code>reactive-re-deploy</code></summary>

This is a tailored `re-deploy` intended to be used in the reactive FASTMAP scenario. It differs from the ordinary `re-deploy` in that this action does not take any commit parameters.

This action will `re-deploy` the services as a shallow depth `re-deploy`. It will be performed with the same user as the original commit. Also, the commit parameters will be identical to the latest commit involving this service.

By default, this action is asynchronous and returns nothing. Use the `sync` leaf to get synchronous behavior and block until the service `re-deploy` transaction is committed. The `sync` leaf also means that the action will possibly return a commit result, such as a commit queue ID if any, or an error if the transaction failed.

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

## Bulk Service Actions

Service actions are performed on the multiple service instances filtered by services type (service callpoint).

<details>

<summary><code>re-deploy</code></summary>

This is a tailored `re-deploy` intended to be used on multiple services. This action takes the same input parameters as `re-deploy` service instance action.

There are 3 choices of service filter that can be used as input.

* Use `service-type` to filter on services of a certain type.
* Use `service-id` to filter on specific service instances.
* Use `select-services` to filter on services evaluated by an XPath expression.

The output of this action is a list of service ids and the results of action `re-deploy`.

Use the option `suppress-positive-result` to suppress results with empty diffs.

</details>

<details>

<summary><code>un-deploy</code></summary>

This is a tailored `un-deploy` intended to be used on multiple services. This action takes the same input parameters as `un-deploy` service instance action.

There are 3 choices of service filter can be used as input.

* Use `service-type` to filter on services of a certain type.
* Use `service-id` to filter on specific services instances.
* Use `select-services` to filter on services evaluated by an XPath expression.

The output of this action is a list of service ids and the results of action `un-deploy`.

Use the option `suppress-positive-result` to suppress results with empty diffs.

</details>

<details>

<summary><code>check-sync</code></summary>

This is a tailored `check-sync` intended to be used on multiple services. This action takes the same input parameters as `check-sync` service instance action.

There are 3 choices of service filter that can be used as input.

* Use `service-type` to filter on services of a certain type.
* Use `service-id` to filter on specific service instances.
* Use `select-services` to filter on services evaluated by an XPath expression.

The output of this action is a list of service ids and the results of action `check-sync`.

Use the option `suppress-positive-result` to suppress results with empty diffs.

</details>
