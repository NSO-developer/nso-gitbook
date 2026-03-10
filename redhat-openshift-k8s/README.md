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
  5. Built in live-status actions
  6. Built in live-status show
  7. Limitations
  8. How to report NED issues and feature requests
  9. How to rebuild a NED
  ```


# 1. General
------------

  This document describes the redhat-openshift-k8s NED.

  This NED is build to cover Red Hat OpenShift KVM devices.

  Additional README files bundled with this NED package
  ```
  +---------------------------+------------------------------------------------------------------------------+
  | Name                      | Info                                                                         |
  +---------------------------+------------------------------------------------------------------------------+
  | README-ned-settings.md    | Information about all run time settings supported by this NED.               |
  +---------------------------+------------------------------------------------------------------------------+
  ```

  Common NED Features
  ```
  +---------------------------+-----------+------------------------------------------------------------------+
  | Feature                   | Supported | Info                                                             |
  +---------------------------+-----------+------------------------------------------------------------------+
  | netsim                    | yes       |                                                                  |
  |                           |           |                                                                  |
  | check-sync                | no        |                                                                  |
  |                           |           |                                                                  |
  | partial-sync-from         | no        |                                                                  |
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
  | Red Hat OpenShift         | 1.28            | Opensh | --                                                |
  |                           |                 | ift    |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-redhat-openshift-k8s-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-redhat-openshift-k8s-1.0.1.signed.bin
      > ./ncs-6.0-redhat-openshift-k8s-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-redhat-openshift-k8s-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-redhat-openshift-k8s-1.0.1.tar.gz
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


