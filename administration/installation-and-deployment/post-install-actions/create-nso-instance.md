---
description: Create a new NSO instance for Local Install.
---

# Create NSO Instance

{% hint style="warning" %}
Applies to Local Install.
{% endhint %}

One of the included scripts with an NSO installation is the `ncs-setup`, which makes it very easy to create instances of NSO from a Local Install. You can look at the `--help` or [ncs-setup(1)](../../../man/ncs-setup.1.md) in Manual Pages for more details, but the two options we need to know are:

* `--dest` defines the directory where you want to set up NSO. if the directory does not exist, it will be created.
* `--package` defines the NEDs that you want to have installed. You can specify this option multiple times.

{% hint style="info" %}
NCS is the original name of the NSO product. Therefore, many of the commands and application features are prefaced with `ncs`. You can think of NCS as another name for NSO.
{% endhint %}

To create an NSO instance:

1.  Run the command to set up an NSO instance in the current directory with the IOS, NX-OS, IOS-XR and ASA NEDs. You only need one NED per platform that you want NSO to manage, even if you may have multiple versions in your installer `neds` directory.

    \
    Use the name of the NED folder in `${NCS_DIR}/packages/neds` for the latest NED version that you have installed for the target platform. Use the tab key to complete the path after you start typing (alternatively, copy and paste). Verify that the NED versions below match what is currently on the sandbox to avoid a syntax error. See the example below.

    ```bash
    ncs-setup --package ~/nso-6.0/packages/neds/cisco-ios-cli-6.44 \
    --package ~/nso-6.0/packages/neds/cisco-nx-cli-5.15 \
    --package ~/nso-6.0/packages/neds/cisco-iosxr-cli-7.20 \
    --package ~/nso-6.0/packages/neds/cisco-asa-cli-6.8 \
    --dest nso-instance
    ```
2.  Check the `nso-instance` directory. Notice that several new files and folders are created.

    ```bash
    $ ls nso-instance/
    logs  ncs-cdb  ncs.conf  packages  README.ncs  scripts  state
    $ ls -l nso-instance/packages/
    total 0
    lrwxrwxrwx 1 user docker 51 Mar 19 12:44 cisco-asa-cli-6.8 ->
    /home/user/nso-6.0/packages/neds/cisco-asa-cli-6.8

    lrwxrwxrwx 1 user docker 52 Mar 19 12:44 cisco-ios-cli-6.44 ->
    /home/user/nso-6.0/packages/neds/cisco-ios-cli-6.44

    lrwxrwxrwx 1 user docker 54 Mar 19 12:44 cisco-iosxr-cli-7.20 ->
    /home/user/nso-6.0/packages/neds/cisco-iosxr-cli-7.20

    lrwxrwxrwx 1 user docker 51 Mar 19 12:44 cisco-nx-cli-5.15 ->
    /home/user/nso-6.0/packages/neds/cisco-nx-cli-5.15
    $
    ```

    Following is a description of the important files and folders:

    * `ncs.conf` is the NSO application configuration file and is used to customize aspects of the NSO instance (for example, to change ports, enable/disable features, and so on.) See [ncs.conf(5)](../../../man/ncs.conf.5.md) in Manual Pages for information.
    * `packages/` is the directory that has symlinks to the NEDs that we referenced in the `--package` arguments at the time of setup. See [NSO Packages](../../../development/core-concepts/packages.md) in Development for more information.
    * `logs/` is the directory that contains all the logs from NSO. This directory is useful for troubleshooting.
3. Start the NSO instance by navigating to the `nso-instance` directory and typing the `ncs` command. You must be situated in the `nso-instance` directory each time you want to start or stop NSO. If you have multiple instances, you need to navigate to each one and use the `ncs` command to start or stop each one.
4.  Verify that NSO is running by using the `ncs --status | grep status` command.

    ```bash
    $ ncs --status | grep status
    status: started
    db=running id=31 priority=1 path=/ncs:devices/device/live-status-protocol/device-type
    ```
5. Add Netsim or lab devices using the command `ncs-netsim -h`.
