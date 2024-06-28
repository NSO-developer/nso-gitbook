---
description: Upgrade NSO to a higher version.
---

# Upgrade NSO

Upgrading the NSO software gives you access to new features and product improvements. Every change carries a risk, and upgrades are no exception. To minimize the risk and make the upgrade process as painless as possible, this section describes the recommended procedures and practices to follow during an upgrade.

As usual, sufficient preparation avoids many pitfalls and makes the process more straightforward and less stressful.

## Preparing for Upgrade <a href="#d5e6830" id="d5e6830"></a>

There are multiple aspects that you should consider before starting with the actual upgrade procedure. While the development team tries to provide as much compatibility between software releases as possible, they cannot always avoid all incompatible changes. For example, when a deviation from an RFC standard is found and resolved, it may break clients that depend on the non-standard behavior. For this reason, a distinction is made between maintenance and a major NSO upgrade.

A maintenance NSO upgrade is within the same branch, i.e., when the first two version numbers stay the same (x.y in the x.y.z NSO version). An example is upgrading from version 6.1.1 to 6.1.2. In the case of a maintenance upgrade, the NSO release contains only corrections and minor enhancements, minimizing the changes. It includes binary compatibility for packages, so there is no need to recompile the .fxs files for a maintenance upgrade.

Correspondingly, when the first or second number in the version changes, that is called a full or major upgrade. For example, upgrading version 6.1.1 to 6.2 is a major, non-maintenance upgrade. Due to new features, packages must be recompiled, and some incompatibilities could manifest.

In addition to the above, a package upgrade is when you replace a package with a newer version, such as a NED or a service package. Sometimes, when package changes are not too big, it is possible to supply the new packages as part of the NSO upgrade, but this approach brings additional complexity. Instead, package upgrade and NSO upgrade should in general, be performed as separate actions and are covered as such.

To avoid surprises during any upgrade, first ensure the following:

* Hosts have sufficient disk space, as some additional space is required for an upgrade.
* The software is compatible with the target OS. However, sometimes a newer version of Java or system libraries, such as glibc, may be required.
* All the required NEDs and custom packages are compatible with the target NSO version.
* Existing packages have been compiled for the new version and are available to you during the upgrade.
* Check whether the existing `ncs.conf` file can be used as-is or needs updating. For example, stronger encryption algorithms may require you to configure additional keying material.
* Review the `CHANGES` file for information on what has changed.
* If upgrading from a no longer supported software version, verify that the upgrade can be performed directly. In situations where the currently installed version is very old, you may have to upgrade to one or more intermediate versions before upgrading to the target version.

In case it turns out any of the packages are incompatible or cannot be recompiled, you will need to contact the package developers for an updated or recompiled version. For an official Cisco-supplied package, it is recommended that you always obtain a pre-compiled version if it is available for the target NSO release, instead of compiling the package yourself.

