# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/mrv-masteros/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/mrv-masteros/
  device
    /ncs:/device/devices/device:<name>/ned-settings/mrv-masteros/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings mrv-masteros

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings mrv-masteros
  2. live-status
  3. media-select-default-value
  4. connection
  5. proxy
  6. proxy-2
  7. developer-settings
  8. behaviour
     8.1. config-error-retry
  9. logger
  ```


# 1. ned-settings mrv-masteros
------------------------------

  Control usage of NED-settings.


    - persist-to-startup-config <true|false> (default false)

      Specify if the configuration data should be persisted to startup config.


    - extended-parser <enum> (default auto)

      disabled        - Load configuration the standard way.

      turbo-mode      - The NED executes the whole command parsing by itself, completely bypassing
                        the NSO CLI parser. The configuration dump is transferred to NSO using maapi
                        setvalues call.

      turbo-xml-mode  - The NED executes the whole command parsing by itself, completely bypassing
                        the NSO CLI parser. The configuration dump is transferred to NSO in XML
                        format.

      robust-mode     - Makes the NED filter the configuration so that unmodeled content is removed
                        before being passed to the NSO CLI-engine. This protects against
                        configuration ending up at the wrong level when NSO CLI parser fallbacks
                        (which potentially can cause following config to be skipped).

      auto            - Uses turbo-mode when available, will use fastest availablemethod to load
                        data to NSO. If NSO doesn't support data-loading from CLI NED, robust-mode
                        is used.


# 2. ned-settings mrv-masteros live-status
------------------------------------------


    - live-status time-to-live <int32> (default 50)


# 3. ned-settings mrv-masteros media-select-default-value
---------------------------------------------------------

  List of default values for port media-select.

    - media-select-default-value <port> <default_mode>

      - port <uint32>

        Port number.

      - default_mode <string>

        Port's default media-select value, e.g. sfp, sfp+ or auto.


# 4. ned-settings mrv-masteros connection
-----------------------------------------

  Configure settings specific to the connection between NED and device.


    - connection ssh client <enum>

      Configure the SSH client to use. Relevant only when using the NED with NSO 5.6 or later.

      ganymed  - The legacy SSH client. Used on all older versions of NSO.

      sshj     - The new SSH client with support for the latest crypto features. This is the default
                 when using the NED on NSO 5.6 or later.


    - connection ssh host-key known-hosts-file <string>

      Path to openssh formatted 'known_hosts' file containing valid host keys.


    - connection ssh host-key public-key-file <string>

      Path to openssh formatted public (.pub) host key file.


    - connection ssh auth-key private-key-file <string>

      Path to openssh formatted private key file.


    - connection ssh keep-alive-interval <seconds> (default 0)

      Configure SSH client keep alive interval in seconds, default 0 (i.e. no keep-alive). The
      keep-alive is implemented in the client by sending an ssh 'ignore' message on the given
      interval.


    - connection number-of-retries <uint8> (default 0)

      Configure max number of retries the NED will try to connect to the device before giving up.
      Default 0.


    - connection time-between-retry <uint8> (default 1)

      Configure the time in seconds the NED will wait between each connect retry. Default 1s.


    - connection character-set <string> (default UTF-8)

      Character set to use for telnet session.


    - connection commands meta-data <WORD>

      Change the default connector. Default 'ned-connector.json'.


    - connection commands initial-action <union>

      Interactor action used to initialize a connection.


    - connection commands awaken-console <string>

      Command sent to awaken console during connection.


    - connection commands send-delay <uint32> (default 0)

      Delay in ms before sending a command during connection.


    - connection commands expect-timeout <uint32> (default 60000)

      Default limit in ms for waiting for command response.


    - connection logger silent <true|false> (default false)

      Toggle detailed logs to only written to store.


# 5. ned-settings mrv-masteros proxy
------------------------------------

  Configure NED to access device via a proxy.


    - proxy remote-connection <enum>

      Connection type between ned, proxy and device.

      ssh            - Start a new ssh client on proxy and connect to device (i.e. will launch
                       interactive shell on proxy).

      telnet         - Start a new telnet client on proxy and connect to device (i.e. will launch
                       interactive shell on proxy).

      serial         - Connect through a terminal server to device.

      ssh-direct     - Direct forward to device using ned local ssh client (i.e. without shell on
                       proxy).

      telnet-direct  - Direct forward to device using ned local telnet client (i.e. without shell on
                       proxy).


    - proxy remote-address <union>

      Address of host behind the proxy.


    - proxy remote-port <uint16>

      Port of host behind the proxy.


    - proxy remote-name <string>

      User name on the device behind the proxy.


    - proxy remote-password <string>

      Password on the device behind the proxy.


    - proxy remote-secondary-password <string>

      Second password (e.g. enable) on the device behind the proxy .WARNING MUST UPDATE connector
      template to use!.


    - proxy authgroup <WORD>

      Authentication credentials for the device behind the proxy.


    - proxy proxy-prompt <string>

      Prompt pattern on the proxy host before connecting to device.


    - proxy remote-ssh-args <string>

      Additional arguments used to establish proxy connection.


    - proxy auth-key private-key-file <string>

      Path to openssh formatted private key file for doing public key auth to device behind proxy.


    - proxy host-key-validation <true|false> (default false)

      Set this to true to force host-key validation of device behind proxy.


# 6. ned-settings mrv-masteros proxy-2
--------------------------------------

  Configure NED to access device via a second proxy.


    - proxy-2 remote-connection <enum>

      Connection type between ned, proxy and device.

      ssh            - Start a new ssh client on proxy and connect to device (i.e. will launch
                       interactive shell on proxy).

      telnet         - Start a new telnet client on proxy and connect to device (i.e. will launch
                       interactive shell on proxy).

      serial         - Connect through a terminal server to device.

      ssh-direct     - Direct forward to device using ned local ssh client (i.e. without shell on
                       proxy).

      telnet-direct  - Direct forward to device using ned local telnet client (i.e. without shell on
                       proxy).


    - proxy-2 remote-address <union>

      Address of host behind the proxy.


    - proxy-2 remote-port <uint16>

      Port of host behind the proxy.


    - proxy-2 remote-name <string>

      User name on the device behind the proxy.


    - proxy-2 remote-password <string>

      Password on the device behind the proxy.


    - proxy-2 remote-secondary-password <string>

      Second password (e.g. enable) on the device behind the proxy .WARNING MUST UPDATE connector
      template to use!.


    - proxy-2 authgroup <WORD>

      Authentication credentials for the device behind the proxy.


    - proxy-2 proxy-prompt <string>

      Prompt pattern on the proxy host before connecting to device.


    - proxy-2 remote-ssh-args <string>

      Additional arguments used to establish proxy connection.


    - proxy-2 auth-key private-key-file <string>

      Path to openssh formatted private key file for doing public key auth to device behind proxy.


    - proxy-2 host-key-validation <true|false> (default false)

      Set this to true to force host-key validation of device behind proxy.


# 7. ned-settings mrv-masteros developer-settings
-------------------------------------------------

  Contains settings used by the NED developers.


    - developer-settings load-from-file <string>

      Make the NED load a file containing raw device config when doing sync-from. Only works on
      NETSIM targets.


    - developer-settings platform model <string>

      Override device model name/number.


    - developer-settings platform name <string>

      Override device name.


    - developer-settings platform version <string>

      Override device version.


    - developer-settings device-type <enum> (default netsim)

      Real or simulated device.

      netsim  - netsim.

      device  - device.


# 8. ned-settings mrv-masteros behaviour
----------------------------------------

  NED specific behaviours.


    - behaviour config-output-max-retries <NUM> (default 90)

      Max number of retries, when sending config command to device.


    - behaviour config-output-retry-intervel <NUM> (default 1)

      Specify retry interval in seconds.


    - behaviour send-rule-enable-explicit <true|false> (default false)

      Specify if the configuration data should be persisted to startup config.


## 8.1. ned-settings mrv-masteros behaviour config-error-retry
--------------------------------------------------------------

  Device error/warning regexp entry list.

    - behaviour config-error-retry <error>

      - error <WORD>

        Warning/error regular expression, e.g. GTAC Failure .*.


# 9. ned-settings mrv-masteros logger
-------------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default false)

      Toggle logs to be added to ncs-java-vm.log.


