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
     5.2. rpc compile-modules
     5.3. rpc export-package
     5.4. rpc get-modules
     5.5. rpc list-modules
     5.6. rpc list-profiles
     5.7. rpc patch-modules
     5.8. rpc rebuild-package
     5.9. rpc show-default-local-dir
     5.10. rpc show-loaded-schema
     5.11. rpc xpath-trace-analyzer
  6. Built in live-status show
  7. Limitations
  8. How to report NED issues and feature requests
  9. How to rebuild a NED
  10. Using NETSIM for testing
  11. Solutions for non-standard TAPI issues
  ```


# 1. General
------------

  This document describes the onf-tapi_rc NED.

  This is a multi vendor RESTCONF NED that can be used to manage devices supporting the ONF TAPI YANG models.

  The NED has been successfully tested with the following TAPI enabled devices:
   - ADVA Ensemble Controller version 12.3.1
   - INFINERA TNMS TR-NBI Transport Controller R4.20.0.1388.0 (SW v18.10.2.51.0)
   - NOKIA NRC-T version 22.6 (IMPORTANT: older versions of NRC-T do require a separate NED: nokia-nrct)
   - CIENA MCP 7.2 (using TAPI v2.4)

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
  | netsim                    | yes       | See README.md for further info on how to configure the NED to    |
  |                           |           | use netsim as a RESTCONF target.                                 |
  |                           |           |                                                                  |
  | check-sync                | yes       | Disabled by default. Can be enabled on devices that meet certain |
  |                           |           | requirements. See README-ned-settings.md for further info.       |
  |                           |           |                                                                  |
  | partial-sync-from         | yes       |                                                                  |
  |                           |           |                                                                  |
  | live-status actions       | yes       | The standard action get-any is supported                         |
  |                           |           |                                                                  |
  | live-status show          | yes       |                                                                  |
  |                           |           |                                                                  |
  | load-native-config        | no        |                                                                  |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Adva Ensemble Controller  | 12.3.1          |        |                                                   |
  |                           |                 |        |                                                   |
  | Ciena MCP                 | 7.2             |        | Experimental support                              |
  |                           |                 |        |                                                   |
  | Ciena NCS                 | 9.1             |        | Formerly named MCP. Experimental support          |
  |                           |                 |        |                                                   |
  | Infinera TNMS TR-NBI      | R4.20.0.1388.0  |        |                                                   |
  | Transport Controller      |                 |        |                                                   |
  |                           |                 |        |                                                   |
  | Nokia NRC-T               | 22.6            |        | IMPORTANT: older versions of NRC-T do require a   |
  |                           |                 |        | separate NED: nokia-nrct                          |
  |                           |                 |        |                                                   |
  | Kratos Openspace          | 1.0.0.30        |        | Experimental support. Only tested using a         |
  |                           |                 |        | OpenSpace mock server.                            |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```

  Verified YANG model bundles
  ```
  +---------------------------+-----------------+------------------------------------------------------------+
  | Bundle                    | Version         | Info                                                       |
  +---------------------------+-----------------+------------------------------------------------------------+
  | ONF TAPI                  | 2.1.3           |                                                            |
  |                           |                 |                                                            |
  | ONF TAPI                  | 2.4.0           | Used Ciena MCP 7                                           |
  |                           |                 |                                                            |
  | ONF TAPI                  | 2.5.0           | Used Ciena NCS 9                                           |
  +---------------------------+-----------------+------------------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-onf-tapi_rc-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-onf-tapi_rc-1.0.1.signed.bin
      > ./ncs-6.0-onf-tapi_rc-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-onf-tapi_rc-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-onf-tapi_rc-1.0.1.tar.gz
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
     `onf-tapi_rc-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-onf-tapi_rc-1.0.1.tar.gz
     > ls -d */
     onf-tapi_rc-gen-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package onf-tapi_rc-gen-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package onf-tapi_rc-gen-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-onf-tapi_rc-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package onf-tapi_rc-gen-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/onf-tapi_rc-gen-1.0
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
               /tmp/ned-package-store/ncs-6.0-onf-tapi_rc-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-onf-tapi_rc-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install onf-tapi_rc-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-onf-tapi_rc-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-onf-tapi_rc-gen-1.0
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
    admin@ncs(config)# devices device dev-1 device-type generic ned-id onf-tapi_rc-gen-1.0
    admin@ncs(config)# devices device dev-1 state admin-state unlocked
    admin@ncs(config)# devices device dev-1 authgroup my-group
    ```
    **IMPORTANT**:

    The *device-type* shall always be set to *generic* when configuring a device instance
    to use a 3PY NED. A common mistake is configuring it as *netconf*, which will cause
    NSO to use its internal netconf client instead.


  Additional configurations:

  - SSL/TLS:

    Set up SSL/TLS configurables if needed.

    Enable TLS:

    Configure Server TLS authentication:

     Alt 1:

      Accept any SSL certificate presented by the device. This is unsafe and should only be used for
      testing purposes.

      In the NSO CLI:
      ```
      # devices device dev-1 ned-settings onf-tapi_rc connection ssl accept-any true
      ```

    Alt 2:

      Configure a TLS/SSL certificate. Either a host certificate identifying the device or
      a self signed root CA. The certificate shall be entered in DER Base64 format, which
      is the same as the PEM format but without the banners \"----- BEGIN CERTIFICATE-----\"
      etc.

      Use the Unix tool 'openssl' to fetch the PEM certificate from a device:

      In a Unix shell:
      ```
      > openssl s_client -connect <device address>:<port>
      ```

      In the NSO CLI:
      ```
      # devices device dev-1 ned-settings onf-tapi_rc connection ssl certificate <enter>
      <The pasted Base64 binary>
      ```

  - Mutual TLS:

    Configure cerificate, private key and possibly key passphrase to be used by the NED
    to identify itself for the device.

    The certificate and private key shall be entered in DER Base64 format. I.e same as PEM
    format but without the banners  is the same as the PEM format but without the banners
    like \"----- BEGIN|END CERTIFICATE-----\", \"----- BEGIN|END PRIVATE KEY-----\" etc

    In the NSO CLI:

    ```
    # devices device dev-1 ned-settings onf-tapi_rc connection ssl mtls client certificate <enter>
    <The pasted Base64 certificate binary>

    # devices device dev-1 ned-settings onf-tapi_rc connection ssl mtls client private-key <enter>
    <The pasted Base64 private key binary>

    Optionally:
    # devices device dev-1 ned-settings onf-tapi_rc connection ssl mtls client key-password <password>
    ```

  - Authentication:

    TAPI devices from different vendors use different authentication mechanisms. The NED needs
    to be configured accordingly via the appropriate NED settings. See chapter 7 for
    verified examples. See README-ned-settings.md has further info about all NED settings.

  - Customize RESTCONF settings:

    The NED needs to be configured to work with the certain TAPI device it shall connect to.
    This needs to be done by configuring the RESTCONF specific NED settings.
    Either select a predefined RESTCONF profile in the NED settings or configure everything
    manually.

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

  `$NSO_RUNDIR/logs/ned-onf-tapi_rc-gen-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings onf-tapi_rc logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings onf-tapi_rc logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.onftapi \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings onf-tapi_rc logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings onf-tapi_rc logger java true
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

  This section show some example configurations that have been verified with TAPI devices
  from certain vendors.

  Important: Some device versions can not show capabilities through the RESTCONF API.
  Then it is necessary to inject the YANG model names manually as an additional step.
  See chapter 1.1 in README-rebuild.md for further info.

  CIENA MCP:
  Uses a bearer token authentication mechanism.

  ```
  devices authgroups group ciena-mcp-0
   default-map remote-name foo
   default-map remote-password bar
  !
  devices device ciena-mcp-0
  address <ip address>
  port <port>
  authgroup ciena-mcp-0
  device-type generic ned-id onf-tapi_rc-gen-2.0
  state admin-state unlocked
  ned-settings onf-tapi_rc connection authentication method bearer-token
  ned-settings onf-tapi_rc connection authentication mode probe
  ned-settings onf-tapi_rc connection authentication token-request url /tron/api/v1/tokens
  ned-settings onf-tapi_rc connection authentication token-request port 443
  ned-settings onf-tapi_rc connection ssl accept-any true
  ned-settings onf-tapi_rc restconf profile ciena-mcp
  ```

  The following additional NED settings are optional but will help to workaround various
  issues with the CIENA MCP device. See the README-ned-settings.md for further info on
  each of them.

  ```
  ned-settings onf-tapi_rc restconf deviations automatic-uuid-mapping do-automatic-delete true
  ned-settings onf-tapi_rc restconf deviations do-restore-end-point-list-keys true
  ned-settings onf-tapi_rc restconf deviations do-restore-end-point-list-layer-protocol-constraint-keys true
  ned-settings onf-tapi_rc general config cache schema-path /tapi-common:context/tapi-connectivity:connectivity-context/connectivity-service nodes [ tapi-ciena-connectivity-service-extensions:osrp-enabled ]
  ned-settings onf-tapi_rc general config cache schema-path /tapi-common:context/tapi-connectivity:connectivity-context/connectivity-service/connectivity-constraint/requested-capacity/total-size nodes [ unit value ]
  ```

  The CIENA MCP device does not support being probed for the TAPI YANG models it supports,
  nor can the models be downloaded from the device. Instead, the NED has built-in support
  to automatically inject a list of the TAPI models supported. This feature is activated
  when the RESTCONF profile 'ciena-mcp' is configured in the NED settings.

  The CIENA MCP uses a combination of models from TAPI 2.4 along with CIENA specific extension
  and deviation modules. Currently, there is no known public repository hosting CIENA-specific files.
  This means that an archive file containing all models needs to be requested directly from CIENA.

  The CIENA-specific extensions are required when interacting with a MCP device. Therefore, it is
  not possible to use only vanilla TAPI models.

  Use the built-in downloader tool to load the YANG models into the NED from an the archive file provided by CIENA:

  Example:
  ```
  devices device netsim-0 rpc rpc-get-modules get-modules remote { archive /tmp/ciena-mcp-7.2-yang-models.zip }
  Fetching modules:
    tapi-common - urn:onf:otcc:yang:tapi-common (72535 bytes)
    tapi-connectivity - urn:onf:otcc:yang:tapi-connectivity (73898 bytes)
      fetching imported module tapi-notification
      fetching imported module tapi-path-computation
      fetching imported module tapi-streaming
      fetching imported module tapi-topology
    tapi-digital-otn - urn:onf:otcc:yang:tapi-digital-otn (71020 bytes)
      fetching imported module tapi-oam
      fetching imported module tapi-dsr
    tapi-dsr - urn:onf:otcc:yang:tapi-dsr (12336 bytes)
    tapi-equipment - urn:onf:otcc:yang:tapi-equipment (66260 bytes)
    tapi-eth - urn:onf:otcc:yang:tapi-eth (164279 bytes)
    tapi-fm - urn:onf:otcc:yang:tapi-fm (28732 bytes)
    tapi-notification - urn:onf:otcc:yang:tapi-notification (32188 bytes)
    tapi-oam - urn:onf:otcc:yang:tapi-oam (78361 bytes)
    tapi-path-computation - urn:onf:otcc:yang:tapi-path-computation (38130 bytes)
    tapi-photonic-media - urn:onf:otcc:yang:tapi-photonic-media (91238 bytes)
    tapi-streaming - urn:onf:otcc:yang:tapi-streaming (65762 bytes)
    tapi-topology - urn:onf:otcc:yang:tapi-topology (72769 bytes)
    tapi-virtual-network - urn:onf:otcc:yang:tapi-virtual-network (21933 bytes)
    ciena-photonic-extensions - urn:ciena:yang:ciena-photonic-extensions (2777 bytes)
    tapi-ciena-alternativephysicalrouteext - urn:ciena:yang:tapi-ciena-alternativephysicalrouteext (2925 bytes)
    tapi-ciena-connection-endpoint-extensions - urn:ciena:yang:tapi-ciena-connection-endpoint-extensions (15674 bytes)
    tapi-ciena-connection-extensions - urn:ciena:yang:tapi-ciena-connection-extensions (2126 bytes)
    tapi-ciena-connectivity-service-extensions - urn:ciena:yang:tapi-ciena-connectivity-service-extensions (7568 bytes)
    tapi-ciena-detector-info - urn:ciena:yang:tapi-ciena-detector-info (7706 bytes)
    tapi-ciena-device-extensions - urn:ciena:yang:tapi-ciena-device-extensions (836 bytes)
    tapi-ciena-link-extensions - urn:ciena:yang:tapi-ciena-link-extensions (910 bytes)
    tapi-ciena-lldp-extensions - urn:ciena:yang:tapi-ciena-lldp-extensions (1863 bytes)
    tapi-ciena-node-extensions - urn:ciena:yang:tapi-ciena-node-extensions (1734 bytes)
    tapi-ciena-protocol-extensions - urn:ciena:yang:tapi-ciena-protocol-extensions (3499 bytes)
  fetched and saved 25 yang module(s) to /Users/jrendel/work/ned/onf-tapi_rc/src/yang
  ```

  NOKIA NRC-T:
  Uses a bearer token authentication mechanism.

  ```
  devices authgroups group nokia-nrct-0
   default-map remote-name foo
   default-map remote-password bar
  !
  devices device nokia-nrct-0
  address <ip address>
  port 8543
  authgroup nokia-nrct-0
  device-type generic ned-id onf-tapi_rc-gen-2.0
  state admin-state unlocked
  ned-settings onf-tapi_rc connection authentication method bearer-token
  ned-settings onf-tapi_rc connection authentication mode probe
  ned-settings onf-tapi_rc connection authentication token-request url /rest-gateway/rest/api/v1/auth/token
  ned-settings onf-tapi_rc connection authentication token-request port 443
  ned-settings onf-tapi_rc connection ssl accept-any true
  ned-settings onf-tapi_rc restconf profile nokia-nrct
  ```

  The NOKIA NRC-T device does not support being probed for the TAPI YANG models supported nor can
  the models be downloaded from the device. The NED has instead built-in support to automatically
  inject a list with the TAPI models supported. This feature is activated when the restconf profile
  'nokia-nrct' has been configured in the NED settings.

  Use the built-in downloader tool to fetch the TAPI YANG models with revision 2.1.3 matching the
  NOKIA NRC-T device.  Example:

  ```
  admin@ncs# devices device netsim-0 rpc rpc-get-modules get-modules profile onf-tapi-from-git
  result
  Fetching modules:
    tapi-common - urn:onf:otcc:yang:tapi-common (33575 bytes)
    tapi-connectivity - urn:onf:otcc:yang:tapi-connectivity (40478 bytes)
      fetching imported module tapi-path-computation
      fetching imported module tapi-topology
    tapi-dsr - urn:onf:otcc:yang:tapi-dsr (11896 bytes)
    tapi-equipment - urn:onf:otcc:yang:tapi-equipment (33254 bytes)
    tapi-eth - urn:onf:otcc:yang:tapi-eth (93152 bytes)
      fetching imported module tapi-oam
    tapi-notification - urn:onf:otcc:yang:tapi-notification (23864 bytes)
    tapi-oam - urn:onf:otcc:yang:tapi-oam (30409 bytes)
    tapi-odu - urn:onf:otcc:yang:tapi-odu (45327 bytes)
    tapi-path-computation - urn:onf:otcc:yang:tapi-path-computation (19628 bytes)
    tapi-photonic-media - urn:onf:otcc:yang:tapi-photonic-media (52848 bytes)
    tapi-topology - urn:onf:otcc:yang:tapi-topology (48385 bytes)
    tapi-virtual-network - urn:onf:otcc:yang:tapi-virtual-network (13276 bytes)
  fetched and saved 12 yang module(s) to /Users/jrendel/work/ned/onf-tapi_rc/test/drned/drned-ncs/packages/onf-tapi_rc/src/yang
  ```


  INFINERA TNMS:
  Uses a bearer token authentication mechanism.

  ```
  devices authgroups group infinera-tapi-0
    default-map remote-name foo
    default-map remote-password bar
  !
  devices device infinera-tapi-0
    address <ip address>
    port 7080
    authgroup infinera-tapi-0
    device-type generic ned-id onf-tapi_rc-gen-2.0
    trace     raw
    state admin-state unlocked
    ned-settings onf-tapi_rc connection authentication method bearer-token
    ned-settings onf-tapi_rc connection authentication mode probe
    ned-settings onf-tapi_rc connection authentication token-request username-parameter user
    ned-settings onf-tapi_rc connection ssl accept-any true
    ned-settings onf-tapi_rc restconf profile infinera-tnms
  ```

  ADVA Ensemble Controller:
  Uses basic authentication.

  ```
  devices authgroups group adva-tapi-0
    default-map remote-name foo
    default-map remote-password bar
  !
  devices device adva-tapi-0
    address <ip address>
    port 7080
    authgroup adva-tapi-0
    device-type generic ned-id onf-tapi_rc-gen-2.0
    trace     raw
    state admin-state unlocked
    ned-settings onf-tapi_rc connection authentication method basic
    ned-settings onf-tapi_rc connection ssl accept-any true
    ned-settings onf-tapi_rc restconf profile adva-ensemble
  ```



  KRATOS OpenSpace:

  Uses no authentication.

  The OpenSpace device is using the MEF PRESTO YANG models, which is an extension of the TAPI models.

  Unfortunately it is not the standard MEF PRESTO models. The KRATOS company has instead done special customized versions of the models. These models must be fetched directly from KRATOS before the NED can be rebuilt.

  ```
  devices device kratos-1
   address   <ip address>
   port      <port>
   authgroup default
   device-type generic ned-id onf-tapi_rc-gen-2.0
   trace     raw
   ned-settings onf-tapi_rc connection authentication method none
   ned-settings onf-tapi_rc restconf profile kratos-openspace
   ned-settings onf-tapi_rc logger level debug
   state admin-state unlocked
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


  ## 5.2. rpc compile-modules
  ---------------------------

    Compile YANG modules, showing all non-fatal warnings found.

      Input arguments:

      - local-dir <string>

        Path to the directory where the YANG files are found (defaults to src/yang in package).


      - no-deviations <empty>

        Set to disable deviations.


  ## 5.3. rpc export-package
  --------------------------

    Export the customized and rebuilt NED. The exported archive file can then be used to install the
    NED package in other NSO instances. The name of the file will have the following format ncs-<NSO
    version>-<NED name>-<NED-version>-customized.tgz.

      Input arguments:

      - destination <string> (default /tmp)

        Set destination directory for the exported archive file.


      - suffix <string> (default -customized)

        Configure a customized suffix to the name of the archive file.


  ## 5.4. rpc get-modules
  -----------------------

    Fetch the YANG modules advertised by the device, from device or given source.

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


  ## 5.5. rpc list-modules
  ------------------------

    Use this command to list the YANG modules advertised by the device. Returns a list with module
    names, including revision tag if available.

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


      - module-additional-include-regex <string>

        Regular expression matching additional YANG models that are not advertised by the device. For
        instance vendor specific deviation models. Example: cisco-nx-openconfig-deviations.*.


      - module-additional-exclude-regex <string>

        Regular expression matching exceptions from the additional-include-regex.


      - profile <union>

        Use a download profile to match a predefined subset of matching YANG files.


  ## 5.6. rpc list-profiles
  -------------------------

    List all predefined download profiles bundled with the NED. Including a short description of each.

      No input arguments


  ## 5.7. rpc patch-modules
  -------------------------

    Patch YANG modules, to remove non-fatal warnings found.

      Input arguments:

      - local-dir <string>

        Path to the directory where the YANG files are found (defaults to src/yang in package).


      - no-deviations <empty>

        Set to disable deviations.


      - output-dir <string>

        Path to the directory where the patched YANG files are written (defaults to src/yang in
        package), existing files will be renamed to <name>.yang.orig.


  ## 5.8. rpc rebuild-package
  ---------------------------

    Rebuild the NED package directly from within NSO. This invokes the gnu make internally.

      Input arguments:

      - verbose <empty>

        Print the full build output also for successful builds (otherwise only printed on errors).


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


  ## 5.9. rpc show-default-local-dir
  ----------------------------------

    Show the path to the default directory where the YANG files are to be copied. I.e <path to current
    NED package>/src/yang.

      No input arguments


  ## 5.10. rpc show-loaded-schema
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


      - developer generate-schypp-pragmas pattern <string>

        Configure the pattern to search for matching statements. Use ".*" to match any string.


      - developer generate-schypp-pragmas replace-with <string>

        For replace pragmas, set replacement for statements matching the pattern.


      - developer generate-schypp-pragmas add-comment <empty>

        Prepend extra comment containing info about the statement.


  ## 5.11. rpc xpath-trace-analyzer
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

  The ONF TAPI NED has full support for fetching TAPI operational data via the NSO live-status API.


# 7. Limitations
----------------

  Limitations related to fetching operational data via the live-status API:

  1. NSO 5.5.x and older can not handle lists defined in YANG as config false but with no key node specified.
     Consequently the NED is not able to populate operational data that maps to such lists.

     Example from the TAPI models of a list with no key node specified:

      ```
      list pin-and-role {
         config false;
         uses pin-and-role;
      }
      ```

  2. When doing multiple fetch operations of operational data from for instance a service application
     on a NED configured to use custom call points it is recommended to use multiple read transactions.
     Otherwise there is a risk that the TTL cache used by NSO for operational data will play some tricks.

     For example, there is a TAPI use case where the list:
      /api-common:context/tapi-connectivity:connectivity-context/connection
     is populated by first fetching the keys from the list:
      /api-common:context/tapi-connectivity:connectivity-context/connectivity-service

     Corresponding call points would look like this:

     ```
     ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/tapi-connectivity:connectivity-context
      query fields "connectivity-service(uuid)"
     !
     ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/tapi-connectivity:connectivity-context/connection
      list-entry query unbounded
     !
     ```

     Step 1 is to fetch all uuid:s in the connectivity-service list
     Step 2 is to fetch the connection list entry for each uuid found in step 1

     It is necessary to execute step 1 and 2 using separate transaction i.e separate TTL caches. Otherwise
     there is a big risk that the calls in step 2 will result in no data being fetched. The reason is that
     the TTL cache in step 1 will contain an entry showing that the connection list is empty.

  Limitations related to the YANG model downloader tool:

     The "git repository" option does not work with NSO 5.5.x and older. This is because of a Java dependency to
     the sl4j library which is not bundled with older NSO versions.


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
     admin@ncs(config)# devices device dev-1 ned-settings onf-tapi_rc logging level debug
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


# 10. Using NETSIM for testing
-----------------------------

  NETSIM (ConfD) has a built in RESTCONF server and can easily be configured as a test device.

  Configure a NETSIM device instance in NSO like below:

  ```
  devices authgroups group netsim-0
  default-map remote-name admin
  default-map remote-password admin
  !
  devices device netsim-0
   address 127.0.0.1
   port 7080
   authgroup netsim-0
   device-type generic ned-id onf-tapi_rc-gen-2.0
   trace     raw
   state admin-state unlocked
   ned-settings onf-tapi_rc restconf profile netsim
  !
  ```



# 11. Solutions for non-standard TAPI issues

This NED supports a number of TAPI devices from different vendors. Each TAPI device type has its own characteristics, which usally means deviations from the TAPI models and/or from the RESTCONF protocol.

The NED can automatically adapt to most of the characteristics of a certain TAPI device if the appropriate RESTCONF profile is configured through the NED settings. If you for instance configure the profile *nokia-nrct* the NED will be in most cases be able to successfully interact with a Nokia NRC-T device.

Then there are still a number of non-standard issues that can occur which might require further setup of the NED.

This chapter describes the most common issues and how to solve them.



## 11.1 Devices with invalid number of end-points configured

The *end-point* list is an important part of each entry in connectivity-service list. According to the TAPI YANG models each connectivity service must contain at least two end-points:

```
list end-point {
  key 'local-id';
  min-elements 2;
  uses connectivity-service-end-point;
  description "none";
}
```

### Issue

Some devices do not obey the *min-elements 2* restriction at all. This means that the configuration dumps from such a device can contain connectivity services entries with no end-points at all. Trying to do a *sync-from* on such a configuration will make NSO bail out with an error that looks like below:

```
admin@ncs# devices device ciena-1 sync-from
result false
info too few devices device ciena-1 config context connectivity-context connectivity-service 3955f400-0352-11ee-96d1-3b198b99829e end-point, 0 configured, at least 2 must be configured
admin@ncs# exit

