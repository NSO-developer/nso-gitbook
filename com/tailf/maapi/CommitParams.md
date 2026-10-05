# CommitParams <a href="#cls-CommitParams" id="cls-CommitParams"></a>

```java
public class com.tailf.maapi.CommitParams
```

## Members

**Constructors**:

- [CommitParams()](#m-CommitParams-96def6df85c7)
- [CommitParams(ConfResponse)](#m-CommitParams-ab508deab7fc)

**Methods**:

- [getComment()](#m-getComment-a5625f95afef)
- [getCommitQueueErrorOption()](#m-getCommitQueueErrorOption-02d8e875c53a)
- [getCommitQueueSyncTimeout()](#m-getCommitQueueSyncTimeout-e7de4f1d540d)
- [getConfirmNetworkStateMode()](#m-getConfirmNetworkStateMode-67298d410942)
- [getConfirmNetworkStateScope()](#m-getConfirmNetworkStateScope-8f24b882d00c)
- [getConfXMLParam()](#m-getConfXMLParam-2fc696e04b37)
- [getDryRunOutformat()](#m-getDryRunOutformat-270c3885ad1f)
- [getLabel()](#m-getLabel-72bf899bf6f1)
- [getNoOverwriteScope()](#m-getNoOverwriteScope-0834b5ba0444)
- [getTraceId()](#m-getTraceId-c3a30b94d9ce)
- [isCommitQueueAsync()](#m-isCommitQueueAsync-98da07748ea8)
- [isCommitQueueAtomic()](#m-isCommitQueueAtomic-eb0f74c72cd6)
- [isCommitQueueBlockOthers()](#m-isCommitQueueBlockOthers-7c78b894565c)
- [isCommitQueueBypass()](#m-isCommitQueueBypass-48cf7c2f499e)
- [isCommitQueueLock()](#m-isCommitQueueLock-453eb5b540db)
- [isCommitQueueNonAtomic()](#m-isCommitQueueNonAtomic-503d59982f24)
- [isCommitQueueSync()](#m-isCommitQueueSync-07c27c4d44dc)
- [isConfirmNetworkState()](#m-isConfirmNetworkState-72763326353b)
- [isConfirmNetworkStateReDeployAll()](#m-isConfirmNetworkStateReDeployAll-39f5a27bcc90)
- [isConfirmNetworkStateReEvaluatePolicies()](#m-isConfirmNetworkStateReEvaluatePolicies-04e8c08913bc)
- [isDryRun()](#m-isDryRun-c582ac0a71e9)
- [isDryRunReverse()](#m-isDryRunReverse-a65054993c74)
- [isNoDeploy()](#m-isNoDeploy-f061e1761bdb)
- [isNoLsa()](#m-isNoLsa-5849b6b97565)
- [isNoNetworking()](#m-isNoNetworking-e860996a0c6f)
- [isNoOutOfSyncCheck()](#m-isNoOutOfSyncCheck-133ddf8b9fba)
- [isNoOverwrite()](#m-isNoOverwrite-235918e79631)
- [isNoRevisionDrop()](#m-isNoRevisionDrop-98b0095f3834)
- [isReconcileAttachNonServiceConfig()](#m-isReconcileAttachNonServiceConfig-b1fbf7be4392)
- [isReconcileDetachNonServiceConfig()](#m-isReconcileDetachNonServiceConfig-9477adadc93e)
- [isReconcileDiscardNonServiceConfig()](#m-isReconcileDiscardNonServiceConfig-0f56a30c024a)
- [isReconcileKeepNonServiceConfig()](#m-isReconcileKeepNonServiceConfig-e9f0db6c8627)
- [isUseLsa()](#m-isUseLsa-571767b1c145)
- [isWithServiceMetaData()](#m-isWithServiceMetaData-5e9f7f6e0491)
- [setComment(String)](#m-setComment-2b177786255b)
- [setCommitQueueAsync()](#m-setCommitQueueAsync-03241e60c409)
- [setCommitQueueAtomic()](#m-setCommitQueueAtomic-f3f2726e061e)
- [setCommitQueueBlockOthers()](#m-setCommitQueueBlockOthers-9dde0dc0ee1f)
- [setCommitQueueBypass()](#m-setCommitQueueBypass-c774cb8682ea)
- [setCommitQueueErrorOption(CommitQueueErrorOption)](#m-setCommitQueueErrorOption-266fa7d56552)
- [setCommitQueueLock()](#m-setCommitQueueLock-d174e0df574d)
- [setCommitQueueNonAtomic()](#m-setCommitQueueNonAtomic-eadc7dda3443)
- [setCommitQueueSync()](#m-setCommitQueueSync-c765582ecb68)
- [setCommitQueueSync(int)](#m-setCommitQueueSync-673a650b4146)
- [setConfirmNetworkState()](#m-setConfirmNetworkState-26a5fc6bf2b0)
- [setConfirmNetworkStateMode(ConfirmNetworkStateMode)](#m-setConfirmNetworkStateMode-69df21e2c75f)
- [setConfirmNetworkStateReDeployAll()](#m-setConfirmNetworkStateReDeployAll-2bc934f37f67)
- [setConfirmNetworkStateReEvaluatePolicies()](#m-setConfirmNetworkStateReEvaluatePolicies-897562013182)
- [setConfirmNetworkStateScope(ConfirmNetworkStateScope)](#m-setConfirmNetworkStateScope-8d3822d01a41)
- [setDryRunCli()](#m-setDryRunCli-28bc3e79c8ce)
- [setDryRunCliC()](#m-setDryRunCliC-69937517c73a)
- [setDryRunCliCReverse()](#m-setDryRunCliCReverse-6ef373e77dc8)
- [setDryRunNative()](#m-setDryRunNative-dafde9d7289e)
- [setDryRunNativeReverse()](#m-setDryRunNativeReverse-af395bd47158)
- [setDryRunOutformat(DryRunOutformat)](#m-setDryRunOutformat-10ffbb272a91)
- [setDryRunReverse()](#m-setDryRunReverse-b16c866c3984)
- [setDryRunXml()](#m-setDryRunXml-26fdec13b168)
- [setLabel(String)](#m-setLabel-792770d84f9d)
- [setNoDeploy()](#m-setNoDeploy-d50f402dde27)
- [setNoLsa()](#m-setNoLsa-05d26d1f9721)
- [setNoNetworking()](#m-setNoNetworking-cbf90b89dd62)
- [setNoOutOfSyncCheck()](#m-setNoOutOfSyncCheck-1c5a3cc1706a)
- [setNoOverwrite(NoOverwriteScope)](#m-setNoOverwrite-d43b0e931749)
- [setNoRevisionDrop()](#m-setNoRevisionDrop-d1ccba36de11)
- [setReconcileAttachNonServiceConfig()](#m-setReconcileAttachNonServiceConfig-f25b6fd49965)
- [setReconcileDetachNonServiceConfig()](#m-setReconcileDetachNonServiceConfig-778050d72638)
- [setReconcileDiscardNonServiceConfig()](#m-setReconcileDiscardNonServiceConfig-ff68aa80b12a)
- [setReconcileExcludePaths(ConfList)](#m-setReconcileExcludePaths-70d0435623d0)
- [setReconcileIncludePaths(ConfList)](#m-setReconcileIncludePaths-3bec367b49f3)
- [setReconcileKeepNonServiceConfig()](#m-setReconcileKeepNonServiceConfig-6ad07f941bc3)
- [setTraceId(String)](#m-setTraceId-72123789197d)
- [setUseLsa()](#m-setUseLsa-15fd505b0cf9)
- [setWithServiceMetaData()](#m-setWithServiceMetaData-9bd7b836b2dc)
- [toString()](#m-toString-e9d48c5503ef)

**Nested Types**:

- [CommitQueueErrorOption](CommitParams/CommitQueueErrorOption.md#cls-CommitQueueErrorOption)
- [ConfirmNetworkStateMode](CommitParams/ConfirmNetworkStateMode.md#cls-ConfirmNetworkStateMode)
- [ConfirmNetworkStateScope](CommitParams/ConfirmNetworkStateScope.md#cls-ConfirmNetworkStateScope)
- [DryRunOutformat](CommitParams/DryRunOutformat.md#cls-DryRunOutformat)
- [NoOverwriteScope](CommitParams/NoOverwriteScope.md#cls-NoOverwriteScope)

## Constructors

### CommitParams() <a href="#m-CommitParams-96def6df85c7" id="m-CommitParams-96def6df85c7"></a>

```java
public CommitParams()
```

### CommitParams(ConfResponse) <a href="#m-CommitParams-ab508deab7fc" id="m-CommitParams-ab508deab7fc"></a>

```java
public CommitParams(com.tailf.conf.ConfResponse result)
```

Types: [ConfResponse](../conf/ConfResponse.md#cls-ConfResponse)

**Parameters**

- `com.tailf.conf.ConfResponse result`


## Methods

### getComment() <a href="#m-getComment-a5625f95afef" id="m-getComment-a5625f95afef"></a>

```java
public String getComment()
```

Get the the comment for the transaction.

**Returns:** The comment.

### getCommitQueueErrorOption() <a href="#m-getCommitQueueErrorOption-02d8e875c53a" id="m-getCommitQueueErrorOption-02d8e875c53a"></a>

```java
public com.tailf.maapi.CommitParams.CommitQueueErrorOption getCommitQueueErrorOption()
```

Types: [CommitQueueErrorOption](CommitParams/CommitQueueErrorOption.md#cls-CommitQueueErrorOption)

Get commit queue error option.

**Returns:** The error option or null if not set.

### getCommitQueueSyncTimeout() <a href="#m-getCommitQueueSyncTimeout-e7de4f1d540d" id="m-getCommitQueueSyncTimeout-e7de4f1d540d"></a>

```java
public Long getCommitQueueSyncTimeout()
```

Get commit queue synchronous mode of operation custom timeout.

**Returns:** The timeout in seconds. -1 means infinity. If no value has
         been set null is returned.

### getConfirmNetworkStateMode() <a href="#m-getConfirmNetworkStateMode-67298d410942" id="m-getConfirmNetworkStateMode-67298d410942"></a>

```java
public com.tailf.maapi.CommitParams.ConfirmNetworkStateMode getConfirmNetworkStateMode()
```

Types: [ConfirmNetworkStateMode](CommitParams/ConfirmNetworkStateMode.md#cls-ConfirmNetworkStateMode)

Get the mode for the confirm-network-state check.

**Returns:** The confirm-network-state mode or null if not set.

### getConfirmNetworkStateScope() <a href="#m-getConfirmNetworkStateScope-8f24b882d00c" id="m-getConfirmNetworkStateScope-8f24b882d00c"></a>

```java
public com.tailf.maapi.CommitParams.ConfirmNetworkStateScope getConfirmNetworkStateScope()
```

Types: [ConfirmNetworkStateScope](CommitParams/ConfirmNetworkStateScope.md#cls-ConfirmNetworkStateScope)

Get the confirm-network-state scope.

**Returns:** The confirm-network-state scope or null if not set.

### getConfXMLParam() <a href="#m-getConfXMLParam-2fc696e04b37" id="m-getConfXMLParam-2fc696e04b37"></a>

```java
public java.util.List<com.tailf.conf.ConfXMLParam> getConfXMLParam()
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam)

Get all commit parameters as a list of [`ConfXMLParam`](../conf/ConfXMLParam.md#cls-ConfXMLParam).

**Returns:** List of [`ConfXMLParam`](../conf/ConfXMLParam.md#cls-ConfXMLParam) representing the current
         commit parameters.

### getDryRunOutformat() <a href="#m-getDryRunOutformat-270c3885ad1f" id="m-getDryRunOutformat-270c3885ad1f"></a>

```java
public com.tailf.maapi.CommitParams.DryRunOutformat getDryRunOutformat()
```

Types: [DryRunOutformat](CommitParams/DryRunOutformat.md#cls-DryRunOutformat)

Get the outformat to produce when committing with dry-run.

**Returns:** The outformat to produce or null if not set.

### getLabel() <a href="#m-getLabel-72bf899bf6f1" id="m-getLabel-72bf899bf6f1"></a>

```java
public String getLabel()
```

Get the the label for the transaction.

**Returns:** The label.

### getNoOverwriteScope() <a href="#m-getNoOverwriteScope-0834b5ba0444" id="m-getNoOverwriteScope-0834b5ba0444"></a>

```java
public com.tailf.maapi.CommitParams.NoOverwriteScope getNoOverwriteScope()
```

Types: [NoOverwriteScope](CommitParams/NoOverwriteScope.md#cls-NoOverwriteScope)

Get the no-overwrite scope.

**Returns:** The no-overwrite scope or null if not set.

### getTraceId() <a href="#m-getTraceId-c3a30b94d9ce" id="m-getTraceId-c3a30b94d9ce"></a>

```java
public String getTraceId()
```

Get the the trace id for the transaction.

**Returns:** The trace id.

### isCommitQueueAsync() <a href="#m-isCommitQueueAsync-98da07748ea8" id="m-isCommitQueueAsync-98da07748ea8"></a>

```java
public boolean isCommitQueueAsync()
```

Get commit queue asynchronous mode of operation.

**Returns:** true if the mode of operation is asynchronous, false otherwise.

### isCommitQueueAtomic() <a href="#m-isCommitQueueAtomic-eb0f74c72cd6" id="m-isCommitQueueAtomic-eb0f74c72cd6"></a>

```java
public boolean isCommitQueueAtomic()
```

Check if the commit queue item is atomic.

**Returns:** true if it is atomic, false if it isn't.

### isCommitQueueBlockOthers() <a href="#m-isCommitQueueBlockOthers-7c78b894565c" id="m-isCommitQueueBlockOthers-7c78b894565c"></a>

```java
public boolean isCommitQueueBlockOthers()
```

Check if the the commit queue item block other commit queue items
 for these devices.

### isCommitQueueBypass() <a href="#m-isCommitQueueBypass-48cf7c2f499e" id="m-isCommitQueueBypass-48cf7c2f499e"></a>

```java
public boolean isCommitQueueBypass()
```

Check if the commit should bypass the commit queue, i.e. it is
 transactional even though commit queue is the default.

**Returns:** true if the commit queue should be bypassed, false otherwise.

### isCommitQueueLock() <a href="#m-isCommitQueueLock-453eb5b540db" id="m-isCommitQueueLock-453eb5b540db"></a>

```java
public boolean isCommitQueueLock()
```

Check if the commit queue item is locked.

**Returns:** true if it is locked, false otherwise.

### isCommitQueueNonAtomic() <a href="#m-isCommitQueueNonAtomic-503d59982f24" id="m-isCommitQueueNonAtomic-503d59982f24"></a>

```java
public boolean isCommitQueueNonAtomic()
```

Check if the commit queue item is non-atomic.

**Returns:** true if it is non-atomic, false if it isn't.

### isCommitQueueSync() <a href="#m-isCommitQueueSync-07c27c4d44dc" id="m-isCommitQueueSync-07c27c4d44dc"></a>

```java
public boolean isCommitQueueSync()
```

Get commit queue synchronous mode of operation.

**Returns:** true if the mode of operation is synchronous, false otherwise.

### isConfirmNetworkState() <a href="#m-isConfirmNetworkState-72763326353b" id="m-isConfirmNetworkState-72763326353b"></a>

```java
public boolean isConfirmNetworkState()
```

Should a check be done that the parts of the device configuration
 read and/or modified are up-to-date in CDB before pushing the
 configuration change to the device.

### isConfirmNetworkStateReDeployAll() <a href="#m-isConfirmNetworkStateReDeployAll-39f5a27bcc90" id="m-isConfirmNetworkStateReDeployAll-39f5a27bcc90"></a>

```java
public boolean isConfirmNetworkStateReDeployAll()
```

Re-deploy all services affected by discovered out-of-band data?

### isConfirmNetworkStateReEvaluatePolicies() <a href="#m-isConfirmNetworkStateReEvaluatePolicies-04e8c08913bc" id="m-isConfirmNetworkStateReEvaluatePolicies-04e8c08913bc"></a>

```java
public boolean isConfirmNetworkStateReEvaluatePolicies()
```

Is confirm-network-state with re-evaluate-policies enabled

**Deprecated:** Use `getConfirmNetworkStateMode()` instead.

### isDryRun() <a href="#m-isDryRun-c582ac0a71e9" id="m-isDryRun-c582ac0a71e9"></a>

```java
public boolean isDryRun()
```

Check if dry-run is enabled.

**Returns:** true if dry-run is enabled, false otherwise.

### isDryRunReverse() <a href="#m-isDryRunReverse-a65054993c74" id="m-isDryRunReverse-a65054993c74"></a>

```java
public boolean isDryRunReverse()
```

Check if the dry-run should produce a reverse diff.

**Returns:** true if the produced diff should be reverse,
         false otherwise.

### isNoDeploy() <a href="#m-isNoDeploy-f061e1761bdb" id="m-isNoDeploy-f061e1761bdb"></a>

```java
public boolean isNoDeploy()
```

Check if service's create method should be invoked or not.

**Returns:** true if it should be invoked, false otherwise.

### isNoLsa() <a href="#m-isNoLsa-5849b6b97565" id="m-isNoLsa-5849b6b97565"></a>

```java
public boolean isNoLsa()
```

Get no-lsa commit parameter.

**Returns:** true if set, false otherwise.

### isNoNetworking() <a href="#m-isNoNetworking-e860996a0c6f" id="m-isNoNetworking-e860996a0c6f"></a>

```java
public boolean isNoNetworking()
```

Check if the configuration should only be written to CDB, not
 actually pushed to the device.

**Returns:** true if the configuration should not be pused to the
         device, false otherwise.

### isNoOutOfSyncCheck() <a href="#m-isNoOutOfSyncCheck-133ddf8b9fba" id="m-isNoOutOfSyncCheck-133ddf8b9fba"></a>

```java
public boolean isNoOutOfSyncCheck()
```

### isNoOverwrite() <a href="#m-isNoOverwrite-235918e79631" id="m-isNoOverwrite-235918e79631"></a>

```java
public boolean isNoOverwrite()
```

Should a check be done that the parts of the device configuration
 to be modified are up-to-date in CDB before pushing the
 configuration change to the device.

### isNoRevisionDrop() <a href="#m-isNoRevisionDrop-98b0095f3834" id="m-isNoRevisionDrop-98b0095f3834"></a>

```java
public boolean isNoRevisionDrop()
```

Check if no-revision-drop commit parameter is set.

**Returns:** true if it is set, false otherwise.

### isReconcileAttachNonServiceConfig() <a href="#m-isReconcileAttachNonServiceConfig-b1fbf7be4392" id="m-isReconcileAttachNonServiceConfig-b1fbf7be4392"></a>

```java
public boolean isReconcileAttachNonServiceConfig()
```

Get reconcile commit parameter with attach-non-service-config option.

**Returns:** true if set, false otherwise.

### isReconcileDetachNonServiceConfig() <a href="#m-isReconcileDetachNonServiceConfig-9477adadc93e" id="m-isReconcileDetachNonServiceConfig-9477adadc93e"></a>

```java
public boolean isReconcileDetachNonServiceConfig()
```

Get reconcile commit parameter with detach-non-service-config option.

**Returns:** true if set, false otherwise.

### isReconcileDiscardNonServiceConfig() <a href="#m-isReconcileDiscardNonServiceConfig-0f56a30c024a" id="m-isReconcileDiscardNonServiceConfig-0f56a30c024a"></a>

```java
public boolean isReconcileDiscardNonServiceConfig()
```

Get reconcile commit parameter with discard-non-service-config option.

**Returns:** true if set, false otherwise.

### isReconcileKeepNonServiceConfig() <a href="#m-isReconcileKeepNonServiceConfig-e9f0db6c8627" id="m-isReconcileKeepNonServiceConfig-e9f0db6c8627"></a>

```java
public boolean isReconcileKeepNonServiceConfig()
```

Get reconcile commit parameter with keep-non-service-config option.

**Returns:** true if set false otherwise.

### isUseLsa() <a href="#m-isUseLsa-571767b1c145" id="m-isUseLsa-571767b1c145"></a>

```java
public boolean isUseLsa()
```

Get use-lsa commit parameter.

**Returns:** true if set, false otherwise.

### isWithServiceMetaData() <a href="#m-isWithServiceMetaData-5e9f7f6e0491" id="m-isWithServiceMetaData-5e9f7f6e0491"></a>

```java
public boolean isWithServiceMetaData()
```

Check if with-service-meta-data is enabled.

**Returns:** true if with-service-meta-data is enabled, false otherwise.

### setComment(String) <a href="#m-setComment-2b177786255b" id="m-setComment-2b177786255b"></a>

```java
public void setComment(String comment)
```

Set the comment for the transaction.

**Parameters**

- `String comment` - The comment to use for the transaction.

### setCommitQueueAsync() <a href="#m-setCommitQueueAsync-03241e60c409" id="m-setCommitQueueAsync-03241e60c409"></a>

```java
public void setCommitQueueAsync()
```

Set commit queue asynchronous mode of operation.

### setCommitQueueAtomic() <a href="#m-setCommitQueueAtomic-f3f2726e061e" id="m-setCommitQueueAtomic-f3f2726e061e"></a>

```java
public void setCommitQueueAtomic()
```

Make the commit queue item atomic.

### setCommitQueueBlockOthers() <a href="#m-setCommitQueueBlockOthers-9dde0dc0ee1f" id="m-setCommitQueueBlockOthers-9dde0dc0ee1f"></a>

```java
public void setCommitQueueBlockOthers()
```

Make the commit queue item block other commit queue items
 for these devices.

### setCommitQueueBypass() <a href="#m-setCommitQueueBypass-c774cb8682ea" id="m-setCommitQueueBypass-c774cb8682ea"></a>

```java
public void setCommitQueueBypass()
```

Make the commit transactional even if commit queue is default.

### setCommitQueueErrorOption(CommitQueueErrorOption) <a href="#m-setCommitQueueErrorOption-266fa7d56552" id="m-setCommitQueueErrorOption-266fa7d56552"></a>

```java
public void setCommitQueueErrorOption(
    com.tailf.maapi.CommitParams.CommitQueueErrorOption errorOption
)
```

Types: [CommitQueueErrorOption](CommitParams/CommitQueueErrorOption.md#cls-CommitQueueErrorOption)

Set commit queue error option.

**Parameters**

- `com.tailf.maapi.CommitParams.CommitQueueErrorOption errorOption`

### setCommitQueueLock() <a href="#m-setCommitQueueLock-d174e0df574d" id="m-setCommitQueueLock-d174e0df574d"></a>

```java
public void setCommitQueueLock()
```

Make the commit queue item locked. Locked commit queue item needs to
 be unlocked before it can proceed.

### setCommitQueueNonAtomic() <a href="#m-setCommitQueueNonAtomic-eadc7dda3443" id="m-setCommitQueueNonAtomic-eadc7dda3443"></a>

```java
public void setCommitQueueNonAtomic()
```

Make the commit queue item non-atomic.

### setCommitQueueSync() <a href="#m-setCommitQueueSync-c765582ecb68" id="m-setCommitQueueSync-c765582ecb68"></a>

```java
public void setCommitQueueSync()
```

Set commit queue synchronous mode of operation.

### setCommitQueueSync(int) <a href="#m-setCommitQueueSync-673a650b4146" id="m-setCommitQueueSync-673a650b4146"></a>

```java
public void setCommitQueueSync(int timeout)
```

Set commit queue synchronous mode of operation with custom timeout.

**Parameters**

- `int timeout` - Timeout in seconds. -1 means infinity.

### setConfirmNetworkState() <a href="#m-setConfirmNetworkState-26a5fc6bf2b0" id="m-setConfirmNetworkState-26a5fc6bf2b0"></a>

```java
public void setConfirmNetworkState()
```

Check that the parts of the device configuration read and/or modified
 are up-to-date in CDB before pushing the configuration change to the
 device.

### setConfirmNetworkStateMode(ConfirmNetworkStateMode) <a href="#m-setConfirmNetworkStateMode-69df21e2c75f" id="m-setConfirmNetworkStateMode-69df21e2c75f"></a>

```java
public void setConfirmNetworkStateMode(com.tailf.maapi.CommitParams.ConfirmNetworkStateMode mode)
```

Types: [ConfirmNetworkStateMode](CommitParams/ConfirmNetworkStateMode.md#cls-ConfirmNetworkStateMode)

Set the mode for the confirm-network-state check.

**Parameters**

- `com.tailf.maapi.CommitParams.ConfirmNetworkStateMode mode`

### setConfirmNetworkStateReDeployAll() <a href="#m-setConfirmNetworkStateReDeployAll-2bc934f37f67" id="m-setConfirmNetworkStateReDeployAll-2bc934f37f67"></a>

```java
public void setConfirmNetworkStateReDeployAll()
```

Re-deploy all services affected by discovered out-of-band data

### setConfirmNetworkStateReEvaluatePolicies() <a href="#m-setConfirmNetworkStateReEvaluatePolicies-897562013182" id="m-setConfirmNetworkStateReEvaluatePolicies-897562013182"></a>

```java
public void setConfirmNetworkStateReEvaluatePolicies()
```

Check that the parts of the device configuration read and/or modified
 are up-to-date in CDB before pushing the configuration change to the
 device and re-evaluate out-of-band policies of effected services.

**Deprecated:** Use [`ConfirmNetworkStateMode`](CommitParams/ConfirmNetworkStateMode.md#cls-ConfirmNetworkStateMode) instead.

### setConfirmNetworkStateScope(ConfirmNetworkStateScope) <a href="#m-setConfirmNetworkStateScope-8d3822d01a41" id="m-setConfirmNetworkStateScope-8d3822d01a41"></a>

```java
public void setConfirmNetworkStateScope(com.tailf.maapi.CommitParams.ConfirmNetworkStateScope scope)
```

Types: [ConfirmNetworkStateScope](CommitParams/ConfirmNetworkStateScope.md#cls-ConfirmNetworkStateScope)

Set the scope of the confirm-network-state check.

**Parameters**

- `com.tailf.maapi.CommitParams.ConfirmNetworkStateScope scope`

### setDryRunCli() <a href="#m-setDryRunCli-28bc3e79c8ce" id="m-setDryRunCli-28bc3e79c8ce"></a>

```java
public void setDryRunCli()
```

Commit with dry-run outformat CLI.

### setDryRunCliC() <a href="#m-setDryRunCliC-69937517c73a" id="m-setDryRunCliC-69937517c73a"></a>

```java
public void setDryRunCliC()
```

Commit with dry-run outformat cli-c.

### setDryRunCliCReverse() <a href="#m-setDryRunCliCReverse-6ef373e77dc8" id="m-setDryRunCliCReverse-6ef373e77dc8"></a>

```java
public void setDryRunCliCReverse()
```

Commit with dry-run outformat cli-c reverse.

### setDryRunNative() <a href="#m-setDryRunNative-dafde9d7289e" id="m-setDryRunNative-dafde9d7289e"></a>

```java
public void setDryRunNative()
```

Commit with dry-run outformat native.

### setDryRunNativeReverse() <a href="#m-setDryRunNativeReverse-af395bd47158" id="m-setDryRunNativeReverse-af395bd47158"></a>

```java
public void setDryRunNativeReverse()
```

Commit with dry-run outformat native reverse.

### setDryRunOutformat(DryRunOutformat) <a href="#m-setDryRunOutformat-10ffbb272a91" id="m-setDryRunOutformat-10ffbb272a91"></a>

```java
public void setDryRunOutformat(com.tailf.maapi.CommitParams.DryRunOutformat outformat)
```

Types: [DryRunOutformat](CommitParams/DryRunOutformat.md#cls-DryRunOutformat)

Set the outformat to produce when committing with dry-run.

**Parameters**

- `com.tailf.maapi.CommitParams.DryRunOutformat outformat` - The outformat to produce.

### setDryRunReverse() <a href="#m-setDryRunReverse-b16c866c3984" id="m-setDryRunReverse-b16c866c3984"></a>

```java
public void setDryRunReverse()
```

Make dry-run produce a reverse diff.

### setDryRunXml() <a href="#m-setDryRunXml-26fdec13b168" id="m-setDryRunXml-26fdec13b168"></a>

```java
public void setDryRunXml()
```

Commit with dry-run outformat XML.

### setLabel(String) <a href="#m-setLabel-792770d84f9d" id="m-setLabel-792770d84f9d"></a>

```java
public void setLabel(String label)
```

Set the label for the transaction.

**Parameters**

- `String label` - The label to use for the transaction.

### setNoDeploy() <a href="#m-setNoDeploy-d50f402dde27" id="m-setNoDeploy-d50f402dde27"></a>

```java
public void setNoDeploy()
```

Do not invoke service's create method.

### setNoLsa() <a href="#m-setNoLsa-05d26d1f9721" id="m-setNoLsa-05d26d1f9721"></a>

```java
public void setNoLsa()
```

Set no-lsa commit parameter.

### setNoNetworking() <a href="#m-setNoNetworking-cbf90b89dd62" id="m-setNoNetworking-cbf90b89dd62"></a>

```java
public void setNoNetworking()
```

Only write the configuration to CDB, do not actually push it to the
 device.

### setNoOutOfSyncCheck() <a href="#m-setNoOutOfSyncCheck-1c5a3cc1706a" id="m-setNoOutOfSyncCheck-1c5a3cc1706a"></a>

```java
public void setNoOutOfSyncCheck()
```

Do not check device sync state before pushing the configuration change.

### setNoOverwrite(NoOverwriteScope) <a href="#m-setNoOverwrite-d43b0e931749" id="m-setNoOverwrite-d43b0e931749"></a>

```java
public void setNoOverwrite(com.tailf.maapi.CommitParams.NoOverwriteScope scope)
```

Types: [NoOverwriteScope](CommitParams/NoOverwriteScope.md#cls-NoOverwriteScope)

Check that the parts of the device configuration to be modified are
 up-to-date in CDB before pushing the configuration change to the
 device.

**Parameters**

- `com.tailf.maapi.CommitParams.NoOverwriteScope scope`

### setNoRevisionDrop() <a href="#m-setNoRevisionDrop-d1ccba36de11" id="m-setNoRevisionDrop-d1ccba36de11"></a>

```java
public void setNoRevisionDrop()
```

Set no-revision-drop commit parameter.

### setReconcileAttachNonServiceConfig() <a href="#m-setReconcileAttachNonServiceConfig-f25b6fd49965" id="m-setReconcileAttachNonServiceConfig-f25b6fd49965"></a>

```java
public void setReconcileAttachNonServiceConfig()
```

Set reconcile commit parameter with attach-non-service-config option.

### setReconcileDetachNonServiceConfig() <a href="#m-setReconcileDetachNonServiceConfig-778050d72638" id="m-setReconcileDetachNonServiceConfig-778050d72638"></a>

```java
public void setReconcileDetachNonServiceConfig()
```

Set reconcile commit parameter with attach-non-service-config option.

### setReconcileDiscardNonServiceConfig() <a href="#m-setReconcileDiscardNonServiceConfig-ff68aa80b12a" id="m-setReconcileDiscardNonServiceConfig-ff68aa80b12a"></a>

```java
public void setReconcileDiscardNonServiceConfig()
```

Set reconcile commit parameter with discard-non-service-config option.

### setReconcileExcludePaths(ConfList) <a href="#m-setReconcileExcludePaths-70d0435623d0" id="m-setReconcileExcludePaths-70d0435623d0"></a>

```java
public void setReconcileExcludePaths(com.tailf.conf.ConfList paths)
```

Types: [ConfList](../conf/ConfList.md#cls-ConfList)

Set the paths to be excluded during reconcilation.

**Parameters**

- `com.tailf.conf.ConfList paths` - A list of object-identifiers

### setReconcileIncludePaths(ConfList) <a href="#m-setReconcileIncludePaths-3bec367b49f3" id="m-setReconcileIncludePaths-3bec367b49f3"></a>

```java
public void setReconcileIncludePaths(com.tailf.conf.ConfList paths)
```

Types: [ConfList](../conf/ConfList.md#cls-ConfList)

Set the paths to be included during reconcilation.

**Parameters**

- `com.tailf.conf.ConfList paths` - A list of object-identifiers

### setReconcileKeepNonServiceConfig() <a href="#m-setReconcileKeepNonServiceConfig-6ad07f941bc3" id="m-setReconcileKeepNonServiceConfig-6ad07f941bc3"></a>

```java
public void setReconcileKeepNonServiceConfig()
```

Set reconcile commit parameter with keep-non-service-config option.

### setTraceId(String) <a href="#m-setTraceId-72123789197d" id="m-setTraceId-72123789197d"></a>

```java
public void setTraceId(String traceId)
```

Set the trace id for the transaction.

**Parameters**

- `String traceId` - The trace id to use for the transaction.

### setUseLsa() <a href="#m-setUseLsa-15fd505b0cf9" id="m-setUseLsa-15fd505b0cf9"></a>

```java
public void setUseLsa()
```

Set use-lsa commit parameter.

### setWithServiceMetaData() <a href="#m-setWithServiceMetaData-9bd7b836b2dc" id="m-setWithServiceMetaData-9bd7b836b2dc"></a>

```java
public void setWithServiceMetaData()
```

Set with-service-meta-data commit parameter.

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```


## Nested Types

- [CommitQueueErrorOption](CommitParams/CommitQueueErrorOption.md#cls-CommitQueueErrorOption)
- [ConfirmNetworkStateMode](CommitParams/ConfirmNetworkStateMode.md#cls-ConfirmNetworkStateMode)
- [ConfirmNetworkStateScope](CommitParams/ConfirmNetworkStateScope.md#cls-ConfirmNetworkStateScope)
- [DryRunOutformat](CommitParams/DryRunOutformat.md#cls-DryRunOutformat)
- [NoOverwriteScope](CommitParams/NoOverwriteScope.md#cls-NoOverwriteScope)
