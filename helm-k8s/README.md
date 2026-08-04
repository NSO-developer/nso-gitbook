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

  This document describes the helm-k8s NED.

  The helm-k8s NED is used to target a host that manages helm (helm manager for the k8s cluster).
  Although the NED is generic as a NED type, the connection to the device is ssh-based. This means that the NED expects to connect over ssh to a host that is used as k8s manager using helm.

  The NED configuration is composed of two main parts:
      - charts part - this is a list containing the information for all onboarded charts on the targeted helm host
      - deployments part - this is a list containing charts deployment.

  When creating a deployment from a specific chart, the NED (and helm) will inherit the default values from the targeted chart. Chart values can be further customised in the NED configuration using the yang model (please check Configuration samples chapter for details).

  Note that chart creation or deletion is not allowed in the helm-k8s NED, as they are deemed out of the scope of the NED. Only deployments creation/deletion/updates is allowed.

  Before commiting changes (eg install deployments), it is possible to do a helm dry-run of the change, by running the following command from the NED:

  ```
  admin@ncs(config-config)# connect
  admin@ncs(config-config)# commit dry-run outformat native
  ```

  NOTE: since the dry-run needs to execute the helm dry-run on the target host, before using the above command, a connect needs to be executed before the dry-run command.

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
  | netsim                    | no        |                                                                  |
  |                           |           |                                                                  |
  | check-sync                | no        |                                                                  |
  |                           |           |                                                                  |
  | partial-sync-from         | no        |                                                                  |
  |                           |           |                                                                  |
  | live-status actions       | yes       |                                                                  |
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
  | Helm                      | NA              | UNIX   | NED for Helm Kubernetes. Targets the helm host    |
  |                           |                 |        | manager over SSH                                  |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-helm-k8s-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-helm-k8s-1.0.1.signed.bin
      > ./ncs-6.0-helm-k8s-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-helm-k8s-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-helm-k8s-1.0.1.tar.gz
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
     `helm-k8s-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-helm-k8s-1.0.1.tar.gz
     > ls -d */
     helm-k8s-gen-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package helm-k8s-gen-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package helm-k8s-gen-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-helm-k8s-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package helm-k8s-gen-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/helm-k8s-gen-1.0
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
               /tmp/ned-package-store/ncs-6.0-helm-k8s-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-helm-k8s-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install helm-k8s-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-helm-k8s-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-helm-k8s-gen-1.0
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
    admin@ncs(config)# devices device dev-1 device-type generic ned-id helm-k8s-gen-1.0
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

  `$NSO_RUNDIR/logs/ned-helm-k8s-gen-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings helm-k8s logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings helm-k8s logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.helm \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings helm-k8s logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings helm-k8s logger java true
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

  The following steps present a demo of the helm-k8s NED. It includes all the steps to run this demo on a NSO setup, targetting a host that it is used to manage a Kubernetes cluster using helm.

  Requirements for this demo:
    1. a host that runs a NSO setup, having helm-k8s NED installed
    2. a host that has helm installed
    3. custom charts that are used during this demo.
    4. create deployments

  Step number 1
  -------------
  Please follow this README.md previous chapter in order to download, install and configure the helm-k8s NED.
  Regarding the configuration, this NED only needs the IP address, port and credentials set up for the targeted helm host (presented in step 2).
  NOTE: the connection between NSO and the helm host is SSH-based, so host keys needs to be fetched in NSO.

  Step number 2
  -------------
  The targeted host needs to have helm installed and helm needs to be properly set up with the Kubernetes cluster.
  Setting up helm with the targeted kubernetes cluster is outside of the scope of this readme, so please consult external documentation for this.
  NOTE: helm-k8s NED requires that helm host have 'yq' tool installed.
  To check if yq tool is installed:
  ```
  core@bm3-1 ~]$ yq --version
  yq (https://github.com/mikefarah/yq/) version v4.52.4
  ```
  If yq is not installed, install yq - this step depends on the linux distribution. If the targeted host does not have internet access, the pre-compiled binary of yq can be downloaded from https://github.com/mikefarah/yq/releases.

  Step number 3
  -------------
  Conceptually, helm-k8s NED works with two resources: charts and deployments.
  The charts are the blueprints used for Kubernetes cluster deployments. They represent the recipes that can be deployed on the Kubernetes cluster.
  The deployments represents instantiations of charts on the Kubernetes cluster (eg helm install ...). 
  A deployment inherits the values of a chart, on top of which the user can define custom values.

  In the scope of this demo, we are going to use two dummy charts: https://lpanduru.github.io/charts/

  To add the charts using the helm-k8s NED, run the following commands from the NED:
  ```
  admin@ncs(config-device-helm-1)# live-status exec helm repo add ned-charts https://lpanduru.github.io/charts
  result
  "ned-charts" has been added to your repositories
  admin@ncs(config-device-helm-1)# 
  ```

  Note: the above command will pull ned-charts repo in helm, containing two dummy charts called app1 and app2.
  For a real use-case scenario, valid charts should be fetched either from public known repos or from custom-defined repos. 

  ATENTION: Defining the custom charts (eg charts creatiion from the NED) is currently outside the scope of the current NED implementation. 

  Once we have some charts in helm, do a sync-from:
  ```
  helm chart ned-charts/app1
     registry    https://lpanduru.github.io/charts
     version     0.1.0
     app_version 1.16.0
     description "A Helm chart for Kubernetes"
     values key-value autoscaling.enabled
      value false
     !
     values key-value autoscaling.maxReplicas
      value 100
     !
     values key-value autoscaling.minReplicas
      value 1
     !
     values key-value autoscaling.targetCPUUtilizationPercentage
      value 80
     !
     values key-value fullnameOverride
      value ""
     !
     values key-value image.pullPolicy
      value IfNotPresent
     !
     values key-value image.repository
      value nginx
     !
     values key-value image.tag
      value ""
     !
     values key-value imagePullSecrets
      value []
     !
     values key-value ingress.className
      value ""
     !
     values key-value ingress.enabled
      value false
     !
     values key-value ingress.hosts
      value "[{\"host\":\"chart-example.local\",\"paths\":[{\"path\":\"/\",\"pathType\":\"ImplementationSpecific\"}]}]"
     !
     values key-value ingress.tls
      value []
     !
     values key-value livenessProbe.httpGet.path
      value /
     !
     values key-value livenessProbe.httpGet.port
      value http
     !
     values key-value nameOverride
      value ""
     !
     values key-value readinessProbe.httpGet.path
      value /
     !
     values key-value readinessProbe.httpGet.port
      value http
     !
     values key-value replicaCount
      value 1
     !
     values key-value service.port
      value 80
     !
     values key-value service.type
      value ClusterIP
     !
     values key-value serviceAccount.automount
      value true
     !
     values key-value serviceAccount.create
      value true
     !
     values key-value serviceAccount.name
      value ""
     !
     values key-value tolerations
      value []
     !
     values key-value volumeMounts
      value []
     !
     values key-value volumes
      value []
     !
    !
    helm chart ned-charts/app2
    .........

  ```

  All the helm charts will be pulled by the NED and stored in /helm/chart yang node. As mentioned above, current NED implementation does not allow new chart creation.


  Step 4
  ------
  If the helm host have deployments available, the NED will pull the information for the available deployments and store them in /helm/deployment:
  ```
    helm deployment test1
     chart-name    ned-charts/app2
     chart-version 0.1.0
     namespace     ned-apps
     revision      132
     updated       "2026-03-01 21:42:36.981202151 +0000 UTC"
     status        deployed
     app_version   1.16.0
     values key-value autoscaling.maxReplicas
      value 10
     !
    !
  ```

  To create a new deployment (eg helm install command), we create a new entry in the /helm/deployment list, starting from an existing chart and providing mandatory values, like namespace, chart version etc:

  ```
   helm deployment test2
     chart-name    ned-charts/app1
     chart-version 0.1.0
     namespace     ned-apps
     app_version   0.0.1
     values key-value autoscaling.maxReplicas
      value 10
     exit
   exit
  ```
  Note: the new deployment 'test2' will inherit all the values of 'ned-charts/app1' chart from version 0.1.0. On top of the default values, the user can customize existing or new values using 'values key-value' list of custom values. In the above example, 'autoscaling.maxReplicas' is set to 10 instead of the default 5.

  The new deployment can be tested if it is correct before deployment using 'commit dry-run outformat native' command:
  ```
  admin@ncs(config-config)# connect
  result true
  info (admin) Connected to helm-1 - 10.53.61.201:23933
  admin@ncs(config-config)# commit dry-run outformat native
  native {
      device {
          name helm-1
          data 
            helm install test2 ned-charts/app1 --version 0.1.0 -n ned-apps --create-namespace --set autoscaling.maxReplicas=10 --dry-run
               NAME: test2
               LAST DEPLOYED: Mon Mar  2 10:44:58 2026
               NAMESPACE: ned-apps
               STATUS: pending-install
               REVISION: 1
               HOOKS:
               ---
               # Source: app1/templates/tests/test-connection.yaml
               apiVersion: v1
               kind: Pod
               metadata:
                 name: "test2-app1-test-connection"
                 labels:
                   helm.sh/chart: app1-0.1.0
                   app.kubernetes.io/name: app1
                   app.kubernetes.io/instance: test2
                   app.kubernetes.io/version: "1.16.0"
                   app.kubernetes.io/managed-by: Helm
                 annotations:
                   "helm.sh/hook": test
               spec:
                 containers:
                   - name: wget
                     image: busybox
                     command: ['wget']
                     args: ['test2-app1:80']
                 restartPolicy: Never
               MANIFEST:
               ---
               # Source: app1/templates/serviceaccount.yaml
               apiVersion: v1
               kind: ServiceAccount
               metadata:
                 name: test2-app1
                 labels:
                   helm.sh/chart: app1-0.1.0
                   app.kubernetes.io/name: app1
                   app.kubernetes.io/instance: test2
                   app.kubernetes.io/version: "1.16.0"
                   app.kubernetes.io/managed-by: Helm
               automountServiceAccountToken: true
               ---
               # Source: app1/templates/service.yaml
               apiVersion: v1
               kind: Service
               metadata:
                 name: test2-app1
                 labels:
                   helm.sh/chart: app1-0.1.0
                   app.kubernetes.io/name: app1
                   app.kubernetes.io/instance: test2
                   app.kubernetes.io/version: "1.16.0"
                   app.kubernetes.io/managed-by: Helm
               spec:
                 type: ClusterIP
                 ports:
                   - port: 80
                     targetPort: http
                     protocol: TCP
                     name: http
                 selector:
                   app.kubernetes.io/name: app1
                   app.kubernetes.io/instance: test2
               ---
               # Source: app1/templates/deployment.yaml
               apiVersion: apps/v1
               kind: Deployment
               metadata:
                 name: test2-app1
                 labels:
                   helm.sh/chart: app1-0.1.0
                   app.kubernetes.io/name: app1
                   app.kubernetes.io/instance: test2
                   app.kubernetes.io/version: "1.16.0"
                   app.kubernetes.io/managed-by: Helm
               spec:
                 replicas: 1
                 selector:
                   matchLabels:
                     app.kubernetes.io/name: app1
                     app.kubernetes.io/instance: test2
                 template:
                   metadata:
                     labels:
                       helm.sh/chart: app1-0.1.0
                       app.kubernetes.io/name: app1
                       app.kubernetes.io/instance: test2
                       app.kubernetes.io/version: "1.16.0"
                       app.kubernetes.io/managed-by: Helm
                   spec:
                     serviceAccountName: test2-app1
                     containers:
                       - name: app1
                         image: "nginx:1.16.0"
                         imagePullPolicy: IfNotPresent
                         ports:
                           - name: http
                             containerPort: 80
                             protocol: TCP
                         livenessProbe:
                           httpGet:
                             path: /
                             port: http
                         readinessProbe:
                           httpGet:
                             path: /
                             port: http

               NOTES:
               1. Get the application URL by running these commands:
                 export POD_NAME=$(kubectl get pods --namespace ned-apps -l "app.kubernetes.io/name=app1,app.kubernetes.io/instance=test2" -o jsonpath="{.items[0].metadata.name}")
                 export CONTAINER_PORT=$(kubectl get pod --namespace ned-apps $POD_NAME -o jsonpath="{.spec.containers[0].ports[0].containerPort}")
                 echo "Visit http://127.0.0.1:8080 to use your application"
                 kubectl --namespace ned-apps port-forward $POD_NAME 8080:$CONTAINER_PORT
  ```

  In the current NED implementation, the /helm/deployment have a leaf 'status' that represents the status of the deployment, but this leaf is not coherent with the 'device' value unless a sync-from is performed after commit.
  If this value is needed for service processing, the NED will need live-status data implementation for status leaf.


# 5. Built in live-status actions
---------------------------------

  All helm CLI commands can be executed using NED live-status RPC actions.
  An example of RPC call to list available repositories in helm is the following:

  ```
  admin@ncs(config-device-helm-1)# live-status exec helm repo list
  result
  NAME      	URL
  ned-charts	https://lpanduru.github.io/charts
  ```

  Note that using the live-status exec helm <command>, any helm command can be executed from the NED.


# 6. Built in live-status show
------------------------------

  The helm-k9s NED does not support live-status TTL-based data


# 7. Limitations
----------------

  Chart creation or deletion is not allowed in the helm-k8s NED, as they are deemed out of the scope of the NED.


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
     admin@ncs(config)# devices device dev-1 ned-settings helm-k8s logging level debug
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

