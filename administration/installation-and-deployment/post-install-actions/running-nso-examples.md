---
description: Run and interact with practice examples provided with the NSO installer.
---

# Running NSO Examples

{% hint style="warning" %}
Applies to Local Install.
{% endhint %}

This section provides an overview of how to run the examples provided with the NSO installer. By working through the examples, the reader should get a good overview of the various aspects of NSO and hands-on experience from interacting with it.

{% hint style="info" %}
This section references the examples located in `$NCS_DIR/examples.ncs`. The examples all have `README` files that include instructions related to the example.
{% endhint %}

## General Instructions <a href="#d5e1220" id="d5e1220"></a>

1. Make sure that NSO is installed with a Local Install according to the instructions in [Local Install](../local-install.md).
2.  Source the `ncsrc` file in the NSO installation directory to set up a local environment. For example:

    ```
    $ source ~/nso-6.0/ncsrc
    ```
3.  Proceed to the example directory:

    ```
    $ cd $NCS_DIR/examples.ncs/getting-started/using-ncs/1-simulated-cisco-ios
    ```
4. Follow the instructions in the `README` files that are located in the example directories.

Every example directory is a complete NSO run-time directory. The README file and the detailed instructions later in this guide show how to generate a simulated network and NSO configuration for running the specific examples. Basically, the following steps are done:

1.  Create a simulated network using the `ncs-netsim --create-network` command:

    ```
    $ ncs-netsim create-network cisco-ios-cli-3.8 3 ios
    ```

    This creates 3 Cisco IOS devices called `ios0`, `ios1`, and `ios2`.
2.  Create an NSO run-time environment using the `ncs-setup` command:

    ```
    $ ncs-setup --dest .
    ```

    This command uses the `--dest` option to create local directories for logs, database files, and the NSO configuration file to the current directory (note that `.` refers to the current directory).
3.  Start NCS netsim:

    ```
    $ ncs-netsim start
    ```
4.  Start NSO:

    ```
    $ ncs
    ```

{% hint style="warning" %}
It is important to make sure that you stop `ncs` and `ncs-netsim` when moving between examples using the `stop` option of the `netsim` and the `--stop` option of the `ncs`.

```
$ cd $NCS_DIR/examples.ncs/getting-started/1-simulated-cisco-ios
$ ncs-netsim start
$ ncs
$ ncs-netsim stop
$ ncs --stop
```
{% endhint %}

## Common Mistakes <a href="#d5e1275" id="d5e1275"></a>

Some of the most common mistakes are:

<details>

<summary>Not Sourcing the <code>ncsrc</code> File</summary>

You have not sourced the `ncsrc` file:

```
$ ncs
-bash: ncs: command not found
```

</details>

<details>

<summary>Not Starting NSO from the Runtime Directory</summary>

You are trying to start NSO from a directory that is not set up as a runtime directory.

```
$ ncs
Bad configuration: /etc/ncs/ncs.conf:0: "./state/packages-in-use: \
   Failed to create symlink: no such file or directory"
Daemon died status=21
```

What happened above is that NSO did not find an `ncs.conf` in the local directory so it uses the default in `/etc/ncs/ncs.conf`. That `ncs.conf` says there shall be directories at `./` such as `./state` which is not true. Make sure that you `cd` to the root of the example and check that there is a `ncs.conf` file, and a `cdb-dir` directory.

</details>

<details>

<summary>Having Another Instance of NSO Running</summary>

You already have another instance of NSO running (or the same with netsim):

```
$ ncs
Cannot bind to internal socket 127.0.0.1:4569 : address already in use
Daemon died status=20
$ ncs-netsim start
DEVICE c0 Cannot bind to internal socket 127.0.0.1:5010 : \
  address already in use
Daemon died status=20
FAIL
```

To resolve the above, just stop the running instance of NSO and netsim. Remember that it does not matter where you started the "running" NSO and netsim, there is no need to `cd` back to the other example before stopping.

</details>

<details>

<summary>Not Having the Netsim Device Configuration Loaded into NSO</summary>

Another problem that users run into sometimes is where the netsim device configuration is not loaded into NSO. This can happen if the order of commands is not followed. To resolve this, remove the database files in the `ncs_cdb` directory (keep any files with the `.xml` extension). In this way, NSO will reload the XML initialization files provided by **ncs-setup**.

```
$ ncs --stop
$ cd ncs-cdb/
$ ls
A.cdb
C.cdb
O.cdb
S.cdb
netsim_devices_init.xml
$ rm *.cdb
$ ncs
```

</details>
