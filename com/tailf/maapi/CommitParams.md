# CommitParams <a href="#commitparams-819d9b5483cc" id="commitparams-819d9b5483cc"></a>

```java
public class com.tailf.maapi.CommitParams
```

## Members

**Constructors**:

- [CommitParams()](#commitparams-96def6df85c7)
- [CommitParams(ConfResponse)](#commitparams-ab508deab7fc)

**Methods**:

- [getComment()](#getcomment-a5625f95afef)
- [getCommitQueueErrorOption()](#getcommitqueueerroroption-02d8e875c53a)
- [getCommitQueueSyncTimeout()](#getcommitqueuesynctimeout-e7de4f1d540d)
- [getConfirmNetworkStateMode()](#getconfirmnetworkstatemode-67298d410942)
- [getConfirmNetworkStateScope()](#getconfirmnetworkstatescope-8f24b882d00c)
- [getConfXMLParam()](#getconfxmlparam-2fc696e04b37)
- [getDryRunOutformat()](#getdryrunoutformat-270c3885ad1f)
- [getLabel()](#getlabel-72bf899bf6f1)
- [getNoOverwriteScope()](#getnooverwritescope-0834b5ba0444)
- [getTraceId()](#gettraceid-c3a30b94d9ce)
- [isCommitQueueAsync()](#iscommitqueueasync-98da07748ea8)
- [isCommitQueueAtomic()](#iscommitqueueatomic-eb0f74c72cd6)
- [isCommitQueueBlockOthers()](#iscommitqueueblockothers-7c78b894565c)
- [isCommitQueueBypass()](#iscommitqueuebypass-48cf7c2f499e)
- [isCommitQueueLock()](#iscommitqueuelock-453eb5b540db)
- [isCommitQueueNonAtomic()](#iscommitqueuenonatomic-503d59982f24)
- [isCommitQueueSync()](#iscommitqueuesync-07c27c4d44dc)
- [isConfirmNetworkState()](#isconfirmnetworkstate-72763326353b)
- [isConfirmNetworkStateReDeployAll()](#isconfirmnetworkstateredeployall-39f5a27bcc90)
- [isConfirmNetworkStateReEvaluatePolicies()](#isconfirmnetworkstatereevaluatepolicies-04e8c08913bc)
- [isDryRun()](#isdryrun-c582ac0a71e9)
- [isDryRunReverse()](#isdryrunreverse-a65054993c74)
- [isNoDeploy()](#isnodeploy-f061e1761bdb)
- [isNoLsa()](#isnolsa-5849b6b97565)
- [isNoNetworking()](#isnonetworking-e860996a0c6f)
- [isNoOutOfSyncCheck()](#isnooutofsynccheck-133ddf8b9fba)
- [isNoOverwrite()](#isnooverwrite-235918e79631)
- [isNoRevisionDrop()](#isnorevisiondrop-98b0095f3834)
- [isReconcileAttachNonServiceConfig()](#isreconcileattachnonserviceconfig-b1fbf7be4392)
- [isReconcileDetachNonServiceConfig()](#isreconciledetachnonserviceconfig-9477adadc93e)
- [isReconcileDiscardNonServiceConfig()](#isreconcilediscardnonserviceconfig-0f56a30c024a)
- [isReconcileKeepNonServiceConfig()](#isreconcilekeepnonserviceconfig-e9f0db6c8627)
- [isUseLsa()](#isuselsa-571767b1c145)
- [isWithServiceMetaData()](#iswithservicemetadata-5e9f7f6e0491)
- [setComment(String)](#setcomment-2b177786255b)
- [setCommitQueueAsync()](#setcommitqueueasync-03241e60c409)
- [setCommitQueueAtomic()](#setcommitqueueatomic-f3f2726e061e)
- [setCommitQueueBlockOthers()](#setcommitqueueblockothers-9dde0dc0ee1f)
- [setCommitQueueBypass()](#setcommitqueuebypass-c774cb8682ea)
- [setCommitQueueErrorOption(CommitQueueErrorOption)](#setcommitqueueerroroption-266fa7d56552)
- [setCommitQueueLock()](#setcommitqueuelock-d174e0df574d)
- [setCommitQueueNonAtomic()](#setcommitqueuenonatomic-eadc7dda3443)
- [setCommitQueueSync()](#setcommitqueuesync-c765582ecb68)
- [setCommitQueueSync(int)](#setcommitqueuesync-673a650b4146)
- [setConfirmNetworkState()](#setconfirmnetworkstate-26a5fc6bf2b0)
- [setConfirmNetworkStateMode(ConfirmNetworkStateMode)](#setconfirmnetworkstatemode-69df21e2c75f)
- [setConfirmNetworkStateReDeployAll()](#setconfirmnetworkstateredeployall-2bc934f37f67)
- [setConfirmNetworkStateReEvaluatePolicies()](#setconfirmnetworkstatereevaluatepolicies-897562013182)
- [setConfirmNetworkStateScope(ConfirmNetworkStateScope)](#setconfirmnetworkstatescope-8d3822d01a41)
- [setDryRunCli()](#setdryruncli-28bc3e79c8ce)
- [setDryRunCliC()](#setdryrunclic-69937517c73a)
- [setDryRunCliCReverse()](#setdryrunclicreverse-6ef373e77dc8)
- [setDryRunNative()](#setdryrunnative-dafde9d7289e)
- [setDryRunNativeReverse()](#setdryrunnativereverse-af395bd47158)
- [setDryRunOutformat(DryRunOutformat)](#setdryrunoutformat-10ffbb272a91)
- [setDryRunReverse()](#setdryrunreverse-b16c866c3984)
- [setDryRunXml()](#setdryrunxml-26fdec13b168)
- [setLabel(String)](#setlabel-792770d84f9d)
- [setNoDeploy()](#setnodeploy-d50f402dde27)
- [setNoLsa()](#setnolsa-05d26d1f9721)
- [setNoNetworking()](#setnonetworking-cbf90b89dd62)
- [setNoOutOfSyncCheck()](#setnooutofsynccheck-1c5a3cc1706a)
- [setNoOverwrite(NoOverwriteScope)](#setnooverwrite-d43b0e931749)
- [setNoRevisionDrop()](#setnorevisiondrop-d1ccba36de11)
- [setReconcileAttachNonServiceConfig()](#setreconcileattachnonserviceconfig-f25b6fd49965)
- [setReconcileDetachNonServiceConfig()](#setreconciledetachnonserviceconfig-778050d72638)
- [setReconcileDiscardNonServiceConfig()](#setreconcilediscardnonserviceconfig-ff68aa80b12a)
- [setReconcileExcludePaths(ConfList)](#setreconcileexcludepaths-70d0435623d0)
- [setReconcileIncludePaths(ConfList)](#setreconcileincludepaths-3bec367b49f3)
- [setReconcileKeepNonServiceConfig()](#setreconcilekeepnonserviceconfig-6ad07f941bc3)
- [setTraceId(String)](#settraceid-72123789197d)
- [setUseLsa()](#setuselsa-15fd505b0cf9)
- [setWithServiceMetaData()](#setwithservicemetadata-9bd7b836b2dc)
- [toString()](#tostring-e9d48c5503ef)

**Nested Types**:

- [CommitQueueErrorOption](CommitParams/CommitQueueErrorOption.md#commitqueueerroroption-c09325b4a347)
- [ConfirmNetworkStateMode](CommitParams/ConfirmNetworkStateMode.md#confirmnetworkstatemode-f61ccbe3a7e4)
- [ConfirmNetworkStateScope](CommitParams/ConfirmNetworkStateScope.md#confirmnetworkstatescope-758c42054a3e)
- [DryRunOutformat](CommitParams/DryRunOutformat.md#dryrunoutformat-41adee760922)
- [NoOverwriteScope](CommitParams/NoOverwriteScope.md#nooverwritescope-b02f8090321d)

## Constructors

### CommitParams() <a href="#commitparams-96def6df85c7" id="commitparams-96def6df85c7"></a>

```java
public CommitParams()
```

### CommitParams(ConfResponse) <a href="#commitparams-ab508deab7fc" id="commitparams-ab508deab7fc"></a>

```java
public CommitParams(com.tailf.conf.ConfResponse result)
```

Types: [ConfResponse](../conf/ConfResponse.md#confresponse-fd02dad17b49)

**Parameters**

- `com.tailf.conf.ConfResponse result`


## Methods

### getComment() <a href="#getcomment-a5625f95afef" id="getcomment-a5625f95afef"></a>

```java
public String getComment()
```

Get the the comment for the transaction.

**Returns:** The comment.

### getCommitQueueErrorOption() <a href="#getcommitqueueerroroption-02d8e875c53a" id="getcommitqueueerroroption-02d8e875c53a"></a>

```java
public com.tailf.maapi.CommitParams.CommitQueueErrorOption getCommitQueueErrorOption()
```

Types: [CommitQueueErrorOption](CommitParams/CommitQueueErrorOption.md#commitqueueerroroption-c09325b4a347)

Get commit queue error option.

**Returns:** The error option or null if not set.

### getCommitQueueSyncTimeout() <a href="#getcommitqueuesynctimeout-e7de4f1d540d" id="getcommitqueuesynctimeout-e7de4f1d540d"></a>

```java
public Long getCommitQueueSyncTimeout()
```

Get commit queue synchronous mode of operation custom timeout.

**Returns:** The timeout in seconds. -1 means infinity. If no value has
         been set null is returned.

### getConfirmNetworkStateMode() <a href="#getconfirmnetworkstatemode-67298d410942" id="getconfirmnetworkstatemode-67298d410942"></a>

```java
public com.tailf.maapi.CommitParams.ConfirmNetworkStateMode getConfirmNetworkStateMode()
```

Types: [ConfirmNetworkStateMode](CommitParams/ConfirmNetworkStateMode.md#confirmnetworkstatemode-f61ccbe3a7e4)

Get the mode for the confirm-network-state check.

**Returns:** The confirm-network-state mode or null if not set.

### getConfirmNetworkStateScope() <a href="#getconfirmnetworkstatescope-8f24b882d00c" id="getconfirmnetworkstatescope-8f24b882d00c"></a>

```java
public com.tailf.maapi.CommitParams.ConfirmNetworkStateScope getConfirmNetworkStateScope()
```

Types: [ConfirmNetworkStateScope](CommitParams/ConfirmNetworkStateScope.md#confirmnetworkstatescope-758c42054a3e)

Get the confirm-network-state scope.

**Returns:** The confirm-network-state scope or null if not set.

### getConfXMLParam() <a href="#getconfxmlparam-2fc696e04b37" id="getconfxmlparam-2fc696e04b37"></a>

```java
public java.util.List<com.tailf.conf.ConfXMLParam> getConfXMLParam()
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7)

Get all commit parameters as a list of [`ConfXMLParam`](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7).

**Returns:** List of [`ConfXMLParam`](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7) representing the current
         commit parameters.

### getDryRunOutformat() <a href="#getdryrunoutformat-270c3885ad1f" id="getdryrunoutformat-270c3885ad1f"></a>

```java
public com.tailf.maapi.CommitParams.DryRunOutformat getDryRunOutformat()
```

Types: [DryRunOutformat](CommitParams/DryRunOutformat.md#dryrunoutformat-41adee760922)

Get the outformat to produce when committing with dry-run.

**Returns:** The outformat to produce or null if not set.

### getLabel() <a href="#getlabel-72bf899bf6f1" id="getlabel-72bf899bf6f1"></a>

```java
public String getLabel()
```

Get the the label for the transaction.

**Returns:** The label.

### getNoOverwriteScope() <a href="#getnooverwritescope-0834b5ba0444" id="getnooverwritescope-0834b5ba0444"></a>

```java
public com.tailf.maapi.CommitParams.NoOverwriteScope getNoOverwriteScope()
```

Types: [NoOverwriteScope](CommitParams/NoOverwriteScope.md#nooverwritescope-b02f8090321d)

Get the no-overwrite scope.

**Returns:** The no-overwrite scope or null if not set.

### getTraceId() <a href="#gettraceid-c3a30b94d9ce" id="gettraceid-c3a30b94d9ce"></a>

```java
public String getTraceId()
```

Get the the trace id for the transaction.

**Returns:** The trace id.

### isCommitQueueAsync() <a href="#iscommitqueueasync-98da07748ea8" id="iscommitqueueasync-98da07748ea8"></a>

```java
public boolean isCommitQueueAsync()
```

Get commit queue asynchronous mode of operation.

**Returns:** true if the mode of operation is asynchronous, false otherwise.

### isCommitQueueAtomic() <a href="#iscommitqueueatomic-eb0f74c72cd6" id="iscommitqueueatomic-eb0f74c72cd6"></a>

```java
public boolean isCommitQueueAtomic()
```

Check if the commit queue item is atomic.

**Returns:** true if it is atomic, false if it isn't.

### isCommitQueueBlockOthers() <a href="#iscommitqueueblockothers-7c78b894565c" id="iscommitqueueblockothers-7c78b894565c"></a>

```java
public boolean isCommitQueueBlockOthers()
```

Check if the the commit queue item block other commit queue items
 for these devices.

### isCommitQueueBypass() <a href="#iscommitqueuebypass-48cf7c2f499e" id="iscommitqueuebypass-48cf7c2f499e"></a>

```java
public boolean isCommitQueueBypass()
```

Check if the commit should bypass the commit queue, i.e. it is
 transactional even though commit queue is the default.

**Returns:** true if the commit queue should be bypassed, false otherwise.

### isCommitQueueLock() <a href="#iscommitqueuelock-453eb5b540db" id="iscommitqueuelock-453eb5b540db"></a>

```java
public boolean isCommitQueueLock()
```

Check if the commit queue item is locked.

**Returns:** true if it is locked, false otherwise.

### isCommitQueueNonAtomic() <a href="#iscommitqueuenonatomic-503d59982f24" id="iscommitqueuenonatomic-503d59982f24"></a>

```java
public boolean isCommitQueueNonAtomic()
```

Check if the commit queue item is non-atomic.

**Returns:** true if it is non-atomic, false if it isn't.

### isCommitQueueSync() <a href="#iscommitqueuesync-07c27c4d44dc" id="iscommitqueuesync-07c27c4d44dc"></a>

```java
public boolean isCommitQueueSync()
```

Get commit queue synchronous mode of operation.

**Returns:** true if the mode of operation is synchronous, false otherwise.

### isConfirmNetworkState() <a href="#isconfirmnetworkstate-72763326353b" id="isconfirmnetworkstate-72763326353b"></a>

```java
public boolean isConfirmNetworkState()
```

Should a check be done that the parts of the device configuration
 read and/or modified are up-to-date in CDB before pushing the
 configuration change to the device.

### isConfirmNetworkStateReDeployAll() <a href="#isconfirmnetworkstateredeployall-39f5a27bcc90" id="isconfirmnetworkstateredeployall-39f5a27bcc90"></a>

```java
public boolean isConfirmNetworkStateReDeployAll()
```

Re-deploy all services affected by discovered out-of-band data?

### isConfirmNetworkStateReEvaluatePolicies() <a href="#isconfirmnetworkstatereevaluatepolicies-04e8c08913bc" id="isconfirmnetworkstatereevaluatepolicies-04e8c08913bc"></a>

```java
public boolean isConfirmNetworkStateReEvaluatePolicies()
```

Is confirm-network-state with re-evaluate-policies enabled

**Deprecated:** Use `getConfirmNetworkStateMode()` instead.

### isDryRun() <a href="#isdryrun-c582ac0a71e9" id="isdryrun-c582ac0a71e9"></a>

```java
public boolean isDryRun()
```

Check if dry-run is enabled.

**Returns:** true if dry-run is enabled, false otherwise.

### isDryRunReverse() <a href="#isdryrunreverse-a65054993c74" id="isdryrunreverse-a65054993c74"></a>

```java
public boolean isDryRunReverse()
```

Check if the dry-run should produce a reverse diff.

**Returns:** true if the produced diff should be reverse,
         false otherwise.

### isNoDeploy() <a href="#isnodeploy-f061e1761bdb" id="isnodeploy-f061e1761bdb"></a>

```java
public boolean isNoDeploy()
```

Check if service's create method should be invoked or not.

**Returns:** true if it should be invoked, false otherwise.

### isNoLsa() <a href="#isnolsa-5849b6b97565" id="isnolsa-5849b6b97565"></a>

```java
public boolean isNoLsa()
```

Get no-lsa commit parameter.

**Returns:** true if set, false otherwise.

### isNoNetworking() <a href="#isnonetworking-e860996a0c6f" id="isnonetworking-e860996a0c6f"></a>

```java
public boolean isNoNetworking()
```

Check if the configuration should only be written to CDB, not
 actually pushed to the device.

**Returns:** true if the configuration should not be pused to the
         device, false otherwise.

### isNoOutOfSyncCheck() <a href="#isnooutofsynccheck-133ddf8b9fba" id="isnooutofsynccheck-133ddf8b9fba"></a>

```java
public boolean isNoOutOfSyncCheck()
```

### isNoOverwrite() <a href="#isnooverwrite-235918e79631" id="isnooverwrite-235918e79631"></a>

```java
public boolean isNoOverwrite()
```

Should a check be done that the parts of the device configuration
 to be modified are up-to-date in CDB before pushing the
 configuration change to the device.

### isNoRevisionDrop() <a href="#isnorevisiondrop-98b0095f3834" id="isnorevisiondrop-98b0095f3834"></a>

```java
public boolean isNoRevisionDrop()
```

Check if no-revision-drop commit parameter is set.

**Returns:** true if it is set, false otherwise.

### isReconcileAttachNonServiceConfig() <a href="#isreconcileattachnonserviceconfig-b1fbf7be4392" id="isreconcileattachnonserviceconfig-b1fbf7be4392"></a>

```java
public boolean isReconcileAttachNonServiceConfig()
```

Get reconcile commit parameter with attach-non-service-config option.

**Returns:** true if set, false otherwise.

### isReconcileDetachNonServiceConfig() <a href="#isreconciledetachnonserviceconfig-9477adadc93e" id="isreconciledetachnonserviceconfig-9477adadc93e"></a>

```java
public boolean isReconcileDetachNonServiceConfig()
```

Get reconcile commit parameter with detach-non-service-config option.

**Returns:** true if set, false otherwise.

### isReconcileDiscardNonServiceConfig() <a href="#isreconcilediscardnonserviceconfig-0f56a30c024a" id="isreconcilediscardnonserviceconfig-0f56a30c024a"></a>

```java
public boolean isReconcileDiscardNonServiceConfig()
```

Get reconcile commit parameter with discard-non-service-config option.

**Returns:** true if set, false otherwise.

### isReconcileKeepNonServiceConfig() <a href="#isreconcilekeepnonserviceconfig-e9f0db6c8627" id="isreconcilekeepnonserviceconfig-e9f0db6c8627"></a>

```java
public boolean isReconcileKeepNonServiceConfig()
```

Get reconcile commit parameter with keep-non-service-config option.

**Returns:** true if set false otherwise.

### isUseLsa() <a href="#isuselsa-571767b1c145" id="isuselsa-571767b1c145"></a>

```java
public boolean isUseLsa()
```

Get use-lsa commit parameter.

**Returns:** true if set, false otherwise.

### isWithServiceMetaData() <a href="#iswithservicemetadata-5e9f7f6e0491" id="iswithservicemetadata-5e9f7f6e0491"></a>

```java
public boolean isWithServiceMetaData()
```

Check if with-service-meta-data is enabled.

**Returns:** true if with-service-meta-data is enabled, false otherwise.

### setComment(String) <a href="#setcomment-2b177786255b" id="setcomment-2b177786255b"></a>

```java
public void setComment(String comment)
```

Set the comment for the transaction.

**Parameters**

- `String comment` - The comment to use for the transaction.

### setCommitQueueAsync() <a href="#setcommitqueueasync-03241e60c409" id="setcommitqueueasync-03241e60c409"></a>

```java
public void setCommitQueueAsync()
```

Set commit queue asynchronous mode of operation.

### setCommitQueueAtomic() <a href="#setcommitqueueatomic-f3f2726e061e" id="setcommitqueueatomic-f3f2726e061e"></a>

```java
public void setCommitQueueAtomic()
```

Make the commit queue item atomic.

### setCommitQueueBlockOthers() <a href="#setcommitqueueblockothers-9dde0dc0ee1f" id="setcommitqueueblockothers-9dde0dc0ee1f"></a>

```java
public void setCommitQueueBlockOthers()
```

Make the commit queue item block other commit queue items
 for these devices.

### setCommitQueueBypass() <a href="#setcommitqueuebypass-c774cb8682ea" id="setcommitqueuebypass-c774cb8682ea"></a>

```java
public void setCommitQueueBypass()
```

Make the commit transactional even if commit queue is default.

### setCommitQueueErrorOption(CommitQueueErrorOption) <a href="#setcommitqueueerroroption-266fa7d56552" id="setcommitqueueerroroption-266fa7d56552"></a>

```java
public void setCommitQueueErrorOption(
    com.tailf.maapi.CommitParams.CommitQueueErrorOption errorOption
)
```

Types: [CommitQueueErrorOption](CommitParams/CommitQueueErrorOption.md#commitqueueerroroption-c09325b4a347)

Set commit queue error option.

**Parameters**

- `com.tailf.maapi.CommitParams.CommitQueueErrorOption errorOption`

### setCommitQueueLock() <a href="#setcommitqueuelock-d174e0df574d" id="setcommitqueuelock-d174e0df574d"></a>

```java
public void setCommitQueueLock()
```

Make the commit queue item locked. Locked commit queue item needs to
 be unlocked before it can proceed.

### setCommitQueueNonAtomic() <a href="#setcommitqueuenonatomic-eadc7dda3443" id="setcommitqueuenonatomic-eadc7dda3443"></a>

```java
public void setCommitQueueNonAtomic()
```

Make the commit queue item non-atomic.

### setCommitQueueSync() <a href="#setcommitqueuesync-c765582ecb68" id="setcommitqueuesync-c765582ecb68"></a>

```java
public void setCommitQueueSync()
```

Set commit queue synchronous mode of operation.

### setCommitQueueSync(int) <a href="#setcommitqueuesync-673a650b4146" id="setcommitqueuesync-673a650b4146"></a>

```java
public void setCommitQueueSync(int timeout)
```

Set commit queue synchronous mode of operation with custom timeout.

**Parameters**

- `int timeout` - Timeout in seconds. -1 means infinity.

### setConfirmNetworkState() <a href="#setconfirmnetworkstate-26a5fc6bf2b0" id="setconfirmnetworkstate-26a5fc6bf2b0"></a>

```java
public void setConfirmNetworkState()
```

Check that the parts of the device configuration read and/or modified
 are up-to-date in CDB before pushing the configuration change to the
 device.

### setConfirmNetworkStateMode(ConfirmNetworkStateMode) <a href="#setconfirmnetworkstatemode-69df21e2c75f" id="setconfirmnetworkstatemode-69df21e2c75f"></a>

```java
public void setConfirmNetworkStateMode(com.tailf.maapi.CommitParams.ConfirmNetworkStateMode mode)
```

Types: [ConfirmNetworkStateMode](CommitParams/ConfirmNetworkStateMode.md#confirmnetworkstatemode-f61ccbe3a7e4)

Set the mode for the confirm-network-state check.

**Parameters**

- `com.tailf.maapi.CommitParams.ConfirmNetworkStateMode mode`

### setConfirmNetworkStateReDeployAll() <a href="#setconfirmnetworkstateredeployall-2bc934f37f67" id="setconfirmnetworkstateredeployall-2bc934f37f67"></a>

```java
public void setConfirmNetworkStateReDeployAll()
```

Re-deploy all services affected by discovered out-of-band data

### setConfirmNetworkStateReEvaluatePolicies() <a href="#setconfirmnetworkstatereevaluatepolicies-897562013182" id="setconfirmnetworkstatereevaluatepolicies-897562013182"></a>

```java
public void setConfirmNetworkStateReEvaluatePolicies()
```

Check that the parts of the device configuration read and/or modified
 are up-to-date in CDB before pushing the configuration change to the
 device and re-evaluate out-of-band policies of effected services.

**Deprecated:** Use [`ConfirmNetworkStateMode`](CommitParams/ConfirmNetworkStateMode.md#confirmnetworkstatemode-f61ccbe3a7e4) instead.

### setConfirmNetworkStateScope(ConfirmNetworkStateScope) <a href="#setconfirmnetworkstatescope-8d3822d01a41" id="setconfirmnetworkstatescope-8d3822d01a41"></a>

```java
public void setConfirmNetworkStateScope(com.tailf.maapi.CommitParams.ConfirmNetworkStateScope scope)
```

Types: [ConfirmNetworkStateScope](CommitParams/ConfirmNetworkStateScope.md#confirmnetworkstatescope-758c42054a3e)

Set the scope of the confirm-network-state check.

**Parameters**

- `com.tailf.maapi.CommitParams.ConfirmNetworkStateScope scope`

### setDryRunCli() <a href="#setdryruncli-28bc3e79c8ce" id="setdryruncli-28bc3e79c8ce"></a>

```java
public void setDryRunCli()
```

Commit with dry-run outformat CLI.

### setDryRunCliC() <a href="#setdryrunclic-69937517c73a" id="setdryrunclic-69937517c73a"></a>

```java
public void setDryRunCliC()
```

Commit with dry-run outformat cli-c.

### setDryRunCliCReverse() <a href="#setdryrunclicreverse-6ef373e77dc8" id="setdryrunclicreverse-6ef373e77dc8"></a>

```java
public void setDryRunCliCReverse()
```

Commit with dry-run outformat cli-c reverse.

### setDryRunNative() <a href="#setdryrunnative-dafde9d7289e" id="setdryrunnative-dafde9d7289e"></a>

```java
public void setDryRunNative()
```

Commit with dry-run outformat native.

### setDryRunNativeReverse() <a href="#setdryrunnativereverse-af395bd47158" id="setdryrunnativereverse-af395bd47158"></a>

```java
public void setDryRunNativeReverse()
```

Commit with dry-run outformat native reverse.

### setDryRunOutformat(DryRunOutformat) <a href="#setdryrunoutformat-10ffbb272a91" id="setdryrunoutformat-10ffbb272a91"></a>

```java
public void setDryRunOutformat(com.tailf.maapi.CommitParams.DryRunOutformat outformat)
```

Types: [DryRunOutformat](CommitParams/DryRunOutformat.md#dryrunoutformat-41adee760922)

Set the outformat to produce when committing with dry-run.

**Parameters**

- `com.tailf.maapi.CommitParams.DryRunOutformat outformat` - The outformat to produce.

### setDryRunReverse() <a href="#setdryrunreverse-b16c866c3984" id="setdryrunreverse-b16c866c3984"></a>

```java
public void setDryRunReverse()
```

Make dry-run produce a reverse diff.

### setDryRunXml() <a href="#setdryrunxml-26fdec13b168" id="setdryrunxml-26fdec13b168"></a>

```java
public void setDryRunXml()
```

Commit with dry-run outformat XML.

### setLabel(String) <a href="#setlabel-792770d84f9d" id="setlabel-792770d84f9d"></a>

```java
public void setLabel(String label)
```

Set the label for the transaction.

**Parameters**

- `String label` - The label to use for the transaction.

### setNoDeploy() <a href="#setnodeploy-d50f402dde27" id="setnodeploy-d50f402dde27"></a>

```java
public void setNoDeploy()
```

Do not invoke service's create method.

### setNoLsa() <a href="#setnolsa-05d26d1f9721" id="setnolsa-05d26d1f9721"></a>

```java
public void setNoLsa()
```

Set no-lsa commit parameter.

### setNoNetworking() <a href="#setnonetworking-cbf90b89dd62" id="setnonetworking-cbf90b89dd62"></a>

```java
public void setNoNetworking()
```

Only write the configuration to CDB, do not actually push it to the
 device.

### setNoOutOfSyncCheck() <a href="#setnooutofsynccheck-1c5a3cc1706a" id="setnooutofsynccheck-1c5a3cc1706a"></a>

```java
public void setNoOutOfSyncCheck()
```

Do not check device sync state before pushing the configuration change.

### setNoOverwrite(NoOverwriteScope) <a href="#setnooverwrite-d43b0e931749" id="setnooverwrite-d43b0e931749"></a>

```java
public void setNoOverwrite(com.tailf.maapi.CommitParams.NoOverwriteScope scope)
```

Types: [NoOverwriteScope](CommitParams/NoOverwriteScope.md#nooverwritescope-b02f8090321d)

Check that the parts of the device configuration to be modified are
 up-to-date in CDB before pushing the configuration change to the
 device.

**Parameters**

- `com.tailf.maapi.CommitParams.NoOverwriteScope scope`

### setNoRevisionDrop() <a href="#setnorevisiondrop-d1ccba36de11" id="setnorevisiondrop-d1ccba36de11"></a>

```java
public void setNoRevisionDrop()
```

Set no-revision-drop commit parameter.

### setReconcileAttachNonServiceConfig() <a href="#setreconcileattachnonserviceconfig-f25b6fd49965" id="setreconcileattachnonserviceconfig-f25b6fd49965"></a>

```java
public void setReconcileAttachNonServiceConfig()
```

Set reconcile commit parameter with attach-non-service-config option.

### setReconcileDetachNonServiceConfig() <a href="#setreconciledetachnonserviceconfig-778050d72638" id="setreconciledetachnonserviceconfig-778050d72638"></a>

```java
public void setReconcileDetachNonServiceConfig()
```

Set reconcile commit parameter with attach-non-service-config option.

### setReconcileDiscardNonServiceConfig() <a href="#setreconcilediscardnonserviceconfig-ff68aa80b12a" id="setreconcilediscardnonserviceconfig-ff68aa80b12a"></a>

```java
public void setReconcileDiscardNonServiceConfig()
```

Set reconcile commit parameter with discard-non-service-config option.

### setReconcileExcludePaths(ConfList) <a href="#setreconcileexcludepaths-70d0435623d0" id="setreconcileexcludepaths-70d0435623d0"></a>

```java
public void setReconcileExcludePaths(com.tailf.conf.ConfList paths)
```

Types: [ConfList](../conf/ConfList.md#conflist-a9c192ad3c99)

Set the paths to be excluded during reconcilation.

**Parameters**

- `com.tailf.conf.ConfList paths` - A list of object-identifiers

### setReconcileIncludePaths(ConfList) <a href="#setreconcileincludepaths-3bec367b49f3" id="setreconcileincludepaths-3bec367b49f3"></a>

```java
public void setReconcileIncludePaths(com.tailf.conf.ConfList paths)
```

Types: [ConfList](../conf/ConfList.md#conflist-a9c192ad3c99)

Set the paths to be included during reconcilation.

**Parameters**

- `com.tailf.conf.ConfList paths` - A list of object-identifiers

### setReconcileKeepNonServiceConfig() <a href="#setreconcilekeepnonserviceconfig-6ad07f941bc3" id="setreconcilekeepnonserviceconfig-6ad07f941bc3"></a>

```java
public void setReconcileKeepNonServiceConfig()
```

Set reconcile commit parameter with keep-non-service-config option.

### setTraceId(String) <a href="#settraceid-72123789197d" id="settraceid-72123789197d"></a>

```java
public void setTraceId(String traceId)
```

Set the trace id for the transaction.

**Parameters**

- `String traceId` - The trace id to use for the transaction.

### setUseLsa() <a href="#setuselsa-15fd505b0cf9" id="setuselsa-15fd505b0cf9"></a>

```java
public void setUseLsa()
```

Set use-lsa commit parameter.

### setWithServiceMetaData() <a href="#setwithservicemetadata-9bd7b836b2dc" id="setwithservicemetadata-9bd7b836b2dc"></a>

```java
public void setWithServiceMetaData()
```

Set with-service-meta-data commit parameter.

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```


## Nested Types

- [CommitQueueErrorOption](CommitParams/CommitQueueErrorOption.md#commitqueueerroroption-c09325b4a347)
- [ConfirmNetworkStateMode](CommitParams/ConfirmNetworkStateMode.md#confirmnetworkstatemode-f61ccbe3a7e4)
- [ConfirmNetworkStateScope](CommitParams/ConfirmNetworkStateScope.md#confirmnetworkstatescope-758c42054a3e)
- [DryRunOutformat](CommitParams/DryRunOutformat.md#dryrunoutformat-41adee760922)
- [NoOverwriteScope](CommitParams/NoOverwriteScope.md#nooverwritescope-b02f8090321d)
