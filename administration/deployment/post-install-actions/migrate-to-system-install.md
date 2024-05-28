---
description: Convert your current Local Install setup to a System Install.
---

# Migrate to System Install

{% hint style="warning" %}
Applies to Local Install.
{% endhint %}

If you already have a Local Install with existing data that you would like to convert into a System Install, the following procedure allows you to do so. However, a reverse migration from System to Local Install is not supported.

{% hint style="info" %}
It is possible to perform the migration and upgrade simultaneously to a newer NSO version, however, doing so introduces additional complexity. If you run into issues, first migrate, and then perform the upgrade.
{% endhint %}

The following procedure assumes that NSO is installed as described in the NSO Local Install process, and will perform an initial System Install of the same NSO version. After following these steps, consult the NSO System Install guide for additional steps that are required for a fully functional System Install.

The procedure also assumes you are using the `$HOME/ncs-run` folder as the run directory. If this is not the case, modify the following path accordingly.

To migrate to System Install:

1.  Stop the current (local) NSO instance, if it is running.

    ```
    $ ncs --stop
    ```
2.  Take a complete backup of the Runtime Directory for potential disaster recovery.

    ```
    $ tar -czf $HOME/ncs-backup.tar.gz -C $HOME ncs-run
    ```
3.  Change to Super User privileges.

    ```
    $ sudo -s
    ```
4.  Start the NSO System Install.

    ```
    $ sh nso-VERSION.OS.ARCH.installer.bin --system-install
    ```
5. If you have multiple versions of NSO installed, verify that the symbolic link in `/opt/ncs` points to the correct version.
6.  Copy the CDB files containing data to the central location.

    ```
    # cp $HOME/ncs-run/ncs-cdb/*.cdb /var/opt/ncs/cdb
    ```
7.  Ensure that the `/var/opt/ncs/packages` directory includes all the necessary packages, appropriate for the NSO version. However, copying the packages directly could later on interfere with the operation of the `nct` command. It is better to only use symbolic links in that folder. Instead, copy the existing packages to the `/opt/ncs/packages` directory, either as directories or as tarball files. Make sure that each package includes the NSO version in its name and is not just a symlink, for example:

    ```
    # cd $HOME/ncs-run/packages
    # for pkg in *; do cp -RL $pkg /opt/ncs/packages/ncs-VERSION-$pkg; done
    ```
8.  Link to these packages in the `/var/opt/ncs/packages` directory.

    ```
    # cd /var/opt/ncs/packages/
    # rm -f *
    # for pkg in /opt/ncs/packages/ncs-VERSION-*; do ln -s $pkg; done
    ```

    \
    The reason for prepending `ncs-VERSION` to the filename is to allow additional NSO commands, such as `nct upgrade` and `software packages` to work properly. These commands need to identify which NSO version a package was compiled for.
9.  Edit the `/etc/ncs/ncs.conf` configuration file and make the necessary changes. If you wish to use the configuration from Local Install, disable the local authentication, unless you fully understand its security implications.

    ```
    <local-authentication>
      <enabled>false</enabled>
    </local-authentication>
    ```
10. When starting NSO later on, make sure that you set the package reload option, or use `start-with-package-reload` instead of `start` with `/etc/init.d/ncs`.

    ```
    # export NCS_RELOAD_PACKAGES=true
    ```
11. Review and complete the steps in NSO System Install, except running the installer, which you have done already. Once completed, you should have a running NSO instance with data from the Local Install.
12. Remove the package reload option if it was set.

    ```
    # unset NCS_RELOAD_PACKAGES
    ```
13. Update log file paths for Java and Python VM through the NSO CLI.

    ```
    $ ncs_cli -C -u admin
    admin@ncs# config
    Entering configuration mode terminal
    admin@ncs(config)# unhide debug
    admin@ncs(config)# show full-configuration java-vm stdout-capture file
    java-vm stdout-capture file ./logs/ncs-java-vm.log
    admin@ncs(config)# java-vm stdout-capture file /var/log/ncs/ncs-java-vm.log
    admin@ncs(config)# commit
    Commit complete.
    admin@ncs(config)# show full-configuration java-vm stdout-capture file
    java-vm stdout-capture file /var/log/ncs/ncs-java-vm.log
    admin@ncs(config)# show full-configuration python-vm logging log-file-prefix
    python-vm logging log-file-prefix ./logs/ncs-python-vm
    admin@ncs(config)# python-vm logging log-file-prefix /var/log/ncs/ncs-python-vm
    admin@ncs(config)# commit
    Commit complete.
    admin@ncs(config)# show full-configuration python-vm logging log-file-prefix
    python-vm logging log-file-prefix /var/log/ncs/ncs-python-vm
    admin@ncs(config)# exit
    admin@ncs#
    admin@ncs# exit
    ```
14. Verify that everything is working correctly.

At this point, you should have a complete copy of the previous Local Install running as a System Install. Should the migration fail at some point and you want to back out of it, the Local Install was not changed and you can easily go back to using it as before.

```
$ sudo /etc/init.d/ncs stop
$ source $HOME/ncs-VERSION/ncsrc
$ cd $HOME/ncs-run
$ ncs
```

In the unlikely event of Local Install becoming corrupted, you can restore it from the backup.

```
$ rm -rf $HOME/ncs-run
$ tar -xzf $HOME/ncs-backup.tar.gz -C $HOME
```
