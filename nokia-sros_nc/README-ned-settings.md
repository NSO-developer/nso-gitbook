# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/nokia-sros_nc/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/nokia-sros_nc/
  device
    /ncs:/device/devices/device:<name>/ned-settings/nokia-sros_nc/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings nokia-sros_nc

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings nokia-sros_nc
  2. transaction
     2.1. extra-get-config-paths
     2.2. exclude-namespaces
     2.3. inject-meta-data
     2.4. bof-settings
  3. connection
     3.1. capabilities
          3.1.1. regex-exclude
          3.1.2. regex-include
          3.1.3. inject
     3.2. ssh
  4. proxy
  5. live-status
     5.1. regex-exclude
     5.2. cli
          5.2.1. auto-prompts
  6. logger
  7. developer
  ```


# 1. ned-settings nokia-sros_nc
-------------------------------

  This file describes the ned-settings for nokia-sros_nc.


# 2. ned-settings nokia-sros_nc transaction
-------------------------------------------

  Settings affecting different aspects of NSO transactions towards device.


    - transaction confirmed-commit enable <true|false> (default true)

      Enables confirmed-commit (if supported by device).


    - transaction confirmed-commit confirm-timeout <uint16>

      Timeout in seconds, if set, used as 'confirm-timeout' parameter to the confirmed-commit
      (otherwise defaults to 600 seconds).


    - transaction confirmed-commit persisted <true|false> (default false)

      Enable this setting to use the 'persist-id' to let confirming commit be done in other session
      (e.g. if closing session between commit and persist phases). NOTE: This can only be used with
      devices which support netconf capability 'confirmed-commit:1.1'.


    - transaction validate-before-commit <true|false> (default false)

      If devices supports the validate1.1 capability, the NED will send a validate rpc before
      sending the commit rpc.


    - transaction persist-to-startup <true|false> (default true)

      If enabled, 'running' datastore will be copied to 'startup' in NSO persist stage (if device
      supports distinct startup datastore).


    - transaction discard-changes-before-lock <true|false> (default false)

      If enabled, and using the 'candidate' datastore, a 'discard-changes' operation will be issued
      before trying to lock 'candidate'.


    - transaction lock-running-before-candidate <true|false> (default false)

      If enabled, and using the 'candidate' datastore, the 'running' datastore will also be locked
      during transactions.


    - transaction reconnect-on-commit <true|false> (default false)

      If enabled, the NED will reconnect to the device after commit to ensure connectivity is not
      broken (i.e. aborting the NSO commit stage if re-connect fails). This can for example be used
      as an extra safeguard for early detection of invalid config being applied, which leaves the
      device in an unreachable state. When used together with 'confirmed-commit' it will fail the
      commit in NSO, while still leaving it up to the device to rollback the commit (since no
      'confirming' commit will be sent from NSO). For devices that enforces the use of 'persist-id',
      according to RFC, when using 'confirmed-commit' accross sessions, the ned-setting
      'confirmed-commit/persisted' needs to be enabled aswell.


    - transaction commit-in-persist <true|false> (default false)

      If enabled, the NED will not send commit until in the persist phase in NSO (like a confirmed
      commit, assuming config has been validated in the prepare or commit phase). Normally the
      commit is sent in the NSO commit phase to be able to abort the transaction if the commit
      fails, since errors reported by device in the persist phase will only lead to an alarm in NSO,
      the transaction can no longer be aborted in the persist phase (i.e. the transaction must be
      aborted in the prepare or commit phases for NSO to be able to rollback properly).


    - transaction ignore-rpc-warnings <true|false> (default true)

      By default rpc-error reply with severity 'warning' will not be treated as error, set to
      'false' to treat warnings as errors (i.e. abort transaction on warnings).


    - transaction report-full-rpc-error <true|false> (default false)

      Enable this setting to get full rpc-error payload as message when error occurs (i.e. instead
      of just error-message).


    - transaction filter-invalid-values <true|false> (default false)

      Filter out invalid leaf values from config before sending to NSO to avoid sync-from failure on
      for example invalid range expression.


    - transaction canonicalize-idrefs <true|false> (default false)

      Canonicalize leaf values of type 'identityref' in config before sending to NSO, i.e.
      add/change prefix to global prefix in NSO.


    - transaction filter-config-by-version <union> (default disable)

      Yang API version to allow (given meta-data annotations in yang models and/or injections).


    - transaction get-config-no-filter <true|false> (default false)

      Perform full get-config without specifying any filter at all. This applies to operations like
      full sync-from and compare-config.


    - transaction trans-id-method <enum> (default config-data)

      Select the method for calculating transaction-id. Note that both 'config-hash' and
      'config-data' will exclude config according to filtering which might be in effect,
      i.e. the data used for calculating the transaction-id will be the config as it is sent
      to NSO, with or without unmodeled nodes.

      config-hash  - Use a snapshot of the running config for calculation.

      config-data  - Use a snapshot of the data of only the modeled parts of running config for
                     calculation.

      custom       - Use trans-id provided by ned, e.g. a device provided time-stamp of last change
                     or something similar.


    - transaction use-maapi-setvalues <true|false> (default false)

      Use maapi setValues method instead of loadConfigStream to load data to NSO.


    - transaction abort-on-diff <true|false> (default false)

      Enable to detect diff immediately when config is applied (i.e. in commit/abort/revert).
      If a diff is detected an exception is thrown, having the effect in commit that the transaction
      is aborted (showing the diff). Note that this means some overhead in commit, where whole config
      needs to be retrieved from device to do compare. The feature 'abort-on-diff' is used to detect
      out-of-band changes, silently dropped config, and unknown side-effects to config (i.e. all
      causing a diff compared to expected NSO state). In fact, it's the only method which guarantees
      that the config was actually applied as desired. Due to the overhead, this setting should only
      be used during development.


    - transaction filter-side-effects <true|false> (default false)

      Enable to automatically filter out side-effects when commiting config. With this feature enabled
      the NED will accumulate 'exclude filter-paths' which are used to filter out config from device
      to avoid diff when for example there are multiple nodes that represent the same data, i.e. in
      overlapping models.


    - transaction filter-paths-file <string>

      File containing paths to filter out from data (config/oper/rpc-reply). Each line in the file
      is of the format '<include|exclude> <schema-path>'. If no include lines are present, it implies
      everything is included if not explicitly excluded. This can be combined with 'exclude-namespaces'.


    - transaction delete-with-remove <true|false> (default false)

      Enable this setting to always use netconf operation 'remove' instead of 'delete' when deleting
      nodes with edit-config. This will have the effect that if trying to delete a node which is not
      present the operation will be ignored.


    - transaction set-default-to-delete <true|false> (default true)

      Enable this setting to treat the operation 'set default' as a delete operation. By default, for
      devices that has 'with-defaults' handling 'explicit' (or lacks this capability), the behaviour of
      NSO is to send a 'set default' operation to the NED when a value which has a default value is to
      be deleted, i.e. the value is explicitly set back to its default instead of being deleted.


    - transaction delete-by-set-to-default <true|false> (default false)

      Enable this setting to make the NED convert 'delete' operations to 'set to default' on nodes with
      default values. Use this option to prevent NSO from emitting delete operations on nodes that were
      not set in the from-transaction, which can happen if the configuration is deployed using the
      'replace' feature.


    - transaction enable-diff-dependencies <true|false> (default false)

      Enable this setting to be able to use the 'diff-dependencies' annotations on nodes in the schema where device
      has bugs imposing ordering dependencies for certain edit operations. For more information in the annotations
      that can be used, see section 9.12 in the README.md.


    - transaction force-revert-diff <true|false> (default false)

      Enable this setting to force the use of an NSO calculated diff to apply when doing revert on device.
      For example to be able to use the 'delayed-commit' feature, this is necessary.


    - transaction nmda get-data enable <true|false> (default false)

      Use get-data rpc for data retrieval, if device supports it.


    - transaction nmda get-data datastore <union>

      Configure datastore to be used when using the get-data rpc.


## 2.1. ned-settings nokia-sros_nc transaction extra-get-config-paths
---------------------------------------------------------------------

  This list can be used to add extra filters when sending get-config RPC to the device.
  For example if there is a bug in the device which makes it not include all config under
  certain top-nodes. The key of the list is the path to add (non-unique nodes must be prefixed
  with 'global' prefix, i.e. prefix from module).

    - transaction extra-get-config-paths <path>

      - path <schema-path>

        Schema path to explicitly add to filter for get-config.


## 2.2. ned-settings nokia-sros_nc transaction exclude-namespaces
-----------------------------------------------------------------

  This list can be used to filter out certain namespaces from the configuration
  (i.e. all nodes belonging to namespaces given in this list will be dropped
  from the config before sent to NSO).

    - transaction exclude-namespaces <ns>

      - ns <namespace>

        Namespace to exclude (i.e. as it appears in the yang module).


## 2.3. ned-settings nokia-sros_nc transaction inject-meta-data
---------------------------------------------------------------

  Inject tailf:meta-data extension into schema at given path, used for example to trigger xml
  transform methods (java methods annotated with XMLTransformMethod) before xml is sent to NSO,
  or when editing, to device. The meta-data can also be used for other purposes in custom java
  code in the NED. The path supplied can even be a key-path, i.e. containg list keys within curly
  braces.

      For example, setting:

        transaction inject-meta-data 0 path /interfaces/interface/Ethernet{0/0}/mtu meta-data filter-by-version meta-value "VERSION > 7.0"

      Will be same as if the below yang statements would be present in the leaf mtu, but only for Ethernet0/0:

        tailf:meta-data filter-by-version {
          tailf:meta-value "VERSION > 7.0";
        }

  NOTE: For more information about custom xml transforms, see section 'Custom XML transforms' in the README.md.

    - transaction inject-meta-data <id> <path> <meta-data> <meta-value>

      - id <uint16>

        Id in list, not used.

      - path <schema-path|key-path>

        Schema path, or key-path (i.e. with keys in curly braces), to node where to inject
        the meta-data (non-unique nodes must be prefixed with 'global' prefix, i.e. prefix from module)

      - meta-data <string>

        Argument to tailf:meta-data as it would appear in yang.

      - meta-value <string>

        Argument to tailf:meta-value as it would appear in yang (can be left out if no meta-value
        sub-statement needed).


## 2.4. ned-settings nokia-sros_nc transaction bof-settings
-----------------------------------------------------------

  Control NED behaviour regarding 'bof' settings.The SROS devices regard 'bof' settings as a
  separate datastore, meaning that it is not permitted to deploy together with standard config.


    - bof-settings enable <true|false> (default false)

      Enable NED support for handling of 'bof' settings through NSO.


    - bof-settings use-config-region-ns <true|false> (default false)

      SROS requires special non rfc compliant extensions to the messages used by the netconf
      protocol to handle 'bof' settings. These extensions should actually be prefixed with their own
      namespace. However, it seems that older versions of SROS cannot handle extra namespaces. This
      applies to versions up to SROS 23. For SROS version 23 or newer it is required to set this
      setting to true.


# 3. ned-settings nokia-sros_nc connection
------------------------------------------

  Settings related to the initial connection to the device, including the initial hand-shake
  (hello).


## 3.1. ned-settings nokia-sros_nc connection capabilities
----------------------------------------------------------

  Settings related the netconf capablities, and the discovery of supported yang modules.


    - capabilities defaults-mode-override <enum>

      Use this setting to override/force the 'with-defaults' handling reported to NSO,
      regardless of what the device reports. When 'trim' is forced, the NED will trim
      default values from data before sent to NSO, i.e. regardless of if the device support
      it or not it will look like it's supported and in use.

      report-all  - report-all.

      explicit    - explicit.

      trim        - trim.


    - capabilities use-netconf-state <true|false> (default false)

      If this setting is enabled, and the device declares support for ietf-yang namespace
      'ietf-netconf-monitoring', the list /netconf-state/schemas/schema will be fetched from the
      device to discover available yang modules. Note, once fetched the contents will be cached in
      persistent oper data until cleared with the built-in rpc clear-cached-capabilities.


    - capabilities use-modules-state <true|false> (default true)

      If this setting is enabled, and the device declares support for the netconf capability 'yang-library',
      the node /modules-state from the ietf namespace 'ietf-yang-library' will be fetched from the device
      to discover available yang modules. Note, once fetched the contents are cached in persistent oper
      data and will only be refetched if the 'module-set-id' changes on the device, or the cache is cleared
      with the built-in rpc clear-cached-capabilities.


    - capabilities use-yang-library <true|false> (default true)

      If this setting is enabled, and the device declares support for the netconf capability 'yang-library'
      (version 1.1), the node /yang-library from the ietf namespace 'ietf-yang-library' will be fetched
      from the device to discover available yang modules. Note, once fetched the contents are cached in
      persistent oper data and will only be refetched if the 'content-id' changes on the device, or the
      cache is cleared with the built-in rpc clear-cached-capabilities.


    - capabilities use-all-local-modules <true|false> (default false)


### 3.1.1. ned-settings nokia-sros_nc connection capabilities regex-exclude
---------------------------------------------------------------------------

  List of regex patterns to use for excluding capabilities sent from device in hello, for example to
  exclude a capability which the device announces in hello, but which is not correctly implemented

    - capabilities regex-exclude <pattern>

      - pattern <regex>

        Regular expression to match contents of capabilities for exclusion.


### 3.1.2. ned-settings nokia-sros_nc connection capabilities regex-include
---------------------------------------------------------------------------

  List of regex patterns to use for including capabilities sent from device in hello. Note that
  when this list is non-empty, only capabilities matching any of the patterns in this list will
  be included

    - capabilities regex-include <pattern>

      - pattern <regex>

        Regular expression to match contents of capabilities for inclusion.


### 3.1.3. ned-settings nokia-sros_nc connection capabilities inject
--------------------------------------------------------------------

  This list can be used to inject capabilities into the hello from the device, before processed and sent
  to NSO, for example if a capability sent from the device is invalid, it can be filtered out using
  'regex-exclude', and replaced with an inject. Also if device leaves out a capability that should be
  present and is needed, it can be injected.

    - capabilities inject <capa>

      - capa <string>

        Capability string to inject, as it would appear in the 'hello', that is the content which
        appears inside the 'capability' xml-tag, e.g 'urn:ietf:params:netconf:capability:candidate:1.0'.


## 3.2. ned-settings nokia-sros_nc connection ssh
-------------------------------------------------

  Settings related to the SSH client used by the NED to connect to the device.


    - ssh host-key known-hosts-file <string>

      Path to openssh formatted 'known_hosts' file containing valid host keys.


    - ssh host-key public-key-file <string>

      Path to openssh formatted public (.pub) host key file.


    - ssh host-key auto-fetch <true|false> (default false)

      Enable this setting to let the NED handle host-key validation internally (i.e. instead of using
      NSO's 'ssh fetch-host-keys' action). The NED will store the host-key sent on the first
      connection, after which it will verify that the host-key has not changed on subsequent connects
      (it's stored in persistent operational data store in NSO, see below for how to view and edit
      this list). This will work when connecting through a proxy as well. Please note that to enable
      host-key validation for proxy connections, enable the ned-setting 'proxy host-key-validation'.

      To view the stored known host-keys, you can for example do the below in ncs_cli:

         admin@ncs# show devices device dev-1 ned-settings nokia-sros_nc-oper known-host-keys
         HOST           PORT   FINGERPRINT
         -----------------------------------------------------------------------
         1.2.3.4        22     5c:aa:74:e0:4b:e2:a2:dd:67:0b:83:71:1b:24:42:fe
         127.0.0.1      10883  a8:a7:39:a2:ed:7e:b8:80:1f:94:81:70:53:59:2f:bb

      NOTE: When the host-key of a device changes and needs to be updated, it needs to be cleared in
      the persistent store first, this can for example be done from the command line with the ncs_cmd
      tool like this:

       $ ncs_cmd -c "mdel /ncs:devices/device{dev-1}/ned-settings/nokia-sros_nc-oper/known-host-keys"


    - ssh auth-key private-key-file <string>

      Path to openssh formatted private key file for doing public key auth to device or proxy. Note
      that if private-key authentication is needed to the device when connecting through a proxy,
      that needs to be configured in 'proxy/auth-key/private-key-file.


    - ssh keep-alive-interval <seconds> (default 0)

      Configure SSH client keep alive interval in seconds, default 0 (i.e. no keep-alive). The
      keep-alive is implemented in the client by sending an ssh 'ignore' message on the given
      interval.


# 4. ned-settings nokia-sros_nc proxy
-------------------------------------

  Configure NED to access device via an ssh proxy (i.e. a ssh 'jump-host'). By default, when this options is used,
  the address, port, and credentials normally given for the device in NSO, is used as the address and credentials
  for the ssh proxy, in which case the ned-settings here are then used to access the actual device.

  This 'reverse' logic is the effect of how the API historically worked, and can be changed by enabling the setting
  'global-proxy'. When this setting is set to true, the device config is the address/port and credentials for the actual
  device (behind the proxy), and the proxy host is configured in this section. This means that the proxy can be configured
  globally, or in a profile, which is a convenient way to switch all or some devices to connect through a jump-host.


    - proxy global-proxy <true|false> (default false)

      Enable this setting to 'reverse' the meaning of the settings in the proxy section into actually configuring the
      proxy host instead of the device behind the proxy. Note that if enabling 'global-proxy' and host-key-validation is
      preferred, the host-key of the proxy either needs to be added in the ned setting 'connection/ssh/host-key', or be
      added to the .ssh/known_hosts of the user running NSO, or 'ssh host-key auto-fetch' needs to be enabled. The NSO
      built-in standard fetch-host-keys can not be used of course since the configured device address is not to the proxy any more.


    - proxy remote-address <ip-address|domain-name>

      Internal address of device, i.e. when accessed from the proxy.


    - proxy remote-port <uint16>

      Port of device.


      Either of:

        - devices device ned-settings nokia-sros_nc proxy remote-name <string>

          User name on the device behind the proxy.

        - devices device ned-settings nokia-sros_nc proxy remote-password <string>

          Password on the device behind the proxy.

      OR:

        - devices device ned-settings nokia-sros_nc proxy authgroup <string>

          Authentication credentials for the device behind the proxy.


    - proxy auth-key private-key-file <string>

      Path to openssh formatted private key file for doing public key auth to device behind proxy.
      Note that if private-key authentication is needed to the proxy itself, that needs to be
      configured as it would be for the device, in 'connection/ssh/auth-key/private-key-file.


    - proxy host-key-validation <true|false> (default false)

      Determines if the host-key of the device or proxy should be validated or not. If validation is
      preferred, the host-key must be configured in 'connection/ssh/host-key'.


# 5. ned-settings nokia-sros_nc live-status
-------------------------------------------

  Configure NED settings related to live-status.


    - live-status do-separate-get-calls <true|false> (default false)

      By default this NED is passing a subtree filter with all requested paths to the device in one
      get call. This is a fast method. Some devices do however not function properly with subtree
      filters. In this case it is necessary to do one separate get call for each requested path. Set
      to true if the NED shall do separate get calls.


    - live-status show-stats-filter <true|false> (default true)

      Use the filter API from NSO to do live-status requests (available in NSO 6.1 and later). This
      API is much more flexible and will result in fewer round-trips to the device and possibly less
      data transferred from the device.


    - live-status time-to-live <int32> (default 50)

      Define time-to-live for data fetched from the device via live-status.


    - live-status filter-unmodeled <true|false> (default true)

      Filters out operational data not present in yang-model before returning result to NSO.


    - live-status filter-invalid-values <true|false> (default false)

      Filter out invalid leaf values from config before sending to NSO to avoid sync-from failure on
      for example invalid range expression.


    - live-status canonicalize-idrefs <true|false> (default true)

      Canonicalize leaf values of type 'identityref' in operational data before sending to NSO, i.e.
      add/change prefix to global prefix in NSO.


    - live-status nmda get-data enable <true|false> (default false)

      Use get-data rpc for data retrieval, if device supports it.


    - live-status nmda get-data datastore <union> (default operational)

      Configure datastore to be used when using the get-data rpc.


    - live-status nmda get-data skip-config <true|false> (default false)

      Ask the device to not include 'config true' data in the response.


    - live-status nmda get-data origin-filter <union>


    - live-status ignore-get-error-codes <string> (default unknown-element)

      Some SROS devices do return an error instead of valid data on certain paths advertised by the
      device when the NED is trying to get operational data. Such errors will typically result in
      the NED throwing an exception towards NSO, which then will bail out. To avoid this, the NED
      can be configurued to ignore the error returned by the device and instead return empty data to
      NSO.


    - live-status exec-any-mode <enum> (default md-cli-raw-command)

      Configure how the NED can exceute CLI commands on the device. The default is to use the
      md-cli-raw-command feature, which is a very efficient SROS specific method to tunnel CLI
      commands over NETCONF. This feature is only available on SROS version 22 and newer. Older SROS
      version require the NED to use CLI mode instead.

      md-cli-raw-command  - md-cli-raw-command.

      cli                 - cli.


## 5.1. ned-settings nokia-sros_nc live-status regex-exclude
------------------------------------------------------------

  This list of regular expressions match the schema path of nodes to filter out from live-status (oper)
  data before sending it to NSO. The regex matches on either of the pure tag-path, 'global' path, or the
  key-path (i.e. possibly including keys within curly braces) of nodes in the data. I.e. if a path is
  unique, prefixes can be omitted, but not when used in a key-path, then a 'global' path is needed,
  i.e. prefixed as it would appear in NSO, including the prefix on each level where new namespace occurs.

    - live-status regex-exclude <pattern>

      - pattern <regex>

        Regular expression matching path/key-path of node(s) to exclude.


## 5.2. ned-settings nokia-sros_nc live-status cli
--------------------------------------------------

  Configuration of CLI interaction through 'exec any <cli-cmd>'.


    - cli port <uint16>

      Alternatative port on device, if interactive CLI not availble on same port as 'netconf'
      subsystem.


    - cli prompt-pattern <string> (default ^.*# $)

      Regex to match device prompt.


    - cli no-pagination-cmd <string> (default environment more false)

      Command line to send after login to turn off pagination on the  device (i.e. to make output from commands not
      stop to prompt user for 'more').


### 5.2.1. ned-settings nokia-sros_nc live-status cli auto-prompts
------------------------------------------------------------------

  Sometimes when entering commands in an interative shell, the device prompts for some specific
  input, in cases like this, this list can be configured with pairs of "questions" and "answers" to
  be used when interacting with the device. The "questions" are in the form of regular-expressions,
  which matches the prompt or "question" output from the device, and the "answers" are the string to
  send back to the device, when that specific "question" is found in the output from the device.

  For example, to add the response "secret" for a password prompt, one can add the
  below ned-settings:

    live-status cli auto-prompts 10 question ".*assword: ?" answer secret

    - cli auto-prompts <id> <question> <answer>

      - id <WORD>

        List id, any string (NOTE: list is matched in the order sorted on id).

      - question <WORD>

        Device question, as a regular expression.

      - answer <WORD>

        Answer to device question, i.e verbatim string to send as answer when 'question' is matched.


# 6. ned-settings nokia-sros_nc logger
--------------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Sets the logger verbosity. Enable raw trace on the device instance in NSO to
      get trace output. To trace the netconf raw RPCs, set level to verbose or debug.

      error    - Most restricitve level, only log errors.

      info     - Normal level, logs errors and important events.

      verbose  - Intermediate debug level, logs most events.

      debug    - Least restrictive level, logs everything, output might grow very large.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log, Note, this file is shared between all NED
      instances and might grow very large if level is increased.


# 7. ned-settings nokia-sros_nc developer
-----------------------------------------

  Contains settings used by the NED developers.


    - developer trace-timestamp <true|false> (default false)

      Add timestamp from NED instance in trace messages for debug purpose.


    - developer sync-from-verbose <enum> (default brief)

      Set info level for sync-from verbose output.

      brief  - brief.

      full   - full.


    - developer strict-maapi-error-check <true|false> (default true)

      When this setting is enabled, if maapi reports error when loading data to NSO, the error is
      reported back to NSO, failing show operation.


    - developer progress-verbosity <enum> (default debug)

      Maximum NED verbosity level which will get written in devel.log file.

      disabled      - disabled.

      normal        - normal.

      verbose       - verbose.

      very-verbose  - very-verbose.

      debug         - debug.


    - developer platform model <string>

      Override device model name/number.


    - developer platform name <string>

      Override device name.


    - developer platform version <string>

      Override device version.


