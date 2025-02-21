---
description: Install NSO for production use in a system-wide deployment.
---

# System Install

## Installation Steps

Complete the following activities in the given order to perform a System Install of NSO.

<table data-view="cards" data-full-width="false"><thead><tr><th></th><th></th><th></th></tr></thead><tbody><tr><td><strong>Prepare</strong></td><td><a href="system-install.md#step-1---fulfill-system-requirements">1. Fulfill System Requirements</a><br><a href="system-install.md#si.download.the.installer">2. Download Installer/NEDs</a><br><a href="system-install.md#si.unpack.the.installer">3. Unpack the Installer</a></td><td></td></tr><tr><td><strong>Install</strong></td><td><a href="system-install.md#si.run.the.installer">4. Run the Installer</a></td><td></td></tr><tr><td><strong>Finalize</strong></td><td><a href="system-install.md#si.setup.user.access">5. Set up User Access</a><br><a href="system-install.md#si.set.env.variables">6. Set Environment Variables</a><br><a href="system-install.md#si.runtime.directory.creation">7. Runtime Directory Creation</a><br><a href="system-install.md#si.generate.license.token">8. Generate License Token</a></td><td></td></tr></tbody></table>

### Step 1 - Fulfill System Requirements

Start by setting up your system to install and run NSO.

To install NSO:

1. Fulfill at least the primary requirements.
2. If you intend to build and run NSO deployment examples, you also need to install additional applications listed under Additional Requirements.

<details>

<summary>Primary Requirements</summary>

Primary requirements to do a System Install include:

* A system running Linux or macOS on either the `x86_64` or `ARM64` architecture for development. Linux for production.
* GNU libc 2.24 or higher.
* Java JRE 17 or higher. Used by Cisco Smart Licensing.
* Required and included with many Linux/macOS distributions:
  * `tar` command. Unpack the installer.
  * `gzip` command. Unpack the installer.
  * `ssh-keygen` command. Generate SSH host key.
  * `openssl` command. Generate self-signed certificates for HTTPS.
  * `find` command. Used to find out if all required libraries are available.
  * `which` command. Used by the NSO package manager.
  * `libpam.so.0`. Pluggable Authentication Module library.
  * `libexpat.so.1`. EXtensible Markup Language parsing library.
  * `libz.so.1` version 1.2.7.1 or higher. Data compression library.

</details>

<details>

<summary>Additional Requirements</summary>

Additional requirements to, for example, build and run NSO production deployment examples, include:

* Java JDK 17 or higher.
* Ant 1.9.8 or higher.
* Python 3.10 or higher.
* Python Setuptools is required to build the Python API.
* Often installed using the Python package installer pip:
  * Python Paramiko 2.2 or higher. To use netconf-console.
  * Python requests. Used by the RESTCONF demo scripts.
* `xsltproc` command. Used by the `support/ned-make-package-meta-data` command to generate the `package-meta-data.xml` file.
* One of the following web browsers is required for NSO GUI capabilities. The version must be supported by the vendor at the time of release.
  * Safari
  * Mozilla Firefox
  * Microsoft Edge
  * Google Chrome
* OpenSSH client applications. For example `ssh` and `scp` commands.
* cron. Run time-based tasks, such as `logrotate`.
* `logrotate`. rotate, compress, and mail NSO and system logs.
* `rsyslog`. pass NSO logs to a local syslog managed by `rsyslogd` and pass logs to a remote node.
* `systemd` or `init.d` scripts to start and stop NSO.

</details>

### Step 2 - Download the Installer and NEDs <a href="#si.download.the.installer" id="si.download.the.installer"></a>

To download the Cisco NSO installer and example NEDs:

1. Go to the Cisco's official [Software Download](https://software.cisco.com/download/home) site.
2. Search for the product "Network Services Orchestrator" and select the desired version.
3. There are two versions of the NSO installer, i.e. for macOS and Linux systems. For System Install, choose the Linux OS version.

<details>

<summary>Identifying the Installer</summary>

You need to know your system specifications (Operating System and CPU architecture) to choose the appropriate NSO Installer.

