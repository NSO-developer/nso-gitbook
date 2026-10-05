<a id="cls-CommitParams"></a>
# CommitParams

```java
public class com.tailf.maapi.CommitParams
```

## Members

**Constructors**:

- [CommitParams()](#m-commitparams-96def6df85c7)
- [CommitParams(ConfResponse)](#m-commitparams-ab508deab7fc)

**Methods**:

- [getComment()](#m-getcomment-a5625f95afef)
- [getCommitQueueErrorOption()](#m-getcommitqueueerroroption-02d8e875c53a)
- [getCommitQueueSyncTimeout()](#m-getcommitqueuesynctimeout-e7de4f1d540d)
- [getConfirmNetworkStateMode()](#m-getconfirmnetworkstatemode-67298d410942)
- [getConfirmNetworkStateScope()](#m-getconfirmnetworkstatescope-8f24b882d00c)
- [getConfXMLParam()](#m-getconfxmlparam-2fc696e04b37)
- [getDryRunOutformat()](#m-getdryrunoutformat-270c3885ad1f)
- [getLabel()](#m-getlabel-72bf899bf6f1)
- [getNoOverwriteScope()](#m-getnooverwritescope-0834b5ba0444)
- [getTraceId()](#m-gettraceid-c3a30b94d9ce)
- [isCommitQueueAsync()](#m-iscommitqueueasync-98da07748ea8)
- [isCommitQueueAtomic()](#m-iscommitqueueatomic-eb0f74c72cd6)
- [isCommitQueueBlockOthers()](#m-iscommitqueueblockothers-7c78b894565c)
- [isCommitQueueBypass()](#m-iscommitqueuebypass-48cf7c2f499e)
- [isCommitQueueLock()](#m-iscommitqueuelock-453eb5b540db)
- [isCommitQueueNonAtomic()](#m-iscommitqueuenonatomic-503d59982f24)
- [isCommitQueueSync()](#m-iscommitqueuesync-07c27c4d44dc)
- [isConfirmNetworkState()](#m-isconfirmnetworkstate-72763326353b)
- [isConfirmNetworkStateReDeployAll()](#m-isconfirmnetworkstateredeployall-39f5a27bcc90)
- [isConfirmNetworkStateReEvaluatePolicies()](#m-isconfirmnetworkstatereevaluatepolicies-04e8c08913bc)
- [isDryRun()](#m-isdryrun-c582ac0a71e9)
- [isDryRunReverse()](#m-isdryrunreverse-a65054993c74)
- [isNoDeploy()](#m-isnodeploy-f061e1761bdb)
- [isNoLsa()](#m-isnolsa-5849b6b97565)
- [isNoNetworking()](#m-isnonetworking-e860996a0c6f)
- [isNoOutOfSyncCheck()](#m-isnooutofsynccheck-133ddf8b9fba)
- [isNoOverwrite()](#m-isnooverwrite-235918e79631)
- [isNoRevisionDrop()](#m-isnorevisiondrop-98b0095f3834)
- [isReconcileAttachNonServiceConfig()](#m-isreconcileattachnonserviceconfig-b1fbf7be4392)
- [isReconcileDetachNonServiceConfig()](#m-isreconciledetachnonserviceconfig-9477adadc93e)
- [isReconcileDiscardNonServiceConfig()](#m-isreconcilediscardnonserviceconfig-0f56a30c024a)
- [isReconcileKeepNonServiceConfig()](#m-isreconcilekeepnonserviceconfig-e9f0db6c8627)
- [isUseLsa()](#m-isuselsa-571767b1c145)
- [isWithServiceMetaData()](#m-iswithservicemetadata-5e9f7f6e0491)
- [setComment(String)](#m-setcomment-2b177786255b)
- [setCommitQueueAsync()](#m-setcommitqueueasync-03241e60c409)
- [setCommitQueueAtomic()](#m-setcommitqueueatomic-f3f2726e061e)
- [setCommitQueueBlockOthers()](#m-setcommitqueueblockothers-9dde0dc0ee1f)
- [setCommitQueueBypass()](#m-setcommitqueuebypass-c774cb8682ea)
- [setCommitQueueErrorOption(CommitQueueErrorOption)](#m-setcommitqueueerroroption-266fa7d56552)
- [setCommitQueueLock()](#m-setcommitqueuelock-d174e0df574d)
- [setCommitQueueNonAtomic()](#m-setcommitqueuenonatomic-eadc7dda3443)
- [setCommitQueueSync()](#m-setcommitqueuesync-c765582ecb68)
- [setCommitQueueSync(int)](#m-setcommitqueuesync-673a650b4146)
- [setConfirmNetworkState()](#m-setconfirmnetworkstate-26a5fc6bf2b0)
- [setConfirmNetworkStateMode(ConfirmNetworkStateMode)](#m-setconfirmnetworkstatemode-69df21e2c75f)
- [setConfirmNetworkStateReDeployAll()](#m-setconfirmnetworkstateredeployall-2bc934f37f67)
- [setConfirmNetworkStateReEvaluatePolicies()](#m-setconfirmnetworkstatereevaluatepolicies-897562013182)
- [setConfirmNetworkStateScope(ConfirmNetworkStateScope)](#m-setconfirmnetworkstatescope-8d3822d01a41)
- [setDryRunCli()](#m-setdryruncli-28bc3e79c8ce)
- [setDryRunCliC()](#m-setdryrunclic-69937517c73a)
- [setDryRunCliCReverse()](#m-setdryrunclicreverse-6ef373e77dc8)
- [setDryRunNative()](#m-setdryrunnative-dafde9d7289e)
- [setDryRunNativeReverse()](#m-setdryrunnativereverse-af395bd47158)
- [setDryRunOutformat(DryRunOutformat)](#m-setdryrunoutformat-10ffbb272a91)
- [setDryRunReverse()](#m-setdryrunreverse-b16c866c3984)
- [setDryRunXml()](#m-setdryrunxml-26fdec13b168)
- [setLabel(String)](#m-setlabel-792770d84f9d)
- [setNoDeploy()](#m-setnodeploy-d50f402dde27)
- [setNoLsa()](#m-setnolsa-05d26d1f9721)
- [setNoNetworking()](#m-setnonetworking-cbf90b89dd62)
- [setNoOutOfSyncCheck()](#m-setnooutofsynccheck-1c5a3cc1706a)
- [setNoOverwrite(NoOverwriteScope)](#m-setnooverwrite-d43b0e931749)
- [setNoRevisionDrop()](#m-setnorevisiondrop-d1ccba36de11)
- [setReconcileAttachNonServiceConfig()](#m-setreconcileattachnonserviceconfig-f25b6fd49965)
- [setReconcileDetachNonServiceConfig()](#m-setreconciledetachnonserviceconfig-778050d72638)
- [setReconcileDiscardNonServiceConfig()](#m-setreconcilediscardnonserviceconfig-ff68aa80b12a)
- [setReconcileExcludePaths(ConfList)](#m-setreconcileexcludepaths-70d0435623d0)
- [setReconcileIncludePaths(ConfList)](#m-setreconcileincludepaths-3bec367b49f3)
- [setReconcileKeepNonServiceConfig()](#m-setreconcilekeepnonserviceconfig-6ad07f941bc3)
- [setTraceId(String)](#m-settraceid-72123789197d)
- [setUseLsa()](#m-setuselsa-15fd505b0cf9)
- [setWithServiceMetaData()](#m-setwithservicemetadata-9bd7b836b2dc)
- [toString()](#m-tostring-e9d48c5503ef)

**Nested Types**:

- [CommitQueueErrorOption](CommitParams/CommitQueueErrorOption.md#cls-CommitQueueErrorOption)
- [ConfirmNetworkStateMode](CommitParams/ConfirmNetworkStateMode.md#cls-ConfirmNetworkStateMode)
- [ConfirmNetworkStateScope](CommitParams/ConfirmNetworkStateScope.md#cls-ConfirmNetworkStateScope)
- [DryRunOutformat](CommitParams/DryRunOutformat.md#cls-DryRunOutformat)
- [NoOverwriteScope](CommitParams/NoOverwriteScope.md#cls-NoOverwriteScope)

## Constructors

<a id="m-commitparams-96def6df85c7"></a>
### CommitParams()

```java
public CommitParams()
```

<a id="m-commitparams-ab508deab7fc"></a>
### CommitParams(ConfResponse)

```java
public CommitParams(com.tailf.conf.ConfResponse result)
```

Types: [ConfResponse](../conf/ConfResponse.md#cls-ConfResponse)

**Parameters**

- `com.tailf.conf.ConfResponse result`


## Methods

<a id="m-getcomment-a5625f95afef"></a>
### getComment()

```java
public String getComment()
```

Get the the comment for the transaction.

**Returns:** The comment.

<a id="m-getcommitqueueerroroption-02d8e875c53a"></a>
### getCommitQueueErrorOption()

```java
public com.tailf.maapi.CommitParams.CommitQueueErrorOption getCommitQueueErrorOption()
```

Types: [CommitQueueErrorOption](CommitParams/CommitQueueErrorOption.md#cls-CommitQueueErrorOption)

Get commit queue error option.

**Returns:** The error option or null if not set.

<a id="m-getcommitqueuesynctimeout-e7de4f1d540d"></a>
### getCommitQueueSyncTimeout()

```java
public Long getCommitQueueSyncTimeout()
```

Get commit queue synchronous mode of operation custom timeout.

**Returns:** The timeout in seconds. -1 means infinity. If no value has
         been set null is returned.

<a id="m-getconfirmnetworkstatemode-67298d410942"></a>
### getConfirmNetworkStateMode()

```java
public com.tailf.maapi.CommitParams.ConfirmNetworkStateMode getConfirmNetworkStateMode()
```

Types: [ConfirmNetworkStateMode](CommitParams/ConfirmNetworkStateMode.md#cls-ConfirmNetworkStateMode)

Get the mode for the confirm-network-state check.

**Returns:** The confirm-network-state mode or null if not set.

<a id="m-getconfirmnetworkstatescope-8f24b882d00c"></a>
### getConfirmNetworkStateScope()

```java
public com.tailf.maapi.CommitParams.ConfirmNetworkStateScope getConfirmNetworkStateScope()
```

Types: [ConfirmNetworkStateScope](CommitParams/ConfirmNetworkStateScope.md#cls-ConfirmNetworkStateScope)

Get the confirm-network-state scope.

**Returns:** The confirm-network-state scope or null if not set.

<a id="m-getconfxmlparam-2fc696e04b37"></a>
### getConfXMLParam()

```java
public java.util.List<com.tailf.conf.ConfXMLParam> getConfXMLParam()
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam)

Get all commit parameters as a list of [`ConfXMLParam`](../conf/ConfXMLParam.md#cls-ConfXMLParam).

**Returns:** List of [`ConfXMLParam`](../conf/ConfXMLParam.md#cls-ConfXMLParam) representing the current
         commit parameters.

<a id="m-getdryrunoutformat-270c3885ad1f"></a>
### getDryRunOutformat()

```java
public com.tailf.maapi.CommitParams.DryRunOutformat getDryRunOutformat()
```

Types: [DryRunOutformat](CommitParams/DryRunOutformat.md#cls-DryRunOutformat)

Get the outformat to produce when committing with dry-run.

**Returns:** The outformat to produce or null if not set.

<a id="m-getlabel-72bf899bf6f1"></a>
### getLabel()

```java
public String getLabel()
```

Get the the label for the transaction.

**Returns:** The label.

<a id="m-getnooverwritescope-0834b5ba0444"></a>
### getNoOverwriteScope()

```java
public com.tailf.maapi.CommitParams.NoOverwriteScope getNoOverwriteScope()
```

Types: [NoOverwriteScope](CommitParams/NoOverwriteScope.md#cls-NoOverwriteScope)

Get the no-overwrite scope.

**Returns:** The no-overwrite scope or null if not set.

<a id="m-gettraceid-c3a30b94d9ce"></a>
### getTraceId()

```java
public String getTraceId()
```

Get the the trace id for the transaction.

**Returns:** The trace id.

<a id="m-iscommitqueueasync-98da07748ea8"></a>
### isCommitQueueAsync()

```java
public boolean isCommitQueueAsync()
```

Get commit queue asynchronous mode of operation.

**Returns:** true if the mode of operation is asynchronous, false otherwise.

<a id="m-iscommitqueueatomic-eb0f74c72cd6"></a>
### isCommitQueueAtomic()

```java
public boolean isCommitQueueAtomic()
```

Check if the commit queue item is atomic.

**Returns:** true if it is atomic, false if it isn't.

<a id="m-iscommitqueueblockothers-7c78b894565c"></a>
### isCommitQueueBlockOthers()

```java
public boolean isCommitQueueBlockOthers()
```

Check if the the commit queue item block other commit queue items
 for these devices.

<a id="m-iscommitqueuebypass-48cf7c2f499e"></a>
### isCommitQueueBypass()

```java
public boolean isCommitQueueBypass()
```

Check if the commit should bypass the commit queue, i.e. it is
 transactional even though commit queue is the default.

**Returns:** true if the commit queue should be bypassed, false otherwise.

<a id="m-iscommitqueuelock-453eb5b540db"></a>
### isCommitQueueLock()

```java
public boolean isCommitQueueLock()
```

Check if the commit queue item is locked.

**Returns:** true if it is locked, false otherwise.

<a id="m-iscommitqueuenonatomic-503d59982f24"></a>
### isCommitQueueNonAtomic()

```java
public boolean isCommitQueueNonAtomic()
```

Check if the commit queue item is non-atomic.

**Returns:** true if it is non-atomic, false if it isn't.

<a id="m-iscommitqueuesync-07c27c4d44dc"></a>
### isCommitQueueSync()

```java
public boolean isCommitQueueSync()
```

Get commit queue synchronous mode of operation.

**Returns:** true if the mode of operation is synchronous, false otherwise.

<a id="m-isconfirmnetworkstate-72763326353b"></a>
### isConfirmNetworkState()

```java
public boolean isConfirmNetworkState()
```

Should a check be done that the parts of the device configuration
 read and/or modified are up-to-date in CDB before pushing the
 configuration change to the device.

<a id="m-isconfirmnetworkstateredeployall-39f5a27bcc90"></a>
### isConfirmNetworkStateReDeployAll()

```java
public boolean isConfirmNetworkStateReDeployAll()
```

Re-deploy all services affected by discovered out-of-band data?

<a id="m-isconfirmnetworkstatereevaluatepolicies-04e8c08913bc"></a>
### isConfirmNetworkStateReEvaluatePolicies()

```java
public boolean isConfirmNetworkStateReEvaluatePolicies()
```

Is confirm-network-state with re-evaluate-policies enabled

**Deprecated:** Use `getConfirmNetworkStateMode()` instead.

<a id="m-isdryrun-c582ac0a71e9"></a>
### isDryRun()

```java
public boolean isDryRun()
```

Check if dry-run is enabled.

**Returns:** true if dry-run is enabled, false otherwise.

<a id="m-isdryrunreverse-a65054993c74"></a>
### isDryRunReverse()

```java
public boolean isDryRunReverse()
```

Check if the dry-run should produce a reverse diff.

**Returns:** true if the produced diff should be reverse,
         false otherwise.

<a id="m-isnodeploy-f061e1761bdb"></a>
### isNoDeploy()

```java
public boolean isNoDeploy()
```

Check if service's create method should be invoked or not.

**Returns:** true if it should be invoked, false otherwise.

<a id="m-isnolsa-5849b6b97565"></a>
### isNoLsa()

```java
public boolean isNoLsa()
```

Get no-lsa commit parameter.

**Returns:** true if set, false otherwise.

<a id="m-isnonetworking-e860996a0c6f"></a>
### isNoNetworking()

```java
public boolean isNoNetworking()
```

Check if the configuration should only be written to CDB, not
 actually pushed to the device.

**Returns:** true if the configuration should not be pused to the
         device, false otherwise.

<a id="m-isnooutofsynccheck-133ddf8b9fba"></a>
### isNoOutOfSyncCheck()

```java
public boolean isNoOutOfSyncCheck()
```

<a id="m-isnooverwrite-235918e79631"></a>
### isNoOverwrite()

```java
public boolean isNoOverwrite()
```

Should a check be done that the parts of the device configuration
 to be modified are up-to-date in CDB before pushing the
 configuration change to the device.

<a id="m-isnorevisiondrop-98b0095f3834"></a>
### isNoRevisionDrop()

```java
public boolean isNoRevisionDrop()
```

Check if no-revision-drop commit parameter is set.

**Returns:** true if it is set, false otherwise.

<a id="m-isreconcileattachnonserviceconfig-b1fbf7be4392"></a>
### isReconcileAttachNonServiceConfig()

```java
public boolean isReconcileAttachNonServiceConfig()
```

Get reconcile commit parameter with attach-non-service-config option.

**Returns:** true if set, false otherwise.

<a id="m-isreconciledetachnonserviceconfig-9477adadc93e"></a>
### isReconcileDetachNonServiceConfig()

```java
public boolean isReconcileDetachNonServiceConfig()
```

Get reconcile commit parameter with detach-non-service-config option.

**Returns:** true if set, false otherwise.

<a id="m-isreconcilediscardnonserviceconfig-0f56a30c024a"></a>
### isReconcileDiscardNonServiceConfig()

```java
public boolean isReconcileDiscardNonServiceConfig()
```

Get reconcile commit parameter with discard-non-service-config option.

**Returns:** true if set, false otherwise.

<a id="m-isreconcilekeepnonserviceconfig-e9f0db6c8627"></a>
### isReconcileKeepNonServiceConfig()

```java
public boolean isReconcileKeepNonServiceConfig()
```

Get reconcile commit parameter with keep-non-service-config option.

**Returns:** true if set false otherwise.

<a id="m-isuselsa-571767b1c145"></a>
### isUseLsa()

```java
public boolean isUseLsa()
```

Get use-lsa commit parameter.

**Returns:** true if set, false otherwise.

<a id="m-iswithservicemetadata-5e9f7f6e0491"></a>
### isWithServiceMetaData()

```java
public boolean isWithServiceMetaData()
```

Check if with-service-meta-data is enabled.

**Returns:** true if with-service-meta-data is enabled, false otherwise.

<a id="m-setcomment-2b177786255b"></a>
### setComment(String)

```java
public void setComment(String comment)
```

Set the comment for the transaction.

**Parameters**

- `String comment` - The comment to use for the transaction.

<a id="m-setcommitqueueasync-03241e60c409"></a>
### setCommitQueueAsync()

```java
public void setCommitQueueAsync()
```

Set commit queue asynchronous mode of operation.

<a id="m-setcommitqueueatomic-f3f2726e061e"></a>
### setCommitQueueAtomic()

```java
public void setCommitQueueAtomic()
```

Make the commit queue item atomic.

<a id="m-setcommitqueueblockothers-9dde0dc0ee1f"></a>
### setCommitQueueBlockOthers()

```java
public void setCommitQueueBlockOthers()
```

Make the commit queue item block other commit queue items
 for these devices.

<a id="m-setcommitqueuebypass-c774cb8682ea"></a>
### setCommitQueueBypass()

```java
public void setCommitQueueBypass()
```

Make the commit transactional even if commit queue is default.

<a id="m-setcommitqueueerroroption-266fa7d56552"></a>
### setCommitQueueErrorOption(CommitQueueErrorOption)

```java
public void setCommitQueueErrorOption(
    com.tailf.maapi.CommitParams.CommitQueueErrorOption errorOption
)
```

Types: [CommitQueueErrorOption](CommitParams/CommitQueueErrorOption.md#cls-CommitQueueErrorOption)

Set commit queue error option.

**Parameters**

- `com.tailf.maapi.CommitParams.CommitQueueErrorOption errorOption`

<a id="m-setcommitqueuelock-d174e0df574d"></a>
### setCommitQueueLock()

```java
public void setCommitQueueLock()
```

Make the commit queue item locked. Locked commit queue item needs to
 be unlocked before it can proceed.

<a id="m-setcommitqueuenonatomic-eadc7dda3443"></a>
### setCommitQueueNonAtomic()

```java
public void setCommitQueueNonAtomic()
```

Make the commit queue item non-atomic.

<a id="m-setcommitqueuesync-c765582ecb68"></a>
### setCommitQueueSync()

```java
public void setCommitQueueSync()
```

Set commit queue synchronous mode of operation.

<a id="m-setcommitqueuesync-673a650b4146"></a>
### setCommitQueueSync(int)

```java
public void setCommitQueueSync(int timeout)
```

Set commit queue synchronous mode of operation with custom timeout.

**Parameters**

- `int timeout` - Timeout in seconds. -1 means infinity.

<a id="m-setconfirmnetworkstate-26a5fc6bf2b0"></a>
### setConfirmNetworkState()

```java
public void setConfirmNetworkState()
```

Check that the parts of the device configuration read and/or modified
 are up-to-date in CDB before pushing the configuration change to the
 device.

<a id="m-setconfirmnetworkstatemode-69df21e2c75f"></a>
### setConfirmNetworkStateMode(ConfirmNetworkStateMode)

```java
public void setConfirmNetworkStateMode(com.tailf.maapi.CommitParams.ConfirmNetworkStateMode mode)
```

Types: [ConfirmNetworkStateMode](CommitParams/ConfirmNetworkStateMode.md#cls-ConfirmNetworkStateMode)

Set the mode for the confirm-network-state check.

**Parameters**

- `com.tailf.maapi.CommitParams.ConfirmNetworkStateMode mode`

<a id="m-setconfirmnetworkstateredeployall-2bc934f37f67"></a>
### setConfirmNetworkStateReDeployAll()

```java
public void setConfirmNetworkStateReDeployAll()
```

Re-deploy all services affected by discovered out-of-band data

<a id="m-setconfirmnetworkstatereevaluatepolicies-897562013182"></a>
### setConfirmNetworkStateReEvaluatePolicies()

```java
public void setConfirmNetworkStateReEvaluatePolicies()
```

Check that the parts of the device configuration read and/or modified
 are up-to-date in CDB before pushing the configuration change to the
 device and re-evaluate out-of-band policies of effected services.

**Deprecated:** Use [`ConfirmNetworkStateMode`](CommitParams/ConfirmNetworkStateMode.md#cls-ConfirmNetworkStateMode) instead.

<a id="m-setconfirmnetworkstatescope-8d3822d01a41"></a>
### setConfirmNetworkStateScope(ConfirmNetworkStateScope)

```java
public void setConfirmNetworkStateScope(com.tailf.maapi.CommitParams.ConfirmNetworkStateScope scope)
```

Types: [ConfirmNetworkStateScope](CommitParams/ConfirmNetworkStateScope.md#cls-ConfirmNetworkStateScope)

Set the scope of the confirm-network-state check.

**Parameters**

- `com.tailf.maapi.CommitParams.ConfirmNetworkStateScope scope`

<a id="m-setdryruncli-28bc3e79c8ce"></a>
### setDryRunCli()

```java
public void setDryRunCli()
```

Commit with dry-run outformat CLI.

<a id="m-setdryrunclic-69937517c73a"></a>
### setDryRunCliC()

```java
public void setDryRunCliC()
```

Commit with dry-run outformat cli-c.

<a id="m-setdryrunclicreverse-6ef373e77dc8"></a>
### setDryRunCliCReverse()

```java
public void setDryRunCliCReverse()
```

Commit with dry-run outformat cli-c reverse.

<a id="m-setdryrunnative-dafde9d7289e"></a>
### setDryRunNative()

```java
public void setDryRunNative()
```

Commit with dry-run outformat native.

<a id="m-setdryrunnativereverse-af395bd47158"></a>
### setDryRunNativeReverse()

```java
public void setDryRunNativeReverse()
```

Commit with dry-run outformat native reverse.

<a id="m-setdryrunoutformat-10ffbb272a91"></a>
### setDryRunOutformat(DryRunOutformat)

```java
public void setDryRunOutformat(com.tailf.maapi.CommitParams.DryRunOutformat outformat)
```

Types: [DryRunOutformat](CommitParams/DryRunOutformat.md#cls-DryRunOutformat)

Set the outformat to produce when committing with dry-run.

**Parameters**

- `com.tailf.maapi.CommitParams.DryRunOutformat outformat` - The outformat to produce.

<a id="m-setdryrunreverse-b16c866c3984"></a>
### setDryRunReverse()

```java
public void setDryRunReverse()
```

Make dry-run produce a reverse diff.

<a id="m-setdryrunxml-26fdec13b168"></a>
### setDryRunXml()

```java
public void setDryRunXml()
```

Commit with dry-run outformat XML.

<a id="m-setlabel-792770d84f9d"></a>
### setLabel(String)

```java
public void setLabel(String label)
```

Set the label for the transaction.

**Parameters**

- `String label` - The label to use for the transaction.

<a id="m-setnodeploy-d50f402dde27"></a>
### setNoDeploy()

```java
public void setNoDeploy()
```

Do not invoke service's create method.

<a id="m-setnolsa-05d26d1f9721"></a>
### setNoLsa()

```java
public void setNoLsa()
```

Set no-lsa commit parameter.

<a id="m-setnonetworking-cbf90b89dd62"></a>
### setNoNetworking()

```java
public void setNoNetworking()
```

Only write the configuration to CDB, do not actually push it to the
 device.

<a id="m-setnooutofsynccheck-1c5a3cc1706a"></a>
### setNoOutOfSyncCheck()

```java
public void setNoOutOfSyncCheck()
```

Do not check device sync state before pushing the configuration change.

<a id="m-setnooverwrite-d43b0e931749"></a>
### setNoOverwrite(NoOverwriteScope)

```java
public void setNoOverwrite(com.tailf.maapi.CommitParams.NoOverwriteScope scope)
```

Types: [NoOverwriteScope](CommitParams/NoOverwriteScope.md#cls-NoOverwriteScope)

Check that the parts of the device configuration to be modified are
 up-to-date in CDB before pushing the configuration change to the
 device.

**Parameters**

- `com.tailf.maapi.CommitParams.NoOverwriteScope scope`

<a id="m-setnorevisiondrop-d1ccba36de11"></a>
### setNoRevisionDrop()

```java
public void setNoRevisionDrop()
```

Set no-revision-drop commit parameter.

<a id="m-setreconcileattachnonserviceconfig-f25b6fd49965"></a>
### setReconcileAttachNonServiceConfig()

```java
public void setReconcileAttachNonServiceConfig()
```

Set reconcile commit parameter with attach-non-service-config option.

<a id="m-setreconciledetachnonserviceconfig-778050d72638"></a>
### setReconcileDetachNonServiceConfig()

```java
public void setReconcileDetachNonServiceConfig()
```

Set reconcile commit parameter with attach-non-service-config option.

<a id="m-setreconcilediscardnonserviceconfig-ff68aa80b12a"></a>
### setReconcileDiscardNonServiceConfig()

```java
public void setReconcileDiscardNonServiceConfig()
```

Set reconcile commit parameter with discard-non-service-config option.

<a id="m-setreconcileexcludepaths-70d0435623d0"></a>
### setReconcileExcludePaths(ConfList)

```java
public void setReconcileExcludePaths(com.tailf.conf.ConfList paths)
```

Types: [ConfList](../conf/ConfList.md#cls-ConfList)

Set the paths to be excluded during reconcilation.

**Parameters**

- `com.tailf.conf.ConfList paths` - A list of object-identifiers

<a id="m-setreconcileincludepaths-3bec367b49f3"></a>
### setReconcileIncludePaths(ConfList)

```java
public void setReconcileIncludePaths(com.tailf.conf.ConfList paths)
```

Types: [ConfList](../conf/ConfList.md#cls-ConfList)

Set the paths to be included during reconcilation.

**Parameters**

- `com.tailf.conf.ConfList paths` - A list of object-identifiers

<a id="m-setreconcilekeepnonserviceconfig-6ad07f941bc3"></a>
### setReconcileKeepNonServiceConfig()

```java
public void setReconcileKeepNonServiceConfig()
```

Set reconcile commit parameter with keep-non-service-config option.

<a id="m-settraceid-72123789197d"></a>
### setTraceId(String)

```java
public void setTraceId(String traceId)
```

Set the trace id for the transaction.

**Parameters**

- `String traceId` - The trace id to use for the transaction.

<a id="m-setuselsa-15fd505b0cf9"></a>
### setUseLsa()

```java
public void setUseLsa()
```

Set use-lsa commit parameter.

<a id="m-setwithservicemetadata-9bd7b836b2dc"></a>
### setWithServiceMetaData()

```java
public void setWithServiceMetaData()
```

Set with-service-meta-data commit parameter.

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```


## Nested Types

- [CommitQueueErrorOption](CommitParams/CommitQueueErrorOption.md#cls-CommitQueueErrorOption)
- [ConfirmNetworkStateMode](CommitParams/ConfirmNetworkStateMode.md#cls-ConfirmNetworkStateMode)
- [ConfirmNetworkStateScope](CommitParams/ConfirmNetworkStateScope.md#cls-ConfirmNetworkStateScope)
- [DryRunOutformat](CommitParams/DryRunOutformat.md#cls-DryRunOutformat)
- [NoOverwriteScope](CommitParams/NoOverwriteScope.md#cls-NoOverwriteScope)
