---
description: Quick start instructions to get started with NSO.
---

# Quick Start Guide

***

{% hint style="info" %}
This quick start guide uses a Local Install of NSO for those just getting started. The [NSO Installation and Deployment Guide](https://cisco-tailf.gitbook.io/nso-docs/administration/installation-and-deployment) details handling Local and System installations.
{% endhint %}

<details>

<summary>Local vs. System Install</summary>

Before you install NSO onto your system, you need to decide whether to do a "System" or "Local" installation. Here's a simple breakdown of the two.

* Use **System Install** when installing NSO for a centralized, "always-on" production-grade purpose. System installs configure NSO as a system daemon that starts and ends with the underlying operating system. Linux PAM is used instead of NSO local authentication using the admin and oper default users, and the file structure is distributed.
* Use **Local Install** for development, lab, and evaluation purposes. It unpacks all the application components, including docs and examples. The developer can use local installs to run multiple unrelated instances of NSO for different labs and demos on a single workstation.

</details>

***

## Requirements <a href="#requirements" id="requirements"></a>

For development purposes, choose between the following:

* Linux for x86\_64 or arm64.
* macOS Darwin for x86\_64 or arm64.

A detailed list of NSO installation requirements can be found in the [NSO Installation and Deployment](https://cisco-tailf.gitbook.io/nso-docs/administration/installation-and-deployment) guide.

## Download Your NSO Free Trial Installer and Cisco NEDs <a href="#download-your-nso-free-trial-installer-and-cisco-neds" id="download-your-nso-free-trial-installer-and-cisco-neds"></a>

This **evaluation** copy has been provided under the terms of the Cisco NSO Evaluation License. There are two versions of the NSO installer for macOS and Linux systems, respectively:

* [NSO for Linux and MacOS (Darwin), including NED examples](https://software.cisco.com/download/home/286331591/type/286283941/release)

## Installation <a href="#installation" id="installation"></a>

{% hint style="info" %}
The recommended guide for installing NSO is the [NSO Installation and Deployment](https://cisco-tailf.gitbook.io/nso-docs/administration/installation-and-deployment) guide. The description below is a quick-start version.
{% endhint %}

### Operating System <a href="#operating-system" id="operating-system"></a>

Cisco NSO can run on macOS or Linux systems. If you are a Windows user (or do not wish to install it natively on your laptop), you can install NSO on a Linux virtual machine or in a container.

If you use Docker, there are pre-built system install images available. See the [Containerized NSO](https://cisco-tailf.gitbook.io/nso-docs/administration/installation-and-deployment/containerized-nso) guide.

There are [NSO Playgrounds](https://developer.cisco.com/codeexchange/github/repo/CiscoDevNet/NSO-Playground-Local-Install/) available to dive right in and try out examples in a user-friendly browser-based integrated development environment (IDE).

## Performing a Local Install <a href="#performing-a-local-installation" id="performing-a-local-installation"></a>

Once you've installed the prereqs and downloaded the NSO installation file for your operating system, you are ready to do your installation:

{% stepper %}
{% step %}
Open a terminal and navigate to the directory where you downloaded the installer.

> **Ensure that you have the correct installer binary for your OS**, `darwin` is for macOS, and `linux` for Linux distributions.

{% code overflow="wrap" %}
```bash
cd ~/Downloads
ls -l nso*.bin
-rw-r--r--@ 1 user  staff   199M Dec 15 11:45 nso-6.0.darwin.x86_64.installer.bin
-rw-r--r--@ 1 user  staff   199M Dec 15 11:45 nso-6.0.darwin.x86_64.signed.bin
```
{% endcode %}

> If your file is a signed.bin file, this means that Cisco has digitally signed the file you downloaded, and when you execute it, you'll verify the signature and unpack the `installer.bin`. If you have the `installer.bin` , skip down past the signed steps.
{% endstep %}

{% step %}
Use the `sh` command to "run" the `signed.bin` to verify the certificate and extract the installer binary and other files.

{% code overflow="wrap" %}
```
sh nso-6.0.darwin.x86_64.signed.bin 

# Output
Unpacking...
Verifying signature...
Downloading CA certificate from http://www.cisco.com/security/pki/certs/crcam2.cer ...
Successfully downloaded and verified crcam2.cer.
Downloading SubCA certificate from http://www.cisco.com/security/pki/certs/innerspace.cer ...
Successfully downloaded and verified innerspace.cer.
Successfully verified root, subca and end-entity certificate chain.
Successfully fetched a public key from tailf.cer.
Successfully verified the signature of nso-6.0.darwin.x86_64.installer.bin using tailf.cer
```
{% endcode %}
{% endstep %}

{% step %}
If it all comes back green, you're in good shape and ready to install.&#x20;

{% code overflow="wrap" %}
```bash
ls -l

# Output
-rw-r--r--  1 user  staff   1.8K Nov 29 06:05 README.signature
-rw-r--r--  1 user  staff    12K Nov 29 06:05 cisco_x509_verify_release.py
-rwxr-xr-x  1 user  staff   199M Nov 29 05:55 nso-6.0.darwin.x86_64.installer.bin
-rw-r--r--  1 user  staff   256B Nov 29 06:05 nso-6.0.darwin.x86_64.installer.bin.signature
-rwxr-xr-x@ 1 user  staff   199M Dec 15 11:45 nso-6.0.darwin.x86_64.signed.bin
-rw-r--r--  1 user  staff   1.4K Nov 29 06:05 tailf.cer
```
{% endcode %}

Here is what was unpacked:

* The NSO installer `nso-VERSION.OS.ARCH.installer.bin`.
* Signature generated for the NSO image `nso-VERSION.OS.ARCH.installer.bin.signature`.
* An enclosed Cisco-signed `tailf.cer` x.509 end-entity certificate containing the public key that is used to verify the signature.
* `README.signature` file which briefs you on more details on the unpacked content and the steps on "How to run the signature verification program". If you would like to manually verify the signature, please refer to the steps in this file.
* `cisco_x509_verify_release.py` python program that can be used to verify the 3-tier x.509 certificate chain and signature.
{% endstep %}

{% step %}
First, check out the `--help` on the installer binary using the `sh nso-6.0.darwin.x86_64.installer.bin --help` command. Notice the two options for `--local-install` or `--system-install`.

```
sh nso-6.0.darwin.x86_64.installer.bin --help

# Output
This is the NCS installation script.

Usage: ./nso-6.0.darwin.x86_64.installer.bin [--local-install] LocalInstallDir

Installs NCS in the LocalInstallDir directory only.
This is convenient for test and development purposes.

Usage: ./nso-6.0.darwin.x86_64.installer.bin --system-install [--install-dir InstallDir]
    [--config-dir ConfigDir] [--run-dir RunDir] [--log-dir LogDir]
    [--run-as-user User] [--keep-ncs-setup] [--non-interactive]

Does a system install of NCS, suitable for deployment.
Static files are installed in InstallDir/ncs-<vsn>.
The first time --system-install is used, the ConfigDir,
RunDir, and LogDir directories are also created and
populated for config files, run-time state files, and log files,
respectively, and an init script for start of NCS at system boot
and user profile scripts are installed. Defaults are:

InstallDir - /opt/ncs
ConfigDir  - /etc/ncs
RunDir     - /var/opt/ncs
LogDir     - /var/log/ncs

By default, the system install will run NCS as the root user.
If the --run-as-user option is given, the system install will
instead run NCS as the given user. The user will be created if
it does not already exist.

If the --non-interactive option is given, the installer will
proceed with potentially disruptive changes (e.g. modifying or
removing existing files) without asking for confirmation.
```
{% endstep %}

{% step %}
For the installation directory or `LocalInstallDir`, the recommendation is to install it into your `$HOME` directory in a folder called `~/nso-VERSION`. So if our version is `6.0`, our directory will be `~/nso-6.0`.
{% endstep %}

{% step %}
Run the installer with the argument `--local-install ~/nso-6.0` to install it into your home directory.

{% code overflow="wrap" %}
```bash
sh nso-6.0.darwin.x86_64.installer.bin --local-install ~/nso-6.0

# Output
INFO  Using temporary directory /var/folders/90/n5sbctr922336_0jrzhb54400000gn/T//ncs_installer.93831 to stage NCS installation bundle
INFO  Unpacked ncs-6.0 in /Users/user/nso-6.0
INFO  Found and unpacked corresponding DOCUMENTATION_PACKAGE
INFO  Found and unpacked corresponding EXAMPLE_PACKAGE
INFO  Found and unpacked corresponding JAVA_PACKAGE
INFO  Generating default SSH hostkey (this may take some time)
INFO  SSH hostkey generated
INFO  Environment set-up generated in /Users/user/nso-6.0/ncsrc
INFO  NSO installation script finished
INFO  Found and unpacked corresponding NETSIM_PACKAGE
INFO  NCS installation complete
```
{% endcode %}
{% endstep %}

{% step %}
That's it. NSO is installed.
{% endstep %}
{% endstepper %}

## Exploring the Installation <a href="#exploring-the-installation" id="exploring-the-installation"></a>

Before we start up NSO, let's just look at what we have.

Go ahead and `cd` into the new installation directory.

```bash
cd ~/nso-6.0
```

### Documentation <a href="#documentation" id="documentation"></a>

> **Note**: Links to the online version of the [NSO Guides](https://cisco-tailf.gitbook.io/nso-docs) and [NSO Extension API Reference](https://developer.cisco.com/docs/nso/api/) documentation.

Along with the binaries, NSO installs a full set of documentation available in the `doc/` folder in `~/nso-6.0`.

```bash
ls -l doc/
drwxr-xr-x   5 user  staff   160B Nov 29 05:19 api/
drwxr-xr-x  14 user  staff   448B Nov 29 05:19 html/
-rw-r--r--   1 user  staff   202B Nov 29 05:19 index.html
drwxr-xr-x  17 user  staff   544B Nov 29 05:19 pdf/
```

Feel free to open up the `index.html` file in your favorite browser and poke around (you can use the `open` command in the terminal to open the file). You'll find installation, admin, user, development, and more guides available for you to jump right into.

### Examples <a href="#examples" id="examples"></a>

An NSO Local Install also comes with **A LOT** of examples of a variety of different types of ways you can use NSO. Many of these touch on advanced topics, but there are plenty of basic ones as well. Here are the high-level directories of examples in `~/nso-6.0/examples.ncs`

```bash
ls -l examples.ncs/

# Output
-rw-r--r--   1 user  staff   1.0K Nov 29 05:17 README
drwxr-xr-x   4 user  staff   128B Nov 29 04:50 datacenter/
drwxr-xr-x   3 user  staff    96B Nov 29 04:50 generic-ned/
drwxr-xr-x   4 user  staff   128B Nov 29 04:50 getting-started/
drwxr-xr-x   7 user  staff   224B Nov 29 04:50 service-provider/
drwxr-xr-x   3 user  staff    96B Nov 29 04:50 snmp-ned/
drwxr-xr-x  11 user  staff   352B Nov 29 05:17 snmp-notification-receiver/
drwxr-xr-x   5 user  staff   160B Nov 29 04:50 web-server-farm/
```

### NEDs or Network Element Drivers <a href="#neds-or-network-element-drivers" id="neds-or-network-element-drivers"></a>

In order to "talk to" the network, NSO uses NEDs as device drivers for different device types. Cisco has NEDs for hundreds of different devices available for customers, and several are included in the installer in the `~/nso-6.0/packages/neds` directory.

```bash
ls -l

# Output
drwxr-xr-x  13 user  staff   416B Nov 29 05:17 a10-acos-cli-3.0/
drwxr-xr-x  12 user  staff   384B Nov 29 05:17 alu-sr-cli-3.4/
drwxr-xr-x  13 user  staff   416B Nov 29 05:17 cisco-asa-cli-6.6/
drwxr-xr-x  12 user  staff   384B Nov 29 05:17 cisco-ios-cli-3.0/
drwxr-xr-x  12 user  staff   384B Nov 29 05:17 cisco-ios-cli-3.8/
drwxr-xr-x  13 user  staff   416B Nov 29 05:17 cisco-iosxr-cli-3.0/
drwxr-xr-x  13 user  staff   416B Nov 29 05:17 cisco-iosxr-cli-3.5/
drwxr-xr-x  13 user  staff   416B Nov 29 05:17 cisco-nx-cli-3.0/
drwxr-xr-x  13 user  staff   416B Nov 29 05:17 dell-ftos-cli-3.0/
drwxr-xr-x  10 user  staff   320B Nov 29 05:17 juniper-junos-nc-3.0/
```

Here you can see there are NEDs for Cisco ASA, IOS, IOS XR, and NX-OS. Also included are NEDs for other vendors including Juniper JunOS, A10, ALU, and Dell.

> **Note**: The NEDs included in the installer are **intended for evaluation, demonstration, and use with the** `examples.ncs` that are also included. These are **not** the latest versions available, and often don't have all the features available in production NEDs.

#### **Installing New NED Versions**

Cisco also makes additional versions of some NEDs available on DevNet for evaluation and non-production use. You can find them with the NSO downloads (scroll up!).

> **Note**: The specific file names and versions you download maybe different from this guide. Update the paths appropriately.

1. Like the NSO installer, the NEDs are `signed.bin` files that need to be run to validate the download and extract the new code.
2. First, find the downloaded files - change to the working directory where your downloads are:

> **Note**: The filenames indicate which version of NSO the NEDs are pre-compiled for (in this case NSO 6.0), and the version of the NED.

```bash
cd ~/Downloads/
ls -l ncs*.bin

# Output
-rw-r--r--@ 1 user  staff   9708091 Dec 18 12:05 ncs-6.0-cisco-asa-6.16-freetrial.signed.bin
-rw-r--r--@ 1 user  staff  51233042 Dec 18 12:06 ncs-6.0-cisco-ios-6.88-freetrial.signed.bin
-rw-r--r--@ 1 user  staff  39292052 Dec 18 12:06 ncs-6.0-cisco-iosxr-7.43-freetrial.signed.bin
-rw-r--r--@ 1 user  staff   8400190 Dec 18 12:05 ncs-6.0-cisco-nx-5.23.6-freetrial.signed.bin
```

3. Use the `sh` command to "run" the `signed.bin` to verify the certificate and extract the NED `tar.gz` and other files. Repeat for all files.

```bash
sh ncs-6.0-cisco-nx-5.23.6.signed.bin
```

Output:

{% code overflow="wrap" %}
```bash
Unpacking...
Verifying signature...
Downloading CA certificate from http://www.cisco.com/security/pki/certs/crcam2.cer ...
Successfully downloaded and verified crcam2.cer.
Downloading SubCA certificate from http://www.cisco.com/security/pki/certs/innerspace.cer ...
Successfully downloaded and verified innerspace.cer.
Successfully verified root, subca and end-entity certificate chain.
Successfully fetched a public key from tailf.cer.
Successfully verified the signature of ncs-6.0-cisco-nx-5.23.6.tar.gz using tailf.cer
```
{% endcode %}

4. You now have three tarballs (`.tar.gz`) files. These are compressed versions of the NEDs.

```bash
ls -l ncs*.tar.gz
```

Output:

{% code overflow="wrap" %}
```bash
-rw-r--r--  1 user  staff   9704896 Dec 12 21:11 ncs-6.0-cisco-asa-6.16.tar.gz
-rw-r--r--  1 user  staff  51260488 Dec 13 22:58 ncs-6.0-cisco-ios-6.88.tar.gz
-rw-r--r--  1 user  staff  39305257 Oct  7 17:47 ncs-6.0-cisco-iosxr-7.43.tar.gz
-rw-r--r--  1 user  staff   8409288 Dec 18 09:09 ncs-6.0-cisco-nx-5.23.6.tar.gz
```
{% endcode %}

5. Navigate to the `packages/neds` directory for your local install.

```bash
cd ~/nso-6.0/packages/neds
```

6. While in `~/nso-6.0/packages/neds` directory, extract the tarballs into this directory using the `tar` command with the path to where the compressed NED is located:

> Update the path and file name for the NED versions you downloaded

```bash
tar -zxvf ~/Downloads/ncs-6.0-cisco-nx-5.23.6.tar.g
tar -zxvf ~/Downloads/ncs-6.0-cisco-ios-6.88.tar.gz
tar -zxvf ~/Downloads/ncs-6.0-cisco-iosxr-7.43.tar.gz
tar -zxvf ~/Downloads/ncs-6.0-17:47-6.16.tar.gz
```

Here is a sample list of the newer NEDs extracted along with the ones bundled with the installation:

```bash
drwxr-xr-x  13 user  staff   416 Nov 29 05:17 a10-acos-cli-3.0
drwxr-xr-x  12 user  staff   384 Nov 29 05:17 alu-sr-cli-3.4
drwxr-xr-x  13 user  staff   416 Nov 29 05:17 cisco-asa-cli-6.6
drwxr-xr-x  13 user  staff   416 Dec 12 21:11 cisco-asa-cli-6.7
drwxr-xr-x  12 user  staff   384 Nov 29 05:17 cisco-ios-cli-3.0
drwxr-xr-x  12 user  staff   384 Nov 29 05:17 cisco-ios-cli-3.8
drwxr-xr-x  13 user  staff   416 Dec 13 22:58 cisco-ios-cli-6.42
drwxr-xr-x  13 user  staff   416 Nov 29 05:17 cisco-iosxr-cli-3.0
drwxr-xr-x  13 user  staff   416 Nov 29 05:17 cisco-iosxr-cli-3.5
drwxr-xr-x  13 user  staff   448 Oct  7 14:46 cisco-iosxr-cli-7.4
drwxr-xr-x  13 user  staff   416 Nov 29 05:17 cisco-nx-cli-3.0
drwxr-xr-x  14 user  staff   448 Dec 18 09:09 cisco-nx-cli-5.13
drwxr-xr-x  13 user  staff   416 Nov 29 05:17 dell-ftos-cli-3.0
drwxr-xr-x  10 user  staff   320 Nov 29 05:17 juniper-junos-nc-3.0
```

7. And now you have the newer NED versions available, as well as the demo/evaluation versions included with NSO itself!

### `ncsrc` <a href="#ncsrc" id="ncsrc"></a>

The last thing to note is the files `ncsrc` and `ncsrc.tsch`. These are shell scripts for bash and `tsch` that set up your `PATH` and other environment variables for NSO. Depending on your shell, you will need `source` this file before starting your NSO work.

```bash
# NOTE your path may be different, double check!
 $ source $HOME/nso-6.0/ncsrc
```

Most users add `source ~/nso-6.0/ncsrc` to their `~/.bash_profile`, but you can just do it manually when you want it. Once it has been "sourced" you have access to all the NSO executable commands - which start with `ncs`.

```bash
ncs {TAB} {TAB}

# Output
ncs                      ncs-maapi                ncs-project              ncs-start-python-vm      ncs_cmd                  ncs_load                 
ncs-backup               ncs-make-package         ncs-setup                ncs-uninstall            ncs_conf_tool            ncsc                     
ncs-collect-tech-report  ncs-netsim               ncs-start-java-vm        ncs_cli                  ncs_crypto_keys 
```

## Creating an Instance of NSO <a href="#creating-an-instance-of-nso" id="creating-an-instance-of-nso"></a>

A NSO Local Install unpacks and prepares your system to run NSO, but **doesn't actually start it up**. A Local Install allows the engineer to create an NSO "instance" tied to a project, which you have not done yet.

> If you are familiar with Python, you can think of this like creating a Python virtual environment after installing Python. Within this NSO instance, you will have different inventory, configuration, and code.

### **Using `ncs-setup` to Create an NSO Instance**

One of the included scripts with an NSO installation is `ncs-setup`, which makes it very easy to create instances of NSO from a Local Install. You can look at the `--help` for full details, but the two options we need to know are: \* `--dest` defines the directory where you want to set up NSO (if the directory does not exist, it will be created) \* `--package` defines the NEDs you want to this NSO instance to have installed. You can specify this option multiple times.

> **Note**: NCS is the original name of the NSO product, so many the commands and application features will be prefaced with `ncs`. Think of `ncs` as another name for NSO.

1.  Go ahead and run this command to setup an NSO instance in the current directory with the IOS, NX-OS, IOS-XR, and ASA NEDs, you only need one NED per platform that you want NSO to manage (even though you may have multiple versions in your installer `neds` directory).\


    > You will want to use the name of the NED folder in `${NCS_DIR}/packages/neds` for the **latest** NED version you've got installed for the target platform. You can use `tab` complete after you start typing a path (or just copy and paste, though double check the NED version numbers below match what is currently on the sandbox to avoid a syntax error):



    ```bash
    ncs-setup --package ~/nso-6.0/packages/neds/cisco-ios-cli-6.44 \
      --package ~/nso-6.0/packages/neds/cisco-nx-cli-5.15 \
      --package ~/nso-6.0/packages/neds/cisco-iosxr-cli-7.20 \
      --package ~/nso-6.0/packages/neds/cisco-asa-cli-6.8 \
      --dest nso-instance
    ```
2.  If you check out the `nso-instance` directory now, you'll find several new files and folders have been created. This guide won't go through them all in detail now, but a couple are handy to know about.

    * `ncs.conf` is the NSO application configuration file. Used to customize aspects of the NSO instance (change ports, enable/disable features, etc.). The defaults are often perfect for projects like this.
    * `packages/` is the directory that has symlinks to the NEDs that we referenced in the `--package` arguments at setup.
    * `logs/` is the directory that contains all the logs from NSO. This directory is useful when troubleshooting.



    ```bash
    $ ls nso-instance/
    logs  ncs-cdb  ncs.conf  packages  README.ncs  scripts  state
    $ ls -l nso-instance/packages/
    total 0
    lrwxrwxrwx 1 user docker 51 Mar 19 12:44 cisco-asa-cli-6.8 -> /home/user/nso-6.0/packages/neds/cisco-asa-cli-6.8
    lrwxrwxrwx 1 user docker 52 Mar 19 12:44 cisco-ios-cli-6.44 -> /home/user/nso-6.0/packages/neds/cisco-ios-cli-6.44
    lrwxrwxrwx 1 user docker 54 Mar 19 12:44 cisco-iosxr-cli-7.20 -> /home/user/nso-6.0/packages/neds/cisco-iosxr-cli-7.20
    lrwxrwxrwx 1 user docker 51 Mar 19 12:44 cisco-nx-cli-5.15 -> /home/user/nso-6.0/packages/neds/cisco-nx-cli-5.15
    $
    ```
3. Now you need to "start" your NSO instance. Navigate to the `nso-instance` directory and type the command `ncs`. It will take a few seconds to run, and you won't get any explicit output unless there is a problem.

> **Note**: You need to be in the `nso-instance` directory each time you want to start or stop NSO. If you have multiple instances, you need to navigate to each one to use the `ncs` command to start or stop each one.

```bash
ncs
```

4. You can verify that NSO is running by using the `ncs --status | grep status` command, which has a large amount of information, so we use `grep` to just search for the status:

{% code overflow="wrap" %}
```bash
$ ncs --status | grep status
status: started
        db=running id=31 priority=1 path=/ncs:devices/device/live-status-protocol/device-type
```
{% endcode %}

5. Now you should add either some netsim devices (`ncs-netsim -h`) or lab devices to NSO and get automating!

## Get Started <a href="#getting-started" id="getting-started"></a>

We recommend that you start with the [online version](https://cisco-tailf.gitbook.io/nso-docs) or in the doc directory `$HOME/nso-VERSION/doc/pdf/`.

There are a lot of examples in the `$HOME/nso-VERSION/examples.ncs` directory. The examples have a short description in the `$HOME/nso-VERSION/examples.ncs/README`file. Each example has a README file that explains how to run it.

## Sandboxes <a href="#sandboxes" id="sandboxes"></a>

If you do not want to download and install Cisco NSO, please check out the [NSO Reservable Sandbox on DevNet](https://devnetsandbox.cisco.com/RM/Diagram/Index/43964e62-a13c-4929-bde7-a2f68ad6b27c?diagramType=Topology). There is also an associated tutorial called [Learn NSO the Easy Way](https://developer.cisco.com/learning/tracks/get_started_with_nso).

## Still Need Help? <a href="#still-need-help" id="still-need-help"></a>

There is a lot of material on the [NSO Developer Hub](https://community.cisco.com/t5/nso-developer-hub/ct-p/5672j-dev-nso), where you also can ask questions about anything NSO-related.
