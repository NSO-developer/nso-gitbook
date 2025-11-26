---
description: Useful information to help you get started with NSO development.
---

# Development Environment and Resources

This section describes some recipes, tools, and other resources that you may find useful throughout development. The topics are tailored to novice users and focus on making development with NSO a more enjoyable experience.

## Development NSO Instance <a href="#ch_devenv.local" id="ch_devenv.local"></a>

Many developers prefer their own, dedicated NSO instance to avoid their work clashing with other team members. You can use either a local or remote Linux machine (such as a VM) or a macOS computer for this purpose.

The advantage of running local Linux with a GUI or macOS is that it is easier to set up the Integrated Development Environment (IDE) and other tools when they run on the same system as NSO. However, many IDEs today also allow working remotely, such as through the SSH protocol, making the choice of local versus remote less of a concern.

For development, using the so-called Local Install of NSO has some distinct advantages:

* It does not require elevated privileges to install or run.
* It keeps all NSO files in the same place (user-defined).
* It allows you to quickly switch between projects and NSO versions.

If you work with multiple projects in parallel, local install also allows you to take advantage of Python virtual environments to separate Python packages per project; simply start the NSO instance in an environment you have activated.

The main downside of using a local install is that it differs slightly from a system (production) install, such as in the filesystem paths used and the out-of-the-box configuration.

See [Local Install](../../administration/installation-and-deployment/local-install.md) for installation instructions.

## Examples and Showcases <a href="#ch_devenv.examples" id="ch_devenv.examples"></a>

There are a number of examples and showcases in this guide. We encourage you to follow them through. They are also a great reference if you are experimenting with a new feature and have trouble getting it to work; you can inspect and compare with the implementation in the example.

To run the examples, you will need access to an NSO instance. A development instance described in this chapter is the perfect option for running locally. See [Running NSO Examples](../../administration/installation-and-deployment/post-install-actions/running-nso-examples.md).

{% hint style="success" %}
Cisco also provides an online sandbox and containerized environments, such as a [Learning Lab](https://developer.cisco.com/learning/labs/nso-examples) or [NSO Sandbox](https://developer.cisco.com/catalogs/sandbox/nso), designed for this purpose. Refer to the [NSO documentation](https://nso-docs.cisco.com/learn-nso/learning-paths) for additional resources.
{% endhint %}

## IDE <a href="#ch_devenv.ide" id="ch_devenv.ide"></a>

Modern IDEs offer many features on top of advanced file editing support, such as code highlighting, syntax checks, and integrated debugging. While the initial setup takes some effort, the benefits of using an IDE are immense.

[Visual Studio Code](https://code.visualstudio.com/) (VS Code) is a freely available and extensible IDE. You can add support for Java, Python, and YANG languages, as well as remote access through SSH via VS Code extensions. Consider installing the following extensions:

* **Python** by Microsoft: Adds Python support.
* **Language Support for Java™** by Red Hat: Adds Java support.
* **NSO Developer Studio** by Cisco: Adds NSO-specific features as described in [NSO Developer Studio](https://nso-docs.cisco.com/resources/platform-tools/nso-developer-studio).
* **Remote - SSH** by Microsoft: Adds support for remote development.

The Remote - SSH extension is especially useful when you must work with a system through an SSH session. Once you connect to the remote host by clicking the `><` button (typically found in the bottom-left corner of the VS Code window), you can open and edit remote files with ease. If you also want language support (syntax highlighting and alike), you may need to install VS Code extensions remotely. That is, install the extensions after you have connected to the remote host; otherwise, the extension installation screen might not show the option for installation on the connected host.

You will also benefit greatly from setting up SSH certificate authentication if you are using an SSH session for your work.

## Automating Instance Setup <a href="#ch_devenv.automate" id="ch_devenv.automate"></a>

Once you get familiar with NSO development and gain some experience, a single NSO instance is likely to be insufficient, either because you need instances for unit testing, because you need one-off (throwaway) instances for an experiment, or for something else entirely.

NSO includes tooling to help you quickly set up new local instances when such a need arises.

The following recipe relies on the `ncs-setup` command, which is available in the local install variant and requires a correctly set up shell environment (e.g., running `source ncsrc`). See [Local Install](../../administration/installation-and-deployment/local-install.md) for details.

A new instance typically needs a few things to be useful:

* Packages
* Initial data
* Devices to manage

In its simplest form, the `ncs-setup` invocation requires only a destination directory. However, you can specify additional packages to use with the `--package` option. Use the option to add as many packages as you need.

Running `ncs-setup` creates the required filesystem structure for an NSO instance. If you wish to include initial configuration data, put the XML-encoded data in the `ncs-cdb` subdirectory, and NSO will load it at the first start, as described in [Initialization Files](../introduction-to-automation/cdb-and-yang.md#d5e268).

NSO also needs to know about the managed devices. In case you are using `ncs-netsim` simulated devices (described in [Network Simulator](../../operation-and-usage/operations/network-simulator-netsim.md)), you can use the `--netsim-dir` option with `ncs-setup` to add them directly. Otherwise, you may need to create some initial XML files with the relevant device configuration data—much like how you would add a device to NSO manually.

Most of the time, you must also invoke a sync with the device so that it performs correctly with NSO. If you wish to push some initial configuration to the device, you may add the configuration in the form of initial XML data and perform a `sync-to`. Alternatively, you can simply do a `sync-from`. You can use the `ncs_cmd` command for this purpose.

Combining all of this together, consider the following example:

1.  Start by creating a new directory to hold the files:

    ```bash
    $ mkdir nso-throwaway
    $ cd nso-throwaway
    ```
2.  Create and start a few simulated devices with `ncs-netsim`, using `./netsim` as directory:

    ```bash
    $ ncs-netsim ncs-netsim create-network $NCS_DIR/packages/neds/cisco-ios-cli-3.8 3 c
    DEVICE c0 CREATED
    DEVICE c1 CREATED
    DEVICE c2 CREATED
    $ ncs-netsim start
    ```
3.  Next, create the running directory with the NED package for the simulated devices and one more package. Also, add configuration data to NSO on how to connect to these simulated devices.

    ```bash
        $ ncs-setup --dest ncs-run --netsim-dir ./netsim \
            --package $NCS_DIR/packages/neds/cisco-ios-cli-3.8 \
            --package $NCS_DIR/packages/neds/cisco-iosxr-cli-3.0
    ```
4.  Now you can add custom initial data as XML files to `ncs-run/ncs-cdb/`. Usually, you would use existing files, but you can also create them on the fly.

    ```bash
    $ cat >ncs-run/ncs-cdb/my_init.xml <<'EOF'
    <config xmlns="http://tail-f.com/ns/config/1.0">
      <session xmlns="http://tail-f.com/ns/aaa/1.1">
        <idle-timeout>0</idle-timeout>
      </session>
    </config>
    EOF
    ```
5.  At this point, you are ready to start NSO:

    ```bash
    $ cd ncs-run
    $ ncs
    ```
6.  Finally, request an initial `sync-from`:

    ```bash
    $ ncs_cmd -u admin -c 'maction /devices/sync-from'
    sync-result begin
      device c0
      result true
    sync-result end
    sync-result begin
      device c1
      result true
    sync-result end
    sync-result begin
      device c2
      result true
    sync-result end
    ```
7. The instance is now ready for work. Once you are finished, you can stop it with `ncs --stop`. Remember to also stop the simulated devices with `ncs-netsim stop` if you no longer need them. Then, delete the containing folder (`nso-throwaway`) to remove all the leftover files and data.
