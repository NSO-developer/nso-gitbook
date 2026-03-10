# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/infoblox-nios/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/infoblox-nios/
  device
    /ncs:/device/devices/device:<name>/ned-settings/infoblox-nios/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings infoblox-nios

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings infoblox-nios
  2. infoblox-return-fields
  3. developer
  4. logger
  5. platform
  ```


# 1. ned-settings infoblox-nios
-------------------------------

  infoblox ned-settings.


    - infoblox-nios infoblox-max-result <uint32> (default 1000)

      Maximum number of objects to be returned.


    - infoblox-nios wapi-version <string> (default 2.3.1)

      The API version on device to be used.


    - infoblox-nios protocol <enum>

      Protocol to be used for communication.

      http   - http.

      https  - https.


    - infoblox-nios use-perl-for-pool-object <true|false>

      set to true to use perl api for pool objects(default is false).


    - infoblox-nios escape-special-char <true|false>

      Escape special char.


    - infoblox-nios log-verbose <true|false> (default false)

      Enabled extra verbose logging in NED (for debugging).


# 2. ned-settings infoblox-nios infoblox-return-fields
------------------------------------------------------

  Set return fields for objects.

    - infoblox-nios infoblox-return-fields <object> <return-fields>

      - object <string>

        e.g: record:a or dtc:monitor:tcp.

      - return-fields <string>

        Add attribute followed by comma e.g: "name,canonical,comment,disable".


# 3. ned-settings infoblox-nios developer
-----------------------------------------

  Contains settings used by the NED developers.


    - developer progress-verbosity <enum> (default debug)

      Maximum NED verbosity level which will be reported.

      disabled      - disabled.

      normal        - normal.

      verbose       - verbose.

      very-verbose  - very-verbose.

      debug         - debug.


# 4. ned-settings infoblox-nios logger
--------------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 5. ned-settings infoblox-nios platform
----------------------------------------

  Platform info overrides.


    - platform model <string>

      Override device model name/number.


    - platform name <string>

      Override device name.


    - platform version <string>

      Override device version.


# 6. infoblox-max-result ned-settings (optional)

Following setting can be used to define maximum number of objects to be returned.
This setting can be configured globally, per device profile or per single device.
By default it is set to 1000


1) To set max-result for all infoblox devices

```
admin@ncs% set devices global-settings ned-settings infoblox-max-result <minimum 1000 or more>
admin@ncs% commit
(Following is needed for ned-settings to take effect)
admin@ncs% request devices disconnect
admin@ncs% request devices connect
```

2) To set max-result per device profile

```
admin@ncs% set devices profiles profile infoblox-nios ned-settings infoblox-max-result <minimum 1000 or more>
admin@ncs% commit
(Following is needed for ned-settings to take effect)
admin@ncs% request devices disconnect
admin@ncs% request devices connect
```

3) To set max-result for a single infoblox device

```
admin@ncs% set devices device <device-name> ned-settings infoblox-max-result <minimum 1000 or more>
admin@ncs% commit
(Following is needed for ned-settings to take effect)
admin@ncs% request devices device <device-name> disconnect
admin@ncs% request devices device <device-name> connect
```

# 6. wapi-version ned-settings (optional)

Following setting can be used to set infoblox REST API version.
This setting can be configured globally, per device profile or per single device.
By default it is set to "2.3.1"


1) To set wapi-version for all infoblox devices

```
admin@ncs% set devices global-settings ned-settings wapi-version <e.g 2.3.1>
admin@ncs% commit
(Following is needed for ned-settings to take effect)
admin@ncs% request devices disconnect
admin@ncs% request devices connect
```

2) To set wapi-version per device profile

```
admin@ncs% set devices profiles profile infoblox-nios ned-settings wapi-version <e.g 2.3.1>
admin@ncs% commit
(Following is needed for ned-settings to take effect)
admin@ncs% request devices disconnect
admin@ncs% request devices connect
```

3) To set wapi-version for a single infoblox device

```
admin@ncs% set devices device <device-name> ned-settings wapi-version <e.g 2.3.1>
admin@ncs% commit
(Following is needed for ned-settings to take effect)
admin@ncs% request devices device <device-name> disconnect
admin@ncs% request devices device <device-name> connect
```

# 6. infoblox-return-fields ned-settings (optional)

Following setting can be used to set return fields for objects.
This setting can be configured globally, per device profile or per single device.

For example:

```
admin@ncs(config)# devices device <device-name> ned-settings infoblox-return-fields record:cname return-fields "name,comment,disable"
admin@ncs% request devices device <device-name> disconnect
admin@ncs% request devices device <device-name> connect
```

Note: in order for the above settings to take effect, you must disconnect and connect again.

# 7. use-perl-for-pool-object ned-settings (optional)

Following setting can be used to get pool configurations using perl script.
NED uses perl script to get pool configurations if use-perl-for-pool-object set to true(default false)
This setting can be configured globally, per device profile or per single device.

For example:

```
admin@ncs(config)# devices device <device-name> ned-settings infoblox-nios use-perl-for-pool-object true
admin@ncs% request devices device <device-name> disconnect
admin@ncs% request devices device <device-name> connect
```

Note: in order for the above settings to take effect, you must disconnect and connect again.

# 8. protocol ned-settings (optional)

Following setting can be used set the Hypertext Transfer Protocol to either http or https.
Default is https.


For example:

```
admin@ncs(config)# devices device <device-name> ned-settings protocol http
admin@ncs(config)# commit
admin@ncs% request devices device <device-name> disconnect
admin@ncs% request devices device <device-name> connect
```

Note: in order for the above settings to take effect, you must disconnect and connect again.

# 9. escape-special-char

There are some issue with hadnling special characters \r and \n. Check section 9.1 for more info.
If you want to send escape all \r and \n use following ned-settings. Default is false.

For example:

```
admin@ncs(config)# devices device infoblox-1 ned-settings infoblox-nios escape-special-char true
admin@ncs(config)# commit
admin@ncs# devices device <device-name> disconnect
admin@ncs# devices device <device-name> connect
```

Note: in order for the above settings to take effect, you must disconnect and connect again.
