---
description: >-
  Install NSO for non-production use, such as for development and training
  purposes.
---

# Local Install

## Installation Steps

Complete the following activities in the given order to perform a Local Install of NSO.

<table data-view="cards" data-full-width="false"><thead><tr><th></th><th></th><th></th></tr></thead><tbody><tr><td><strong>Prepare</strong></td><td><a href="local-install.md#step-1-fulfill-system-requirements">1. Fulfill System Requirements</a><br><a href="local-install.md#li.download.the.installer">2. Download Installer/NEDs</a><br><a href="local-install.md#li.unpack.the.installer">3. Unpack the Installer</a></td><td></td></tr><tr><td><strong>Install</strong></td><td><a href="local-install.md#li.run.the.installer">4. Run the Installer</a></td><td></td></tr><tr><td><strong>Finalize</strong></td><td><a href="local-install.md#li.set.env.variables">5. Set Environment Variables</a><br><a href="local-install.md#li.create.runtime.directory">6. Runtime Directory Creation</a><br><a href="local-install.md#li.generate.license.token">7. Generate License Token</a></td><td></td></tr></tbody></table>

{% hint style="info" %}
**Mode of Install**

NSO Local Install can be installed in **standard mode** or in [**FIPS**](https://www.nist.gov/itl/publications-0/federal-information-processing-standards-fips)**-compliant mode**. Standard mode install supports a broader set of cryptographic algorithms, while the FIPS mode install restricts NSO to use only FIPS 140-3-validated cryptographic modules and algorithms for enhanced/regulated security and compliance. Use FIPS mode only in environments that require compliance with specific security standards, especially in U.S. federal agencies or regulated industries. For all other use cases, install NSO in standard mode.

<sup>\* FIPS: Federal Information Processing Standards</sup>
{% endhint %}

### Step 1 - Fulfill System Requirements

Start by setting up your system to install and run NSO.

To install NSO:

1. Fulfill at least the primary requirements.
2. If you intend to build and run NSO examples, you also need to install additional applications listed under Additional Requirements.

{% hint style="warning" %}
Where requirements list a specific or higher version, there always exists a (small) possibility that a higher version introduces breaking changes. If in doubt whether the higher version is fully backwards compatible, always use the specific version.
{% endhint %}

<details>

<summary>Primary Requirements</summary>

Primary requirements to do a Local Install include:

* A system running Linux or macOS on either the `x86_64` or `ARM64` architecture for development. For [FIPS](https://www.nist.gov/itl/publications-0/federal-information-processing-standards-fips) mode, OS FIPS compliance may be required depending on your specific requirements.
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

Additional requirements to, for example, build and run NSO examples/services include:

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
* OpenSSH client applications. For example, the `ssh` and `scp` commands.

</details>

<details>

<summary>FIPS Mode Entropy Requirements</summary>

The following applies if you are running a container-based setup of your FIPS install:

In containerized environments (e.g., Docker) that run on older Linux kernels (e.g., Ubuntu 18.04), `/dev/random` may block if the system’s entropy pool is low. This can lead to delays or hangs in FIPS mode, as cryptographic operations require high-quality randomness.

To avoid this:

* Prefer newer kernels (e.g., Ubuntu 22.04 or later), where entropy handling is improved to mitigate the issue.
* Or, install an entropy daemon like Haveged on the Docker host to help maintain sufficient entropy.

Check available entropy on the host system with:

```bash
cat /proc/sys/kernel/random/entropy_avail
```

A value of 256 or higher is generally considered safe. Reference: [Oracle blog post](https://blogs.oracle.com/linux/post/entropyavail-256-is-good-enough-for-everyone).

</details>

### Step 2 - Download the Installer and NEDs <a href="#li.download.the.installer" id="li.download.the.installer"></a>

To download the Cisco NSO installer and example NEDs:

1. Go to the Cisco's official [Software Download](https://software.cisco.com/download/home) site.
2. Search for the product "Network Services Orchestrator" and select the desired version.
3. There are two versions of the NSO installer, i.e. for macOS and Linux systems. Download the desired installer.

<details>

<summary>Identifying the Installer</summary>

You need to know your system specifications (Operating System and CPU architecture) in order to choose the appropriate NSO installer.

NSO is delivered as an OS/CPU-specific signed self-extractable archive. The signed archive file has the pattern `nso-VERSION.OS.ARCH.signed.bin` that after signature verification extracts the `nso-VERSION.OS.ARCH.installer.bin` archive file, where:

* `VERSION` is the NSO version to install.
* `OS` is the Operating System (`linux` for all Linux distributions and `darwin` for macOS).
* `ARCH` is the CPU architecture, for example`x86_64`.

</details>

### Step 3 - Unpack the Installer <a href="#li.unpack.the.installer" id="li.unpack.the.installer"></a>

If your downloaded file is a `signed.bin` file, it means that it has been digitally signed by Cisco, and upon execution, you will verify the signature and unpack the `installer.bin`.

If you only have `installer.bin`, skip to the next step.

To unpack the installer:

1.  In the terminal, list the binaries in the directory where you downloaded the installer, for example:

    ```bash
    cd ~/Downloads
    ls -l nso*.bin
    -rw-r--r--@ 1 user  staff   199M Dec 15 11:45 nso-6.0.darwin.x86_64.installer.bin
    -rw-r--r--@ 1 user  staff   199M Dec 15 11:45 nso-6.0.darwin.x86_64.signed.bin
    ```
2.  Use the `sh` command to run the `signed.bin` to verify the certificate and extract the installer binary and other files. An example output is shown below.

    ```bash
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
3.  List the files to check if extraction was successful.

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

- Phased Provisioning
- Resource Manager

For platform tools documentation, refer to the individual package's `README` file or to the [online documentation](https://nso-docs.cisco.com/resources).

**NED packages**

The NED packages that are available with the NSO installation are NetSim-based example NEDs. These NEDs are used for NSO examples only.

Fetch the latest production-grade NEDs from [Cisco Software Download](https://software.cisco.com/download/home) using the URLs provided on your NED license certificates.

**Manual pages**

The installation program unpacks the NSO manual pages from the documentation archive in `$NCS_DIR/man`. `ncsrc` makes an addition to `$MANPATH`, allowing you to use the `man` command to view them. The manual pages are available in PDF format and from the online documentation located on [NCS man-pages, Volume 1](../../resources/man/README.md) in Manual Pages.

Following is a list of a few of the installed manual pages:

* `ncs(1)`: Command to start and control the NSO daemon.
* `ncsc(1)`: NSO Yang compiler.
* `ncs_cli(1)`: Frontend to the NSO CLI engine.
* `ncs-netsim(1)`: Command to create and manipulate a simulated network.
* `ncs-setup(1)`: Command to create an initial NSO setup.
* `ncs.conf`: NSO daemon configuration file format.

For example, to view the manual page describing the NSO configuration file, you should type:

```bash
$ man ncs.conf
```

Apart from the manual pages, extensive information about command-line options can be obtained by running `ncs` and `ncsc` with the `--help` (abbreviated `-h`) flag.

```bash
$ ncs --help
```

```bash
$ ncsc --help
```

**Installer help**

Run the `sh nso-VERSION.darwin.x86_64.installer.bin --help` command to view additional help on running binaries. More details can be found in the [ncs-installer(1)](../../resources/man/ncs-installer.1.md) Manual Page included with NSO.

Notice the two options for `--local-install` or `--system-install`. An example output is shown below.

```bash
sh nso-6.0.darwin.x86_64.installer.bin --help

# Output
This is the NCS installation script.
Usage: ./nso-6.0.darwin.x86_64.installer.bin [--local-install] LocalInstallDir
Installs NCS in the LocalInstallDir directory only.
This is convenient for test and development purposes.
Usage: ./nso-6.0.darwin.x86_64.installer.bin --system-install
[--install-dir InstallDir]
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

</details>

### Step 4 - Run the Installer <a href="#li.run.the.installer" id="li.run.the.installer"></a>

Local Install of NSO software is performed in a single user-specified directory, for example in your `$HOME` directory.

{% hint style="success" %}
It is always recommended to install NSO in a directory named as the version of the release, for example, if the version being installed is `6.1`, the directory should be `~/nso-6.1`.
{% endhint %}

To run the installer:

1. Navigate to your Install Directory.
2. Run the command given below to install NSO in your Install Directory. The `--local-install` parameter is optional. At this point, you can choose to install NSO in standard mode or in FIPS mode.

{% tabs %}
{% tab title="Standard Local Install" %}
The standard mode is the regular NSO install and is suitable for most installations. FIPS is disabled in this mode.

For standard NSO install, run the installer as below:

```bash
$ sh nso-VERSION.OS.ARCH.installer.bin $HOME/ncs-VERSION --local-install
```

An example output is shown below:

{% code title="Example: Standard Local Install" %}
```bash
sh nso-6.0.darwin.x86_64.installer.bin --local-install ~/nso-6.0

# Output
INFO  Using temporary directory /var/folders/90/n5sbctr922336_
0jrzhb54400000gn/T//ncs_installer.93831 to stage NCS installation bundle
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
{% endtab %}

{% tab title="FIPS Local Install" %}

FIPS mode restricts cryptographic operations to those provided by the CiscoSSL FIPS 140-3 validated module. **This mode should only be enabled for deployments subject to strict regulatory compliance requirements**, as it limits the available cryptographic functions to those certified under FIPS 140-3 standards.

**Installation Procedure**

To perform a FIPS-compliant NSO installation, execute the installer with the `--fips-install` flag:

```bash
$ sh nso-VERSION.OS.ARCH.installer.bin $HOME/ncs-VERSION --local-install --fips-install
```

**NSO Configuration for FIPS**

During FIPS installation, the following configurations are automatically applied:

1. **FIPS Mode Enablement**\
   The `ncs.conf` file is configured with the FIPS mode flag:
   ```xml
   <fips-mode>
       <enabled>true</enabled>
   </fips-mode>
   ```

2. **Environment Variables**\
   The `ncsrc` file is updated with FIPS-compliant environment variables:
   - `NCS_OPENSSL_CONF_INCLUDE`
   - `NCS_OPENSSL_CONF`
   - `NCS_OPENSSL_MODULES`

3. **Cryptographic Library**\
   The default `crypto.so` library is replaced with the FIPS-compliant version during installation.

**Cryptographic Algorithm Restrictions**

The CiscoSSL FIPS 140-3 validated module supports a limited subset of cryptographic algorithms compared to standard CiscoSSL. **You must configure NSO to use only FIPS-approved algorithms and cryptographic suites.**

Key configuration requirements include:
- Configuring approved algorithms in `/ncs-config/ssh/algorithm/kex` within `ncs.conf`
- Configuring device-specific algorithms in `/devices/device/ssh-algorithms/kex` within CDB

{% hint style="info" %}
The Ed25519 algorithm is **not FIPS 140-3 compliant** and must not be used in FIPS mode.
{% endhint %}

**FIPS-Approved Key Exchange Algorithms**

The following key exchange algorithms are FIPS-approved:
- `ecdh-sha2-nistp256`
- `ecdh-sha2-nistp384`
- `ecdh-sha2-nistp521`
- `diffie-hellman-group14-sha1`
- `diffie-hellman-group-exchange-sha256`

{% hint style="info" %}
Ensure that SSH keys of the correct type are configured in both `ncs.conf` and `init.xml` files.
{% endhint %}

**NED Package Compatibility**

NSO signals Network Element Drivers (NEDs) to operate in FIPS mode using Bouncy Castle FIPS libraries for Java-based components. **NED packages may require upgrading to support FIPS mode**, as older versions—particularly SSH-based NEDs—often lack:
- FIPS mode signaling capability
- Bouncy Castle FIPS library support
- Required cryptographic compliance features

Consult the NED documentation and verify compatibility before deploying in FIPS mode.

{% endtab %}
{% endtabs %}

### Step 5 - Set Environment Variables <a href="#li.set.env.variables" id="li.set.env.variables"></a>

The installation program creates a shell script file named `ncsrc` in each NSO installation, which sets the environment variables.

To set the environment variables:

1.  Source the `ncsrc` file to get the environment variables settings in your shell. You may want to add this sourcing command to your login sequence, such as `.bashrc`.

    For `csh/tcsh` users, there is a `ncsrc.tcsh` file with `csh/tcsh` syntax. The example below assumes that you are using `bash`, other versions of `/bin/sh` may require that you use `.` instead of `source`.

    ```bash
    $ source $HOME/ncs-VERSION/ncsrc
    ```
2.  Most users add source `~/nso-x.x/ncsrc` (where `x.x` is the NSO version) to their `~/.bash_profile`, but you can simply do it manually when you want it. Once it has been sourced, you have access to all the NSO executable commands, which start with `ncs`.

    ```bash
      ncs {TAB} {TAB}

      # Output
      ncs         ncs-maapi        ncs-project  ncs-start-python-vm  ncs_cmd
      ncs-backup  ncs-make-package ncs-setup    ncs-uninstall        ncs_conf_tool
      ncs-collect ncs-netsim       ncs-start-java-vm                 ncs_cli

      ncs_load
      ncsc
      ncs_crypto_keys-tech-report
    ```

### Step 6 - Create Runtime Directory <a href="#li.create.runtime.directory" id="li.create.runtime.directory"></a>

NSO needs a deployment/runtime directory where the database files, logs, etc. are stored. An empty default directory can be created using the `ncs-setup` command.

To create a Runtime Directory:

1.  Create a Runtime Directory for NSO by running the following command. In this case, we assume that the directory is `$HOME/ncs-run`.

    ```bash
      $ ncs-setup --dest $HOME/ncs-run
    ```
2.  Start the NSO daemon `ncs`.

    ```bash
    $ cd $HOME/ncs-run
    $ ncs
    ```

<details>

<summary>Runtime vs. Installation Directory</summary>

A common misunderstanding is that there exists a dependency between the Runtime Directory and the Installation Directory. This is not true. For example, say that you have two NSO local installations `path/to/nso-6.4` and `path/to/nso-6.4.1`. The following sequence runs `nso-6.4` but uses an example and configuration from `nso-6.4.1`.

```bash
  $ cd path/to/nso-6.4
  $ . ncsrc
  $ cd path/to/nso-6.4.1/examples.ncs/service-management/datacenter-qinq
  $ ncs
```

Since the Runtime Directory is self-contained, this is also the way to move between examples. And since the Runtime Directory is self-contained including the database files, you can compress a complete directory and distribute it. Unpacking that directory and starting NSO from there gives an exact copy of all instance data.

```bash
  $ cd path/to/nso-6.4.1/examples.ncs/service-management/datacenter-qinq
  $ ncs
  $ ncs --stop
  $ cd path/to/nso-6.4.1/examples.ncs/device-management/simulated-cisco-ios
  $ ncs
  $ ncs --stop
```

</details>

{% hint style="warning" %}
The `ncs-setup` command creates an `ncs.conf` file that uses predefined encryption keys for easier migration of data across installations. It is not suitable for cases where data confidentiality is required, such as a production deployment. See [Cryptographic Keys](../advanced-topics/cryptographic-keys.md) for ways to generate suitable keys.
{% endhint %}

### Step 7 - Generate License Registration Token <a href="#li.generate.license.token" id="li.generate.license.token"></a>

To conclude the NSO installation, a license registration token must be created using a (CSSM) account. This is because NSO uses Cisco Smart Licensing, as described in the [Cisco Smart Licensing](../management/system-management/cisco-smart-licensing.md) to make it easy to deploy and manage NSO license entitlements. Login credentials to the [Cisco Smart Software Manager](https://www.cisco.com/c/en/us/buy/smart-accounts/software-manager.html) (CSSM) account are provided by your Cisco contact and detailed instructions on how to [create a registration token](../management/system-management/cisco-smart-licensing.md#d5e2927) can be found in the Cisco Smart Licensing. General licensing information covering licensing models, how licensing works, usage compliance, etc., is covered in the [Cisco Software Licensing Guide](https://www.cisco.com/c/en/us/buy/licensing/licensing-guide.html).

To generate a license registration token:

1.  When you have a token, start a Cisco CLI towards NSO and enter the token, for example:

    ```bash
    $ ncs_cli -Cu admin
    admin@ncs# license smart register idtoken YzIzMDM3MTgtZTRkNC00YjkxLTk2ODQt
    OGEzMTM3OTg5MG
    Registration process in progress.
    Use the 'show license status' command to check the progress and result.
    ```

    \
    Upon successful registration, NSO automatically requests a license entitlement for its own instance and for the number of devices it orchestrates and their NED types. If development mode has been enabled, only development entitlement for the NSO instance itself is requested.
2.  Inspect the requested entitlements using the command `show license all` (or by inspecting the NSO daemon log). An example output is shown below.

    ```bash
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

If no registration token is provided, NSO enters a 90-day evaluation period, and the remaining evaluation time is recorded hourly in the NSO daemon log:

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

During upgrades, if you experience the 'Communication Send Error' with license registration, restart the Smart Agent.

</details>

<details>

<summary>If You are Unable to Access Cisco Smart Software Manager</summary>

In a situation where the NSO instance has no direct access to the Cisco Smart Software Manager, one option is the [Cisco Smart Software Manager Satellite](https://software.cisco.com/software/csws/ws/platform/home) which can be installed to manage software licenses on the premises. Install the satellite and use the command `call-home destination address http <url:port>` to point to the satellite.

Another option when direct access is not desired is to configure an HTTP or HTTPS proxy, e.g., `smart-license smart-agent proxy url https://127.0.0.1:8080`. If you plan to do this, take the note below regarding ignored CLI configurations into account:

If `ncs.conf` contains a configuration for any of the java-executable, java-options, override-url/url, or proxy/url under the configure path `/ncs-config/smart-license/smart-agent/`, then any corresponding configuration done via the CLI is ignored.

</details>

<details>

<summary>License Registration in High Availability (HA) Mode</summary>

When configuring NSO in HA mode, the license registration token must be provided to the CLI running on the primary node. Read more about HA and node types in NSO [High Availability](../management/high-availability.md).

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

To check the registration status, use the command `show license status` An example output is shown below.

```bash
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

## Local Install FAQs

Frequently Asked Questions (FAQs) about Local Install.

<details>

<summary>Is there a dependency between the NSO Installation Directory and Runtime Directory?</summary>

No, there is no such dependency.

</details>

<details>

<summary>Do you need to source the <code>ncsrc</code> file before starting NSO?</summary>

Yes.

</details>

<details>

<summary>Can you start NSO from a directory that is not an NSO runtime directory?</summary>

No. To start NSO, you need to point to the run directory.

</details>

<details>

<summary>Can you stop NSO from a directory that is not an NSO runtime directory?</summary>

Yes.

</details>

<details>

<summary>Can we move NSO Installation from one folder to another?</summary>

Yes. You can move the directory where you installed NSO to a new location in your directory tree. Simply move NSO's root directory to the new desired location and update this file: `$NCS_DIR/ncsrc` (and `ncsrc.tcsh` if you want). This is a small and handy script that sets up some environment variables for you. Update the paths to the new location. The `$NCS_DIR/bin/ncs` and `$NCS_DIR/bin/ncsc` scripts will determine the location of NSO's root directory automatically.

</details>

***

**Next Steps**

{% content-ref url="post-install-actions/explore-the-installation.md" %}
[explore-the-installation.md](post-install-actions/explore-the-installation.md)
{% endcontent-ref %}
