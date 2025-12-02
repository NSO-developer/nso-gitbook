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
     5.1. rpc add-filter-path
     5.2. rpc clean-package
     5.3. rpc clear-cached-capabilities
     5.4. rpc clear-filter-paths
     5.5. rpc compare-config
     5.6. rpc compile-modules
     5.7. rpc export-package
     5.8. rpc get-modules
     5.9. rpc import-filter-paths
     5.10. rpc list-filter-paths
     5.11. rpc list-module-sets
     5.12. rpc list-modules
     5.13. rpc list-profiles
     5.14. rpc patch-modules
     5.15. rpc rebuild-package
     5.16. rpc remove-filter-path
     5.17. rpc show-default-local-dir
     5.18. rpc show-loaded-schema
     5.19. rpc verify-get-config
     5.20. rpc xpath-trace-analyzer
  6. Built in live-status show
  7. Limitations
  8. How to report NED issues and feature requests
  9. How to rebuild a NED
  10. Configure the NED to use ssh multi factor authentication
  11. Tips and Tricks for Resolving Common Issues with IOS XR Devices
      11.1 Interface Name Changes When a New Line Card Is Inserted
      11.2 Addressing Disappearing Interface Instances
  12. Run arbitrary commands on device
  ```


# 1. General
------------

  This document describes the cisco-iosxr_nc NED.

  IMPORTANT:
  This NED is delivered without any of the device YANG models bundled to the NED package.

  It is required to download the YANG files separately and rebuild the NED package before the NED is
  fully operational. See the README-rebuild.md for further information.

  In summary, the below steps are needed to have a fully functioning NED:

  ```
  1.  Compile the empty package and load it into NSO
  2a. Connect to device and fetch yang modules (if yang available on device or in git repository)
  2b. Copy vendor yang directly into src/yang (if yang is available elsewhere)
  3.  Verify yang, potentially fixing any issues
  4.  Re-Compile package (i.e. in NSO), and do packages reload
  ```

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
  | netsim                    | yes       |                                                                  |
  |                           |           |                                                                  |
  | check-sync                | yes       | See the README-ned-settings.md, 'transaction trans-id-method'    |
  |                           |           | for details.                                                     |
  |                           |           |                                                                  |
  | partial-sync-from         | yes       |                                                                  |
  |                           |           |                                                                  |
  | live-status actions       | yes       | Can run CLI commands through 'exec any', see README.md           |
  |                           |           |                                                                  |
  | live-status show          | yes       | All models are by default mounted under live-status              |
  |                           |           |                                                                  |
  | load-native-config        | no        | Since config can be loaded in xml format in NSO, this can be     |
  |                           |           | used instead.                                                    |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Cisco IOSXR               | v24.3.1         | IOS XR |                                                   |
  |                           |                 |        |                                                   |
  | Cisco IOSXR               | v7.9.2          | IOS XR |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```

  Verified YANG model bundles
  ```
  +---------------------------+-----------------+------------------------------------------------------------+
  | Bundle                    | Version         | Info                                                       |
  +---------------------------+-----------------+------------------------------------------------------------+
  | Cisco IOS XR              | 7.9.2           |                                                            |
  |                           |                 |                                                            |
  | Cisco IOS XR              | 24.3.1          |                                                            |
  +---------------------------+-----------------+------------------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-cisco-iosxr_nc-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-cisco-iosxr_nc-1.0.1.signed.bin
      > ./ncs-6.0-cisco-iosxr_nc-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-cisco-iosxr_nc-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-cisco-iosxr_nc-1.0.1.tar.gz
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
     `cisco-iosxr_nc-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-cisco-iosxr_nc-1.0.1.tar.gz
     > ls -d */
     cisco-iosxr_nc-gen-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package cisco-iosxr_nc-gen-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package cisco-iosxr_nc-gen-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-cisco-iosxr_nc-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package cisco-iosxr_nc-gen-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/cisco-iosxr_nc-gen-1.0
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
               /tmp/ned-package-store/ncs-6.0-cisco-iosxr_nc-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-cisco-iosxr_nc-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install cisco-iosxr_nc-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-cisco-iosxr_nc-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-cisco-iosxr_nc-gen-1.0
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
    admin@ncs(config)# devices device dev-1 device-type generic ned-id cisco-iosxr_nc-gen-1.0
    admin@ncs(config)# devices device dev-1 state admin-state unlocked
    admin@ncs(config)# devices device dev-1 authgroup my-group
    ```
    **IMPORTANT**:

    The *device-type* shall always be set to *generic* when configuring a device instance
    to use a 3PY NED. A common mistake is configuring it as *netconf*, which will cause
    NSO to use its internal netconf client instead.

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

  `$NSO_RUNDIR/logs/ned-cisco-iosxr_nc-gen-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings cisco-iosxr_nc logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings cisco-iosxr_nc logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.iosxr \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings cisco-iosxr_nc logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings cisco-iosxr_nc logger java true
     admin@ncs(config)# commit
     ```

  **IMPORTANT**:
  Java logging does not use any IPC messages sent to NSO. Consequently, NSO performance is not
  affected. However, all log printouts from all log enabled devices are saved in one single file.
  This means that the usability is limited. Typically single device use cases etc.

  **SSHJ DEBUG LOGGING**
  For issues related to the ssh connection it is often useful to enable full logging in the SSHJ ssh client.
  This will make SSHJ print additional log entries in `$NSO_RUNDIR/logs/ncs-java-vm.log`:

```
admin@ncs(config)# java-vm java-logging logger net.schmizz.sshj level level-all
admin@ncs(config)# commit
```


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

  NONE


# 5. Built in RPC actions
---------------------------------

  ## 5.1. rpc add-filter-path
  ---------------------------

    Add a path to be filtered, possibly removing paths being made redundant.

      Input arguments:

        Either of:

          - include <empty>

        OR:

          - exclude <empty>


      - force <empty>


      - path <string>


  ## 5.2. rpc clean-package
  -------------------------

    Cleans the NED package from all downloaded third party YANG files.

      Input arguments:

      - verbose <empty>

        Print the full clean output also for successful executions (otherwise only printed on errors).


  ## 5.3. rpc clear-cached-capabilities
  -------------------------------------

    Clear all cached capabilities (module-set-id/content-id/yang-library/netconf-state).

      No input arguments


  ## 5.4. rpc clear-filter-paths
  ------------------------------

    Clear all filter-paths, except content from ned-setting 'filter-paths-file'.

      No input arguments


  ## 5.5. rpc compare-config
  --------------------------

    Do a NED-internal compare-config, with data either from device or file, optionally disabling
    filtering.

      Input arguments:

      - config-file <string>

        Optional file to load config from instead of fetching from device (NOTE, should be content of
        rpc-reply, i.e. config wrapped in data-tag).


      - strict <empty>

        Match defaults strict, according to capabilities.


      - unfiltered <empty>

        Don't apply filter-paths.


      - outformat <enum> (default tree)

        tree     - Standard NSO diff tree.

        compact  - Compact diff showing key-paths.

        xml      - Show diff as netconf edit-config XML.


  ## 5.6. rpc compile-modules
  ---------------------------

    Compile YANG modules, showing all non-fatal warnings found.

      Input arguments:

      - local-dir <string>

        Path to the directory where the YANG files are found (defaults to src/yang in package).


      - no-deviations <empty>

        Set to disable deviations.


      - ignore-errors <empty>

        Ignore errors while compiling, i.e. which would normally cause compilation to abort.


  ## 5.7. rpc export-package
  --------------------------

    Export the customized and rebuilt NED. The exported archive file can then be used to install the
    NED package in other NSO instances. The name of the file will have the following format ncs-<NSO
    version>-<NED name>-<NED-version>-customized.tgz.

      Input arguments:

      - destination <string> (default /tmp)

        Set destination directory for the exported archive file.


      - suffix <string> (default -customized)

        Configure a customized suffix to the name of the archive file.


  ## 5.8. rpc get-modules
  -----------------------

    Fetch the YANG modules from the device.

      Input arguments:

      - module-include-regex <string>

        Regular expression matching all YANG models to be included in the download. Example:
        'openconfig-.*'.


      - module-exclude-regex <string>

        Regular expression matching all YANG models to be excluded from the download. Example:
        'tailf-.*'.


      - namespace-include-regex <string>

        Regular expression matching all namespaces to be included in the download. Example:
        'tailf-.*'.


      - namespace-exclude-regex <string>

        Regular expression matching all namespaces to be excluded from the download. Example:
        'tailf-.*'.


      - module-set <string>

        Only include modules from the given yang-library module-set (if device supports yang-library
        1.1).


      - only-present <empty>


      - only-oper-filter <string>


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


  ## 5.9. rpc import-filter-paths
  -------------------------------

    Import filter-paths from file, will be merged with currently loaded.

      Input arguments:

      - filter-file <string>

        File containing filter-paths, one on each line: <include|exclude> <schema-path>.


  ## 5.10. rpc list-filter-paths
  ------------------------------

    List currently loaded/generated filter-paths.

      Input arguments:

      - deviation-module <empty>

        Generate a module which deviates all excluded paths as 'not-supported'.


      - save-to-file <string>

        Save result to given file. For deviation module, optionally just give name of module to
        generate in src/yang.


  ## 5.11. rpc list-module-sets
  -----------------------------

    List the yang-library module-sets advertised by the device, if device supports it.

      No input arguments


  ## 5.12. rpc list-modules
  -------------------------

    List the YANG modules advertised by the device. Including revision tag.

      Input arguments:

      - module-include-regex <string>

        Regular expression matching all YANG models to be included in the download. Example:
        'openconfig-.*'.


      - module-exclude-regex <string>

        Regular expression matching all YANG models to be excluded from the download. Example:
        'tailf-.*'.


      - namespace-include-regex <string>

        Regular expression matching all namespaces to be included in the download. Example:
        'tailf-.*'.


      - namespace-exclude-regex <string>

        Regular expression matching all namespaces to be excluded from the download. Example:
        'tailf-.*'.


      - module-set <string>

        Only include modules from the given yang-library module-set (if device supports yang-library
        1.1).


      - only-present <empty>


      - only-oper-filter <string>


      - profile <union>

        Use a download profile to match a predefined subset of matching YANG files.


  ## 5.13. rpc list-profiles
  --------------------------

    List all predefined download profiles bundled with the NED. Including a short description of each.

      No input arguments


  ## 5.14. rpc patch-modules
  --------------------------

    Patch YANG modules, to remove non-fatal warnings found.

      Input arguments:

      - local-dir <string>

        Path to the directory where the YANG files are found (defaults to src/yang in package).


      - no-deviations <empty>

        Set to disable deviations.


      - output-dir <string>

        Path to the directory where the patched YANG files are written (defaults to src/yang in
        package), existing files will be renamed to <name>.yang.orig.


  ## 5.15. rpc rebuild-package
  ----------------------------

    Rebuild the NED package directly from within NSO. This invokes the gnu make internally.

      Input arguments:

      - verbose <empty>

        Print the full build output also for successful builds (otherwise only printed on errors).


      - build-namespace-classes <empty>

        Generate Python and Java namespace classes for each YANG file.


      - use-module-as-prefix <empty>

        Instructs the NSO YANG compiler to use the YANG module name as the prefix instead of the
        prefix declared in the YANG file. By default, the declared prefix is used. Enabling this
        option changes how schema nodes are referenced in NSO, including through the Maagic and Maapi
        APIs. Use this option with caution, as it may cause unexpected side effects. The primary use
        case is migrating from an older NED schema that used module names as prefixes. Note that the
        NED setting transaction/accept-module-as-prefix must also be enabled in the rebuilt NED to
        make it function properly.


      - profile <string>

        Apply a certain build profile.


      - filter scope dir <string>

        Directory containing one or many xml file representing the wanted scope.


      - filter trim-schema method <enum> (default patch)

        Select method to be used for trimming.

        deviate  - Trim by creating a YANG deviation file containing all selected nodes.

        patch    - Trim by patching the YANG models and remove all selected nodes from them before
                   they are being compiled.


        Either of:

          - filter trim-schema nodes <string>

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


      - include-netsim <empty>

        Do compile the YANG models for netsim as well, when rebuilding the NED package.


      - additional-build-args <string>

        Additional arguments to pass to build(make) commands.


  ## 5.16. rpc remove-filter-path
  -------------------------------

    Remove a path from filter-paths.

      Input arguments:

        Either of:

          - include <empty>

        OR:

          - exclude <empty>


      - path <string>


  ## 5.17. rpc show-default-local-dir
  -----------------------------------

    Show the path to the default directory where the YANG files are to be copied. I.e <path to current
    NED package>/src/yang.

      No input arguments


  ## 5.18. rpc show-loaded-schema
  -------------------------------

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

        type    - type.


      - developer generate-schypp-pragmas pattern <string>

        Configure the pattern to search for matching statements. Use ".*" to match any string.


      - developer generate-schypp-pragmas replace-with <string>

        For replace pragmas, set replacement for statements matching the pattern.


      - developer generate-schypp-pragmas add-comment <empty>

        Prepend extra comment containing info about the statement.


  ## 5.19. rpc verify-get-config
  ------------------------------

    Verify XML contents of config, either from device or file, to validate
    data and look for unmodeled structures (the yang-modules are compiled on
    the fly making this a convenient way to verify yang-updates).

      Input arguments:

        Either of:

          - local-dir <string>

            Path to the directory where the YANG files are found (defaults to src/yang in package).

          - no-deviations <empty>

            Set to disable deviations.

          - patch <empty>

            Auto-patch yang when possible (e.g. missing leafref targets will expand referrer type).

          - config-file <string>

            Optional file to load config from instead of fetching from device (NOTE, should be content
            of rpc-reply, i.e. config wrapped in data-tag).

        OR:

          - no-compile <empty>


      - verbose <empty>

        Show verbose output, like 'sync-from verbose'.


  ## 5.20. rpc xpath-trace-analyzer
  ---------------------------------

    A tool for analyzing NSO XPath traces, designed to identify inefficient or problematic XPath
    expressions in third-party YANG files that may negatively impact NSO performance.

      Input arguments:

      - file <string> (default logs/xpath.trace)

        Path to the NSO xpath trace file to use. The xpath trace file used by the current NSO will be
        used by default.


      - number-of-entries <uint8> (default 10)

        Set the number of entries to display in the generated top list.


# 6. Built in live-status show
------------------------------

  NONE


# 7. Limitations
----------------

    Limitations related to fetching operational data via the live-status API:

    NSO prior to version 5.6 can not handle lists defined in YANG as config false
    but with no key node specified.  Consequently the NED is not able to populate
    operational data that maps to such lists.


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
     admin@ncs(config)# devices device dev-1 ned-settings cisco-iosxr_nc logging level debug
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


# 10. Configure the NED to use ssh multi factor authentication
---------------------------------------------------------------

  This NED supports multi factor authentication (MFA) using the ssh authentication
  method 'keyboard-interactive'.

  Some additional steps are required to enable the MFA support:

  1. Verify that your NSO version supports MFA. This is configurable as additional
     settings in the authentication group used by the device instance.

     Enter a NSO CLI and enter the following and do tab completion:

     ```
     > ncs_cli -C -u admin
     admin@ncs# show running-config devices authgroups group default default-map <tab>
     Possible completions:
     action-name                 The action to call when a notification is received.
     callback-node               Invoke a standalone action to retrieve login credentials for managed devices on the 'callback-node' instance.
     mfa                         Settings for handling multi-factor authentication towards the device
     public-key                  Use public-key authentication
     remote-name                 Specify device user name
     remote-password             Specify the remote password
     remote-secondary-password   Second password for configuration
     same-pass                   Use the local NCS password as the remote password
     same-secondary-password     Use the local NCS password as the remote secondary password
     same-user                   Use the local NCS user name as the remote user name
     ```

     If 'mfa' is displayed in the output like above, NSO has MFA support enabled.
     In case MFA is not supported it is necessary to upgrade NSO before proceeding.

  2. Implement the authenticator executable. The MFA feature relies on an external executable to take care of the client part
     of the multi factor authentication. The NED will automatically call this executable for each challenge presented by the
     ssh server and expects to get a proper response in return.

     The executable can be a simple shell script or a program implemented in any programming language.

     The required behaviour is like this:
      - read one line from stdin
        The line passed from the NED will be a semi colon separated string containing the following info:
        ```
        [<device name>;<user>;<password>;<opaque>;<ssh server name>;<ssh server instruction>;<ssh server prompt>;]
        ```
        The elements for device name, user, password and opaque corresponds to what has been configured in NSO.
        The ssh server name, instruction and prompt are given by the ssh server during the authentication step.

        Each individual element in the semi colon separated list is Base64 encoded.

      - Extract the challenge based on the contents above.

      - Print a response matching the challenge to stdout and exit with code 0

      - In case a matching response can not be given do exit with code 2

     Below is a simple example of an MFA authenticator implemented in Python3:

     ```
     #!/usr/bin/env python3
     import sys
     import base64

     # This is an example on how to implement an external multi factor authentication handler
     # that will be called by the NED upon a ssh 'keyboard-interactive' authentication
     # The handler is reading a line from stdin with the following expected format:
     #   [<device name>;<user>;<password>;<opaque>;<ssh server name>;<ssh server instruction>;<ssh server prompt>;]
     # All elements are base64 encoded.

     def decode(arg):
         return str(base64.b64decode(arg))[2:-1]

     if __name__ == '__main__':
         query_challenges = {
             "admin@localhost's password: ":'admin',
             'Enter SMS passcode:':'secretSMScode',
             'Press secret key: ':'2'
         }
         # read line from stdin and trim brackets
         line = sys.stdin.readline().strip()[1:-1]
         args = line.split(';')
         prompt = decode(args[6])
         if prompt in query_challenges.keys():
             print(query_challenges[prompt])
             exit(0)
         else:
             exit(2)
     ```

  3. Configure the authentication group used by the device instance to enable MFA. There
     are two configurables available:
     - executable    The path to the external multi factor authentication executable (mandatory).
     - opaque        Opaque data that will passed as a cookie element to the executable (optional).

     ```
     > ncs_cli -C -u admin
     admin@ncs# config
     Entering configuration mode terminal
     admin@ncs(config)# devices authgroups group <name> default-map mfa executable <path to the executable>
     admin@ncs(config)# devices authgroups group <name> default-map mfa opaque <some opaque data>
     admin@ncs(config)# commit
     ```

  4. Try connecting to the device.


## 10.1 Trouble shooting
------------------------
  In case of connection problems the following steps can help for debugging:

  Enable the NED trace in debug level:

  ```
  > devices device dev-1 trace raw
  > devices device dev-1 ned-settings cisco-iosxr_nc logger level debug
  > commit
  ```

  Try connect again

  Inspect the generated trace file.

  Verify that the ssh client is using the external authenticator executable:

  ```
  using ssh external mfa executable: <configured path to executable>
  ```

  Verify that the executable is called with the challenges presented by the ssh server:

  ```
  calling external mfa executable with ssh server given name: '<name>', instruction: '<instruction>', prompt '<challenge>'
  ```

  Check for any errors reported by the NED when calling the executable

  ```
  ERROR: external mfa executable failed <....>
  ```

# 11. Tips and Tricks for Resolving Common Issues with IOS XR Devices
---------------------------------------------------------------------
 This chapter serves as a reference archive, providing suggestions for troubleshooting
 common issues that may arise when using IOS XR devices with NSO. New information will
 be added as features and workarounds are introduced to this NED.


## 11.1 Interface Name Changes When a New Line Card Is Inserted
---------------------------------------------------------------
When interface hardware is changed on an XR device, the interface names typically change as well. For example, if SFPs are upgraded from gigabit-capable to hundred-gigabit-capable,  the interface names in the XR configuration will change from: `GigabitEthernet0/0/0/0`  to `HundredGigEthernet0/0/0/0`

This is standard behavior in IOS XR, but it can cause significant issues when working with NSO.

NSO maintains its own CDB database with the running network configuration and is unaware of the interface name changes.

As a result, if a `compare-config` operation is performed in NSO after the SFPs have been changed, it will appear as though the old interfaces have disappeared and been replaced by a completely new set of interfaces. This often disrupts services running in NSO, as they may have dependencies on specific interface names.

This NED provides a workaround for this issue, but it should be noted that this is a best-effort approach -there is no foolproof solution.

The workaround involves using inbound and outbound replacer transforms based on regular expressions.

- For inbound configuration, replacers are applied after the NED receives the configuration in XML format from the device, but before it is parsed and relayed to NSO. This affects NSO operations such as sync-from and compare-config.
- For outbound configuration, replacers are applied as the last step before the XML configuration is sent to the device.


**Example:**
Initially, interface names are prefixed with `GigabitEthernet`. After switching SFPs, the names change to `HundredGigEthernet`.

The interface list in the device's XML configuration initially appears as follows:
  ```
         <interfaces xmlns="http://cisco.com/ns/yang/Cisco-IOS-XR-um-interface-cfg">
          <interface>
            <interface-name>GigabitEthernet0/0/0/0</interface-name>
            <shutdown/>
          </interface>
          <interface>
            <interface-name>GigabitEthernet0/0/0/1</interface-name>
            <shutdown/>
          </interface>
          <interface>
            <interface-name>GigabitEthernet0/0/0/2</interface-name>
            <shutdown/>
          </interface>
  ```

The approach is to have the NED transform interface names to a generic prefix, such as `MyEthernet`.
To achieve this, the real interface name prefix is converted to `My` inbound, and for outbound operations, the prefix `My` is replaced with the original interface prefix.

This is configured through the NED settings:

- **Inbound transform:** `devices device dev-1 ned-settings cisco-iosxr_nc transaction config-replace-patterns inbound (<interface-name>)(Gigabit)([^<]+) replace $1My$3`
- **Outbound transform:** `devices device dev-1 ned-settings cisco-iosxr_nc transaction config-replace-patterns outbound (<interface-name>)(My)([^<]+) replace $1Gigabit$3`

To verify the inbound transform, perform a `sync-from` in NSO followed by `show running-config`. The interfaces should now be prefixed with `My`, as shown below:

```
devices device dev-1
 config
 interfaces interface MyEthernet0/0/0/0
  shutdown
 !
 interfaces interface MyEthernet0/0/0/1
  shutdown
 !
 interfaces interface MyEthernet0/0/0/2
  shutdown
 !
