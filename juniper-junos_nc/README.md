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
     5.1. rpc activate
     5.2. rpc activate
     5.3. rpc add-filter-path
     5.4. rpc clean-package
     5.5. rpc clear-cached-capabilities
     5.6. rpc clear-filter-paths
     5.7. rpc compare-config
     5.8. rpc compare-loaded-schema
     5.9. rpc compile-modules
     5.10. rpc deactivate
     5.11. rpc deactivate
     5.12. rpc export-package
     5.13. rpc get-modules
     5.14. rpc import-filter-paths
     5.15. rpc list-filter-paths
     5.16. rpc list-inactive
     5.17. rpc list-inactive
     5.18. rpc list-module-sets
     5.19. rpc list-modules
     5.20. rpc list-profiles
     5.21. rpc patch-modules
     5.22. rpc rebuild-package
     5.23. rpc remove-filter-path
     5.24. rpc show-default-local-dir
     5.25. rpc show-loaded-schema
     5.26. rpc verify-get-config
     5.27. rpc xpath-trace-analyzer
  6. Built in live-status show
  7. Limitations
  8. How to report NED issues and feature requests
  9. How to rebuild a NED
  10. Configure the NED to use ssh multi factor authentication
  11. Filtering yang schema to reduce size or handle overlaps
      11.1 Filtering schema at run-time or compile-time
      11.2 Handling overlapping yang modules
  12. Custom XML transforms
      12.1 filter-exclude-config
      12.2 filter-by-version
      12.3 filter-leaf
      12.4 reorder-keys
      12.5 edit-full-delete
      12.6 edit-op
      12.7 hidden-config
      12.8 redeploy-on-edit
      12.9 remove-before-edit
      12.10 redeploy-parent-on-edit + redeploy-point
      12.11 replace-all-leaf-list|long-obu-diff-leaf-list
      12.12 diff-set|delete-before|after
  13. Run arbitrary commands on device
  14. Migrating from juniper-junos to the juniper-junos_nc generic NED
  15. Using the JunOS Specific Feature: Deactivating Configuration
  ```


# 1. General
------------

  This document describes the juniper-junos_nc NED.

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
  | vmx                       | 21.1R1.11       | Junos  |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-juniper-junos_nc-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-juniper-junos_nc-1.0.1.signed.bin
      > ./ncs-6.0-juniper-junos_nc-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-juniper-junos_nc-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-juniper-junos_nc-1.0.1.tar.gz
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
     `juniper-junos_nc-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-juniper-junos_nc-1.0.1.tar.gz
     > ls -d */
     juniper-junos_nc-gen-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package juniper-junos_nc-gen-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package juniper-junos_nc-gen-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-juniper-junos_nc-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package juniper-junos_nc-gen-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/juniper-junos_nc-gen-1.0
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
               /tmp/ned-package-store/ncs-6.0-juniper-junos_nc-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-juniper-junos_nc-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install juniper-junos_nc-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-juniper-junos_nc-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-juniper-junos_nc-gen-1.0
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
    admin@ncs(config)# devices device dev-1 device-type generic ned-id juniper-junos_nc-gen-1.0
    admin@ncs(config)# devices device dev-1 state admin-state unlocked
    admin@ncs(config)# devices device dev-1 authgroup my-group
    ```
    **IMPORTANT**:

    The *device-type* shall always be set to *generic* when configuring a device instance
    to use a 3PY NED. A common mistake is configuring it as *netconf*, which will cause
    NSO to use its internal netconf client instead.


  Junos netconf/yang compliance configuration

  Junos devices can be configured to support netconf/yang in two different modes.
  Either in a legacy, non-compliant mode or, in a compliant mode. Historically
  Juniper didn't publish any yang-models, hence Cisco provides the "legacy"
  juniper-junos NED package which contains a generated yang model, including some
  proprietary yang extensions to be able to handle some of the non-compliant
  parts.

  The configuration on the device which decides which mode it operates in are
  found in the container /configuration/system/services/netconf.

  This NED is designed to target Junos devices running in rfc compliant mode.

  Set the below config on the device to make it operate in a compliant mode:
  ```
      set system services netconf rfc-compliant
      set system services netconf yang-compliant
  ```
  For more information on the compliance settings in Junos see:

      https://www.juniper.net/documentation/us/en/software/junos/netconf/topics/ref/statement/rfc-compliant-edit-system-services-netconf.html
      https://www.juniper.net/documentation/us/en/software/junos/netconf/topics/ref/statement/yang-compliant-edit-system-services-netconf.html

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

  `$NSO_RUNDIR/logs/ned-juniper-junos_nc-gen-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings juniper-junos_nc logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings juniper-junos_nc logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.junos \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings juniper-junos_nc logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings juniper-junos_nc logger java true
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

  ## 5.1. rpc activate
  --------------------

    Set the activation state to 'active' for the node with the given schema path.

      Input arguments:

      - path <string>

        Schema path or key-path to node in config to set to 'active'.


      - dry-run <empty>

        Only show the resulting 'edit-config' which would be sent to device.


  ## 5.2. rpc activate
  --------------------

    Set the activation state to 'active' for the node with the given schema path.

      Input arguments:

      - path <string>

        Schema path or key-path to node in config to set to 'active'.


      - dry-run <empty>

        Only show the resulting 'edit-config' which would be sent to device.


  ## 5.3. rpc add-filter-path
  ---------------------------

    Add a path to be filtered, possibly removing paths being made redundant.

      Input arguments:

        Either of:

          - include <empty>

        OR:

          - exclude <empty>


      - force <empty>


      - path <string>


  ## 5.4. rpc clean-package
  -------------------------

    Cleans the NED package from all downloaded third party YANG files.

      Input arguments:

      - verbose <empty>

        Print the full clean output also for successful executions (otherwise only printed on errors).


  ## 5.5. rpc clear-cached-capabilities
  -------------------------------------

    Clear all cached capabilities (module-set-id/content-id/yang-library/netconf-state).

      No input arguments


  ## 5.6. rpc clear-filter-paths
  ------------------------------

    Clear all filter-paths, except content from ned-setting 'filter-paths-file'.

      No input arguments


  ## 5.7. rpc compare-config
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


  ## 5.8. rpc compare-loaded-schema
  ---------------------------------

    Compare the currently loaded schema with the newly downloaded YANG modules. This tool generates a
    report indicating whether the schemas are compatible within the scope of the current device
    configuration stored in the CDB.

      Input arguments:

      - details <empty>

        Display detailed results of the schema comparison, including all detected differences and
        their compatibility status.


      - skip-yang-pre-processing <empty>

        Skip applying the same pre-processor fixes and build filters to newly downloaded YANG files as
        were applied to the loaded schema before comparison. If set, it will likely generate a
        significant number of false positives in the comparison results.


      - outformat <enum> (default structured)

        Select the format of the generated report.

        structured  - structured.

        text        - text.


  ## 5.9. rpc compile-modules
  ---------------------------

    Compile YANG modules, showing all non-fatal warnings found.

      Input arguments:

      - local-dir <string>

        Path to the directory where the YANG files are found (defaults to src/yang in package).


      - no-deviations <empty>

        Set to disable deviations.


      - ignore-errors <empty>

        Ignore errors while compiling, i.e. which would normally cause compilation to abort.


  ## 5.10. rpc deactivate
  -----------------------

    Set the activation state to 'inactive' for the node with the given schema path.

      Input arguments:

      - path <string>

        Schema path or key-path to node in config to set to 'inactive'.


      - dry-run <empty>

        Only show the resulting 'edit-config' which would be sent to device.


  ## 5.11. rpc deactivate
  -----------------------

    Set the activation state to 'inactive' for the node with the given schema path.

      Input arguments:

      - path <string>

        Schema path or key-path to node in config to set to 'inactive'.


      - dry-run <empty>

        Only show the resulting 'edit-config' which would be sent to device.


  ## 5.12. rpc export-package
  ---------------------------

    Export the customized and rebuilt NED. The exported archive file can then be used to install the
    NED package in other NSO instances. The name of the file will have the following format ncs-<NSO
    version>-<NED name>-<NED-version>-customized.tgz.

      Input arguments:

      - destination <string> (default /tmp)

        Set destination directory for the exported archive file.


      - suffix <string> (default -customized)

        Configure a customized suffix to the name of the archive file.


  ## 5.13. rpc get-modules
  ------------------------

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


  ## 5.14. rpc import-filter-paths
  --------------------------------

    Import filter-paths from file, will be merged with currently loaded.

      Input arguments:

      - filter-file <string>

        File containing filter-paths, one on each line: <include|exclude> <schema-path>.


  ## 5.15. rpc list-filter-paths
  ------------------------------

    List currently loaded/generated filter-paths.

      Input arguments:

      - deviation-module <empty>

        Generate a module which deviates all excluded paths as 'not-supported'.


      - save-to-file <string>

        Save result to given file. For deviation module, optionally just give name of module to
        generate in src/yang.


  ## 5.16. rpc list-inactive
  --------------------------

    List all nodes which have activation state set to 'inactive'.

      No input arguments


  ## 5.17. rpc list-inactive
  --------------------------

    List all nodes which have activation state set to 'inactive'.

      No input arguments


  ## 5.18. rpc list-module-sets
  -----------------------------

    List the yang-library module-sets advertised by the device, if device supports it.

      No input arguments


  ## 5.19. rpc list-modules
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


  ## 5.20. rpc list-profiles
  --------------------------

    List all predefined download profiles bundled with the NED. Including a short description of each.

      No input arguments


  ## 5.21. rpc patch-modules
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


  ## 5.22. rpc rebuild-package
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


      - include-netsim <empty>

        Do compile the YANG models for netsim as well, when rebuilding the NED package.


      - additional-build-args <string>

        Additional arguments to pass to build(make) commands.


  ## 5.23. rpc remove-filter-path
  -------------------------------

    Remove a path from filter-paths.

      Input arguments:

        Either of:

          - include <empty>

        OR:

          - exclude <empty>


      - path <string>


  ## 5.24. rpc show-default-local-dir
  -----------------------------------

    Show the path to the default directory where the YANG files are to be copied. I.e <path to current
    NED package>/src/yang.

      No input arguments


  ## 5.25. rpc show-loaded-schema
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


  ## 5.26. rpc verify-get-config
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


  ## 5.27. rpc xpath-trace-analyzer
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

  The NED supports fetching operational data from the Junos /jc:configuration top node.


