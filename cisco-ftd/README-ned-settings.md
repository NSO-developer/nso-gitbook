# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/cisco-ftd/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/cisco-ftd/
  device
    /ncs:/device/devices/device:<name>/ned-settings/cisco-ftd/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings cisco-ftd

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings cisco-ftd
  2. logger
  3. connection
     3.1. alternative-hosts
  4. platform
  5. nedBehavior
  6. live-status
  ```


# 1. ned-settings cisco-ftd
---------------------------


# 2. ned-settings cisco-ftd logger
----------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 3. ned-settings cisco-ftd connection
--------------------------------------

  Configure settings specific to the connection between NED and device.


    - connection ha ha-change-state-wait-time <int32> (default 180)

      The amount of time in seconds the NED will wait a ftd NODE to exit HA_CONFIGURATION_SYNC and
      HA_NEGOTIATING_NODE state.


    - connection ssl accept-any <true|false> (default true)

      Accept any SSL certificate presented by the device.
      Warning! This enables Man in the Middle attacks and
      should only be used for testing and troubleshooting.


    - connection ssl certificate <binary>

      SSL certificate stored in DER format but since it is entered
      as Base64 it is very similar to PEM but without banners like
      "----- BEGIN CERTIFICATE -----".

      Default uses the default trusted certificates installed in
      Java JVM.

      An easy way to get the PEM of a server:
      openssl s_client -connect HOST:PORT


## 3.1. ned-settings cisco-ftd connection ha alternative-hosts
--------------------------------------------------------------

  The NED can automatically connect to the other device in the HA pair.
  The NED will try to connect to these in case of main node failure.

    - connection ha alternative-hosts <host>

      - host <union>


# 4. ned-settings cisco-ftd platform
------------------------------------

  Platform info overrides.


    - platform model <string>

      Override device model name/number.


    - platform name <string>

      Override device name.


    - platform version <string>

      Override device version.


# 5. ned-settings cisco-ftd nedBehavior
---------------------------------------


    - nedBehavior autoEndEasySetup <true|false> (default false)

      Automatically sends easysetupstatus action.


    - nedBehavior enableAutoDeploy <true|false> (default false)

      Enables deploy after each commit.


    - nedBehavior smartagentconnectionsTimeout <uint32> (default 400)

      Timeout in seconds to wait license registration.


    - nedBehavior callHaJoinAfterHaConfig <true|false> (default false)

      If enable the Ned will call ha/join action after each HA config modification.


    - nedBehavior callHaBreakBeforeHaConfigClean <true|false> (default false)

      If enable the Ned will call ha/break action before each empty HA config only if nodeRole ==
      HA_PRIMARY.


    - nedBehavior ignoreLicenseCheck <true|false> (default false)

      If enabled, the success of license registration will not checked
      (only in case:EVAL--> REGISTERED using PUT /license/smartagentconnections)


    - nedBehavior ignore-license-delete <true|false> (default false)

      If enabled delete operations to /ftd/license/smartagentconnections will be ignored.


    - nedBehavior retrieve-old-license-token-val <true|false> (default false)

      If enabled, at sync-from will provide the last configured token in the CDB.


# 6. ned-settings cisco-ftd live-status
---------------------------------------

  Configure NED settings related to live-status.


    - live-status time-to-live <int32> (default 50)

      Define time-to-live for data fetched from the device via live-status.(default 50).


