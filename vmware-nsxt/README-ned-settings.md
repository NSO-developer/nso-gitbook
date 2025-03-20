# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/vmware-nsxt/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/vmware-nsxt/
  device
    /ncs:/device/devices/device:<name>/ned-settings/vmware-nsxt/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings vmware-nsxt

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings vmware-nsxt
  2. connection
  3. logger
  4. developer
  ```


# 1. ned-settings vmware-nsxt
-----------------------------


    - vmware-nsxt env <enum> (default PROD)

      DEV    - DEV.

      TEST   - TEST.

      STAGE  - STAGE.

      PROD   - PROD.


# 2. ned-settings vmware-nsxt connection
----------------------------------------

  Configure settings specific to the connection between NED and device.


    - connection api base-url default <string> (default /api/v1)

      API default base URL for device REST API.


    - connection api base-url policy <string> (default /policy/api/v1)


    - connection api config policy scope <enum> (default infra)

      infra         - infra.

      global-infra  - global-infra.


    - connection api url use-name-as-id <true|false> (default true)

      Set to FALSE to generate a UUID for newly created resources.
      Otherwise, the resource's list key/name will be used as API identifier


    - connection api url encode-url-param <uint8> (default 2)

      Set the number of times the URL params will be UTF-8 encoded.


    - connection api proto default <string>


    - connection api auth scheme <enum> (default basic)

      API supports several different authentication schemes.

      basic  - Used to authenticate a request using HTTP Basic authentication.


    - connection ssh client <enum>

      Configure the SSH client to use. Relevant only when using the
      NED with NSO 5.6 or later.

      ganymed  - The legacy SSH client. Used on all older versions of NSO.

      sshj     - The new SSH client with support for the latest crypto features.

                                                     This is the default when using the NED on NSO
                 5.6 or later.


    - connection ssh host-key known-hosts-file <string>

      Path to openssh formatted 'known_hosts' file containing valid
      host keys.


    - connection ssh host-key public-key-file <string>

      Path to openssh formatted public (.pub) host key file.


    - connection ssh auth-key private-key-file <string>

      Path to openssh formatted private key file.


    - connection ssl accept-any <true|false> (default false)

      Accept any SSL certificate presented by the device. Warning!
      This enables Man in the Middle attacks and should only be used
      for testing and troubleshooting.


    - connection ssl certificate <binary>

      SSL certificate stored in DER format but since it is entered
      as Base64 it is very similar to PEM but without banners like "-----
      BEGIN CERTIFICATE -----". Default uses the default trusted certificates
      installed in Java JVM. An easy way to get the PEM of a server:
      openssl s_client -connect HOST:PORT


# 3. ned-settings vmware-nsxt logger
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


# 4. ned-settings vmware-nsxt developer
---------------------------------------

  Contains settings used for debugging (intended for NED developers).


    - developer trace-enable <true|false> (default false)

      Enable developer tracing. WARNING: may choke NSO with large commits|systems.


    - developer trace-connection <true|false> (default false)

      Enable connection tracing. WARNING: may choke NSO with IPC messages.


    - developer trace-timestamp <true|false> (default false)

      Add timestamp from NED instance in trace messages for debug purpose.


    - developer progress-verbosity <enum> (default debug)

      Maximum NED verbosity level which will get written in devel.log
      file

      disabled      - disabled.

      normal        - normal.

      verbose       - verbose.

      very-verbose  - very-verbose.

      debug         - debug.