```

To verify the outbound transform, edit an interface configuration and perform a `commit dry-run outformat native`. The output should now include the real interface prefixes:

Now, assume the SFPs are replaced on the XR device. The new interface list from the device will look like this:

```
     <interfaces xmlns="http://cisco.com/ns/yang/Cisco-IOS-XR-um-interface-cfg">
      <interface>
        <interface-name>HundredGigEthernet0/0/0/0</interface-name>
        <shutdown/>
      </interface>
      <interface>
        <interface-name>HundredGigEthernet0/0/0/1</interface-name>
        <shutdown/>
      </interface>
      <interface>
        <interface-name>HundredGigEthernet0/0/0/2</interface-name>
        <shutdown/>
      </interface>
```



At this point, you need to update the regular expressions in both the inbound and outbound transformers:

```
devices device dev-1 ned-settings cisco-iosxr_nc transaction config-replace-patterns inbound (<interface-name>)(HundredGig)([^<]+) replace $1My$3
devices device dev-1 ned-settings cisco-iosxr_nc transaction config-replace-patterns outbound (<interface-name>)(My)([^<]+) replace $1HundredGig$3
```



After making these changes, performing a `compare-config` should show no differences.

This approach allows you to keep the CDB database unchanged, ensuring that services continue to function without interruption.


## 11.2 Addressing Disappearing Interface Instances

The IOS XR platform exhibits a unique behavior with interfaces that can cause synchronization issues when using NSO.

Specifically, if you configure an interface with the no shutdown command but do not add any additional sub-configuration, the interface may spontaneously disappear from the global device configuration. This behavior leads to immediate out-of-sync issues in NSO.

The following example demonstrates this issue:

```
admin@ncs# config
Entering configuration mode terminal
admin@ncs(config)# no devices device dev-1 config interfaces interface GigabitEthernet0/0/0/3 shutdown
admin@ncs(config)# commit
Commit complete.
admin@ncs(config)# compare-config
diff
 devices {
     device dev-1 {
         config {
             interfaces {
-                interface GigabitEthernet0/0/0/3 {
-                }
             }
         }
     }
 }
