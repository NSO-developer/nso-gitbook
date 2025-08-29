# Table of contents
-------------------

  ```
  1. General
     1.1 Extract the NED package
     1.2 Install the NED package
         1.2.1 Local install
         1.2.2 System install
     1.3 Configure the NED in NSO
  2. Optional debug and trace setup
  3. Dependencies
  4. Sample device configuration
  5. Built in RPC actions
     5.1. rpc clean-package
     5.2. rpc export-package
     5.3. rpc get-modules
     5.4. rpc list-modules
     5.5. rpc list-profiles
     5.6. rpc rebuild-package
     5.7. rpc show-default-local-dir
     5.8. rpc show-loaded-schema
     5.7.1 any
     5.7.2 gNOI
  6. Built in live-status show
  7. Limitations
  8. How to report NED issues and feature requests
  9. How to rebuild a NED
  10. Using the NED feature load-native-config
  ```


# 1. General
------------

  This document describes the nokia-srlinux_gnmi NED.

  This NED can be used together with Nokia SRLinux devices with gNMI support enabled.

  It has been successfully tested with the following devices:
    - Nokia SRLinux release v24.3.3
    - Nokia SRLinux release v23.10.1
    - Nokia SRLinux release v23.3.2

  IMPORTANT:
  This NED is delivered without any of the device YANG models bundled to the NED package.

  It is required to download the YANG files separately and rebuild the NED package before the NED is
  fully operational. See the README-rebuild.md for further information.

  The recommended way to do this is by following the steps below:

   1. Install and setup the NED. See chapter 1.1 to 1.3
   2. Download the YANG models. See chapter 1.1 in README-rebuild.md for the recommended method (alternatives are described in
      README-rebuild.md chapter 2 and 3).
   3. Rebuild the NED. See chapter 1.3 in README-rebuild.md (an alternative with a custom NED-ID is described in README-rebuild.md chapter 4).
   4. Reload the NED in NSO. See chapter 1.4 in README-rebuild.md

  Additional README files bundled with this NED package
  ```
  +---------------------------+------------------------------------------------------------------------------+
  | Name                      | Info                                                                         |
  +---------------------------+------------------------------------------------------------------------------+
  | README-ned-settings.md    | Information about all run time settings supported by this NED.               |
  |                           |                                                                              |
  | README-rebuild.md         | Detailed instructions on how to download the device YANG models and          |
  |                           | rebuilding the NED with them.                                                |
  +---------------------------+------------------------------------------------------------------------------+
  ```

  Common NED Features
  ```
  +---------------------------+-----------+------------------------------------------------------------------+
  | Feature                   | Supported | Info                                                             |
  +---------------------------+-----------+------------------------------------------------------------------+
  | netsim                    | no        |                                                                  |
  |                           |           |                                                                  |
  | check-sync                | yes       | Disabled by default. Two alternatives available: 1. trans-id by  |
  |                           |           | checking latest commit id on device, 2. trans-id by doing a hash |
  |                           |           | of the device config. See README-ned-settings.md                 |
  |                           |           |                                                                  |
  | partial-sync-from         | yes       |                                                                  |
  |                           |           |                                                                  |
  | live-status actions       | no        |                                                                  |
  |                           |           |                                                                  |
  | live-status show          | yes       |                                                                  |
  |                           |           |                                                                  |
  | load-native-config        | yes       | Config snippet must be formatted as a gNMI SET request. See      |
  |                           |           | chapter 9 for further info.                                      |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Nokia SRLinux VM          | v24.10.3        | SRLin  |                                                   |
  |                           |                 |        |                                                   |
  | Nokia SRLinux VM          | v24.3.3         | SRLin  |                                                   |
  |                           |                 |        |                                                   |
  | Nokia SRLinux VM          | v23.10.1        | SRLin  |                                                   |
  |                           |                 |        |                                                   |
  | Nokia SRLinux VM          | v23.3.2         | SRLin  |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```

  Verified YANG model bundles
  ```
  +---------------------------+-----------------+------------------------------------------------------------+
  | Bundle                    | Version         | Info                                                       |
  +---------------------------+-----------------+------------------------------------------------------------+
  | Nokia SRLinux             | 24.3.3          |                                                            |
  |                           |                 |                                                            |
  | Nokia SRLinux             | 24.10.3         |                                                            |
  |                           |                 |                                                            |
  | Nokia SRLinux             | 23.10.1         |                                                            |
  |                           |                 |                                                            |
  | Nokia SRLinux             | 23.3.2          |                                                            |
  +---------------------------+-----------------+------------------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-nokia-srlinux_gnmi-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-nokia-srlinux_gnmi-1.0.1.signed.bin
      > ./ncs-6.0-nokia-srlinux_gnmi-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-nokia-srlinux_gnmi-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-nokia-srlinux_gnmi-1.0.1.tar.gz
      ```


