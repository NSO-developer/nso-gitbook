# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/helm-k8s/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/helm-k8s/
  device
    /ncs:/device/devices/device:<name>/ned-settings/helm-k8s/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings helm-k8s

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings helm-k8s
  2. logger
  ```


# 1. ned-settings helm-k8s
--------------------------

    - config local-charts-folder <path>

      Optional directory on the Helm host containing chart directories or `.tgz`
      archives. Discovered charts use the `local/` prefix.

      Sync-from also works when no repositories or local charts are available.
      If a release's source cannot be identified, its chart is recorded by
      its bare name and version, without a corresponding discovered chart.
      Configure the source and select the discovered chart before installing
      or upgrading that release.


# 2. ned-settings helm-k8s logger
---------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.

      Discovery logs include release and chart metadata and the structure of
      chart values. Credential-like fields and unrecognised string values are
      masked; repository URLs show only their scheme, host and port.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


