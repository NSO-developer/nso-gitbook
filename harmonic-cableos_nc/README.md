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
     5.6. rpc compare-loaded-schema
     5.7. rpc compile-modules
     5.8. rpc export-package
     5.9. rpc get-modules
     5.10. rpc import-filter-paths
     5.11. rpc list-filter-paths
     5.12. rpc list-module-sets
     5.13. rpc list-modules
     5.14. rpc list-profiles
     5.15. rpc patch-modules
     5.16. rpc rebuild-package
     5.17. rpc remove-filter-path
     5.18. rpc show-default-local-dir
     5.19. rpc show-loaded-schema
     5.20. rpc verify-get-config
     5.21. rpc xpath-trace-analyzer
  6. Built in live-status show
  7. Limitations
  8. How to report NED issues and feature requests
  9. How to rebuild a NED
  10. Configure the NED to use ssh multi factor authentication
  11. Using the NED for Telemetry
  12. Run arbitrary commands on device
  ```


# 1. General
------------

  This document describes the harmonic-cableos_nc NED.

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
  | check-sync                | yes       |                                                                  |
  |                           |           |                                                                  |
  | partial-sync-from         | yes       |                                                                  |
  |                           |           |                                                                  |
  | live-status actions       | no        |                                                                  |
  |                           |           |                                                                  |
  | live-status show          | no        |                                                                  |
  |                           |           |                                                                  |
  | load-native-config        | no        |                                                                  |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | vCMTS                     | 3.26.8          | CableO | -                                                 |
  |                           |                 | S      |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-harmonic-cableos_nc-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-harmonic-cableos_nc-1.0.1.signed.bin
      > ./ncs-6.0-harmonic-cableos_nc-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-harmonic-cableos_nc-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-harmonic-cableos_nc-1.0.1.tar.gz
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
     `harmonic-cableos_nc-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-harmonic-cableos_nc-1.0.1.tar.gz
     > ls -d */
     harmonic-cableos_nc-gen-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package harmonic-cableos_nc-gen-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package harmonic-cableos_nc-gen-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-harmonic-cableos_nc-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package harmonic-cableos_nc-gen-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/harmonic-cableos_nc-gen-1.0
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
               /tmp/ned-package-store/ncs-6.0-harmonic-cableos_nc-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-harmonic-cableos_nc-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install harmonic-cableos_nc-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-harmonic-cableos_nc-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-harmonic-cableos_nc-gen-1.0
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
    admin@ncs(config)# devices device dev-1 device-type generic ned-id harmonic-cableos_nc-gen-1.0
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

  `$NSO_RUNDIR/logs/ned-harmonic-cableos_nc-gen-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings harmonic-cableos_nc logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings harmonic-cableos_nc logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.cableos \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings harmonic-cableos_nc logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings harmonic-cableos_nc logger java true
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


  ## 5.6. rpc compare-loaded-schema
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


  ## 5.7. rpc compile-modules
  ---------------------------

    Compile YANG modules, showing all non-fatal warnings found.

      Input arguments:

      - local-dir <string>

        Path to the directory where the YANG files are found (defaults to src/yang in package).


      - no-deviations <empty>

        Set to disable deviations.


      - ignore-errors <empty>

        Ignore errors while compiling, i.e. which would normally cause compilation to abort.


  ## 5.8. rpc export-package
  --------------------------

    Export the customized and rebuilt NED. The exported archive file can then be used to install the
    NED package in other NSO instances. The name of the file will have the following format ncs-<NSO
    version>-<NED name>-<NED-version>-customized.tgz.

      Input arguments:

      - destination <string> (default /tmp)

        Set destination directory for the exported archive file.


      - suffix <string> (default -customized)

        Configure a customized suffix to the name of the archive file.


  ## 5.9. rpc get-modules
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


      - profile <string>

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

          - remote git authentication method <enum> (default none)

            Configure authentication method to use when the NED interacts with the RESTCONF device.

            pat   - Personal Access Token.

            none  - No additional authentication is done.

          - remote git authentication pat username <string> (default git)

            The username to use for authentication.

          - remote git authentication pat access-token <string>

            The access token to use for authentication.


  ## 5.10. rpc import-filter-paths
  --------------------------------

    Import filter-paths from file, will be merged with currently loaded.

      Input arguments:

      - filter-file <string>

        File containing filter-paths, one on each line: <include|exclude> <schema-path>.


  ## 5.11. rpc list-filter-paths
  ------------------------------

    List currently loaded/generated filter-paths.

      Input arguments:

      - deviation-module <empty>

        Generate a module which deviates all excluded paths as 'not-supported'.


      - save-to-file <string>

        Save result to given file. For deviation module, optionally just give name of module to
        generate in src/yang.


  ## 5.12. rpc list-module-sets
  -----------------------------

    List the yang-library module-sets advertised by the device, if device supports it.

      No input arguments


  ## 5.13. rpc list-modules
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


      - profile <string>

        Use a download profile to match a predefined subset of matching YANG files.


  ## 5.14. rpc list-profiles
  --------------------------

    List all predefined download profiles bundled with the NED. Including a short description of each.

      No input arguments


  ## 5.15. rpc patch-modules
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


  ## 5.16. rpc rebuild-package
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


  ## 5.17. rpc remove-filter-path
  -------------------------------

    Remove a path from filter-paths.

      Input arguments:

        Either of:

          - include <empty>

        OR:

          - exclude <empty>


      - path <string>


  ## 5.18. rpc show-default-local-dir
  -----------------------------------

    Show the path to the default directory where the YANG files are to be copied. I.e <path to current
    NED package>/src/yang.

      No input arguments


  ## 5.19. rpc show-loaded-schema
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


  ## 5.20. rpc verify-get-config
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


  ## 5.21. rpc xpath-trace-analyzer
  ---------------------------------

    A tool for analyzing NSO XPath traces, designed to identify inefficient or problematic XPath
    expressions in third-party YANG files that may negatively impact NSO performance.

      Input arguments:

      - file <string> (default logs/xpath.trace)

        Path to the NSO xpath trace file to use. The xpath trace file used by the current NSO will be
        used by default.


      - number-of-entries <uint8> (default 10)

        Set the number of entries to display in the generated top list.

  ---

  Configuration of CLI interaction through 'live-status exec any <cli-cmd>'.

  In case the default values are different, set these ned-settings before using live-status actions:

  > ned-settings harmonic-cableos_nc live-status cli port 22
  > ned-settings harmonic-cableos_nc live-status cli prompt-pattern "^[\w@]+(\(\w+\))?[>#][ ]*$"
  > ned-settings harmonic-cableos_nc live-status cli no-pagination-cmd "paginate false"
  > commit

  > ned-settings harmonic-cableos_nc live-status cli auto-prompts 1 question "(?is)reboot.*warning.*\?\s*\[\s*yes\s*[/,]\s*no\s*\]\s*[:\s]*$" answer no
  > ned-settings harmonic-cableos_nc live-status cli auto-prompts 2 question "(?i).*\?\s*\[\s*yes\s*[/,]\s*no\s*\]\s*[:\s]*$" answer yes
  > commit

  To use the NED for live-status commands only, set the following ned-setting:

  > ned-settings harmonic-cableos_nc connection connection-mode live-status-only
  > commit

  ---


# 6. Built in live-status show
------------------------------

  NONE


# 7. Limitations
----------------

  NONE


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
     admin@ncs(config)# devices device dev-1 ned-settings harmonic-cableos_nc logging level debug
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
  > devices device dev-1 ned-settings harmonic-cableos_nc logger level debug
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


# 11. Using the NED for Telemetry

## Introduction

This NED supports subscribing to telemetry events using the telemetry feature introduced in NSO 6.7. With this capability, NSO can act as a telemetry subscriber towards managed devices, enabling powerful automation patterns at the service layer — such as feedback loops that provision configuration on a device and then automatically react when that configuration becomes active.

### Prerequisites

- The NED is used together with **NSO 6.7** or newer.
- The managed device supports the **YANG-Push (RFC 8641)** extension for NETCONF.

### Restrictions

The NSO telemetry feature is designed to assist with provisioning — for example, by receiving automatic notifications when a provisioned configuration becomes active. It is generally not intended for high-frequency telemetry data reception.

### Background: YANG-Push (RFC 8641)

**YANG-Push** is an IETF-standardized protocol defined in [RFC 8641](https://datatracker.ietf.org/doc/html/rfc8641). It extends the NETCONF and RESTCONF protocols with the ability for a client to establish *subscriptions* on a YANG datastore, causing the device to stream updates back to the subscriber without repeated polling.

YANG-Push builds on the concepts introduced in the *Subscription to YANG Notifications* framework ([RFC 8639](https://datatracker.ietf.org/doc/html/rfc8639)) and supports two complementary subscription modes:

| Mode          | Behavior                                                     |
| :------------ | :----------------------------------------------------------- |
| **Periodic**  | The device sends a complete snapshot of all data under the subscribed path at a fixed interval. Useful for counters, statistics, and any data that changes frequently and continuously. |
| **On-Change** | The device sends an update *only* when something changes under the subscribed path. Useful for configuration state, session tables, or protocol status fields where changes are discrete events. Note that not all devices support on-change subscriptions across every part of their schema. |

Key characteristics of the protocol include:

- **Datastore awareness** — Subscriptions target a specific YANG datastore (e.g., `running`, `operational`, `candidate`), giving precise control over what kind of data is observed.
- **Filtering** — Subscriptions can be narrowed using XPath or subtree filters so that only relevant portions of the datastore are streamed.
- **Dampening** — On-change subscriptions support a dampening period that aggregates rapid-fire changes into fewer, consolidated updates.
- **Sync-on-start** — On-change subscriptions can optionally deliver a full initial snapshot when the subscription is first established, ensuring the subscriber has a known baseline.

By leveraging YANG-Push through this NED, NSO gains a real-time, event-driven view of device state — a foundation for building closed-loop automation and reactive service logic.



## Configuring a Telemetry Subscription

Telemetry subscriptions are configured under each device's `telemetry` container:

```none
/devices/device/<name>/telemetry/subscription/<name>
```

You can set up one or more subscriptions per device. Each subscription must specify, at a minimum, a **datastore**, a **subscription mode** (`periodic` or `on-change`), and a **path** (XPath or subtree filter) pointing to the location of interest in the device schema.



### General YANG-Push Subscription Settings

| Setting                      | Description                                                  |
| :--------------------------- | :----------------------------------------------------------- |
| `name`                       | Subscription name (used as the list key).                    |
| `local-user`                 | The NSO user whose authentication credentials are used when connecting to the device for the telemetry session. |
| `datastore`                  | Target datastore to subscribe to (e.g., `running`, `operational`). |
| `xpath`                      | XPath filter pointing to the path of interest in the device schema. |
| `subtree`                    | Subtree filter — an alternative to `xpath` for specifying the path of interest. |
| `periodic`                   | Enables **periodic** mode. The device sends a full snapshot of data under the subscribed path at regular intervals. |
| `periodic/period`            | Update interval in centiseconds. Mandatory when using periodic mode. |
| `periodic/anchor-time`       | Optional anchor time for aligning the periodic interval.     |
| `on-change`                  | Enables **on-change** mode. The device sends an update only when a node under the subscribed path has changed. Note that on-change may only be supported for certain parts of the device schema. |
| `on-change/dampening-period` | Minimum time between consecutive updates, in centiseconds.   |
| `on-change/sync-on-start`    | Whether to send a full synchronization snapshot when the subscription is first established. Default: `true`. |
| `on-change/excluded-change`  | Change types to exclude from notifications: `create`, `delete`, `insert`, `move`, `replace`. |
| `reconnect-interval`         | How often (in seconds) to retry a failed subscription. Default: `60`. |
| `setting`                    | A list of key/value pairs for NED-specific settings (see below). |



### NED-Specific Settings

The following settings are configured in the `setting` list. Because this list accepts arbitrary key/value string pairs, it is important that both keys and values are spelled **exactly** as shown below.

| Key                            | Description                                                  |
| :----------------------------- | :----------------------------------------------------------- |
| `rate-limit-period`            | Rate-limit period in centiseconds. When set, the NED ensures that telemetry messages are not forwarded to NSO more frequently than this interval. This is intended as a safeguard against excessively high-frequency updates (e.g., from a misbehaving device). Disabled by default. |
| `rate-limit-drop-log-interval` | Controls how often dropped telemetry events are logged when rate limiting is active. Default: `50`. |
| `force-raw`                    | When set to `true`, the NED delivers telemetry events to NSO as raw, unparsed YANG-Push messages instead of model-driven data. By default, telemetry events are parsed by NSO and populated into a synthetic transaction, which allows services to perform standard operations such as diff iteration using the `Maagic` API. In some cases it may be preferable to receive the raw data and handle parsing in the service itself. When raw mode is active, the data is made available at: `/devices/device/<name>/telemetry/subscription/<name>/raw-telemetry` |



## Examples

The following examples show how to configure telemetry subscriptions through the NSO CLI.

### Example 1: On-Change Subscription with Rate Limiting

This subscription monitors the interfaces subtree in the `running` datastore and applies a rate limiter to prevent excessive updates.

```shell
ncs(config)# devices device dev0 telemetry subscription intf-changes \
    local-user admin \
    datastore running \
    xpath /r:sys/r:interfaces \
    on-change \
    setting rate-limit-period value 20
ncs(config-subscription-intf-changes)# commit
```

### Example 2: Periodic Subscription with Raw Delivery

This subscription polls the interfaces subtree in the `operational` datastore every 10 seconds (1000 centiseconds) and delivers the data as raw YANG-Push messages.

```shell
ncs(config)# devices device dev0 telemetry subscription intf-poll \
    local-user admin \
    datastore operational \
    xpath /r:sys/r:interfaces \
    periodic period 1000 \
    setting force-raw value true
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


# 12. Run arbitrary commands on device
--------------------------------------

  Some commands that are available to a user logged in to an interactive CLI
  session on the device might not be available through NETCONF. For situations
  like this the NED provides the feature to run arbitrary commands through an
  interactive SSH login to the device. This SSH session is handled internally in
  the NED and connected in NSO to a live-status action called 'exec any'.

  There are some ned-settings to control the behaviour of this feature, see the
  section 'ned-settings harmonic-cableos_nc live-status cli' in
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
