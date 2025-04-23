---
description: Perform package management tasks.
---

# Package Management

All user code that needs to run in NSO must be part of a package. A package is basically a directory of files with a fixed file structure or a tar archive with the same directory layout. A package consists of code, YANG modules, etc., that are needed to add an application or function to NSO. Packages are a controlled way to manage loading and versions of custom applications.

Network Element Drivers (NEDs) are also packages. Each NED allows NSO to manage a network device of a specific type. Except for third-party YANG NED packages which do not contain a YANG device model by default (and must be downloaded and fixed before adding to the package), a NED typically contains a device YANG model and the code, specifying how NSO should connect to the device. For NETCONF devices, NSO includes built-in tools to help you build a NED, as described in [NED Administration](ned-administration.md), that you can use if needed. Otherwise, a third-party YANG NED, if available, should be used instead. Vendors, in some cases, provide the required YANG device models but not the entire NED. In practice, all NSO instances use at least one NED. The set of used NED packages depends on the number of different device types the NSO manages.

When NSO starts, it searches for packages to load. The `ncs.conf` parameter `/ncs-config/load-path` defines a list of directories. At initial startup, NSO searches these directories for packages and copies the packages to a private directory tree in the directory defined by the `/ncs-config/state-dir` parameter in `ncs.conf`, and loads and starts all the packages found. On subsequent startups, NSO will by default only load and start the copied packages. The purpose of this procedure is to make it possible to reliably load new or updated packages while NSO is running, with a fallback to the previously existing version of the packages if the reload should fail.

In a System Install of NSO, packages are always installed (normally through symbolic links) in the `packages` subdirectory of the run directory, i.e. by default `/var/opt/ncs/packages`, and the private directory tree is created in the `state` subdirectory, i.e. by default `/var/opt/ncs/state`.

## Loading Packages <a href="#ug.package_mgmt.loading" id="ug.package_mgmt.loading"></a>

Loading of new or updated packages (as well as removal of packages that should no longer be used) can be requested via the `reload` action - from the NSO CLI:

```bash
admin@ncs# packages reload
reload-result {
    package cisco-ios
    result true
}
```

This request makes NSO copy all packages found in the load path to a temporary version of its private directory, and load the packages from this directory. If the loading is successful, this temporary directory will be made permanent, otherwise, the temporary directory is removed and NSO continues to use the previous version of the packages. Thus when updating packages, always update the version in the load path, and request that NSO does the reload via this action.

If the package changes include modified, added, or deleted `.fxs` files or `.ccl` files, NSO needs to run a data model upgrade procedure, also called a CDB upgrade. NSO provides a `dry-run` option to `packages reload` action to test the upgrade without committing the changes. Using a reload dry-run, you can tell if a CDB upgrade is needed or not.

The `report all-schema-changes` option of the reload action instructs NSO to produce a report of how the current data model schema is being changed. Combined with a dry run, the report allows you to verify the modifications introduced with the new versions of the packages before actually performing the upgrade.

For a data model upgrade, including a dry run, all transactions must be closed. In particular, users having CLI sessions in configure mode must exit to operational mode. If there are ongoing commit queue items, and the `wait-commit-queue-empty` parameter is supplied, it will wait for the items to finish before proceeding with the reload. During this time, it will not allow the creation of any new transactions. Hence, if one of the queue items fails with `rollback-on-error` option set, the commit queue's rollback will also fail, and the queue item will be locked. In this case, the reload will be canceled. A manual investigation of the failure is needed in order to proceed with the reload.

While the data model upgrade is in progress, all transactions are closed and new transactions are not allowed. This means that starting a new management session, such as a CLI or SSH connection to the NSO, will also fail, producing an error that the node is in upgrade mode.

By default, the `reload` action will (when needed) wait up to 10 seconds for the commit queue to empty (if the `wait-commit-queue-empty` parameter is entered) and reload to start.

If there are still open transactions at the end of this period, the upgrade will be canceled and the reload operation will fail. The `max-wait-time` and `timeout-action` parameters to the action can modify this behavior. For example, to wait for up to 30 seconds, and forcibly terminate any transactions that still remain open after this period, we can invoke the action as:

```bash
admin@ncs# packages reload max-wait-time 30 timeout-action kill
```

