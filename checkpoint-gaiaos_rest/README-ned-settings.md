# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/checkpoint-gaiaos_rest/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/checkpoint-gaiaos_rest/
  device
    /ncs:/device/devices/device:<name>/ned-settings/checkpoint-gaiaos_rest/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings checkpoint-gaiaos_rest

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings checkpoint-gaiaos_rest
  2. logger
  3. read
  4. domain
  5. config-mode-config
     5.1. block-cli-line
     5.2. exclude-load-config
     5.3. special-prompt-handling
  6. connection
  7. fetch-REST-config
  8. block-nat-rule-positions
  9. block-rest-call-body
  10. functionality-update
  11. transaction-id
  12. rest-show-limits
  13. rest-show-body-params
  14. developer-settings
     14.1. ignore-device-warnings
     14.2. request-body-additions
  15. developer
  16. db-edit-config
  17. vsx-settings
     17.1. vsx-credentials
  18. mgmt
     18.1. object
  ```


# 1. ned-settings checkpoint-gaiaos_rest
----------------------------------------


    - checkpoint-gaiaos_rest log-verbose <true|false> (default false)

      [DEPRECATED] Enabled extra verbose logging in NED (for debugging).


    - checkpoint-gaiaos_rest use-mgmt-api <true|false> (default false)

      Specify if Management REST API configuration should be used.


    - checkpoint-gaiaos_rest use-rest-configuration <true|false> (default true)

      Specify if REST configuration should be used.


    - checkpoint-gaiaos_rest use-movable-nat-rules <true|false> (default false)

      Enable using movable-nat-rules.

      Note: The value of this ned-setting is mirrored in the config YANG model in a hidden leaf and the
      value is copied during sync-from. If no sync-from has been done a partial-sync-from on the
      hidden leaf needs to be done to avoid failures due to 'when' expressions involving this leaf.

      For example:
      admin@ncs(config)# devices partial-sync-from path [ /ncs:devices/device[name='dev-1']/config/use-movable-nat-rule ]
      sync-result {
      device dev-1
      result true
      }


    - checkpoint-gaiaos_rest rest-show-limit <uint32> (default 500)

      [DEPRECATED] Use rest-show-limits.


    - checkpoint-gaiaos_rest clear-sessions <true|false> (default false)

      Specify if stale sessions should be cleared before device write.


# 2. ned-settings checkpoint-gaiaos_rest logger
-----------------------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle wether logs should be added to ncs-java-vm.log.


# 3. ned-settings checkpoint-gaiaos_rest read
---------------------------------------------

  Read from device ned-settings.


    - read parallel-api-calls <enum> (default disable)

      Enable/Disable parallel api calls invocation using Threads during sync-from.

      disable  - disable.

      enable   - enable.


    - read transaction-id-provisional <true|false> (default true)

      Enable/Disable use of new NSO feature to set provisional transaction-id in show() to save a
      call to getTransId() with sync-from.


    - read throw-on-http-fivehundred-codes <true|false> (default true)

      When a REST API call fails with a 5XX HTTP Status code during sync-from the NED will throw an error instead of just logging it.
      Note: Disabling this ned-setting is not recommended as it can lead to config diff issues.


# 4. ned-settings checkpoint-gaiaos_rest domain
-----------------------------------------------

  Domain settings for multi-domain.


    - domain name <string>

      Specify the domain to log in to.


    - domain local-domain-config-only <true|false> (default false)

      Only store local domain config.


# 5. ned-settings checkpoint-gaiaos_rest config-mode-config
-----------------------------------------------------------

  Control the usage of config mode configurations.


    - config-mode-config use-config-mode-configuration <true|false> (default false)

      Specify if config mode configuration should be used.


    - config-mode-config is-gateway-device <true|false> (default false)

      Specify if this device is a gateway device.


    - config-mode-config expert-mode-password <string>

      Specify the expert mode password.


    - config-mode-config save-config <true|false> (default false)

      Specify if save config should be issued after every transaction.


    - config-mode-config clienv-rows-all-config <uint8> (default 0)

      deprecated.


    - config-mode-config ospf2-instance <string>

      Configuring accept|restrict-all-ipv4
      On the device one can configure an inbound-route-filter with either
      "accept-all-ipv4" or "restrict-all-ipv4". In the NED, this is instead
      modelled as a boolean, thus accept|restrict-all-ipv4 are configured as
      follows:
      accept-all-ipv4   -> accept-all-ipv4 true
      restrict-all-ipv4 -> accept-all-ipv4 false

      Ospf2 instances
      On some devices one can configure inbound-route-filter for different
      ospf instances, while on other devices such instances are not used. To
      accommodate this, if "instance <instance>" is not configurable on your
      device, the ned-setting ospf2-instance must be set to some value:
      admin@ncs(config)# devices device <dev> ned-settings checkpoint-gaiaos_rest config-mode-config ospf2-instance "default"

      Command example for device which support ospf2 instance:
      set inbound-route-filter ospf2 instance default rank default

      Command example for device which does not support ospf2 instance:
      set inbound-route-filter ospf2 rank default


    - config-mode-config use-expert-mode <true|false> (default false)

      Specify if expert mode should be used as standard mode.


## 5.1. ned-settings checkpoint-gaiaos_rest config-mode-config block-cli-line
-----------------------------------------------------------------------------

  Specify what config line the NED should not send to the device.

    - config-mode-config block-cli-line <name>

      - name <string>

        Specify what config the NED should not send since the device automatically configures it.


## 5.2. ned-settings checkpoint-gaiaos_rest config-mode-config exclude-load-config
----------------------------------------------------------------------------------

  Exclude config to be loaded into the NED. Only supports the exclusion of
  /config_mode_config/rba/role today.

    - config-mode-config exclude-load-config <config-component> <config-name>

      - config-component <string>

        Specify the config component to be excluded, for example rba role.

      - config-name <string>

        Specify the config name to be excluded, for example adminRole or a regex
        (admin|cloningAdmin|monitor)Role.


## 5.3. ned-settings checkpoint-gaiaos_rest config-mode-config special-prompt-handling
--------------------------------------------------------------------------------------

  Depending on the checkpoint device some commands in config_mode_config might require special handling of the prompt.

  This section lists all commands that the NED have implementation for which require special handling:
  set net-access telnet on
  If a needed command is not supported then the NED can be enhanced to support it.

    - config-mode-config special-prompt-handling <command>

      - command <string>

        Example: set net-access telnet on.


# 6. ned-settings checkpoint-gaiaos_rest connection
---------------------------------------------------

  Per device connection configuration.


    - connection hostname-verification <true|false> (default true)

      deprecated.


    - connection rest-port <uint16> (default 443)

      Port number for the REST API.


    - connection auth enter-last-published-session <true|false> (default false)

      Login to last published session when you don't need to make any changes or updates.


    - connection auth check <true|false> (default true)

      Check and authenticate on 401 response.


    - connection number-of-retries <uint8> (default 0)

      Configure max number of retries the NED will try to connect to the device before giving up.
      Default 0.


    - connection time-between-retry <uint8> (default 1)

      Configure the time in seconds the NED will wait between each connect retry. Default 1s.


# 7. ned-settings checkpoint-gaiaos_rest fetch-REST-config
----------------------------------------------------------

  By default checkpoint-gaiaos_rest NED fetches all the config which the YANG-model supports.
  If performance is of importance it is possible to excluding config not needed and thereby increase it.

  Note that the order you set the objects in the NED-settings matter. Set the object with least dependencies first.
  For example: Package can contain access-layer, access-layer can contain service-tcp but service-tcp cannot contain any of the other objects.
  Therefor we set service-tcp first, then access-layer and finally package.

    - checkpoint-gaiaos_rest fetch-REST-config <name>

      - name <string>

        Specify what config the NED should fetch.


# 8. ned-settings checkpoint-gaiaos_rest block-nat-rule-positions
-----------------------------------------------------------------

  Specify what nat-rule position commands the NED will not send.

    - checkpoint-gaiaos_rest block-nat-rule-positions <name>

      - name <string>

        Example: 99 would mean that no command involving
        nat-rule 99 will be sent


# 9. ned-settings checkpoint-gaiaos_rest block-rest-call-body
-------------------------------------------------------------

  Specify the rest path and body to be blocked.

    - checkpoint-gaiaos_rest block-rest-call-body <path> <regex>

      - path <string>

        Specify the rest path to be blocked. Example: set-package.

      - regex <string>

        Regex matching the json body to be blocked. Example: .*installation-targets.*add.*all.*.


# 10. ned-settings checkpoint-gaiaos_rest functionality-update
--------------------------------------------------------------

  Contains flags which updates extisting NED functionality.


    - functionality-update access-rule-naming <true|false> (default false)

      Allows no, unique, or duplicated name for /access-layer/access-rule.

      If enabled then:
         * /access-layer/access-rule/name: will only be used as a NED internal identifier
         * /access-layer/access-rule/name-on-device: will be sent to the device as rule name if configured

         * If the /access-layer/access-rule was created on the device then:
           * if it has a name:
             the uid will be used as the value for
               /access-layer/access-rule/name

             the name will be used as the value for
               /access-layer/access-rule/name-on-device

           * if it does not have a name:
             the uid will be used as the value for
               /access-layer/access-rule/name

      Note: The value of this ned-setting is mirrored in the config YANG model in a hidden leaf and the
            value is copied during sync-from. If no sync-from has been done a partial-sync-from on the
            hidden leaf needs to be done to avoid failures due to 'when' expressions involving this leaf.

            For example:
              admin@ncs(config)# devices partial-sync-from path [ /ncs:devices/device[name='dev-1']/config/access-rule-naming ]
              sync-result {
                 device dev-1
                 result true
              }


# 11. ned-settings checkpoint-gaiaos_rest transaction-id
--------------------------------------------------------

  Contains flags which modifies the transaction id calculations.


    - transaction-id use-show-changes <true|false> (default false)

      Specify if show-changes should be used for checking if the ned is in sync.


    - transaction-id use-to-session <true|false> (default true)

      Specify if show-changes should use to-session parameter.


# 12. ned-settings checkpoint-gaiaos_rest rest-show-limits
----------------------------------------------------------

  Specify how many objects each rest call shall fetch.


    - rest-show-limits default <uint16> (default 500)


    - rest-show-limits access-rulebase <uint16> (default 150)


# 13. ned-settings checkpoint-gaiaos_rest rest-show-body-params
---------------------------------------------------------------


    - rest-show-body-params dereference-group-members <true|false> (default true)

      Indicates whether to dereference "members" field by details level for every object in reply.


# 14. ned-settings checkpoint-gaiaos_rest developer-settings
------------------------------------------------------------

  Developer settings.


    - developer-settings publish <true|false> (default true)

      Specify if publish shall be issued after every REST commit.


    - developer-settings sleep-after-publish <uint16> (default 0)

      Specify how long in seconds the NED should sleep after mgmt publish.


    - developer-settings polling-interval <uint16> (default 0)

      Configure in seconds how long the NED should wait between show-task calls after publish.
      Stops when status is succeeded or progress-percentage is 100


    - developer-settings polling-timeout <uint16> (default 30)

      Configure the polling timeout(seconds).


    - developer-settings send-REST-rollbacks <true|false> (default false)

      [DEPRECATED].


    - developer-settings cluster-member-interface-filter <true|false> (default false)

      Enable the filtering of /simple-cluster/cluster-members/interfaces.
      Occasionally, error in the device's response has been encountered when set to true.

      The device accepts both the unfiltered and filtered POST for /simple-cluster/cluster-members/interfaces.

      admin@ncs% set devices device <device-name> ned-settings checkpoint-gaiaos_rest developer-settings
       cluster-member-interface-filter true
      admin@ncs(config)% commit
      admin@ncs(config)% request devices device <device-name> disconnect
      admin@ncs(config)% request devices device <device-name> sync-from
      result true
      admin@ncs(config)%

      Note: in order for the above settings to take effect, you must disconnect and do sync-from.

      Test commands:
      Step 1: add the cluster
         set devices device <device-name> config simple-cluster SC ipv4-address 1.1.1.22
         set devices device <device-name> config simple-cluster SC cluster-members M1 interfaces XXX ipv4-network-mask 255.255.255.0 ipv4-address 1.1.1.11
         set devices device <device-name> config simple-cluster SC cluster-members M1 interfaces YYY ipv4-network-mask 255.255.255.0 ipv4-address 1.1.1.11
         set devices device <device-name> config simple-cluster SC cluster-members M2 interfaces XXX ipv4-network-mask 255.255.255.0 ipv4-address 1.1.1.11
         set devices device <device-name> config simple-cluster SC cluster-members M2 interfaces YYY ipv4-network-mask 255.255.255.0 ipv4-address 1.1.1.11
         set devices device <device-name> config simple-cluster SC cluster-members M3 interfaces XXX ipv4-network-mask 255.255.255.0 ipv4-address 1.1.1.11
         set devices device <device-name> config simple-cluster SC cluster-members M3 interfaces YYY ipv4-network-mask 255.255.255.0 ipv4-address 1.1.1.11
         commit no-networking

      Step 2: add the interfaces
         set devices device <device-name> config simple-cluster SC interfaces AAA ipv4-mask-length 32 ipv4-network-mask 255.255.255.0 ipv4-address 1.1.1.11 interface-type cluster
         set devices device <device-name> config simple-cluster SC interfaces BBB ipv4-mask-length 32 ipv4-network-mask 255.255.255.0 ipv4-address 1.1.1.11 interface-type cluster
         set devices device <device-name> config simple-cluster SC interfaces CCC ipv4-mask-length 32 ipv4-network-mask 255.255.255.0 ipv4-address 1.1.1.11 interface-type cluster
         set devices device <device-name> config simple-cluster SC cluster-members M1 interfaces AAA ipv4-network-mask 255.255.255.0 ipv4-address 1.1.1.11
         set devices device <device-name> config simple-cluster SC cluster-members M1 interfaces BBB ipv4-network-mask 255.255.255.0 ipv4-address 1.1.1.11
         set devices device <device-name> config simple-cluster SC cluster-members M1 interfaces CCC ipv4-network-mask 255.255.255.0 ipv4-address 1.1.1.11
         set devices device <device-name> config simple-cluster SC cluster-members M2 interfaces AAA ipv4-network-mask 255.255.255.0 ipv4-address 1.1.1.11
         set devices device <device-name> config simple-cluster SC cluster-members M2 interfaces BBB ipv4-network-mask 255.255.255.0 ipv4-address 1.1.1.11
         set devices device <device-name> config simple-cluster SC cluster-members M2 interfaces CCC ipv4-network-mask 255.255.255.0 ipv4-address 1.1.1.11
         set devices device <device-name> config simple-cluster SC cluster-members M3 interfaces AAA ipv4-network-mask 255.255.255.0 ipv4-address 1.1.1.11
         set devices device <device-name> config simple-cluster SC cluster-members M3 interfaces BBB ipv4-network-mask 255.255.255.0 ipv4-address 1.1.1.11
         set devices device <device-name> config simple-cluster SC cluster-members M3 interfaces CCC ipv4-network-mask 255.255.255.0 ipv4-address 1.1.1.11
         commit dry-run outformat native

      Without filtering:
          POST /web_api/set-simple-cluster
          {
            "interfaces": {"add": [{
              "comments": "",
              "ipv4-address": "1.1.1.11",
              "ipv4-mask-length": 32,
              "color": "black",
              "interface-type": "cluster",
              "name": "AAA",
              "ipv4-network-mask": "255.255.255.0"
            }]},
            "name": "SC"
          }
          POST /web_api/set-simple-cluster
          {
            "interfaces": {"add": [{
              "comments": "",
              "ipv4-address": "1.1.1.11",
              "ipv4-mask-length": 32,
              "color": "black",
              "interface-type": "cluster",
              "name": "BBB",
              "ipv4-network-mask": "255.255.255.0"
            }]},
            "name": "SC"
          }
          POST /web_api/set-simple-cluster
          {
            "interfaces": {"add": [{
              "comments": "",
              "ipv4-address": "1.1.1.11",
              "ipv4-mask-length": 32,
              "color": "black",
              "interface-type": "cluster",
              "name": "CCC",
              "ipv4-network-mask": "255.255.255.0"
            }]},
            "name": "SC"
          }
          POST /web_api/set-simple-cluster
          {
            "members": {"update": [
              {
                "interfaces": [
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "AAA",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "BBB",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "CCC",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "XXX",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "YYY",
                    "ipv4-network-mask": "255.255.255.0"
                  }
                ],
                "name": "M1"
              },
              {
                "interfaces": [
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "AAA",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "BBB",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "CCC",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "XXX",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "YYY",
                    "ipv4-network-mask": "255.255.255.0"
                  }
                ],
                "name": "M2"
              },
              {
                "interfaces": [
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "AAA",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "BBB",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "CCC",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "XXX",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "YYY",
                    "ipv4-network-mask": "255.255.255.0"
                  }
                ],
                "name": "M3"
              }
            ]},
            "name": "SC"
          }
          POST /web_api/set-simple-cluster
          {
            "members": {"update": [
              {
                "interfaces": [
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "AAA",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "BBB",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "CCC",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "XXX",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "YYY",
                    "ipv4-network-mask": "255.255.255.0"
                  }
                ],
                "name": "M1"
              },
              {
                "interfaces": [
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "AAA",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "BBB",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "CCC",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "XXX",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "YYY",
                    "ipv4-network-mask": "255.255.255.0"
                  }
                ],
                "name": "M2"
              },
              {
                "interfaces": [
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "AAA",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "BBB",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "CCC",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "XXX",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "YYY",
                    "ipv4-network-mask": "255.255.255.0"
                  }
                ],
                "name": "M3"
              }
            ]},
            "name": "SC"
          }
          POST /web_api/set-simple-cluster
          {
            "members": {"update": [
              {
                "interfaces": [
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "AAA",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "BBB",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "CCC",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "XXX",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "YYY",
                    "ipv4-network-mask": "255.255.255.0"
                  }
                ],
                "name": "M1"
              },
              {
                "interfaces": [
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "AAA",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "BBB",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "CCC",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "XXX",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "YYY",
                    "ipv4-network-mask": "255.255.255.0"
                  }
                ],
                "name": "M2"
              },
              {
                "interfaces": [
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "AAA",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "BBB",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "CCC",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "XXX",
                    "ipv4-network-mask": "255.255.255.0"
                  },
                  {
                    "ipv4-address": "1.1.1.11",
                    "name": "YYY",
                    "ipv4-network-mask": "255.255.255.0"
                  }
                ],
                "name": "M3"
              }
            ]},
            "name": "SC"
          }

      With filtering:
          POST https://IP:PORT/web_api/set-simple-cluster
          {
            "interfaces": {"add": [{
              "comments": "",
              "ipv4-address": "1.1.1.11",
              "ipv4-mask-length": 32,
              "color": "black",
              "interface-type": "cluster",
              "name": "AAA",
              "ipv4-network-mask": "255.255.255.0"
            }]},
            "name": "SC"
          }
          POST https://IP:PORT/web_api/set-simple-cluster
          {
            "interfaces": {"add": [{
              "comments": "",
              "ipv4-address": "1.1.1.11",
              "ipv4-mask-length": 32,
              "color": "black",
              "interface-type": "cluster",
              "name": "BBB",
              "ipv4-network-mask": "255.255.255.0"
            }]},
            "name": "SC"
          }
          POST https://IP:PORT/web_api/set-simple-cluster
          {
            "interfaces": {"add": [{
              "comments": "",
              "ipv4-address": "1.1.1.11",
              "ipv4-mask-length": 32,
              "color": "black",
              "interface-type": "cluster",
              "name": "CCC",
              "ipv4-network-mask": "255.255.255.0"
            }]},
            "name": "SC"
          }
          POST https://IP:PORT/web_api/set-simple-cluster
          {
            "members": {"update": [
              {
                "interfaces": [{
                  "ipv4-address": "1.1.1.11",
                  "name": "AAA",
                  "ipv4-network-mask": "255.255.255.0"
                }],
                "name": "M1"
              },
              {
                "interfaces": [{
                  "ipv4-address": "1.1.1.11",
                  "name": "AAA",
                  "ipv4-network-mask": "255.255.255.0"
                }],
                "name": "M2"
              },
              {
                "interfaces": [{
                  "ipv4-address": "1.1.1.11",
                  "name": "AAA",
                  "ipv4-network-mask": "255.255.255.0"
                }],
                "name": "M3"
              }
            ]},
            "name": "SC"
          }
          POST https://IP:PORT/web_api/set-simple-cluster
          {
            "members": {"update": [
              {
                "interfaces": [{
                  "ipv4-address": "1.1.1.11",
                  "name": "BBB",
                  "ipv4-network-mask": "255.255.255.0"
                }],
                "name": "M1"
              },
              {
                "interfaces": [{
                  "ipv4-address": "1.1.1.11",
                  "name": "BBB",
                  "ipv4-network-mask": "255.255.255.0"
                }],
                "name": "M2"
              },
              {
                "interfaces": [{
                  "ipv4-address": "1.1.1.11",
                  "name": "BBB",
                  "ipv4-network-mask": "255.255.255.0"
                }],
                "name": "M3"
              }
            ]},
            "name": "SC"
          }
          POST https://IP:PORT/web_api/set-simple-cluster
          {
            "members": {"update": [
              {
                "interfaces": [{
                  "ipv4-address": "1.1.1.11",
                  "name": "CCC",
                  "ipv4-network-mask": "255.255.255.0"
                }],
                "name": "M1"
              },
              {
                "interfaces": [{
                  "ipv4-address": "1.1.1.11",
                  "name": "CCC",
                  "ipv4-network-mask": "255.255.255.0"
                }],
                "name": "M2"
              },
              {
                "interfaces": [{
                  "ipv4-address": "1.1.1.11",
                  "name": "CCC",
                  "ipv4-network-mask": "255.255.255.0"
                }],
                "name": "M3"
              }
            ]},
            "name": "SC"
          }


## 14.1. ned-settings checkpoint-gaiaos_rest developer-settings ignore-device-warnings
--------------------------------------------------------------------------------------

  Specify what device CLI errors the NED should ignore.

    - developer-settings ignore-device-warnings <ignore-warning>

      - ignore-warning <string>

        Specify what device CLI error the NED should ignore.


## 14.2. ned-settings checkpoint-gaiaos_rest developer-settings request-body-additions
--------------------------------------------------------------------------------------

  Specify what additional key/value the request body shall contain.

    - developer-settings request-body-additions <key> <operation> <object> <value>

      - key <string>

        Specify the key. Example: ignore-warnings.

      - operation <string>

        Specify what operation this should apply to. Example: add.

      - object <string>

        Specify what object this should apply to. Example: service-tcp.

      - value <string>

        Specify the value. Example: true.

    For example, this would ignore warnings and errors when adding service-tcp or service-udp objects
    ned-settings checkpoint-gaiaos_rest developer-settings request-body-additions ignore-warnings add service-tcp value true
    ned-settings checkpoint-gaiaos_rest developer-settings request-body-additions ignore-warnings add service-udp value true
    ned-settings checkpoint-gaiaos_rest developer-settings request-body-additions ignore-errors add service-tcp value true
    ned-settings checkpoint-gaiaos_rest developer-settings request-body-additions ignore-errors add service-udp value true


# 15. ned-settings checkpoint-gaiaos_rest developer
---------------------------------------------------

  Contains settings used for debugging (intended for NED developers).


    - developer progress-verbosity <enum> (default very-verbose)

      Maximum NED verbosity level which will be reported.

      disabled      - disabled.

      normal        - normal.

      verbose       - verbose.

      very-verbose  - very-verbose.

      debug         - debug.


    - developer trace-enable <true|false> (default false)

      [DEPRECATED] Enable developer tracing. WARNING: may choke NSO with large commits|systems.


    - developer platform model <string>

      Override device model name/number.


    - developer platform name <string>

      Override device name.


    - developer platform version <string>

      Override device version.


# 16. ned-settings checkpoint-gaiaos_rest db-edit-config
--------------------------------------------------------

  Configure the usage of db_edit.


    - db-edit-config use-db-edit-configuration <true|false> (default false)

      Specifies whether db_edit configuration should be used. Requires expert password
      to be set.
      Note that if this is enabled and use-rest-configuration isn't disabled, it could
      lead to compare-config diffs since both db_edit and the REST API sometimes
      configure the same config.


# 17. ned-settings checkpoint-gaiaos_rest vsx-settings
------------------------------------------------------


    - vsx-settings use-vsx-provisioning-tool <true|false> (default false)

      Specify if vsx_provisioning_tool should be used.


    - vsx-settings auth-group-credentials <true|false> (default false)

      Specify if the credentials referred to in
      devices device DEVICE-NAME authgroup should be used.


    - vsx-settings trace-vsx-provisioning-tool <true|false> (default false)

      Specify if vsx_provisiong tool commands which include username/password should be traced.


## 17.1. ned-settings checkpoint-gaiaos_rest vsx-settings vsx-credentials
-------------------------------------------------------------------------

    - vsx-settings vsx-credentials <ip> <user> <password>

      - ip <string>

      - user <string> (default )

      - password <string> (default )


# 18. ned-settings checkpoint-gaiaos_rest mgmt
----------------------------------------------


    - mgmt api address default <string>


    - mgmt api base-url <string> (default /web_api)

      API base URL for device REST API.


    - mgmt api auth domain name <string>

      Use domain to login to specific domain. Domain can be identified by name or UID.


    - mgmt api auth enter-last-published-session <true|false> (default false)

      Login to the last published session. Such login is done with the Read Only permissions.


    - mgmt api sync enabled <enum>

      Objects to be synced.

      host                       - host.

      network                    - network.

      address-range              - address-range.

      group                      - group.

      service-tcp                - service-tcp.

      service-udp                - service-udp.

      service-icmp               - service-icmp.

      service-icmp6              - service-icmp6.

      service-sctp               - service-sctp.

      service-other              - service-other.

      service-dce-rpc            - service-dce-rpc.

      service-rpc                - service-rpc.

      service-group              - service-group.

      access-layer               - access-layer.

      access-rule                - access-rule.

      application-site-category  - application-site-category.

      application-site           - application-site.

      domain                     - domain.

      simple-cluster             - simple-cluster.

      simple-gateway             - simple-gateway.

      package                    - package.

      nat-rule                   - nat-rule.


    - mgmt api sync disabled <enum>

      Objects not to be synced.

      host                       - host.

      network                    - network.

      address-range              - address-range.

      group                      - group.

      service-tcp                - service-tcp.

      service-udp                - service-udp.

      service-icmp               - service-icmp.

      service-icmp6              - service-icmp6.

      service-sctp               - service-sctp.

      service-other              - service-other.

      service-dce-rpc            - service-dce-rpc.

      service-rpc                - service-rpc.

      service-group              - service-group.

      access-layer               - access-layer.

      access-rule                - access-rule.

      application-site-category  - application-site-category.

      application-site           - application-site.

      domain                     - domain.

      simple-cluster             - simple-cluster.

      simple-gateway             - simple-gateway.

      package                    - package.

      nat-rule                   - nat-rule.


    - mgmt api config object defaults is-syncable <true|false> (default true)


    - mgmt api config object defaults request list limit <uint16> (default 500)


    - mgmt api config object defaults request list parallel-api-calls <true|false> (default true)

      Enable/Disable parallel api calls invocation.


    - mgmt api config session check-alive <true|false> (default true)


    - mgmt api config session keep-alive <true|false> (default true)


    - mgmt conn ssl accept-any <true|false> (default true)

      Accept any SSL certificate presented by the device. Warning!
      This enables Man in the Middle attacks and should only be used
      for testing and troubleshooting.


    - mgmt conn ssl certificate <binary>

      SSL certificate stored in DER format but since it is entered
      as Base64 it is very similar to PEM but without banners like "-----
      BEGIN CERTIFICATE -----". Default uses the default trusted certificates
      installed in Java JVM. An easy way to get the PEM of a server:
      openssl s_client -connect HOST:PORT


## 18.1. ned-settings checkpoint-gaiaos_rest mgmt api sync object
-----------------------------------------------------------------

    - mgmt api sync object <name> <is-syncable>

      - name <enum>

        host                       - host.

        network                    - network.

        address-range              - address-range.

        group                      - group.

        service-tcp                - service-tcp.

        service-udp                - service-udp.

        service-icmp               - service-icmp.

        service-icmp6              - service-icmp6.

        service-sctp               - service-sctp.

        service-other              - service-other.

        service-dce-rpc            - service-dce-rpc.

        service-rpc                - service-rpc.

        service-group              - service-group.

        access-layer               - access-layer.

        access-rule                - access-rule.

        application-site-category  - application-site-category.

        application-site           - application-site.

        domain                     - domain.

        simple-cluster             - simple-cluster.

        simple-gateway             - simple-gateway.

        package                    - package.

        nat-rule                   - nat-rule.

      - is-syncable <true|false> (default true)

      - enabled names <string>

        Included Names during the sync.

      - enabled uids <string>

        Included UIDs during the sync.

      - actions enabled <enum>

        LIST    - LIST.

        GET     - GET.

        CREATE  - CREATE.

        UPDATE  - UPDATE.

        DELETE  - DELETE.

      - actions disabled <enum>

        LIST    - LIST.

        GET     - GET.

        CREATE  - CREATE.

        UPDATE  - UPDATE.

        DELETE  - DELETE.

      - request list limit <uint16> (default 500)

      - request list parallel-api-calls <true|false> (default true)

        Enable/Disable parallel api calls invocation.

      - request list filter <string>


# 19 Checkpoint modes
=====================
The Checkpoint-gaiaos_rest NED can communicate to the device through these modes:
  REST
  CLI (called config_mode_config in the NED)
  Db_edit

The Checkpoint-gaiaos_rest NED has NED-settings which affects how the NED will interact with the different modes.
For details, see the referenced ned-settings.

Summary:
  1.4 ned-setting to use config mode configuration
    admin@ncs(config)% set devices device <device-name> ned-settings
      checkpoint-gaiaos_rest config-mode-config use-config-mode-configuration true

  1.4 ned-setting for using checkpoint-gaiaos_rest against a gateway device
    admin@ncs(config)% set devices device <device-name> ned-settings
      checkpoint-gaiaos_rest config-mode-config is-gateway-device true

  1.13 ned-setting for using db_edit
  admin@ncs% set devices device <device-name> ned-settings
      checkpoint-gaiaos_rest db-edit-config use-db-edit-configuration true

  1 ned-setting for not using the REST API
  admin@ncs% set devices device <device-name> ned-settings
      checkpoint-gaiaos_rest use-rest-configuration false

  The above ned-settings will have the following effect on what modes the NED will communicate to the device through:
    1 means that the mode is enabled through the NED-Setting
    0 means that the mode is not affected through the NED-Setting
    -1 means that the mode is disabled through the NED-Setting
                                                                      REST    CLI     DB_EDIT
    1.4  ... config-mode-config use-config-mode-configuration true      0      1        0
    1.4  ... config-mode-config is-gateway-device             true     -1      1        0
    1.13 ... db-edit-config use-db-edit-configuration         true      0      0        1
    1    ... use-rest-configuration                           true      1      0        0
                                                                      -------------------
                                                                       -1      1       1

                                                                      REST    CLI     DB_EDIT
    1.4  ... config-mode-config use-config-mode-configuration false     0      -1       0
    1.4  ... config-mode-config is-gateway-device             false     1      -1       0
    1.13 ... db-edit-config use-db-edit-configuration         false     0       0      -1
    1    ... use-rest-configuration                           false    -1       0       0
                                                                      --------------------
                                                                       -1      -1      -1


  If nothing is specified in the NED-Settings these are the standard values:
                                                                      REST    CLI     DB_EDIT
    1.4  ... config-mode-config use-config-mode-configuration false     0      -1       0
    1.4  ... config-mode-config is-gateway-device             false     1      -1       0
    1.13 ... db-edit-config use-db-edit-configuration         false     0       0      -1
    1    ... use-rest-configuration                           true      1       0       0
                                                                      -------------------
                                                                        1      -1      -1
  So by default the NED only communicates through REST mode.

  When the device has more than 500 entries for a REST object,
  the NED will by default issue multiple REST calls to get all the objects.
