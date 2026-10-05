# com.tailf.dp

Data provider API package, for implementation of callbacks for validations,
 actions, transformation etc.


 Validation.

 The database stores device configuration data. Some device configuration
 data is truly critical for the correct operations of the device.
 Misconfiguring a network device may lead to a situation where the device is
 no longer connected to the network. Before committing configuration data it
 is crucial to ensure that the new configuration is correct.
 Another benefit with a guaranteed correct configuration, is that application
 software which reads the configuration data need not check the validity of
 the configuration.

 Actions.

 When we want to define operations that do not affect the configuration data
 store, we can use the tailf:action statement in the YANG data model. The
 action definition specifies how the action is invoked, including input and
 output parameters (if any). Once defined, the action is available for
 invocation from all of NETCONF, CLI and Web UI.


 Transformations.

 When building new variants of an old product, we often have a situation
 where we have large amounts of application code, which reads configuration
 data from some datastore and we do not want to make any changes to the
 application code, we merely wish to expose a different view of the same
 configuration data.

 Another common situation is when we have application code which requires
 more configuration data than we wish to expose through the northbound
 management interfaces. The application reads and use a number of
 configuration items that do not make sense to expose through the different
 management interfaces.

## Types

- [AuthorizationOperCheck](AuthorizationOperCheck.md#cls-AuthorizationOperCheck)
- [AuthorizationResult](AuthorizationResult.md#cls-AuthorizationResult)
- [Completion](Completion.md#cls-Completion)
- [CompletionDefaultReply](CompletionDefaultReply.md#cls-CompletionDefaultReply)
- [CompletionRangeEnumReply](CompletionRangeEnumReply.md#cls-CompletionRangeEnumReply)
- [CompletionReply](CompletionReply.md#cls-CompletionReply)
- [Dp](Dp.md#cls-Dp)
- [DpAccumulate](DpAccumulate.md#cls-DpAccumulate)
- [DpActionCallback](DpActionCallback.md#cls-DpActionCallback)
- [DpActionTrans](DpActionTrans.md#cls-DpActionTrans)
- [DpAuthCallback](DpAuthCallback.md#cls-DpAuthCallback)
- [DpAuthContext](DpAuthContext.md#cls-DpAuthContext)
- [DpAuthorizationCallback](DpAuthorizationCallback.md#cls-DpAuthorizationCallback)
- [DpAuthorizationContext](DpAuthorizationContext.md#cls-DpAuthorizationContext)
- [DpCallbackException](DpCallbackException.md#cls-DpCallbackException)
- [DpCallbackExtendedException](DpCallbackExtendedException.md#cls-DpCallbackExtendedException)
- [DpCallbackWarningException](DpCallbackWarningException.md#cls-DpCallbackWarningException)
- [DpDataCallback](DpDataCallback.md#cls-DpDataCallback)
- [DpDataFindNextIterator](DpDataFindNextIterator.md#cls-DpDataFindNextIterator)
- [DpDbCallback](DpDbCallback.md#cls-DpDbCallback)
- [DpDbContext](DpDbContext.md#cls-DpDbContext)
- [DpException](DpException.md#cls-DpException)
- [DpExceptionReporter](DpExceptionReporter.md#cls-DpExceptionReporter)
- [DpListFilter](DpListFilter.md#cls-DpListFilter)
- [DpMountIdInterface](DpMountIdInterface.md#cls-DpMountIdInterface)
- [DpNanoServiceCallback](DpNanoServiceCallback.md#cls-DpNanoServiceCallback)
- [DpNotifReplayCallback](DpNotifReplayCallback.md#cls-DpNotifReplayCallback)
- [DpNotifReplayThread](DpNotifReplayThread.md#cls-DpNotifReplayThread)
- [DpNotifStream](DpNotifStream.md#cls-DpNotifStream)
- [DpProto](DpProto.md#cls-DpProto)
- [DpServiceCallback](DpServiceCallback.md#cls-DpServiceCallback)
- [DpSnmpInformResponseCallback](DpSnmpInformResponseCallback.md#cls-DpSnmpInformResponseCallback)
- [DpSnmpNotifier](DpSnmpNotifier.md#cls-DpSnmpNotifier)
- [DpThread](DpThread.md#cls-DpThread)
- [DpThreadPoolFactory](DpThreadPoolFactory.md#cls-DpThreadPoolFactory)
- [DpTrans](DpTrans.md#cls-DpTrans)
- [DpTransCallback](DpTransCallback.md#cls-DpTransCallback)
- [DpTransValidateCallback](DpTransValidateCallback.md#cls-DpTransValidateCallback)
- [DpUserInfo](DpUserInfo.md#cls-DpUserInfo)
- [DpValidateTrans](DpValidateTrans.md#cls-DpValidateTrans)
- [DpValpointCallback](DpValpointCallback.md#cls-DpValpointCallback)
- [DpWorkerThreadPool](DpWorkerThreadPool.md#cls-DpWorkerThreadPool)
- [ListFilterExprOp](ListFilterExprOp.md#cls-ListFilterExprOp)
- [ListFilterType](ListFilterType.md#cls-ListFilterType)
- [NextObjectArrayList](NextObjectArrayList.md#cls-NextObjectArrayList)
- [NextObjectList](NextObjectList.md#cls-NextObjectList)