### 1.2.1 Local install
-----------------------

  This section describes how to install a NED package on a locally installed NSO
  (see "NSO Local Install" in the NSO Installation guide).

  It is assumed the NED package has been been unpacked to a tar.gz file as described in 1.1.

  1. Untar the tar.gz file. This creates a new sub-directory named:
     `redhat-openshift-k8s-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-redhat-openshift-k8s-1.0.1.tar.gz
     > ls -d */
     redhat-openshift-k8s-gen-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package redhat-openshift-k8s-gen-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package redhat-openshift-k8s-gen-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-redhat-openshift-k8s-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package redhat-openshift-k8s-gen-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/redhat-openshift-k8s-gen-1.0
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
               /tmp/ned-package-store/ncs-6.0-redhat-openshift-k8s-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-redhat-openshift-k8s-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install redhat-openshift-k8s-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-redhat-openshift-k8s-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-redhat-openshift-k8s-gen-1.0
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
    admin@ncs(config)# devices device dev-1 device-type generic ned-id redhat-openshift-k8s-gen-1.0
    admin@ncs(config)# devices device dev-1 state admin-state unlocked
    admin@ncs(config)# devices device dev-1 authgroup my-group
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

  `$NSO_RUNDIR/logs/ned-redhat-openshift-k8s-gen-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings redhat-openshift-k8s logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings redhat-openshift-k8s logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.openshiftk8s \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings redhat-openshift-k8s logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings redhat-openshift-k8s logger java true
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

  The yang model is a simplified version of the configuration structure reported by the device. Only required elemets are modeled.
  Some configuration structures can not be modeled as returned by the device. In that case the best aproximation is used, and the NED performs the conversion in the background.

  This is a typical element:
  ```
  devices device redhat-openshift
   config
    namespaces devtest1
     metadata labels cnf devtest1
     metadata labels cnf-vendor Mobileum
     metadata labels kubernetes.io/metadata.name devtest1
     resourcequotas devtest1-rq
      metadata labels cnf devtest1
      metadata labels cnf-vendor Mobileum
      spec hard count/configmaps 11
      spec hard count/persistentvolumeclaims 5
      spec hard count/pods 10
      spec hard count/secrets 10
      spec hard count/services 3
      spec hard count/services.loadbalancers 2
      spec hard count/services.nodeports 0
      spec hard limits.cpu 200m
      spec hard limits.ephemeral-storage 40Gi
      spec hard limits.memory 2Gi
      spec hard requests.cpu 100m
      spec hard requests.ephemeral-storage 20Gi
      spec hard requests.memory 1Gi
      spec hard requests.storage 50Gi
     !
     configmaps devtest-cm
      metadata labels app cisco-cm-yang-provider
      metadata labels app.kubernetes.io/instance lab-evnfm-vnf-info-cisco-cces-2
      metadata labels app.kubernetes.io/managed-by Helm
      metadata labels app.kubernetes.io/name cisco-cm-yang-provider
      metadata labels app.kubernetes.io/version 27.1.0_58
      metadata labels chart cisco-cm-yang-provider-27.1.0_58
      metadata labels cisco.com/log.override-direct-streaming false
      metadata labels heritage Helm
      metadata labels release lab-evnfm-vnf-info-cisco-cces-2
      metadata annotations cisco.com/product-name ""
      metadata annotations cisco.com/product-number ""
      metadata annotations cisco.com/product-revision ""
      metadata annotations meta.helm.sh/release-name ""
      metadata annotations meta.helm.sh/release-namespace ""
     !
     secrets devtest-ns-secret
      metadata annotations kubernetes.io/service-account.name devtest_ns-controller
      metadata annotations kubernetes.io/service-account.uid 81448b51-e8ba-4814-9faa-2930ae4dade7
      metadata annotations openshift.io/internal-registry-auth-token.binding legacy
      metadata annotations openshift.io/token-secret.name devtest_ns-controller-token-2mrtg
      metadata annotations openshift.io/token-secret.value ...ENCRYPTED DATA...
      data .dockercfg ...ENCRYPTED DATA...
     !
     sriovnetwork devtest-nss1
      spec capabilities "{\"ips\": true}"
      spec ipam {}
      spec linkState auto
      spec logLevel info
      spec networkNamespace devtest1
      spec resourceName sriov_numa0left_ens1f1
      spec trust on
     !
     sriovnetwork devtest-nss2
      spec capabilities "{\"ips\": true}"
      spec ipam {}
      spec linkState auto
      spec logLevel info
      spec networkNamespace devtest1
      spec resourceName sriov_numa0right_ens2f1
      spec trust on
     !
     networkattachmentdefinition devtest-nssb
      spec config "{" "\"type\":" "\"bond\","  "\"cniVersion\":" "\"0.3.1\"," "\"name\":" "\"devtest-nssb\"," "\"mode\":" "\"active-backup\","  "\"failOverMac\":" 1,  "\"linksInContainer\":" true,  "\"miimon\":" "\"100\"," "\"mtu\":" 9000, "\"links\":" [  "{" "\"name\":" "\"devtest-nss1\"" "}," "{" "\"name\":" "\"devtest-nss2\"" "}" ], "\"ipam\":" "{}" "}"
     !
     networkattachmentdefinition sriov1sv
      metadata labels cnf devtest1
      metadata labels cnf-vendor cisco
      spec config "{\"cniVersion\":" "\"0.3.1\"," "\"name\":" "\"devtest_nssv\"," "\"type\":\"vlan\"," "\"master\":" "\"devtest-nssb\",\"vlanId\":" 232, "\"linkInContainer\":" true, "\"mtu\":" 9000, "\"ipam\":" "{\"type\":" "\"whereabouts\"," "\"range\":" "\"192.168.1.2/28\"," "\"gateway\":" "\"192.168.1.1\"}}"
     !
    !
   !
  !
  ```

  The commit is broken into multiple steps:
  ```
  admin@ncs(config-config)# commit dry-run outformat native
  native {
      device {
          name redhat-openshift
          data CREATE: /api/v1/namespaces ==> {"apiVersion":"v1","kind":"Namespace","metadata":{"name":"devtest1","labels":{"cnf":"devtest1","cnf-vendor":"Mobileum","kubernetes.io/metadata.name":"devtest1"}}}
               CREATE: /api/v1/namespaces/devtest1/resourcequotas ==> {"apiVersion":"v1","kind":"ResourceQuota","metadata":{"name":"devtest1-rq","namespace":"devtest1","labels":{"cnf":"devtest1","cnf-vendor":"Mobileum"}},"spec":{"hard":{"count/configmaps":"11","count/persistentvolumeclaims":"5","count/pods":"10","count/secrets":"10","count/services":"3","count/services.loadbalancers":"2","count/services.nodeports":"0","limits.cpu":"200m","limits.ephemeral-storage":"40Gi","limits.memory":"2Gi","requests.cpu":"100m","requests.ephemeral-storage":"20Gi","requests.memory":"1Gi","requests.storage":"50Gi"}}}
               CREATE: /api/v1/namespaces/devtest1/configmaps ==> {"apiVersion":"v1","kind":"ConfigMap","metadata":{"name":"devtest-cm","namespace":"devtest1","labels":{"app":"cisco-cm-yang-provider","app.kubernetes.io/instance":"lab-evnfm-vnf-info-cisco-cces-2","app.kubernetes.io/managed-by":"Helm","app.kubernetes.io/name":"cisco-cm-yang-provider","app.kubernetes.io/version":"27.1.0_58","chart":"cisco-cm-yang-provider-27.1.0_58","cisco.com/log.override-direct-streaming":"false","heritage":"Helm","release":"lab-evnfm-vnf-info-cisco-cces-2"},"annotations":{"cisco.com/product-name":"","cisco.com/product-number":"","cisco.com/product-revision":"","meta.helm.sh/release-name":"","meta.helm.sh/release-namespace":""}}}
               CREATE: /api/v1/namespaces/devtest1/secrets ==> {"apiVersion":"v1","kind":"Secret","metadata":{"name":"devtest-ns-secret","namespace":"devtest1","annotations":{"kubernetes.io/service-account.name":"devtest_ns-controller","kubernetes.io/service-account.uid":"81448b51-e8ba-4814-9faa-2930ae4dade7","openshift.io/internal-registry-auth-token.binding":"legacy","openshift.io/token-secret.name":"devtest_ns-controller-token-2mrtg","openshift.io/token-secret.value":"...ENCRYPTED DATA..."}},"data":{".dockercfg":"...ENCRYPTED DATA..."}}
               CREATE: /apis/sriovnetwork.openshift.io/v1/namespaces/devtest1/sriovnetworks ==> {"apiVersion":"sriovnetwork.openshift.io/v1","kind":"SriovNetwork","metadata":{"name":"devtest-nss1","resourceVersion":null,"namespace":"devtest1"},"spec":{"capabilities":"{\"ips\": true}","ipam":"{}","linkState":"auto","logLevel":"info","networkNamespace":"devtest1","resourceName":"sriov_numa0left_ens1f1","trust":"on"}}
               CREATE: /apis/sriovnetwork.openshift.io/v1/namespaces/devtest1/sriovnetworks ==> {"apiVersion":"sriovnetwork.openshift.io/v1","kind":"SriovNetwork","metadata":{"name":"devtest-nss2","resourceVersion":null,"namespace":"devtest1"},"spec":{"capabilities":"{\"ips\": true}","ipam":"{}","linkState":"auto","logLevel":"info","networkNamespace":"devtest1","resourceName":"sriov_numa0right_ens2f1","trust":"on"}}
               CREATE: /apis/k8s.cni.cncf.io/v1/namespaces/devtest1/network-attachment-definitions ==> {"apiVersion":"k8s.cni.cncf.io/v1","kind":"NetworkAttachmentDefinition","metadata":{"name":"devtest-nssb","namespace":"devtest1","resourceVersion":null},"spec":{"deviceType":"{ \"type\": \"bond\",  \"cniVersion\": \"0.3.1\", \"name\": \"devtest-nssb\", \"mode\": \"active-backup\",  \"failOverMac\": 1,  \"linksInContainer\": true,  \"miimon\": \"100\", \"mtu\": 9000, \"links\": [  { \"name\": \"devtest-nss1\" }, { \"name\": \"devtest-nss2\" } ], \"ipam\": {} }"}}
               CREATE: /apis/k8s.cni.cncf.io/v1/namespaces/devtest1/network-attachment-definitions ==> {"apiVersion":"k8s.cni.cncf.io/v1","kind":"NetworkAttachmentDefinition","metadata":{"name":"sriov1sv","namespace":"devtest1","resourceVersion":null,"labels":{"cnf":"devtest1","cnf-vendor":"cisco"}},"spec":{"deviceType":"{\"cniVersion\": \"0.3.1\", \"name\": \"devtest_nssv\", \"type\":\"vlan\", \"master\": \"devtest-nssb\",\"vlanId\": 232, \"linkInContainer\": true, \"mtu\": 9000, \"ipam\": {\"type\": \"whereabouts\", \"range\": \"192.168.1.2/28\", \"gateway\": \"192.168.1.1\"}}"}}
      }
  }
  ```


# 5. Built in live-status actions
---------------------------------

  NONE


# 6. Built in live-status show
------------------------------

  NONE


# 7. Limitations
----------------

  1. The current implementation first fetches the list of namespaces from API '/api/v1/namespaces'
      After the list of Namespaces is retrieved, all other elements are read one by one.
      The read process can take a long time, depending on the connection speed and the size of the configuration
  2. There are a lot of dynamic configuration elements on the device and that will generate out-of-sync errors.
  3. Commit request are simplified by using only HttpPut requests. The PUT operations replaces the entire structure.
      If the NED is not in syn before the commit, the final state might be different from the intended one


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
     admin@ncs(config)# devices device dev-1 ned-settings redhat-openshift-k8s logging level debug
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

  To rebuild the NED do as follows:

  ```
  > cd $NED_ROOT_DIR/src
  > make clean all
  ```

  When the NED has been successfully rebuilt, it is necessary to reload the package into NSO.

  ```
  admin@ncs# packages reload
  ```

