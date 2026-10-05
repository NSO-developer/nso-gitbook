<a id="s-CommitParams"></a>
# CommitParams

```java
public class com.tailf.maapi.CommitParams
```

## Members

**Constructors**:

- [CommitParams()](#s-CommitParams-1)
- [CommitParams(ConfResponse)](#s-CommitParams-2)

**Methods**:

- [getComment()](#s-getComment)
- [getCommitQueueErrorOption()](#s-getCommitQueueErrorOption)
- [getCommitQueueSyncTimeout()](#s-getCommitQueueSyncTimeout)
- [getConfirmNetworkStateMode()](#s-getConfirmNetworkStateMode)
- [getConfirmNetworkStateScope()](#s-getConfirmNetworkStateScope)
- [getConfXMLParam()](#s-getConfXMLParam)
- [getDryRunOutformat()](#s-getDryRunOutformat)
- [getLabel()](#s-getLabel)
- [getNoOverwriteScope()](#s-getNoOverwriteScope)
- [getTraceId()](#s-getTraceId)
- [isCommitQueueAsync()](#s-isCommitQueueAsync)
- [isCommitQueueAtomic()](#s-isCommitQueueAtomic)
- [isCommitQueueBlockOthers()](#s-isCommitQueueBlockOthers)
- [isCommitQueueBypass()](#s-isCommitQueueBypass)
- [isCommitQueueLock()](#s-isCommitQueueLock)
- [isCommitQueueNonAtomic()](#s-isCommitQueueNonAtomic)
- [isCommitQueueSync()](#s-isCommitQueueSync)
- [isConfirmNetworkState()](#s-isConfirmNetworkState)
- [isConfirmNetworkStateReDeployAll()](#s-isConfirmNetworkStateReDeployAll)
- [isConfirmNetworkStateReEvaluatePolicies()](#s-isConfirmNetworkStateReEvaluatePolicies)
- [isDryRun()](#s-isDryRun)
- [isDryRunReverse()](#s-isDryRunReverse)
- [isNoDeploy()](#s-isNoDeploy)
- [isNoLsa()](#s-isNoLsa)
- [isNoNetworking()](#s-isNoNetworking)
- [isNoOutOfSyncCheck()](#s-isNoOutOfSyncCheck)
- [isNoOverwrite()](#s-isNoOverwrite)
- [isNoRevisionDrop()](#s-isNoRevisionDrop)
- [isReconcileAttachNonServiceConfig()](#s-isReconcileAttachNonServiceConfig)
- [isReconcileDetachNonServiceConfig()](#s-isReconcileDetachNonServiceConfig)
- [isReconcileDiscardNonServiceConfig()](#s-isReconcileDiscardNonServiceConfig)
- [isReconcileKeepNonServiceConfig()](#s-isReconcileKeepNonServiceConfig)
- [isUseLsa()](#s-isUseLsa)
- [isWithServiceMetaData()](#s-isWithServiceMetaData)
- [setComment(String)](#s-setComment)
- [setCommitQueueAsync()](#s-setCommitQueueAsync)
- [setCommitQueueAtomic()](#s-setCommitQueueAtomic)
- [setCommitQueueBlockOthers()](#s-setCommitQueueBlockOthers)
- [setCommitQueueBypass()](#s-setCommitQueueBypass)
- [setCommitQueueErrorOption(CommitQueueErrorOption)](#s-setCommitQueueErrorOption)
- [setCommitQueueLock()](#s-setCommitQueueLock)
- [setCommitQueueNonAtomic()](#s-setCommitQueueNonAtomic)
- [setCommitQueueSync()](#s-setCommitQueueSync)
- [setCommitQueueSync(int)](#s-setCommitQueueSync-1)
- [setConfirmNetworkState()](#s-setConfirmNetworkState)
- [setConfirmNetworkStateMode(ConfirmNetworkStateMode)](#s-setConfirmNetworkStateMode)
- [setConfirmNetworkStateReDeployAll()](#s-setConfirmNetworkStateReDeployAll)
- [setConfirmNetworkStateReEvaluatePolicies()](#s-setConfirmNetworkStateReEvaluatePolicies)
- [setConfirmNetworkStateScope(ConfirmNetworkStateScope)](#s-setConfirmNetworkStateScope)
- [setDryRunCli()](#s-setDryRunCli)
- [setDryRunCliC()](#s-setDryRunCliC)
- [setDryRunCliCReverse()](#s-setDryRunCliCReverse)
- [setDryRunNative()](#s-setDryRunNative)
- [setDryRunNativeReverse()](#s-setDryRunNativeReverse)
- [setDryRunOutformat(DryRunOutformat)](#s-setDryRunOutformat)
- [setDryRunReverse()](#s-setDryRunReverse)
- [setDryRunXml()](#s-setDryRunXml)
- [setLabel(String)](#s-setLabel)
- [setNoDeploy()](#s-setNoDeploy)
- [setNoLsa()](#s-setNoLsa)
- [setNoNetworking()](#s-setNoNetworking)
- [setNoOutOfSyncCheck()](#s-setNoOutOfSyncCheck)
- [setNoOverwrite(NoOverwriteScope)](#s-setNoOverwrite)
- [setNoRevisionDrop()](#s-setNoRevisionDrop)
- [setReconcileAttachNonServiceConfig()](#s-setReconcileAttachNonServiceConfig)
- [setReconcileDetachNonServiceConfig()](#s-setReconcileDetachNonServiceConfig)
- [setReconcileDiscardNonServiceConfig()](#s-setReconcileDiscardNonServiceConfig)
- [setReconcileExcludePaths(ConfList)](#s-setReconcileExcludePaths)
- [setReconcileIncludePaths(ConfList)](#s-setReconcileIncludePaths)
- [setReconcileKeepNonServiceConfig()](#s-setReconcileKeepNonServiceConfig)
- [setTraceId(String)](#s-setTraceId)
- [setUseLsa()](#s-setUseLsa)
- [setWithServiceMetaData()](#s-setWithServiceMetaData)
- [toString()](#s-toString)

**Nested Types**:

- [CommitQueueErrorOption](CommitParams/CommitQueueErrorOption.md#s-CommitQueueErrorOption)
- [ConfirmNetworkStateMode](CommitParams/ConfirmNetworkStateMode.md#s-ConfirmNetworkStateMode)
- [ConfirmNetworkStateScope](CommitParams/ConfirmNetworkStateScope.md#s-ConfirmNetworkStateScope)
- [DryRunOutformat](CommitParams/DryRunOutformat.md#s-DryRunOutformat)
- [NoOverwriteScope](CommitParams/NoOverwriteScope.md#s-NoOverwriteScope)

## Constructors

<a id="s-CommitParams-1"></a>
### CommitParams()

```java
public CommitParams()
```

<a id="s-CommitParams-2"></a>
### CommitParams(ConfResponse)

```java
public CommitParams(com.tailf.conf.ConfResponse result)
```

Types: [ConfResponse](../conf/ConfResponse.md#s-ConfResponse)

**Parameters**

- `com.tailf.conf.ConfResponse result`


## Methods

<a id="s-getComment"></a>
### getComment()

```java
public String getComment()
```

Get the the comment for the transaction.

**Returns:** The comment.

<a id="s-getCommitQueueErrorOption"></a>
### getCommitQueueErrorOption()

```java
public com.tailf.maapi.CommitParams.CommitQueueErrorOption getCommitQueueErrorOption()
```

Types: [CommitQueueErrorOption](CommitParams/CommitQueueErrorOption.md#s-CommitQueueErrorOption)

Get commit queue error option.

**Returns:** The error option or null if not set.

<a id="s-getCommitQueueSyncTimeout"></a>
### getCommitQueueSyncTimeout()

```java
public Long getCommitQueueSyncTimeout()
```

Get commit queue synchronous mode of operation custom timeout.

**Returns:** The timeout in seconds. -1 means infinity. If no value has
         been set null is returned.

<a id="s-getConfirmNetworkStateMode"></a>
### getConfirmNetworkStateMode()

```java
public com.tailf.maapi.CommitParams.ConfirmNetworkStateMode getConfirmNetworkStateMode()
```

Types: [ConfirmNetworkStateMode](CommitParams/ConfirmNetworkStateMode.md#s-ConfirmNetworkStateMode)

Get the mode for the confirm-network-state check.

**Returns:** The confirm-network-state mode or null if not set.

<a id="s-getConfirmNetworkStateScope"></a>
### getConfirmNetworkStateScope()

```java
public com.tailf.maapi.CommitParams.ConfirmNetworkStateScope getConfirmNetworkStateScope()
```

Types: [ConfirmNetworkStateScope](CommitParams/ConfirmNetworkStateScope.md#s-ConfirmNetworkStateScope)

Get the confirm-network-state scope.

**Returns:** The confirm-network-state scope or null if not set.

<a id="s-getConfXMLParam"></a>
### getConfXMLParam()

```java
public java.util.List<com.tailf.conf.ConfXMLParam> getConfXMLParam()
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam)

Get all commit parameters as a list of [`ConfXMLParam`](../conf/ConfXMLParam.md#s-ConfXMLParam).

**Returns:** List of [`ConfXMLParam`](../conf/ConfXMLParam.md#s-ConfXMLParam) representing the current
         commit parameters.

<a id="s-getDryRunOutformat"></a>
### getDryRunOutformat()

```java
public com.tailf.maapi.CommitParams.DryRunOutformat getDryRunOutformat()
```

Types: [DryRunOutformat](CommitParams/DryRunOutformat.md#s-DryRunOutformat)

Get the outformat to produce when committing with dry-run.

**Returns:** The outformat to produce or null if not set.

<a id="s-getLabel"></a>
### getLabel()

```java
public String getLabel()
```

Get the the label for the transaction.

**Returns:** The label.

<a id="s-getNoOverwriteScope"></a>
### getNoOverwriteScope()

```java
public com.tailf.maapi.CommitParams.NoOverwriteScope getNoOverwriteScope()
```

Types: [NoOverwriteScope](CommitParams/NoOverwriteScope.md#s-NoOverwriteScope)

Get the no-overwrite scope.

**Returns:** The no-overwrite scope or null if not set.

<a id="s-getTraceId"></a>
### getTraceId()

```java
public String getTraceId()
```

Get the the trace id for the transaction.

**Returns:** The trace id.

<a id="s-isCommitQueueAsync"></a>
### isCommitQueueAsync()

```java
public boolean isCommitQueueAsync()
```

Get commit queue asynchronous mode of operation.

**Returns:** true if the mode of operation is asynchronous, false otherwise.

<a id="s-isCommitQueueAtomic"></a>
### isCommitQueueAtomic()

```java
public boolean isCommitQueueAtomic()
```

Check if the commit queue item is atomic.

**Returns:** true if it is atomic, false if it isn't.

<a id="s-isCommitQueueBlockOthers"></a>
### isCommitQueueBlockOthers()

```java
public boolean isCommitQueueBlockOthers()
```

Check if the the commit queue item block other commit queue items
 for these devices.

<a id="s-isCommitQueueBypass"></a>
### isCommitQueueBypass()

```java
public boolean isCommitQueueBypass()
```

Check if the commit should bypass the commit queue, i.e. it is
 transactional even though commit queue is the default.

**Returns:** true if the commit queue should be bypassed, false otherwise.

<a id="s-isCommitQueueLock"></a>
### isCommitQueueLock()

```java
public boolean isCommitQueueLock()
```

Check if the commit queue item is locked.

**Returns:** true if it is locked, false otherwise.

<a id="s-isCommitQueueNonAtomic"></a>
### isCommitQueueNonAtomic()

```java
public boolean isCommitQueueNonAtomic()
```

Check if the commit queue item is non-atomic.

**Returns:** true if it is non-atomic, false if it isn't.

<a id="s-isCommitQueueSync"></a>
### isCommitQueueSync()

```java
public boolean isCommitQueueSync()
```

Get commit queue synchronous mode of operation.

**Returns:** true if the mode of operation is synchronous, false otherwise.

<a id="s-isConfirmNetworkState"></a>
### isConfirmNetworkState()

```java
public boolean isConfirmNetworkState()
```

Should a check be done that the parts of the device configuration
 read and/or modified are up-to-date in CDB before pushing the
 configuration change to the device.

<a id="s-isConfirmNetworkStateReDeployAll"></a>
### isConfirmNetworkStateReDeployAll()

```java
public boolean isConfirmNetworkStateReDeployAll()
```

Re-deploy all services affected by discovered out-of-band data?

<a id="s-isConfirmNetworkStateReEvaluatePolicies"></a>
### isConfirmNetworkStateReEvaluatePolicies()

```java
public boolean isConfirmNetworkStateReEvaluatePolicies()
```

Is confirm-network-state with re-evaluate-policies enabled

**Deprecated:** Use `getConfirmNetworkStateMode()` instead.

<a id="s-isDryRun"></a>
### isDryRun()

```java
public boolean isDryRun()
```

Check if dry-run is enabled.

**Returns:** true if dry-run is enabled, false otherwise.

<a id="s-isDryRunReverse"></a>
### isDryRunReverse()

```java
public boolean isDryRunReverse()
```

Check if the dry-run should produce a reverse diff.

**Returns:** true if the produced diff should be reverse,
         false otherwise.

<a id="s-isNoDeploy"></a>
### isNoDeploy()

```java
public boolean isNoDeploy()
```

Check if service's create method should be invoked or not.

**Returns:** true if it should be invoked, false otherwise.

<a id="s-isNoLsa"></a>
### isNoLsa()

```java
public boolean isNoLsa()
```

Get no-lsa commit parameter.

**Returns:** true if set, false otherwise.

<a id="s-isNoNetworking"></a>
### isNoNetworking()

```java
public boolean isNoNetworking()
```

Check if the configuration should only be written to CDB, not
 actually pushed to the device.

**Returns:** true if the configuration should not be pused to the
         device, false otherwise.

<a id="s-isNoOutOfSyncCheck"></a>
### isNoOutOfSyncCheck()

```java
public boolean isNoOutOfSyncCheck()
```

<a id="s-isNoOverwrite"></a>
### isNoOverwrite()

```java
public boolean isNoOverwrite()
```

Should a check be done that the parts of the device configuration
 to be modified are up-to-date in CDB before pushing the
 configuration change to the device.

<a id="s-isNoRevisionDrop"></a>
### isNoRevisionDrop()

```java
public boolean isNoRevisionDrop()
```

Check if no-revision-drop commit parameter is set.

**Returns:** true if it is set, false otherwise.

<a id="s-isReconcileAttachNonServiceConfig"></a>
### isReconcileAttachNonServiceConfig()

```java
public boolean isReconcileAttachNonServiceConfig()
```

Get reconcile commit parameter with attach-non-service-config option.

**Returns:** true if set, false otherwise.

<a id="s-isReconcileDetachNonServiceConfig"></a>
### isReconcileDetachNonServiceConfig()

```java
public boolean isReconcileDetachNonServiceConfig()
```

Get reconcile commit parameter with detach-non-service-config option.

**Returns:** true if set, false otherwise.

<a id="s-isReconcileDiscardNonServiceConfig"></a>
### isReconcileDiscardNonServiceConfig()

```java
public boolean isReconcileDiscardNonServiceConfig()
```

Get reconcile commit parameter with discard-non-service-config option.

**Returns:** true if set, false otherwise.

<a id="s-isReconcileKeepNonServiceConfig"></a>
### isReconcileKeepNonServiceConfig()

```java
public boolean isReconcileKeepNonServiceConfig()
```

Get reconcile commit parameter with keep-non-service-config option.

**Returns:** true if set false otherwise.

<a id="s-isUseLsa"></a>
### isUseLsa()

```java
public boolean isUseLsa()
```

Get use-lsa commit parameter.

**Returns:** true if set, false otherwise.

<a id="s-isWithServiceMetaData"></a>
### isWithServiceMetaData()

```java
public boolean isWithServiceMetaData()
```

Check if with-service-meta-data is enabled.

**Returns:** true if with-service-meta-data is enabled, false otherwise.

<a id="s-setComment"></a>
### setComment(String)

```java
public void setComment(String comment)
```

Set the comment for the transaction.

**Parameters**

- `String comment` - The comment to use for the transaction.

<a id="s-setCommitQueueAsync"></a>
### setCommitQueueAsync()

```java
public void setCommitQueueAsync()
```

Set commit queue asynchronous mode of operation.

<a id="s-setCommitQueueAtomic"></a>
### setCommitQueueAtomic()

```java
public void setCommitQueueAtomic()
```

Make the commit queue item atomic.

<a id="s-setCommitQueueBlockOthers"></a>
### setCommitQueueBlockOthers()

```java
public void setCommitQueueBlockOthers()
```

Make the commit queue item block other commit queue items
 for these devices.

<a id="s-setCommitQueueBypass"></a>
### setCommitQueueBypass()

```java
public void setCommitQueueBypass()
```

Make the commit transactional even if commit queue is default.

<a id="s-setCommitQueueErrorOption"></a>
### setCommitQueueErrorOption(CommitQueueErrorOption)

```java
public void setCommitQueueErrorOption(
    com.tailf.maapi.CommitParams.CommitQueueErrorOption errorOption
)
```

Types: [CommitQueueErrorOption](CommitParams/CommitQueueErrorOption.md#s-CommitQueueErrorOption)

Set commit queue error option.

**Parameters**

- `com.tailf.maapi.CommitParams.CommitQueueErrorOption errorOption`

<a id="s-setCommitQueueLock"></a>
### setCommitQueueLock()

```java
public void setCommitQueueLock()
```

Make the commit queue item locked. Locked commit queue item needs to
 be unlocked before it can proceed.

<a id="s-setCommitQueueNonAtomic"></a>
### setCommitQueueNonAtomic()

```java
public void setCommitQueueNonAtomic()
```

Make the commit queue item non-atomic.

<a id="s-setCommitQueueSync"></a>
### setCommitQueueSync()

```java
public void setCommitQueueSync()
```

Set commit queue synchronous mode of operation.

<a id="s-setCommitQueueSync-1"></a>
### setCommitQueueSync(int)

```java
public void setCommitQueueSync(int timeout)
```

Set commit queue synchronous mode of operation with custom timeout.

**Parameters**

- `int timeout` - Timeout in seconds. -1 means infinity.

<a id="s-setConfirmNetworkState"></a>
### setConfirmNetworkState()

```java
public void setConfirmNetworkState()
```

Check that the parts of the device configuration read and/or modified
 are up-to-date in CDB before pushing the configuration change to the
 device.

<a id="s-setConfirmNetworkStateMode"></a>
### setConfirmNetworkStateMode(ConfirmNetworkStateMode)

```java
public void setConfirmNetworkStateMode(com.tailf.maapi.CommitParams.ConfirmNetworkStateMode mode)
```

Types: [ConfirmNetworkStateMode](CommitParams/ConfirmNetworkStateMode.md#s-ConfirmNetworkStateMode)

Set the mode for the confirm-network-state check.

**Parameters**

- `com.tailf.maapi.CommitParams.ConfirmNetworkStateMode mode`

<a id="s-setConfirmNetworkStateReDeployAll"></a>
### setConfirmNetworkStateReDeployAll()

```java
public void setConfirmNetworkStateReDeployAll()
```

Re-deploy all services affected by discovered out-of-band data

<a id="s-setConfirmNetworkStateReEvaluatePolicies"></a>
### setConfirmNetworkStateReEvaluatePolicies()

```java
public void setConfirmNetworkStateReEvaluatePolicies()
```

Check that the parts of the device configuration read and/or modified
 are up-to-date in CDB before pushing the configuration change to the
 device and re-evaluate out-of-band policies of effected services.

**Deprecated:** Use [`ConfirmNetworkStateMode`](CommitParams/ConfirmNetworkStateMode.md#s-ConfirmNetworkStateMode) instead.

<a id="s-setConfirmNetworkStateScope"></a>
### setConfirmNetworkStateScope(ConfirmNetworkStateScope)

```java
public void setConfirmNetworkStateScope(com.tailf.maapi.CommitParams.ConfirmNetworkStateScope scope)
```

Types: [ConfirmNetworkStateScope](CommitParams/ConfirmNetworkStateScope.md#s-ConfirmNetworkStateScope)

Set the scope of the confirm-network-state check.

**Parameters**

- `com.tailf.maapi.CommitParams.ConfirmNetworkStateScope scope`

<a id="s-setDryRunCli"></a>
### setDryRunCli()

```java
public void setDryRunCli()
```

Commit with dry-run outformat CLI.

<a id="s-setDryRunCliC"></a>
### setDryRunCliC()

```java
public void setDryRunCliC()
```

Commit with dry-run outformat cli-c.

<a id="s-setDryRunCliCReverse"></a>
### setDryRunCliCReverse()

```java
public void setDryRunCliCReverse()
```

Commit with dry-run outformat cli-c reverse.

<a id="s-setDryRunNative"></a>
### setDryRunNative()

```java
public void setDryRunNative()
```

Commit with dry-run outformat native.

<a id="s-setDryRunNativeReverse"></a>
### setDryRunNativeReverse()

```java
public void setDryRunNativeReverse()
```

Commit with dry-run outformat native reverse.

<a id="s-setDryRunOutformat"></a>
### setDryRunOutformat(DryRunOutformat)

```java
public void setDryRunOutformat(com.tailf.maapi.CommitParams.DryRunOutformat outformat)
```

Types: [DryRunOutformat](CommitParams/DryRunOutformat.md#s-DryRunOutformat)

Set the outformat to produce when committing with dry-run.

**Parameters**

- `com.tailf.maapi.CommitParams.DryRunOutformat outformat` - The outformat to produce.

<a id="s-setDryRunReverse"></a>
### setDryRunReverse()

```java
public void setDryRunReverse()
```

Make dry-run produce a reverse diff.

<a id="s-setDryRunXml"></a>
### setDryRunXml()

```java
public void setDryRunXml()
```

Commit with dry-run outformat XML.

<a id="s-setLabel"></a>
### setLabel(String)

```java
public void setLabel(String label)
```

Set the label for the transaction.

**Parameters**

- `String label` - The label to use for the transaction.

<a id="s-setNoDeploy"></a>
### setNoDeploy()

```java
public void setNoDeploy()
```

Do not invoke service's create method.

<a id="s-setNoLsa"></a>
### setNoLsa()

```java
public void setNoLsa()
```

Set no-lsa commit parameter.

<a id="s-setNoNetworking"></a>
### setNoNetworking()

```java
public void setNoNetworking()
```

Only write the configuration to CDB, do not actually push it to the
 device.

<a id="s-setNoOutOfSyncCheck"></a>
### setNoOutOfSyncCheck()

```java
public void setNoOutOfSyncCheck()
```

Do not check device sync state before pushing the configuration change.

<a id="s-setNoOverwrite"></a>
### setNoOverwrite(NoOverwriteScope)

```java
public void setNoOverwrite(com.tailf.maapi.CommitParams.NoOverwriteScope scope)
```

Types: [NoOverwriteScope](CommitParams/NoOverwriteScope.md#s-NoOverwriteScope)

Check that the parts of the device configuration to be modified are
 up-to-date in CDB before pushing the configuration change to the
 device.

**Parameters**

- `com.tailf.maapi.CommitParams.NoOverwriteScope scope`

<a id="s-setNoRevisionDrop"></a>
### setNoRevisionDrop()

```java
public void setNoRevisionDrop()
```

Set no-revision-drop commit parameter.

<a id="s-setReconcileAttachNonServiceConfig"></a>
### setReconcileAttachNonServiceConfig()

```java
public void setReconcileAttachNonServiceConfig()
```

Set reconcile commit parameter with attach-non-service-config option.

<a id="s-setReconcileDetachNonServiceConfig"></a>
### setReconcileDetachNonServiceConfig()

```java
public void setReconcileDetachNonServiceConfig()
```

Set reconcile commit parameter with attach-non-service-config option.

<a id="s-setReconcileDiscardNonServiceConfig"></a>
### setReconcileDiscardNonServiceConfig()

```java
public void setReconcileDiscardNonServiceConfig()
```

Set reconcile commit parameter with discard-non-service-config option.

<a id="s-setReconcileExcludePaths"></a>
### setReconcileExcludePaths(ConfList)

```java
public void setReconcileExcludePaths(com.tailf.conf.ConfList paths)
```

Types: [ConfList](../conf/ConfList.md#s-ConfList)

Set the paths to be excluded during reconcilation.

**Parameters**

- `com.tailf.conf.ConfList paths` - A list of object-identifiers

<a id="s-setReconcileIncludePaths"></a>
### setReconcileIncludePaths(ConfList)

```java
public void setReconcileIncludePaths(com.tailf.conf.ConfList paths)
```

Types: [ConfList](../conf/ConfList.md#s-ConfList)

Set the paths to be included during reconcilation.

**Parameters**

- `com.tailf.conf.ConfList paths` - A list of object-identifiers

<a id="s-setReconcileKeepNonServiceConfig"></a>
### setReconcileKeepNonServiceConfig()

```java
public void setReconcileKeepNonServiceConfig()
```

Set reconcile commit parameter with keep-non-service-config option.

<a id="s-setTraceId"></a>
### setTraceId(String)

```java
public void setTraceId(String traceId)
```

Set the trace id for the transaction.

**Parameters**

- `String traceId` - The trace id to use for the transaction.

<a id="s-setUseLsa"></a>
### setUseLsa()

```java
public void setUseLsa()
```

Set use-lsa commit parameter.

<a id="s-setWithServiceMetaData"></a>
### setWithServiceMetaData()

```java
public void setWithServiceMetaData()
```

Set with-service-meta-data commit parameter.

<a id="s-toString"></a>
### toString()

```java
public String toString()
```


## Nested Types

- [CommitQueueErrorOption](CommitParams/CommitQueueErrorOption.md)
- [ConfirmNetworkStateMode](CommitParams/ConfirmNetworkStateMode.md)
- [ConfirmNetworkStateScope](CommitParams/ConfirmNetworkStateScope.md)
- [DryRunOutformat](CommitParams/DryRunOutformat.md)
- [NoOverwriteScope](CommitParams/NoOverwriteScope.md)