# 7. Limitations
----------------

    At least Juniper Junos EVO version 25 does have a few YANG models with the same prefix defined.
    This is a bug that will make NSO refuse to load the NED package. To avoid this, the NED does automatically
    change the prefix to 'jnsd' for the YANG model junos-genstate-nsagentd-status.yang as well as
    'jgsnmps' for the YANG model junos-genstate-snmp-statistics.yang


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
     admin@ncs(config)# devices device dev-1 ned-settings juniper-junos_nc logging level debug
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
  > devices device dev-1 ned-settings juniper-junos_nc logger level debug
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


# Chapter 11: Using the NED for Telemetry



## Introduction

This NED leverages the telemetry capabilities introduced in NSO 6.7, allowing NSO to function as a telemetry subscriber for managed devices. This integration enables sophisticated automation patterns at the service layer, such as feedback loops where configuration changes trigger automated responses once the device confirms the new state.

Because the Juniper JunOS platform does not yet support YANG-Push (RFC 8641) via NETCONF, this NED employs a hybrid architecture. It utilizes NETCONF for standard operations-such as provisioning and state retrieval - while leveraging gNMI specifically for telemetry subscriptions.

*Note: Telemetry support within this NED is currently classified as experimental.*


### Prerequisites

- **NSO version:** NSO 6.7 or newer.
- **Device requirements:** A recent version of JunOS with support for gNMI telemetry subscriptions.


### Background: gNMI Telemetry

