# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/nokia-apc/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/nokia-apc/
  device
    /ncs:/device/devices/device:<name>/ned-settings/nokia-apc/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings nokia-apc

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings nokia-apc
  2. connection
  3. logger
  4. developer
  ```


# 1. ned-settings nokia-apc
---------------------------


# 2. ned-settings nokia-apc connection
--------------------------------------

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


    - connection remote-protocol <enum> (default https)

      remote protocol for APC SOAP API, http or https.

      http   - http.

      https  - https.


    - connection apc-uri <string> (default /soap/services/ApcRemotePort)

      API base URI for device APC SOAP API.


    - connection managed-element-mgr-uri <string> (default /idm/services/ManagedElementMgr)

      API base URI for device ManagedElementMgr SOAP API.


    - connection api-version <string> (default 9.7)

      API version for APC SOAP API.


    - connection ssl accept-any <true|false>

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


    - connection skip-errors <true|false> (default false)

      enable this to skip over errors when the nokia device randomly fails to reply to read requests.
      !!! be aware that it can lead to undefined behaviour where the CDB / device / trans-id will no longer be in sync !!!


    - connection soap-read-timeout <uint32> (default 60)

      this timeout sets how long the NED will wait after each read request.
      depending on the value of skip-errors, the NED will throw an exception or silently ignore time-outs


# 3. ned-settings nokia-apc logger
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


# 4. ned-settings nokia-apc developer
-------------------------------------

  Contains settings used by the NED developers.


    - developer trace-enable <true|false> (default false)

      Enable developer tracing. WARNING: may choke NSO with large commits|systems.


    - developer trace-connection <true|false> (default false)

      Enable connection tracing. WARNING: may choke NSO with IPC messages.


    - developer trace-timestamp <true|false> (default false)

      Add timestamp from NED instance in trace messages for debug purpose.


    - developer platform model <string>

      Override device model name/number.


    - developer platform name <string>

      Override device name.


    - developer platform version <string>

      Override device version.


# 5. ned-settings nokia-apc connection skip-errors and soap-read-timeout
------------------------------------------------------------------------

  In some specific circumstances the Nokia-Apc device can randomly fail to respond to read commands.

  In those cases the NED will freeze waiting for the device to respond to the current request, or it can throw an exception and stop the current operation.

  The customers requested (NAPC-21/CSP-7127/ BSP-3349) a feature that will allow the NED to continue working by setting a specific time-out for each read operation and by allowing read errors to be silently ignored.
  *This will allow the code to continue working, but will add uncertainty in the data used by trans-id, compare-config and sync-from.*


  - ned-settings nokia-apc connection skip-errors: if TRUE the code will silently skip read errors. It will also signal this in the log file, if enabled, by printing a line "warning: skipped communication error ..." along the SOAP request that trigered the error. If FALSE, an exception will be generated and the current operation will stop.

  - ned-settings nokia-apc connection soap-read-timeout: this is the time-out value, in seconds. The NED will handle a time-out depending on the value of `ned-settings nokia-apc connection skip-errors`. The user should set a sensible value - one that will cover all possible device delays.
