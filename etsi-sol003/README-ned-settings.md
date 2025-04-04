# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/etsi-sol003/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/etsi-sol003/
  device
    /ncs:/device/devices/device:<name>/ned-settings/etsi-sol003/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings etsi-sol003

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings etsi-sol003
  2. connection
     2.1. model
  3. logger
  4. device
  5. flow
  6. developer
  ```


# 1. ned-settings etsi-sol003
-----------------------------


    - edit-timeout <uint32> (default 720)

      Configure the additional timeout in seconds for EDIT operations (0 - no additional EDIT
      timeout). Default 720s (12 minutes).


# 2. ned-settings etsi-sol003 connection
----------------------------------------

  Configure settings specific to the connection between NED and device.


    - number-of-retries <uint8> (default 0)

      Configure max number of retries the NED will try to connect to the device before giving up.
      Default 0.


    - time-between-retry <uint8> (default 1)

      Configure the time in seconds the NED will wait between each connect retry. Default 1s.


    - live-check status <true|false> (default true)

      Check that real device is up/alive on connect.


    - live-check api-resource <enum> (default vnf-subscriptions)

      API Resource to check the connection with. Use an API Resource
      that has reachable and responsive GET endpoint.

      vnf-instances      - vnf-instances.

      vnf-subscriptions  - vnf-subscriptions.


    - ssl accept-any <true|false> (default false)

      Accept any SSL certificate presented by the device. Warning!
      This enables Man in the Middle attacks and should only be used
      for testing and troubleshooting.


    - ssl certificate <binary>

      SSL certificate stored in DER format but since it is entered
      as Base64 it is very similar to PEM but without banners like "-----
      BEGIN CERTIFICATE -----". Default uses the default trusted certificates
      installed in Java JVM. An easy way to get the PEM of a server:
      openssl s_client -connect HOST:PORT


    - api-base-url <string>

      API base URL for device REST API.


    - api-key <string>

      API authentication key if needed.


    - api request method patch content-type <string> (default application/merge-patch+json)


    - api auth credentials username <string>

      API username for BASIC auth.


    - api auth credentials password <string>

      API password for BASIC auth.


    - api auth type <enum> (default oauth2)

      API auth type.

      basic   - basic.

      oauth2  - oauth2.


    - api param tenant-id <string>

      Configure {tenantId}.


    - api address default <string>

      API default host.


    - api address identity <string>

      API host for device Identity.


    - api address token <string>

      API host for device Token.


    - api address vnf-instance <string>

      API host for device VNF Instance.


    - api address ns-instance <string>

      API host for device NS Instance.


    - api address runtime-catalog <string>

      API host for device Runtime Catalog.


    - api address vim-inventory <string>

      API host for device VIM Inventory.


    - api address api-gateway <string>

      API host for device API Gateway.


    - api address api-gateway-openshift <string>

      API host for device API Gateway Openshift.


    - api base-url default <string>

      API default base URL.


    - api base-url identity <string>

      API base URL for device Identity.


    - api base-url token <string> (default /auth/v1)

      API base URL for device Token.


    - api base-url vnf-instance <string> (default /vnflcm/v1)

      API base URL for device VNF Instance.


    - api base-url vnf-instance-ext-operation <string> (default /or_vnfm/vnflcm/v1)

      API base URL for device VNF Instance Operation/Migrate Extension.


    - api base-url vnf-fault-management <string> (default /vnffm/v1)

      API base URL for device VNF Fault Management.


    - api base-url vnf-performance-management <string> (default /vnfpm/v1)

      API base URL for device VNF Performance Management.


    - api base-url vnf-indicator <string> (default /vnfind/v1)

      API base URL for device VNF Indicator.


    - api base-url ns-instance <string> (default /nslcm/v1)

      API base URL for device NS Instance.


    - api base-url vnf-package <string> (default /vnfpkgm/v1)

      API base URL for device VNF Package.


    - api base-url runtime-catalog <string> (default /v1)

      API base URL for device Runtime Catalog.


    - api base-url vim-inventory <string> (default )

      API base URL for device VIM Inventory.


    - api base-url api-gateway <string> (default )

      API base URL for device API Gateway.


    - api base-url api-gateway-openshift <string> (default )

      API base URL for device API Gateway Openshift.


    - api base-url rpc-action default-vnf-extension base-url <string> (default )


    - api endpoint get vim-tenants <string> (default /resource-service/vims/:id/tenantsInfo)


    - api endpoint get vnf-instance-vnfc <string> (default /inventory-gateway/topology-inventory/v1/inventory/nodes/:id)


    - api endpoint get gateway-vnf-instance <string> (default /vnf-manager/vnflcm/v1/vnf_instances/:id)


    - api endpoint get vnf-instance-resource <string> (default /api-gateway/vnf/inventory/resources/:id)


    - api endpoint get tenant-vnf-instance-vnfc <string> (default /inventory-gateway/topology-inventory/:tenant-id/v1/inventory/nodes/:id)


    - api endpoint get tenant-gateway-vnf-instance <string> (default /vnf-manager/:tenant-id/vnflcm/v1/vnf_instances/:id)


    - api sync only <enum>

      vnf-instance          - vnf-instance.

      ns-instance           - ns-instance.

      vnf-package           - vnf-package.

      ns-package            - ns-package.

      vnf-op                - vnf-op.

      ns-op                 - ns-op.

      vnf-subscription      - vnf-subscription.

      ns-subscription       - ns-subscription.

      vnf-fm-alarm          - vnf-fm-alarm.

      vnf-fm-subscription   - vnf-fm-subscription.

      vnf-pm-subscription   - vnf-pm-subscription.

      vnf-pm-job            - vnf-pm-job.

      vnf-pm-threshold      - vnf-pm-threshold.

      vnf-indicator         - vnf-indicator.

      vnf-ind-subscription  - vnf-ind-subscription.

      vim                   - vim.


    - api sync filter api-actions <enum>

      Default: [ GET ].

      GET     - GET.

      CREATE  - CREATE.

      UPDATE  - UPDATE.

      DELETE  - DELETE.


    - api sync filter ned-actions <enum>

      Default: [ CONFIG ].

      CONFIG      - CONFIG.

      RPC-ACTION  - RPC-ACTION.


    - api proto default <string>

      API default proto.


    - api proto runtime-catalog <string>

      API proto for device Runtime Catalog.


    - api number-of-retries <uint8> (default 0)

      Configure max number of retries the NED will try to connect to the device before giving up.
      Default 0.


    - api time-between-retry <uint8> (default 1)

      Configure the time in seconds the NED will wait between each connect retry. Default 1s.


    - api key <string>

      API authentication key if needed.


    - api token credentials username <string>

      API username used for PASSWORD grant type.


    - api token credentials password <string>

      API password used for PASSWORD grant type.


    - api token grant-type <enum> (default client_credentials)

      API token grant type.

      client_credentials  - client_credentials.

      password            - password.


    - api token auth-type <enum> (default basic)

      API token auth type.

      basic   - basic.

      oauth2  - oauth2.


    - api token auth-request-template <enum> (default default)

      API token auth request template.

      default   - default.

      x-header  - x-header.


    - api token auth-request-x-header-params username-param <string> (default X-login)


    - api token auth-request-x-header-params password-param <string> (default X-password)


    - api token auth-request-x-header-params token-header-key <string> (default cookie)


    - api token auth-request-x-header-params token-header-value <string> (default JSESSIONID=%s)


    - api token cache <true|false> (default true)

      Disable/Enable API token caching.


    - api token use-refresh-token <true|false> (default true)

      Disable/Enable refresh_token usage.


## 2.1. ned-settings etsi-sol003 connection api sync model
----------------------------------------------------------

    - api sync model <name> <is-syncable> <sync-disabled> <sync-gracefully> <excluded> <no-addons> <sync-vnfc>

      - name <enum>

        vnf-instance          - vnf-instance.

        ns-instance           - ns-instance.

        vnf-package           - vnf-package.

        ns-package            - ns-package.

        vnf-op                - vnf-op.

        ns-op                 - ns-op.

        vnf-subscription      - vnf-subscription.

        ns-subscription       - ns-subscription.

        vnf-fm-alarm          - vnf-fm-alarm.

        vnf-fm-subscription   - vnf-fm-subscription.

        vnf-pm-subscription   - vnf-pm-subscription.

        vnf-pm-job            - vnf-pm-job.

        vnf-pm-threshold      - vnf-pm-threshold.

        vnf-indicator         - vnf-indicator.

        vnf-ind-subscription  - vnf-ind-subscription.

        vim                   - vim.

      - is-syncable <true|false> (default false)

      - sync-disabled <true|false> (default false)

        Sync DISABLED entities.

      - sync-gracefully <true|false> (default false)

        Ignore faulty API addons during sync (sync only valid ones).

      - excluded <string>

        Excluded IDs during the sync.

      - no-addons <string>

        IDs synced without API addons (just raw data from main API resource).

      - sync-vnfc <true|false> (default true)

        Retrieve vnf-instance vnfc node.

      - actions no-delete <true|false> (default false)

        Disable API DELETE action.


# 3. ned-settings etsi-sol003 logger
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


# 4. ned-settings etsi-sol003 device
------------------------------------


    - model <enum> (default default-sol3)

      default-sol3  - default-sol3.

      netcracker    - netcracker.

      esc           - esc.

      cbam          - cbam.


# 5. ned-settings etsi-sol003 flow
----------------------------------


    - vnf-instance instantiate auto <true|false> (default false)

      Enable/Disable Instance instantiation after creation.


    - vnf-instance terminate auto <true|false> (default false)

      Enable/Disable Instance termination before deletion.


    - ns-instance instantiate auto <true|false> (default true)

      Enable/Disable Instance instantiation after creation.


    - ns-instance terminate auto <true|false> (default true)

      Enable/Disable Instance termination before deletion.


    - subscription trace <true|false> (default false)

      Enable/Disable Subscription request tracing.


    - subscription auth fallback <true|false> (default false)

      Enable/Disable Subscription Authentication fallback to default
      device username/password


# 6. ned-settings etsi-sol003 developer
---------------------------------------

  Contains settings used for debugging (intended for NED developers).


    - trace-enable <true|false> (default false)

      Enable developer tracing. WARNING: may choke NSO with large commits|systems.


    - trace-connection <true|false> (default false)

      Enable connection tracing. WARNING: may choke NSO with IPC messages.


    - trace-timestamp <true|false> (default false)

      Add timestamp from NED instance in trace messages for debug purpose.


    - progress-verbosity <enum> (default disabled)

      Maximum NED verbosity level which will get written in devel.log
      file

      disabled      - disabled.

      normal        - normal.

      verbose       - verbose.

      very-verbose  - very-verbose.

      debug         - debug.


    - platform model <string>

      Override device model name/number.


    - platform name <string>

      Override device name.


    - platform version <string>

      Override device version.


