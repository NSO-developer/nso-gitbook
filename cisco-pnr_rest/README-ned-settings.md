# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options allowing for customization by the
  end user. All options are configurable using the NSO API for NED settings. Most NED settings can be
  configured globally, per device profile or per device instance.

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings cisco-pnr_rest <tab>
   ```


# Table of contents
-------------------

  ```
  1. ned-settings cisco-pnr_rest
  2. connection
  3. behaviour
     3.1. remove-config-sync-from
  4. logger
  ```


# 1. ned-settings cisco-pnr_rest
--------------------------------


    - cisco-pnr_rest log-verbose <true|false> (default false)

      [DEPRECATED] Enabled extra verbose logging in NED (for debugging).


# 2. ned-settings cisco-pnr_rest connection
-------------------------------------------

  Configure settings specific to the connection between NED and device.


    - connection remote-protocol <enum> (default http)

      Connection type.

      http   - http.

      https  - https.


# 3. ned-settings cisco-pnr_rest behaviour
------------------------------------------


    - behaviour resources-to-sync <enum>

      Specify resources to sync.
      e.g. devices device <device-name> ned-settings cisco-pnr_rest behaviour resources-to-sync [ ACL CCMZone ]

      ACL               - ACL.

      CCMRRSet          - CCMRRSet.

      CCMReverseZone    - CCMReverseZone.

      CCMSecondaryZone  - CCMSecondaryZone.

      CCMZone           - CCMZone.

      ClientClass       - ClientClass.

      ClientEntry       - ClientEntry.

      DHCPServer        - DHCPServer.

      DNSCachingServer  - DNSCachingServer.

      DNSServer         - DNSServer.

      Dns64             - Dns64.

      DnsEnumConfig     - DnsEnumConfig.

      DnsEnumDomain     - DnsEnumDomain.

      DnsSec            - DnsSec.

      DnsUpdateConfig   - DnsUpdateConfig.

      DnsView           - DnsView.

      Key               - Key.

      Link              - Link.

      Policy            - Policy.

      Prefix            - Prefix.

      Reservation       - Reservation.

      Reservation6      - Reservation6.

      Scope             - Scope.

      UpdatePolicy      - UpdatePolicy.

      VPN               - VPN.


## 3.1. ned-settings cisco-pnr_rest behaviour remove-config-sync-from
---------------------------------------------------------------------

    - behaviour remove-config-sync-from <object>

      - object <enum>

        ACL               - ACL.

        CCMRRSet          - CCMRRSet.

        CCMReverseZone    - CCMReverseZone.

        CCMSecondaryZone  - CCMSecondaryZone.

        CCMZone           - CCMZone.

        ClientClass       - ClientClass.

        ClientEntry       - ClientEntry.

        DHCPServer        - DHCPServer.

        DNSCachingServer  - DNSCachingServer.

        DNSServer         - DNSServer.

        Dns64             - Dns64.

        DnsEnumConfig     - DnsEnumConfig.

        DnsEnumDomain     - DnsEnumDomain.

        DnsSec            - DnsSec.

        DnsUpdateConfig   - DnsUpdateConfig.

        DnsView           - DnsView.

        Key               - Key.

        Link              - Link.

        Policy            - Policy.

        Prefix            - Prefix.

        Reservation       - Reservation.

        Reservation6      - Reservation6.

        Scope             - Scope.

        UpdatePolicy      - UpdatePolicy.

        VPN               - VPN.

      - remove-xpath-configs <xpath>

        - xpath <string>

          e.g. devices device pnr-1 ned-settings cisco-pnr_rest behaviour remove-config-sync-from CCMRRSet remove-xpath-configs /CCMRRSet[name='@']


# 4. ned-settings cisco-pnr_rest logger
---------------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.