Additional preparation steps may be required based on the upgrade and the actual setup, such as when using the Layered Service Architecture (LSA) feature. In particular, for a major NSO upgrade in a multi-version LSA cluster, ensure that the new version supports the other cluster members and follow the additional steps outlined in [Deploying LSA](../advanced-topics/layered-service-architecture.md#deploying-lsa) in Layered Service Architecture.

If you use the High Availability (HA) feature, the upgrade consists of multiple steps on different nodes. To avoid mistakes, you are encouraged to script the process, for which you will need to set up and verify access to all NSO instances with either `ssh`, `nct`, or some other remote management command. For the reference example, we use in this chapter, see `examples.ncs/development-guide/high-availability/hcc`. The management station uses shell and Python scripts that use `ssh` to access the Linux shell and NSO CLI and Python Requests for NSO RESTCONF interface access.

Likewise, NSO 5.3 added support for 256-bit AES encrypted strings, requiring the AES256CFB128 key in the `ncs.conf` configuration. You can generate one with the `openssl rand -hex 32` or a similar command. Alternatively, if you use an external command to provide keys, ensure that it includes a value for an `AES256CFB128_KEY` in the output.

Finally, regardless of the upgrade type, ensure that you have a working backup and can easily restore the previous configuration if needed, as described in [Backup and Restore](../management/system-management/#backup-and-restore).

{% hint style="danger" %}
#### Caution

The `ncs-backup` (and consequently the `nct backup`) command does not back up the `/opt/ncs/packages` folder. If you make any file changes, back them up separately.

However, the best practice is not to modify packages in the `/opt/ncs/packages` folder. Instead, if an upgrade requires package recompilation, separate package folders (or files) should be used, one for each NSO version.
{% endhint %}

## Single Instance Upgrade <a href="#ug.admin_guide.manual_upgrade" id="ug.admin_guide.manual_upgrade"></a>

The upgrade of a single NSO instance requires the following steps:

1. Create a backup.
2. Perform a System Install of the new version.
3. Stop the old NSO server process.
4. Compact the CDB files write log.
5. Update the `/opt/ncs/current` symbolic link.
6. If required, update the `ncs.conf` configuration file.
7. Update the packages in `/var/opt/ncs/packages/` if recompilation is needed.
8. Start the NSO server process, instructing it to reload the packages.

The following steps suppose that you are upgrading to the 6.2 release. They pertain to a System Install of NSO, and you must perform them with Super User privileges.

As a best practice, always create a backup before trying to upgrade.

```
# ncs-backup
```

For the upgrade itself, you must first download to the host and install the new NSO release.

```
# sh nso-6.2.linux.x86_64.installer.bin --system-install
```

Then, you stop the currently running server with the help of the init.d script or an equivalent command relevant to your system.

```
# /etc/init.d/ncs stop
Stopping ncs: .
```

Compact the CDB files write log using, for example, the `ncs --cdb-compact $NCS_RUN_DIR/cdb` command.

Next, you update the symbolic link for the currently selected version to point to the newly installed one, 6.2 in this case.

```
# cd /opt/ncs
# rm -f current
# ln -s ncs-6.2 current
```

While seldom necessary, at this point, you would also update the `/etc/ncs/ncs.conf` file.

Now, ensure that the `/var/opt/ncs/packages/` directory has appropriate packages for the new version. It should be possible to continue using the same packages for a maintenance upgrade. But for a major upgrade, you must normally rebuild the packages or use pre-built ones for the new version. You must ensure this directory contains the exact same version of each existing package, compiled for the new release, and nothing else.

As a best practice, the available packages are kept in `/opt/ncs/packages/` and `/var/opt/ncs/packages/` only contains symbolic links. In this case, to identify the release for which they were compiled, the package file names all start with the corresponding NSO version. Then, you only need to rearrange the symbolic links in the `/var/opt/ncs/packages/` directory.

```
# cd /var/opt/ncs/packages/
# rm -f *
# for pkg in /opt/ncs/packages/ncs-6.2-*; do ln -s $pkg; done
```

{% hint style="warning" %}
Please note that the above package naming scheme is neither required nor enforced. If your package filesystem names differ from it, you will need to adjust the preceding command accordingly.
{% endhint %}

Finally, you start the new version of the NSO server with the package reload flag set.

```
# /etc/init.d/ncs start-with-package-reload
Starting ncs: ...
```

NSO will perform the necessary data upgrade automatically. However, this process may fail if you have changed or removed any packages. In that case, ensure that the correct versions of all packages are present in `/var/opt/ncs/packages/` and retry the preceding command.

Also, note that with many packages or data entries in the CDB, this process could take more than 90 seconds and result in the following error message:

```
Starting ncs (via systemctl): Job for ncs.service failed
because a timeout was exceeded. See "systemctl status
ncs.service" and "journalctl -xe" for details. [FAILED]
```

The above error does not imply that NSO failed to start, just that it took longer than 90 seconds. Therefore, it is recommended you wait some additional time before verifying.

## Recover from a Failed Upgrade <a href="#d5e6931" id="d5e6931"></a>

It is imperative that you have a working copy of data available from which you can restore. That is why you must always create a backup before starting an upgrade. Only a backup guarantees that you can rerun the upgrade or back out of it, should it be necessary.

The same steps can also be used to restore data on a new, similar host if the OS of the initial host becomes corrupted beyond repair.

1.  First, stop the NSO process if it is running.

    ```
    # /etc/init.d/ncs stop
    Stopping ncs: .
    ```
2.  Verify and, if necessary, revert the symbolic link in `/opt/ncs/` to point to the initial NSO release.

    ```
    # cd /opt/ncs
    # ls -l current
    # ln -s ncs-VERSION current
    ```

    \
    In the exceptional case where the initial version installation was removed or damaged, you will need to re-install it first and redo the step above.
3.  Verify if the correct (initial) version of NSO is being used.

    ```
    # ncs --version
    ```
4.  Next, restore the backup.

    ```
    # ncs-backup --restore
    ```
5.  Finally, start the NSO server and verify the restore was successful.

    ```
    # /etc/init.d/ncs start
    Starting ncs: .
    ```

## NSO HA Version Upgrade <a href="#ch_upgrade.ha" id="ch_upgrade.ha"></a>

Upgrading NSO in a highly available (HA) setup is a staged process. It entails running various commands across multiple NSO instances at different times.

The procedure described in this section is used with the rule-based built-in HA clusters. For HA Raft cluster instructions, refer to [Version Upgrade of Cluster Nodes](../management/high-availability.md) in the HA documentation.

The procedure is almost the same for a maintenance and major NSO upgrade. The difference is that a major upgrade requires the replacement of packages with recompiled ones. Still, a maintenance upgrade is often perceived as easier because there are fewer changes in the product.

The stages of the upgrade are:

1. First, enable read-only mode on the designated `primary`, and then on the `secondary` that is enabled for fail-over.
2. Take a full backup on all nodes.
3. If using a 3-node setup, disconnect the 3rd, non-fail-over `secondary` by disabling HA on this node.
4. Disconnect the HA pair by disabling HA on the designated `primary`, temporarily promoting the designated `secondary` to provide the read-only service (and advertise the shared virtual IP address if it is used).
5. Upgrade the designated `primary`.
6. Disable HA on the designated `secondary` node, to allow designated `primary` to become actual `primary` in the next step.
7. Activate HA on the designated `primary`, which will assume its assigned (`primary`) role to provide the full service (and again advertise the shared IP if used). However, at this point, the system is without HA.
8. Upgrade the designated `secondary` node.
9. Activate HA on the designated `secondary`, which will assume its assigned (`secondary`) role, connecting HA again.
10. Verify that HA is operational and has converged.
11. Upgrade the 3rd, non-fail-over `secondary` if it is used, and verify it successfully rejoins the HA cluster.

Enabling the read-only mode on both nodes is required to ensure the subsequent backup captures the full system state, as well as making sure the `failover-primary` does not start taking writes when it is promoted later on.

Disabling the non-fail-over `secondary` in a 3-node setup right after taking a backup is necessary when using the built-in HA rule-based algorithm (enabled by default in NSO 5.8 and later). Without it, the node might connect to the `failover-primary` when the failover happens, which disables read-only mode.

While not strictly necessary, explicitly promoting the designated `secondary` after disabling HA on the `primary` ensures a fast failover, avoiding the automatic reconnection attempts. If using a shared IP solution, such as the Tail-f HCC, this makes sure the shared VIP comes back up on the designated `secondary` as soon as possible. In addition, some older NSO versions do not reset the read-only mode upon disabling HA if they are not acting `primary`.

Another important thing to note is that all packages used in the upgrade must match the NSO release. If they do not, the upgrade will fail.

In the case of a major upgrade, you must recompile the packages for the new version. It is highly recommended that you use pre-compiled packages and do not compile them during this upgrade procedure since the compilation can prove nontrivial, and the production hosts may lack all the required (development) tooling. You should use a naming scheme to distinguish between packages compiled for different NSO versions. A good option is for package file names to start with the `ncs-MAJORVERSION-` prefix for a given major NSO version. This ensures multiple packages can co-exist in the `/opt/ncs/packages` folder, and the NSO version they can be used with becomes obvious.

The following is a transcript of a sample upgrade procedure, showing the commands for each step described above, in a 2-node HA setup, with nodes in their initial designated state. The procedure ensures that this is also the case in the end.

```
<switch to designated primary CLI>
admin@ncs# show high-availability status mode
high-availability status mode primary
admin@ncs# high-availability read-only mode true

<switch to designated secondary CLI>
admin@ncs# show high-availability status mode
high-availability status mode secondary
admin@ncs# high-availability read-only mode true

<switch to designated primary shell>
# ncs-backup

<switch to designated secondary shell>
# ncs-backup

<switch to designated primary CLI>
admin@ncs# high-availability disable

<switch to designated secondary CLI>
admin@ncs# high-availability be-primary

<switch to designated primary shell>
# <upgrade node>
# /etc/init.d/ncs restart-with-package-reload

<switch to designated secondary CLI>
admin@ncs# high-availability disable

<switch to designated primary CLI>
admin@ncs# high-availability enable

<switch to designated secondary shell>
# <upgrade node>
# /etc/init.d/ncs restart-with-package-reload

<switch to designated secondary CLI>
admin@ncs# high-availability enable
```

Scripting is a recommended way to upgrade the NSO version of an HA cluster. The following example script shows the required commands and can serve as a basis for your own customized upgrade script. In particular, the script requires a specific package naming convention above, and you may need to tailor it to your environment. In addition, it expects the new release version and the designated `primary` and `secondary` node addresses as the arguments. The recompiled packages are read from the `packages-MAJORVERSION/` directory.

For the below example script, we configured our `primary` and `secondary` nodes with their nominal roles that they assume at startup and when HA is enabled. Automatic failover is also enabled so that the `secondary` will assume the `primary` role if the `primary` node goes down.

{% code title="Configuration on Both Nodes" %}
```
<config xmlns="http://tail-f.com/ns/config/1.0">
  <high-availability xmlns="http://tail-f.com/ns/ncs">
    <ha-node>
      <id>n1</id>
      <nominal-role>primary</nominal-role>
    </ha-node>
    <ha-node>
      <id>n2</id>
      <nominal-role>secondary</nominal-role>
      <failover-primary>true</failover-primary>
    </ha-node>
    <settings>
      <enable-failover>true</enable-failover>
      <start-up>
        <assume-nominal-role>true</assume-nominal-role>
        <join-ha>true</join-ha>
      </start-up>
    </settings>
  </high-availability>
</config>
```
{% endcode %}

{% code title="Script for HA Major Upgrade (with Packages)" %}
```
#!/bin/bash
set -ex

vsn=$1
primary=$2
secondary=$3
installer_file=nso-${vsn}.linux.x86_64.installer.bin
pkg_vsn=$(echo $vsn | sed -e 's/^\([0-9]\+\.[0-9]\+\).*/\1/')
pkg_dir="packages-${pkg_vsn}"

function on_primary() { ssh $primary "$@" ; }
function on_secondary() { ssh $secondary "$@" ; }
function on_primary_cli() { ssh -p 2024 $primary "$@" ; }
function on_secondary_cli() { ssh -p 2024 $secondary "$@" ; }

function upgrade_nso() {
    target=$1
    scp $installer_file $target:
    ssh $target "sh $installer_file --system-install --non-interactive"
    ssh $target "rm -f /opt/ncs/current && \
                 ln -s /opt/ncs/ncs-${vsn} /opt/ncs/current"
}
function upgrade_packages() {
    target=$1
    do_pkgs=$(ls "${pkg_dir}/" || echo "")
    if [ -n "${do_pkgs}" ] ; then
        cd ${pkg_dir}
        ssh $target 'rm -rf /var/opt/ncs/packages/*'
        for p in ncs-${pkg_vsn}-*.gz; do
            scp $p $target:/opt/ncs/packages/
            ssh $target "ln -s /opt/ncs/packages/$p /var/opt/ncs/packages/"
        done
        cd -
    fi
}

# Perform the actual procedure

on_primary_cli 'request high-availability read-only mode true'
on_secondary_cli 'request high-availability read-only mode true'

on_primary 'ncs-backup'
on_secondary 'ncs-backup'

on_primary_cli 'request high-availability disable'
on_secondary_cli 'request high-availability be-primary'
upgrade_nso $primary
upgrade_packages $primary
on_primary '/etc/init.d/ncs restart-with-package-reload'

on_secondary_cli 'request high-availability disable'
on_primary_cli 'request high-availability enable'
upgrade_nso $secondary
upgrade_packages $secondary
on_secondary '/etc/init.d/ncs restart-with-package-reload'

on_secondary_cli 'request high-availability enable'
```
{% endcode %}

Once the script is completed, it is paramount that you manually verify the outcome. First, check that the HA is enabled by using the `show high-availability` command on the CLI of each node. Then connect to the designated secondaries and ensure they have the complete latest copy of the data, synchronized from the primaries.

After the `primary` node is upgraded and restarted, the read-only mode is automatically disabled. This allows the `primary` node to start processing writes, minimizing downtime. However, there is no HA. Should the `primary` fail at this point or you need to revert to a pre-upgrade backup, the new writes would be lost. To avoid this scenario, again enable read-only mode on the `primary` after re-enabling HA. Then disable read-only mode only after successfully upgrading and reconnecting the `secondary`.

To further reduce time spent upgrading, you can customize the script to install the new NSO release and copy packages beforehand. Then, you only need to switch the symbolic links and restart the NSO process to use the new version.

You can use the same script for a maintenance upgrade as-is, with an empty `packages-MAJORVERSION` directory, or remove the `upgrade_packages` calls from the script.

Example implementations that use scripts to upgrade a 2- and 3-node setup using CLI/MAAPI or RESTCONF are available in the NSO example set under `examples.ncs/development-guide/high-availability`.

We have been using a two-node HCC layer-2 upgrade reference example elsewhere in the documentation to demonstrate installing NSO and adding the initial configuration. The upgrade-l2 example referenced in `examples.ncs/development-guide/high-availability/hcc` implements shell and Python scripted steps to upgrade the NSO version using `ssh` to the Linux shell and the NSO CLI or Python Requests RESTCONF for accessing the `paris` and `london` nodes. See the example for details.

If you do not wish to automate the upgrade process, you will need to follow the instructions from [Single Instance Upgrade](upgrade-nso.md#ug.admin\_guide.manual\_upgrade) and transfer the required files to each host manually. Additional information on HA is available in [High Availability](../management/high-availability.md). However, you can run the `high-availability` actions from the preceding script on the NSO CLI as-is. In this case, please take special care of which host you perform each command, as it can be easy to mix them up.

## Package Upgrade <a href="#d5e7083" id="d5e7083"></a>

Package upgrades are frequent and routine in development but require the same care as NSO upgrades in the production environment. The reason is that the new packages may contain an updated YANG model, resulting in a data upgrade process similar to a version upgrade. So, if a package is removed or uninstalled and a replacement is not provided, package-specific data, such as service instance data, will also be removed.

In a single-node environment, the procedure is straightforward. Create a backup with the `ncs-backup` command and ensure the new package is compiled for the current NSO version and available under the `/opt/ncs/packages` directory. Then either manually rearrange the symbolic links in the `/var/opt/ncs/packages` directory or use the `software packages install` command in the NSO CLI. Finally, invoke the `packages reload` command. For example:

```
# ncs-backup
INFO  Backup /var/opt/ncs/backups/ncs-6.2@2024-01-21T10:34:42.backup.gz created
successfully
# ls /opt/ncs/packages
ncs-6.2-router-nc-1.0 ncs-6.2-router-nc-1.0.2
# ncs_cli -C
admin@ncs# software packages install package router-nc-1.0.2 replace-existing
installed ncs-6.2-router-nc-1.0.2
admin@ncs# packages reload

>>> System upgrade is starting.
>>> Sessions in configure mode must exit to operational mode.
>>> No configuration changes can be performed until upgrade has completed.
>>> System upgrade has completed successfully.
reload-result {
    package router-nc-1.0.2
    result true
}
```

On the other hand, upgrading packages in an HA setup is an error-prone process. Thus, NSO provides an action, `packages ha sync and-reload`to minimize such complexity. This action loads new data models into NSO instead of restarting the server process. As a result, it is considerably more efficient, and the time difference to upgrade can be considerable if the amount of data in CDB is huge.

{% hint style="info" %}
If the only change in the packages is the addition of new NED packages, the `and-add` can replace `and-reload` command for an even more optimized and less intrusive update. See [Adding NED Packages](../management/nso-packages.md#ug.package\_mgmt.ned\_package\_add) for details.
{% endhint %}

The action executes on the `primary` node. First, it syncs the physical packages from the `primary` node to the `secondary` nodes as tar archive files, regardless if the packages were initially added as directories or tar archives. Then, it performs the upgrade on all nodes in one go. The action does not perform the sync and the upgrade on the node with `none` role.

The `packages ha sync` action distributes new packages to the _secondary_ nodes. If a package already exists on the `secondary` node, it will replace it with the one on the `primary` node. Deleting a package on the `primary` node will also delete it on the `secondary` node. Packages found in load paths under the installation destination (by default `/opt/ncs/current`) are not distributed as they belong to the system and should not differ between the `primary` and the `secondary` nodes.

It is crucial to ensure that the load path configuration is identical on both `primary` and `secondary` nodes. Otherwise, the distribution will not start, and the action output will contain detailed error information.

Using the `and-reload` parameter with the action starts the upgrade once packages are copied over. The action sets the `primary` node to read-only mode. After the upgrade is successfully completed, the node is set back to its previous mode.

If the parameter `and-reload` is also supplied with the `wait-commit-queue-empty` parameter, it will wait for the commit queue to become empty on the `primary` node and prevent other queue items from being added while the queue is being drained.

Using the `wait-commit-queue-empty` parameter is the recommended approach, as it minimizes the risk of the upgrade failing due to commit queue items still relying on the old schema.

{% code title="Package Upgrade Procedure" %}
```
primary@node1# software packages list
package {
  name dummy-1.0.tar.gz
  loaded
}
primary@node1# software packages fetch package-from-file \
$MY_PACKAGE_STORE/dummy-1.1.tar.gz
primary@node1# software packages install package dummy-1.1 replace-existing
primary@node1# packages ha sync and-reload { wait-commit-queue-empty }
```
{% endcode %}

The `packages ha sync and-reload` command has the following known limitations and side effects:

* The `primary` node is set to `read-only` mode before the upgrade starts, and it is set back to its previous mode if the upgrade is successfully upgraded. However, the node will always be in read-write mode if an error occurs during the upgrade. It is up to the user to set the node back to the desired mode by using the `high-availability read-only mode` command.
* As a best practice, you should create a backup of all nodes before upgrading. This action creates no backups, you must do that explicitly.

Example implementations that use scripts to upgrade a 2- and 3-node setup using CLI/MAAPI or RESTCONF are available in the NSO example set under `examples.ncs/development-guide/high-availability`.

We have been using a two-node HCC layer 2 upgrade reference example elsewhere in the documentation to demonstrate installing NSO and adding the initial configuration. The upgrade-l2 example referenced in `examples.ncs/development-guide/high-availability/hcc` implements shell and Python scripted steps to upgrade the `primary` `paris` package versions and sync the packages to the `secondary` `london` using `ssh` to the Linux shell and the NSO CLI or Python Requests RESTCONF for accessing the `paris` and `london` nodes. See the example for details.

In some cases, NSO may warn when the upgrade looks suspicious. For more information on this, see [Loading Packages](../management/nso-packages.md#ug.package\_mgmt.loading). If you understand the implications and are willing to risk losing data, use the `force` option with `packages reload` or set the `NCS_RELOAD_PACKAGES` environment variable to `force` when restarting NSO. It will force NSO to ignore warnings and proceed with the upgrade. In general, this is not recommended.

In addition, you must take special care of NED upgrades because services depend on them. For example, since NSO 5 introduced the CDM feature, which allows loading multiple versions of a NED, a major NED upgrade requires a procedure involving the `migrate` action.

When a NED contains nontrivial YANG model changes, that is called a major NED upgrade. The NED ID changes, and the first or second number in the NED version changes since NEDs follow the same versioning scheme as NSO. In this case, you cannot simply replace the package, as you would for a maintenance or patch NED release. Instead, you must load (add) the new NED package alongside the old one and perform the migration.

Migration uses the `/ncs:devices/device/migrate` action to change the ned-id of a single device or a group of devices. It does not affect the actual network device, except possibly reading from it. So, the migration does not have to be performed as part of the package upgrade procedure described above but can be done later, during normal operations. The details are described in [NED Migration](../management/nso-packages.md#ug.package\_mgmt.ned\_migration). Once the migration is complete, you can remove the old NED by performing another package upgrade, where you deinstall the old NED package. It can be done straight after the migration or as part of the next upgrade cycle.

## Patch Management <a href="#d5e7173" id="d5e7173"></a>

NSO can install emergency patches during runtime. These are delivered in the form of `.beam` files. You must copy the files into the `/opt/ncs/current/lib/ncs/patches/` folder and load them with the `ncs-state patches load-modules` command.
