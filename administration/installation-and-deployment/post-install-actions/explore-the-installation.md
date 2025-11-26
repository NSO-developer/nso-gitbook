---
description: Explore NSO contents after finishing the installation.
---

# Explore the Installation

{% hint style="warning" %}
Applies to Local Install.
{% endhint %}

Before starting NSO, it is recommended to explore the installation contents.

Navigate to the newly created Installation Directory, for example:

```bash
cd ~/nso-6.0
```

## Contents of the Installation Directory

The installation directory includes the following contents:

* [Documentation](explore-the-installation.md#d5e552)
* [Examples](explore-the-installation.md#d5e560)
* [Network Element Drivers](explore-the-installation.md#d5e564)
* [Shell scripts](explore-the-installation.md#d5e604)

### Documentation <a href="#d5e552" id="d5e552"></a>

Along with the binaries, NSO installs a full set of documentation available in the  `doc/` folder in the Installation Directory. There is also an online version of the documentation available on [DevNet](https://developer.cisco.com/docs/nso-guides-6.1/).

```bash
ls -l doc/
drwxr-xr-x   5 user  staff   160B Nov 29 05:19 api/
drwxr-xr-x  14 user  staff   448B Nov 29 05:19 html/
-rw-r--r--   1 user  staff   202B Nov 29 05:19 index.html
drwxr-xr-x  17 user  staff   544B Nov 29 05:19 pdf/
```

Run `index.html` in your browser to explore further.

### Examples <a href="#d5e560" id="d5e560"></a>

Local Install comes with a rich set of examples to start using NSO.

```bash
$ ls -1 examples.ncs/
README
crypto
datacenter
development-guide
generic-ned
getting-started
misc
service-provider
snmp-ned
snmp-notification-receiver
web-server-farm
web-ui
```

### Network Element Drivers (NEDs) <a href="#d5e564" id="d5e564"></a>

In order to communicate with the network, NSO uses NEDs as device drivers for different device types. Cisco has NEDs for hundreds of different devices available for customers, and several are included in the installer in the `/packages/neds` directory.

In the example below, NEDs for Cisco ASA, IOS, IOS XR, and NX-OS are shown. Also included are NEDs for other vendors including Juniper JunOS, A10, ALU, and Dell.

```bash
$ ls -1 packages/neds
a10-acos-cli-3.0
alu-sr-cli-3.4
cisco-asa-cli-6.6
cisco-ios-cli-3.0
cisco-ios-cli-3.8
cisco-iosxr-cli-3.0
cisco-iosxr-cli-3.5
cisco-nx-cli-3.0
dell-ftos-cli-3.0
juniper-junos-nc-3.0
```

{% hint style="info" %}
The example NEDs included in the installer are intended for evaluation, demonstration, and use with the `examples.ncs`. These are not the latest versions available and often do not have all the features available in production NEDs.
{% endhint %}

#### **Install New NEDs**

A large number of pre-built supported NEDs are available which can be acquired and downloaded by the customers from [Cisco Software Download](https://software.cisco.com/). Note that the specific file names and versions that you download may be different from the ones in this guide. Therefore, remember to update the paths accordingly.

Like the NSO installer, the NEDs are `signed.bin` files that need to be run to validate the download and extract the new code.

To install new NEDs:

1.  Change to the working directory where your downloads are. The filenames indicate which version of NSO the NEDs are pre-compiled for (in this case NSO 6.0), and the version of the NED. An example output is shown below.

    ```bash
    cd ~/Downloads/
    ls -l ncs*.bin

    # Output
    -rw-r--r--@ 1 user  staff   9708091 Dec 18 12:05 ncs-6.0-cisco-asa-6.7.7.signed.bin
    -rw-r--r--@ 1 user  staff  51233042 Dec 18 12:06 ncs-6.0-cisco-ios-6.42.1.signed.bin
    -rw-r--r--@ 1 user  staff   8400190 Dec 18 12:05 ncs-6.0-cisco-nx-5.13.1.1.signed.bin
    ```
2.  Use the `sh` command to run `signed.bin` to verify the certificate and extract the NED tar.gz and other files. Repeat for all files. An example output is shown below.

    ```bash
    sh ncs-6.0-cisco-nx-5.13.1.1.signed.bin 
     
      Unpacking...  
      Verifying signature...
      Downloading CA certificate from http://www.cisco.com/security/pki/certs/crcam2.cer ...
      Successfully downloaded and verified crcam2.cer.
      Downloading SubCA certificate from http://www.cisco.com/security/pki/certs/innerspace.cer ...
      Successfully downloaded and verified innerspace.cer.
      Successfully verified root, subca and end-entity certificate chain.
      Successfully fetched a public key from tailf.cer.
      Successfully verified the signature of ncs-6.0-cisco-nx-5.13.1.1.tar.gz using tailf.cer
    ```
3.  You now have three tar (.`tar.gz`) files. These are compressed versions of the NEDs. List the files to verify as shown in the example below.

    ```bash
    ls -l ncs*.tar.gz
    -rw-r--r--  1 user  staff   9704896 Dec 12 21:11 ncs-6.0-cisco-asa-6.7.7.tar.gz
    -rw-r--r--  1 user  staff  51260488 Dec 13 22:58 ncs-6.0-cisco-ios-6.42.1.tar.gz
    -rw-r--r--  1 user  staff   8409288 Dec 18 09:09 ncs-6.0-cisco-nx-5.13.1.1.tar.gz
    ```
4.  Navigate to the `packages/neds` directory for your Local Install, for example:

    ```bash
    cd ~/nso-6.0/packages/neds
    ```
5.  In the `/packages/neds` directory, extract the .tar files into this directory using the `tar` command with the path to where the compressed NED is located. An example is shown below.

    ```
    tar -zxvf ~/Downloads/ncs-6.0-cisco-nx-5.13.1.1.tar.gz
    tar -zxvf ~/Downloads/ncs-6.0-cisco-ios-6.42.1.tar.gz
    tar -zxvf ~/Downloads/ncs-6.0-cisco-asa-6.7.7.tar.gz
    ```

    \
    Here is a sample list of the newer NEDs extracted along with the ones bundled with the installation:

    ```
    drwxr-xr-x  13 user  staff   416 Nov 29 05:17 a10-acos-cli-3.0
    drwxr-xr-x  12 user  staff   384 Nov 29 05:17 alu-sr-cli-3.4
    drwxr-xr-x  13 user  staff   416 Nov 29 05:17 cisco-asa-cli-6.6
    drwxr-xr-x  13 user  staff   416 Dec 12 21:11 cisco-asa-cli-6.7
    drwxr-xr-x  12 user  staff   384 Nov 29 05:17 cisco-ios-cli-3.0
    drwxr-xr-x  12 user  staff   384 Nov 29 05:17 cisco-ios-cli-3.8
    drwxr-xr-x  13 user  staff   416 Dec 13 22:58 cisco-ios-cli-6.42
    drwxr-xr-x  13 user  staff   416 Nov 29 05:17 cisco-iosxr-cli-3.0
    drwxr-xr-x  13 user  staff   416 Nov 29 05:17 cisco-iosxr-cli-3.5
    drwxr-xr-x  13 user  staff   416 Nov 29 05:17 cisco-nx-cli-3.0
    drwxr-xr-x  14 user  staff   448 Dec 18 09:09 cisco-nx-cli-5.13
    drwxr-xr-x  13 user  staff   416 Nov 29 05:17 dell-ftos-cli-3.0
    drwxr-xr-x  10 user  staff   320 Nov 29 05:17 juniper-junos-nc-3.0
    ```

### Shell Scripts <a href="#d5e604" id="d5e604"></a>

The last thing to note is the files `ncsrc` and `ncsrc.tsch`. These are shell scripts for `bash` and `tsch` that set up your PATH and other environment variables for NSO. Depending on your shell, you need to source this file before starting NSO.

For more information on sourcing shell script, see the [Local Install steps](../local-install.md).