```

This issue does frequently happen on the following device types: *Ciena MCP*

### Solution #1

The NED can be configured to automatically filter all connectivity service entries that contain an invalid *end-point* list. The NED will then in runtime go through the config dumps received from the device and remove all invalid connectivity service entries before the data is passed to NSO.

One additional NED setting is required to enable this feature:

```
onf-tapi_rc restconf deviations do-filter-invalid-connectivity-services true
```

### Solution #2

An alternative to the solution described above is to relax the TAPI YANG models instead, meaning that the *min-elements 2* restriction is completely removed from the TAPI YANG models. This solution does require a full rebuild of the NED to work.

The NED is already equipped with utility that can patch the TAPI YANG models before they are compiled. An additional argument is required when rebuilding the NED (see README-rebuild.md for further info on how to rebuild the NED):

```
> cd $NED_ROOT_DIR/src
> make clean all APPLY_YPP_CUSTOM=do-profile-relaxed-tapi-models
```



## 11.2 Devices generating their own UUIDs

According to the TAPI YANG models a uuid is used as key element in the connectivity service list. The uuid to be used is selected by the provisioner (NSO) and then used by the device when the configuration is deployed.

### Issue

Some devices do not obey the rule that the uuid is selected by the provisioner. Such devices do instead create their own uuid. This kind of behaviour will immediately cause out of sync issues when a new connectivity service is provisioned through NSO:

```
admin@ncs(config-end-point-2)# commit dry-run outformat native
native {
    device {
        name netsim-0
        data RESTCONF POST :: http://127.0.0.1:52858/tapi/data/tapi-common:context/tapi-connectivity:connectivity-context/connectivity-service/
             {
                 "uuid":"1234-4567-91011",
                 "end-point":[{
                     "local-id":"1"
                 },{
                     "local-id":"2"
                 }]
             }
    }
}
admin@ncs(config-end-point-2)# commit
Commit complete.
admin@ncs(config-end-point-2)# compare-config
diff
 devices {
     device netsim-0 {
         config {
             context {
                 connectivity-context {
-                    connectivity-service 1234-4567-91011 {
-                        end-point 1;
-                        end-point 2;
-                    }
+                    connectivity-service 5555-4444-12345 {
+                        end-point 1;
+                        end-point 2;
+                    }
                 }
             }
         }
     }
 }
