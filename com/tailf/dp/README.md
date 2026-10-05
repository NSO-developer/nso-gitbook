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

- [AuthorizationOperCheck](AuthorizationOperCheck.md#s-AuthorizationOperCheck)
- [AuthorizationResult](AuthorizationResult.md#s-AuthorizationResult)
- [Completion](Completion.md#s-Completion)
- [CompletionDefaultReply](CompletionDefaultReply.md#s-CompletionDefaultReply)
- [CompletionRangeEnumReply](CompletionRangeEnumReply.md#s-CompletionRangeEnumReply)
- [CompletionReply](CompletionReply.md#s-CompletionReply)
- [Dp](Dp.md#s-Dp)
- [DpAccumulate](DpAccumulate.md#s-DpAccumulate)
- [DpActionCallback](DpActionCallback.md#s-DpActionCallback)
- [DpActionTrans](DpActionTrans.md#s-DpActionTrans)
- [DpAuthCallback](DpAuthCallback.md#s-DpAuthCallback)
- [DpAuthContext](DpAuthContext.md#s-DpAuthContext)
- [DpAuthorizationCallback](DpAuthorizationCallback.md#s-DpAuthorizationCallback)
- [DpAuthorizationContext](DpAuthorizationContext.md#s-DpAuthorizationContext)
- [DpCallbackException](DpCallbackException.md#s-DpCallbackException)
- [DpCallbackExtendedException](DpCallbackExtendedException.md#s-DpCallbackExtendedException)
- [DpCallbackWarningException](DpCallbackWarningException.md#s-DpCallbackWarningException)
- [DpDataCallback](DpDataCallback.md#s-DpDataCallback)
- [DpDataFindNextIterator](DpDataFindNextIterator.md#s-DpDataFindNextIterator)
- [DpDbCallback](DpDbCallback.md#s-DpDbCallback)
- [DpDbContext](DpDbContext.md#s-DpDbContext)
- [DpException](DpException.md#s-DpException)
- [DpExceptionReporter](DpExceptionReporter.md#s-DpExceptionReporter)
- [DpListFilter](DpListFilter.md#s-DpListFilter)
- [DpMountIdInterface](DpMountIdInterface.md#s-DpMountIdInterface)
- [DpNanoServiceCallback](DpNanoServiceCallback.md#s-DpNanoServiceCallback)
- [DpNotifReplayCallback](DpNotifReplayCallback.md#s-DpNotifReplayCallback)
- [DpNotifReplayThread](DpNotifReplayThread.md#s-DpNotifReplayThread)
- [DpNotifStream](DpNotifStream.md#s-DpNotifStream)
- [DpProto](DpProto.md#s-DpProto)
- [DpServiceCallback](DpServiceCallback.md#s-DpServiceCallback)
- [DpSnmpInformResponseCallback](DpSnmpInformResponseCallback.md#s-DpSnmpInformResponseCallback)
- [DpSnmpNotifier](DpSnmpNotifier.md#s-DpSnmpNotifier)
- [DpThread](DpThread.md#s-DpThread)
- [DpThreadPoolFactory](DpThreadPoolFactory.md#s-DpThreadPoolFactory)
- [DpTrans](DpTrans.md#s-DpTrans)
- [DpTransCallback](DpTransCallback.md#s-DpTransCallback)
- [DpTransValidateCallback](DpTransValidateCallback.md#s-DpTransValidateCallback)
- [DpUserInfo](DpUserInfo.md#s-DpUserInfo)
- [DpValidateTrans](DpValidateTrans.md#s-DpValidateTrans)
- [DpValpointCallback](DpValpointCallback.md#s-DpValpointCallback)
- [DpWorkerThreadPool](DpWorkerThreadPool.md#s-DpWorkerThreadPool)
- [ListFilterExprOp](ListFilterExprOp.md#s-ListFilterExprOp)
- [ListFilterType](ListFilterType.md#s-ListFilterType)
- [NextObjectArrayList](NextObjectArrayList.md#s-NextObjectArrayList)
- [NextObjectList](NextObjectList.md#s-NextObjectList)
