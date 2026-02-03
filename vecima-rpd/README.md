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

  This document describes the vecima-rpd NED.

  ##  1.1 NED info

  - Check section 1.3 for specific details and dependencies

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
  | netsim                    | no        | not supported                                                    |
  |                           |           |                                                                  |
  | check-sync                | no        | not supported                                                    |
  |                           |           |                                                                  |
  | load-native-config        | no        | not supported                                                    |
  |                           |           |                                                                  |
  | partial-sync-from         | no        | not supported                                                    |
  |                           |           |                                                                  |
  | live-status actions       | yes       | Only live status actions supported a.t.m.                        |
  |                           |           |                                                                  |
  | live-status show          | no        | not supported                                                    |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | EN-AN-8100-LDM            | 1_50_32         | ENTRA_ | Vecima Entra Remote PHY Device version 1.50.32    |
  |                           |                 | RPD_RE |                                                   |
  |                           |                 | L_52_1 |                                                   |
  |                           |                 | _50_32 |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-vecima-rpd-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-vecima-rpd-1.0.1.signed.bin
      > ./ncs-6.0-vecima-rpd-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-vecima-rpd-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-vecima-rpd-1.0.1.tar.gz
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
     `vecima-rpd-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-vecima-rpd-1.0.1.tar.gz
     > ls -d */
     vecima-rpd-gen-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package vecima-rpd-gen-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package vecima-rpd-gen-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-vecima-rpd-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package vecima-rpd-gen-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/vecima-rpd-gen-1.0
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
               /tmp/ned-package-store/ncs-6.0-vecima-rpd-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-vecima-rpd-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install vecima-rpd-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-vecima-rpd-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-vecima-rpd-gen-1.0
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
    admin@ncs(config)# devices device dev-1 device-type generic ned-id vecima-rpd-gen-1.0
    admin@ncs(config)# devices device dev-1 state admin-state unlocked
    admin@ncs(config)# devices device dev-1 authgroup my-group
    ```


  ## 1.3.1 Configure the NED in NSO > 


  ### `###############################################`
  ### `### DEVICE AND AUTHENTICATION CONFIGURABLES ###`
  ### `###############################################`

  * Set the authentication method accordingly:

  --------------------------------------------

  - To authenticate with username/password:

  ---------------------------------------

  ```
    admin@ncs(config)# devices authgroups group <group-name> default-map remote-name <remote-name>
    admin@ncs(config)# devices authgroups group <group-name> default-map remote-password "<remote-password>"
    admin@ncs(config)# devices authgroups group <group-name> default-map remote-secondary-password "<remote-secondary-password>"
  ```

  ### 1.3.1.1 NOTE 1 - Password syntax, quoting and device connectivity specifics !! VERY IMPORTANT !!

  ** You MUST use double quotes ("testPasswo1!@$%rd") with the remote-password and remote-secondary password to make sure that the special characters required in the passwords or factory passwords are not interfering with NCS annotations/metacharacters. Especially for char `!`

  i.e. if '!' char is contained within a password, the password won't be accurately written in the CDB unless it is fully quoted.
  abc!def will result in storing and using password "abc" if double quotes are not used, as '!' has special properties in NSO cli.


  ### ** When connecting vecima-rpd NED to a factory defaulted Vecima RPD device (R-PHY) it is critical to define multiple authgroups, or to update the authgroup after first connect request.

  ### ** One of the authgroup must have both remote-password and remote-secondary-password defined, as the NED will try to authenticate and change the remote-password with the remote-secondary-password if the device authentication process requires it. 

  ### ** Please refer to Section 1.3.2 below for further details.

  * Set the required configurables:
  -------------------------------

  ```
  admin@ncs(config)# devices device <device-name> device-type generic ned-id vecima-rpd-gen-1.0    (for NSO >= 5.x)
      or
  ### deprecated : admin@ncs(config)# devices device <device-name> device-type generic ned-id vecima-rpd            (for NSO < 5.x)

  admin@ncs(config)# devices device <device-name> device-type generic
  admin@ncs(config)# devices device <device-name> state admin-state unlocked
  admin@ncs(config)# devices device <device-name> address <ip-address>
  admin@ncs(config)# devices device <device-name> port <port>
  admin@ncs(config)# devices device <device-name> authgroup <group-name>

  admin@ncs(config)# devices device <device-name> connect-timeout 30
  admin@ncs(config)# devices device <device-name> read-timeout 30
  admin@ncs(config)# devices device <device-name> write-timeout 30
  admin@ncs(config)# devices device <device-name> ned-settings vecima-rpd connection remote-protocol ssh
  ```

  ### LOGGING setup
  -------------------------------

  * Enable Trace (Northbound) logging if needed:
    * Setting the NED to trace all messages sent to/from the vecima-rpd device


  ```
    admin@ncs(config)# devices device <device-name> trace raw
  ```

  -------------------------------

  * Enable Full logging if needed (Northbound + Southbound java-vm log):
    * Set the NED print debug log messages:
  ```
    admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.vecima.RPDNedGeneric level level-all
    admin@ncs(config-logger-com.tailf.packages.ned)# commit
    admin@ncs(config-logger-com.tailf.packages.ned)# top
  ```
  -------------------------------

  * Fetch host keys and check device link:
    > If the device is open for connections, we will be able to fetch the host keys:
  ```
    admin@ncs(config)# devices device <device-name> ssh fetch-host-keys
    result updated
    fingerprint {
        algorithm ssh-rsa
        value a4:c1:c0:9b:e6:95:34:67:1c:cf:a2:3f:83:da:ce:62
    }
  ```

  <br><br><br>

  ---

  ### 1.3.2 NOTE 2 - Vecima devices detectability and connect-time limitations - VERY IMPORTANT !!
  ---

  ### - If the device fetch host keys is not possible, by analogy we deduct and assume the Vecima device is not responsive.

  ### - Even if it is ping/ping6 reachable, the device locks ssh for at least 1 minute in several cases:

    1) No more than 3 ssh sessions are allowed, per device, per minute
       * After 3 failed attempts, RPD closes the connection and discards any inbound auth request for at least 1 minute
       * Occasionally after multiple password updates even for more than 5-6 minutes.
       * Device rejects the fourth and accepts the fifth session authentication attempt only
    2) if password is wrongly introduced several times.
    3) if commands are issued at a rate faster than 1/second.


  -------------------------------

  ### If the device is in protected/unreachable state, we will not be able to fetch the host keys, even if it is reachable via ping:

  -------------------------------
  * Device is discarding all auth attempts, but online:

  ```
    admin@ncs(config-device-VECIMA-1)# ssh fetch-host-keys
    result failed
    info Connection to VECIMA-1 timed out
  ```
  * Device is rebooting or unreachable:
  ```
    admin@ncs(config-device-VECIMA-1)# ssh fetch-host-keys
    result failed
    info Failed to connect to device VECIMA-1: host is unreachable
  ```

  * Commit configuration:
  -------------------------------
    `admin@ncs(config)# commit`

  * Connect to device:
  -------------------------------
  ```
    admin@ncs(config)# devices device <device-name> connect
    result true
    info (admin) Connected to <device-name> - <ip-address>:<SSH-PORT>
  ```


  ## 1.3.2 FACTORY RESET > INITIAL PASSWORD CHANGE FLOW

  * Double check and refer to NOTEs 1.3.1.1 & 1.3.1.2 above if needed 

  ### 1.3.2.1 FACTORY RESET INITIAL PASSWORD CHANGE

  #### Background:
  ---------------- 

  Vecima RPD device factory reset brings the device to a custom known password.

  The password can be changed DURING the FIRST "connect" request through the NED.

  The design of the NED takes into account the remote-password and remote-secondary-password as being the inputs for this operation.


  #### NOTE 3: Password rules:
  ---------------------------------------------------------------------

  ```
  The new password should include the following character classes and meet the criteria below:
    - Be at least 8 characters in length
    - Contain both upper and lowercase alphabetic characters (e.g. A-Z, a-z)
    - Have at least one numerical character (e.g. 0-9)
    - Have at least one special character (e.g. ~!@#$%^&*()_-+=)
    - No consecutive or repetitive numbers (or letters)
  ```

  #### The intended use is as follows:

  ---
  #### a) `remote-password "<remote-password>"`

  ---

  It represents the FACTORY default password for this usecase, or the password that is being used for authenticating the NED on the Vecima device for ALL Other usecases. 

  Therefore, it must be updated accordingly.

  ---

  #### b) `remote-secondary-password "<remote-secondary-password>"`

  ---

  It represents the NEW password when the NED is hitting the Password request change from the VECIMA device.

  After 'connect' is ran, and the remote-password is updated to remote-secondary-password, the NED instance has to be updated accordingly.

    This assumes either creating a second auth group with above remote-secondary-password as the remote-password,
      or
    just updating the existing remote-password with the new one and retrying to connect.


  --------------------
  ### 1.3.2.2 PRE-REQUISITES:
  --------------------

  #### a) Two authgroups are recommended, or if one is preffered, it MUST be updated immediately after running "connect" in the steps below.
  ---

  - authgroup 1
  ```
  devices authgroups group vecima-factory-reset
    default-map remote-name   vecima-admin
    default-map remote-password "Factory_password"
    default-map remote-secondary-password "New_password"
  !
  ```

  - authgroup 2
  ```
  devices authgroups group vecima-updated
    default-map remote-name   vecima-admin
    default-map remote-password "New_password"
  !
  ```

  - device 1 sample config

  ```
  devices device VECIMA
    address         ...
    port            22
    authgroup       vecima-factory-reset
    device-type generic ned-id vecima-rpd
    connect-timeout 10
    read-timeout    30
    write-timeout   10
    trace           raw
    state admin-state unlocked
  !
  ```

  #### b) Device connectivity can be tested by running "fetch host keys";
  --- 

  * If the device blocks its SSH channel or if it is resetting or unavailable, it will be immediately visible:
  * Please note that when the device enters the 3/1 minute rule protection it is available via ping/ping6, but still rejects any ssh connection, having the same result below.

  ```
    admin@ncs(config-device-VECIMA-2)# ssh fetch-host-keys
    result failed
    info Failed to connect to device VECIMA: host is unreachable
  ```

  * When the device is available again for SSH sessions, ssh fetch-host-keys is successful:

  ```
  admin@ncs(config-device-VECIMA)# ssh fetch-host-keys
  result unchanged
  fingerprint {
      algorithm ssh-rsa
      value fb:f1:4c:01:43:ec:12:12:12:d6:bc:98:2f:5d:67:c7
  }
  ```

  #### c) Run connect with factory reset password change:
  ---

  #### c.1) * If connect is successful, result is true and info debug message is returned as below presented.
  ---

  ```
    admin@ncs(config-device-VECIMA)# connect
    result true
    info (admin) Connected to VECIMA - IP.ADDRESS : PORT:22
  ```

  #### c.2) If the device connected successfully, the password has been updated and new authgroup, or existing authgroup must be updated to reflect that in the NED's instance
  ---
  ```
  admin@ncs(config-device-VECIMA)# authgroup vecima-updated
  admin@ncs(config-device-VECIMA)# commit
  Commit complete.
  admin@ncs(config-device-VECIMA)# connect
  result true
  info (admin) Connected to VECIMA - IP.ADDRESS : PORT:22
  ```

  #### c.3) If the device connection fails refer to NOTEs above and either:
  ---

    I) update the passwords to match NOTE 3.

    II) double quote the passwords to ensure full password is correcly applied (NOTE 1)

    III) update the authgroup if the a) and b) points have been already addressed in another auth group.

  #### c.4) Failure sample:
  ---
  ```
  admin@ncs(config-device-VECIMA)# connect
  result false
  info Failed to connect to device VECIMA: connection refused: SSH authentication failed in new state
  admin@ncs(config-device-VECIMA)# *** ALARM connection-failure: Failed to connect to device VECIMA: connection refused: SSH authentication failed in new state
  ```

  ---
  ```
  admin@ncs(config-device-VECIMA-1)# connect
  result false
  info Failed to connect to device VECIMA-1: connection refused: The kexTimeout (5000 ms) expired. in new state
  admin@ncs(config-device-VECIMA-1)# *** ALARM connection-failure: Failed to connect to device VECIMA-1: connection refused: The kexTimeout (5000 ms) expired. in new state
  ```

  ---
  ### 1.3.3 Full usecase sample workflow in just 3 steps <<<
  ---

  ### a) Step 1 :

  ```admin@ncs(config)# devices authgroups group vecima-factory-reset
  admin@ncs(config-group-action-changed-passwd-grp)# default-map remote-name vecima-admin remote-password "Factory_password" remote-secondary-password "New_password"
  admin@ncs(config-group-action-changed-pasword-grp)# commit
  Commit complete.
  admin@ncs(config-group-action-changed-pasword-grp)# top
  ```

  ```
  admin@ncs(config)# devices authgroups group vecima-updated-passwd
  admin@ncs(config-group-action-changed-passwd-grp)# default-map remote-name vecima-admin remote-password "New_password"
  admin@ncs(config-group-action-changed-pasword-grp)# commit
  Commit complete.
  admin@ncs(config-group-action-changed-pasword-grp)# top
  ```

  ### b) Step 2: Device config

  - We assume VECIMA-1 device is in factory reset state, and needs password changing at first login:
  - set factory password as primary password and desired password as secondary-password.

  ```
  admin@ncs(config)# devices device VECIMA-1 authgroup vecima-factory-reset
  admin@ncs(config-device-VECIMA-1)# commit
  Commit complete.
  admin@ncs(config-device-VECIMA-1)# connect
  result true
  info (admin) Connected to VECIMA-1 - 1.2.3.4:22
  ```


  ### c) Step 3: Password is now changed to "New_password"; update authgroup with the new password and reconnect

  - Continuing to use a password that has been touched/tampered in any of these flows (with the secondary password applied) won't work, so one needs to re-attach to the right authgroup after each password update so that the primary one is the one valid at all times:
  - Refer to sections 1.3.3 and 1.3.4 for more details. 

  ```
  admin@ncs(config)# devices device VECIMA-1 authgroup vecima-updated-passwd
  admin@ncs(config-device-VECIMA-1)# commit
  Commit complete.
  admin@ncs(config-device-VECIMA-1)# connect
  result true
  info (admin) Connected to VECIMA-1 - 1.2.3.4:22
  ```


  ## 1.3.3 MENU DRIVEN PASSWORD CHANGE : `live-status exec change-password`

  * Double check and refer to NOTEs above if needed **

  - Usage:

    `devices device <device-name> live-status vecima-rpd-stats:exec change-password new-password "<NEW-PASSWORD>"`
  ---

  * Changes devices' current password to the given NEW-PASSWORD;
  * Uses authgroup remote-password as current password;

  ### !!!WARNING!!!
   - PLEASE MAKE SURE the password is given in double quotes to NSO. i.e. "newPassword123!@:       
   Otherwise it may result in a password truncation if the password contains NSO defined metacharacters, such as "!".

  ### 1.3.3.1 Successfully update request expected output:
  ---
  ```
  admin@ncs(config-device-VECIMA-1)# live-status vecima-rpd-stats:exec change-password new-password "<NEW-PASSWORD>"
  result Successfully changed password.

  ```

  - After successful update, change auth-group to use the new password accordingly and reconnect (see 2.2 below)


  ### 1.3.3.2 Failed update request expected output:
  ---

  ```admin@ncs(config-device-VECIMA-1)# live-status vecima-rpd-stats:exec change-password new-password america
  result PASSWORD UNCHANGED ! Check password requirements and retry!
  Device Resp:
  BAD PASSWORD: it is based on a dictionary word
  passwd: Authentication token manipulation error
  ```


  ### 1.3.3.3 Authgroup update with new password set workflow
  ---
  ```
  admin@ncs(config-device-VECIMA-1)# live-status vecima-rpd-stats:exec change-password new-password "<NEW-PASSWORD>"
  result Successfully changed password.
  admin@ncs(config-device-VECIMA-1)# top
  admin@ncs(config)# devices authgroups group action-changed-passwd-grp
  admin@ncs(config-group-action-changed-passwd-grp)# default-map remote-name <vecima-login> remote-password "<NEW-PASSWORD>"
  admin@ncs(config-group-action-changed-pasword-grp)# commit
  Commit complete.
  admin@ncs(config-group-action-changed-pasword-grp)# top
  admin@ncs(config)# devices device VECIMA-1 authgroup action-changed-passwd-grp
  admin@ncs(config-device-VECIMA-1)# commit
  Commit complete.
  admin@ncs(config-device-VECIMA-1)# connect
  result true
  info (admin) Connected to VECIMA-1 - 1.2.3.4:22
  ```

  ### 1.3.4 MENU DRIVEN DEVICE FACTORY RESET : `live-status exec factory-reset`

  * Resets the device to the factory state from the device menu

    I) Make sure you have the factory reset password available and update the authgroup accordingly.

    II) Make sure to wait for a few minutes before reconnecting to the device.

    III) Use the factory password as primary password and secondary password as the targeted new password. 

    IV) After successful connect confirmation at step III), update authgroup accordingly to use primary password the targeted password from step III). 

  ---

  ```
  admin@ncs(config-device-VECIMA-1)# live-status vecima-rpd-stats:exec factory-reset
  result Factory Reset Request successfully sent!
  Wait for 2-3 minutes and retry to connect with default factory password!
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

  `$NSO_RUNDIR/logs/ned-vecima-rpd-gen-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings vecima-rpd logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings vecima-rpd logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.vecima \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings vecima-rpd logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings vecima-rpd logger java true
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


  - Device has no config options; no data stored in CDB at the moment