```

Since the device has created the entry using its own uuid on the connectivity service, it is not possible for NSO to rollback and delete the entry again. A sync-from after the commit will make NSO aware of the device generated uuid but it is usually not a good workaround.

This issue does frequently happen on the following device types: *Ciena MCP*, *Kratos Openspace*

### Solution

The NED can be configured to keep a map of the NSO generated uuids together with the corresponding device generated ones. As soon as a new connectivity service is deployed the NED will update the map with the uuid generated by NSO. The NED will then extract the uuid generated by the device and add that to the same map entry. The NED is then able to automatically convert between the two uuid types in runtime. When a sync-from is done, the device generated uuids are automatically replaced with the NSO generated ones etc.

The following additional NED settings do enable the automatic uuid map in the NED:

```
ned-settings onf-tapi_rc restconf deviations automatic-uuid-mapping do-enable true
```

The default behaviour of the uuid mapper is to keep the uuid entries in the map as long as they exist in NSO CDB. The NED automatically deletes the uuid from the map when it is deleted from CDB.

For some use cases it might be better to not let the NED delete the uuid entry automatically. For example if the deletion of a connectivity service takes a long while (which is the case for *Ciena MCP*) and you want to monitor state of it through live-status until it has vanished.

Configure the following NED setting to disable automatic deletion in the uuid map:

```
ned-settings onf-tapi_rc restconf deviations automatic-uuid-mapping do-automatic-delete false
```

With automatic deletion disabled, it is important that the deletion is done elsewhere. For instance through the CLI or from a NSO service application. Below shows an example on how to delete a uuid via the CLI:

```
admin@ncs# devices device netsim-0 live-status exec flush uuid 1234-5678-9012
```



## 11.3 Devices generating their own keys in the end-point list

The *end-point* list is an important part of each entry in connectivity-service list. Each entry in the *end-point* list is using the node *local-id* as key. This key shall be set by the provisioner (NSO) and obeyed by the device.

### Issue

Some devices do not obey the rule that the *local-id* is selected by the provisioner. Such devices do instead create their own value for *local-id*. This kind of behaviour will immediately cause out of sync issues when a new connectivity service is provisioned through NSO:

```
admin@ncs(config-connectivity-service-1234-5678-9012)# show configuration
context connectivity-context connectivity-service 1234-5678-9012
 end-point 0311123d-37b4-3f78-b647-84caa36530a0
  service-interface-point service-interface-point-uuid 0311123d-37b4-3f78-b647-84caa36530a0
 !
 end-point 29c69245-65d1-35dc-a6ed-c01685e4cb82
  service-interface-point service-interface-point-uuid 29c69245-65d1-35dc-a6ed-c01685e4cb82
 !