```

To address this out-of-sync problem, the NED includes a built-in config caching feature. When an interface state is changed and new configuration is deployed (outbound), the NED caches the interface configuration. During subsequent read operations, the cached configuration is injected back, ensuring that NSO remains in sync-even if the device no longer displays the interface in its running configuration.

You can enable this feature using the transaction/enable-config-caching NED setting.

```
admin@ncs(config)# devices device dev-1 ned-settings cisco-iosxr_nc transaction enable-config-caching true
admin@ncs(config)# commit
admin@ncs(config)# no devices device xrv9k-nc-2 config interfaces interface GigabitEthernet0/0/0/3 shutdown
admin@ncs(config)# commit
admin@ncs(config)# commit
Commit complete.
admin@ncs(config)# compare-config
admin@ncs(config)#
```

The config caching feature currently supports interface configurations accessed via the native classic, native UM, or openconfig YANG models.



# 12. Run arbitrary commands on device
--------------------------------------

  Some commands that are available to a user logged in to an interactive CLI
  session on the device might not be available through NETCONF. For situations
  like this the NED provides the feature to run arbitrary commands through an
  interactive SSH login to the device. This SSH session is handled internally in
  the NED and connected in NSO to a live-status action called 'exec any'.

  There are some ned-settings to control the behaviour of this feature, see the
  section 'ned-settings cisco-iosxr_nc live-status cli' in
  README-ned-settings.md for details on this.

  Specifically, to be able to handle the interactive session towards the device,
  the NED needs to know the format for the device prompt. It also assumes that
  pagination is turned off before reading output from command sent (i.e. that
  the device doesn't pause terminal output, waiting for interactive
  response). The ned-settings 'prompt-pattern' and 'no-pagniation-cmd' are used
  to control this. These might have proper default values, please check that
  this matches your device though before trying this feature, since if not
  configured correctly the NED will hang until timed out.

  As an example, to run the command 'show running-config' on the device, and get
  the resulting output as a string from the ncs_cli, run the following:

  ```
  admin@ncs# devices device dev-1 live-status exec any show running-config
  ```

  Note that when using ncs_cli, the command-line given might need to be quoted
  if it contains characters that are interpreted by the ncs_cli itself.