NSO is delivered as an OS/CPU-specific signed self-extractable archive. The signed archive file has the pattern `nso-VERSION.OS.ARCH.signed.bin` that after signature verification extracts the `nso-VERSION.OS.ARCH.installer.bin` archive file, where:

* `VERSION` is the NSO version to install.
* `OS` is the Operating System (`linux` for all Linux distributions and `darwin` for macOS).
* `ARCH` is the CPU architecture, for example, `x86_64`.

</details>

### Step 3 - Unpack the Installer <a href="#si.unpack.the.installer" id="si.unpack.the.installer"></a>

If your downloaded file is a `signed.bin` file, it means that it has been digitally signed by Cisco, and upon execution, you will verify the signature and unpack the `installer.bin`.

If you only have `installer.bin`, skip to the next step.

To unpack the installer:

1.  In the terminal, list the binaries in the directory where you downloaded the installer, for example:

    ```bash
    cd ~/Downloads
    ls -l nso*.bin
    -rw-r--r--@ 1 user  staff   199M Dec 15 11:45 nso-6.0.linux.x86_64.installer.bin
    -rw-r--r--@ 1 user  staff   199M Dec 15 11:45 nso-6.0.linux.x86_64.signed.bin
    ```
2.  Use the `sh` command to run the `signed.bin` to verify the certificate and extract the installer binary and other files. An example output is shown below.

    ```bash
    sh nso-6.0.linux.x86_64.signed.bin
    # Output
    Unpacking...
    Verifying signature...
    Downloading CA certificate from http://www.cisco.com/security/pki/certs/crcam2.cer ...
    Successfully downloaded and verified crcam2.cer.
    Downloading SubCA certificate from http://www.cisco.com/security/pki/certs/innerspace.cer ...
    Successfully downloaded and verified innerspace.cer.
    Successfully verified root, subca and end-entity certificate chain.
    Successfully fetched a public key from tailf.cer.
    Successfully verified the signature of nso-6.0.linux.x86_64.installer.bin using tailf.cer
    ```
3.  List the files to check if extraction was successful.

    ```bash
    ls -l
    # Output
    -rw-r--r--  1 user  staff   1.8K Nov 29 06:05 README.signature
    -rw-r--r--  1 user  staff    12K Nov 29 06:05 cisco_x509_verify_release.py
    -rwxr-xr-x  1 user  staff   199M Nov 29 05:55 nso-6.0.linux.x86_64.installer.bin
    -rw-r--r--  1 user  staff   256B Nov 29 06:05 nso-6.0.linux.x86_64.installer.bin.signature
    -rwxr-xr-x@ 1 user  staff   199M Dec 15 11:45 nso-6.0.linux.x86_64.signed.bin
    -rw-r--r--  1 user  staff   1.4K Nov 29 06:05 tailf.cer
    ```

{% hint style="info" %}
There may also be additional files present.
{% endhint %}

<details>

<summary>Description of Unpacked Files</summary>

The following contents are unpacked:

* `nso-VERSION.OS.ARCH.installer.bin`: The NSO installer.
* `nso-VERSION.OS.ARCH.installer.bin.signature`: Signature generated for the NSO image.
* `tailf.cer`: An enclosed Cisco signed x.509 end-entity certificate containing the public key that is used to verify the signature.
* `README.signature`: File with further details on the unpacked content and steps on how to run the signature verification program. To manually verify the signature, refer to the steps in this file.
* `cisco_x509_verify_release.py`: Python program that can be used to verify the 3-tier x.509 certificate chain and signature.
* Multiple `.tar.gz` files: Bundled packages, extending the base NSO functionality.
* Multiple `.tar.gz.signature` files: Digital signatures for the bundled packages.

Since NSO version 6.3, a few additional NSO packages are included. They contain the following platform tools:

* HCC
* Observability Exporter
* Phased Provisioning
* Resource Manager

For platform tools documentation, refer to individual package's `README` file or to the [online documentation](https://cisco-tailf.gitbook.io/nso-docs/resources).

**NED Packages**

The NED Packages that are available with the NSO Installation are netsim-based example NEDs. These NEDs are used for NSO examples only.