!
admin@ncs(config-end-point-2)# commit
Commit complete.
admin@ncs(config-config)# compare-config
diff
 devices {
     device netsim-0 {
         config {
             context {
                 connectivity-context {
                     connectivity-service 1234-5678-9012 {
-                        end-point 0311123d-37b4-3f78-b647-84caa36530a0 {
-                            service-interface-point {
-                                service-interface-point-uuid 0311123d-37b4-3f78-b647-84caa36530a0;
-                            }
-                        }
+                        end-point device-generated-local-id-1 {
+                            service-interface-point {
+                                service-interface-point-uuid 0311123d-37b4-3f78-b647-84caa36530a0;
+                            }
+                        }
-                        end-point 29c69245-65d1-35dc-a6ed-c01685e4cb82 {
-                            service-interface-point {
-                                service-interface-point-uuid 29c69245-65d1-35dc-a6ed-c01685e4cb82;
-                            }
-                        }
+                        end-point device-generated-local-id-2 {
+                            service-interface-point {
+                                service-interface-point-uuid 29c69245-65d1-35dc-a6ed-c01685e4cb82;
+                            }
+                        }
                     }
                 }
             }
         }
     }
 }
```

This issue does frequently happen on the following device types: *Ciena MCP*, *Nokia NRC-T*

### Solution

The NED has a built-in transform that can restore the key value originally set by NSO. Two conditions must be met for it to work:

1. The value of the *local-id* must be the same as the *service-interface-point-uuid* used in the same *end-point* entry. Exactly as in the example shown above.
2. The device must not change the value of the configured *service-interface-point-uuid* by itself.

With these conditions met the following NED setting will enable the automatic restore of the keys in the *end-point* list:

```
onf-tapi_rc restconf deviations do-restore-end-point-list-keys true
```



## 11.4 Devices not properly displaying configured data

### Issue

It is unfortunately very common with TAPI devices that are not capable of returning all configuration that has been provisioned on them. When using NSO as provisioner this limitation will always cause out of sync problems.

Example from *Ciena MCP*. This device type is not able to display three nodes that are actually  mandatory for creating a connectivity service:

```
admin@ncs(config-device-netsim-0)# commit dry-run outformat native
native {
    device {
        name netsim-0
        data RESTCONF POST :: http://127.0.0.1:49289/tapi/data/tapi-common:context/tapi-connectivity:connectivity-context/connectivity-service/
             {
                 "uuid":"1234",
                 "end-point":[{
                     "local-id":"0b11adb2-4d46-3eec-8b57-c85a337f6dd2",
                     "service-interface-point":{
                         "service-interface-point-uuid":"0b11adb2-4d46-3eec-8b57-c85a337f6dd2"
                     },
                     "name":[{
                         "value-name":"CSEP_NAME",
                         "value":"NED_TEST_TAPI"
                     }]
                 },{
                     "local-id":"0b3acafa-0c72-3885-9a16-d3a21cbe0ea9",
                     "service-interface-point":{
                         "service-interface-point-uuid":"0b3acafa-0c72-3885-9a16-d3a21cbe0ea9"
                     },
                     "name":[{
                         "value-name":"CSEP_NAME",
                         "value":"NED_TEST_TAPI"
                     }]
                 }],
                 "name":[{
                     "value-name":"SERVICE_NAME",
                     "value":"NED_TEST_DO_NOT_DELETE"
                 }],
                 "service-layer":"PHOTONIC_MEDIA",
                 "requested-capacity":{
                     "total-size":{
                         "value":"600",
                         "unit":"GBPS"
                     },
                     "tapi-ciena-connectivity-service-extensions:otu-rate":"OTUC6",
                     "tapi-ciena-connectivity-service-extensions:baud-rate":"95GBAUD"
                 },
                 "resilience-type":{
                     "protection-type":"NO_PROTECTON"
                 },
                 "tapi-ciena-connectivity-service-extensions:center-frequency":"194.1",
                 "tapi-ciena-connectivity-service-extensions:osrp-enabled":true
             }
    }
}
admin@ncs(config-device-netsim-0)# commit
Commit complete.
admin@ncs(config-device-netsim-0)# compare-config
diff
 devices {
     device netsim-0 {
         config {
             context {
                 connectivity-context {
                     connectivity-service 1234 {
                         requested-capacity {
                             total-size {
-                                value 600;
-                                unit GBPS;
                             }
-                            otu-rate OTUC6;
-                            baud-rate 95GBAUD;
                         }
                     }
                 }
             }
         }
     }
 }

```

This issue does frequently happen on the following device types: *Ciena MCP*, *Nokia NRC-T*, *Kratos Openspace*

### Solution

For certain use cases this kind of device limitation is not acceptable. The NED does have a built-in feature that can come in handy in such cases. It can be configured to cache the values of certain nodes when config is deployed. This shall be the nodes that the device is not capable of displaying.

Later when data is read from the device the cached values will be automatically injected into the config dumps. This trick will make it look like NSO is in sync with the device.

It is necessary to specify the nodes to cache using a schema path and the node names .

Using the same example as above, it would look like:

```
onf-tapi_rc general config cache schema-path /tapi-common:context/tapi-connectivity:connectivity-context/connectivity-service/requested-capacity nodes [ tapi-ciena-connectivity-service-extensions:baud-rate tapi-ciena-connectivity-service-extensions:otu-rate total-size ]
```

Now if you deploy the connectivity service from the example above and then do a compare-config, there will be no diff at all.
