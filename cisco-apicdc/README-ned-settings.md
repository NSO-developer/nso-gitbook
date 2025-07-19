# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/cisco-apicdc/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/cisco-apicdc/
  device
    /ncs:/device/devices/device:<name>/ned-settings/cisco-apicdc/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings cisco-apicdc

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings cisco-apicdc
  2. logger
  3. alternative-hosts
  4. nso-controlled-dns-list
  5. deviceBehaviourWorkaround
  6. ssl
  ```


# 1. ned-settings cisco-apicdc
------------------------------


    - cisco-apicdc sync-from-file-enable <true|false> (default false)

      If this is enabled, then NO apic config export will be triggered at sync-from;
      The config file would need to be placed manually at the location defined by:
      config-path and sync-from-fileName;
      Use this when the same static config needs to be loaded on multiple NEDs


    - cisco-apicdc sync-from-fileName <string>

      Config file name used if sync-from-file-enable == true;
      This is used together with config-path to define the location of config file;


    - cisco-apicdc config-path <string>

      Specify the directory for configuration;.


    - cisco-apicdc local-host <true|false> (default true)

      If true the config file will be stored on localhost.
      In this case please note that the user under which NSO is running
      must have read/write access to the folder described by 'ned-settings cisco-apicdc config-path'
      If false then, the <user-name>, <user-password>, <port>, <host>
      and <config-path> fields are in the context of the remote <host>


    - cisco-apicdc host <string>

      Specify the host;.


    - cisco-apicdc user-name <string>

      Specify the user name;.


    - cisco-apicdc user-password <string>

      Specify the user password;.


    - cisco-apicdc port <string> (default 22)

      Port number. scp,sftp:22, ftp:21.


    - cisco-apicdc protocol <enum> (default sftp)

      ftp, sftp or scp;
      The APIC-DC device will use <protocol> to copy the config archive on
      the remote host and the NED will use <protocol> to get that config archive;
      So please note that, the remote host needs to support <protocol>. 
      In case of scp you need to set ned-settings/cisco-apicdc/local-host=true

      ftp   - ftp.

      sftp  - sftp.

      scp   - scp.


    - cisco-apicdc management-EPG <enum>

      Management EPG in or out of band, do not set if not using management EPG.
      If set, adds
      <fileRsARemoteHostToEpg tDn="uni/tn-mgmt/mgmtp-default/inb-inb-epg"/>
      or 
      <fileRsARemoteHostToEpg tDn="uni/tn-mgmt/mgmtp-default/oob-default"/>
      to the http body when setting the remove location used for configuration export.
      POST /api/node/mo/.xml
      <polUni> <fabricInst> <fileRemotePath  ...> <fileRsARemoteHostToEpg ...>

      in-band      - in-band.

      out-of-band  - out-of-band.


    - cisco-apicdc cfgDownloadTimeout <uint32> (default 1200)

      This timeout is used to trigger an exception when
      downloading the APIC configuration archive takes too much;
      Default 1200[s] -> 20 min; Set 0[s] to disable --> NOT ADVISABLE;
      if local-host == true Exception is triggered if:
      (localDownloadComplete - localDownloadStart) > cfgDownloadTimeout;
      if local-host == false there are two downloads of the cfg file:
      a) APIC -- > remote host;
      b) remote host --> NED;
      In both a) and b) cfg-download-timeout is used.


    - cisco-apicdc commit-fully-fit-only <true|false> (default false)

      Set this field to enable if you want to enable the following health check:
      APIC has a field, "health" field, to indicate its health state if APIC is available to accept the configuration changes/updates. 
      If the field shows "fully-fit", that means the APIC is available to use for normal operation. 
      If the field shows any other state, that means we can't use the APIC. 
      If the "health" field on the APIC shows other state than "fully-fit" the NED needs to inspect another alternative host (if configured) and check it is available to use.


    - cisco-apicdc disable-check-sync <true|false> (default false)

      When set to true, check-sync function will be disabled and
      commits will be accepted even if the ned is out of sync with
      the device;
      Used to speed up the commit procedure when the check sync feature is not mandatory.


    - cisco-apicdc check-sync-filter <string>

      This list is used to define operational data objects that
      will be filtered out when computing the check-sync operation.
      Example: check-sync-filter licenseFeatureCont
      <licenseFeatureCont> ... </licenseFeatureCont> will be filtered out
      when performing the check-sync operation


    - cisco-apicdc dataTransferTimeOut <uint32> (default 0)

      This time-out value will affect the REST operations;
      This will change the default socket timeout (SO_TIMEOUT)
      in milliseconds which is the timeout for waiting for data;
      A timeout value of zero is interpreted as an infinite timeout;
      The default value is 0: wait forever;


    - cisco-apicdc ignore-passwords <true|false> (default false)

      If this is false (default), the NED will read the password fields(from the config)
      from NSO configuration database when executing sync-from and compare-config.
      This is used to avoid compare config diffs, when de APIC device will return
      hashed passwords in the configuration that are changing at each configuration export.
      If this is true the NED will ignore the password fields that are coming from the APIC device.


# 2. ned-settings cisco-apicdc logger
-------------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 3. ned-settings cisco-apicdc alternative-hosts
------------------------------------------------

  Alternative Ip address or host name for the APIC cluster.
  The NED has the ability to connect to alternative devices in the APIC cluster if the main APIC is down. 
  If the connection fails to the main APIC the NED will try one by one the hosts in the alternative-hosts list.

    - cisco-apicdc alternative-hosts <hosts>

      - hosts <union>


# 4. ned-settings cisco-apicdc nso-controlled-dns-list
------------------------------------------------------

  List of objects controlled by NSO;
  The list is used to limit the amount of configuration data
  exported from APIC; Only the dn:s in the list will be
  considered by the check-sync and sync-from functions
  This allows to have APIC configuration to be split into NSO
  controlled and not NSO controlled items
  If the list is empty, the complete APIC config will be used
  in check-sync and sync-from
  Items in the list shall be in dn format
  Example: [uni/tn-aTenant uni/infra uni/l3dom-aL3Domain ];
  The objects in the list must be direct under uni
  Objects further down in the tree is not possible to specify
  in this list.

    - cisco-apicdc nso-controlled-dns-list <dns>

      - dns <string>


# 5. ned-settings cisco-apicdc deviceBehaviourWorkaround
--------------------------------------------------------

  This ned settings enable custom behaviours needed for some unexpected device behaviour.


    - deviceBehaviourWorkaround enable-l3extOut-cfg-split <true|false> (default false)

      Added in ticket (APIC-218 / PS-39134 / RT44030). 
      The issue we’re facing is as follows:
      - If we try and push both the l3-outs at the sametime, I get an error
      Payload:
      <fvTenant name="NSO-TEST">
      <l3extOut name="Gaming-RDC-3_SRL3out" enforceRtctrl="export" targetDscp="unspecified" mplsEnabled="yes"/>
      <l3extOut name="Gaming-CDC-2_SRL3out" enforceRtctrl="export" targetDscp="unspecified" mplsEnabled="yes"/>
      </fvTenant>

      - Error:
      <?xml version="1.0" encoding="UTF-8"?><imdata totalCount="1"><error code="1" text="Invalid Configuration -
       VRF Validation failed for VRF = uni/tn-common/ctx-default: Mpls L3out already exists for vrf. 
       Conflicting L3Outs are uni/tn-NSO-TEST/out-Gaming-RDC-3_SRL3out and uni/tn-NSO-TEST/out-Gaming-CDC-2_SRL3out
       If this was an attempt to modify, consider deletion followed by addition."/></imdata>

      - If I push just a single l3extOut, it succeeds. The second subsequent fails.
      - If I push all L3ExtOut related configuration first for a single object and then commit the second, it succeeds.
         E.g. push all configurations related to Gaming-RDC-3_SRL3out first and then the second L3outExt 5BGaming-CDC-2_SRL3out, it works.

      - Solution: a patch that splits out the l3extOut configuration.
      To push the config for l3extOut one by one (create one l3extOut with all the children config and repeat).
      Of course this will greatly slows down the config operation, and this is why this is not in the main version of the apic NED.


# 6. ned-settings cisco-apicdc ssl
----------------------------------

  Use SSL for connections towards the device.


    - ssl accept-any <true|false> (default true)

      Accept any SSL certificate presented by the device.
      Warning! This enables Man in the Middle attacks and
      should only be used for testing and troubleshooting.


    - ssl certificate <binary>

      SSL certificate stored in DER format but since it is entered
      as Base64 it is very similar to PEM but without banners like.

      Default uses the default trusted certificates installed in
      Java JVM.

      An easy way to get the PEM of a server:
      openssl s_client -connect HOST:PORT


