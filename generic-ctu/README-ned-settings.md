# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/generic-ctu/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/generic-ctu/
  device
    /ncs:/device/devices/device:<name>/ned-settings/generic-ctu/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings generic-ctu

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings generic-ctu
  2. logger
  3. connection
  4. rpc-actions
     4.1. expect-patterns
     4.2. device-mapping
  5. live-status
     5.1. auto-prompts
  ```


# 1. ned-settings generic-ctu
-----------------------------


# 2. ned-settings generic-ctu logger
------------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 3. ned-settings generic-ctu connection
----------------------------------------

  Configure settings specific to the connection between NED and device.


    - connection ssh client <enum>

      Configure the SSH client to use. Relevant only when using the NED with NSO 5.6 or later.

      ganymed  - The legacy SSH client. Used on all older versions of NSO.

      sshj     - The new SSH client. Supports the latest key algorithms etc. This is the default
                 when using the NED on NSO 5.6 or later.


    - connection ssh host-key known-hosts-file <string>

      Path to openssh formatted 'known_hosts' file containing valid host keys.


    - connection ssh host-key public-key-file <string>

      Path to openssh formatted public (.pub) host key file.


    - connection ssh auth-key private-key-file <string>

      Path to openssh formatted private key file.


    - connection connector <WORD>

      Change the default connector. Default 'ned-connector-default.json'.


    - connection number-of-retries <uint8> (default 0)

      Configure max number of retries the NED will try to connect to the device before giving up.
      Default 0.


    - connection time-between-retry <uint8> (default 1)

      Configure the time in seconds the NED will wait between each connect retry. Default 1s.


    - connection terminal println-mode <enum> (default default)

      default  - System property line.separator default.

      ocrnl    - Translate carriage return to newline.

      onocr    - Translate newline to carriage return-newline.

      onlret   - Newline performs a carriage return.


# 4. ned-settings generic-ctu rpc-actions
-----------------------------------------

  RPC actions related configurations.


## 4.1. ned-settings generic-ctu rpc-actions expect-patterns
------------------------------------------------------------

  List of expected patterns and prompts when executing commands. It can be used to define custom
  expected patterns, for example to wait for a number of characters (eg .....) in order to implement
  an automatic time-out reset mechanism. NOTE: the patterns represent regular expressions.

    - rpc-actions expect-patterns <pattern>

      - pattern <string>


## 4.2. ned-settings generic-ctu rpc-actions device-mapping
-----------------------------------------------------------

  This list is used to map a device-id on the correspondingNED e.g. device-mapping oliv1-1 ned
  juniper-junos.

    - rpc-actions device-mapping <device-id> <ned>

      - device-id <string>

        The device name mapped on the speciffic NED.

      - ned <string>

        NED name.


# 5. ned-settings generic-ctu live-status
-----------------------------------------

  Configure NED settings related to live-status.


    - live-status time-to-live <int32> (default 50)

      Define time-to-live for data fetched from the device via live-status.(default 50).


## 5.1. ned-settings generic-ctu live-status auto-prompts
---------------------------------------------------------

  Pre-stored answers to device prompting questions.

    - live-status auto-prompts <id> <question> <answer>

      - id <WORD>

        List id, any string.

      - question <WORD>

        Device question, regular expression.

      - answer <WORD>

        Answer to device question.