**gNMI (gRPC Network Management Interface)** is a network management protocol developed by the [OpenConfig](https://www.openconfig.net/) working group. It uses [gRPC](https://grpc.io/) as the transport layer and Protocol Buffers for message encoding, providing a high-performance, modern alternative to traditional management interfaces like NETCONF and SNMP.

A central feature of gNMI is its **Subscribe RPC**, which allows a client to establish long-lived telemetry subscriptions towards a device. Instead of repeatedly polling the device for state, the client opens a subscription stream and the device pushes updates as they occur or at defined intervals.

gNMI supports three subscription modes:

| Mode                  | Behavior                                                     |
| :-------------------- | :----------------------------------------------------------- |
| **ON_CHANGE**         | The device sends an update only when the value of a subscribed path changes. Ideal for configuration state, protocol status, and other data where changes are discrete events. Not all paths on a device may support this mode. |
| **SAMPLE** (Periodic) | The device sends a snapshot of the subscribed data at a fixed interval. Suitable for counters, statistics, and any data that changes frequently and continuously. |
| **TARGET_DEFINED**    | The device chooses the most appropriate mode (on-change or periodic) for each path based on its own internal classification. This mode offers flexibility but means the behavior may vary across paths and device platforms. Currently not supported by the NSO telemetry feature. |

Key characteristics of gNMI telemetry include:

- **Path-based subscriptions** — Subscriptions target specific paths in the device's YANG schema, giving precise control over what data is streamed.
- **Efficient transport** — gRPC provides HTTP/2-based streaming with low overhead, making it well suited for high-frequency telemetry data.
- **Structured encoding** — Updates are encoded using Protocol Buffers or JSON, ensuring a compact and well-defined message format.
- **Initial synchronization** — When a subscription is established, the device can send a full snapshot of the current state before switching to incremental updates, ensuring the subscriber starts with a known baseline.
- **Heartbeat intervals** — A heartbeat can be configured to let the device send periodic keep-alive messages even when no data has changed, allowing the subscriber to detect a silent connection failure.
- **Redundancy suppression** — The device can be instructed to suppress updates that carry the same value as the previously sent update, reducing unnecessary traffic.

By leveraging gNMI telemetry through this NED, NSO gains a real-time, event-driven view of device state — a foundation for building closed-loop automation and reactive service logic.

## How It Works

NSO does not have native support for parsing gNMI messages. Instead, this NED transforms received gNMI telemetry messages into a corresponding YANG-Push format that NSO can parse and process. This translation is transparent to the service layer — services interact with the telemetry data using the same NSO APIs regardless of whether the underlying protocol is gNMI or YANG-Push.

------

## Configuring a Telemetry Subscription

Telemetry subscriptions are configured under each device's `telemetry` container:

```none
/devices/device/<name>/telemetry/subscription/<name>
```

You can set up one or more subscriptions per device. Each subscription must specify, at a minimum, a **subscription mode** (`periodic` or `on-change`) and a set of **paths** (in XPath format) pointing to the locations of interest in the device schema.

### General Subscription Settings

The telemetry subscription model in NSO is designed around YANG-Push concepts. When using a gNMI NED, some of these settings are not applicable since gNMI uses its own subscription semantics. The table below indicates which settings are used and which are not relevant for gNMI-based subscriptions.

| Setting                      | Description                                                  |
| :--------------------------- | :----------------------------------------------------------- |
| `name`                       | Subscription name (used as the list key).                    |
| `local-user`                 | The NSO user whose authentication credentials are used when connecting to the device for the telemetry session. |
| `datastore`                  | Not used with gNMI, but still used by NSO internally .        |
| `xpaths`                     | XPath filter pointing to the paths of interest in the device schema. |
| `subtree`                    | Not used with gNMI.                                      |
| `periodic`                   | Enables **periodic** (SAMPLE) mode. The device sends a full snapshot of data under the subscribed path at regular intervals. |
| `periodic/period`            | Update interval in centiseconds. Mandatory when using periodic mode. |
| `periodic/anchor-time`       | Not used with gNMI.                                      |
| `on-change`                  | Enables **on-change** (ON_CHANGE) mode. The device sends an update only when a node under the subscribed path has changed. Note that on-change may only be supported for certain parts of the device schema. |
| `on-change/dampening-period` | Not used with gNMI.                                      |
| `on-change/sync-on-start`    | Not used with gNMI.                                      |
| `on-change/excluded-change`  | Not used with gNMI.                                      |
| `reconnect-interval`         | How often (in seconds) to retry a failed subscription. Default: `60`. |
| `setting`                    | A list of key/value pairs for NED-specific settings (see below). |

### NED-Specific Settings

The following settings are configured in the `setting` list. Because this list accepts arbitrary key/value string pairs, it is important that both keys and values are spelled **exactly** as shown below.

| Key                            | Description                                                  |
| :----------------------------- | :----------------------------------------------------------- |
| `allow-aggregation`            | When set to `true`, the NED signals to the device that it is allowed to aggregate multiple subscription updates into a single gNMI message. This can improve efficiency when many paths are changing simultaneously but may increase message latency. Default: `false`. |
| `config-only`                  | When set to `true`, the telemetry subscription delivers configuration updates only. This option requires the device to support the gNMI extension `ConfigSubscription`. Default: `false`. |
| `force-raw`                    | When set to `true`, `yang-push`, or `gnmi`, the NED delivers telemetry events to NSO as raw, unparsed messages instead of model-driven data. By default, telemetry events are parsed by NSO and populated into a synthetic transaction, which allows services to perform standard operations such as diff iteration using the `Maagic` API. In some cases it may be preferable to receive the raw data and handle parsing in the service itself. When raw mode is active, the data is made available at: `/devices/device/<name>/telemetry/subscription/<name>/raw-telemetry`.  <br />Valid values: <br />`true` or `yang-push` — the events are first transformed to YANG-Push format by the NED before they are passed to NSO as raw data. <br />`gnmi` — the events are passed as raw JSON-serialized gNMI messages to NSO.<br />Disabled by default. |
| `gather-updates`               | Some gNMI devices send `periodic` telemetry events as an array of smaller messages, each typically containing an snapshot of a single node. These arrays can contain a large number of messages. <br />When set to `true`, the NED gathers and consolidates such array-based gNMI update messages before forwarding the event to NSO. This can help reduce the number of synthetic transactions created in NSO. Default: `false`. |
| `heartbeat-interval`           | Heartbeat interval in centiseconds. When set, the device is requested to send periodic heartbeat messages even when no data has changed. This allows the NED to detect a silent connection failure and trigger a reconnection. Disabled by default. |
| `rate-limit-drop-log-interval` | Controls how often dropped telemetry events are logged when rate limiting is active. Default: `50`. |
| `rate-limit-period`            | Rate-limit period in centiseconds. When set, the NED ensures that telemetry messages are not forwarded to NSO more frequently than this interval. This is intended as a safeguard against excessively high-frequency updates (e.g., from a misbehaving device). Disabled by default. |
| `suppress-redundant`           | When set to `true`, the NED instructs the device to suppress updates that carry the same value as the previously sent update. This reduces unnecessary traffic for paths whose values remain stable over time. Default: `false`. |
| `updates-only`                 | When set to `true`, the device is instructed to skip the initial synchronization snapshot and only send subsequent updates. This is useful when the subscriber does not need the full current state at subscription startup. Default: `false`. |

------

## Examples

The following examples show how to configure telemetry subscriptions through the NSO CLI.

### Example 1: On-Change Subscription with Rate Limiting

This subscription monitors the interfaces subtree and applies a rate limiter to prevent excessive updates.

```shell
ncs(config)# devices device dev0 telemetry subscription intf-changes \
    local-user admin \
    xpath /oc-if:interfaces \
    on-change \
    setting rate-limit-period value 20
ncs(config-subscription-intf-changes)# commit
```

### Example 2: Periodic Subscription with Raw Delivery

This subscription polls the interfaces subtree every 10 seconds (1000 centiseconds) and delivers the data as raw gNMI messages.

```shell
ncs(config)# devices device dev0 telemetry subscription intf-poll \
    local-user admin \
    xpath /oc-if:interfaces \
    periodic period 1000 \
    setting force-raw value gnmi
ncs(config-subscription-intf-poll)# commit
```


## Using Telemetry in Service Applications

This section provides an overview of how telemetry can be integrated into service applications to assist with provisioning and monitoring. For full details, refer to the NSO documentation.

### Toolkit Components

The service developer's toolkit for working with telemetry consists of two main components:

1. **Synthetic Telemetry Transactions**

   - For **model-driven** telemetry events, NSO fully populates the received data into a synthetic transaction. This means you can use standard NSO API operations — such as diff iteration and the Python `Maagic` API — to inspect and react to the data.
   - For **raw** telemetry events, the unparsed data can be read from the synthetic transaction at: `/devices/device/<name>/telemetry/subscription/<name>/raw-telemetry`

2. **Telemetry Kickers**

   - The `telemetry-kicker` (configured under `/kickers`) lets you trigger an action whenever a telemetry event is received that matches a selector expression. This is the primary mechanism for wiring telemetry events into your service logic.



Together, these components enable patterns such as:

- **Feedback-loop provisioning** — Push configuration to a device, then automatically detect when it has taken effect.
- **Alarm propagation** — React to operational state changes on the device and propagate them northbound.



### Example: Feedback-Loop Based BGP Provisioning

The following example demonstrates a very simple service application that provisions a BGP neighbor on a device and uses telemetry to detect when that neighbor reaches the `ESTABLISHED` state. When the telemetry event is received, the service automatically updates an operational leaf, which in turn can notify northbound systems (for instance, via a northbound YANG-Push subscription from NSO).

#### Service YANG Model

```
module closed-loop-demo {
  yang-version 1.1;
  namespace "http://example.com/closed-loop-demo";
  prefix cld;

  import tailf-common {
    prefix tailf;
  }
  import tailf-ncs {
    prefix ncs;
  }
  import tailf-ncs-kicker-extension {
    prefix kicker;
  }
  revision 2026-02-01 {
    description
      "Initial revision.";
  }

  list autonomous-bgp-router {
    key "device local-as-number";
    uses ncs:service-data;
    ncs:servicepoint closed-loop-demo-servicepoint;
    leaf device {
      type leafref {
        path "/ncs:devices/ncs:device/ncs:name";
      }
    }
    leaf local-as-number {
      type uint32;
    }
    leaf peer-as-number {
      type uint32;
      mandatory true;
    }
    leaf peer-ip-address {
      type string;
      mandatory true;
    }
    leaf operational-state {
      type enumeration {
        enum UNKNOWN;
        enum ESTABLISHED;
        enum TIMEOUT;
      }
      default UNKNOWN;
      config false;
      tailf:cdb-oper {
        tailf:persistent true;
      }
    }
    tailf:action handle-autonomous-bgp-notification {
      tailf:actionpoint handle-autonomous-bgp-notification;
      input {
        uses kicker:telemetry-action-input-params;
      }
      output {
      }
    }
  }
}
```



#### **Service Python module**

```
# -*- mode: python; python-indent: 4 -*-
import ncs
import json
from ncs.application import Service
from ncs.cdb import OperSubscriber
from ncs.dp import Action
from ncs.maapi import Maapi
_ncs = __import__('_ncs') # pylint: disable=invalid-name

class ClosedLoopDemo(Service):
    @Service.create
    def cb_create(self, tctx, root, service, proplist):
        self.log.info('Service start autonomous BGB on device {0}, local-as-number: {1}, peer-as-number: {2}, peer-ip-address {3}'.format(service.device, service.local_as_number, service.peer_as_number, service.peer_ip_address))

        name = 'autonomous-bgp-monitor-{0}-{1}'.format(service.device, service.local_as_number)

        # 1. Setup a telemetry kicker
        kicker = root.kicker__kickers.telemetry_kicker.create(name)
        kicker.selector_expr = "$SUBSCRIPTION_NAME = '{0}'".format(name)
        kicker.kick_node = "/autonomous-bgp-router[device='{0}'][local-as-number='{1}']".format(service.device, service.local_as_number)
        kicker.action_name = 'handle-autonomous-bgp-notification'

        # 2. Setup telemetry subscription. Mode on-change
        device = root.devices.device[service.device]
        entry = device.telemetry.subscription.create(name)
        entry.datastore = 'operational'
        entry.xpath = "/configuration/protocols/bgp/group[name='EBGP-PEER-GROUP-65001']"
        entry.local_user = 'admin'
        entry.on_change.create()
        entry.on_change.sync_on_start = False

        # 3. Apply Template
        template = ncs.template.Template(service)
        template.apply('closed-loop-demo', None)

class HandleBgpNotification(Action):
    # Stop the telemetry subscription and kicker
    def stop_monitoring(self, kp, kicker_id):
        with ncs.maapi.single_write_trans('admin', 'python', db=_ncs.RUNNING) as edit_th:
            self.log.info("Stopping monitor")
            root = ncs.maagic.get_root(edit_th)
            service_node = ncs.maagic.get_node(edit_th, kp)
            del(root.kicker__kickers.telemetry_kicker[kicker_id])
            del(root.devices.device[service_node.device].telemetry.subscription[kicker_id])
            edit_th.apply()
        with ncs.maapi.single_write_trans('admin', 'python', db=_ncs.OPERATIONAL) as oper_th:
            self.log.info("Setting operational state to ESTABLISHED")
            service_node = ncs.maagic.get_node(oper_th, kp)
            service_node.operational_state = "ESTABLISHED"
            oper_th.apply()

    @Action.action
    def cb_action(self, uinfo, name, kp, input, output, trans):
        self.log.info("Kicker triggered by: {0}".format(input.kicker_id))
        with ncs.maapi.Maapi() as m:
            with ncs.maapi.single_read_trans('admin', 'python', db=_ncs.RUNNING) as th:
                service = ncs.maagic.get_node(th, kp)
               	with m.attach(input.tid) as kicker_th:
                    root = ncs.maagic.get_root(kicker_th)
                    group = root.devices.device[service.device].
                    live_status.jc__configuration.jc_protocols__protocols.bgp.group

                    if not 'EBGP-PEER-GROUP-65001' in group:
                        return
                    neighbor = group['EBGP-PEER-GROUP-65001'].neighbor
                    if  not '192.168.0.2' in neighbor:
                        return
                    val = neighbor['192.168.0.2'].description
                    self.log.info("Operational state is: {0}".format(val))
                    if val and str(val).lower() == "established":
                        self.stop_monitoring(kp, input.kicker_id)

# ---------------------------------------------
# COMPONENT THREAD THAT WILL BE STARTED BY NCS.
# ---------------------------------------------
class Main(ncs.application.Application):

    #pylint: disable=attribute-defined-outside-init
    def setup(self):
        # The application class sets up logging for us. It is accessible
        # through 'self.log' and is a ncs.log.Log instance.
        self.log.info('Main RUNNING')
        self.register_service('closed-loop-demo-servicepoint', ClosedLoopDemo)
        self.register_action('handle-autonomous-bgp-notification', HandleBgpNotification)

    def teardown(self):
        # When the application is finished (which would happen if NCS went
        # down, packages were reloaded or some error occurred) this teardown
        # method will be called.
        self.log.info('Main FINISHED')
```



#### **How it works:**

1. When the service is created, it configures a **telemetry kicker** and an **on-change telemetry subscription** targeting the BGP group on the device.
2. As the device detects a change in the subscribed BGP group, it pushes an update to NSO via YANG-Push.
3. The telemetry kicker fires and invokes the `handle-autonomous-bgp-notification` action.
4. The action inspects the synthetic transaction to check whether the BGP neighbor has reached the `ESTABLISHED` state.
5. If so, the action removes the subscription and kicker (cleanup) and sets the service's `operational-state` leaf to `ESTABLISHED`.
6. Northbound systems subscribed to NSO can then be notified of this state change automatically.


# 11. Filtering yang schema to reduce size or handle overlaps
------------------------------------------------------------

  In some situations it might be convenient to reduce the size of the yang
  schema, for example to include just the needed yang modules for a certain
  use-case in a NED package. This can have the benefit of only handling the data
  needed, even avoiding out-of-band changes where the scope is limited but there
  are other parties updating the device. In yet other situations, it might be
  necessary to filter out parts of the schema due to device internal overlaps.


## 11.1 Filtering schema at run-time or compile-time
---------------------------------------------------

  While static filtering can be achieved through simply doing a module which
  marks certain parts of the schema as 'not-supported' with deviations and
  recompile, this can quickly become unpractical.

  The NED contains a filtering feature which can be used both at run-time, as
  well as generating deviations for applying at compile-time. There are some
  built-in rpcs to handle the filters, these are:

  ```
      list-filter-paths
      clear-filter-paths
      import-filter-paths
      add-filter-path
      remove-filter-path
  ```

  The filtering described here only works on schema level (i.e. no key-paths are
  allowed). To filter on 'key-path level', see the ned-setting
  transaction/inject-meta-data and the section 8, 'Custom XML transforms' for
  details on how this can be achieved.

  Since these filters are handled and applied at run-time in the NED, there is
  no need to re-compile the NED for trying them out, hence it simplifies an
  iterative approach to fine-tuning the filters.

  The filters can be both including and excluding certain schema-paths. Note
  that if one adds include filters, only schema-paths included by these are used
  by the NED. So a combination of include and exclude filters can narrow down
  the available schema quite a lot.

  Once the filters are finalized, they can be exported to a file to be applied
  through the ned-setting 'transaction/filter-paths-file', i.e. to be able to be
  shared among several instances of the NED, on ned-settings global or profile
  level.

  In the rpc 'list-filter-paths' there is a useful option 'deviation-module'
  which can export the exclude filters as a single yang module containing
  deviations marking the excluded parts of the schema as 'not-supported', hence
  usable for doing static compile-time filtering. Note, only the exclude filters
  are currently taken into account when generating the deviation-module
  (i.e. include filters are ignored, this might be enhanced in a future
  version). See the next section for an example on how to export a
  deviation-module from the exclude filters.

  When the make variable AUTOPATCH_YANG_NED has the value 'yes' (which it has by
  default), the parts marked as 'not-supported' with deviations will
  automatically be pruned from 'when', 'must', and 'leafref path' yang
  expressions in the rest of the modules. This means that applying
  'not-supported' deviations becomes more of a manageble task. This might
  otherwise be quite cumbersome to try to achieve, depending on existing
  references into parts of the schema marked as 'not-supported'.


## 11.2 Handling overlapping yang modules
----------------------------------------

  Device modules might contain data that partly overlaps, for example when there
  are both some native representation along with some standard modules
  (e.g. openconfig). This results in what we can call 'aliasing', i.e. the same
  data appears in more than one place in the available yang modules. The NED has
  some features for discovering and handling this kind of "mixed" module
  environment.

  As an example, if one creates a package containing all modules available on a
  Cisco IOSXR router. It has three different yang schemas, largely overlapping
  each other. The schemas are: UM (unified model), native, and openconfig.

  To help discover the overlaps, there is a ned-setting called "transaction
  abort-on-diff", which when enabled will prevent overlapping edits which would
  cause NSO to be out-of-sync since the device will represent the same data in
  multiple schemas. As an example, we try to edit the hostname using the UM
  schema:

  ```
  admin@ncs(config)# devices device xrv9k-781 ned-settings cisco-iosxr_nc transaction abort-on-diff true
  admin@ncs(config-device-xrv9k-781)# commit
  Commit complete.
  admin@ncs(config-device-xrv9k-781)# config
  admin@ncs(config-config)# hostname system-network-name foobar
  admin@ncs(config-config)# commit
  Aborted: External error in the NED implementation for device xrv9k-781: Prepare error: Detected diff after apply:
  config {
      oc-sys:system {
          config {
  -           hostname xrv9000;
  +           hostname foobar;
          }
      }
      shellutil-cfg:host-names {
  -       host-name xrv9000;
  +       host-name foobar;
      }
  }
  ```

  As can be seen the NED aborts, telling what diff would result if the config was
  applied to device (i.e. since the hostname also appears in the native and
  openconfig schemas). It does this by sending the edit-config to the device as
  normal. But after this, it immediately does a get-config (from the store in use,
  i.e. 'running' or 'candidate'). With this data, it does a NED-internal
  compare-config (i.e. it compare the to-transaction contents in CDB to what the
  device actually now have). If there is a diff, as in the above example, it
  discards the changes on the device, displaying the abort message to the user.

  With this ned-setting enabled, the edits in a particular use-case can be walked
  through to discover the overlaps.

  To simplify the handling of overlaps even more, There is another ned-setting
  "transaction filter-side-effects", which instead of only aborting, creates
  filters for automatically excluding side-effects. It also takes into account
  what is already in CDB.

  With the above example, if you have already synced in data from
  native/openconfig, but try to commit overlapping data to config in the UM
  schema, then filtering out native and/or openconfig would result in diff
  (i.e. CDB data found, but it will be filtered from device):

  ```
  admin@ncs(config-config)# top no devices device xrv9k-781 ned-settings cisco-iosxr_nc transaction abort-on-diff
  admin@ncs(config-config)# top devices device xrv9k-781 ned-settings cisco-iosxr_nc transaction filter-side-effects true
  admin@ncs(config-config)# abort
  admin@ncs# config
  Entering configuration mode terminal
  admin@ncs(config)# devices device xrv9k-781 config
  admin@ncs(config-config)# hostname system-network-name foobar
  admin@ncs(config-config)# commit
  Aborted: External error in the NED implementation for device xrv9k-781: Prepare error: Detected diff after apply:
  config {
      oc-sys:system {
          config {
  -           hostname xrv9000;
  +           hostname foobar;
          }
      }
      shellutil-cfg:host-names {
  -       host-name xrv9000;
  +       host-name foobar;
      }
  }

  --------------------------------------------------------------------------------

  NOTE: Overlapping edit, the resulting filters would cause the below diff:
  config {
      oc-sys:system {
          config {
  -           hostname xrv9000;
  +           hostname foobar;
          }
      }
      shellutil-cfg:host-names {
  -       host-name xrv9000;
  +       host-name foobar;
      }
  }

  --------------------------------------------------------------------------------

  The following filters are overlapping existing data (i.e. causing out-of-sync):
    /oc-sys:system/config/hostname
    /shellutil-cfg:host-names/host-name

  ```

  So in this case, one can't apply the filter "automatically", the suggested
  filters needs to be applied first, then do a sync-from. Like this:

  ```
  admin@ncs(config)# devices device xrv9k-781 rpc rpc-add-filter-path add-filter-path exclude path /oc-sys:system/config/hostname
  result OK
  admin@ncs(config)# devices device xrv9k-781 rpc rpc-add-filter-path add-filter-path exclude path /shellutil-cfg:host-names/host-name
  result OK
  admin@ncs(config)# top devices device xrv9k-781 sync-from
  result true
  admin@ncs(config)# show full-configuration devices device xrv9k-781 config oc-sys:system config
  devices device xrv9k-781
   config
    system config domain-name lab.local
   !
  !
  ```

  As can be seen, the NED is now filtering out the hostname from the openconfig
  schema.

  So now if we try to edit the hostname through the UM schema, it will succeed.

  ```
  admin@ncs(config-config)# hostname system-network-name foobar
  admin@ncs(config-config)# commit
  Commit complete.
  admin@ncs(config-config)# top devices device xrv9k-781 compare-config
  admin@ncs(config-config)#
  ```

  Lets take another example, where there is no overlapping data stored in CDB,
  then the filters can be generated and applied automatically:

  ```
  admin@ncs(config)# devices device xrv9k-781 config um-interface-cfg:interfaces interface GigabitEthernet0/0/0/0
  admin@ncs(config-interface-GigabitEthernet0/0/0/0)# mtu 4096
  admin@ncs(config-interface-GigabitEthernet0/0/0/0)# commit
  Commit complete.
  admin@ncs(config-interface-GigabitEthernet0/0/0/0)# top devices device xrv9k-781 compare-config
  ```

  There is no overlap, the commit was successful, and the filters that was
  generated from this commit have been added automatically.

  ```
  admin@ncs(config-interface-GigabitEthernet0/0/0/0)# top devices device xrv9k-781 rpc rpc-list-filter-paths list-filter-paths | inc mtu
  result
  exclude /ifmgr-cfg:interface-configurations/interface-configuration/mtus/mtu
  exclude /oc-if:interfaces/interface/config/mtu

  ```

  And now the resulting deviations, from both our manually added filter for the
  hostname and the automcatically generated filter from the edit of the mtu:

  ```
  admin@ncs(config-config)# top devices device xrv9k-781 rpc rpc-list-filter-paths list-filter-paths deviation-module
  result
  module nedcom-auto-deviations {
    namespace urn:tail-f.com:nedcom-auto-deviations;
    prefix nedcom-auto-deviations;
    import Cisco-IOS-XR-ifmgr-cfg {
      prefix ifmgr-cfg;
    }
    import Cisco-IOS-XR-shellutil-cfg {
      prefix shellutil-cfg;
    }
    import openconfig-system {
      prefix oc-sys;
    }
    import openconfig-interfaces {
      prefix oc-if;
    }
    revision 2023-03-27 {
      description "Automatic deviations generated from exclude filter";
    }
    deviation /ifmgr-cfg:interface-configurations/ifmgr-cfg:interface-configuration/ifmgr-cfg:mtus/ifmgr-cfg:mtu {
      deviate not-supported;
    }
    deviation /oc-if:interfaces/oc-if:interface/oc-if:config/oc-if:mtu {
      deviate not-supported;
    }
    deviation /oc-sys:system/oc-sys:config/oc-sys:hostname {
      deviate not-supported;
    }
    deviation /shellutil-cfg:host-names/shellutil-cfg:host-name {
      deviate not-supported;
    }
  }
  ```

# 12. Custom XML transforms
---------------------------

  One useful feature present in the NED package is the ability to have java code
  manipulate the contents of netconf XML before sent to NSO, or when applying
  edits, before being sent to the device. This feature is implemented as custom
  XML transform methods which can be referred in the yang schema, either
  statically at compile time, or dynamically at run-time. In the case of
  run-time referral, it can even be done on a per key-path level,
  i.e. transforms can be called for specific key-paths in data.

  While the implementation of these transforms is out of scope for this document
  and for normal usage of the NED, the application of built-in transforms is a
  very powerful additional tool which can be used to overcome some issues
  commonly found in various devices.

  To refer the transforms from yang, the custom tailf extension meta-data is
  used. Since editing the original yang is discouraged, the meta-data extension
  can be either added at compile-time through the schema customization mechanism
  described in section 4 in the README-rebuild.md, or at run-time through the
  ned-setting 'transaction inject-meta-data' (which can take key-paths).

  The built-in transforms that can be referred are listed below. Note that each
  transform is declared to work under certain constraints, regarding 'direction'
  (i.e. to or from device), what type of yang node it can operate on, and so on.


## 12.1 filter-exclude-config
-----------------------------

  This transform filters out config, by default in both directions, i.e. it will
  act the same as if an exclude filter-path is added at the given node in the
  schema. It can be applied on all types of nodes, for container and list nodes,
  all children will also be filtered out. If a meta-value argument with either
  value 'from-device' or 'to-device' is added, the filtering will only occur in
  the given direction (NOTE: this means that NSO and the device might get
  out-of-sync, use with care).

  Since meta-data can be injected on key-path level, it's even possible to
  filter out a certain instance from a list in the configuration such as this:

    transaction inject-meta-data 1 path /ni:network-instance/ni:instances/ni:instance{_public_}/mpls:mpls/mpls:common meta-data filter-exclude-config


## 12.2 filter-by-version
-------------------------

  This transform acts similarly to 'filter-exclude-config', however, it always
  applies in both directions. It takes a mandatory meta-value whose format is
  described below. It is used together with the ned-setting
  transaction/filter-config-by-version which provides a version used for
  comparison, or when that ned-setting has the value 'auto', a device version
  which is supplied through a ned-specific implementation calling the method
  setDeviceVersion().

  The meta-value describes a range for the version to compare to, and if valid,
  will let the config pass, i.e. filtering out config for which the meta-value
  is false. The format of the meta-value is best described using an example
  value:

      The following meta-value:

      1.0 < VERSION <= 2.0

      Means to include config marked with filter-by-version, only if the version
      provided through the transaction/filter-config-by-version ned-setting is
      greater than 1.0 and less than or equal to 2.0. To clarify, at run-time,
      the token VERSION in the meta-value is substituted with the version
      provided by the ned-setting (or the NED) and then the expression is
      evaluated. The upper or lower bound of the range can be left out to make
      it 'open' in one end, like this:

      VERSION <= 2.0

      1.0 < VERSION

  NOTE: The version format can also be three digits, e.g. 7.3.1. The version can
  contain one, two or three digits, which can be freely mixed in expressions.


## 12.3 filter-leaf
-------------------

  This transform can filter out leaf values which are either invalid, or has the
  default value declared in the yang module. It works as a combination of the
  ned-settings transaction/filter-invalid-values=true and the
  capabilities/defaults-mode-override=trim but only for the leaf node where this
  meta-data is applied. The mandatory meta-value can be either of:

      filter-invalid              Will filter invalid values
      trim-default                Will filter default values
      filter-invalid,trim-default Will filter both invalid and default values


## 12.4 reorder-keys
--------------------

  This transform can be used where a device gives data in a non-compliant format
  where list keys are either out-of-order or not the first elements in the XML,
  i.e. where the XML needs to be re-ordered before being validated against the
  yang schema. It takes no meta-value and should be placed on the problematic
  list node(s) in the schema.


## 12.5 edit-full-delete
------------------------

  This transform can be used when a device acts in a non-compliant way, where a
  container needs to be deleted instead of its contents. It can be needed where
  a device doesn't want a reachable default value set back instead of it being
  deleted, which is how NSO normally 'clears' a value which is to be deleted,
  and which has a default value declared.


## 12.6 edit-op
---------------

  This transform can be used to set the netconf operation to use when the node
  in question is to be deleted or edited. By default nodes are deleted with the
  operation 'delete'. With this transform, one can instead use 'remove' (or any
  proprietary keyword) to do the delete instead. It can also be used to reverse
  the effect of the ned-setting transaction/delete-with-remove is enabled,
  i.e. to force 'delete' for selected node(s), for a given node. Also, the
  edit-op can be set to 'replace' (or any proprietary keyword) to force that
  netconf operation whenever the node is present in edit-config (i.e. if not
  deleted).


## 12.7 hidden-config
---------------------

  This transform can be used if device contains config that can be set, but
  which is not reflected in the running configuration. It can be used on leaf
  and leaf-list nodes. When the annotated node is set from NSO, it is always
  echoed back from the NED to NSO as if the device contains the value. It works
  like the annotation tailf:ned-ignore-compare-config, but can also be used on
  leaf-list nodes. The only difference is that from NSO perspective the data
  looks as if it is actually present on device.


## 12.8 redeploy-on-edit
------------------------

  With this transform added on a node in the schema, the node and its children
  will be redeployed in full when edited (i.e. as if the whole content doesn't
  exist on device). This means that if the node is present in the edit-config,
  its contents in the edit-config will be replaced with the full content in the
  to-transaction. This is useful if the device has the non-compliant behaviour
  as if 'replace' is implied on the node, i.e. the device resets all the node's
  content to only include the contents in the edit-config, which results in NSO
  becoming out-of-sync if not all contents are redeployed in the edit.


## 12.9 remove-before-edit
--------------------------

  This transform will inject a delete of the annotated node when it appears in
  an edit-config. This can be useful if the device has the non-compliant
  behaviour that the contents of a node can not be edited if not first cleared
  in the same edit.

  This annotataion can also take the meta-value argument 'delayed-commit', see
  'redeploy-point' for more info on this.

## 12.10 redeploy-parent-on-edit + redeploy-point
-------------------------------------------------

  The transform 'redeploy-parent-on-edit' will redeploy the parent annotated with 'redeploy-point', whenever this node is edited. The parent will also first be deleted.
  an edit-config. This can be useful if the device has the non-compliant
  behaviour that the contents of a node can not be edited if not first cleared
  in the same edit.

  For example, if a device can't edit the pw-id and peer-ip inside the pw list
  within an l2vpn instance, but instead actually needs the full instance to be
  deleted and redeployed in the same edit, the below injects could be used in
  customize-schmea.schypp:

    add /l2vpn/instances/instance::tailf:meta-data redeploy-point;
    add /l2vpn/instances/instance/vpws-ldp/pws/pw/pw-id::tailf:meta-data redeploy-parent-on-edit;
    add /l2vpn/instances/instance/vpws-ldp/pws/pw/peer-ip::tailf:meta-data redeploy-parent-on-edit;

  The meta-value argument 'delayed-commit' can be used in 'redeploy-point' (and
  in 'remove-before-edit' as mentioned above) to force a split of the
  edit-config, so that the delete will happen in first edit-config sent
  (together with the rest of the edit), after which a commit is sent. Then there
  will be an additional edit-config/commit containing the new config to be
  set. This can work in some use-cases, however, since this behaviour indicates
  a serious deviation from standard netconf transactionality in the device, it
  must be used with great care, and is not guarateed to work.

  NOTE: If using 'delayed-commit', the ned-setting 'transaction
  force-revert-diff' must be enabled to ensure that config is rolled back
  correctly to compensate for the intermediate commit done.


## 12.11 replace-all-leaf-list|long-obu-diff-leaf-list
------------------------------------------------------

  In some devices it has been observed that leaf-list nodes doesn't behave
  according to netconf standard. Two annotations exists which can be used to
  mitigate two problems found.

  The first is 'replace-all-leaf-list' which indicates that the semantics of the
  leaf-list is that all its content must re-added when edited, i.e. members not
  present in edit-config are reset on device (which causes NSO to be
  out-of-sync). Hence, editing the leaf-list always includes all members present
  after the transaction (i.e. no explicit delete operation is needed). This can
  potentially result in a very large edit-config of course, if the leaf-list has
  many members.

  The other annotation, 'long-obu-diff-leaf-list' can be used when the leaf-list
  has the semantics of an 'ordered-by user' leaf-list, but is not editable as
  such (i.e. the normal netconf move can not be used). Instead, it will be
  edited by adding/deleteing members, hence the resulting edit for a re-order
  will first remove all elements from the first inserted element, then the rest
  of the elements will be added in correct order, as if being added for the
  first time. As with 'replace-all-leaf-list', this can potentially also result
  in a very large edit-config.


## 12.12 diff-set|delete-before|after
-------------------------------------

  Some devices have non-compliant behaviour such that in certain use-cases, the
  order of the contents in edit-config matters. In these cases this might be
  solved by adding re-ordering meta-data annotations. These annotations are then
  used to force a re-order when specific nodes appears in the edit-config.

  NOTE: To be able to use these annotations, the ned-setting
  'transaction enable-diff-dependencies' must be set to true.

  The annotation is added to the node to be re-ordered, relative to another
  (target) node, when both are present. The path to the target node is given by
  appending ':<path-to-target>' to the chosen re-order variant.

    The four annotation variants available are:

    diff-set-before:<path-to-target>
    diff-set-after:<path-to-target>
    diff-delete-before:<path-to-target>
    diff-delete-after:<path-to-target>

  For example if the schema has a node 'scheduler' which needs to be set before
  it's sibling queue-group, present in schema in parent node
  /mef-egress-qos:egress-qos, the below annotation injection can be used in the
  customize-schema.schypp file to achive the needed re-ordering:

    add /mef-egress-qos:egress-qos/scheduler::tailf:meta-data "diff-set-before:../queue-group";

  This will have the effect that whenever both scheduler and queue-group are
  present in an edit-config, scheduler will be set before queue-group.


# 13. Run arbitrary commands on device
--------------------------------------

  Some commands that are available to a user logged in to an interactive CLI
  session on the device might not be available through NETCONF. For situations
  like this the NED provides the feature to run arbitrary commands through an
  interactive SSH login to the device. This SSH session is handled internally in
  the NED and connected in NSO to a live-status action called 'exec any'.

  There are some ned-settings to control the behaviour of this feature, see the
  section 'ned-settings juniper-junos_nc live-status cli' in
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

# 14. Migrating from juniper-junos to the juniper-junos_nc generic NED
----------------------------------------------------------------------

NSO has supported Junos devices from early on. The legacy juniper-junos NED is NETCONF-based, but as Junos devices did not provide YANG modules in the past, complex NSO machinery translated Juniper's XML Schema Description (XSD) files into a single YANG module. This was an attempt to aggregate several Juniper device modules/versions.

Juniper nowadays provides YANG modules for Junos devices. Junos YANG modules can be downloaded from the device and used directly in NSO with the new juniper-junos_nc generic NED.

By downloading the YANG modules using juniper-junos_nc NED tools and rebuilding the NED, the NED can provide full coverage immediately when the device is updated instead of waiting for a new legacy NED release.

The guide in below link describes how to replace the legacy juniper-junos NED and migrate NSO applications to the juniper-junos_nc generic NED.

Junos NED Migration Guide: https://nso-docs.cisco.com/guides/administration/management/ned-administration#migrating-from-legacy-to-third-party-ned


# 15. Using the JunOS Specific Feature: Deactivating Configuration

The JunOS platform supports a special operation known as configuration deactivation. This allows you to remove the effect of a configuration node without actually deleting it from the configuration file. The node remains visible in the running configuration, but it is marked as inactive and has no operational impact on the device.

The `juniper-junos_nc` NED provides built-in support for these operations via three internal RPCs, allowing you to manage inactive states directly through NSO.

## Available RPC Operations

## activate

Use this RPC to reactivate a previously deactivated configuration node.

### Arguments

- `path` : Schema path or key-path to the node you wish to activate.
- `dry-run` : Optional argument. Displays the resulting edit-config payload without applying changes to the device.

### Example

```
devices device dev-1 rpc irpc:rpc-deactivate deactivate path /jc:configuration/groups{TEST}/jc-protocols:protocols/bgp/multipath dry-run
result <rpc xmlns="urn:ietf:params:xml:ns:netconf:base:1.0" message-id="12">
  <lock>
    <target>
      <candidate/>
    </target>
  </lock>
</rpc>
]]>]]>
<rpc xmlns="urn:ietf:params:xml:ns:netconf:base:1.0" message-id="13">
  <edit-config>
    <target>
      <candidate/>
    </target>
    <test-option>test-then-set</test-option>
    <config>
      <configuration xmlns="http://yang.juniper.net/junos/conf/root">
        <groups xmlns:jc-protocols="http://yang.juniper.net/junos/conf/protocols">
          <name>TEST</name>
          <jc-protocols:protocols>
            <jc-protocols:bgp>
              <multipath xmlns:jcmd="http://yang.juniper.net/junos/jcmd" jcmd:active="false"/>
            </jc-protocols:bgp>
          </jc-protocols:protocols>
        </groups>
      </configuration>
    </config>
  </edit-config>
</rpc>
]]>]]>
admin@ncs# devices device dev-1 rpc irpc:rpc-deactivate deactivate path /jc:configuration/groups{TEST}/jc-protocols:protocols/bgp/multipath
result OK
```

## deactivate

Use this RPC to set a configuration node to an inactive state.

### Arguments

- `path` : Schema path or key-path to the node you wish to deactivate.
- `dry-run` : Optional argument. Displays the resulting edit-config payload without applying changes to the device.

### Example

```
admin@ncs# devices device dev-1 rpc irpc:rpc-deactivate deactivate path /jc:configuration/groups{TEST}/jc-protocols:protocols/bgp/multipath
result OK
```

## list-inactive

Displays a list of all configuration nodes currently marked as inactive on the device.

### Example

```
admin@ncs# devices device dev-1 rpc irpc:rpc-list-inactive list-inactive
paths {
    inactive /jc:configuration/groups{TEST}/jc-protocols:protocols/bgp/multipath
}
```



## Important Limitations

**Note regarding NSO CLI compatibility:**

In NSO version 6.7.2 and earlier, the native NSO CLI commands `activate` and `deactivate` cannot be used in conjunction with this NED. Due to an internal limitation in NSO, using those native commands will have no effect. NSO will not invoke the NED properly. Please ensure you use the provided irpc calls as shown above to manage JunOS deactivation state.