Thus the default values for these parameters are `10` and `fail`, respectively. In case there are no changes to `.fxs` or .`ccl` files, the reload can be carried out without the data model upgrade procedure, and these parameters are ignored since there is no need to close open transactions.

When reloading packages, NSO will give a warning when the upgrade looks suspicious, i.e., may break some functionality. Note that this is not a strict upgrade validation, but only intended as a hint to the NSO administrator early in the upgrade process that something might be wrong. Currently, the following scenarios will trigger the warnings:

* One or more namespaces are removed by the upgrade. The consequence of this is all data belonging to this namespace is permanently deleted from CDB upon upgrade. This may be intended in some scenarios, in which case it is advised to proceed with overriding warnings as described below.
* There are source `.java` files found in the package, but no matching `.class` files in the jars loaded by NSO. This likely means that the package has not been compiled.
* There are matching `.class` files with modification time older than the source files, which hints that the source has been modified since the last time the package was compiled. This likely means that the package was not re-compiled the last time the source code was changed.

If a warning has been triggered it is a strong recommendation to fix the root cause. If all of the warnings are intended, it is possible to proceed with `packages reload force` command.

In some specific situations, upgrading a package with newly added custom validation points in the data model may produce an error similar to `no registration found for callpoint NEW-VALIDATION/validate` or simply `application communication failure`, resulting in an aborted upgrade. See [New Validation Points](../../development/core-concepts/using-cdb.md#cdb.upgrade-add-vp) on how to proceed.

In some cases, we may want NSO to do the same operation as the `reload` action at NSO startup, i.e. copy all packages from the load path before loading, even though the private directory copy already exists. This can be achieved in the following ways:

* Setting the shell environment variable `$NCS_RELOAD_PACKAGES` to `true`. This will make NSO do the copy from the load path on every startup, as long as the environment variable is set. In a System Install, NSO is typically started as a `systemd` system service, and `NCS_RELOAD_PACKAGES=true` can be set in `/etc/ncs/ncs.systemd.conf` temporarily to reload the packages.
* Giving the option `--with-package-reload` to the `ncs` command when starting NSO. This will make NSO do the copy from the load path on this particular startup, without affecting the behavior on subsequent startups.
* If warnings are encountered when reloading packages at startup using one of the options above, the recommended way forward is to fix the root cause as indicated by the warnings as mentioned before. If the intention is to proceed with the upgrade without fixing the underlying cause for the warnings, it is possible to force the upgrade using `NCS_RELOAD_PACKAGES`=`force` environment variable or `--with-package-reload-force` option.

Always use one of these methods when upgrading to a new version of NSO in an existing directory structure, to make sure that new packages are loaded together with the other parts of the new system.

## Redeploying Packages <a href="#ug.package_mgmt.redeploying" id="ug.package_mgmt.redeploying"></a>

If it is known in advance that there were no data model changes, i.e. none of the `.fxs` or `.ccl` files changed, and none of the shared JARs changed in a Java package, and the declaration of the components in the `package-meta-data.xml` is unchanged, then it is possible to do a lightweight package upgrade, called package redeploy. Package redeploy only loads the specified package, unlike packages reload which loads all of the packages found in the load-path.

```bash
admin@ncs# packages package mserv redeploy
result true
```

Redeploying a package allows you to reload updated or load new templates, reload private JARs for a Java package, or reload the Python code which is a part of this package. Only the changed part of the package will be reloaded, e.g. if there were no changes to Python code, but only templates, then the Python VM will not be restarted, but only templates reloaded. The upgrade is not seamless however as the old templates will be unloaded for a short while before the new ones are loaded, so any user of the template during this period of time will fail; the same applies to changed Java or Python code. It is hence the responsibility of the user to make sure that the services or other code provided by the package is unused while it is being redeployed.

The `package redeploy` will return `true` if the package's resulting status after the redeploy is `up`. Consequently, if the result of the action is `false`, then it is advised to check the operational status of the package in the package list.

```bash
admin@ncs# show packages package mserv oper-status
oper-status file-load-error
oper-status error-info "template3.xml:2 Unknown servicepoint: templ42-servicepoint"
```

## Adding NED Packages <a href="#ug.package_mgmt.ned_package_add" id="ug.package_mgmt.ned_package_add"></a>

Unlike a full `packages reload` operation, new NED packages can be loaded into the system without disrupting existing transactions. This is only possible for new packages, since these packages don't yet have any instance data.

The operation is performed through the `/packages/add` action. No additional input is necessary. The operation scans all the load-paths for any new NED packages and also verifies the existing packages are still present. If packages are modified or deleted, the operation will fail.

Each NED package defines `ned-id`, an identifier that is used in selecting the NED for each managed device. A new NED package is therefore a package with a ned-id value that is not already in use.

In addition, the system imposes some additional constraints, so it is not always possible to add just any arbitrary NED. In particular, NED packages can also contain one or more shared data models, such as NED settings or operational data for private use by the NED, that are not specific to each version of NED package but rather shared between all versions. These are typically placed outside any mount point (device-specific data model), extending the NSO schema directly. So, if a NED defines schema nodes outside any mount point, there must be no changes to these nodes if they already exist.

Adding a NED package with a modified shared data model is therefore not allowed and all shared data models are verified to be identical before a NED package can be added. If they are not, the `/packages/add` action will fail and you will have to use the `/packages/reload` command.

```bash
admin@ncs# packages add
add-result {
    package router-nc-1.1
    result true
}
```

The command returns `true` if the package's resulting status after deployment is `up`. Likewise, if the result for a package is `false`, then the package was added but its code has not started successfully and you should check the operational status of the package with the `show packages package <PKG> oper-status` command for additional information. You may then use the `/packages/package/redeploy` action to retry deploying the package's code, once you have corrected the error.

{% hint style="info" %}
In a high-availability setup, you can perform this same operation on all the nodes in the cluster with a single `packages ha sync and-add` command.
{% endhint %}

## Managing Packages <a href="#ug.package_mgmt.managing" id="ug.package_mgmt.managing"></a>

In a System Install of NSO, management of pre-built packages is supported through a number of actions. This support is not available in a Local Install, since it is dependent on the directory structure created by the System Install. Please refer to the YANG submodule `$NCS_DIR/src/ncs/yang/tailf-ncs-software.yang` for the full details of the functionality described in this section.

### Actions

Actions are provided to list local packages, to fetch packages from the file system, and to install or deinstall packages:

* `software packages list [...]`: List local packages, categorized into loaded, installed, and installable. The listing can be restricted to only one of the categories - otherwise, each package listed will include the category for the package.
* `software packages fetch package-from-file <file>`: Fetch a package by copying it from the file system, making it installable.
* `software packages install package <package-name> [...]`: Install a package, making it available for loading via the `packages reload` action, or via a system restart with package reload. The action ensures that only one version of the package is installed - if any version of the package is installed already, the `replace-existing` option can be used to deinstall it before proceeding with the installation.
* `software packages deinstall package <package-name>`: Deinstall a package, i.e. remove it from the set of packages available for loading.

There is also an `upload` action that can be used via NETCONF or REST to upload a package from the local host to the NSO host, making it installable there. It is not feasible to use in the CLI or Web UI, since the actual package file contents is a parameter for the action. It is also not suitable for very large (more than a few megabytes) packages, since the processing of action parameters is not designed to deal with very large values, and there is a significant memory overhead in the processing of such values.

## More on Package Management <a href="#ncsnwe.admin.packages" id="ncsnwe.admin.packages"></a>

NSO Packages contain data models and code for a specific function. It might be NED for a specific device, a service application like MPLS VPN, a WebUI customization package, etc. Packages can be added, removed, and upgraded in run-time. A common task is to add a package to NSO to support a new device type or upgrade an existing package when the device is upgraded.

(We assume you have the example up and running from the previous section). Currently installed packages can be viewed with the following command:

```cli
admin@ncs# show packages
packages package cisco-ios
 package-version 3.0
 description     "NED package for Cisco IOS"
 ncs-min-version [ 3.0.2 ]
 directory       ./state/packages-in-use/1/cisco-ios-cli-3.0
 component upgrade-ned-id
  upgrade java-class-name com.tailf.packages.ned.ios.UpgradeNedId
 component cisco-ios
  ned cli ned-id  cisco-ios-cli-3.0
  ned cli java-class-name com.tailf.packages.ned.ios.IOSNedCli
  ned device vendor Cisco
NAME      VALUE
---------------------
show-tag  interface

 oper-status up
```

So the above command shows that NSO currently has one package, the NED for Cisco IOS.

NSO reads global configuration parameters from `ncs.conf`. More on NSO configuration later in this guide. By default, it tells NSO to look for packages in a `packages` directory where NSO was started. Using the [examples.ncs/device-management/simulated-cisco-ios](https://github.com/NSO-developer/nso-examples/blob/6.4/device-management/simulated-cisco-ios) example to demonstrate:

```bash
$ pwd
examples.ncs/device-management/simulated-cisco-ios
$ NONINTERACTIVE=1 ./demo.sh
$ ls packages/
cisco-ios-cli-3.0
$ ls packages/cisco-ios-cli-3.0
doc
load-dir
netsim
package-meta-data.xml
private-jar
shared-jar
src
```

As seen above a package is a defined file structure with data models, code, and documentation. NSO comes with a few ready-made example packages: `$NCS_DIR/packages/`. Also, there is a library of packages available from Tail-f, especially for supporting specific devices.

### Adding and Upgrading a Package <a href="#d5e7809" id="d5e7809"></a>

Assume you would like to add support for Nexus devices to the example. Nexus devices have different data models and another CLI flavor. There is a package for that in `$NCS_DIR/packages/neds/nexus`.

We can keep NSO running all the time, but we will stop the network simulator to add the Nexus devices to the simulator.

```bash
$ ncs-netsim stop
```

Add the nexus package to the NSO runtime directory by creating a symbolic link:

```bash
$ cd $NCS_DIR/examples.ncs/device-management/simulated-cisco-ios/packages
$ ln -s $NCS_DIR/packages/neds/cisco-nx-cli-3.0 cisco-nx-cli-3.0
$ ls -l
...
cisco-nx-cli-3.0 -> $NCS_DIR/packages/neds/cisco-nx-cli-3.0
```

The package is now in place, but until we tell NSO to look for package changes nothing happens:

```bash
  admin@ncs# show packages packages package
  cisco-ios ...  admin@ncs# packages reload

>>> System upgrade is starting.
>>> Sessions in configure mode must exit to operational mode.
>>> No configuration changes can be performed until upgrade has
completed.
>>> System upgrade has completed successfully.
reload-result {
    package cisco-ios
    result true
}
reload-result {
    package cisco-nx
    result true
}
```

So after the `packages reload` operation NSO also knows about Nexus devices. The reload operation also takes any changes to existing packages into account. The data store is automatically upgraded to cater to any changes like added attributes to existing configuration data.

### Simulating the New Device <a href="#d5e7826" id="d5e7826"></a>

```bash
$ ncs-netsim add-to-network cisco-nx-cli-3.0 2 n
$ ncs-netsim list
ncs-netsim list for examples.ncs/device-management/simulated-cisco-ios/netsim

name=c0 ...
name=c1 ...
name=c2 ...
name=n0 ...
name=n1 ...


$ ncs-netsim start
DEVICE c0 OK STARTED
DEVICE c1 OK STARTED
DEVICE c2 OK STARTED
DEVICE n0 OK STARTED
DEVICE n1 OK STARTED
$ ncs-netsim cli-c n0
n0#show running-config
no feature ssh
no feature telnet
fex 101
 pinning max-links 1
!
fex 102
 pinning max-links 1
!
nexus:vlan 1
!
...
```

### Adding the New Devices to NSO <a href="#d5e7835" id="d5e7835"></a>

We can now add these Nexus devices to NSO according to the below sequence:

```bash
admin@ncs(config)# devices device n0 device-type cli ned-id cisco-nx-cli-3.0
admin@ncs(config-device-n0)# port 10025
admin@ncs(config-device-n0)# address 127.0.0.1
admin@ncs(config-device-n0)# authgroup default
admin@ncs(config-device-n0)# state admin-state unlocked
admin@ncs(config-device-n0)# commit
admin@ncs(config-device-n0)# top
admin@ncs(config)# devices device n0 sync-from
result true
```