## 1.2 Install the NED package
------------------------------

  There are two alternative ways to install this NED package.
  Which one to use depends on how NSO itself is setup.

  In the instructions below the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED download directory: /tmp/ned-package-store
  - NSO run time directory: ~/nso-lab-rundir

  A prerequisite is to set the environment variable NSO_RUNDIR to point at the NSO run time directory:

  ```
  > export NSO_RUNDIR=~/nso-lab-rundir
  ```

  **IMPORTANT**:

  This NED is delivered as an “empty” package, i.e without any device YANG models bundled.
  It must be rebuilt with the device YANG models to become operational.

  The procedure to rebuild the empty NED (described in the README-rebuild.md) shall typically
  be done in a lab environment. For this step a “local install” of the NED shall be used.
  It is not suitable to use “system install” here since it is intended for production systems only.

  Once this NED has been rebuilt with the device YANG and exported to one or many
  separate tar.gz customized NED packages, a “system installation” can be used on them.


### 1.2.1 Local install
-----------------------

  This section describes how to install a NED package on a locally installed NSO
  (see "NSO Local Install" in the NSO Installation guide).

  It is assumed the NED package has been been unpacked to a tar.gz file as described in 1.1.

  1. Untar the tar.gz file. This creates a new sub-directory named:
     `nokia-srlinux_gnmi-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-nokia-srlinux_gnmi-1.0.1.tar.gz
     > ls -d */
     nokia-srlinux_gnmi-gen-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package nokia-srlinux_gnmi-gen-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package nokia-srlinux_gnmi-gen-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-nokia-srlinux_gnmi-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package nokia-srlinux_gnmi-gen-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/nokia-srlinux_gnmi-gen-1.0
  ```


