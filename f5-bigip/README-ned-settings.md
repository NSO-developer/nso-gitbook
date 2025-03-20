# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/f5-bigip/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/f5-bigip/
  device
    /ncs:/device/devices/device:<name>/ned-settings/f5-bigip/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings f5-bigip

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings f5-bigip
  2. trim-config-model
  3. f5-bigip-cached-show-enable
  4. rest-credentials
  5. external-rest-credentials
  6. developer-settings
     6.1. exclude-load-config
     6.2. exclude-check-sync-config
     6.3. ignore-operation-config
     6.4. input-filtering
          6.4.1. values
     6.5. exclude-partition-prefix
     6.6. config-warning-ignore
     6.7. sync-with-recursive
  7. developer
  8. imish
  9. custom-commands
  10. logger
  ```


# 1. ned-settings f5-bigip
--------------------------


    - f5-bigip device-group <string>

      Set following to execute config sync after every commit
      (run /cm config-sync to-group <device-group>)


    - f5-bigip file-download-buffer-size <string>

      When downloading a file through the live-status call
        admin@ncs% request devices device <device-name> live-status bigip-actions file download local-path <local-path> remote-file-path <remote-path>

      The default buffer size is 1 if the NED-setting file-download-buffer-size has not been set.
      This is the slowest download option but also the option where the md5sum will always match.


    - f5-bigip partition <string> (default Common/)

      Specifying partitions through ned-settings.


    - f5-bigip delay-before-send <int64> (default 0)

      A delay in milliseconds can be specified so that the NED will wait the
      specified amount of time before sending each command in the queue.


# 2. ned-settings f5-bigip trim-config-model
--------------------------------------------


    - trim-config-model include-read-only-config <true|false> (default true)

      Set to false if read-only leaves should be disabled from the config model.


    - trim-config-model include-default-config <true|false> (default true)

      Set to false if default config should be disabled from the config model.
      Default config are config that changes upon device image reversion.


# 3. ned-settings f5-bigip f5-bigip-cached-show-enable
------------------------------------------------------

  Enable cached-show.


    - f5-bigip-cached-show-enable version <true|false> (default true)

      This ned-setting is used to inject settings of some show commands
      into the config, when reading from device. The following show
      commands have some cached info:

      show sys version

      The injected 'config' can be usable in service code to check
      version. The values are injected under the  /bigip:cached-show container.

      Example of injected config:
        cached-show version version 12.0.0


# 4. ned-settings f5-bigip rest-credentials
-------------------------------------------

  Set REST credentials.


    - rest-credentials port <uint32> (default 443)


    - rest-credentials user <string> (default admin)


    - rest-credentials password <string>


# 5. ned-settings f5-bigip external-rest-credentials
----------------------------------------------------

  Use below ned-setting to force the ned to use rest-credentials
  that is retrieved through a customized action.
  This ned-setting requires that action returns the credentials
  to the "auth" tag in "username:password" string format.

  If the external action fails, the ned will try to proceed
  with the usual rest-credentials possibly set by the user.

  external-rest-credentials/callback-node-path should be set
  to the relative action location.
  external-rest-credentials/action-name should be set to the
  action name which is located in above path.

  Example (ned-setting):
    admin@ncs% set devices device <name> ned-settings f5-bigip external-rest-credentials callback-node-path /sample-action action-name get-cred-test-action
    admin@ncs% commit
    admin@ncs% request devices device <name> disconnect
    admin@ncs% request devices device <name> sync-from
    result true

  Example (external action YANG):
    container sample-action {
      tailf:action get-cred-test-action {
        tailf:info "Perform self-test of the service";
        tailf:actionpoint sample-action-self-test;
        output {
          leaf auth {
            type string;
          }
        }
      }
    }

  Example of action return (java):
    return new ConfXMLParam[] {
      new ConfXMLParamValue(nsPrefix, "auth", new ConfBuf("restUser:restPassword"))};


    - external-rest-credentials callback-node-path <string>


    - external-rest-credentials action-name <string>


# 6. ned-settings f5-bigip developer-settings
---------------------------------------------

  Contains settings used for debugging (intended for NED developers).


    - developer-settings selective-sync-from <true|false> (default false)

      Set to true if a check over what modules the device has is needed before fetching config.


    - developer-settings no-hostname-verification <true|false> (default false)

      If hostname is not recognized by the server, this can turn off hostname verification.
      By using this ned-setting the device's certificate subjectAltName field is never checked


    - developer-settings use-bigip-transaction <true|false> (default false)

      Configures the usage of bigip transactions.


    - developer-settings load-from-file <string>

      Make the NED load a file containing raw device config when doing sync-from.


    - developer-settings load-from-path <string>

      List path this config belongs to.


    - developer-settings sync-from-path-filename <string>

      Specify the path and filename to sync-from.


    - developer-settings multi-partition-check-sync <true|false> (default false)

      If multiple partitions are in use and check-sync shall take it into account then the following NED-Setting needs to be set to true.

      When issuing a check-sync with the NED-Setting "multi-partition-check-sync" set to true the device sometime return config changes not issued by the  NED.
      This will cause an out of sync even though there has been no config change through the NED. This can happen sporadically on the device.
      One way to avoid these kind of sporadical out of sync in check-sync is to exclude these config from being used.


    - developer-settings reuse-hardware-data <true|false> (default false)

      By default hardware data will be fetched every time the NED connects.
      Specify true if existing hardware data is to be reused, reducing the number of device calls


    - developer-settings sync-from-all-partitions <true|false> (default false)

      Specify true if the configs from all partition should be fetched.
      Please check README 7.12. Writing and reading to all partitions with one device instance
      before using this ned-setting


    - developer-settings sync-from-verbose-detailed <true|false> (default false)

      Specify if sync-from verbose shall list detailed paths.


    - developer-settings exit-tmsh-command <string> (default quit)

      Specify what command should be issued when exiting tmsh. Default is quit.


    - developer-settings enter-imish-command <string> (default )

      DEPRECATED


## 6.1. ned-settings f5-bigip developer-settings exclude-load-config
--------------------------------------------------------------------

  Exclude config to be loaded into the NED, for example ltm rule _sys_.*.

    - developer-settings exclude-load-config <config-component> <config-name>

      - config-component <string>

        Specify the config component to be excluded, for example ltm rule.

      - config-name <string>

        Specify the config name to be excluded, for example _sys_.*.


## 6.2. ned-settings f5-bigip developer-settings exclude-check-sync-config
--------------------------------------------------------------------------

  Exclude config to be used during check-sync, for example sys snmp .*.

    - developer-settings exclude-check-sync-config <config-component> <config-name>

      - config-component <string>

        Specify the config component to be excluded, for example sys snmp.

      - config-name <string>

        Specify the config name to be excluded, for example .*.


## 6.3. ned-settings f5-bigip developer-settings ignore-operation-config
------------------------------------------------------------------------

  Specify operation and config component to be ignored by the NED,
  for example modify /sys crypto cert.*

    - developer-settings ignore-operation-config <operation-and-config-component>

      - operation-and-config-component <string>

        Specify the operation and config component to be ignored by the NED,
        for example modify /sys crypto cert.*


## 6.4. ned-settings f5-bigip developer-settings input-filtering
----------------------------------------------------------------

  Specify what input data shall be filtered.

    - developer-settings input-filtering <path-to-leaf>

      - path-to-leaf <string>

        Path to the leaf which the input data shall be filtered e.g /net/self/vlan.


### 6.4.1. ned-settings f5-bigip developer-settings input-filtering values
--------------------------------------------------------------------------

  In this example }VLAN123}bad-data is to be replaced with VLAN123.

    - values <filtered-value> <unfiltered-values>

      - filtered-value <string>

        Specify the correct value after filtering e.g VLAN123.

      - unfiltered-values <string>

        Specify the unfiltered value which are to be filtered e.g }VLAN123}bad-data.


## 6.5. ned-settings f5-bigip developer-settings exclude-partition-prefix
-------------------------------------------------------------------------

  Specify a regex for the paths that should not have the partition name added as a prefix. Example:
  '.*auth/partition.*.

    - developer-settings exclude-partition-prefix <path-to-exclude>

      - path-to-exclude <string>

        A regex which matches the path to exclude.


## 6.6. ned-settings f5-bigip developer-settings config-warning-ignore
----------------------------------------------------------------------

  Device warning regexp entry list.

    - developer-settings config-warning-ignore <warning>

      - warning <WORD>

        Warning regular expression, e.g. .* does not exist.*.


## 6.7. ned-settings f5-bigip developer-settings sync-with-recursive
--------------------------------------------------------------------

  Specify config component to be fetched by the NED with keyword:recursive.

    - developer-settings sync-with-recursive <component>

      - component <string>

        Component, example: ltm virtual.


# 7. ned-settings f5-bigip developer
------------------------------------

  Contains settings used for debugging (intended for NED developers).


    - developer platform model <string>

      Override device model name/number.


    - developer platform name <string>

      Override device name.


    - developer platform version <string>

      Override device version.


    - developer progress-verbosity <enum> (default debug)

      Maximum NED verbosity level which will get written in devel.log file.

      disabled      - disabled.

      normal        - normal.

      verbose       - verbose.

      very-verbose  - very-verbose.

      debug         - debug.


# 8. ned-settings f5-bigip imish
--------------------------------


    - imish use-imish <true|false> (default false)


    - imish delay-before-imish <uint32> (default 10000)

      Time in milliseconds to delay sending imish config.
      (See README sec. 7.18.)


# 9. ned-settings f5-bigip custom-commands
------------------------------------------

  Specify custom commands the ned should use.


    - custom-commands save-command <string> (default save sys config)

      Specify what save command the ned should issue after commit.


# 10. ned-settings f5-bigip logger
----------------------------------


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default false)

      Toggle logs to be added to ncs-java-vm.log.