Fetch the latest production-grade NEDs from [Cisco Software Download](https://software.cisco.com/download/home) using the URLs provided on your NED license certificates.

**Manual Pages**

The installation program will unpack the NSO manual pages from the documentation archive, allowing you to use the `man` command to view them. The Manual Pages are also available in PDF format and from the online documentation located on [NCS man-pages, Volume 1 ](https://developer.cisco.com/docs/nso-api-6.4/ncs-man-pages-volume-1/#ncs-installer)in Manual Pages.

Following is a list of a few of the installed manual pages:

* `ncs(1)`: Command to start and control the NSO daemon.
* `ncsc(1)`: NSO Yang compiler.
* `ncs_cli(1)`: Frontend to the NSO CLI engine.
* `ncs-netsim(1)`: Command to create and manipulate a simulated network.
* `ncs-setup(1)`: Command to create an initial NSO setup.
* `ncs.conf`: NSO daemon configuration file format.

For example, to view the manual page describing the NSO configuration file you should type:

```bash
$ man ncs.conf
```

Apart from the manual pages, extensive information about command line options can be obtained by running `ncs` and `ncsc` with the `--help` (abbreviated `-h`) flag.

```bash
$ ncs --help
```

```bash
$ ncsc --help
```

**Installer Help**

Run the `sh nso-VERSION.linux.x86_64.installer.bin --help` command to view additional help on running binaries. More details can be found in the [ncs-installer(1)](https://developer.cisco.com/docs/nso-api-6.4/ncs-man-pages-volume-1/#ncs-installer) Manual Page included with NSO.

Notice the two options for `--local-install` or `--system-install`.

```bash
sh nso-6.0.linux.x86_64.installer.bin --help
```

</details>

### Step 4 - Run the Installer <a href="#si.run.the.installer" id="si.run.the.installer"></a>

To run the installer:

1. Navigate to your Install Directory.
2.  Run the installer with the `--system-install` option to perform System Install. This option creates an Install of NSO that is suitable for production deployment.

    ```bash
    $ sudo sh nso-VERSION.OS.ARCH.installer.bin --system-install
    ```

    For example:

    ```bash
    $ sudo sh nso-6.0.linux.x86_64.installer.bin --system-install
    ```

<details>

<summary>Default Directories and Scripts</summary>

The System Install by default creates the following directories:

* The Installation Directory is created in `/opt/ncs`, where the distribution is available.
* The Configuration Directory is created in `/etc/ncs`, where the `ncs.conf` file, SSH keys, and WebUI certificates are created.
* The Running Directory is created in `/var/opt/ncs`, where runtime state files, CDB database, and packages are created.
* The Log Directory is created in `/var/log/ncs`, where the log files are populated.
* System-wide environment variables are created in `/etc/profile.d/ncs.sh`.
* The installer creates a `systemd` system service script in `/etc/systemd/system/ncs.service` and enables the NSO service to start at boot, but the service is _not_ started immediately. See the steps below for starting NSO after installation and before rebooting.
* To allow package reload when starting NSO, an environment file called `/etc/ncs/ncs.systemd.conf` is created. This file is owned by the user that starts NSO.

For the `--system-install` option, you can also choose a user-defined (non-default) Installation Directory, Configuration Directory, Running Directory, and Log Directory with `--install-dir`, `--config-dir`, `--run-dir` and `--log-dir` parameters, and specify that NSO should run as a different user than root with the `--run-as-user` parameter.

If you choose a non-default Installation Directory by using `--install-dir`, you need to specify `--install-dir` for subsequent installs and also for backup and restore.

Use the `--ignore-init-scripts` option to disable provisioning the `systemd` system service.

If a legacy SysV service exists in `/etc/init.d/ncs` when installing in interactive mode, the user will be prompted to continue using the old SysV service behavior or prepare a `systemd` service. In non-interactive mode, a `systemd` service will be prepared where a `/etc/systemd/system/ncs.service.prepare` file is created. The service is not enabled to start at boot. To enable it, rename it to `/etc/systemd/system/ncs.service` and remove the old `/etc/init.d/ncs` SysV service.

For more information on the `ncs-installer`, see the [ncs-installer(1)](https://developer.cisco.com/docs/nso-api-6.4/ncs-man-pages-volume-1/#ncs-installer) man page.

For an extensive guide to NSO deployment, refer to [Deployment Example](deployment-example.md)_._

</details>

<details>

<summary>Disable Memory Overcommit</summary>

By default, the Linux kernel allows overcommit of memory. However, memory overcommit produces an unexpected and unreliable environment for NSO since the Linux Out Of Memory Killer, or OOM-killer, may terminate NSO without restarting it if the system is critically low on memory. Also, when the OOM-killer terminates NSO, no system dump file will be produced, and the debug information will be lost. Thus, it is strongly recommended that overcommit is disabled.

To achieve this with immediate effect, give the command:

```bash
# echo 2 > /proc/sys/vm/overcommit_memory
```

When `overcommit_memory = 2`, the `/proc/sys/vm/overcommit_ratio` parameter defines the percent of the physical RAM + swap space used. The default is "50", or 50%. This setting will underutilize RAM usage if the system has more physical RAM than 50%.

Setting the `overcommit_ratio` parameter to `100` will include any swap if present. On-disk memory (swap) gives the advantage of having more memory available in case an application needs more RAM than physically available momentarily. But it is usually slow, and thus best practice is to refrain from using the swap for NSO. To allocate physical RAM only, set the `overcommit_ratio` parameter to 100 \* ((RAM - swap space) / RAM).

If the system's physical RAM (MemTotal) is less than or equal to the swap space (SwapTotal), using the swap cannot be avoided and the `overcommit_ratio` should be set to `100`.

{% code title="Example 1: Physical RAM (MemTotal) > Swap Space (SwapTotal)" %}
```bash
# cat /proc/meminfo | grep "MemTotal\|SwapTotal"
MemTotal:    8039352 kB
SwapTotal:   1048572 kB
```
{% endcode %}

Calculate the overcommit ratio:

```
100 * ((8039352-1048572)/8039352) = ~86.9%
```

To set both overcommit parameters with immediate effect:

```bash
# echo 2 > /proc/sys/vm/overcommit_memory
# echo 86.9 > /proc/sys/vm/overcommit_ratio
```

{% code title="Example 2: Physical RAM (MemTotal) == Swap Space (SwapTotal)" %}
```bash
# cat /proc/meminfo | grep "MemTotal\|SwapTotal"
MemTotal:    16000000 kB
SwapTotal:   16000000 kB
```
{% endcode %}

To set both overcommit parameters with immediate effect:

```bash
# echo 2 > /proc/sys/vm/overcommit_memory
# echo 100 > /proc/sys/vm/overcommit_ratio
```

To ensure the overcommit remains disabled after reboot, adjust the `overcommit_ratio` parameter to match your system memory and add the two lines to the `/etc/sysctl.conf` file. See the Linux [sysctl.conf(5)](https://man7.org/linux/man-pages/man5/sysctl.conf.5.html) manual page for details.

Refer to the Linux [proc(5)](https://man7.org/linux/man-pages/man5/proc.5.html) manual page for more details on the `overcommit_memory` and `overcommit_ratio` parameters.

If NSO aborts due to failure to allocate memory, NSO will produce a system dump by default before aborting. When starting NSO from a non-root user, set the `NCS_DUMP` environment variable to point to a filename in a directory that the non-root user can access. The default setting is `NCS_DUMP=ncs_crash.dump`, where the file is written to the NSO run-time directory, typically `NCS_RUN_DIR=/var/opt/ncs`. If the user running NSO cannot write to the directory the `NCS_DUMP` environment variable points to, generating the system dump file will fail, and the debug information will be lost.

</details>

{% hint style="info" %}
Some older NSO releases expect the `/etc/init.d/` folder to exist in the host operating system. If the folder does not exist, the installer may fail to successfully install NSO. A workaround that allows the installer to proceed is to create the folder manually, but the NSO process will not automatically start at boot.
{% endhint %}

### Step 5 - Set Up User Access <a href="#si.setup.user.access" id="si.setup.user.access"></a>

The installation is configured for PAM authentication, with group assignment based on the OS group database (e.g. `/etc/group` file). Users that need access to NSO must belong to either the `ncsadmin` group (for unlimited access rights) or the `ncsoper` group (for minimal access rights).

To set up user access:

1.  To create the `ncsadmin` group, use the OS shell command:

    ```bash
    # groupadd ncsadmin
    ```
2.  To create the `ncsoper` group, use the OS shell command:

    ```bash
    # groupadd ncsoper
    ```
3.  To add an existing user to one of these groups, use the OS shell command:

    ```bash
    # usermod -a -G 'groupname' 'username'
    ```

### Step 6 - Set Environment Variables <a href="#si.set.env.variables" id="si.set.env.variables"></a>

To set environment variables:

1.  Change to Super User privileges.

    ```bash
    $ sudo -s
    ```
2.  The installation program creates a shell script file in each NSO installation which sets the environment variables needed to run NSO. With the `--system-install` option, by default, these settings are set on the shell. To explicitly set the variables, source `ncs.sh` or `ncs.csh` depending on your shell type.

    ```bash
    # source /etc/profile.d/ncs.sh
    ```
3.  Start NSO.

    ```bash
    # systemctl daemon-reload
    # systemctl start ncs
    ```

    NSO starts at boot going forward.

    Once you log on with the user that belongs to `ncsadmin` or `ncsoper`, you can directly access the CLI as shown below:

    ```bash
    $ ncs_cli -C
    ```

### Step 7 - Runtime Directory Creation <a href="#si.runtime.directory.creation" id="si.runtime.directory.creation"></a>

As part of the System Install, the NSO daemon `ncs` is automatically started at boot time. You do not need to create a Runtime Directory for System Install.

### Step 8 - Generate License Registration Token <a href="#si.generate.license.token" id="si.generate.license.token"></a>

To conclude the NSO installation, a license registration token must be created using a (CSSM) account. This is because NSO uses [Cisco Smart Licensing](../management/system-management/cisco-smart-licensing.md) to make it easy to deploy and manage NSO license entitlements. Login credentials to the [Cisco Smart Software Manager](https://www.cisco.com/c/en/us/buy/smart-accounts/software-manager.html) (CSSM) account are provided by your Cisco contact and detailed instructions on how to [create a registration token](../management/system-management/cisco-smart-licensing.md#d5e2927) can be found in the Cisco Smart Licensing. General licensing information covering licensing models, how licensing works, usage compliance, etc., is covered in the [Cisco Software Licensing Guide](https://www.cisco.com/c/en/us/buy/licensing/licensing-guide.html).

To generate a license registration token:

1.  When you have a token, start a Cisco CLI towards NSO and enter the token, for example:

    ```cli
    $ ncs_cli -Cu admin
    admin@ncs# license smart register idtoken
    YzIzMDM3MTgtZTRkNC00YjkxLTk2ODQtOGEzMTM3OTg5MG

    Registration process in progress.
    Use the 'show license status' command to check the progress and result.
    ```

    \
    Upon successful registration, NSO automatically requests a license entitlement for its own instance and for the number of devices it orchestrates and their NED types. If development mode has been enabled, only development entitlement for the NSO instance itself is requested.
2.  Inspect the requested entitlements using the command `show license all` (or by inspecting the NSO daemon log). An example output is shown below.

    ```cli
    admin@ncs# show license all
    ...
    <INFO> 21-Apr-2016::11:29:18.022 miosaterm confd[8226]:
    Smart Licensing Global Notification:
    type = "notifyRegisterSuccess",
    agentID = "sa1",
    enforceMode = "notApplicable",
    allowRestricted = false,
    failReasonCode = "success",
    failMessage = "Successful."
    <INFO> 21-Apr-2016::11:29:23.029 miosaterm confd[8226]:
    Smart Licensing Entitlement Notification: type = "notifyEnforcementMode",
    agentID = "sa1",
    notificationTime = "Apr 21 11:29:20 2016",
    version = "1.0",
    displayName = "regid.2015-10.com.cisco.NSO-network-element",
    requestedDate = "Apr 21 11:26:19 2016",
    tag = "regid.2015-10.com.cisco.NSO-network-element",
    enforceMode = "inCompliance",
    daysLeft = 90,
    expiryDate = "Jul 20 11:26:19 2016",
    requestedCount = 8
    ...
    ```

<details>

<summary>Evaluation Period</summary>

If no registration token is provided, NSO enters a 90-day evaluation period and the remaining evaluation time is recorded hourly in the NSO daemon log:

```
      ...
<INFO> 13-Apr-2016::13:22:29.178 miosaterm confd[16260]:
Starting the NCS Smart Licensing Java VM
<INFO> 13-Apr-2016::13:22:34.737 miosaterm confd[16260]:
Smart Licensing evaluation time remaining: 90d 0h 0m 0s
...
<INFO> 13-Apr-2016::13:22:34.737 miosaterm confd[16260]:
Smart Licensing evaluation time remaining: 89d 23h 0m 0s
...
```

</details>

<details>

<summary>Communication Send Error</summary>

During upgrades, If you experience a 'Communication Send Error' during license registration, restart the Smart Agent.

</details>

<details>

<summary>If You are Unable to Access Cisco Smart Software Manager</summary>

In a situation where the NSO instance has no direct access to the Cisco Smart Software Manager, one option is the [Cisco Smart Software Manager Satellite](https://software.cisco.com/software/csws/ws/platform/home) which can be installed to manage software licenses on the premises. Install the satellite and use the command `call-home destination address http <url:port>` to point to the satellite.

Another option when direct access is not desired is to configure an HTTP or HTTPS proxy, e.g., `smart-license smart-agent proxy url https://127.0.0.1:8080`. If you plan to do this, take the note below regarding ignored CLI configurations into account:

If `ncs.conf` contains configuration for any of java-executable, java-options, override-url/url or proxy/url under the configure path `/ncs-config/smart-license/smart-agent/`, then any corresponding configuration done via the CLI is ignored.

</details>

<details>

<summary>License Registration in HA Mode</summary>

When configuring NSO in High Availability (HA) mode, the license registration token must be provided to the CLI running on the primary node. Read more about HA and node types in [High Availability](../management/high-availability.md)_._

</details>

<details>

<summary>Licensing Log</summary>

Licensing activities are also logged in the NSO daemon log as described in [Monitoring NSO](../management/system-management/#d5e7876). For example, a successful token registration results in the following log entry:

```
<INFO> 21-Apr-2016::11:29:18.022 miosaterm confd[8226]:
Smart Licensing Global Notification:
type = "notifyRegisterSuccess"
```

</details>

<details>

<summary>Check Registration Status</summary>

To check the registration status, use the command `show license status`.

```cli
admin@ncs# show license status

Smart Licensing is ENABLED

Registration:
Status: REGISTERED
Smart Account: Network Services Orchestrator
Virtual Account: Default
Export-Controlled Functionality: Allowed
Initial Registration: SUCCEEDED on Apr 21 09:29:11 2016 UTC
Last Renewal Attempt: SUCCEEDED on Apr 21 09:29:16 2016 UTC
Next Renewal Attempt: Oct 18 09:29:16 2016 UTC
Registration Expires: Apr 21 09:26:13 2017 UTC
Export-Controlled Functionality: Allowed

License Authorization:

License Authorization:
Status: IN COMPLIANCE on Apr 21 09:29:18 2016 UTC
Last Communication Attempt: SUCCEEDED on Apr 21 09:26:30 2016 UTC
Next Communication Attempt: Apr 21 21:29:32 2016 UTC
Communication Deadline: Apr 21 09:26:13 2017 UTC
```

</details>

## System Install FAQs

Frequently Asked Questions (FAQs) about System Install.

<details>

<summary>Is there a dependency between the NSO Installation Directory and Runtime Directory?</summary>

No, there is no such dependency.

</details>

<details>

<summary>Do you need to source the <code>ncsrc</code> file before starting NSO?</summary>

No. By default, the environment variables are configured and set on the shell with System Install.

</details>

<details>

<summary>Can you start NSO from a directory, which is not a NSO runtime directory?</summary>

Yes.

</details>

<details>

<summary>Can you stop NSO from a directory, which is not a NSO runtime directory?</summary>

Yes.

</details>

<details>

<summary>For evaluation and development purposes, instead of a Local Install, you performed a System Install. Now you cannot build or run NSO examples as described in README files. How can you proceed further?</summary>

The easiest way is to Uninstall the System install using `ncs-uninstall --all` and do a Local Install from scratch.

</details>

<details>

<summary>Can we move NSO Installation from one folder to another ?</summary>

No.

</details>
