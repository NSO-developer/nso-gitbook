# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/tilgin-tgem/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/tilgin-tgem/
  device
    /ncs:/device/devices/device:<name>/ned-settings/tilgin-tgem/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings tilgin-tgem

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings tilgin-tgem
  2. logger
  3. connection
  4. api
     4.1. info
     4.2. device
  5. developer
  ```


# 1. ned-settings tilgin-tgem
-----------------------------


    - env <enum> (default prod)

      dev    - dev.

      test   - test.

      stage  - stage.

      prod   - prod.


# 2. ned-settings tilgin-tgem logger
------------------------------------

  Settings for controlling logs generated.


    - level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 3. ned-settings tilgin-tgem connection
----------------------------------------

  Configure settings specific to the connection between NED and device.


    - remote-protocol <enum>

      http   - http.

      https  - https.


    - ssh client <enum>

      Configure the SSH client to use. Relevant only when using the NED with NSO 5.6 or later.

      ganymed  - The legacy SSH client. Used on all older versions of NSO.

      sshj     - The new SSH client with support for the latest crypto features. This is the default
                 when using the NED on NSO 5.6 or later.


    - ssh host-key known-hosts-file <string>

      Path to openssh formatted 'known_hosts' file containing valid host keys.


    - ssh host-key public-key-file <string>

      Path to openssh formatted public (.pub) host key file.


    - ssh auth-key private-key-file <string>

      Path to openssh formatted private key file.


    - api-address <string>

      API address for device REST API.


    - api-base-url <string> (default /nbi/soap)

      API base URL for device REST API.


    - api-auth method <enum> (default headers)

      headers  - headers.


    - api-auth credentials username <string>


    - api-auth credentials password <string>


    - api-auth headers username <string> (default Username)


    - api-auth headers password <string> (default Password)


    - ssl accept-any <true|false>

      Accept any SSL certificate presented by the device.
      Warning! This enables Man in the Middle attacks and
      should only be used for testing and troubleshooting.


    - ssl certificate <binary>

      SSL certificate stored in DER format but since it is entered
      as Base64 it is very similar to PEM but without banners like
      "----- BEGIN CERTIFICATE -----".

      Default uses the default trusted certificates installed in
      Java JVM.

      An easy way to get the PEM of a server:
      openssl s_client -connect HOST:PORT


    - logger silent <true|false> (default false)

      Toggle detailed logs to only written to store.


# 4. ned-settings tilgin-tgem api
---------------------------------

  Configure settings specific to the interaction between NED and device API.


    - web-service type <enum> (default soap)

      soap  - soap.


    - request page-size <uint32> (default 50000)

      Page size.


    - sync config actions commit sortable-services default disabled <true|false> (default true)


    - sync devices actions send-signal payload type <enum> (default contact)

      contact  - contact.

      reboot   - reboot.

      reset    - reset.


    - sync devices actions send-signal payload timeout <uint32> (default 10000)


    - sync devices actions send-signal disabled <true|false> (default false)


    - sync devices meta key-info <enum> (default uid)

      Which device info to be used as key. Device info must be enabled.

      uid  - uid.

      mac  - mac.


    - sync devices filters filter-by <enum> (default query)

      Select which filters to be used for searching Devices.

      uid     - uid.

      oui     - oui.

      serial  - serial.

      mac     - mac.

      query   - query.


    - sync devices filters values uid <string>

      Set "uid" filter values.


    - sync devices filters values oui <string>

      Set "oui" filter values.


    - sync devices filters values serial <string>

      Set "serial" filter values.


    - sync devices filters values mac <string>

      Set "mac" filter values.


    - sync devices filters values query operator <enum> (default AND)

      Set the logical operator to be used
      between info based filters and generic queries.
      If AND is selected: the generic queries will be added to each info based filter iteration.
      If OR is selected: the generic queries will be queued to the info based filters list and
      will be used on a separate query iteration.

      AND  - AND.

      OR   - OR.


    - sync devices filters values query statements <string> (default uid:*)

      Set generic queries:
      * List of '[-]key:value' pairs; Use "-" before a key to negate the criterion.
      *              key is one of INFO_TYPE_* constants plus 'label', 'tag', 'tagset' and 'parameter' strings;
      *              value is freetext, can have "*",
      *              in case of 'parameter' key the value must be in form: 'param_path=param_value' (both param_path and param_value can have '*')
      *              Example: ['serial:V620*','-label:pending','parameter:*.DeviceInfo.ProvisionCode=12345']
      *              For INFO_TYPE - 'INFO_TYPE_LAST_CONTACT_TIME', search can be performed in follwing ways :-
      *                1. lastcontacttime:yyyy-mm-dd HH:MM; *  :- example ['lastcontacttime':2015-06-14 13:00;*] this will count from date 2015-06-14 13:00 till now.
      *                2. lastcontacttime:*; yyyy-mm-dd HH:MM  :- example ['lastcontacttime':*;2015-06-15 13:00] this will count all devices till 2015-06-15 13:00.
      *                3. lastcontacttime:yyyy-mm-dd HH:MM; yyyy-mm-dd HH:MM  :- example ['lastcontacttime':2015-06-14 13:00;2015-06-15 13:00] this will count from date 2015-06-14 13:00 till date 2015-06-15 13:00.
      *                4. lastcontacttime:*;*  :- example ['lastcontacttime':*;*] this will count all devices.


    - owner enabled <true|false> (default false)

      Enable NSO Service Ownership.


    - owner is <string>

      Default Service Name.


## 4.1. ned-settings tilgin-tgem api sync devices info
------------------------------------------------------

  Configure which Device info to be retrieved from the API.

    - sync devices info <name> <enabled>

      - name <enum>

        oui     - oui.

        serial  - serial.

        status  - status.

        mac     - mac.

      - enabled <true|false> (default false)


## 4.2. ned-settings tilgin-tgem api owner of device
----------------------------------------------------

    - owner of device <uid> <is>

      - uid <string>

        oui-serial.

      - is <string>

        Service Name.


# 5. ned-settings tilgin-tgem developer
---------------------------------------

  Contains settings used by the NED developers.


    - trace-enable <true|false> (default false)

      Enable developer tracing. WARNING: may choke NSO with large commits|systems.


    - trace-connection <true|false> (default false)

      Enable connection tracing. WARNING: may choke NSO with IPC messages.


    - trace-timestamp <true|false> (default false)

      Add timestamp from NED instance in trace messages for debug purpose.


    - platform model <string>

      Override device model name/number.


    - platform name <string>

      Override device name.


    - platform version <string>

      Override device version.


