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
  6. Built in live-status show
  7. Limitations
  8. How to report NED issues and feature requests
  9. How to rebuild a NED
  10. Configure the NED to use ssh multi factor authentication
  11. Custom XML transforms
      11.1 filter-exclude-config
      11.2 filter-by-version
      11.3 filter-leaf
      11.4 reorder-keys
      11.5 edit-full-delete
      11.6 edit-op
      11.7 hidden-config
      11.8 redeploy-on-edit
      11.9 remove-before-edit
      11.10 redeploy-parent-on-edit + redeploy-point
      11.11 replace-all-leaf-list|long-obu-diff-leaf-list
      11.12 diff-set|delete-before|after
  12. Run arbitrary commands on device
  13. Huawei specific XML transforms
  ```


# 1. General
------------

  This document describes the huawei-vrp_nc NED.

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
  +-------+---------+----+------+
  | Model | Version | OS | Info |
  +-------+---------+----+------+
  +-------+---------+----+------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-huawei-vrp_nc-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-huawei-vrp_nc-1.0.1.signed.bin
      > ./ncs-6.0-huawei-vrp_nc-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-huawei-vrp_nc-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-huawei-vrp_nc-1.0.1.tar.gz
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
     `huawei-vrp_nc-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-huawei-vrp_nc-1.0.1.tar.gz
     > ls -d */
     huawei-vrp_nc-gen-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package huawei-vrp_nc-gen-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package huawei-vrp_nc-gen-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-huawei-vrp_nc-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package huawei-vrp_nc-gen-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/huawei-vrp_nc-gen-1.0
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
               /tmp/ned-package-store/ncs-6.0-huawei-vrp_nc-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-huawei-vrp_nc-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install huawei-vrp_nc-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-huawei-vrp_nc-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-huawei-vrp_nc-gen-1.0
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
    admin@ncs(config)# devices device dev-1 device-type generic ned-id huawei-vrp_nc-gen-1.0
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

  `$NSO_RUNDIR/logs/ned-huawei-vrp_nc-gen-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings huawei-vrp_nc logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings huawei-vrp_nc logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.vrp \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings huawei-vrp_nc logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings huawei-vrp_nc logger java true
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


      - count <empty>

        Count the nodes and return the sum instead of the full list of nodes.


      - root-paths <string>

        Specify root paths for which nodes shall be listed or counted. Only nodes with a schema path
        starting any of the specified roots will then be processed.


      - details <empty>

        Display schema details like must/when expression, leafrefs and leafref targets.


      - config <true|false> (default true)

        Set to false to display non config nodes in the schema. Note: scope will in this case be
        'all'.


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


# 6. Built in live-status show
------------------------------

  NONE


# 7. Limitations
----------------

    Limitations related to fetching operational data via the live-status API:

    NSO prior to version 5.6 can not handle lists defined in YANG as config false
    but with no key node specified.  Consequently the NED is not able to populate
    operational data that maps to such lists.

    Some config is not freely editable, marked in the yang-models with the
    proprietary extension 'operation-exclude'. This can sometimes be workaround
    using the ned-setting 'transaction inject-meta-data' as described in 'Huawei
    specific XML transforms'.

    On some device models/versions, some config is left out when fetched with the
    get-config RPC using only top-nodes as filter, as described in the ned-setting
    'extra-get-config-paths' this can be mitigated. Please note that since this is
    clearly a bug in the device, there is no guarantee that this will always work,
    Cisco has only discovered the mentioned problem.

    For example on certain devices, not all config under
    /l2vpn/instances/instance/vpls/bds is included when doing a get-config,
    filtering for /l2vpn, hence the below extra ned-setting is needed if this
    config is to be used from NSO:

      huawei-vrp_nc transaction extra-get-config-paths /l2vpn:l2vpn/instances/instance


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
     admin@ncs(config)# devices device dev-1 ned-settings huawei-vrp_nc logging level debug
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
  > devices device dev-1 ned-settings huawei-vrp_nc logger level debug
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

# 11. Custom XML transforms
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
  described in section 'Advanced: repairing YANG modules' in the README-rebuild.md,
  or at run-time through the ned-setting 'transaction inject-meta-data'
  (which can take key-paths).

  The built-in transforms that can be referred are listed below. Note that each
  transform is declared to work under certain constraints, regarding 'direction'
  (i.e. to or from device), what type of yang node it can operate on, and so on.


## 11.1 filter-exclude-config
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


## 11.2 filter-by-version
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


## 11.3 filter-leaf
-------------------

  This transform can filter out leaf values which are either invalid, or has the
  default value declared in the yang module. It works as a combination of the
  ned-settings transaction/filter-invalid-values=true and the
  capabilities/defaults-mode-override=trim but only for the leaf node where this
  meta-data is applied. The mandatory meta-value can be either of:

      filter-invalid              Will filter invalid values
      trim-default                Will filter default values
      filter-invalid,trim-default Will filter both invalid and default values


## 11.4 reorder-keys
--------------------

  This transform can be used where a device gives data in a non-compliant format
  where list keys are either out-of-order or not the first elements in the XML,
  i.e. where the XML needs to be re-ordered before being validated against the
  yang schema. It takes no meta-value and should be placed on the problematic
  list node(s) in the schema.


## 11.5 edit-full-delete
------------------------

  This transform can be used when a device acts in a non-compliant way, where a
  container needs to be deleted instead of its contents. It can be needed where
  a device doesn't want a reachable default value set back instead of it being
  deleted, which is how NSO normally 'clears' a value which is to be deleted,
  and which has a default value declared.


## 11.6 edit-op
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


## 11.7 hidden-config
---------------------

  This transform can be used if device contains config that can be set, but
  which is not reflected in the running configuration. It can be used on leaf
  and leaf-list nodes. When the annotated node is set from NSO, it is always
  echoed back from the NED to NSO as if the device contains the value. It works
  like the annotation tailf:ned-ignore-compare-config, but can also be used on
  leaf-list nodes. The only difference is that from NSO perspective the data
  looks as if it is actually present on device.


## 11.8 redeploy-on-edit
------------------------

  With this transform added on a node in the schema, the node and its children
  will be redeployed in full when edited (i.e. as if the whole content doesn't
  exist on device). This means that if the node is present in the edit-config,
  its contents in the edit-config will be replaced with the full content in the
  to-transaction. This is useful if the device has the non-compliant behaviour
  as if 'replace' is implied on the node, i.e. the device resets all the node's
  content to only include the contents in the edit-config, which results in NSO
  becoming out-of-sync if not all contents are redeployed in the edit.


## 11.9 remove-before-edit
--------------------------

  This transform will inject a delete of the annotated node when it appears in
  an edit-config. This can be useful if the device has the non-compliant
  behaviour that the contents of a node can not be edited if not first cleared
  in the same edit.

  This annotation can also take the meta-value argument 'delayed-commit', see
  'redeploy-point' for more info on this.

## 11.10 redeploy-parent-on-edit + redeploy-point
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
  must be used with great care, and is not guaranteed to work.

  NOTE: If using 'delayed-commit', the ned-setting 'transaction
  force-revert-diff' must be enabled to ensure that config is rolled back
  correctly to compensate for the intermediate commit done.


## 11.11 replace-all-leaf-list|long-obu-diff-leaf-list
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
  edited by adding/deleting members, hence the resulting edit for a re-order
  will first remove all elements from the first inserted element, then the rest
  of the elements will be added in correct order, as if being added for the
  first time. As with 'replace-all-leaf-list', this can potentially also result
  in a very large edit-config.


## 11.12 diff-set|delete-before|after
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
  customize-schema.schypp file to achieve the needed re-ordering:

    add /mef-egress-qos:egress-qos/scheduler::tailf:meta-data "diff-set-before:../queue-group";

  This will have the effect that whenever both scheduler and queue-group are
  present in an edit-config, scheduler will be set before queue-group.


# 12. Run arbitrary commands on device
--------------------------------------

  Some commands that are available to a user logged in to an interactive CLI
  session on the device might not be available through NETCONF. For situations
  like this the NED provides the feature to run arbitrary commands through an
  interactive SSH login to the device. This SSH session is handled internally in
  the NED and connected in NSO to a live-status action called 'exec any'.

  There are some ned-settings to control the behaviour of this feature, see the
  section 'ned-settings huawei-vrp_nc live-status cli' in
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

# 13. Huawei specific XML transforms
------------------------------------

  This NED contains two XML transforms specific to proprietary Huawei
  behaviour. These two are used to point out nodes that can not be edited or
  deleted, in need of a non-standard workaround (i.e. this is not in compliance
  with the netconf standard). The workaround handle this by changing the
  contents of the standard edit-config rpc into a two-step delete/redeploy
  operation. The 'redeploy-parent-on-edit' can for example be put on a leaf,
  typically marked with the proprietary Huawei extension
  'ext:operation-exclude', then some parent node needs to be marked as the point
  in the config where redeployment needs to happen, this is done with the
  'redeploy-point' annotation.

  Please note that the 'redeploy-point' described here can be arbitrary, or it
  might not work at all, there is no guarantee that this can be solved in all
  cases since it depends on limitations in the device.

  An example of usage of these through ned-settings:

    huawei-vrp_nc transaction inject-meta-data 1 path /l2vpn/instances/instance meta-data redeploy-point
    huawei-vrp_nc transaction inject-meta-data 2 path /l2vpn/instances/instance/vpws-ldp/pws/pw/pw-id meta-data redeploy-parent-on-edit
    huawei-vrp_nc transaction inject-meta-data 3 path /l2vpn/instances/instance/vpws-ldp/pws/pw/peer-ip meta-data redeploy-parent-on-edit

  NOTE: The index in the list is just an enumeration of all the 'injections', the
  value/order of these is not important (see README-ned-settings.md for more
  info on inject-meta-data).

  The same injection can also be done statically at compile-time with the
  customize-schema.schypp file (see README-rebuild.md section 4 for more on
  this). To inject the needed meta-data for the above example, add the below
  lines to src/customize-schema.schypp:

    add /l2vpn/instances/instance::tailf:meta-data redeploy-point;
    add /l2vpn/instances/instance/vpws-ldp/pws/pw/pw-id::tailf:meta-data redeploy-parent-on-edit;
    add /l2vpn/instances/instance/vpws-ldp/pws/pw/peer-ip::tailf:meta-data redeploy-parent-on-edit;