# 5. Built in live-status actions
---------------------------------

  # 5.1 Built in live-status actions

  ```
  admin@ncs(config-device-vecimadevice)# live-status exec ?
  Possible completions:
    change-password          !WARNING! Change existing Vecima Password from device menu
    factory-reset            !WARNING! Factory reset Vecima RPD device.
    get-rpd-general-status   Get vecima rpd General status
  ```

  - Password change menu driven example: 

  ```
  admin@ncs(config-device-vecimadevice)# live-status exec change-password new-password "test123!@#!@#!#"
  result Successfully changed password. 
  ```


  - Factory reset example:
  ```
  admin@ncs(config-device-vecimadevice)# live-status exec factory-reset 
  result Factory Reset Request successfully sent!
   Wait for 2-3 minutes and retry to connect with default factory password!
  ```


  - Get general status sample:

  ```
  admin@ncs(config-device-vecimadevice)# live-status exec get-rpd-general-status 
  result
       |-- Top Level RPD State ------------------------------|
       |-----------------------------------------------------|
       | Top Level RPD State (87.1) | CONNECT_PRINCIPAL_CORE |
       |----------------------------|------------------------|

       |-- Version ---------------------|
       |--------------------------------|
       | Current System Release | 2_5_2 |
       |------------------------|-------|
  ```


# 6. Built in live-status show
------------------------------

  NONE


# 7. Limitations
----------------


  - no config store in CDB. 
  - only live-status commands used for main activities needed
  - timeouts added between ssh commands at device interaction to avoid lockout and flooding of the device.


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
     admin@ncs(config)# devices device dev-1 ned-settings vecima-rpd logging level debug
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


//9.1 Additional context if any:
