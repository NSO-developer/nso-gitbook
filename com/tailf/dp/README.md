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

- [AuthorizationOperCheck](AuthorizationOperCheck.md#authorizationopercheck-7342d1a011a5)
- [AuthorizationResult](AuthorizationResult.md#authorizationresult-118ce0a72969)
- [Completion](Completion.md#completion-86b0b2e96c7f)
- [CompletionDefaultReply](CompletionDefaultReply.md#completiondefaultreply-0777c6672e09)
- [CompletionRangeEnumReply](CompletionRangeEnumReply.md#completionrangeenumreply-ce8621e14f9a)
- [CompletionReply](CompletionReply.md#completionreply-21386c591079)
- [Dp](Dp.md#dp-64c27347820e)
- [DpAccumulate](DpAccumulate.md#dpaccumulate-2c3e1c3779d8)
- [DpActionCallback](DpActionCallback.md#dpactioncallback-62c4973947ec)
- [DpActionTrans](DpActionTrans.md#dpactiontrans-b975ce2c2d93)
- [DpAuthCallback](DpAuthCallback.md#dpauthcallback-207995250502)
- [DpAuthContext](DpAuthContext.md#dpauthcontext-74214c38995b)
- [DpAuthorizationCallback](DpAuthorizationCallback.md#dpauthorizationcallback-44fc33b19351)
- [DpAuthorizationContext](DpAuthorizationContext.md#dpauthorizationcontext-e368a48474b6)
- [DpCallbackException](DpCallbackException.md#dpcallbackexception-faf15838e5cb)
- [DpCallbackExtendedException](DpCallbackExtendedException.md#dpcallbackextendedexception-56110945bf17)
- [DpCallbackWarningException](DpCallbackWarningException.md#dpcallbackwarningexception-82a350729169)
- [DpDataCallback](DpDataCallback.md#dpdatacallback-79de01fc87fa)
- [DpDataFindNextIterator](DpDataFindNextIterator.md#dpdatafindnextiterator-36f0eadb3071)
- [DpDbCallback](DpDbCallback.md#dpdbcallback-7fcc01bd0281)
- [DpDbContext](DpDbContext.md#dpdbcontext-37347e4f266f)
- [DpException](DpException.md#dpexception-79c01c670be8)
- [DpExceptionReporter](DpExceptionReporter.md#dpexceptionreporter-09e497589a12)
- [DpListFilter](DpListFilter.md#dplistfilter-fe6aac67a14c)
- [DpMountIdInterface](DpMountIdInterface.md#dpmountidinterface-265f1e5d05e4)
- [DpNanoServiceCallback](DpNanoServiceCallback.md#dpnanoservicecallback-a88529d129ff)
- [DpNotifReplayCallback](DpNotifReplayCallback.md#dpnotifreplaycallback-8fa565df0e52)
- [DpNotifReplayThread](DpNotifReplayThread.md#dpnotifreplaythread-229bc31cb039)
- [DpNotifStream](DpNotifStream.md#dpnotifstream-35a75c06ae81)
- [DpProto](DpProto.md#dpproto-caad98905406)
- [DpServiceCallback](DpServiceCallback.md#dpservicecallback-181d65969781)
- [DpSnmpInformResponseCallback](DpSnmpInformResponseCallback.md#dpsnmpinformresponsecallback-bd4d651a8d7b)
- [DpSnmpNotifier](DpSnmpNotifier.md#dpsnmpnotifier-f23b7ad8c372)
- [DpThread](DpThread.md#dpthread-3c3d056fe2ad)
- [DpThreadPoolFactory](DpThreadPoolFactory.md#dpthreadpoolfactory-12e7e9f74c4d)
- [DpTrans](DpTrans.md#dptrans-bf19458d92ec)
- [DpTransCallback](DpTransCallback.md#dptranscallback-20e03cd7123b)
- [DpTransValidateCallback](DpTransValidateCallback.md#dptransvalidatecallback-377cc1867a16)
- [DpUserInfo](DpUserInfo.md#dpuserinfo-c59746285a6e)
- [DpValidateTrans](DpValidateTrans.md#dpvalidatetrans-a10fccde2ed1)
- [DpValpointCallback](DpValpointCallback.md#dpvalpointcallback-ee36356695e1)
- [DpWorkerThreadPool](DpWorkerThreadPool.md#dpworkerthreadpool-05106327e3a1)
- [ListFilterExprOp](ListFilterExprOp.md#listfilterexprop-7e720d295cdf)
- [ListFilterType](ListFilterType.md#listfiltertype-64b4a39256c7)
- [NextObjectArrayList](NextObjectArrayList.md#nextobjectarraylist-28f6c867871e)
- [NextObjectList](NextObjectList.md#nextobjectlist-86d6d5d5f508)