### 1.2.2 System install
------------------------

  This section describes how to install a NED package on a system installed NSO (see "NSO System
  Install" in the NSO Installation Guide).

  It is assumed the NED package has been been unpacked to a tar.gz file as described in 1.1.

  1. Do a NSO backup before installing the new NED package:

     ```
     > $NCS_DIR/bin/ncs-backup
     ```

  2. Start a NSO CLI session and fetch the NED package:

     ```
     > ncs_cli -C -u admin
     admin@ncs# software packages fetch package-from-file \
               /tmp/ned-package-store/ncs-6.0-nokia-srlinux_gnmi-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-nokia-srlinux_gnmi-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install nokia-srlinux_gnmi-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-nokia-srlinux_gnmi-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-nokia-srlinux_gnmi-gen-1.0
       loaded
     }
     ```


## 1.3 Configure the NED in NSO
-------------------------------

  This section describes the steps for configuring a device instance
  using the newly installed NED package.

  - Start a NSO CLI session:

    ```
    > ncs_cli -C -u admin
    ```

  - Enter configuration mode:

    ```
    admin@ncs# configure
    Entering configuration mode terminal
    admin@ncs(config)#
    ```

  - Configure a new authentication group (my-group) to be used for this device:

    ```
    admin@ncs(config)# devices authgroup group my-group default-map remote-name <user name on device> \
                       remote-password <password on device>
    ```

  - Configure a new device instance (example: dev-1):

    ```
    admin@ncs(config)# devices device dev-1 address <ip address to device>
    admin@ncs(config)# devices device dev-1 port <port on device>
    admin@ncs(config)# devices device dev-1 device-type generic ned-id nokia-srlinux_gnmi-gen-1.0
    admin@ncs(config)# devices device dev-1 state admin-state unlocked
    admin@ncs(config)# devices device dev-1 authgroup my-group
    ```
    **IMPORTANT**:

    The *device-type* shall always be set to *generic* when configuring a device instance
    to use a 3PY NED. A common mistake is configuring it as *netconf*, which will cause
    NSO to use its internal netconf client instead.


  ####   Additional configurations

  ##### TLS

  Set up TLS configurables if needed. The Nokia SRLinux devices typically has at least server certificate authentication enabled by default.

  -  Enable TLS

  ```
  # devices device dev-1 ned-settings nokia-srlinux_gnmi connection tls enable true
  ```

  -  Configure Server TLS authentication


   <u>Alternative 1:</u>
   Accept any SSL certificate presented by the device. This is unsafe and should only be used for testing purposes.

  ```
  # devices device dev-1 ned-settings nokia-srlinux_gnmi connection tls accept-any true
  ```

   <u>Alternative 2:</u>
   Configure a specific trust manager certificate for the device. Specify the path to the certificate file used by the device.

  ```
  # devices device dev-1 ned-settings nokia-srlinux_gnmi connection tls certificate <enter>
  ```

   Enter the multi line content of a PEM formatted CA/server certificate. Including the *-----BEGIN CERTIFICATE-----* banners etc.

   Finish with a **<ctrl>-<d>**

   Use the Unix tool 'openssl' to fetch the PEM certificate from a device:

    In a Unix shell:
     ```
     > openssl s_client -connect <device address>:<port>
     ```

  ##### Optional TLS settings

  -  Configure TLS certificate authority overrides

      ```
      # devices device dev-1 ned-settings nokia-srlinux_gnmi connection tls override-authority [ <host 1> <host 2> ]
      ```
  -  Configure the NED for mutual TLS

  ```
  # devices device dev-1 ned-settings nokia-srlinux_gnmi connection tls mutual-tls client certificate <enter>
  ```

   Enter the multi line content of a PEM formatted client certificate. Including the *-----BEGIN CERTIFICATE-----* banners etc.
   Finish with a <ctrl>-d>

       # devices device dev-1 ned-settings nokia-srlinux_gnmi connection tls mutual-tls client key <enter>
   Enter the multi line content of a PEM formatted private key. Including the -----BEGIN PRIVATE KEY----- banners etc.
   Finish with a <ctrl>-d>

       # devices device dev-1 ned-settings nokia-srlinux_gnmi connection tls mutual-tls client key-password <value>
  -  Configure TLS ciphers to be used for server/client TLS authentication

  ```
   # devices device dev-1 ned-settings nokia-srlinux_gnmi connection tls ciphers [ <cipher 1> <cipher 2>... ]
  ```

  - Finally commit the configuration

    ```
    admin@ncs(config)# commit
    ```

  - Verify configuration, using a sync-from.

    ```
    admin@ncs(config)# devices device dev-1 sync-from
    result true
    ```

  If the sync-from was not successful, check the NED configuration again.


# 2. Optional debug and trace setup
-----------------------------------

  It is often desirable to see details from when and how the NED interacts with the device(Example: troubleshooting)

  This can be achieved by configuring NSO to generate a trace file for the NED. A trace file
  contains information about all interactions with the device. Messages sent and received as well
  as debug printouts, depending on the log level configured.

  NSO creates one separate trace file for each device instance with tracing enabled.
  Stored in the following location:

  `$NSO_RUNDIR/logs/ned-nokia-srlinux_gnmi-gen-1.0-<device name>.trace`

  Do as follows to enable tracing in one specific device instance in NSO:


  1. Start a NSO CLI session:

     ```
     > ncs_cli -C -u admin
     ```

  2. Enter configuration mode:

     ```
     admin@ncs# configure
     Entering configuration mode terminal
     admin@ncs(config)#
     ```

  3. Enable trace raw:

     ```
     admin@ncs(config)# devices device dev-1 trace raw
     admin@ncs(config)# commit
     ```

     Alternatively, tracing can be enabled globally affecting all configured device instances:

     ```
     admin@ncs(config)# devices global-settings trace raw
     admin@ncs(config)# commit
     ```

  4. Configure the log level for printouts to the trace file:

     ```
     admin@ncs(config)# devices device dev-1 ned-settings nokia-srlinux_gnmi logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings nokia-srlinux_gnmi logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

  The log level 'info' is used by default and the 'debug' level is the most verbose.

  **IMPORTANT**:
  Tracing shall be used with caution. This feature does increase the number of IPC messages sent
  between the NED and NSO. In some cases this can affect the performance in NSO. Hence, tracing should
  normally be disabled in production systems.


  An alternative method for generating printouts from the NED is to enable the Java logging mechanism.
  This makes the NED print log messages to common NSO Java log file.

  `$NSO_RUNDIR/logs/ncs-java-vm.log`

  Do as follows to enable Java logging in the NED

  1. Start a NSO CLI session:

     ```
     > ncs_cli -C -u admin
     ```

  2. Enter configuration mode:

     ```
     admin@ncs# configure
     Entering configuration mode terminal
     admin@ncs(config)#
     ```

  3. Enable Java logging with level all from the NED package:

     ```
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.srlinux \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings nokia-srlinux_gnmi logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings nokia-srlinux_gnmi logger java true
     admin@ncs(config)# commit
     ```

  **IMPORTANT**:
  Java logging does not use any IPC messages sent to NSO. Consequently, NSO performance is not
  affected. However, all log printouts from all log enabled devices are saved in one single file.
  This means that the usability is limited. Typically single device use cases etc.

# 3. Dependencies
-----------------

  This NED has the following host environment dependencies:

  - Java 1.8 (NSO version < 6.2)
  - Java 17 (NSO version >= 6.2)
  - Gnu Sed

  Dependencies for NED recompile:

   - Apache Ant
   - Bash
   - Gnu Sort
   - Gnu awk
   - Grep
   - Python3 (with packages: re, sys, getopt, subprocess, argparse, os, glob)


# 4. Sample device configuration
--------------------------------

  The example below has been successfully verified using a Nokia SRLinux VM running version v22.6.4.

  Note that it was necessary to expclicitly specify a TLS cipher to successfully connect to the device.

  ```
  devices authgroups group dev-1
    default-map remote-name <user name>
    default-map remote-password <password>
  !
  devices device dev-1
    address         <address to device>
    port            <port used by gNMI service on device>
    authgroup       dev-1
    device-type generic ned-id nokia-srlinux_gnmi-gen-1.0
    ned-settings nokia-srlinux_gnmi connection tls enable true
    ned-settings nokia-srlinux_gnmi connection tls accept-any true
    ned-settings nokia-srlinux_gnmi connection tls ciphers [ TLS_RSA_WITH_AES_128_CBC_SHA ]
  !
  ```


# 5. Built in RPC actions
---------------------------------

  ## 5.1. rpc clean-package
  -------------------------

    Cleans the NED package from all downloaded third party YANG files.

      Input arguments:

      - verbose <empty>

        Print the full clean output also for successful executions (otherwise only printed on errors).


  ## 5.2. rpc export-package
  --------------------------

    Export the customized and rebuilt NED. The exported archive file can then be used to install the
    NED package in other NSO instances. The name of the file will have the following format ncs-<NSO
    version>-<NED name>-<NED-version>-customized.tgz.

      Input arguments:

      - destination <string> (default /tmp)

        Set destination directory for the exported archive file.


      - suffix <string> (default -customized)

        Configure a customized suffix to the name of the archive file.


  ## 5.3. rpc get-modules
  -----------------------

    Fetch the YANG modules advertised by the device, from device or given source.

      Input arguments:

      - module-include-regex <string>

        Regular expression matching all YANG models to be included in the download. Example:
        openconfig-.*.


      - module-exclude-regex <string>

        Regular expression matching all YANG models to be excluded from the download. Example:
        tailf-.*.


      - namespace-include-regex <string>

        Regular expression matching all namespaces to be included in the download. Example: tailf-.*.


      - namespace-exclude-regex <string>

        Regular expression matching all namespaces to be excluded from the download. Example:
        tailf-.*.


      - module-additional-include-regex <string>

        Regular expression matching additional YANG models that are not advertised by the device. For
        instance vendor specific deviation models. Example: cisco-nx-openconfig-deviations.*.


      - module-additional-exclude-regex <string>

        Regular expression matching exceptions from the additional-include-regex.


      - profile <union>

        Use a download profile to match a predefined subset of matching YANG files.


      - local-dir <string>

        Path to the directory where the YANG files are to be copied (defaults to src/yang in package).


      - ignore-errors <empty>

        Ignore errors during download. For example missing files of failed revision checks.


        Either of:

          - remote device <empty>

            The device itself.

        OR:

          - remote dir <string>

            A directory on the local host holding all YANG files. For instance a local clone of a git
            repository.

        OR:

          - remote archive <string>

            A path to a zip/tgz archive file containing the YANG files.

        OR:

          - remote git repository <string>

            The URL to the git repository. Example: https://github.com/YangModels/yang.git.

          - remote git dir <string>

            Path to a sub directory inside the git repo where the YANG files can be found. Example:
            vendor/cisco/nx/10.1-2.

          - remote git checkout <string>

            Optionally, a name of a branch/tag in the git repo where the YANG files can be found.
            Example: master.

          - remote git include-dir <string>

            Optional extra include paths to be used when searching for YANG files. Each include path
            is relative to the git root directory.


  ## 5.4. rpc list-modules
  ------------------------

    List the YANG modules advertised by the device. Including revision tag.

      Input arguments:

      - module-include-regex <string>

        Regular expression matching all YANG models to be included in the download. Example:
        openconfig-.*.


      - module-exclude-regex <string>

        Regular expression matching all YANG models to be excluded from the download. Example:
        tailf-.*.


      - namespace-include-regex <string>

        Regular expression matching all namespaces to be included in the download. Example: tailf-.*.


      - namespace-exclude-regex <string>

        Regular expression matching all namespaces to be excluded from the download. Example:
        tailf-.*.


      - module-additional-include-regex <string>

        Regular expression matching additional YANG models that are not advertised by the device. For
        instance vendor specific deviation models. Example: cisco-nx-openconfig-deviations.*.


      - module-additional-exclude-regex <string>

        Regular expression matching exceptions from the additional-include-regex.


      - profile <union>

        Use a download profile to match a predefined subset of matching YANG files.


  ## 5.5. rpc list-profiles
  -------------------------

    Fetch a list of all predefined download profiles supported by the NED.

      No input arguments


  ## 5.6. rpc rebuild-package
  ---------------------------

    Rebuild the NED package directly from within NSO. This invokes the gnu make internally.

      Input arguments:

      - verbose <empty>

        Print the full build output also for successful executions (otherwise only printed on errors).


      - profile <union>

        Apply a certain build profile.


      - filter scope dir <string>

        Directory containing one or many xml file representing the wanted scope.


      - filter trim-schema method <enum> (default patch)

        Select method to be used for trimming.

        deviate  - Trim by creating a YANG deviation file containing all selected nodes.

        patch    - Trim by patching the YANG models and remove all selected nodes from them before
                   they are being compiled.


        Either of:

          - filter trim-schema nodes <union>

            List of nodes to trim. Use one of the pre-defined top node names. Alternatively, specify a
            custom xpath to trim (prefix is mandatory on each element in the path).

        OR:

          - filter trim-schema all-unused <empty>

            Trim all currently unused nodes in the schema. This means all config nodes that are
            currently not populated in CDB.

        OR:

          - filter trim-schema all-with-status <enum>

            Trim all nodes in the schema annotated with matching 'status' statements.

            deprecated  - Means node is still supported, but usage no longer recommended.

            obsolete    - Means node is not supported anymore, and should not be used.

        OR:

          - filter trim-schema nodes-from-file <string> (default /tmp/nedcom-trim-schema-nodes.txt)

            Specify a path to a custom file to be used for trimming nodes. The file shall contain
            schema paths, including relevant prefixes to all nodes to be trimmed. One schema path per
            line.

        OR:

          - filter trim-schema custom-deviation-file <string>

            Specify a path to a custom YANG deviation file to be used for trimming the schema. The
            file shall comply to the standard for deviation files and contain paths to all nodes to be
            trimmed from the schema.

        OR:


      - filter auto-config dir <string>

        Directory containing the files used for auto-config filtering. The following files must be
        present: before.xml and after.xml.


      - filter auto-config file <string> (default /tmp/nedcom-auto-deviations.yang)

        Name of auto generated deviation file.


      - ned-id major <string>

        Set a custom major number in the generated ned-id.


      - ned-id minor <string>

        Set a custom minor number in the generated ned-id.


      - ned-id suffix <string>

        Set a custom suffix in the generated ned-id.


      - local-dir <string>

        Path to the directory where the YANG files are to be copied (defaults to src/yang in package).


      - additional-build-args <string>

        Additional arguments to pass to build(make) commands.


  ## 5.7. rpc show-default-local-dir
  ----------------------------------

    Show the path to the default directory where the YANG files are to be copied. I.e <path to current
    NED package>/src/yang.

      No input arguments


  ## 5.8. rpc show-loaded-schema
  ------------------------------

    Display the schema currently built into the NED package. Each node will by default be listed with
    a schema path.

      Input arguments:

      - scope <enum> (default all)

        Select the scope for the nodes that will be listed.

        all     - Display all nodes in the schema. This is the default.

        used    - Display only the config nodes in use, i.e currently populated in CDB.

        unused  - Display only the config nodes that are not in use.

        rpcs    - Display the rpc nodes defined in the schema.


      - with-status <enum>

        Only select nodes annotated with matching 'status' statements.

        deprecated  - Means node is still supported, but usage no longer recommended.

        obsolete    - Means node is not supported anymore, and should not be used.


      - count <empty>

        Count the nodes and return the sum instead of the full list of nodes.


      - details <empty>

        Display schema details like must/when expression, leafrefs and leafref targets.


      - root-paths <string>

        Specify root paths for which nodes shall be listed or counted. Only nodes with a schema path
        starting any of the specified roots will then be processed.


      - config <true|false> (default true)

        Set to false to display non config nodes in the schema. Note: scope will in this case be
        'all'.


      - output file <string>


      - developer generate-schypp-pragmas pragma <enum> (default remove)

        Set pragma type.

        remove   - remove.

        replace  - replace.


      - developer generate-schypp-pragmas statement <enum>

        Set the yang statement for the pragma.

        must    - must.

        when    - when.

        unique  - unique.


      - developer generate-schypp-pragmas pattern <string>

        Configure the pattern to search for matching statements. Use ".*" to match any string.


      - developer generate-schypp-pragmas replace-with <string>

        For replace pragmas, set replacement for statements matching the pattern.


      - developer generate-schypp-pragmas add-comment <empty>

        Prepend extra comment containing info about the statement.

  ## 5.7.1 any

  ### exec any get

  The NED supports a generic versatile get action which can be used for doing any type of read operation towards a Nokia SRLinux gNMI device.

  ```
  exec any get origin <origin> encoding <encoding> path <path>
  ```

  ##### Mandatory arguments

  ```
  path <string> - Specify the path to be used for the gNMI GET operation.
  								This can also be a EOS CLI command in case the optional origin argument is set to 'cli'
  ```

  ##### Optional arguments

  ```
  origin <string> - Specify the gNMI origin to be used for the GET operation.
  									Nokia SRLinux supports the following predefined origins:
  										- openconfig : Used for accessing openconfig data, i.e the default config tree.

  encoding <string> - Specify the gNMI encoding to be used.
  										The following predefined encodings are supported by SRLinux: JSON_IETF, JSON, ASCII
  ```

  ##### Example

  ```
  admin@ncs# devices device nokia-srlinux-1 live-status exec any get encoding JSON_IETF path /srl_nokia-system:system/srl_nokia-system-name:name
  response {
      "srl_nokia-system:system":{
          "srl_nokia-system-name:name":{
              "host-name":"nokia-srlinux-1"
          }
      }
  }
  ```


  ## 5.7.2 gNOI

  --------------------

  The *gRPC* Network Operations Interface (*gNOI*) defines a set of *gRPC*-based services for executing operational commands on network devices. The *gNOI* command interface is supported on Nokia SRLInux version v23.3.2 and later. Currently limited to the categories *system* and *file*.

  This NED supports a number of *gNOI* commands that can be executed on a SRLinux target.

  ### exec gnoi system
  --------------------------

  This container contains all system *gNOI* commands.

  #### time

  Check time on the device

  ```
  exec gnoi system time
  ```

  ##### Mandatory arguments

  ```

  ```

  ##### Optional arguments

  ```

  ```

  #### ping

  Execute ping on device

  ```
  exec gnoi system ping <arguments>
  ```

  ##### Mandatory arguments

  ```
  - destination <string> - Destination address.
  ```

  ##### Optional arguments

  ```
  - source <string> - Source address.

  - count <uint8> (default 1) - Number of packets.

  - l3protocol <IPV4|IPV6> (default IPV4) - Layer3 protocol requested for the ping.

  - interval <uint64> - Nanoseconds between requests.

  - size <uint32> - Size of request packet. (excluding ICMP header)

  - doNotFragment <boolean> - Set the do not fragment bit. (IPv4 destinations)

  - doNotResolve <boolean> - Layer3 protocol requested for the ping.
  ```

  #### traceroute

  Execute traceroute on device.

  ```
  exec gnoi system traceroute <arguments>
  ```

  ##### Mandatory arguments

  ```
  - destination <string> - Destination address.
  ```

  ##### Optional arguments

  ```
  - source <string> - Source address.

  - initialTtl <uint8> (default 1) - Initial TTL.

  - maxTtl <unit8> (default 30) - Maximum number of hops.

  - l3protocol <IPV4|IPV6> (default IPV4) - Layer-3 protocol requested.

  - l4protocol <ICMP|TCP|UDP> (default ICMP) - Layer-4 protocol requested

  - doNotFragment <boolean> - Set the do not fragment bit. (IPv4 destinations)

  - doNotResolve <boolean> - Layer3 protocol requested for the ping.
  ```

  #### killProcess

  Kill a process on the device. Either pid or process name must be specified

  ```
  exec gnoi system killProcess <arguments>
  ```

  ##### Mandatory arguments

  ```
  - pid <uint32> - The pid of the process to be killed.
  - name <string> - The name of the process to be killed.
  ```

  ##### Optional arguments

  ```
  - signal <SIGNAL_TERM|SIGNAL_KILL|SIGNAL_HUP> - Termination signal to be sent to the process
  - restart <boolean>
  ```

  #### reboot

  Reboot the device

  ```
  exec gnoi system reboot <arguments>
  ```

  ##### Mandatory arguments

  ```

  ```

  ##### Optional arguments

  ```
  - delay <uint64> - Delay in nanoseconds before issuing reboot.

  - message <string> - Informational reason for the reboot.

  - force <boolean> - Force reboot if sanity checks fail. (ex. uncommited configuration)

  - method <COLD|POWERDOWN|HALT|WARM|NSF|POWERUP> (default COLD) - Reboot method
  ```

  #### cancelReboot

  Cancel reboot of the device.

  ```
  exec gnoi system cancelReboot <arguments>
  ```

  ##### Mandatory arguments

  ```

  ```

  ##### Optional arguments

  ```
  - message <string> - Informational reason for the cancel
  ```

  #### rebootStatus

  Check reboot status on the device.

  ```
  exec gnoi system rebootStatus
  ```

  ##### Mandatory arguments

  ```

  ```

  ##### Optional arguments

  ```

  ```

  #### switchControlProcessor

  Switch from the current route processor to the provided route processor.

  ```
  exec gnoi system switchControlProcessor
  ```

  ##### Mandatory arguments

  ```

  ```

  ##### Optional arguments

  ```

  ```


# 6. Built in live-status show
------------------------------

  The Nokia SRLinux NED has full support for fetching operational data via the NSO live-status API.


# 7. Limitations
----------------

  Be aware that all XML namespaces were changed in SRLinux sometime between version 23 and 24.
  Hence, if upgrading a NED that previously used SRLinux models for version 23 or older to version 24
  will cause NSO to wipe most or all corresponding device data in CDB.


# 8. How to report NED issues and feature requests
--------------------------------------------------

  **Issues like bugs and errors shall always be reported to the Cisco NSO NED team through
  the Cisco Support channel:**

  - <https://www.cisco.com/c/en/us/support/index.html>
  - <https://developer.cisco.com/docs/nso/#!support/network-service-orchestrator-support>

  The following information is required for the Cisco NSO NED team to be able
  to investigate an issue:

    - A detailed recipe with steps to reproduce the issue.
    - A raw trace file generated when the issue is reproduced.
    - Access to a device where the issue can be reproduced by the Cisco NSO NED team.
      This typically means both read and write permissions are required.
      Pseudo access via tools like Webex, Zoom etc is not acceptable.
      However, it is ok with device access through VPNs, jump servers etc though.

  Do as follows to gather the necessary information needed for your device, here named 'dev-1':

  1. Enable full debug logging in the NED

     ```
     ncs_cli -C -u admin
     admin@ncs# configure
     admin@ncs(config)# devices device dev-1 ned-settings nokia-srlinux_gnmi logging level debug
     admin@ncs(config)# commit
     ```

  2. Configure the NSO to generate a raw trace file from the NED

     ```
     admin@ncs(config)# devices device dev-1 trace raw
     admin@ncs(config)# commit
     ```

  3. If the NED already had trace enabled, clear it in order to submit only relevant information

     Do as follows for NSO 6.4 or newer:

     ```
     admin@ncs(config)# devices device dev-1 clear-trace
     ```

     Do as follows for older NSO versions:

     ```
     admin@ncs(config)# devices clear-trace
     ```

  4. Run a compare-config to populate the trace with initial device config

     ```
     admin@ncs(config)# devices device dev-1 compare-config
     ```

  5. Reproduce the found issue using ncs_cli or your NSO service.
     Write down each necessary step in a reproduction report.

  6. Gather the reproduction report and a copy of the raw trace file
     containing data recorded when the issue happened.

  7. Contact the Cisco support and request to open a case. Provide the gathered files
     together with access details for a device that can be used by the
     Cisco NSO NED when investigating the issue.


  **Requests for new features and extensions of the NED are handled by the Cisco NSO NED team when
  applicable. Such requests shall also go through the Cisco support channel.**

  The following information is required for feature requests and extensions:

  1. A detailed use case description, with details like:
     - Data of interest
     - The kind of operations to be used on the data. Like: 'read', 'create', 'update', 'delete'
       and the order of the operation
     - Device APIs involved in the operations (For example: REST URLs and payloads)
     - Device documentation describing the operations involved

  2. Run sync-from # devices device dev-1 sync-from (if relevant)

  3. Attach the raw trace to the ticket (if relevant)

  4. Access to a device that can be used by the Cisco NSO NED team for testing and verification
     of the new feature. This usually means that both read and write permissions are required.
     Pseudo access via tools like Webex, Zoom etc is not acceptable. However, it is ok with access
     through VPNs, jump servers etc.


# 9. How to rebuild a NED
--------------------------

  Check the README-rebuild.md file, chapter 1.3, for more information.


# 10. Using the NED feature load-native-config

This NED has support for the load-native-config feature, meaning that you can load config directly from a file formatted in native device format. Since it is a gNMI NED it is required that the file is formatted as a gNMI SetRequest message, as specified here:  https://github.com/openconfig/reference/blob/master/rpc/gnmi/gnmi-specification.md#341-the-setrequest-message

A gNMI SetRequest message is using a JSON structure containing three lists with the self explained names *update*, *replace* and *delete*. Each entry in the update and replace lists is a modify and/or create operation, represented by a gNMI path and a payload element. The latter is a JSON formatted string itself (in cleartext) describing the elements to be modified.

Each entry in the delete list is a delete operation represented by a gNMI path.

Optionally each gNMI SetRequest message can contain a *prefix* which is a gNMI path that will be prepended to all operations in the update, replace and delete lists.

Below is an example of a valid JSON structure that can be used for the load-native-commands feature.

```
{
                 "prefix":{
                 },
                 "update":[{
                     "path":{
                         "elem":[{
                             "key":{
                             },
                             "name":"openconfig-interfaces:interfaces"
                         },{
                             "key":{
                                 "name":"GigabitEthernet0/0/0/0"
                             },
                             "name":"interface"
                         },{
                             "key":{
                             },
                             "name":"config"
                         }]
                     },
                     "val":{
                         "jsonIetfVal":{
                             "description":"TEST"
                         }
                     }
                 }],
                 "replace":[{
                     "path":{
                         "elem":[{
                             "key":{
                             },
                             "name":"tailf-aaa:aaa"
                         },{
                             "key":{
                             },
                             "name":"authorization"
                         },{
                             "key":{
                             },
                             "name":"cmdrules"
                         },{
                             "key":{
                                 "index":"1"
                             },
                             "name":"cmdrule"
                         }]
                     },
                     "val":{
                         "jsonIetfVal":{
                             "context":"*",
                             "command":"*",
                             "group":"root-system",
                             "ops":"rx",
                             "action":"reject"
                         }
                     }
                 }],
                 "delete":[{
                     "elem":[{
                         "key":{
                         },
                         "name":"openconfig-interfaces:interfaces"
                     },{
                         "key":{
                             "name":"GigabitEthernet0/0/0/1"
                         },
                         "name":"interface"
                     }]
                 }]
             }

```

The NSO command *commit dry-run outformat native* is an easy way to generate valid JSON snippets that can be used with the load-native-command feauture.

Example:

```
admin@ncs(config-interface-GigabitEthernet0/0/0/1)# commit dry-run
cli {
    local-node {
        data  devices {
                  device xrv9k-782-gnmi-1 {
                      config {
                          oc-if:interfaces {
                              interface GigabitEthernet0/0/0/1 {
                                  config {
             +                        description TEST;
                                  }
                              }
                          }
                      }
                  }
              }
    }
}
admin@ncs(config-interface-GigabitEthernet0/0/0/1)# commit dry-run outformat native
native {
    device {
        name xrv9k-782-gnmi-1
        data {
                 "prefix":{
                 },
                 "update":[],
                 "replace":[{
                     "path":{
                         "elem":[{
                             "key":{
                             },
                             "name":"openconfig-interfaces:interfaces"
                         },{
                             "key":{
                                 "name":"GigabitEthernet0/0/0/1"
                             },
                             "name":"interface"
                         },{
                             "key":{
                             },
                             "name":"config"
                         }]
                     },
                     "val":{
                         "jsonIetfVal":{
                             "description":"TEST"
                         }
                     }
                 }],
                 "delete":[]
             }
    }
}
```
