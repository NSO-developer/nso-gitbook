# Maapi <a href="#maapi-67bcbe89c42e" id="maapi-67bcbe89c42e"></a>

```java
public class com.tailf.maapi.Maapi
    implements java.io.Closeable
```

This class implements the Management Agent API (MAAPI).


 The purpose of the class is twofold:



- MAAPI can be used to implement our own proprietary
 management agent.
- We can also use Maapi to attach to already existing
 transactions, for example when we wish to implement semantic validation of
 data elements or implement a CLI wizard.




 Example:



```
 // int port = Conf.PORT; // ConfD TCP; NCS uses Conf.NCS_PATH (Unix socket)
 // Setup socket to server
 Socket s = new Socket(localhost, port);

 // Start MAAPI session for admin user, originating from localhost
 Maapi maapi = new Maapi(s);
 maapi.startUserSession(admin,
     maapi,
     new String[] { admin },
     new SocketAddress(InetAddress.getLocalHost(), 0),
     MaapiUserSessionFlag.PROTO_TCP);

 // Start a read transaction towards the running configuration.
 int tid = maapi.startTrans(Conf.DB_RUNNING, Conf.MODE_READ);
 // Set the namespace for the upcoming data operations
 maapi.setNamespace(tid, http://tail-f.com/test/mtest/1.0);
 // Read the maxLeaseTime setting in the running configuration.
 ConfObject r = maapi.getElem(tid, /mtest/servers/server{www}/ip);
 // Done, the transaction and user session is automatically
 // ended when the socket is closed.
 s.close();
```

## Members

**Constructors**:

- [Maapi(Socket)](#maapi-8dc69723d5bc)
- [Maapi(SocketAddress)](#maapi-741da54ce5b9)

**Fields**:

- [COMMIT_NCS_CONFIRM_NETWORK_STATE](#commit_ncs_confirm_network_state-3fa6237977c8)
- [COMMIT_NCS_CONFIRM_NETWORK_STATE_RE_EVALUATE_POLICIES](#commit_ncs_confirm_network_state_re_evaluate_policies-7b6a618d6004)
- [COMMIT_NCS_NO_DEPLOY](#commit_ncs_no_deploy-fe5d11934928)
- [COMMIT_NCS_NO_LSA](#commit_ncs_no_lsa-88834afe2914)
- [COMMIT_NCS_NO_NETWORKING](#commit_ncs_no_networking-5337030cc5aa)
- [COMMIT_NCS_NO_OUT_OF_SYNC_CHECK](#commit_ncs_no_out_of_sync_check-4ff4693de193)
- [COMMIT_NCS_NO_OVERWRITE_WRITE_AND_FULL_READ_SET](#commit_ncs_no_overwrite_write_and_full_read_set-47609363ce3c)
- [COMMIT_NCS_NO_OVERWRITE_WRITE_AND_SERVICE_READ_SET](#commit_ncs_no_overwrite_write_and_service_read_set-599b4fc50ee9)
- [COMMIT_NCS_NO_OVERWRITE_WRITE_SET_ONLY](#commit_ncs_no_overwrite_write_set_only-0228b05fbdba)
- [COMMIT_NCS_NO_REVISION_DROP](#commit_ncs_no_revision_drop-99240a81765e)
- [COMMIT_NCS_RECONCILE_ATTACH_NON_SERVICE_CONFIG](#commit_ncs_reconcile_attach_non_service_config-8cd06f654b36)
- [COMMIT_NCS_RECONCILE_DETACH_NON_SERVICE_CONFIG](#commit_ncs_reconcile_detach_non_service_config-c67c803d1de5)
- [COMMIT_NCS_RECONCILE_DISCARD_NON_SERVICE_CONFIG](#commit_ncs_reconcile_discard_non_service_config-c666106de8bd)
- [COMMIT_NCS_RECONCILE_KEEP_NON_SERVICE_CONFIG](#commit_ncs_reconcile_keep_non_service_config-920607f60083)
- [COMMIT_NCS_USE_LSA](#commit_ncs_use_lsa-998f30efc74f)
- [IA_CLIENT_MAAPI](#ia_client_maapi-abd097089172)
- [MAAPI_UPGRADE_KILL_ON_TIMEOUT](#maapi_upgrade_kill_on_timeout-0175839f1d11)
- [maapiSchemasClass](#maapischemasclass-28c23f540519)

**Methods**:

- [aaaReload(boolean)](#aaareload-7223d1ffcc54)
- [abortTrans(int)](#aborttrans-d310b7982d91)
- [abortUpgrade()](#abortupgrade-4c0f0c13e771)
- [applyTrans(int, boolean)](#applytrans-94f52f2648ce)
- [applyTrans(int, boolean, int)](#applytrans-5868175f1f0b)
- [applyTransParams(int, boolean, CommitParams)](#applytransparams-6c20b7896663)
- [attach(int, int)](#attach-0e2e60b563af)
- [attach(int, int, int)](#attach-59771e44614d)
- [attach(int, String)](#attach-39f7255284db)
- [attach(int, String, int)](#attach-cb83c464b289)
- [attachInit()](#attachinit-11064448310c)
- [authenticate(String, String)](#authenticate-9b081cc66ee1)
- [authenticate2(String, String, InetAddress, int, String, MaapiUserSessionFlag)](#authenticate2-84062b58a524)
- [candidateAbortCommit()](#candidateabortcommit-2b2c1c4204e0)
- [candidateAbortCommitPersistent(String)](#candidateabortcommitpersistent-5c9a841d3003)
- [candidateCommit()](#candidatecommit-8dde71013b2b)
- [candidateCommitInfo(String, String)](#candidatecommitinfo-9389711260f1)
- [candidateCommitInfo(String, String, String)](#candidatecommitinfo-2fbe0cc5dd8e)
- [candidateCommitPersistent(String)](#candidatecommitpersistent-232601a4459c)
- [candidateConfirmedCommit(int)](#candidateconfirmedcommit-2ecf86dd82a1)
- [candidateConfirmedCommitInfo(int, String, String)](#candidateconfirmedcommitinfo-84908f457061)
- [candidateConfirmedCommitInfo(int, String, String, String, String)](#candidateconfirmedcommitinfo-6edce2eaddd1)
- [candidateConfirmedCommitPersistent(int, String, String)](#candidateconfirmedcommitpersistent-119dbc0948e1)
- [candidateReset()](#candidatereset-b7aa1a8c94e7)
- [candidateValidate()](#candidatevalidate-58aea9fceaa1)
- [cd(int, String, Object[])](#cd-2b29dc1e94f8)
- [clearOpCache()](#clearopcache-4878d76fc012)
- [clearOpCache(ConfPath)](#clearopcache-d6710dfdab1a)
- [clearReadIntent(int)](#clearreadintent-b5b83aa4a4f8)
- [CLIAccounting(String, int, String)](#cliaccounting-2a7079fd4705)
- [CLICmdToPath(int, String)](#clicmdtopath-90aed3e422a9)
- [CLICmdToPath(String)](#clicmdtopath-28d97ca6f282)
- [CLIDiffCmd(int, int, ConfPath)](#clidiffcmd-a74803e0854c)
- [CLIPathCmd(int, EnumSet<CLIPathCmdFlag>, String, Object[])](#clipathcmd-554037c1a7b8)
- [CLIPrompt(int, String, boolean)](#cliprompt-8bf975d68180)
- [CLIPrompt(int, String, boolean, int)](#cliprompt-547c211c5c55)
- [CLIPromptOneOf(int, String, String[])](#clipromptoneof-7100649afe63)
- [CLIPromptOneOf(int, String, String[], int)](#clipromptoneof-eff406070adc)
- [CLIReadEOF(int, boolean)](#clireadeof-ae26f628719b)
- [CLIReadEOF(int, boolean, int)](#clireadeof-5fc695888097)
- [CLIWrite(int, String)](#cliwrite-82d9f9f34697)
- [close()](#close-8107c6dc012b)
- [commitTrans(int)](#committrans-edd7d497abaf)
- [commitUpgrade()](#commitupgrade-571b9396e3a3)
- [confirmedCommitInProgress()](#confirmedcommitinprogress-15c6ed3c5f5f)
- [copy(int, int)](#copy-498f3a527216)
- [copyPath(int, int, ConfPath)](#copypath-4f0da08da889)
- [copyRunningToStartup()](#copyrunningtostartup-493226bdd3d0)
- [copyTree(int, boolean, ConfPath, ConfPath)](#copytree-02a5a406c545)
- [copyTree(int, ConfPath, ConfPath)](#copytree-9f5a27b7b6e6)
- [create(int, ConfPath)](#create-88ad345c22c2)
- [create(int, String, Object[])](#create-fc0ad3b51c5b)
- [delete(int, ConfPath)](#delete-84019aaada07)
- [delete(int, String, Object[])](#delete-7f7b4f7a3319)
- [deleteAll(int, MaapiDeleteAllFlag)](#deleteall-b0d5e11220fb)
- [deleteConfig(int)](#deleteconfig-124c36c44b6f)
- [deref(int, String, Object[])](#deref-570394700610)
- [destroyCursor(int, int, ConfPath)](#destroycursor-e647eef13807)
- [destroyCursor(MaapiCursor)](#destroycursor-175b7f0886db)
- [detach(int)](#detach-a694e7ef7d65)
- [diffIterate(int, MaapiDiffIterate)](#diffiterate-8d4d9d07b552)
- [diffIterate(int, MaapiDiffIterate, Object, String, Object[])](#diffiterate-08cf0eebfc90)
- [diffIterate(int, MaapiDiffIterate, String, Object[])](#diffiterate-12c0a67aa0f4)
- [diffIterate(int, Object, EnumSet<DiffIterateFlags>, MaapiDiffIterate, ConfPath)](#diffiterate-e06379c98286)
- [disconnectRemote(String)](#disconnectremote-450face0b812)
- [disconnectSockets(int[])](#disconnectsockets-8b7e078ee89f)
- [doDisplay(int, String, Object[])](#dodisplay-3fd4ff100335)
- [endSpan(Span, String)](#endspan-1c44c700da19)
- [endUserSession()](#endusersession-0b0070df9e04)
- [event(int, Verbosity, String, ConfPath, Attributes)](#event-a62f77a7eb2a)
- [exists(int, ConfPath)](#exists-6846f84c441d)
- [exists(int, String, Object[])](#exists-40982ba2d871)
- [findNext(MaapiCursor, ConfFindNextType, ConfKey)](#findnext-8a93985facf5)
- [finishTrans(int)](#finishtrans-0f920518d3c3)
- [getAttrs(int, ConfAttributeType[], String, Object[])](#getattrs-7e03f020d090)
- [getAuthorizationInfo(int)](#getauthorizationinfo-80c04fd39233)
- [getAutoNsList()](#getautonslist-da00481c1d9a)
- [getAutoNsList(List<ConfNamespace>)](#getautonslist-033586c41810)
- [getAutoNsMap()](#getautonsmap-587def34063e)
- [getAutoNsPrefixMap()](#getautonsprefixmap-6897b4989dfd)
- [getCase(int, String, ConfPath)](#getcase-9be6344ce9aa)
- [getCase(int, String, String, Object[])](#getcase-9eae8c6bc653)
- [getCLIInteraction(int)](#getcliinteraction-9602971a279d)
- [getCwd(int)](#getcwd-dab6003742c3)
- [getCwdPath(int)](#getcwdpath-c4bbc6c8fa08)
- [getElem(int, ConfPath)](#getelem-174690e33535)
- [getElem(int, String, Object[])](#getelem-1415a215bb24)
- [getMountId(int, ConfPath)](#getmountid-bcb13e926380)
- [getMyUserSession()](#getmyusersession-23a1a3d293a2)
- [getNext(MaapiCursor)](#getnext-94186d85d070)
- [getNsList()](#getnslist-0345f486e876)
- [getNumberOfInstances(int, ConfPath)](#getnumberofinstances-5a101b02e1dd)
- [getNumberOfInstances(int, String, Object[])](#getnumberofinstances-f0813061766e)
- [getObject(int, String, Object[])](#getobject-8f535bb4e0e8)
- [getObjects(MaapiCursor, int, int)](#getobjects-8d530442b539)
- [getReadIntent(int)](#getreadintent-eaf0d52ae3f6)
- [getRollbackId(int)](#getrollbackid-cae38eb78c8e)
- [getRunningDbStatus()](#getrunningdbstatus-241216af056b)
- [getSchemas()](#getschemas-7b275bd8ca12)
- [getSocket()](#getsocket-d7da2de81b81)
- [getSource(SocketAddress)](#getsource-6929fe0dea80)
- [getTransactionMode(int)](#gettransactionmode-31871babf3ac)
- [getTransParams(int)](#gettransparams-05113dc340f5)
- [getUserSession(int)](#getusersession-ce8473a1e046)
- [getUserSessionIdentification(int)](#getusersessionidentification-b5dbad8ef1a8)
- [getUserSessionOpaque(int)](#getusersessionopaque-c7ddb1c3a4e0)
- [getUserSessions()](#getusersessions-4b7007a2fe5d)
- [getValues(int, T, ConfPath)](#getvalues-4c7d173a5b38)
- [getValues(int, T, String, Object[])](#getvalues-33bfcad43c75)
- [getValues(int, T[], ConfPath)](#getvalues-62ed915288bb)
- [getValues(int, T[], String, Object[])](#getvalues-975e171e6ece)
- [hideGroup(int, String)](#hidegroup-70455383c885)
- [init()](#init-e3919b885d98)
- [initUpgrade(int, int)](#initupgrade-56c030ff2fc5)
- [inputStreamResult(int, int)](#inputstreamresult-abcc2b3f4a7e)
- [insert(int, boolean, String, Object[])](#insert-b0095c025c86)
- [insert(int, String, Object[])](#insert-8aab317d3021)
- [isCandidateModified()](#iscandidatemodified-a17e4d850f34)
- [isLockSet(int)](#islockset-66fbf05334ff)
- [isRunningModified()](#isrunningmodified-53004bab212a)
- [iterate(int, Object, EnumSet<ConfIterateFlags>, MaapiIterate, ConfPath)](#iterate-f6278b19bafb)
- [killUserSession(int)](#killusersession-4c91da836162)
- [loadConfig(int, EnumSet<MaapiConfigFlag>, String)](#loadconfig-0cd0ed8a64d0)
- [loadConfigCmds(int, EnumSet<MaapiConfigFlag>, String, String, Object[])](#loadconfigcmds-4c47d55451a5)
- [loadConfigStream(int, EnumSet<MaapiConfigFlag>)](#loadconfigstream-5250b4e7adae)
- [loadSchemas()](#loadschemas-84ad3496a6f3)
- [loadSchemas(String[])](#loadschemas-57d79f485410)
- [lock(int)](#lock-51793ae61d79)
- [lockPartial(int, String)](#lockpartial-1825ddb23210)
- [lockPartial(int, String[])](#lockpartial-855a7312fb52)
- [move(int, ConfKey, String, Object[])](#move-af8f50a08374)
- [move(int, String, String, Object[])](#move-9df5c1c81f8c)
- [moveOrdered(int, MoveWhereFlag, ConfKey, String, Object[])](#moveordered-f7458c93e17a)
- [ncsApplyTemplate(int, String, ConfPath, Properties, boolean)](#ncsapplytemplate-17a602f0e3cd)
- [ncsApplyTemplate(int, String, ConfPath, Properties, String, boolean)](#ncsapplytemplate-66d4f212d128)
- [ncsGetTemplateVariables(String)](#ncsgettemplatevariables-e56e448a0ec3)
- [ncsGetTemplateVariables(String, TemplateType)](#ncsgettemplatevariables-1f97e9c7f29b)
- [ncsRunWithRetry(MaapiRetryableOp)](#ncsrunwithretry-1fda8501d8e3)
- [ncsRunWithRetry(MaapiRetryableOp, int, CommitParams)](#ncsrunwithretry-a6de34ccab91)
- [ncsRunWithRetry(MaapiRetryableOp, int, CommitParams, int, EnumSet<MaapiFlag>)](#ncsrunwithretry-c4e298221362)
- [ncsTemplates()](#ncstemplates-e5c7d0011567)
- [netconfSSHCallHome(ConfObject, int)](#netconfsshcallhome-30acdb9b05a8)
- [netconfSSHCallHomeOpaque(ConfObject, String, int)](#netconfsshcallhomeopaque-199c8be24507)
- [newCursor(int, ConfPath)](#newcursor-8b18daa02ae5)
- [newCursor(int, String, Object[])](#newcursor-8f0d3924978a)
- [newCursorWithFilter(int, String, ConfPath)](#newcursorwithfilter-59d94dbcd3ed)
- [newCursorWithFilter(int, String, String, Object[])](#newcursorwithfilter-6c2962969949)
- [performUpgrade(String[])](#performupgrade-f3fe8fdbc4c1)
- [popd(int)](#popd-a8354c7232ff)
- [prepareTrans(int)](#preparetrans-f5669cbf3002)
- [prepareTrans(int, int)](#preparetrans-c4877a24ca10)
- [prioMessage(String, String)](#priomessage-8b6028d17d54)
- [pushd(int, String, Object[])](#pushd-217b8af1923d)
- [queryStart(int, String, String, int, int, List<String>, Class<T>)](#querystart-87abe9e2ad2a)
- [queryStart(int, String, String, int, int, List<String>, List<String>, boolean, Class<T>)](#querystart-5aa1b3de25ea)
- [reloadConfig()](#reloadconfig-f726d13d089d)
- [reloadSchemas()](#reloadschemas-80f123378fc4)
- [reloadSchemas(String[])](#reloadschemas-d9542a782000)
- [reopenLogs()](#reopenlogs-41bee863dbe9)
- [reportProgress(int, Verbosity, String)](#reportprogress-9b1dc56091be)
- [requestAction(ConfXMLParam[], int, String, Object[])](#requestaction-82e02abb5cf9)
- [requestAction(ConfXMLParam[], String, Object[])](#requestaction-76bbfd533fa4)
- [requestAction(List<ConfXMLParam>, int, String, Object[])](#requestaction-5870f5cf33eb)
- [requestAction(List<ConfXMLParam>, String, Object[])](#requestaction-71188d0da7ce)
- [requestActionTh(int, ConfXMLParam[], String, Object[])](#requestactionth-966694378325)
- [requestActionTh(int, List<ConfXMLParam>, String, Object[])](#requestactionth-07b010c43efc)
- [requestTerm(int, ConfEObject)](#requestterm-a8fce80da6f1)
- [requestTerm(int, int, boolean, ConfEObject)](#requestterm-9be76a263e1e)
- [revert(int)](#revert-72c8f2d56330)
- [rollbackConfig(int, String, String[])](#rollbackconfig-859e41b41c22)
- [safeCreate(int, ConfPath)](#safecreate-83138734c168)
- [safeCreate(int, String, Object[])](#safecreate-fd641bd6a26a)
- [safeDelete(int, String, Object[])](#safedelete-63e20fc90d9c)
- [safeGetElem(int, ConfPath)](#safegetelem-dae7a1dfe2d6)
- [safeGetElem(int, String, Object[])](#safegetelem-f0faee5cac1f)
- [safeGetObject(int, String, Object[])](#safegetobject-adb85d9a574d)
- [saveConfig(int, EnumSet<MaapiConfigFlag>)](#saveconfig-d9663132ee61)
- [saveConfig(int, EnumSet<MaapiConfigFlag>, ConfPath)](#saveconfig-b6febd268628)
- [saveConfig(int, EnumSet<MaapiConfigFlag>, String, Object[])](#saveconfig-3292de5923e0)
- [setAttr(int, ConfAttributeValue, String, Object[])](#setattr-690596d9efb4)
- [setComment(int, String)](#setcomment-c4c683b45db1)
- [setDelayedWhen(int, boolean)](#setdelayedwhen-38f32854fd19)
- [setElem(int, ConfObject, ConfPath)](#setelem-cec1d194abc2)
- [setElem(int, ConfObject, String, Object[])](#setelem-d51f890ac736)
- [setElem(int, String, ConfPath)](#setelem-6e3977480252)
- [setElem(int, String, String, Object[])](#setelem-915c0b578eea)
- [setFlags(int, EnumSet<MaapiFlag>)](#setflags-1158755c6ac8)
- [setLabel(int, String)](#setlabel-929d364c78d7)
- [setNamespace(int, int)](#setnamespace-d58798edaf04)
- [setNamespace(int, String)](#setnamespace-edc25cbc3dfd)
- [setNextUserSessionId(int)](#setnextusersessionid-f0914dda055b)
- [setObject(int, ConfObject[], String, Object[])](#setobject-93cfe3ccc1a9)
- [setReadIntent(int, List<String>)](#setreadintent-8a615528e4d7)
- [setReadIntent(int, String)](#setreadintent-66ba57478cb6)
- [setReadOnlyMode(boolean)](#setreadonlymode-fde2440b8220)
- [setRunningDbStatus(int)](#setrunningdbstatus-fa121ea57064)
- [setUserSession(int)](#setusersession-ff36c06a3ef4)
- [setValues(int, ConfXMLParam[], ConfPath)](#setvalues-27a83fbfcc37)
- [setValues(int, ConfXMLParam[], String, Object[])](#setvalues-5a5e209f0f09)
- [setValues(int, List<ConfXMLParam>, ConfPath)](#setvalues-79c83d25babb)
- [setValues(int, List<ConfXMLParam>, String, Object[])](#setvalues-881fed8155cc)
- [sharedCreate(int, ConfPath)](#sharedcreate-4e9109f58b36)
- [sharedCreate(int, String, Object[])](#sharedcreate-a1cc616c4565)
- [sharedSetElem(int, ConfObject, ConfPath)](#sharedsetelem-5fcf55dfed0c)
- [sharedSetElem(int, ConfObject, String, Object[])](#sharedsetelem-f484c0aeee76)
- [sharedSetElem(int, String, String, Object[])](#sharedsetelem-33c0b474ee87)
- [sharedSetValues(int, ConfXMLParam[], ConfPath)](#sharedsetvalues-d20611e05b40)
- [sharedSetValues(int, ConfXMLParam[], String, Object[])](#sharedsetvalues-db5ccd228a3e)
- [sharedSetValues(int, List<ConfXMLParam>, ConfPath)](#sharedsetvalues-bfaa695e71b3)
- [sharedSetValues(int, List<ConfXMLParam>, String, Object[])](#sharedsetvalues-849a21e341c1)
- [snmpaReload(boolean)](#snmpareload-4fd9a56bd262)
- [snmpSendNotification(String, String, String, SnmpVarbind[])](#snmpsendnotification-22a7246d4ba1)
- [startPhase(int)](#startphase-752e85521d00)
- [startPhase(int, boolean)](#startphase-cef9a0a12f3b)
- [startSpan(int, Verbosity, String, ConfPath, Attributes, Span[])](#startspan-e2d5c1669c4e)
- [startTrans(int, int)](#starttrans-5b69ebc4af09)
- [startTrans(int, int, String, String, String, String)](#starttrans-ced8c0d5d1ae)
- [startTrans2(int, int, int)](#starttrans2-f2ba2eb1c7f0)
- [startTransFlags(int, int, int, EnumSet<MaapiFlag>)](#starttransflags-cd1ec7f9d8f8)
- [startTransInTrans(int, int, int)](#starttransintrans-4e53d8f12a29)
- [startUserSession(String, InetAddress, String, String[], MaapiUserSessionFlag)](#startusersession-2fe44878630c)
- [startUserSession(String, InetAddress, String, String[], MaapiUserSessionFlag, String, String, String, String)](#startusersession-97fb0f3aee95)
- [startUserSession(String, String)](#startusersession-d1c404925ea5)
- [startUserSession(String, String, String[])](#startusersession-e8885f96f69b)
- [startUserSession(String, String, String[], SocketAddress)](#startusersession-1afffb54d30c)
- [startUserSession(String, String, String[], SocketAddress, MaapiUserSessionFlag)](#startusersession-677e9394622e)
- [startUserSession(String, String, String[], SocketAddress, MaapiUserSessionFlag, String, String, String, String)](#startusersession-e4130cb0aace)
- [stop()](#stop-a62ecc446f97)
- [stop(boolean)](#stop-b13ec8bf1f99)
- [sysMessage(String, String)](#sysmessage-a411a01e7bae)
- [toString()](#tostring-e9d48c5503ef)
- [unhideGroup(int, String)](#unhidegroup-55fe09fa160b)
- [unlock(int)](#unlock-70caddb6e1e6)
- [unlockPartial(int)](#unlockpartial-15faebb90da7)
- [userMessage(String, String, String)](#usermessage-36ed05d12234)
- [validateToken(String, InetAddress, int, String, MaapiUserSessionFlag)](#validatetoken-edde5ce7f1c6)
- [validateTrans(int, boolean, boolean)](#validatetrans-8767da488cef)
- [waitStart(int)](#waitstart-66da4d687e96)
- [waitStarted()](#waitstarted-20657441709c)
- [xpath2kpath(String)](#xpath2kpath-bc8a863e2978)
- [xpath2kpath_th(int, String)](#xpath2kpath_th-5ce14c8a3095)
- [xpathEval(int, MaapiXPathEvalResult, MaapiXPathEvalTrace, String, Object, String, Object[])](#xpatheval-8e8640817c0b)
- [xpathEvalExpr(int, String, MaapiXPathEvalTrace, String, Object[])](#xpathevalexpr-32b3542af9d6)

**Nested Types**:

- [Progress](Maapi/Progress.md#progress-512cd01a4025)
- [TemplateType](Maapi/TemplateType.md#templatetype-08e95c149f38)
- [Verbosity](Maapi/Verbosity.md#verbosity-a9c618ec424f)

## Constructors

### Maapi(Socket) <a href="#maapi-8dc69723d5bc" id="maapi-8dc69723d5bc"></a>

```java
public Maapi(java.net.Socket socket) throws com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Creates a new instance of `Maapi` supplying a established
 open socket to ConfD/NCS daemon.

 Since the ConfD/NCS daemon expects initialization within
 5 seconds after a new socket is established this constructor should be
 called directly for a new socket. For instance:
 `
 // int port = Conf.PORT; // ConfD TCP;
 //   NCS uses Conf.NCS_PATH (Unix socket)
 Maapi maapi = new Maapi(new Socket("localhost", port));
 `

 When establishing a connection to ConfD/NCS the
 [`MaapiSchemas`](MaapiSchemas.md#maapischemas-821ac70b83b7) will be loaded once automatically
 by the library.

 If encrypted communication towards ConfD/NCS is desired,
 an environment variable "CONFD_IPC_ACCESS_FILE" or "NCS_IPC_ACCESS_FILE"
 need to be set.
 This variable is expected to point to a file containing a secret salt.
  example:
     export CONFD_IPC_ACCESS_FILE=./secret_file.txt
 An alternative to the environment variable is to set an java system
 property with the same name pointing to the file.

**Parameters**

- `java.net.Socket socket` - A socket connected to ConfD/NCS.

**Throws**

- `ConfException` - If ConfD/NCS refuses to establish
         connection the reason could be obtained through
         `ConfException#getMessage()`
- `ConfException` - signals problem connecting to ConfD/NCS

### Maapi(SocketAddress) <a href="#maapi-741da54ce5b9" id="maapi-741da54ce5b9"></a>

```java
public Maapi(
    java.net.SocketAddress address
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Creates a new instance of `Maapi` supplying an address
 to the ConfD/NCS server.

 When establishing a connection to ConfD/NCS the
 [`MaapiSchemas`](MaapiSchemas.md#maapischemas-821ac70b83b7) will be loaded once automatically
 by the library.

 If encrypted communication towards ConfD/NCS is desired,
 an environment variable "CONFD_IPC_ACCESS_FILE" or "NCS_IPC_ACCESS_FILE"
 need to be set.
 This variable is expected to point to a file containing a secret salt.
  example:
     export CONFD_IPC_ACCESS_FILE=./secret_file.txt
 An alternative to the environment variable is to set an java system
 property with the same name pointing to the file.

**Parameters**

- `java.net.SocketAddress address` - An address to connect to

**Throws**

- `ConfException` - If ConfD/NCS refuses to establish
         connection the reason could be obtained through
         `ConfException#getMessage()`
- `IOException` - signals I/O exception when creating the underlying
                     socket
- `ConfException` - signals problems creating the underlying socket or
                       connecting to ConfD/NCS


## Fields

### COMMIT_NCS_CONFIRM_NETWORK_STATE <a href="#commit_ncs_confirm_network_state-3fa6237977c8" id="commit_ncs_confirm_network_state-3fa6237977c8"></a>

```java
public static final int COMMIT_NCS_CONFIRM_NETWORK_STATE = 268435456;
```

### COMMIT_NCS_CONFIRM_NETWORK_STATE_RE_EVALUATE_POLICIES <a href="#commit_ncs_confirm_network_state_re_evaluate_policies-7b6a618d6004" id="commit_ncs_confirm_network_state_re_evaluate_policies-7b6a618d6004"></a>

```java
public static final int COMMIT_NCS_CONFIRM_NETWORK_STATE_RE_EVALUATE_POLICIES = 536870912;
```

### COMMIT_NCS_NO_DEPLOY <a href="#commit_ncs_no_deploy-fe5d11934928" id="commit_ncs_no_deploy-fe5d11934928"></a>

```java
public static final int COMMIT_NCS_NO_DEPLOY = 8;
```

### COMMIT_NCS_NO_LSA <a href="#commit_ncs_no_lsa-88834afe2914" id="commit_ncs_no_lsa-88834afe2914"></a>

```java
public static final int COMMIT_NCS_NO_LSA = 1048576;
```

### COMMIT_NCS_NO_NETWORKING <a href="#commit_ncs_no_networking-5337030cc5aa" id="commit_ncs_no_networking-5337030cc5aa"></a>

```java
public static final int COMMIT_NCS_NO_NETWORKING = 16;
```

### COMMIT_NCS_NO_OUT_OF_SYNC_CHECK <a href="#commit_ncs_no_out_of_sync_check-4ff4693de193" id="commit_ncs_no_out_of_sync_check-4ff4693de193"></a>

```java
public static final int COMMIT_NCS_NO_OUT_OF_SYNC_CHECK = 32;
```

### COMMIT_NCS_NO_OVERWRITE_WRITE_AND_FULL_READ_SET <a href="#commit_ncs_no_overwrite_write_and_full_read_set-47609363ce3c" id="commit_ncs_no_overwrite_write_and_full_read_set-47609363ce3c"></a>

```java
public static final int COMMIT_NCS_NO_OVERWRITE_WRITE_AND_FULL_READ_SET = 1073741824;
```

### COMMIT_NCS_NO_OVERWRITE_WRITE_AND_SERVICE_READ_SET <a href="#commit_ncs_no_overwrite_write_and_service_read_set-599b4fc50ee9" id="commit_ncs_no_overwrite_write_and_service_read_set-599b4fc50ee9"></a>

```java
public static final int COMMIT_NCS_NO_OVERWRITE_WRITE_AND_SERVICE_READ_SET = -2147483648;
```

### COMMIT_NCS_NO_OVERWRITE_WRITE_SET_ONLY <a href="#commit_ncs_no_overwrite_write_set_only-0228b05fbdba" id="commit_ncs_no_overwrite_write_set_only-0228b05fbdba"></a>

```java
public static final int COMMIT_NCS_NO_OVERWRITE_WRITE_SET_ONLY = 1024;
```

### COMMIT_NCS_NO_REVISION_DROP <a href="#commit_ncs_no_revision_drop-99240a81765e" id="commit_ncs_no_revision_drop-99240a81765e"></a>

```java
public static final int COMMIT_NCS_NO_REVISION_DROP = 4;
```

Flags to use in:
   [`applyTrans(int,boolean,int)`](Maapi.md#applytrans-5868175f1f0b)
   [`prepareTrans(int,int)`](Maapi.md#preparetrans-c4877a24ca10)

### COMMIT_NCS_RECONCILE_ATTACH_NON_SERVICE_CONFIG <a href="#commit_ncs_reconcile_attach_non_service_config-8cd06f654b36" id="commit_ncs_reconcile_attach_non_service_config-8cd06f654b36"></a>

```java
public static final int COMMIT_NCS_RECONCILE_ATTACH_NON_SERVICE_CONFIG = 67108864;
```

### COMMIT_NCS_RECONCILE_DETACH_NON_SERVICE_CONFIG <a href="#commit_ncs_reconcile_detach_non_service_config-c67c803d1de5" id="commit_ncs_reconcile_detach_non_service_config-c67c803d1de5"></a>

```java
public static final int COMMIT_NCS_RECONCILE_DETACH_NON_SERVICE_CONFIG = 134217728;
```

### COMMIT_NCS_RECONCILE_DISCARD_NON_SERVICE_CONFIG <a href="#commit_ncs_reconcile_discard_non_service_config-c666106de8bd" id="commit_ncs_reconcile_discard_non_service_config-c666106de8bd"></a>

```java
public static final int COMMIT_NCS_RECONCILE_DISCARD_NON_SERVICE_CONFIG = 33554432;
```

### COMMIT_NCS_RECONCILE_KEEP_NON_SERVICE_CONFIG <a href="#commit_ncs_reconcile_keep_non_service_config-920607f60083" id="commit_ncs_reconcile_keep_non_service_config-920607f60083"></a>

```java
public static final int COMMIT_NCS_RECONCILE_KEEP_NON_SERVICE_CONFIG = 16777216;
```

### COMMIT_NCS_USE_LSA <a href="#commit_ncs_use_lsa-998f30efc74f" id="commit_ncs_use_lsa-998f30efc74f"></a>

```java
public static final int COMMIT_NCS_USE_LSA = 524288;
```

### IA_CLIENT_MAAPI <a href="#ia_client_maapi-abd097089172" id="ia_client_maapi-abd097089172"></a>

```java
public static final int IA_CLIENT_MAAPI = 7;
```

### MAAPI_UPGRADE_KILL_ON_TIMEOUT <a href="#maapi_upgrade_kill_on_timeout-0175839f1d11" id="maapi_upgrade_kill_on_timeout-0175839f1d11"></a>

```java
public static final int MAAPI_UPGRADE_KILL_ON_TIMEOUT = 1;
```

Flag to use in initUpgrade()

### maapiSchemasClass <a href="#maapischemasclass-28c23f540519" id="maapischemasclass-28c23f540519"></a>

```java
public static Class<? extends com.tailf.maapi.MaapiSchemas> maapiSchemasClass = null;
```

Types: [MaapiSchemas](MaapiSchemas.md#maapischemas-821ac70b83b7)

Class used for MaapiSchemas implementation, if overridden, the
 overridden class must extend MaapiSchemas.


## Methods

### aaaReload(boolean) <a href="#aaareload-7223d1ffcc54" id="aaareload-7223d1ffcc54"></a>

```java
public synchronized void aaaReload(
    boolean synchronous
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

When the ConfD/NCS AAA tree is populated by an external data provider,
 this method can be used by the data provider to notify ConfD/NCS when
 there is a change to the AAA data. I.e. it is an alternative to executing
 the command `confd --clear-aaa-cache` or `ncs
 --clear-aaa-cache`.

**Parameters**

- `boolean synchronous` - Whether to wait for the daemon to complete reloading
           the AAA data before returning.

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### abortTrans(int) <a href="#aborttrans-d310b7982d91" id="aborttrans-d310b7982d91"></a>

```java
public synchronized void abortTrans(
    int tid
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Abort a transaction specified by transaction handle `tid`.

 Called if a two-phase commit should be aborted after having performed
 `validateTrans` or `prepareTrans`.

**Parameters**

- `int tid` - Transaction Identifier

**Throws**

- `MaapiException` - If the abort operation fails
- `IOException` - Signals I/O exception on the underlying socket

### abortUpgrade() <a href="#abortupgrade-4c0f0c13e771" id="abortupgrade-4c0f0c13e771"></a>

```java
public synchronized void abortUpgrade() throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Note, This method is only applicable for Confd. For NCS, the In-service
 Data Model Upgrades are directly correlated to NCS packages and have
 more high-level support.

 Calling this function at any point before the call of commitUpgrade()
 will abort the upgrade. Note! abortUpgrade() should NOT be called if any
 of the three previous functions fail - in that case, the server will do
 an internal abort of the upgrade.

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### applyTrans(int, boolean) <a href="#applytrans-94f52f2648ce" id="applytrans-94f52f2648ce"></a>

```java
public synchronized void applyTrans(
    int tid,
    boolean keepOpen
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Apply a current transaction with transaction handle `tid`.

 Invoking the transaction methods in exactly the right order can
 be a bit complicated.

 The right order to invoke the methods is:


- [`validateTrans(int,boolean,boolean)`](Maapi.md#validatetrans-8767da488cef)
- [`prepareTrans(int)`](Maapi.md#preparetrans-f5669cbf3002)
- [`commitTrans(int)`](Maapi.md#committrans-edd7d497abaf)
- [`abortTrans(int)`](Maapi.md#aborttrans-d310b7982d91)



 Usually we do not require this fine grained control
 over the two-phase commit protocol. It is easier to use
 `applyTrans`
 which validates, prepares and eventually aborts or commits.

 A call to `applyTrans` must also eventually be
 followed by a call to [`finishTrans(int)`](Maapi.md#finishtrans-0f920518d3c3) which will terminate
 the transaction.

 For a readonly transaction, i.e. one started with
 [`Conf#MODE_READ`](../conf/Conf.md#mode_read-1e4ced2f015c), or for a read-write transaction where we
 haven't actually done any writes, we do not
 need to call any of the validate/prepare/commit/abort or apply methods,
 since there is nothing for them to do.
 Calling `finishTrans` to terminate the
 transaction is sufficient.

 The parameter `keepopen` can optionally be set to true,
 then the changes to the transaction are not discarded if
 validation fails. This feature is typically used by
 management applications that wish to present the validation errors to
 an operator and allow the operator to fix the validation errors and
 then later retry the apply
 sequence.

**Parameters**

- `int tid` - Transaction id of transaction to commit
- `boolean keepOpen` - If validation fails should the transaction be kept
            open or not

**Throws**

- `ConfException` - If the transaction is in badstate, for
 example if `applyTrans` is called twice.
- `IOException` - Signals I/O exception on the underlying socket

### applyTrans(int, boolean, int) <a href="#applytrans-5868175f1f0b" id="applytrans-5868175f1f0b"></a>

```java
public synchronized void applyTrans(
    int tid,
    boolean keepOpen,
    int flags
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Apply a current transaction with transaction handle `tid`
 with additional flags (NCS Specific).

 Some NCS specific flags can be used:

 [`COMMIT_NCS_NO_REVISION_DROP`](Maapi.md#commit_ncs_no_revision_drop-99240a81765e) means that NCS will not
 run its data model revision algorithm, thus requiring all participating
 managed devices to have all parts of the data models for all data
 contained in this transaction, i.e., this flag forces NCS to never
 silently drop any data set operations towards a device.

 [`COMMIT_NCS_NO_DEPLOY`](Maapi.md#commit_ncs_no_deploy-fe5d11934928) means that NCS will commit without
 running the FASTMAP algorithm, i.e., write the
 service instance data without activating the service(s).
 The service(s) can later be re-deployed to write the
 changes of the service(s) to the network.

 [`COMMIT_NCS_NO_NETWORKING`](Maapi.md#commit_ncs_no_networking-5337030cc5aa) means that the NCS device
 manager will not see these changes. Even if transaction manipulates
 data below /devices/device/config, nothing will be sent to the
 managed devices. Thus this is a way to manipulate CDB in NCS without
 generating any southbound traffic.

 [`COMMIT_NCS_NO_OUT_OF_SYNC_CHECK`](Maapi.md#commit_ncs_no_out_of_sync_check-4ff4693de193) means that NCS will
 continue with the transaction even if NCS detects that a device's
 configuration is out of sync. The device's sync state is assumed
 to be unknown after such commit and the stored transaction id
 value is cleared.

 [`COMMIT_NCS_NO_OVERWRITE_WRITE_SET_ONLY`](Maapi.md#commit_ncs_no_overwrite_write_set_only-0228b05fbdba) means that NCS will
 check that the data that should be modified has not changed on the
 device compared to NCS's view of the data. This is
 fine-granular sync check; NCS verifies that NCS and the
 device is in sync regarding the data that will be modified.
 If they are not in sync, the transaction is aborted.

 [`COMMIT_NCS_NO_OVERWRITE_WRITE_AND_FULL_READ_SET`](Maapi.md#commit_ncs_no_overwrite_write_and_full_read_set-47609363ce3c) means that
 NCS will check that the data that should be modified or any data read
 when computing the device modifications has not changed on
 the device compared to NCS's view of the data. This is
 fine-granular sync check; NCS verifies that NCS and the
 device is in sync regarding the data that will be modified.
 If they are not in sync, the transaction is aborted.

 [`COMMIT_NCS_NO_OVERWRITE_WRITE_AND_SERVICE_READ_SET`](Maapi.md#commit_ncs_no_overwrite_write_and_service_read_set-599b4fc50ee9) means that
 NCS will check that the data that should be modified or any data read
 by services run in the transaction has not changed on
 the device compared to NCS's view of the data. This is
 fine-granular sync check; NCS verifies that NCS and the
 device is in sync regarding the data that will be modified.
 If they are not in sync, the transaction is aborted.

 [`COMMIT_NCS_USE_LSA`](Maapi.md#commit_ncs_use_lsa-998f30efc74f) means that NCS will force handling LSA
 nodes as such.

 [`COMMIT_NCS_NO_LSA`](Maapi.md#commit_ncs_no_lsa-88834afe2914) means that NCS will not handle any of
 the LSA nodes as such. These nodes will be handled as any other device.


 [`COMMIT_NCS_RECONCILE_KEEP_NON_SERVICE_CONFIG`](Maapi.md#commit_ncs_reconcile_keep_non_service_config-920607f60083) means that all
 data which existed before the service was created will now be owned by
 the service. When the service is removed that data will also be removed.
 In technical terms the reference count will be decreased by one for
 everything which existed. Note that this flag has no effect on initial
 service creation. Any manually configured data that exists below in the
 configuration tree will be kept.


 [`COMMIT_NCS_RECONCILE_DISCARD_NON_SERVICE_CONFIG`](Maapi.md#commit_ncs_reconcile_discard_non_service_config-c666106de8bd) means that
 all data which existed before the service was created will now be owned
 by the service. When the service is removed that data will also be
 removed. In technical terms the reference count will be decreased by one
 for everything which existed. Note that this flag has no effect on
 initial service creation. Any manually configured data that exists below
 in the configuration tree will be discarded.


 The flags are bits and can be ORed together.

**Parameters**

- `int tid` - Transaction id of transaction to commit
- `boolean keepOpen` - If validation fails should the transaction be kept
                 open or not
- `int flags` - Bitwise ORed flags

**Throws**

- `MaapiException` - If the transaction cannot be applied
- `IOException` - Signals I/O exception on the underlying socket

### applyTransParams(int, boolean, CommitParams) <a href="#applytransparams-6c20b7896663" id="applytransparams-6c20b7896663"></a>

```java
public synchronized com.tailf.maapi.ApplyResult applyTransParams(
    int tid,
    boolean keepOpen,
    com.tailf.maapi.CommitParams params
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ApplyResult](ApplyResult.md#applyresult-77b049ed4f17), [CommitParams](CommitParams.md#commitparams-819d9b5483cc), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Apply a current transaction with transaction handle `tid`
 with additional NCS specific parameters.

**Parameters**

- `int tid` - Transaction id of transaction to commit
- `boolean keepOpen` - If validation fails should the transaction be kept
                 open or not
- `com.tailf.maapi.CommitParams params` - Commit parameters, see [`CommitParams`](CommitParams.md#commitparams-819d9b5483cc)

**Returns:** An instance of [`DryRunResult`](DryRunResult.md#dryrunresult-28828490822f) if dry-run was requested.
         An instance of [`CommitQueueResult`](CommitQueueResult.md#commitqueueresult-0daa10abf91a) if commit through
         commit queue was requested. Otherwise an instance of
         [`ApplyResult`](ApplyResult.md#applyresult-77b049ed4f17).

**Throws**

- `IOException` - Signals I/O exception on the underlying socket
- `ConfException` - Signals protocol/usage error.

### attach(int, int) <a href="#attach-0e2e60b563af" id="attach-0e2e60b563af"></a>

```java
public synchronized void attach(
    int tid,
    int nsi
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Same as [`attach(int, int, int)`](Maapi.md#attach-59771e44614d) with the exception
 that the User session id is implicit for the attached transaction.

**Parameters**

- `int tid` - Transaction identifier
- `int nsi` - Namespace identifier. Use 0 if we don't care which
            namespace is the default to choose if path elements
            are not properly prefixed.

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### attach(int, int, int) <a href="#attach-59771e44614d" id="attach-59771e44614d"></a>

```java
public synchronized void attach(
    int tid,
    int nsi,
    int usid
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Attach to a current transaction.

 While a transaction is executing, we have a number of situations
 where we wish to invoke user Java code which can interact in the
 transaction. One such situation is when we wish to write semantic
 validation code which is invoked in the validation phase of a
 transaction.

  This code needs to execute within the context of the executing
 transaction, it must thus have access to the "shadow" storage where
  all not-yet-committed data is kept.


 This method attaches to a existing transaction. See user guide chapter
 "Semantic Validation" for example code.


 Another situation where we wish to attach to the executing transaction is
 when we are using the notifications API and subscribe to notification of
 type `NOTIF_COMMIT_DIFF` and wish to read the committed
 diffs from the transaction.

**Parameters**

- `int tid` - Transaction identifier
- `int nsi` - Namespace identifier. Use 0 if we don't care which
            namespace is the default to choose if path elements
            are not properly prefixed.
- `int usid` - Usid

**Throws**

- `MaapiException` - If attachment to the transaction fails
- `IOException` - Signals I/O exception on the underlying socket

### attach(int, String) <a href="#attach-39f7255284db" id="attach-39f7255284db"></a>

```java
public synchronized void attach(
    int tid,
    String ns
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Same as [`attach(int, String, int)`](Maapi.md#attach-cb83c464b289) with the exception
 that the User session id is implicit for the attached transaction.

**Parameters**

- `int tid` - Transaction identifier
- `String ns` - Namespace identifier

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### attach(int, String, int) <a href="#attach-cb83c464b289" id="attach-cb83c464b289"></a>

```java
public synchronized void attach(
    int tid,
    String ns,
    int usid
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Attach to a current transaction.

 While a transaction is executing, we have a number of situations
 where we wish to invoke user Java code which can interact in the
 transaction. One such situation is when we wish to write semantic
 validation code which is invoked in the validation phase of a
 transaction.

  This code needs to execute within the context of the executing
 transaction, it must thus have access to the "shadow" storage where
  all not-yet-committed data is kept.


 This method attaches to a existing transaction. See user guide chapter
 "Semantic Validation" for example code.


 Another situation where we wish to attach to the executing transaction is
 when we are using the notifications API and subscribe to notification of
 type `NOTIF_COMMIT_DIFF` and wish to read the committed
 diffs from the transaction.

**Parameters**

- `int tid` - Transaction identifier
- `String ns` - Namespace identifier
- `int usid` - Usid

**Throws**

- `MaapiException` - If attachment to the transaction fails
- `IOException` - Signals I/O exception on the underlying socket

### attachInit() <a href="#attachinit-11064448310c" id="attachinit-11064448310c"></a>

```java
public synchronized int attachInit() throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Attach to transaction available in phase0.

 This method is used to attach the Maapi socket to the special
 transaction available in phase0 used for CDB initialization and upgrade.

**Returns:** the transaction handle for the init transaction

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket.

### authenticate(String, String) <a href="#authenticate-9b081cc66ee1" id="authenticate-9b081cc66ee1"></a>

```java
public synchronized com.tailf.maapi.MaapiAuthentication authenticate(
    String user,
    String passwd
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [MaapiAuthentication](MaapiAuthentication.md#maapiauthentication-b8288dadf67d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

If we are implementing a proprietary Management Agent with MAAPI API,
 the method `startUserSession(String,String,String[],SocketAddress,
 MaapiUserSessionFlag)` requires the application to tell ConfD/NCS
 which groups the user are member of.

 ConfD/NCS itself has the capability to authenticate users.
 It is possible for a MAAPI application to let
 ConfD/NCS authenticate the user, as per the AAA configuration in the
 system configuration file

**Parameters**

- `String user` - username to authenticate
- `String passwd` - password for authentication

**Returns:** a MaapiAuthentication instance

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### authenticate2(String, String, InetAddress, int, String, MaapiUserSessionFlag) <a href="#authenticate2-84062b58a524" id="authenticate2-84062b58a524"></a>

```java
public synchronized com.tailf.maapi.MaapiAuthentication authenticate2(
    String user,
    String passwd,
    java.net.InetAddress srcAddr,
    int srcPort,
    String context,
    com.tailf.maapi.MaapiUserSessionFlag proto
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [MaapiAuthentication](MaapiAuthentication.md#maapiauthentication-b8288dadf67d), [MaapiUserSessionFlag](MaapiUserSessionFlag.md#maapiusersessionflag-ee298af54ca4), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

If we are implementing a proprietary Management Agent with MAAPI API, the
 method `startUserSession(String,String,String[],SocketAddress,
 MaapiUserSessionFlag)` requires the application to tell ConfD/NCS
 which groups the user are member of.

 ConfD/NCS itself has the capability to authenticate users.
 It is possible for a MAAPI application to let
 ConfD/NCS authenticate the user, as per the AAA configuration in the
 system configuration file

**Parameters**

- `String user` - Username to authenticate
- `String passwd` - Password for authentication
- `java.net.InetAddress srcAddr` - Source IP address
- `int srcPort` - Source port number
- `String context` - AAA context
- `com.tailf.maapi.MaapiUserSessionFlag proto` - Protocol used for connection

**Returns:** a MaapiAuthentication instance

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### candidateAbortCommit() <a href="#candidateabortcommit-2b2c1c4204e0" id="candidateabortcommit-2b2c1c4204e0"></a>

```java
public synchronized void candidateAbortCommit() throws java.io.IOException, com.tailf.conf.ConfException
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This function cancels a pending confirmed commit.

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### candidateAbortCommitPersistent(String) <a href="#candidateabortcommitpersistent-5c9a841d3003" id="candidateabortcommitpersistent-5c9a841d3003"></a>

```java
public synchronized void candidateAbortCommitPersistent(
    String persistId
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Cancel an ongoing persistent commit with the cookie given by persistId.
 (If persistId is null, it does the same as
 [`candidateAbortCommit()`](Maapi.md#candidateabortcommit-2b2c1c4204e0).

**Parameters**

- `String persistId` - cookie for ongoing persistent confirmed commit

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - If error. If the `errorCode` for the
 `ConfException` is `ConfException.ERR_NOEXISTS`
 it means that there is an ongoing persistent
 confirmed commit, but `persistId` did not give the
 right cookie for it.

### candidateCommit() <a href="#candidatecommit-8dde71013b2b" id="candidatecommit-8dde71013b2b"></a>

```java
public synchronized void candidateCommit() throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This function copies the candidate to running. It is also used to confirm
 a previous call to candidateConfirmedCommit(), i.e. to prevent the
 automatic rollback if a confirmed commit is not confirmed.

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### candidateCommitInfo(String, String) <a href="#candidatecommitinfo-9389711260f1" id="candidatecommitinfo-9389711260f1"></a>

```java
public synchronized void candidateCommitInfo(
    String label,
    String comment
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This method can be used to set the "Label" and/or "Comment"
 that is stored in the rollback file when the candidate is committed
 to running. To set only the "Label", give comment as null, and to
 set only the "Comment", give label as null.

 If no confirmed commit is ongoing, persistId must not be given,
 and the method does a normal candidate commit,
 like [`Maapi#candidateCommit()`](Maapi.md#candidatecommit-8dde71013b2b). Otherwise the
 method will confirm the ongoing confirmed commit. For a persistent
 confirmed commit, the cookie can be given by persistId if needed.

 Note: To ensure that the "Label" and/or "Comment" are stored
 in the rollback file in all cases when doing a confirmed commit,
 they must be given both with the confirmed commit (using
 `Maapi#candidateConfirmedCommitInfo`) and
 with the confirming commit (using this method).

**Parameters**

- `String label` - value for "Label" in the rollback file
- `String comment` - value for "Comment" in the rollback file

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - If error. If the `errorCode` for the
 `ConfException` is `ConfException.ERR_NOEXISTS`
 it means that there is an ongoing persistent confirmed commit,
 but `persistId` did not give the
 right cookie for it.

### candidateCommitInfo(String, String, String) <a href="#candidatecommitinfo-2fbe0cc5dd8e" id="candidatecommitinfo-2fbe0cc5dd8e"></a>

```java
public synchronized void candidateCommitInfo(
    String persistId,
    String label,
    String comment
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This method can be used to set the "Label" and/or "Comment"
 that is stored in the rollback file when the candidate is committed
 to running. To set only the "Label", give comment as null, and to
 set only the "Comment", give label as null.

 If no confirmed commit is ongoing, persistId must not be given,
 and the method does a normal candidate commit,
 like [`Maapi#candidateCommit()`](Maapi.md#candidatecommit-8dde71013b2b). Otherwise the
 method will confirm the ongoing confirmed commit. For a persistent
 confirmed commit, the cookie can be given by persistId if needed.

 Note: To ensure that the "Label" and/or "Comment" are stored
 in the rollback file in all cases when doing a confirmed commit,
 they must be given both with the confirmed commit (using
 `Maapi#candidateConfirmedCommitInfo`) and
 with the confirming commit (using this method).

**Parameters**

- `String persistId` - value for an already ongoing persistent confirmed commit
- `String label` - value for "Label" in the rollback file
- `String comment` - value for "Comment" in the rollback file

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - If error. If the `errorCode` for the
 `ConfException` is `ConfException.ERR_NOEXISTS`
 it means that there is an ongoing persistent confirmed commit,
 but `persistId` did not give the
 right cookie for it.

### candidateCommitPersistent(String) <a href="#candidatecommitpersistent-232601a4459c" id="candidatecommitpersistent-232601a4459c"></a>

```java
public synchronized void candidateCommitPersistent(
    String persistId
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Confirm an ongoing persistent commit with the cookie given by persistId.
 (If persistId is null, it does the same as
 [`Maapi#candidateCommit()`](Maapi.md#candidatecommit-8dde71013b2b).

 Throws ConfException if error. If the errorCode for the ConfException is
 ConfException.ERR_NOEXISTS it means that there is an ongoing persistent
 confirmed commit, but persist_id did not give the right cookie for it.

**Parameters**

- `String persistId` - cookie for ongoing persistent confirmed commit

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - If error. If the `errorCode` for the
 `ConfException` is `ConfException.ERR_NOEXISTS`
 it means that there is an ongoing persistent confirmed commit,
 but `persistId` did not give the
 right cookie for it.

### candidateConfirmedCommit(int) <a href="#candidateconfirmedcommit-2ecf86dd82a1" id="candidateconfirmedcommit-2ecf86dd82a1"></a>

```java
public synchronized void candidateConfirmedCommit(
    int t
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This method also copies the candidate into running. However if a call to
 candidateCommit() is not done within a given timeout an automatic
 rollback will occur.

**Parameters**

- `int t` - Timeout in seconds

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### candidateConfirmedCommitInfo(int, String, String) <a href="#candidateconfirmedcommitinfo-84908f457061" id="candidateconfirmedcommitinfo-84908f457061"></a>

```java
public synchronized void candidateConfirmedCommitInfo(
    int timeoutsecs,
    String label,
    String comment
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This method does the same as
 [`candidateConfirmedCommitPersistent`](Maapi.md#candidateconfirmedcommitpersistent-119dbc0948e1), but allows for
 setting the "Label" and/or "Comment" that is stored in the
 rollback file when the candidate is committed to running. To set
 only the "Label", give comment as null, and to set only the
 "Comment", give label as null.

 Note: To ensure that the "Label" and/or "Comment" are stored in the
 rollback file in all cases when doing a confirmed commit, they must
 be given both with the confirmed commit (using this method) and
 with the confirming commit (using `candidateCommitInfo`).

**Parameters**

- `int timeoutsecs` - timeout for the confirmed commit
- `String label` - value for "Label" in the rollback file
- `String comment` - value for "Comment" in the rollback file

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - If error. If the `errorCode` for the
 `ConfException` is `ConfException.ERR_NOEXISTS`
 it means that there is an ongoing persistent
 confirmed commit, but `persistId` did not give the right
 cookie for it.

### candidateConfirmedCommitInfo(int, String, String, String, String) <a href="#candidateconfirmedcommitinfo-6edce2eaddd1" id="candidateconfirmedcommitinfo-6edce2eaddd1"></a>

```java
public synchronized void candidateConfirmedCommitInfo(
    int timeoutsecs,
    String persist,
    String persistId,
    String label,
    String comment
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This method does the same as
 [`candidateConfirmedCommitPersistent`](Maapi.md#candidateconfirmedcommitpersistent-119dbc0948e1), but allows for
 setting the "Label" and/or "Comment" that is stored in the
 rollback file when the candidate is committed to running. To set
 only the "Label", give comment as null, and to set only the
 "Comment", give label as null.

 Note: To ensure that the "Label" and/or "Comment" are stored in the
 rollback file in all cases when doing a confirmed commit, they must
 be given both with the confirmed commit (using this method) and
 with the confirming commit (using `candidateCommitInfo`).

**Parameters**

- `int timeoutsecs` - timeout for the confirmed commit
- `String persist` - value for a new persistent confirmed commit
- `String persistId` - value for an already ongoing persistent confirmed commit
- `String label` - value for "Label" in the rollback file
- `String comment` - value for "Comment" in the rollback file

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - If error. If the `errorCode` for the
 `ConfException` is `ConfException.ERR_NOEXISTS`
 it means that there is an ongoing persistent
 confirmed commit, but `persistId` did not give the right
 cookie for it.

### candidateConfirmedCommitPersistent(int, String, String) <a href="#candidateconfirmedcommitpersistent-119dbc0948e1" id="candidateconfirmedcommitpersistent-119dbc0948e1"></a>

```java
public synchronized void candidateConfirmedCommitPersistent(
    int timeoutsecs,
    String persist,
    String persistId
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This method can be used to start or extend a persistent confirmed
 commit, see the Tail-f Commit Capability section in the NETCONF Server
 chapter in the User Guide.

 The `persist` parameter sets the cookie for the
 persistent confirmed commit, while the `persistId` gives
 the cookie for an already ongoing persistent confirmed commit.
 This gives the following
 possibilities:


- `persist = "cookie", persistId = null `
 Start a persistent confirmed commit
 with the cookie "cookie", or extend an already ongoing non-persistent
 confirmed commit and turn it into a persistent confirmed commit.

   - `persist = "newcookie", persistId = "oldcookie"`
 Extend an ongoing
 persistent confirmed commit that uses the cookie "oldcookie" and change
 the cookie to "newcookie".

     - `persist = null, persistId = "cookie"`
 Extend an ongoing persistent confirmed commit that uses the cookie
 "oldcookie" and turn it into a non-persistent confirmed commit.

       - `persist = null, persistId = null` Does the same as
 [`candidateConfirmedCommit(int)`](Maapi.md#candidateconfirmedcommit-2ecf86dd82a1).

 Typical usage is to start a persistent confirmed commit with
 `persist = "cookie", persistId = null`, and to extend it
 with `persist = "cookie", persistId = "cookie"`.

 Throws ConfException

**Parameters**

- `int timeoutsecs` - timeout for the confirmed commit
- `String persist` - value for a new persistent confirmed commit
- `String persistId` - value for an already ongoing persistent confirmed commit

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - If error. If the `errorCode` for the
 `ConfException` is `ConfException.ERR_NOEXISTS`
 it means that there is an ongoing persistent
 confirmed commit, but `persistId` did not give the right
 cookie for it.

### candidateReset() <a href="#candidatereset-b7aa1a8c94e7" id="candidatereset-b7aa1a8c94e7"></a>

```java
public synchronized void candidateReset() throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This function copies running into candidate.

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### candidateValidate() <a href="#candidatevalidate-58aea9fceaa1" id="candidatevalidate-58aea9fceaa1"></a>

```java
public synchronized void candidateValidate() throws java.io.IOException, com.tailf.conf.ConfException
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This function validates the candidate. The function should only be used
 when the candidate is not owned by ConfD, i.e. when the candidate is
 owned by an external database.

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### cd(int, String, Object[]) <a href="#cd-2b29dc1e94f8" id="cd-2b29dc1e94f8"></a>

```java
public synchronized void cd(
    int tid,
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This function mimics the behavior of the UNIX "cd" command. It changes
 our working position in the XML tree. If we are worried about
 performance, it is more efficient to invoke cd() to some position in the
 XML tree and there perform a series of operations using relative paths
 than it is to perform the equivalent series of operations using absolute
 paths.


 The cd() function is also very useful when writing generic code for
 accessing parts of the configuration tree.

**Parameters**

- `int tid` - Transaction Identifier
- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `MaapiException` - If changing directory fails
- `IOException` - Signals I/O exception on the underlying socket

### clearOpCache() <a href="#clearopcache-4878d76fc012" id="clearopcache-4878d76fc012"></a>

```java
public synchronized void clearOpCache() throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Same as `clearOpCache(ConfPath)`, with the only difference that
 if clears all cached data from "/" and down.

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### clearOpCache(ConfPath) <a href="#clearopcache-d6710dfdab1a" id="clearopcache-d6710dfdab1a"></a>

```java
public synchronized void clearOpCache(
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Request clearing of the operational data cache (see the Operational Data
 the User Guide). A ConfPath argument is given to the top of the
 subtree for which cached data should be cleared

**Parameters**

- `com.tailf.conf.ConfPath path` - ConfPath to the subtree for which cached data should be
  cleared

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### clearReadIntent(int) <a href="#clearreadintent-b5b83aa4a4f8" id="clearreadintent-b5b83aa4a4f8"></a>

```java
public synchronized void clearReadIntent(
    int tid
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Clear the read intent for the transaction

**Parameters**

- `int tid` - Transaction Identifier

**Throws**

- `IOException` - Signals I/O exception on the underlying socket
- `ConfException` - Signals protocol/usage error

### CLIAccounting(String, int, String) <a href="#cliaccounting-2a7079fd4705" id="cliaccounting-2a7079fd4705"></a>

```java
public synchronized void CLIAccounting(
    String user,
    int usid,
    String cmd
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Generate an audit log entry in the CLI audit log.

**Parameters**

- `String user` - username of session
- `int usid` - ID of session
- `String cmd` - Text to write to the audit log

**Throws**

- `ConfException` - if operation fails
- `IOException` - if I/O error occurs

### CLICmdToPath(int, String) <a href="#clicmdtopath-90aed3e422a9" id="clicmdtopath-90aed3e422a9"></a>

```java
public synchronized com.tailf.maapi.CLICmdToPathResult CLICmdToPath(
    int th,
    String cmd
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CLICmdToPathResult](CLICmdToPathResult.md#clicmdtopathresult-3b4d365dbceb), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Given a C- or I-style command, this method tries to determine the
 corresponding namespace and path in the schema.
 Returns a [`CLICmdToPathResult`](CLICmdToPathResult.md#clicmdtopathresult-3b4d365dbceb) object, containing the resulting
 namespace and the data-model path.


 If the string cannot be interpreted as a path an exception is thrown,
 indicating that the string is either an operational mode command, a
 configuration mode command, or just badly formatted. The string is
 interpreted in the context of the current running configuration.

**Parameters**

- `int th` - transaction handle
- `String cmd` - The command to interpret

**Returns:** CLICmdToPathResult containing the namespace and path
         corresponding to the command.

**Throws**

- `ConfException` - signals protocol/usage error
- `IOException` - signals I/O exception on the underlying socket

### CLICmdToPath(String) <a href="#clicmdtopath-28d97ca6f282" id="clicmdtopath-28d97ca6f282"></a>

```java
public synchronized com.tailf.maapi.CLICmdToPathResult CLICmdToPath(
    String cmd
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CLICmdToPathResult](CLICmdToPathResult.md#clicmdtopathresult-3b4d365dbceb), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Equivalent to [`CLICmdToPath(int, String)`](Maapi.md#clicmdtopath-90aed3e422a9) with the first
 parameter set to -1 (ie, the command is not interpreted in the
 context of any particular transaction)

**Parameters**

- `String cmd` - The command to interpret

**Returns:** CLICmdToPathResult containing the namespace and path
         corresponding to the command.

**Throws**

- `ConfException` - signals protocol/usage error
- `IOException` - signals I/O exception on the underlying socket

### CLIDiffCmd(int, int, ConfPath) <a href="#clidiffcmd-a74803e0854c" id="clidiffcmd-a74803e0854c"></a>

```java
public synchronized String CLIDiffCmd(
    int thandle,
    int thandleOld,
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Get the diff between two transactions as C-/I-style CLI commands.

**Parameters**

- `int thandle` - Transaction attached to Maapi
- `int thandleOld` - Another transaction
- `com.tailf.conf.ConfPath path` - path

**Returns:** String with the diff as C-/I-style CLI commands.

**Throws**

- `ConfException` - if operation fails
- `IOException` - if I/O error occurs

### CLIPathCmd(int, EnumSet&lt;CLIPathCmdFlag&gt;, String, Object[]) <a href="#clipathcmd-554037c1a7b8" id="clipathcmd-554037c1a7b8"></a>

```java
public synchronized String CLIPathCmd(
    int th,
    java.util.EnumSet<com.tailf.maapi.CLIPathCmdFlag> flags,
    String fmt,
    Object[] args
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [CLIPathCmdFlag](CLIPathCmdFlag.md#clipathcmdflag-23bdfd65bbce), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Returns a string representing the C/I style CLI command that can be
 associated with the given path.

**Parameters**

- `int th` - Transaction handle
- `java.util.EnumSet<com.tailf.maapi.CLIPathCmdFlag> flags` - Flags can be given as:
   EMIT_PARENTS to enable the commands to reach the submode for the path
   to be emitted.
   DELETE to emit the command to delete the given path.
   NON_RECURSIVE to prevent that all children to a container or list item
   are displayed.
- `String fmt` - path to be formatted as CLI command
- `Object[] args` - optional parameters for substitution in fmt

**Returns:** CLI command string

**Throws**

- `ConfException` - signals protocol/usage error
- `IOException` - signals I/O exception on the underlying socket

### CLIPrompt(int, String, boolean) <a href="#cliprompt-8bf975d68180" id="cliprompt-8bf975d68180"></a>

```java
public synchronized String CLIPrompt(
    int usid,
    String prompt,
    boolean echo
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Prompts user for a string.

 The echo parameter is used to control if the
 input should be echoed or not. If set to 'true' all input will be visible
 and if set to 'false' only stars will be shown instead of the actual
 characters entered by the user. The resulting string will be returned.

 This function is intended to be called from inside an action callback
 when invoked from the CLI.

**Parameters**

- `int usid` - ID of session
- `String prompt` - Prompt string
- `boolean echo` - If the answer should be echoed or not

**Returns:** String with the user input

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### CLIPrompt(int, String, boolean, int) <a href="#cliprompt-547c211c5c55" id="cliprompt-547c211c5c55"></a>

```java
public synchronized String CLIPrompt(
    int usid,
    String prompt,
    boolean echo,
    int timeout
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Prompts user for a string.

 The echo parameter is used to control if the
 input should be echoed or not. If set to 'true' all input will be visible
 and if set to 'false' only stars will be shown instead of the actual
 characters entered by the user. The resulting string will be returned.

 This function is intended to be called from inside an action callback
 when invoked from the CLI.

**Parameters**

- `int usid` - ID of session
- `String prompt` - Prompt string
- `boolean echo` - If the answer should be echoed or not
- `int timeout` - Idle timeout in seconds

**Returns:** String with the user input

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### CLIPromptOneOf(int, String, String[]) <a href="#clipromptoneof-7100649afe63" id="clipromptoneof-7100649afe63"></a>

```java
public synchronized String CLIPromptOneOf(
    int usid,
    String prompt,
    String[] choice
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Prompt user for one of the strings given in the choice parameter.

 For
 example:



```
 String res =
     maapi.CLIPromptOneOf(usid,
         Do you want to proceed (yes/no): ,
         new String[] { yes, no });
```



 For example:



```
    Do you want to proceed (yes/no): maybe
    The value must be one of: yes,no.
    Do you want to proceed (yes/no):
```



 This function is intended to be called from inside an action callback
 when invoked from the CLI.

**Parameters**

- `int usid` - ID of session
- `String prompt` - Prompt string
- `String[] choice` - An array of choices to accept from user

**Returns:** String with the user choice

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### CLIPromptOneOf(int, String, String[], int) <a href="#clipromptoneof-eff406070adc" id="clipromptoneof-eff406070adc"></a>

```java
public synchronized String CLIPromptOneOf(
    int usid,
    String prompt,
    String[] choice,
    int timeout
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Prompt user for one of the strings given in the choice parameter.

 For example:



```
 String res =
     maapi.CLIPromptOneOf(usid,
         Do you want to proceed (yes/no): ,
         new String[] { yes, no },
         60);
```



 For example:



```
    Do you want to proceed (yes/no): maybe
    The value must be one of: yes,no.
    Do you want to proceed (yes/no):
```



 This function is intended to be called from inside an action callback
 when invoked from the CLI.

**Parameters**

- `int usid` - ID of session
- `String prompt` - Prompt string
- `String[] choice` - An array of choices to accept from user
- `int timeout` - Idle timeout in seconds

**Returns:** String with the user choice

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### CLIReadEOF(int, boolean) <a href="#clireadeof-ae26f628719b" id="clireadeof-ae26f628719b"></a>

```java
public synchronized String CLIReadEOF(
    int usid,
    boolean echo
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Read a multi line string from the CLI.


 The user has to end the input using ctrl-D.
 The entered characters will be returned. The echo
 parameters controls if the entered characters should be echoed or not. If
 set to 'true' the answer will be visible and if set to 'false' stars will
 be echoed instead.

 This method is intended to be called from inside an action call- back
 when invoked from the CLI.

**Parameters**

- `int usid` - ID of session
- `boolean echo` - If the answer should be echoed or not

**Returns:** String with the entered characters

**Throws**

- `ConfException` - if operation fails
- `IOException` - if I/O error occurs

### CLIReadEOF(int, boolean, int) <a href="#clireadeof-5fc695888097" id="clireadeof-5fc695888097"></a>

```java
public synchronized String CLIReadEOF(
    int usid,
    boolean echo,
    int timeout
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Read a multi line string from the CLI.

 The user has to end the input
 using ctrl-D. The entered characters will be returned. The echo
 parameters controls if the entered characters should be echoed or not. If
 set to 'true' the answer will be visible and if set to 'false' stars will
 be echoed instead.

 This function is intended to be called from inside an action call- back
 when invoked from the CLI.

**Parameters**

- `int usid` - ID of session
- `boolean echo` - If the answer should be echoed or not
- `int timeout` - Idle timeout in seconds

**Returns:** String with the entered characters

**Throws**

- `ConfException` - if operation fails
- `IOException` - if I/O error occurs

### CLIWrite(int, String) <a href="#cliwrite-82d9f9f34697" id="cliwrite-82d9f9f34697"></a>

```java
public synchronized void CLIWrite(
    int usid,
    String buf
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Write to the CLI.

 This method is intended to be called from inside an
 action callback when invoked from the CLI.

**Parameters**

- `int usid` - ID of session
- `String buf` - Text to write to CLI

**Throws**

- `ConfException` - if operation fails
- `IOException` - if I/O error occurs

### close() <a href="#close-8107c6dc012b" id="close-8107c6dc012b"></a>

```java
public void close() throws java.io.IOException
```

Closes the MAAPI connection and cleans up resources.

**Throws**

- `IOException` - if I/O error occurs during close

### commitTrans(int) <a href="#committrans-edd7d497abaf" id="committrans-edd7d497abaf"></a>

```java
public synchronized void commitTrans(
    int tid
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Commit a transaction specified by transaction handle `tid`.

 Final step of a two-phase commit.
 [`validateTrans(int,boolean,boolean)`](Maapi.md#validatetrans-8767da488cef) and
 `prepareTrans` must be called prior to
 `commitTrans`

**Parameters**

- `int tid` - Transaction Identifier

**Throws**

- `MaapiException` - If the commit operation fails
- `IOException` - Signals I/O exception on the underlying socket

### commitUpgrade() <a href="#commitupgrade-571b9396e3a3" id="commitupgrade-571b9396e3a3"></a>

```java
public synchronized void commitUpgrade() throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Note, This method is only applicable for Confd. For NCS, the In-service
 Data Model Upgrades are directly correlated to NCS packages and have
 more high-level support.

 When also performUpgrade() has completed successfully, this function must
 be called to make the upgrade permanent. This includes committing the CDB
 upgrade transaction when CDB is used, and we can thus get all the
 different exceptions that can otherwise result from applyTrans(). When
 commitUpgrade() has completed successfully, the program driving the
 upgrade must also make sure that the loadpath elements
 in confd.conf reference the new directories.

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### confirmedCommitInProgress() <a href="#confirmedcommitinprogress-15c6ed3c5f5f" id="confirmedcommitinprogress-15c6ed3c5f5f"></a>

```java
public synchronized int confirmedCommitInProgress() throws java.io.IOException, com.tailf.conf.ConfException
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Checks whether a confirmed commit is pending. Returns the ID of the user
 session currently having a pending confirmed commit operation in progress
 or 0 if no operation is in progress.

**Returns:** the ID of the user session currently having a pending
  confirmed commit operation in progress

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### copy(int, int) <a href="#copy-498f3a527216" id="copy-498f3a527216"></a>

```java
public synchronized void copy(
    int thfrom,
    int thto
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

If we open two transactions from the same user sessions but towards
 different data stores, such as one transaction towards the candidate and
 one towards running, we can copy all data from one data store to the
 other with this method.

**Parameters**

- `int thfrom` - the transaction handle of the source
- `int thto` - the transaction handle of the destination

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### copyPath(int, int, ConfPath) <a href="#copypath-4f0da08da889" id="copypath-4f0da08da889"></a>

```java
public synchronized void copyPath(
    int fromTh,
    int toTh,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Similar to [`copy(int, int)`](Maapi.md#copy-498f3a527216), but does a replacing copy only
 of the subtree rooted at the path given by `path`

**Parameters**

- `int fromTh` - the transaction handle of the source
- `int toTh` - the transaction handle of the destination
- `com.tailf.conf.ConfPath path` - the path to copy

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### copyRunningToStartup() <a href="#copyrunningtostartup-493226bdd3d0" id="copyrunningtostartup-493226bdd3d0"></a>

```java
public synchronized void copyRunningToStartup() throws java.io.IOException, com.tailf.conf.ConfException
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Copies running to startup.

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### copyTree(int, boolean, ConfPath, ConfPath) <a href="#copytree-02a5a406c545" id="copytree-02a5a406c545"></a>

```java
public synchronized void copyTree(
    int tid,
    boolean useSharedCreate,
    com.tailf.conf.ConfPath from,
    com.tailf.conf.ConfPath to
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This function is used to copy an entire subtree in the configuration from
 one point to another. When we use this function in fastmap code, we
 usually want to set the useSharedCreate parameter to true.

**Parameters**

- `int tid` - Transaction Identifier
- `boolean useSharedCreate` - whether to use shared create
- `com.tailf.conf.ConfPath from` - source path to copy from
- `com.tailf.conf.ConfPath to` - destination path to copy to

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### copyTree(int, ConfPath, ConfPath) <a href="#copytree-9f5a27b7b6e6" id="copytree-9f5a27b7b6e6"></a>

```java
public synchronized void copyTree(
    int tid,
    com.tailf.conf.ConfPath from,
    com.tailf.conf.ConfPath to
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Copy a configuration tree from one location to another.
 Equivalent to [`Maapi#copyTree(int, boolean, ConfPath, ConfPath)`](Maapi.md#copytree-02a5a406c545)
 with useSharedCreate set to false
 i.e., for use outside fastmap, without 'shared' create/set

**Parameters**

- `int tid` - transaction identifier
- `com.tailf.conf.ConfPath from` - source path to copy from
- `com.tailf.conf.ConfPath to` - destination path to copy to

**Throws**

- `IOException` - if I/O error occurs
- `ConfException` - if copy operation fails

### create(int, ConfPath) <a href="#create-88ad345c22c2" id="create-88ad345c22c2"></a>

```java
public synchronized void create(
    int tid,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Create an entity in the XML tree. Things that can be created
 are liste entries, presence containers and leaves with type empty.



```
 maapi.create(tid, /servers/server{www});
```



 If we are creating a new server element as above, we must also populate
 all other XML elements below which do not have a default value in the
 YANG model. Thus, assuming 'port' is mandatory we must also:



```
 maapi.setElem(tid, 80,
               /servers/server{www}/port);
```



 before we try to commit the data.

**Parameters**

- `int tid` - Transaction Identifier
- `com.tailf.conf.ConfPath path` - Path to the element to create

**Throws**

- `ConfException` - if the object already exists
- `IOException` - Signals I/O exception on the underlying socket

### create(int, String, Object[]) <a href="#create-fc0ad3b51c5b" id="create-fc0ad3b51c5b"></a>

```java
public synchronized void create(
    int tid,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Create a new list entry in the XML tree. For example



```
 maapi.create(tid, /servers/server{www});
```



 If we are creating a new server element as above, we must also populate
 all other XML elements below, which do not have a default value in the
 YANG model. Thus we must also:



```
 maapi.setElem(tid, 80,
               /servers/server{www}/port);
```



 before we try to commit the data.

**Parameters**

- `int tid` - Transaction Identifier
- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `ConfException` - if the object already exists
- `IOException` - Signals I/O exception on the underlying socket

### delete(int, ConfPath) <a href="#delete-84019aaada07" id="delete-84019aaada07"></a>

```java
public synchronized void delete(
    int tid,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Deletes a node and all its children from the XML data tree.

**Parameters**

- `int tid` - Transaction Identifier
- `com.tailf.conf.ConfPath path` - Path to the element to delete

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### delete(int, String, Object[]) <a href="#delete-7f7b4f7a3319" id="delete-7f7b4f7a3319"></a>

```java
public synchronized void delete(
    int tid,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Deletes a node and all its children from the XML data tree.

**Parameters**

- `int tid` - Transaction Identifier
- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### deleteAll(int, MaapiDeleteAllFlag) <a href="#deleteall-b0d5e11220fb" id="deleteall-b0d5e11220fb"></a>

```java
public synchronized void deleteAll(
    int th,
    com.tailf.maapi.MaapiDeleteAllFlag how
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [MaapiDeleteAllFlag](MaapiDeleteAllFlag.md#maapideleteallflag-ab18714d13ee), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This function can be used to delete "all" configuration data within
 a transaction. The flag `how` specifies the extent of "all":


 `MAAPI_DEL_SAFE`
     Delete everything except namespaces that were exported to none
     (with tailf:export none). Toplevel nodes that cannot be deleted due
     to AAA rules are silently left in place, but descendant nodes will
     still be deleted if the AAA rules allow it.


 `MAAPI_DEL_EXPORTED`
     Delete everything except namespaces that were exported to none
     (with tailf:export none). AAA rules are ignored, i.e. nodes are
     deleted even if the AAA rules don't allow it.


 `MAAPI_DEL_ALL`
 Delete everything. AAA rules are ignored.

**Parameters**

- `int th` - Transaction handle
- `com.tailf.maapi.MaapiDeleteAllFlag how` - One of the flags in MaapiDeleteAllFlag,
            specifying 'how' to delete all

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### deleteConfig(int) <a href="#deleteconfig-124c36c44b6f" id="deleteconfig-124c36c44b6f"></a>

```java
public synchronized void deleteConfig(
    int db
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This function empties a data store.

**Parameters**

- `int db` - target database.

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### deref(int, String, Object[]) <a href="#deref-570394700610" id="deref-570394700610"></a>

```java
public synchronized com.tailf.conf.ConfObject[][] deref(
    int tid,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This method dereferences a leafref and returns a list of the objects the
 leafref "points" to. I.e it returns an array of keypaths. If the leafref
 points to a single key, the list will be of length 1. If the leafref
 points to either a normal leaf, or to a list key element in a list with
 multiple keys, the list may be longer that 1.

 The path must lead to a leafref element in the XML data tree.

**Parameters**

- `int tid` - Transaction Identifier
- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Returns:** array of keypaths that the leafref points to

**Throws**

- `MaapiException` - If the dereference operation fails
- `IOException` - Signals I/O exception on the underlying socket

### destroyCursor(int, int, ConfPath) <a href="#destroycursor-e647eef13807" id="destroycursor-e647eef13807"></a>

```java
protected synchronized void destroyCursor(
    int tid,
    int id,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Destroy a cursor on the server side using a transaction id and
 cursor id.

**Parameters**

- `int tid` - the transaction id
- `int id` - the cursor id
- `com.tailf.conf.ConfPath path` - the cursor keypath

**Throws**

- `IOException`
- `ConfException`

### destroyCursor(MaapiCursor) <a href="#destroycursor-175b7f0886db" id="destroycursor-175b7f0886db"></a>

```java
protected synchronized void destroyCursor(
    com.tailf.maapi.MaapiCursor c
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [MaapiCursor](MaapiCursor.md#maapicursor-788c065e30cb), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Destroy the cursor on the server side.

**Parameters**

- `com.tailf.maapi.MaapiCursor c` - MaapiCursor

**Throws**

- `IOException` - Signals I/O exception on the underlying socket
- `ConfException` - Signals protocol/usage error

### detach(int) <a href="#detach-a694e7ef7d65" id="detach-a694e7ef7d65"></a>

```java
public synchronized void detach(int tid) throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Detaches an attached MAAPI socket.

 This method is typically called in
 the `finish` phase in validation code.
 An attached MAAPI socket will be
 automatically detached when the transaction terminates.

 This method performs an explicit detach.

**Parameters**

- `int tid` - Transaction Identifier

**Throws**

- `MaapiException` - If detachment from the transaction fails
- `IOException` - Signals I/O exception on the underlying socket.

### diffIterate(int, MaapiDiffIterate) <a href="#diffiterate-8d4d9d07b552" id="diffiterate-8d4d9d07b552"></a>

```java
public synchronized void diffIterate(
    int tid,
    com.tailf.maapi.MaapiDiffIterate iter
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [MaapiDiffIterate](MaapiDiffIterate.md#maapidiffiterate-199d02e1da37), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Iterates through the transaction diff.

 For all diffs in the transaction
 the supplied
 [`MaapiDiffIterate#iterate(ConfObject[],DiffIterateOperFlag,
 ConfObject,ConfObject,Object)`](MaapiDiffIterate.md#iterate-d80a566b7e0a) (callback) method will be called.


 This method can be called from an attached MAAPI session. The purpose
 of the function is to iterate through the transaction diff. It can
 typically be used in conjunction with the notification API when we
 subscribe to NOTIF_COMMIT_DIFF events.

 For all diffs in the transaction the supplied callback function
 `iterate` will be called. The `iterate` callback
 receives the keypath which uniquely identifies which element in the
 XML tree that is affected, the operation, and an optional value.

 `iterate` is called for each modified list entry, and for each
 modified leaf node. If the node is a list entry, op is one of
 `MOP_CREATED`, `MOP_DELETED` or
 `MOP_MODIFIED` If the node is a leaf node, op
 is one of `MOP_DELETED` or `MOP_VALUE_SET`.

 If `iterate` returns `ITER_STOP`, no more
 iteration is done. If
 `iterate` returns `ITER_RECURSE` iteration
 continues with all children
 to the node. If `iterate` returns
 `ITER_CONTINUE` iteration ignores
 the children to the node (if any), and continues with the node's sibling.


 The different commit messages are not subjected to AAA checks, i.e.
 regardless of which path we have and which context was used to create the
 MAAPI socket, all changed values are sent on the socket.

**Parameters**

- `int tid` - Transaction handle
- `com.tailf.maapi.MaapiDiffIterate iter` - A MaapiDiffIterate object

**Throws**

- `MaapiException` - Failed diffIterate
- `IOException` - Failed to read/write maapi socket

### diffIterate(int, MaapiDiffIterate, Object, String, Object[]) <a href="#diffiterate-08cf0eebfc90" id="diffiterate-08cf0eebfc90"></a>

```java
public synchronized void diffIterate(
    int tid,
    com.tailf.maapi.MaapiDiffIterate iter,
    Object initstate,
    String fmt,
    Object[] args
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [MaapiDiffIterate](MaapiDiffIterate.md#maapidiffiterate-199d02e1da37), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Iterates through the transaction diff.

 For all diffs in the transaction
 the supplied
 [`MaapiDiffIterate#iterate(ConfObject[],DiffIterateOperFlag,
 ConfObject,ConfObject,Object)`](MaapiDiffIterate.md#iterate-d80a566b7e0a) (callback) method will be called.


 This method can be called from an attached MAAPI session. The purpose
 of the function is to iterate through the transaction diff. It can
 typically be used in conjunction with the notification API when we
 subscribe to NOTIF_COMMIT_DIFF events.

 For all diffs in the transaction the supplied callback function
 `iterate` will be called. The `iterate` callback
 receives the keypath which uniquely identifies which element in the
 XML tree that is affected, the operation, and an optional value.

 `iterate` is called for each modified list entry, and for each
 modified leaf node. If the node is a list entry, op is one of
 `MOP_CREATED`, `MOP_DELETED` or
 `MOP_MODIFIED` If the node is a leaf node, op
 is one of `MOP_DELETED` or `MOP_VALUE_SET`.

 If `iterate` returns `ITER_STOP`, no more
 iteration is done. If
 `iterate` returns `ITER_RECURSE` iteration
 continues with all children
 to the node. If `iterate` returns
 `ITER_CONTINUE` iteration ignores
 the children to the node (if any), and continues with the node's sibling.


 The different commit messages are not subjected to AAA checks, i.e.
 regardless of which path we have and which context was used to create the
 MAAPI socket, all changed values are sent on the socket.

**Parameters**

- `int tid` - Transaction handle
- `com.tailf.maapi.MaapiDiffIterate iter` - A MaapiDiffIterate object
- `Object initstate` - Arbritary object passed to the iterator
- `String fmt` - A format string for the path
- `Object[] args` - Arguments for the path format string

**Throws**

- `ConfException` - Failed diffIterate
- `IOException` - Failed to read/write maapi socket

### diffIterate(int, MaapiDiffIterate, String, Object[]) <a href="#diffiterate-12c0a67aa0f4" id="diffiterate-12c0a67aa0f4"></a>

```java
public synchronized void diffIterate(
    int tid,
    com.tailf.maapi.MaapiDiffIterate iter,
    String fmt,
    Object[] args
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [MaapiDiffIterate](MaapiDiffIterate.md#maapidiffiterate-199d02e1da37), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Iterates through the transaction diff.

 For all diffs in the transaction
 the supplied
 [`MaapiDiffIterate#iterate(ConfObject[],DiffIterateOperFlag,
 ConfObject,ConfObject,Object)`](MaapiDiffIterate.md#iterate-d80a566b7e0a) (callback) method will be called.


 This method can be called from an attached MAAPI session. The purpose
 of the function is to iterate through the transaction diff. It can
 typically be used in conjunction with the notification API when we
 subscribe to NOTIF_COMMIT_DIFF events.

 For all diffs in the transaction the supplied callback function
 `iterate` will be called. The `iterate` callback
 receives the keypath which uniquely identifies which element in the
 XML tree that is affected, the operation, and an optional value.

 `iterate` is called for each modified list entry, and for each
 modified leaf node. If the node is a list entry, op is one of
 `MOP_CREATED`, `MOP_DELETED` or
 `MOP_MODIFIED` If the node is a leaf node, op
 is one of `MOP_DELETED` or `MOP_VALUE_SET`.

 If `iterate` returns `ITER_STOP`, no more
 iteration is done. If
 `iterate` returns `ITER_RECURSE` iteration
 continues with all children
 to the node. If `iterate` returns
 `ITER_CONTINUE` iteration ignores
 the children to the node (if any), and continues with the node's sibling.


 The different commit messages are not subjected to AAA checks, i.e.
 regardless of which path we have and which context was used to create the
 MAAPI socket, all changed values are sent on the socket.

**Parameters**

- `int tid` - Transaction handle
- `com.tailf.maapi.MaapiDiffIterate iter` - A MaapiDiffIterate object
- `String fmt` - A format string for the path
- `Object[] args` - Arguments for the path format string

**Throws**

- `MaapiException` - Failed diffIterate
- `IOException` - Failed to read/write maapi socket

### diffIterate(int, Object, EnumSet&lt;DiffIterateFlags&gt;, MaapiDiffIterate, ConfPath) <a href="#diffiterate-e06379c98286" id="diffiterate-e06379c98286"></a>

```java
public synchronized void diffIterate(
    int tid,
    Object initstate,
    java.util.EnumSet<com.tailf.conf.DiffIterateFlags> flags,
    com.tailf.maapi.MaapiDiffIterate iter,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [DiffIterateFlags](../conf/DiffIterateFlags.md#diffiterateflags-79473c9fdab6), [MaapiDiffIterate](MaapiDiffIterate.md#maapidiffiterate-199d02e1da37), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Iterates through the transaction diff.

 For all diffs in the transaction
 the supplied
 [`MaapiDiffIterate#iterate(ConfObject[],DiffIterateOperFlag,
 ConfObject,ConfObject,Object)`](MaapiDiffIterate.md#iterate-d80a566b7e0a) (callback) method will be called.


 This method can be called from an attached MAAPI session. The purpose
 of the function is to iterate through the transaction diff. It can
 typically be used in conjunction with the notification API when we
 subscribe to NOTIF_COMMIT_DIFF events.

 For all diffs in the transaction the supplied callback function
 `iterate` will be called. The `iterate` callback
 receives the keypath which uniquely identifies which element in the
 XML tree that is affected, the operation, and an optional value.

 `iterate` is called for each modified list entry, and for each
 modified leaf node. If the node is a list entry, op is one of
 `MOP_CREATED`, `MOP_DELETED` or
 `MOP_MODIFIED` If the node is a leaf node, op
 is one of `MOP_DELETED` or `MOP_VALUE_SET`.
 If the flags argument is set to [`DiffIterateFlags#ITER_WANT_ATTR`](../conf/DiffIterateFlags.md#iter_want_attr-946a41e3cb08)
 also attribute changes will be iterated over with op
 `MOP_ATTR_SET` and new and old values as
 [`ConfAttributeValue`](../conf/ConfAttributeValue.md#confattributevalue-d38e058ca48e)

 If `iterate` returns `ITER_STOP`, no more
 iteration is done. If
 `iterate` returns `ITER_RECURSE` iteration
 continues with all children
 to the node. If `iterate` returns
 `ITER_CONTINUE` iteration ignores
 the children to the node (if any), and continues with the node's sibling.


 The different commit messages are not subjected to AAA checks, i.e.
 regardless of which path we have and which context was used to create the
 MAAPI socket, all changed values are sent on the socket.

**Parameters**

- `int tid` - Transaction handle
- `Object initstate` - arbitrary object passed to the iterator
- `java.util.EnumSet<com.tailf.conf.DiffIterateFlags> flags` - set of [`DiffIterateFlags`](../conf/DiffIterateFlags.md#diffiterateflags-79473c9fdab6) flags that controls the
  iteration, for Maapi only [`DiffIterateFlags#ITER_WANT_ATTR`](../conf/DiffIterateFlags.md#iter_want_attr-946a41e3cb08)
  is supported
- `com.tailf.maapi.MaapiDiffIterate iter` - A MaapiDiffIterate object
- `com.tailf.conf.ConfPath path` - ConfPath

**Throws**

- `MaapiException` - Failed diffIterate
- `IOException` - Signals I/O exception on the underlying socket.
             Failed to read/write maapi socket

### disconnectRemote(String) <a href="#disconnectremote-450face0b812" id="disconnectremote-450face0b812"></a>

```java
public synchronized void disconnectRemote(
    String address
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Disconnect all remote connections between CONFD_IPC_PORT (see the IPC
 section in the Advanced Topics chapter in the User Guide) and address.

 Since clients, e.g. CDB readers/subscribers, are connected using TCP it
 is also possible to do this remotely over a network. However since TCP
 does not offer a fast and reliable way of detecting that the other end
 has disappeared the server can get stuck waiting for a reply from such a
 disconnected client.

 In some environments there will be an alternative supervision method that
 can detect when a remote host is unavailable, and in that situation this
 function can be used to instruct the server to drop all remote
 connections to a particular host. The address parameter is an IP address
 as a string. On success, the function returns the number of connections
 that were closed.

 Note, the server will close all its sockets with remote address address,
 except HA connections.

**Parameters**

- `String address` - the IP address of the remote host to disconnect

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### disconnectSockets(int[]) <a href="#disconnectsockets-8b7e078ee89f" id="disconnectsockets-8b7e078ee89f"></a>

```java
public synchronized void disconnectSockets(
    int[] sockets
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This function is an alternative to `disconnectRemote()`
 that can be useful in particular when using the "External IPC"
 functionality (see "Using a different IPC mechanism" in the ConfD IPC
 section in the Advanced Topics chapter in the User Guide).
 In this case ConfD does not have any knowledge of the remote address of
 the IPC connections, and thus `disconnectRemote()` is
 not applicable. `disconnectSockets()` instead takes an
 array of file descriptor numbers as the parameter.

 ConfD will close all connected sockets whose local file descriptor
 number is included that array.

**Parameters**

- `int[] sockets` - The array of socket file descriptors to close

**Throws**

- `IOException` - Signals I/O exception on the underlying socket
- `MaapiException` - If disconnecting sockets fails

### doDisplay(int, String, Object[]) <a href="#dodisplay-3fd4ff100335" id="dodisplay-3fd4ff100335"></a>

```java
public synchronized boolean doDisplay(
    int tid,
    String fmt,
    Object[] args
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

If the data model uses the YANG 'when' or 'tailf:display-when'
 statement, this function can be used to determine if the item
 given by the path in fmt should be displayed or not.

**Parameters**

- `int tid` - current transaction
- `String fmt` - path string
- `Object[] args` - optional parameters for substitution in fmt

**Returns:** boolean

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### endSpan(Span, String) <a href="#endspan-1c44c700da19" id="endspan-1c44c700da19"></a>

```java
public synchronized com.tailf.progress.Span endSpan(
    com.tailf.progress.Span span,
    String annotation
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Span](../progress/Span.md#span-1e8b02bddf13), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

End progress span. This is the low level
 method that communicates with the progress trace
 framework to end spans. It is recommended
 to use `ProgressTrace#endSpan`
 instead.

**Parameters**

- `com.tailf.progress.Span span` - the span returned from `startSpan`
- `String annotation` - annotation of the ending span

**Returns:** Span the parent span of the ended span

**Throws**

- `IOException` - Signals I/O exception on the underlying socket
- `ConfException` - Signals protocol/usage error.

### endUserSession() <a href="#endusersession-0b0070df9e04" id="endusersession-0b0070df9e04"></a>

```java
public synchronized void endUserSession() throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Ends the current user session on this `Maapi` instance.

 If the `Maapi` socket is closed, the user
 session is automatically ended.

**Throws**

- `MaapiException` - If there is no current session on this
            `Maapi` instance
- `IOException` - Signals I/O exception on the underlying
            socket

### event(int, Verbosity, String, ConfPath, Attributes) <a href="#event-a62f77a7eb2a" id="event-a62f77a7eb2a"></a>

```java
public synchronized void event(
    int tid,
    com.tailf.maapi.Maapi.Verbosity verbosity,
    String msg,
    com.tailf.conf.ConfPath path,
    com.tailf.progress.Attributes attributes
)
    throws java.io.IOException, java.security.InvalidParameterException, com.tailf.conf.ConfException
```

Types: [Verbosity](Maapi/Verbosity.md#verbosity-a9c618ec424f), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [Attributes](../progress/Attributes.md#attributes-ca725b6502c4), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Create a progress event. This is the low level
 method that communicates with the progress trace
 framework to create events. It is recommended
 to use `ProgressTrace#event`
 instead.

**Parameters**

- `int tid` - the transasction ID
- `com.tailf.maapi.Maapi.Verbosity verbosity` - the verbosity of the message
- `String msg` - the message content
- `com.tailf.conf.ConfPath path` - the path of the service
- `com.tailf.progress.Attributes attributes` - attribute of the event

**Throws**

- `IOException` - Signals I/O exception on the underlying socket
- `ConfException` - Signals protocol/usage error.

### exists(int, ConfPath) <a href="#exists-6846f84c441d" id="exists-6846f84c441d"></a>

```java
public synchronized boolean exists(
    int tid,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Boolean function which return true or false if a path defines an existing
 element in the XML data tree.

**Parameters**

- `int tid` - Transaction Identifier
- `com.tailf.conf.ConfPath path` - ConfPath instance

**Returns:** true if the path exists, else false.

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### exists(int, String, Object[]) <a href="#exists-40982ba2d871" id="exists-40982ba2d871"></a>

```java
public synchronized boolean exists(
    int tid,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Boolean function which return true or false if a path defines an existing
 element in the XML data tree.

**Parameters**

- `int tid` - Transaction Identifier
- `String fmt` - Format string for the path
- `Object[] arguments` - Arguments for the format string

**Returns:** true if the path exists, else false.

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### findNext(MaapiCursor, ConfFindNextType, ConfKey) <a href="#findnext-8a93985facf5" id="findnext-8a93985facf5"></a>

```java
public synchronized com.tailf.conf.ConfKey findNext(
    com.tailf.maapi.MaapiCursor c,
    com.tailf.conf.ConfFindNextType type,
    com.tailf.conf.ConfKey key
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfKey](../conf/ConfKey.md#confkey-e4e1ca98e867), [MaapiCursor](MaapiCursor.md#maapicursor-788c065e30cb), [ConfFindNextType](../conf/ConfFindNextType.md#conffindnexttype-c34c1027a581), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

The findNext method makes it possible to jump forward to an element
 in the model at a position defined by the MaapiCursor
 After the findNext call the same MaapiCursor can be used in subsequent
 getNext calls.

**Parameters**

- `com.tailf.maapi.MaapiCursor c` - MaapiCursor for path
- `com.tailf.conf.ConfFindNextType type` - ConfFindNextType if same element as key or element
  after key should be retrieved
- `com.tailf.conf.ConfKey key` - ConfKey for the searched element

**Returns:** ConfKey for the retrieved element or null if not found

**Throws**

- `IOException` - Signals I/O exception on the underlying socket
- `ConfException` - Signals protocol/usage error

### finishTrans(int) <a href="#finishtrans-0f920518d3c3" id="finishtrans-0f920518d3c3"></a>

```java
public synchronized void finishTrans(
    int tid
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Finish the transaction specified by transaction handle `tid`.

 If the transaction is implemented by an
 external database, this will invoke the `finish` callback.

**Parameters**

- `int tid` - Transaction id of transaction to terminate.

**Throws**

- `MaapiException` - If the transaction cannot be finished
- `IOException` - Signals I/O exception on the underlying socket

### getAttrs(int, ConfAttributeType[], String, Object[]) <a href="#getattrs-7e03f020d090" id="getattrs-7e03f020d090"></a>

```java
public synchronized com.tailf.conf.ConfAttributeValue[] getAttrs(
    int tid,
    com.tailf.conf.ConfAttributeType[] attribs,
    String fmt,
    Object[] args
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfAttributeValue](../conf/ConfAttributeValue.md#confattributevalue-d38e058ca48e), [ConfAttributeType](../conf/ConfAttributeType.md#confattributetype-292ad441835a), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Retrieve attributes for a configuration node. These attributes are
 currently supported:

 ConfAttributeType.TAGS (values are ConfList of ConfBuf)
 ConfAttributeType.ANNOTATION (value is ConfBuf)
 ConfAttributeType.INACTIVE (not used)
 ConfAttributeType.ORIGIN (value is ConfIdentityRef)

 The attribs parameter is an array of ConfAttributeType objects,
 specifying the wanted attributes - if the array is empty or attribs is
 null, all attributes are retrieved.

 If no attributes are found, the returned ConfAttributeValue array is
 empty otherwise the result array is populated.

**Parameters**

- `int tid` - current transaction
- `com.tailf.conf.ConfAttributeType[] attribs` - array of ConfAttributeType denoting attributes to retrieve
- `String fmt` - path indicating node to retrieve attributes from
- `Object[] args` - variable argument list for c-style parameters in fmtPath

**Returns:** ConfAttributeValue[]

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### getAuthorizationInfo(int) <a href="#getauthorizationinfo-80c04fd39233" id="getauthorizationinfo-80c04fd39233"></a>

```java
public synchronized String[] getAuthorizationInfo(
    int usid
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This method retrieves authorization info for a user session, i.e. the
 groups that the user has been assigned to.

**Parameters**

- `int usid` - User session ID

**Returns:** An array of group names that the user session is a member of

**Throws**

- `IOException` - Signals I/O exception on the underlying socket
- `ConfException` - Signals protocol/usage error

### getAutoNsList() <a href="#getautonslist-da00481c1d9a" id="getautonslist-da00481c1d9a"></a>

```java
public static java.util.ArrayList<com.tailf.conf.ConfNamespace> getAutoNsList()
```

Types: [ConfNamespace](../conf/ConfNamespace.md#confnamespace-51b928e168d1)

Returns the currently auto generated namespace list.

**Returns:** the currently auto generated namespace list.

### getAutoNsList(List&lt;ConfNamespace&gt;) <a href="#getautonslist-033586c41810" id="getautonslist-033586c41810"></a>

```java
public static java.util.ArrayList<com.tailf.conf.ConfNamespace> getAutoNsList(
    java.util.List<com.tailf.conf.ConfNamespace> defaultNsList
)
```

Types: [ConfNamespace](../conf/ConfNamespace.md#confnamespace-51b928e168d1)

Returns the currently auto generated namespace list or
 supplied default if no auto generated exists.

**Parameters**

- `java.util.List<com.tailf.conf.ConfNamespace> defaultNsList` - the default namespace list to return

**Returns:** the currently auto generated namespace list or
 supplied default if no auto generated exists.

### getAutoNsMap() <a href="#getautonsmap-587def34063e" id="getautonsmap-587def34063e"></a>

```java
public static java.util.Map<Integer,com.tailf.conf.ConfNamespace> getAutoNsMap()
```

Types: [ConfNamespace](../conf/ConfNamespace.md#confnamespace-51b928e168d1)

Returns the currently auto generated namespace map
 keyed on the namespace hash.

**Returns:** the currently auto generated namespace map
         keyed on the namespace hash.

### getAutoNsPrefixMap() <a href="#getautonsprefixmap-6897b4989dfd" id="getautonsprefixmap-6897b4989dfd"></a>

```java
public static java.util.Map<String,java.util.List<com.tailf.conf.ConfNamespace>> getAutoNsPrefixMap()
```

Types: [ConfNamespace](../conf/ConfNamespace.md#confnamespace-51b928e168d1)

Returns the currently auto generated namespace prefix map.

**Returns:** the currently auto generated namespace prefix
         map. The namespace prefix map maps namespace
         prefixes to namespaces.

### getCase(int, String, ConfPath) <a href="#getcase-9be6344ce9aa" id="getcase-9be6344ce9aa"></a>

```java
public synchronized com.tailf.conf.ConfTag getCase(
    int tid,
    String choice,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfTag](../conf/ConfTag.md#conftag-73757b87bc93), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Returns the currently selected case in a choice statement.

**Parameters**

- `int tid` - transaction identifier
- `String choice` - name of the choice
- `com.tailf.conf.ConfPath path` - path to the node where choice is defined

**Returns:** ConfTag representing the current selected case

**Throws**

- `IOException` - if I/O error occurs
- `ConfException` - if case cannot be determined

### getCase(int, String, String, Object[]) <a href="#getcase-9eae8c6bc653" id="getcase-9eae8c6bc653"></a>

```java
public synchronized com.tailf.conf.ConfTag getCase(
    int tid,
    String choice,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfTag](../conf/ConfTag.md#conftag-73757b87bc93), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This returns the current 'case' for a 'choice' construct.

 When we use the YANG choice statement in the data model, this method
 can be used to find the currently selected case,
 avoiding useless getElem() etc requests for nodes that belong
 to other cases. The `fmt` arguments give the path to
 the list entry or container where the choice is defined,
 and choice is the name of the choice.The case value is returned as
 ConfTag.


 For a choice without a mandatory true statement where no case is
 currently selected, the function will fail with
 ERR_NOEXISTS if the choice doesn't have a default case.
 If it has a default case, it will be returned
 unless the `MaapiFlag.NO_DEFAULTS` flag is in effect @see
 MaapiFlag if the flag is set, the value returned will have type
 `ConfTagDefault`.

 NOTE: The method will suppress all ERR_NOEXISTS errors this means
 that the method will not throw exception when ERR_NOEXISTS
 occurs it will print a warning message and return null.

**Parameters**

- `int tid` - current transaction handle
- `String choice` - name of the choice
- `String fmt` - path string to the container or list where the
        choice is defined
- `Object[] arguments` - optional parameters for substitution in fmt

**Returns:** ConfTag representing the current selected case or null if
         the case could not be determine. If NO_DEFAULTS flag is used and
         the default case is selected, then ConfTagDefault instance is
         returned.

**Throws**

- `MaapiException` - If the case cannot be retrieved
- `IOException` - Signals I/O exception on the underlying socket

### getCLIInteraction(int) <a href="#getcliinteraction-9602971a279d" id="getcliinteraction-9602971a279d"></a>

```java
public synchronized com.tailf.maapi.CLIInteraction getCLIInteraction(int usid)
```

Types: [CLIInteraction](CLIInteraction.md#cliinteraction-ffa8d4bd97e3)

Get CLIInteraction object which enables communication with the user via
 the CLI.

 This function is intended to be called from inside an action callback
 when invoked from the CLI.

**Parameters**

- `int usid` - user session id

**Returns:** CLIInteraction

### getCwd(int) <a href="#getcwd-dab6003742c3" id="getcwd-dab6003742c3"></a>

```java
public synchronized String getCwd(int tid) throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Returns the current position as previously set by Maapi.cd(),
 Maapi.pushd(), or Maapi.popd() as a String. Note that what is returned is
 a pretty-printed version of the internal representation of the current
 position, it will be the shortest unique way to print the path but it
 might not exactly match the string given to Maapi.cd()

**Parameters**

- `int tid` - current transaction

**Returns:** String

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### getCwdPath(int) <a href="#getcwdpath-c4bbc6c8fa08" id="getcwdpath-c4bbc6c8fa08"></a>

```java
public synchronized com.tailf.conf.ConfPath getCwdPath(
    int tid
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Returns the current position like Maapi.getCwd(), but as a ConfPath
 instead of as a String.

**Parameters**

- `int tid` - current transaction

**Returns:** ConfPath

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### getElem(int, ConfPath) <a href="#getelem-174690e33535" id="getelem-174690e33535"></a>

```java
public synchronized com.tailf.conf.ConfValue getElem(
    int tid,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This reads a value from the path in fmt and returns the result. The path
 must lead to a leaf element in the XML data tree.

**Parameters**

- `int tid` - Transaction Identifier
- `com.tailf.conf.ConfPath path` - Path to the element in the XML data tree

**Returns:** A ConfValue that describes the value of the element.

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### getElem(int, String, Object[]) <a href="#getelem-1415a215bb24" id="getelem-1415a215bb24"></a>

```java
public synchronized com.tailf.conf.ConfValue getElem(
    int tid,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This reads a value from the path in fmt and returns the result. The path
 must lead to a leaf element in the XML data tree.

**Parameters**

- `int tid` - Transaction Identifier
- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Returns:** A ConfValue that describes the value of the element.

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### getMountId(int, ConfPath) <a href="#getmountid-bcb13e926380" id="getmountid-bcb13e926380"></a>

```java
public synchronized java.util.List<String> getMountId(
    int tid,
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Retrieves the mount ID for a given path in a transaction.

**Parameters**

- `int tid` - transaction identifier
- `com.tailf.conf.ConfPath path` - path to get mount ID for

**Returns:** list of mount ID strings

**Throws**

- `ConfException` - if operation fails

### getMyUserSession() <a href="#getmyusersession-23a1a3d293a2" id="getmyusersession-23a1a3d293a2"></a>

```java
public synchronized int getMyUserSession() throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Returns the usid associated with this `Maapi`

**Returns:** The user session id associated with this `Maapi`.

**Throws**

- `MaapiException` - If no user session exists on this
            `Maapi` socket
- `IOException` - Signals some I/O exception on the underlying
            socket

### getNext(MaapiCursor) <a href="#getnext-94186d85d070" id="getnext-94186d85d070"></a>

```java
public synchronized com.tailf.conf.ConfKey getNext(
    com.tailf.maapi.MaapiCursor c
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfKey](../conf/ConfKey.md#confkey-e4e1ca98e867), [MaapiCursor](MaapiCursor.md#maapicursor-788c065e30cb), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Iterates and gets the keys for the next element pinpointed by the
 [`MaapiCursor`](MaapiCursor.md#maapicursor-788c065e30cb) initially retrieved by
 [`newCursor(int, String, Object...)`](Maapi.md#newcursor-8f0d3924978a).
 With the key(s) it is possible to navigate further down the model.


 For example, to read the port element from the 'server' example model,
 we would do:




```
 MaapiCursor c = maapi.newCursor(tid,
                                 "/mtest:mtest/servers/server");
 ConfKey x = maapi.getNext(c);
 while (x != null) {
     ConfObject p;
     p = maapi.getElem(tid,
                       "/mtest:mtest/servers/server{%x}/port", x);
     // ....
     x = maapi.getNext(c);
 }
```

**Parameters**

- `com.tailf.maapi.MaapiCursor c` - MaapiCursor

**Returns:** ConfKey for the retrieved element

**Throws**

- `IOException` - Signals I/O exception on the underlying socket
- `ConfException` - Signals protocol/usage error

### getNsList() <a href="#getnslist-0345f486e876" id="getnslist-0345f486e876"></a>

```java
public java.util.ArrayList<com.tailf.conf.ConfNamespace> getNsList()
```

Types: [ConfNamespace](../conf/ConfNamespace.md#confnamespace-51b928e168d1)

Get a list of the installed namespaces retrieved from the loaded
 [`MaapiSchemas`](MaapiSchemas.md#maapischemas-821ac70b83b7). The underlying socket is not required to
 be open for this operation.

**Returns:** list of namespaces

### getNumberOfInstances(int, ConfPath) <a href="#getnumberofinstances-5a101b02e1dd" id="getnumberofinstances-5a101b02e1dd"></a>

```java
public synchronized int getNumberOfInstances(
    int tid,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Return the number of instances in a list. The path
 must lead to a list in the model.

**Parameters**

- `int tid` - Transaction Identifier
- `com.tailf.conf.ConfPath path` - ConfPath instance

**Returns:** The number of instances in the list

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### getNumberOfInstances(int, String, Object[]) <a href="#getnumberofinstances-f0813061766e" id="getnumberofinstances-f0813061766e"></a>

```java
public synchronized int getNumberOfInstances(
    int tid,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Return the number of instances in a list. The path
 must lead to a list in the model.

**Parameters**

- `int tid` - Transaction Identifier
- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Returns:** The number of instances in the list

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### getObject(int, String, Object[]) <a href="#getobject-8f535bb4e0e8" id="getobject-8f535bb4e0e8"></a>

```java
public synchronized com.tailf.conf.ConfObject[] getObject(
    int tid,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This reads a container object or a list entry object from the path in fmt
 and returns the result. The path must lead to a list entry or a
 container element in the XML data tree.

 The return value is an array of ConfObjects that describe the entire
 structure. All plain values in the structure, such as strings, ints ip
 addresses are represented as ConfValue instances. If the structure
 contains containers, they are represented as ConfTag instances. Finally,
 optional leafs and containers in the structure that are missing are
 represented as ConfTypeDescriptor instances with type set to
 ConfObject.J_NOEXISTS.

**Parameters**

- `int tid` - Transaction Identifier
- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Returns:** An array of ConfObject which describes the object.

**Throws**

- `MaapiException` - If the object cannot be retrieved
- `IOException` - Signals I/O exception on the underlying socket

### getObjects(MaapiCursor, int, int) <a href="#getobjects-8d530442b539" id="getobjects-8d530442b539"></a>

```java
public synchronized java.util.List<com.tailf.conf.ConfObject[]> getObjects(
    com.tailf.maapi.MaapiCursor c,
    int numOfObjects,
    int numOfInstances
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [MaapiCursor](MaapiCursor.md#maapicursor-788c065e30cb), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Get several list instances with one request. A prerequisite is that a
 MaapiCursor must have been initialized for the list and supplied
 as an argument to this call.

 For each list instance the argument numOfObjects controls the
 maximum number of elements that will be retrieved.
 The objects are added in schema order.

 The numOfInstances argument controls the maximum number of list
 instances that should be retrieved. If the list is empty or the cursor
 has already iterated through all list instances then the returned list
 will be empty.

**Parameters**

- `com.tailf.maapi.MaapiCursor c` - MaapiCursor on current list
- `int numOfObjects` - Number of object retrieved from a list instance
- `int numOfInstances` - Number of list instances retrieved in this call

**Returns:** ListConfObject[] containing list instances.

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### getReadIntent(int) <a href="#getreadintent-eaf0d52ae3f6" id="getreadintent-eaf0d52ae3f6"></a>

```java
public synchronized java.util.List<String> getReadIntent(
    int tid
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Get the read intent for the transaction

**Parameters**

- `int tid` - Transaction Identifier

**Returns:** The read intent for the transaction

**Throws**

- `MaapiException` - If getting the read intent fails
- `IOException` - Signals I/O exception on the underlying socket

### getRollbackId(int) <a href="#getrollbackid-cae38eb78c8e" id="getrollbackid-cae38eb78c8e"></a>

```java
public synchronized int getRollbackId(
    int tid
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Get rollback id for committed transaction specified by
 transaction handle `tid`.

 This methods returns the fixed rollback id of the rollback
 file created during commit of the transaction. If rollbacks are
 disabled or no rollback was created this returns -1.

**Parameters**

- `int tid` - Transaction Identifier

**Returns:** Rollback id of the transaction, or -1 if no rollback was created.

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### getRunningDbStatus() <a href="#getrunningdbstatus-241216af056b" id="getrunningdbstatus-241216af056b"></a>

```java
public synchronized int getRunningDbStatus() throws java.io.IOException, com.tailf.conf.ConfException
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Query ConfD/NCS for its consistency state.

 If a transaction fails in the `commit` phase, the
 configuration database is in a possibly inconsistent state.
 This method queries ConfD/NCS on the consistency state.

**Returns:** 1 if the configuration is consistent
 and 0 otherwise.

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### getSchemas() <a href="#getschemas-7b275bd8ca12" id="getschemas-7b275bd8ca12"></a>

```java
public static com.tailf.maapi.MaapiSchemas getSchemas()
```

Types: [MaapiSchemas](MaapiSchemas.md#maapischemas-821ac70b83b7)

Returns the currently loaded schema.

**Returns:** null if no schemas has been loaded.

### getSocket() <a href="#getsocket-d7da2de81b81" id="getsocket-d7da2de81b81"></a>

```java
public java.net.Socket getSocket()
```

Returns the socket used for MAAPI communication.

**Returns:** the underlying socket

### getSource(SocketAddress) <a href="#getsource-6929fe0dea80" id="getsource-6929fe0dea80"></a>

```java
public static java.net.InetAddress getSource(
    java.net.SocketAddress address
)
    throws java.net.UnknownHostException
```

Extracts the InetAddress from a SocketAddress.

**Parameters**

- `java.net.SocketAddress address` - the socket address to extract from

**Returns:** the InetAddress from the socket address, or localhost if not
         an InetSocketAddress

**Throws**

- `UnknownHostException` - if localhost cannot be determined

### getTransactionMode(int) <a href="#gettransactionmode-31871babf3ac" id="gettransactionmode-31871babf3ac"></a>

```java
public synchronized int getTransactionMode(
    int tid
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Get the mode for the given transaction.

**Parameters**

- `int tid` - Transaction Identifier

**Returns:** Mode of the transaction ([`Conf#MODE_READ`](../conf/Conf.md#mode_read-1e4ced2f015c) or
 [`Conf#MODE_READ_WRITE`](../conf/Conf.md#mode_read_write-0883a33af731))

**Throws**

- `ConfException` - Signals protocol/usage error
- `IOException` - Signals I/O exception on the underlying socket

### getTransParams(int) <a href="#gettransparams-05113dc340f5" id="gettransparams-05113dc340f5"></a>

```java
public synchronized com.tailf.maapi.CommitParams getTransParams(
    int tid
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [CommitParams](CommitParams.md#commitparams-819d9b5483cc), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Get commit parameters for a transaction.

**Parameters**

- `int tid` - Transaction id of transaction to get commit parameters for

**Returns:** the commit parameters

**Throws**

- `IOException` - Signals I/O exception on the underlying socket
- `ConfException` - Signals protocol/usage error.

### getUserSession(int) <a href="#getusersession-ce8473a1e046" id="getusersession-ce8473a1e046"></a>

```java
public synchronized com.tailf.maapi.MaapiUserSession getUserSession(
    int usid
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [MaapiUserSession](MaapiUserSession.md#maapiusersession-2d8a37dd2abf), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Return a [`MaapiUserSession`](MaapiUserSession.md#maapiusersession-2d8a37dd2abf) given by the `usid`.

**Parameters**

- `int usid` - ID of session to retrieve

**Returns:** [`MaapiUserSession`](MaapiUserSession.md#maapiusersession-2d8a37dd2abf) object

**Throws**

- `MaapiException` - If the user session with the given
          `ID` does not exits
- `IOException` - Signals I/O exception on the underlying
            socket

### getUserSessionIdentification(int) <a href="#getusersessionidentification-b5dbad8ef1a8" id="getusersessionidentification-b5dbad8ef1a8"></a>

```java
public synchronized com.tailf.maapi.MaapiUserSessionId getUserSessionIdentification(
    int usid
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [MaapiUserSessionId](MaapiUserSessionId.md#maapiusersessionid-2dac3a536c51), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This method can be used to retrieve additional identification
 information for a user session (if available - ie., if it has been
 provided by the northbound client).

**Parameters**

- `int usid` - Session id

**Returns:** A [`MaapiUserSessionId`](MaapiUserSessionId.md#maapiusersessionid-2dac3a536c51) object with the fields
 vendor, product, version and clientId.

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket
- `MaapiException` - If the operation fails

### getUserSessionOpaque(int) <a href="#getusersessionopaque-c7ddb1c3a4e0" id="getusersessionopaque-c7ddb1c3a4e0"></a>

```java
public synchronized String getUserSessionOpaque(
    int usid
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

If the user session has "opaque" information provided by the
 northbound client (see the -O option in `confd_cli`),
 the opaque information can be retrieved using this method.

**Parameters**

- `int usid` - User session id

**Returns:** The opaque information as a string.

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket.

### getUserSessions() <a href="#getusersessions-4b7007a2fe5d" id="getusersessions-4b7007a2fe5d"></a>

```java
public synchronized int[] getUserSessions() throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Return all user sessions id's currently connected to ConfD/NCS.

**Returns:** An array of user session id's currently connected to ConfD/NCS.

**Throws**

- `MaapiException` - If the operation fails
- `IOException` - Signals I/O exception on the underlying
            socket

### getValues(int, T, ConfPath) <a href="#getvalues-4c7d173a5b38" id="getvalues-4c7d173a5b38"></a>

```java
public synchronized <T extends java.util.List<com.tailf.conf.ConfXMLParam>> T getValues(
    int tid,
    T params,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9), [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7)

Read an arbitrary set of sub-elements of a container element.

 The `params` list must be pre-populated
 based on the specification of the [`ConfXMLParam`](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7)
 array structure format. Where
 [`ConfXMLParamValue`](../conf/ConfXMLParamValue.md#confxmlparamvalue-9f41fb2668c9) value element set by
 [`ConfXMLParamValue#setValue(ConfObject)`](../conf/ConfXMLParamValue.md#setvalue-6b7c360817b0) method
 is given as follow:


- [`ConfNoExists`](../conf/ConfNoExists.md#confnoexists-bdcf8f2c7ab9) means that the value should
 be read from the transaction and stored in the array.

   - [`ConfXMLParamStart`](../conf/ConfXMLParamStart.md#confxmlparamstart-05eace141688),
 [`ConfXMLParamStop`](../conf/ConfXMLParamStop.md#confxmlparamstop-d1e86c4fdecc)
 are used as per the specification.

     - Keys to select list entries can be given with their values.

 All elements have the same position in the array after the call,
 In order to simplify extraction of the values -
 this means that optional elements that were requested but didn't
 exist will have `ConfNoExists` (as a the
 `ConfXMLParamValue#getValue()` return value in
 the corresponding position in a `ConfXMLParamValue`)
 rather than being omitted from the array.
 However requesting a list entry that doesn't exist will throw
 a exception indicating that the instance does not exits.

**Type Parameters**

- `T` - the type list holding the structure

**Parameters**

- `int tid` - transaction handle
- `T params` - pre-populated structure of the elements to be extracted
- `com.tailf.conf.ConfPath path` - the path pointing to the location of extraction

**Returns:** the populated list with extracted values

**Throws**

- `MaapiException` - If the call failed for some reason
         see the `MaapiException#getMessage()` for details.
- `IOException` - Signals I/O exception of some kind

**See also:** [`ConfXMLParam`](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [`ConfXMLParamValue`](../conf/ConfXMLParamValue.md#confxmlparamvalue-9f41fb2668c9)

### getValues(int, T, String, Object[]) <a href="#getvalues-33bfcad43c75" id="getvalues-33bfcad43c75"></a>

```java
public synchronized <T extends java.util.List<com.tailf.conf.ConfXMLParam>> T getValues(
    int tid,
    T params,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9), [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7)

Read an arbitrary set of sub-elements of a container element.

 The `params` list must be pre-populated
 based on the specification of the [`ConfXMLParam`](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7) array
 structure format. Where [`ConfXMLParamValue`](../conf/ConfXMLParamValue.md#confxmlparamvalue-9f41fb2668c9) value
 element set by
 [`ConfXMLParamValue#setValue(ConfObject)`](../conf/ConfXMLParamValue.md#setvalue-6b7c360817b0) method is
 given as follow:


- [`ConfNoExists`](../conf/ConfNoExists.md#confnoexists-bdcf8f2c7ab9) means that the value should be
 read from the transaction and stored in the array.

   - [`ConfXMLParamStart`](../conf/ConfXMLParamStart.md#confxmlparamstart-05eace141688),
 [`ConfXMLParamStop`](../conf/ConfXMLParamStop.md#confxmlparamstop-d1e86c4fdecc)
 are used as per the specification.

     - Keys to select list entries can be given with their values.

 All elements have the same position in the array after the call,
 In order to simplify extraction of the values -
 this means that optional elements that were requested but didn't
 exist will have `ConfNoExists` (as a the
 `ConfXMLParamValue#getValue()` return value in
 the corresponding position in a `ConfXMLParamValue`)
 rather than being omitted from the array.
 However requesting a list entry that doesn't exist will throw
 a exception indicating that the instance does not exits.

**Type Parameters**

- `T` - the type list holding the structure

**Parameters**

- `int tid` - transaction handle
- `T params` - pre-populated structure of the elements to be extracted
- `String fmt` - the format string for the path
- `Object[] arguments` - optional parameters for substitution in fmt

**Returns:** the populated list with extracted values

**Throws**

- `MaapiException` - If the call failed for some reason
         see the `MaapiException#getMessage()` for details.
- `IOException` - Signals I/O exception of some kind

**See also:** [`ConfXMLParam`](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [`ConfXMLParamValue`](../conf/ConfXMLParamValue.md#confxmlparamvalue-9f41fb2668c9)

### getValues(int, T[], ConfPath) <a href="#getvalues-62ed915288bb" id="getvalues-62ed915288bb"></a>

```java
public synchronized <T extends com.tailf.conf.ConfXMLParam> T[] getValues(
    int tid,
    T[] params,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9), [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7)

Read an arbitrary set of sub-elements of a container element.

 The `params` array must be pre-populated
 based on the specification of the [`ConfXMLParam`](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7) array
 structure format. Where [`ConfXMLParamValue`](../conf/ConfXMLParamValue.md#confxmlparamvalue-9f41fb2668c9) value
 element set by
 [`ConfXMLParamValue#setValue(ConfObject)`](../conf/ConfXMLParamValue.md#setvalue-6b7c360817b0)
 method is given as follow:


- [`ConfNoExists`](../conf/ConfNoExists.md#confnoexists-bdcf8f2c7ab9) means that the value
  should be read from the transaction and stored in the array.

   - [`ConfXMLParamStart`](../conf/ConfXMLParamStart.md#confxmlparamstart-05eace141688),
 [`ConfXMLParamStop`](../conf/ConfXMLParamStop.md#confxmlparamstop-d1e86c4fdecc)
 are used as per the specification.

     - Keys to select list entries can be given with their values.

 All elements have the same position in the array after the call,
 In order to simplify extraction of the values -
 this means that optional elements that were requested but didn't
 exist will have `ConfNoExists` (as a the
 `ConfXMLParamValue#getValue()` return value in
 the corresponding position in a `ConfXMLParamValue`)
 rather than being omitted from the array.
 However requesting a list entry that doesn't exist will throw
 a exception indicating that the instance does not exits.

**Type Parameters**

- `T` - type of the elements contained in the structure

**Parameters**

- `int tid` - transaction handle
- `T[] params` - pre-populated structure of the elements to be extracted
- `com.tailf.conf.ConfPath path` - the path pointing to the location of extraction

**Returns:** array of populated parameters with extracted values

**Throws**

- `MaapiException` - If the call failed for some reason
         see the `MaapiException#getMessage()` for details.
- `IOException` - Signals I/O exception of some kind

**See also:** [`ConfXMLParam`](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [`ConfXMLParamValue`](../conf/ConfXMLParamValue.md#confxmlparamvalue-9f41fb2668c9)

### getValues(int, T[], String, Object[]) <a href="#getvalues-975e171e6ece" id="getvalues-975e171e6ece"></a>

```java
public synchronized <T extends com.tailf.conf.ConfXMLParam> T[] getValues(
    int tid,
    T[] params,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9), [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7)

Read an arbitrary set of sub-elements of a container element.

 The `params` array must be pre-populated
 based on the specification of the [`ConfXMLParam`](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7) array
 structure format. Where [`ConfXMLParamValue`](../conf/ConfXMLParamValue.md#confxmlparamvalue-9f41fb2668c9)
 value element set by
 [`ConfXMLParamValue#setValue(ConfObject)`](../conf/ConfXMLParamValue.md#setvalue-6b7c360817b0)
 method is given as follow:


- [`ConfNoExists`](../conf/ConfNoExists.md#confnoexists-bdcf8f2c7ab9) means that the value should be
 read from the transaction and stored in the array.

   - [`ConfXMLParamStart`](../conf/ConfXMLParamStart.md#confxmlparamstart-05eace141688),
 [`ConfXMLParamStop`](../conf/ConfXMLParamStop.md#confxmlparamstop-d1e86c4fdecc)
 are used as per the specification.

     - Keys to select list entries can be given with their values.

 All elements have the same position in the array after the call,
 In order to simplify extraction of the values -
 this means that optional elements that were requested but didn't
 exist will have `ConfNoExists` (as a the
 `ConfXMLParamValue#getValue()` return value in
 the corresponding position in a `ConfXMLParamValue`)
 rather than being omitted from the array.
 However requesting a list entry that doesn't exist will throw
 a exception indicating that the instance does not exits.

**Type Parameters**

- `T` - type of the elements contained in the structure

**Parameters**

- `int tid` - transaction handle
- `T[] params` - pre-populated structure of the elements to be extracted
- `String fmt` - path string
- `Object[] arguments` - optional parameter for substitution in fmt

**Returns:** array of populated parameters with extracted values

**Throws**

- `MaapiException` - If the call failed for some reason
         see the `MaapiException#getMessage()` for details.
- `IOException` - Signals I/O exception of some kind

**See also:** [`ConfXMLParam`](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [`ConfXMLParamValue`](../conf/ConfXMLParamValue.md#confxmlparamvalue-9f41fb2668c9)

### hideGroup(int, String) <a href="#hidegroup-70455383c885" id="hidegroup-70455383c885"></a>

```java
public synchronized void hideGroup(
    int tid,
    String groupName
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Hide all nodes belonging to a hide group in a transaction that started
 with [`MaapiFlag#HIDE_ALL_HIDEGROUPS`](MaapiFlag.md#hide_all_hidegroups-27fac18f1f9d) flag.

**Parameters**

- `int tid` - Transaction Identifier
- `String groupName` - Group Name

**Throws**

- `MaapiException` - If hiding the group fails
- `IOException` - Signals I/O exception on the underlying socket

### init() <a href="#init-e3919b885d98" id="init-e3919b885d98"></a>

```java
public void init() throws com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Initializes the MAAPI connection and loads schemas.

**Throws**

- `ConfException` - if connection or schema loading fails

### initUpgrade(int, int) <a href="#initupgrade-56c030ff2fc5" id="initupgrade-56c030ff2fc5"></a>

```java
public synchronized void initUpgrade(
    int timeoutsecs,
    int flags
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Note, This method is only applicable for Confd. For NCS, the In-service
 Data Model Upgrades are directly correlated to NCS packages and have
 more high-level support.

 This is the first of three functions that must be called in sequence to
 perform an in-service data model upgrade, i.e. replace fxs files etc
 without restarting the server. See the In-service Data Model Upgrade
 chapter in the Confd User Guide for a detailed description of this
 procedure.

 This function initializes the upgrade procedure. The timeoutsecs
 parameter specifies a maximum time to wait for users to voluntarily exit
 from "configure mode" sessions in CLI and Web UI. If transactions are
 still active when the timeout expires, the function throw an
 ConfException. If the flag MAAPI_UPGRADE_KILL_ON_TIMEOUT was given via
 the flags parameter, such transactions will instead be forcibly
 terminated, allowing the initialization to complete successfully.

**Parameters**

- `int timeoutsecs` - specifies a maximum time to wait for users to exit
- `int flags` - bitflags for control of upgrade behavior

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### inputStreamResult(int, int) <a href="#inputstreamresult-abcc2b3f4a7e" id="inputstreamresult-abcc2b3f4a7e"></a>

```java
protected synchronized boolean inputStreamResult(int resultOperation, int streamId)
```

**Parameters**

- `int resultOperation`
- `int streamId`

### insert(int, boolean, String, Object[]) <a href="#insert-b0095c025c86" id="insert-b0095c025c86"></a>

```java
public synchronized void insert(
    int tid,
    boolean createBackPointer,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This function inserts a new element in an ordered list of elements. The
 key must be of type integer, and have the attribute indexedView.
 If the inserted element already exists, all element following the element
 will be reordered.

**Parameters**

- `int tid` - Transaction Identifier
- `boolean createBackPointer` - When we insert items into lists that are
 managed by FastMap code, we always want to set this parameter to
 true. Since we insert into the list, effectively changing the keys
 the FastMap diff-sets must be updated accordingly.
- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### insert(int, String, Object[]) <a href="#insert-8aab317d3021" id="insert-8aab317d3021"></a>

```java
public synchronized void insert(
    int tid,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Insert new element in an ordered list.
 Equivalent to [`insert(int, boolean, String, Object...)`](Maapi.md#insert-b0095c025c86).

**Parameters**

- `int tid` - transaction identifier
- `String fmt` - path the path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `IOException` - if I/O error occurs
- `ConfException` - if element cannot be inserted

### isCandidateModified() <a href="#iscandidatemodified-a17e4d850f34" id="iscandidatemodified-a17e4d850f34"></a>

```java
public synchronized boolean isCandidateModified() throws java.io.IOException, com.tailf.conf.ConfException
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Returns `true` if candidate has been modified, i.e., if there are
 pending non-committed changes to the candidate data store. `false`
 if it has not been modified.

**Returns:** boolean

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### isLockSet(int) <a href="#islockset-66fbf05334ff" id="islockset-66fbf05334ff"></a>

```java
public synchronized int isLockSet(int db) throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This methods checks if a lock is taken or not. if integer /= 0 is
 returned it is the usid of the lock owner

**Parameters**

- `int db` - Database to check. Possible values are
  [`Conf#DB_STARTUP`](../conf/Conf.md#db_startup-2ce085259486), [`Conf#DB_RUNNING`](../conf/Conf.md#db_running-c391f371da28), and
            [`Conf#DB_CANDIDATE`](../conf/Conf.md#db_candidate-8b43a337ac93)

**Returns:** 0 if no lock is set, else the usid of the lock owner

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### isRunningModified() <a href="#isrunningmodified-53004bab212a" id="isrunningmodified-53004bab212a"></a>

```java
public synchronized boolean isRunningModified() throws java.io.IOException, com.tailf.conf.ConfException
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Returns true if running has been modified since the last copy to startup,
 false if it has not been modified.

**Returns:** boolean

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### iterate(int, Object, EnumSet&lt;ConfIterateFlags&gt;, MaapiIterate, ConfPath) <a href="#iterate-f6278b19bafb" id="iterate-f6278b19bafb"></a>

```java
public synchronized void iterate(
    int tid,
    Object initstate,
    java.util.EnumSet<com.tailf.conf.ConfIterateFlags> flags,
    com.tailf.maapi.MaapiIterate iter,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfIterateFlags](../conf/ConfIterateFlags.md#confiterateflags-74fb5551dac9), [MaapiIterate](MaapiIterate.md#maapiiterate-7712a2112a17), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Iterates through all the data in a transaction.

 For all data elements in the transaction the supplied
 [`MaapiIterate#iterate(ConfObject[],ConfObject,
   ConfAttributeValue[],Object)`](MaapiIterate.md#iterate-638caa8f5a2f) (callback) method will be called.


 This method can be called from an attached MAAPI session.

 The `iterate` callback
 receives the keypath which uniquely identifies which element in the
 XML tree that is affected, the operation, and an optional value.

 `iterate` is called for each list entry, and for each
 leaf node. If the node is a list entry, op is one of
 `MOP_CREATED`, `MOP_DELETED` or
 `MOP_MODIFIED` If the node is a leaf node, op
 is one of `MOP_DELETED` or `MOP_VALUE_SET`.
 If the flags argument is set to [`ConfIterateFlags#ITER_WANT_ATTR`](../conf/ConfIterateFlags.md#iter_want_attr-946a41e3cb08)
 also attribute changes will be iterated over with op
 `MOP_ATTR_SET` and new and old values as
 [`ConfAttributeValue`](../conf/ConfAttributeValue.md#confattributevalue-d38e058ca48e)

 If `iterate` returns `ITER_STOP`, no more
 iteration is done. If
 `iterate` returns `ITER_RECURSE` iteration
 continues with all children
 to the node. If `iterate` returns
 `ITER_CONTINUE` iteration ignores
 the children to the node (if any), and continues with the node's sibling.


 The different commit messages are not subjected to AAA checks, i.e.
 regardless of which path we have and which context was used to create the
 MAAPI socket, all changed values are sent on the socket.

**Parameters**

- `int tid` - Transaction handle
- `Object initstate` - arbitrary object passed to the iterator
- `java.util.EnumSet<com.tailf.conf.ConfIterateFlags> flags` - set of [`ConfIterateFlags`](../conf/ConfIterateFlags.md#confiterateflags-74fb5551dac9) flags that controls the
  iteration, for Maapi only [`ConfIterateFlags#ITER_WANT_ATTR`](../conf/ConfIterateFlags.md#iter_want_attr-946a41e3cb08)
  is supported
- `com.tailf.maapi.MaapiIterate iter` - A MaapiIterate object
- `com.tailf.conf.ConfPath path` - ConfPath

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### killUserSession(int) <a href="#killusersession-4c91da836162" id="killusersession-4c91da836162"></a>

```java
public synchronized void killUserSession(
    int usid
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Ends another users session, effectively logging out that user.

**Parameters**

- `int usid` - ID of session to terminate

**Throws**

- `MaapiException` - If the session with the `ID`
            did not exists
- `IOException` - Signals I/O exception on the underlying
            socket

### loadConfig(int, EnumSet&lt;MaapiConfigFlag&gt;, String) <a href="#loadconfig-0cd0ed8a64d0" id="loadconfig-0cd0ed8a64d0"></a>

```java
public synchronized void loadConfig(
    int tid,
    java.util.EnumSet<com.tailf.maapi.MaapiConfigFlag> flags,
    String filename
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [MaapiConfigFlag](MaapiConfigFlag.md#maapiconfigflag-53df41e9a7b7), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This function loads a configuration from filename into the server. The
 tid parameter is a transaction id. Thus the application must create and
 also apply the transaction. By default the complete configuration (as
 allowed by the user of the current transaction) is deleted before the
 file is loaded. To merge the contents of the file use the
 MAAPI_CONFIG_MERGE flag. The MAAPI_CONFIG_WITH_OPER flag can be used
 together with MAAPI_CONFIG_XML to mean that any operational data in the
 file should be ignored (instead of producing an error). The other flags
 parameters are the same as for
 `Maapi#saveConfig(int, EnumSet, String, Object...)`

**Parameters**

- `int tid` - transaction id for started transaction
- `java.util.EnumSet<com.tailf.maapi.MaapiConfigFlag> flags` - One of `MAAPI_CONFIG_XML`,
                   `MAAPI_CONFIG_J `,
                   `MAAPI_CONFIG_C`,
                   `MAAPI_CONFIG_WITH_DEFAULTS`,
                   `MAAPI_CONFIG_SHOW_DEFAULTS`,
                   `MAAPI_CONFIG_C_IOS`,
                   `MAAPI_CONFIG_MERGE` or
                   `MAAPI_CONFIG_WITH_OPER`
- `String filename` - name of the configuration file relative directory where
              ConfD/NCS started.

**Throws**

- `ConfException` - Signals protocol/usage error
- `IOException` - Signals I/O exception on the underlying socket

### loadConfigCmds(int, EnumSet&lt;MaapiConfigFlag&gt;, String, String, Object[]) <a href="#loadconfigcmds-4c47d55451a5" id="loadconfigcmds-4c47d55451a5"></a>

```java
public synchronized void loadConfigCmds(
    int tid,
    java.util.EnumSet<com.tailf.maapi.MaapiConfigFlag> flags,
    String cmds,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [MaapiConfigFlag](MaapiConfigFlag.md#maapiconfigflag-53df41e9a7b7), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This function loads a configuration from a string into the server.
 By default the complete configuration (as
 allowed by the user of the current transaction) is deleted before the
 file is loaded. To merge the contents of the file use the
 MAAPI_CONFIG_MERGE flag. The MAAPI_CONFIG_WITH_OPER flag can be used
 together with MAAPI_CONFIG_XML to mean that any operational data in the
 file should be ignored (instead of producing an error). The other flags
 parameters are the same as for
 `Maapi#saveConfig(int, EnumSet, String, Object...)`

**Parameters**

- `int tid` - transaction id for started transaction
- `java.util.EnumSet<com.tailf.maapi.MaapiConfigFlag> flags` - One of `MAAPI_CONFIG_XML`,
            `MAAPI_CONFIG_J`, `MAAPI_CONFIG_C`,
            `MAAPI_CONFIG_WITH_DEFAULTS`,
            `MAAPI_CONFIG_SHOW_DEFAULTS`,
            `MAAPI_CONFIG_C_IOS`,
            `MAAPI_CONFIG_MERGE` or
            `MAAPI_CONFIG_WITH_OPER`
- `String cmds` - string representing the configuration to be loaded
- `String fmt` - path relative to which the configuration should be loaded
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket.

### loadConfigStream(int, EnumSet&lt;MaapiConfigFlag&gt;) <a href="#loadconfigstream-5250b4e7adae" id="loadconfigstream-5250b4e7adae"></a>

```java
public synchronized com.tailf.maapi.MaapiOutputStream loadConfigStream(
    int tid,
    java.util.EnumSet<com.tailf.maapi.MaapiConfigFlag> flags
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [MaapiOutputStream](MaapiOutputStream.md#maapioutputstream-97ebc772623b), [MaapiConfigFlag](MaapiConfigFlag.md#maapiconfigflag-53df41e9a7b7), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Load configuration from a `OuputStream ` into ConfD/NCS.

 This method loads a configuration from a `OutputStream`
 into the server.

 The tid parameter is a transaction id. Thus the application must
 create and also apply the transaction. By default the complete
 configuration (as allowed by the user of the current transaction) is
 deleted before the file is loaded.

 To merge the contents of the file use the
 [`MaapiConfigFlag#MAAPI_CONFIG_MERGE`](MaapiConfigFlag.md#maapi_config_merge-b85720c4efea) flag.
 The [`MaapiConfigFlag#MAAPI_CONFIG_WITH_OPER`](MaapiConfigFlag.md#maapi_config_with_oper-e9ea7e3958f1) flag can be used
 together with [`MaapiConfigFlag#MAAPI_CONFIG_XML`](MaapiConfigFlag.md#maapi_config_xml-5293149632cc) to mean that
 any operational data in the file should be ignored
 (instead of producing an error).

 The other flags parameters are the same as for
 `Maapi#saveConfig(int, EnumSet, String, Object...)`

**Parameters**

- `int tid` - transaction id for started transaction
- `java.util.EnumSet<com.tailf.maapi.MaapiConfigFlag> flags` - One of
            `MAAPI_CONFIG_XML`,
            `MAAPI_CONFIG_J `,
            `MAAPI_CONFIG_C`,
            `MAAPI_CONFIG_WITH_DEFAULTS`,
            `MAAPI_CONFIG_SHOW_DEFAULTS`,
            `MAAPI_CONFIG_C_IOS`,
            `MAAPI_CONFIG_MERGE` or
            `MAAPI_CONFIG_WITH_OPER`

**Returns:** OutputStream to write data to.

**Throws**

- `ConfException` - Signals protocol/usage error
- `IOException` - Signals I/O exception on the underlying socket

### loadSchemas() <a href="#loadschemas-84ad3496a6f3" id="loadschemas-84ad3496a6f3"></a>

```java
public com.tailf.maapi.MaapiSchemas loadSchemas() throws com.tailf.conf.ConfException
```

Types: [MaapiSchemas](MaapiSchemas.md#maapischemas-821ac70b83b7), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Load Schemas method that downloads all schemas from server into a
 MaapiSchemas container, from which specified schemas can be accessed and
 traversed.

 When loaded the `MaapiSchemas` object is stored
 locally and new calls to this method will return the same instance.

**Returns:** MaapiSchemas object which is container for all downloaded schemas

**Throws**

- `MaapiException` - if loading fails

### loadSchemas(String[]) <a href="#loadschemas-57d79f485410" id="loadschemas-57d79f485410"></a>

```java
public com.tailf.maapi.MaapiSchemas loadSchemas(
    String[] namespaceURIs0
)
    throws com.tailf.conf.ConfException
```

Types: [MaapiSchemas](MaapiSchemas.md#maapischemas-821ac70b83b7), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Load Schemas method that downloads a specified number of schemas
 the server into a MaapiSchemas container, from which specified schemas
 can be accessed and transversed.

 When loaded the MaapiSchemas object
 is stored locally and new calls to this method will return the same
 instance.

**Parameters**

- `String[] namespaceURIs0` - string array of URIs for the schemas to load

**Returns:** MaapiSchemas object which is container for all downloaded schemas

**Throws**

- `MaapiException` - if loading fails

### lock(int) <a href="#lock-51793ae61d79" id="lock-51793ae61d79"></a>

```java
public synchronized void lock(int db) throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This function is used to take a lock on one of the databases.


 Only one entity may own the lock at any given time.


 You do not have to acquire the lock before you read or write to a
 transaction.


 This lock is also taken by the CLI when the user enters exclusive mode.
 Depending on the configuration different locks will be taken, ie, if the
 system has been configured to have a candidate, and a writable running
 configuration then both a lock on running and a lock on the candidate
 database will be acquired.


 The following locks are acquired when you enter configure exclusive mode
 in the CLI:


 If the system is configured with a startup db, and no writable running or
 candidate: lock startup


 If the system is configured with a writable running and no startup or
 candidate db: lock running


 If the system is configured with a writable running and a startup db, and
 no candidate: lock running and startup.


 If the system is configured with a writable running and a candidate db,
 and no startup: lock running and candidate.

**Parameters**

- `int db` - Database to lock. Possible values are STARTUP, RUNNING, and
            CANDIDATE

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### lockPartial(int, String) <a href="#lockpartial-1825ddb23210" id="lockpartial-1825ddb23210"></a>

```java
public synchronized int lockPartial(
    int db,
    String xpath
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Same as [`lockPartial(int,String[])`](Maapi.md#lockpartial-855a7312fb52) except only one xpath
 expression is given.

**Parameters**

- `int db` - Database to lock
- `String xpath` - XPath expression

**Returns:** Lock identifier

**Throws**

- `IOException` - if I/O error occurs
- `ConfException` - if lock cannot be acquired

### lockPartial(int, String[]) <a href="#lockpartial-855a7312fb52" id="lockpartial-855a7312fb52"></a>

```java
public synchronized int lockPartial(
    int db,
    String[] xpaths
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

It is possible to manipulate partial locks on the databases, i.e. locks
 on a specified set of leaves and/or subtrees. The specification of what
 to lock is given via the xpaths array, which is populated with xpath
 string expressions. If the lock succeeds, lockPartial() returns a lock
 identifier, which is used in the unlockPartial() call.

**Parameters**

- `int db` - Database
- `String[] xpaths` - Array of xpath expressions to lock

**Returns:** A lock identifier which is used for unlockPartial()

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### move(int, ConfKey, String, Object[]) <a href="#move-af8f50a08374" id="move-af8f50a08374"></a>

```java
public synchronized void move(
    int tid,
    com.tailf.conf.ConfKey tokey,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfKey](../conf/ConfKey.md#confkey-e4e1ca98e867), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This function moves an existing object.

 Renames the object using the new instance key tokey.

**Parameters**

- `int tid` - Transaction Identifier
- `com.tailf.conf.ConfKey tokey` - New key for the object
- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### move(int, String, String, Object[]) <a href="#move-9df5c1c81f8c" id="move-9df5c1c81f8c"></a>

```java
public synchronized void move(
    int tid,
    String tokey,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This function moves an existing object

 Renames the object
 using the new instance key tokey represented as a string.

**Parameters**

- `int tid` - Transaction Identifier
- `String tokey` - New key for the object
- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### moveOrdered(int, MoveWhereFlag, ConfKey, String, Object[]) <a href="#moveordered-f7458c93e17a" id="moveordered-f7458c93e17a"></a>

```java
public synchronized void moveOrdered(
    int tid,
    com.tailf.maapi.MoveWhereFlag where,
    com.tailf.conf.ConfKey tokey,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [MoveWhereFlag](MoveWhereFlag.md#movewhereflag-bbc0edc34bda), [ConfKey](../conf/ConfKey.md#confkey-e4e1ca98e867), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

For a list with the YANG ordered-by user statement, this function can be
 used to change the order of entries, by moving one entry to a new
 position. When new entries in such a list are created with
 Maapi.create(), they are always placed last in the list. The path given
 by fmt and the remaining arguments identifies the entry to move, and the
 new position is given by the where argument:

 MoveWhereFlag.MOVE_FIRST Move the entry first in the list. The tokey
 arguments is ignored, and can be given as NULL.

 MoveWhereFlag.MOVE_LAST Move the entry last in the list. The tokey
 arguments is ignored, and can be given as NULL.

 MoveWhereFlag.MOVE_BEFORE Move the entry to the position before the entry
 given by the tokey argument.

 MoveWhereFlag.MOVE_AFTER Move the entry to the position after the entry
 given by the tokey argument.

**Parameters**

- `int tid` - current transaction
- `com.tailf.maapi.MoveWhereFlag where` - MoveWhereFlag movement flag
- `com.tailf.conf.ConfKey tokey` - key as base for relative movements
- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### ncsApplyTemplate(int, String, ConfPath, Properties, boolean) <a href="#ncsapplytemplate-17a602f0e3cd" id="ncsapplytemplate-17a602f0e3cd"></a>

```java
public synchronized void ncsApplyTemplate(
    int tid,
    String template,
    com.tailf.conf.ConfPath rootIKP,
    java.util.Properties variables,
    boolean createShared
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Applies an NCS template to the specified path.

**Parameters**

- `int tid` - a transaction id which should be attached to the maapi
  connection
- `String template` - name of the template
- `com.tailf.conf.ConfPath rootIKP` - the initial context and root context for evaluation of
  XPath expressions
- `java.util.Properties variables` - a set of key value pairs where each key will be
  an XPath variable.
- `boolean createShared` - whether to use shared create operations

**Throws**

- `IOException` - if I/O error occurs
- `ConfException` - if operation fails

### ncsApplyTemplate(int, String, ConfPath, Properties, String, boolean) <a href="#ncsapplytemplate-66d4f212d128" id="ncsapplytemplate-66d4f212d128"></a>

```java
public synchronized void ncsApplyTemplate(
    int tid,
    String template,
    com.tailf.conf.ConfPath rootIKP,
    java.util.Properties variables,
    String document,
    boolean createShared
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Applies an NCS template to the specified path with document support.

**Parameters**

- `int tid` - a transaction id which should be attached to the maapi
  connection
- `String template` - name of the template
- `com.tailf.conf.ConfPath rootIKP` - the initial context and root context for evaluation of
  XPath expressions
- `java.util.Properties variables` - a set of key value pairs where each key will be
  an XPath variable.
- `String document` - document context for template
- `boolean createShared` - whether to use shared create operations

**Throws**

- `IOException` - if I/O error occurs
- `ConfException` - if operation fails

### ncsGetTemplateVariables(String) <a href="#ncsgettemplatevariables-e56e448a0ec3" id="ncsgettemplatevariables-e56e448a0ec3"></a>

```java
public synchronized String[] ncsGetTemplateVariables(
    String template
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `String template` - template name

**Returns:** String array of variable names that can be used in the
         template

**Throws**

- `IOException` - Signals I/O exception on the underlying socket
- `ConfException` - Signals protocol/usage error

**Deprecated:** Use
 [`Maapi#ncsGetTemplateVariables(String, TemplateType)`](Maapi.md#ncsgettemplatevariables-1f97e9c7f29b) instead.

### ncsGetTemplateVariables(String, TemplateType) <a href="#ncsgettemplatevariables-1f97e9c7f29b" id="ncsgettemplatevariables-1f97e9c7f29b"></a>

```java
public synchronized String[] ncsGetTemplateVariables(
    String template,
    com.tailf.maapi.Maapi.TemplateType types
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [TemplateType](Maapi/TemplateType.md#templatetype-08e95c149f38), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Returns the list of variables that can be used in a specific device,
 service or compliance template.

**Parameters**

- `String template` - template name.
- `com.tailf.maapi.Maapi.TemplateType types` - at which type the template is used, i.e. device, service or
 compliance.

**Returns:** String[] array of variable names that can be used in the
         template.

**Throws**

- `IOException` - Signals I/O exception on the underlying socket
- `ConfException` - Signals protocol/usage error

### ncsRunWithRetry(MaapiRetryableOp) <a href="#ncsrunwithretry-1fda8501d8e3" id="ncsrunwithretry-1fda8501d8e3"></a>

```java
public boolean ncsRunWithRetry(
    com.tailf.maapi.MaapiRetryableOp op
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [MaapiRetryableOp](MaapiRetryableOp.md#maapiretryableop-cfc27c59f49e), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Run `op` with a new read-write transaction against the
 RUNNING datastore. In case of a conflict, retry running `op`.

 Equivalent of ncsRunWithRetry(op, 10, new CommitParams()).
 See ncsRunWithRetry

**Parameters**

- `com.tailf.maapi.MaapiRetryableOp op` - Object implementing the [`MaapiRetryableOp`](MaapiRetryableOp.md#maapiretryableop-cfc27c59f49e).

**Returns:** true if the operation was successfully executed, else false.

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket.

### ncsRunWithRetry(MaapiRetryableOp, int, CommitParams) <a href="#ncsrunwithretry-a6de34ccab91" id="ncsrunwithretry-a6de34ccab91"></a>

```java
public boolean ncsRunWithRetry(
    com.tailf.maapi.MaapiRetryableOp op,
    int maxNumRetries,
    com.tailf.maapi.CommitParams commitParams
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [MaapiRetryableOp](MaapiRetryableOp.md#maapiretryableop-cfc27c59f49e), [CommitParams](CommitParams.md#commitparams-819d9b5483cc), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Run `op` with a new read-write transaction against the
 RUNNING datastore. In case of a conflict, retry running `op`.

 Equivalent of ncsRunWithRetry(op, maxNumRetries, commitParams,
                               EnumSet.noneOf(MaapiFlag.class)).
 See `ncsRunWithRetry(MaapiRetryableOp, int, CommitParams,
                             int, EnumSet)`

**Parameters**

- `com.tailf.maapi.MaapiRetryableOp op` - Object implementing the [`MaapiRetryableOp`](MaapiRetryableOp.md#maapiretryableop-cfc27c59f49e).
- `int maxNumRetries` - Maximum number of retries running `op`.
- `com.tailf.maapi.CommitParams commitParams` - Commit parameters, see [`CommitParams`](CommitParams.md#commitparams-819d9b5483cc).

**Returns:** true if the operation was successfully executed, else false.

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket.

### ncsRunWithRetry(MaapiRetryableOp, int, CommitParams, int, EnumSet&lt;MaapiFlag&gt;) <a href="#ncsrunwithretry-c4e298221362" id="ncsrunwithretry-c4e298221362"></a>

```java
public boolean ncsRunWithRetry(
    com.tailf.maapi.MaapiRetryableOp op,
    int maxNumRetries,
    com.tailf.maapi.CommitParams commitParams,
    int usid,
    java.util.EnumSet<com.tailf.maapi.MaapiFlag> flags
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [MaapiRetryableOp](MaapiRetryableOp.md#maapiretryableop-cfc27c59f49e), [CommitParams](CommitParams.md#commitparams-819d9b5483cc), [MaapiFlag](MaapiFlag.md#maapiflag-6e6635db8a9f), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Run `op` with a new read-write transaction against the
 RUNNING datastore. In case of a conflict, retry running `op`.

 Run `op` with a new read-write transaction, applying it
 if op returns true. The `op` is only retried in case of
 transaction conflicts. Each retry is run using a new transaction.

 The last conflict exception is thrown in case the maximum number
 of retries is reached.

**Parameters**

- `com.tailf.maapi.MaapiRetryableOp op` - Object implementing the com.tailf.maapi.MaapiRetryableOp
           interface
- `int maxNumRetries` - Maximum number of retries running `op`
                      in case of a conflict
- `com.tailf.maapi.CommitParams commitParams` - Commit parameters, see [`CommitParams`](CommitParams.md#commitparams-819d9b5483cc)
- `int usid` - User session id
- `java.util.EnumSet<com.tailf.maapi.MaapiFlag> flags` - Enumset of [`MaapiFlag`](MaapiFlag.md#maapiflag-6e6635db8a9f)

**Returns:** false if the maximum number of retries is reached

**Throws**

- `IOException` - Signals I/O exception on the underlying socket
- `ConfException` - Signals protocol/usage error.

### ncsTemplates() <a href="#ncstemplates-e5c7d0011567" id="ncstemplates-e5c7d0011567"></a>

```java
public synchronized java.util.Set<String> ncsTemplates() throws java.io.IOException, com.tailf.conf.ConfException
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Retrieves all available templates.

**Returns:** set of template names

**Throws**

- `IOException` - if I/O error occurs
- `ConfException` - if operation fails

### netconfSSHCallHome(ConfObject, int) <a href="#netconfsshcallhome-30acdb9b05a8" id="netconfsshcallhome-30acdb9b05a8"></a>

```java
public synchronized void netconfSSHCallHome(
    com.tailf.conf.ConfObject host,
    int port
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Request that ConfD daemon initiates a NETCONF SSH Call Home
 connection (see RFC 8071) to the NETCONF client running on
 host.

**Parameters**

- `com.tailf.conf.ConfObject host` - The ip address or hostname of the client
- `int port` - The port the client listens to

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### netconfSSHCallHomeOpaque(ConfObject, String, int) <a href="#netconfsshcallhomeopaque-199c8be24507" id="netconfsshcallhomeopaque-199c8be24507"></a>

```java
public synchronized void netconfSSHCallHomeOpaque(
    com.tailf.conf.ConfObject host,
    String opaque,
    int port
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Request that ConfD daemon initiates a NETCONF SSH Call Home
 connection (see RFC 8071) to the NETCONF client running on
 host.

**Parameters**

- `com.tailf.conf.ConfObject host` - The ip address or hostname of the client
- `String opaque` - String passed to an external SSH Call Home session
- `int port` - The port the client listens to

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### newCursor(int, ConfPath) <a href="#newcursor-8b18daa02ae5" id="newcursor-8b18daa02ae5"></a>

```java
public synchronized com.tailf.maapi.MaapiCursor newCursor(
    int tid,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [MaapiCursor](MaapiCursor.md#maapicursor-788c065e30cb), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Creates a cursor for a list specified by `path`


 The `MaapiCursor` is used to iterate over the keys of a list.


 When we wish to iterate over key entries we must first create
 a cursor.

 The cursor instance is subsequently used in
 `getNext(MaapiCursor)` to retrieve the next key instance in
 the list. When the cursor retrieves null the whole list has been
 iterated and the cursor can not be reset.

**Parameters**

- `int tid` - current transaction id
- `com.tailf.conf.ConfPath path` - path of the list to be iterated

**Returns:** a new cursor instance

**Throws**

- `IOException` - Signals I/O exception on the underlying socket
- `ConfException` - Signals protocol/usage error

### newCursor(int, String, Object[]) <a href="#newcursor-8f0d3924978a" id="newcursor-8f0d3924978a"></a>

```java
public synchronized com.tailf.maapi.MaapiCursor newCursor(
    int tid,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [MaapiCursor](MaapiCursor.md#maapicursor-788c065e30cb), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Creates a cursor for a list specified by `fmt`.


 The `MaapiCursor` is used to iterate over the keys of a list.


 When we wish to iterate over key entries we must first create
 a cursor. 

 The cursor instance is subsequently used in
 `getNext(MaapiCursor)` to retrieve the next key instance in
 the list. When the cursor retrieves null the whole list has been
 iterated.

 An exhausted cursor cannot be reset.

 For example, if we have the following YANG model:




```
 module mtest {
   namespace "http://tail-f.com/test/mtest/1.0";
   prefix mtest;

   import ietf-inet-types {
     prefix inet;
   }

   container servers {
     list server {
       key name;
       max-elements 64;
       leaf name {
         type string;
       }
       leaf ip {
         type inet:ip-address;
         mandatory true;
       }
       leaf port {
         type inet:port-number;
         mandatory true;
       }
     }
   }
 }
```





 Example usage:





```
 MaapiCursor c = maapi.newCursor(tid, "/mtest:mtest/servers/server");
 ConfKey x;

 while ((x = maapi.getNext(c)) != null) {
    ConfValue nameValue =
        maapi.getElem(tid, "/mtest:mtest/servers/server{%x}/name", x);
    ConfValue ipValue =
        maapi.getElem(tid, "/mtest:mtest/servers/server{%x}/ip", x);
    ConfValue portValue =
        maapi.getElem(tid, "/mtest:mtest/servers/server{%x}/port",x);
 }
```

**Parameters**

- `int tid` - current transaction id
- `String fmt` - path of the list to be iterated
- `Object[] arguments` - optional parameters for substitution in fmt

**Returns:** a new cursor instance

**Throws**

- `IOException` - Signals I/O exception on the underlying socket
- `ConfException` - Signals protocol/usage error

### newCursorWithFilter(int, String, ConfPath) <a href="#newcursorwithfilter-59d94dbcd3ed" id="newcursorwithfilter-59d94dbcd3ed"></a>

```java
public synchronized com.tailf.maapi.MaapiCursor newCursorWithFilter(
    int tid,
    String filter,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [MaapiCursor](MaapiCursor.md#maapicursor-788c065e30cb), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Creates a cursor for a list specified by `path` with an XPath
 filter specified by `filter`.


 The `MaapiCursor` is used to iterate over the keys of a list.


 When we wish to iterate over key entries we must first create
 a cursor.

 The cursor instance is subsequently used in
 `getNext(MaapiCursor)` to retrieve the next key instance in
 the list. When the cursor retrieves null the whole list has been
 iterated and the cursor can not be reset.


 If `filter` is not null, only keys of elements
 matching the filter will be included in the iteration.
 If `filter` is null, this method behaves just as
 `newCursor(int, ConfPath)`

**Parameters**

- `int tid` - current transaction id
- `String filter` - XPath filter for filtering the list
- `com.tailf.conf.ConfPath path` - path of the list to be iterated

**Returns:** a new cursor instance

**Throws**

- `IOException` - Signals I/O exception on the underlying socket
- `ConfException` - Signals protocol/usage error

### newCursorWithFilter(int, String, String, Object[]) <a href="#newcursorwithfilter-6c2962969949" id="newcursorwithfilter-6c2962969949"></a>

```java
public synchronized com.tailf.maapi.MaapiCursor newCursorWithFilter(
    int tid,
    String filter,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [MaapiCursor](MaapiCursor.md#maapicursor-788c065e30cb), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Creates a cursor for a list specified by `fmt` with an XPath
 filter specified by `filter`.


 The `MaapiCursor` is used to iterate over the keys a list.


 When we wish to iterate over key entries we must first create
 a cursor. 

 The cursor instance is subsequently used in
 `getNext(MaapiCursor)` to retrieve the next key instance in
 the list. When the cursor retrieves null the whole list has been
 iterated and the cursor can not be reset.


 If `filter` is not null, only keys of elements
 matching the filter will be included in the iteration.
 If `filter` is null, this method behaves just as
 [`newCursor(int, String, Object...)`](Maapi.md#newcursor-8f0d3924978a)


 Given the same example model as in
 [`newCursor(int, String, Object...)`](Maapi.md#newcursor-8f0d3924978a) one could iterate over
 servers on the 10.x.x.x network with port numbers above 8000 using
 the following cursor call:




```
 MaapiCursor c =
     maapi.newCursorWithFilter(tid,
                               "starts-with(ip, \"10.\") and port > 8000",
                               "/mtest:mtest/servers/server");
```

**Parameters**

- `int tid` - current transaction id
- `String filter` - XPath filter for filtering the list
- `String fmt` - path of the list to be iterated
- `Object[] arguments` - optional parameters for substitution in fmt

**Returns:** a new cursor instance

**Throws**

- `IOException` - Signals I/O exception on the underlying socket
- `ConfException` - Signals protocol/usage error

### performUpgrade(String[]) <a href="#performupgrade-f3fe8fdbc4c1" id="performupgrade-f3fe8fdbc4c1"></a>

```java
public synchronized void performUpgrade(
    String[] loadpathdirs
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Note, This method is only applicable for Confd. For NCS, the In-service
 Data Model Upgrades are directly correlated to NCS packages and have
 more high-level support.

 When initUpgrade() has completed successfully, this function must be
 called to instruct the server to load the new data model files. The
 loadpathdirs parameter is an array of n strings that specify the
 directories to load from.

**Parameters**

- `String[] loadpathdirs` - array of directories

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### popd(int) <a href="#popd-a8354c7232ff" id="popd-a8354c7232ff"></a>

```java
public synchronized void popd(int tid) throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Pops the top position of the directory stack and changes directory

**Parameters**

- `int tid` - Transaction Identifier

**Throws**

- `MaapiException` - If pop directory operation fails
- `IOException` - Signals I/O exception on the underlying socket

### prepareTrans(int) <a href="#preparetrans-f5669cbf3002" id="preparetrans-f5669cbf3002"></a>

```java
public synchronized void prepareTrans(
    int tid
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Prepares the transaction specified by transaction handle `tid`.

 This method must be called as first part of two-phase commit. After
 this method has been called `commitTrans` or
 `abortTrans` must be
 called.


 It will invoke the prepare callback in all participants in the
 transaction. If all participants reply with OK, the second phase of the
 two-phase commit procedure is commenced.

**Parameters**

- `int tid` - Transaction Identifier

**Throws**

- `MaapiException` - If the prepare operation fails
- `IOException` - Signals I/O exception on the underlying socket

### prepareTrans(int, int) <a href="#preparetrans-c4877a24ca10" id="preparetrans-c4877a24ca10"></a>

```java
public synchronized void prepareTrans(
    int tid,
    int flags
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Prepares the transaction specified by transaction handle `tid`.

 This method must be called as first part of two-phase commit. After
 this method has been called `commitTrans` or
 `abortTrans` must be
 called.


 It will invoke the prepare callback in all participants in the
 transaction. If all participants reply with OK, the second phase of the
 two-phase commit procedure is commenced.


 For a definition of the flags, see [`applyTrans(int,boolean)`](Maapi.md#applytrans-94f52f2648ce)

**Parameters**

- `int tid` - Transaction Identifier
- `int flags` - Bitwise ORed flags

**Throws**

- `MaapiException` - If the prepare operation fails
- `IOException` - Signals I/O exception on the underlying socket

### prioMessage(String, String) <a href="#priomessage-8b6028d17d54" id="priomessage-8b6028d17d54"></a>

```java
public synchronized void prioMessage(
    String to,
    String message
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Send a high priority message to a specific user, a specific user session
 or all users depending on the to parameter. If set to a user name, then
 message will be delivered to all CLI and Web UI sessions by that user. If
 set to an integer string, eg "10", then message will be delivered to that
 specific user session, CLI or Web UI. If set to "all" then all users will
 get the message. No formatting of the message is performed as opposed to
 the user message where a timestamp and sender information is added to the
 message.

 The message will not be delayed until the user terminates any ongoing
 command but will be output directly to the terminal without delay.
 Messages sent using the maapi_sys_message and maapi_user_message, on the
 other hand, are not displayed in the middle of some other output but
 delayed until the any ongoing commands have terminated.

**Parameters**

- `String to` - username, integer string session no or "all" for all users
- `String message` - string message to send

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### pushd(int, String, Object[]) <a href="#pushd-217b8af1923d" id="pushd-217b8af1923d"></a>

```java
public synchronized void pushd(
    int tid,
    String fmt,
    Object[] arguments
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Behaves like cd() with the exception that we can subsequently call popd()
 and return to the previous position in the XML data tree.

**Parameters**

- `int tid` - Transaction Identifier
- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `MaapiException` - If push directory operation fails
- `IOException` - Signals I/O exception on the underlying socket

### queryStart(int, String, String, int, int, List&lt;String&gt;, Class&lt;T&gt;) <a href="#querystart-87abe9e2ad2a" id="querystart-87abe9e2ad2a"></a>

```java
public synchronized <T extends com.tailf.maapi.ResultType> com.tailf.maapi.QueryResult<T> queryStart(
    int tid,
    String expr,
    String context,
    int chunkSize,
    int offset,
    java.util.List<String> select,
    Class<T> cls
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [QueryResult](QueryResult.md#queryresult-6b83e74c93ef), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9), [ResultType](ResultType.md#resulttype-1a8a08651698)

Initiate (or starts) a new XPath query attached to the
 transaction given in `tid`.

 Runs an XPath query with default sort order

 If successful a
 [`QueryResult`](QueryResult.md#queryresult-6b83e74c93ef) is returned which represents a query result.

**Type Parameters**

- `T` - result type

**Parameters**

- `int tid` - transaction handle
- `String expr` - XPath expression
- `String context` - A context node
- `int chunkSize` - Result chunksize to fetch
- `int offset` - The offset to start fetch
- `java.util.List<String> select` - A list of XPath "select" expressions
- `Class<T> cls` - Result type

**Returns:** A QueryResult where resulting nodes and values could be
 fetched.

**Throws**

- `IOException` - if the underlying socket or input stream is
 closed for some reason
- `ConfException` - if the XPath parser encounters error for some
 reason

### queryStart(int, String, String, int, int, List&lt;String&gt;, List&lt;String&gt;, boolean, Class&lt;T&gt;) <a href="#querystart-5aa1b3de25ea" id="querystart-5aa1b3de25ea"></a>

```java
public synchronized <T extends com.tailf.maapi.ResultType> com.tailf.maapi.QueryResult<T> queryStart(
    int tid,
    String expr,
    String context,
    int chunkSize,
    int offset,
    java.util.List<String> select,
    java.util.List<String> sort,
    boolean reverseSortOrder,
    Class<T> cls
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [QueryResult](QueryResult.md#queryresult-6b83e74c93ef), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9), [ResultType](ResultType.md#resulttype-1a8a08651698)

Initiate (or starts) a new XPath query attached to the
 transaction given in `th`.

 If successful a
 [`QueryResult`](QueryResult.md#queryresult-6b83e74c93ef) is returned which represents a query result.


 The XPath `expr` string parameter is a primary XPath
 expression which must evaluate to a node-set, the "results".
 For each node in the results node-set every "select" expression is
 evaluated with the result node as its context. For example,
 given the YANG snippet:


```
     list interface {
         key name;
         unique number;
         leaf name {
           type string;
         }
         leaf number {
           type uint32;
           mandatory true;
         }
         leaf enabled {
           type boolean;
           default true;
         }
       ...
       }
```


 and given that we want to find the name and number of all enabled
 interfaces - the expr could be
 `"/interface[enabled='true']"`, and the select
 expressions would be `{ "name","number" }`.


 Note that the select expressions can have any valid XPath expression,
 so if you wanted to find out an interfaces name,
 and whether its number is even or not, the expressions would be:
 `{ "name", "(number mod 2) == 0" } `.



 The `select` parameter determining what to
 include in the result.


 The `chunksize` is
 the possibility to return the result in groups of a particular size.
 This option determines the fetch frequency for a iterator.



 The "chunk" retrieval is done by the [`QueryResult#iterator()`](QueryResult.md#iterator-188aa52d1f86)
 iterator which process result locally and when it needs more
 data it retrieve the next chunk (if available).



 The `offset` is the number of the first result in this
 chunk (i.e. for the first chunk it will be 1).



 If the underlying database supports multiple "tables" there
 is usually also support for "join" (the ability to make a
 filter span several tables), in ConfD/NCS this is usually
 not an issue - reference to "other" tables
 are naturally done using leafref, and thus it is possible to filter on
 "foreign keys" (to use SQL terminology).

**Type Parameters**

- `T` - result type

**Parameters**

- `int tid` - transaction handle
- `String expr` - XPath expression
- `String context` - A context node
- `int chunkSize` - Result chunksize to fetch
- `int offset` - The offset to start fetch
- `java.util.List<String> select` - A list of XPath "select" expressions
- `java.util.List<String> sort` - A list of XPath exressions used for sorting
- `boolean reverseSortOrder` - Set this to true to get items in the reverse
 order (only if "sort" is specified)
- `Class<T> cls` - Result type

**Returns:** A QueryResult where resulting nodes and values could be
 fetched.

**Throws**

- `IOException` - if the underlying socket or input stream is
 closed for some reason
- `ConfException` - if the XPath parser encounters error for some
 reason

### reloadConfig() <a href="#reloadconfig-f726d13d089d" id="reloadconfig-f726d13d089d"></a>

```java
public synchronized void reloadConfig() throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Request that the daemon reloads its configuration files. The daemon will
 also close and re-open its log-files.

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### reloadSchemas() <a href="#reloadschemas-80f123378fc4" id="reloadschemas-80f123378fc4"></a>

```java
public com.tailf.maapi.MaapiSchemas reloadSchemas() throws com.tailf.conf.ConfException
```

Types: [MaapiSchemas](MaapiSchemas.md#maapischemas-821ac70b83b7), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This method throws away any old MaapiSchemas container and downloads a
 new from the server.

 Hence each call of this method will interact with
 the server.

**Returns:** MaapiSchemas object which is container for all downloaded schemas

**Throws**

- `ConfException` - Signals protocol/usage error

### reloadSchemas(String[]) <a href="#reloadschemas-d9542a782000" id="reloadschemas-d9542a782000"></a>

```java
public com.tailf.maapi.MaapiSchemas reloadSchemas(
    String[] namespaceURIs
)
    throws com.tailf.conf.ConfException
```

Types: [MaapiSchemas](MaapiSchemas.md#maapischemas-821ac70b83b7), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This method throws away any old MaapiSchemas container and downloads a
 new from the server.

 Which namespaces are loaded is specified and do not
 need to be the same as the earlier loaded that is viped out. This method
 can therefore unload old schemas and add loading of new schemas.

**Parameters**

- `String[] namespaceURIs` - string array of URIs for the schemas to load

**Returns:** MaapiSchemas object which is container for all downloaded schemas

**Throws**

- `ConfException` - Signals protocol/usage error

### reopenLogs() <a href="#reopenlogs-41bee863dbe9" id="reopenlogs-41bee863dbe9"></a>

```java
public synchronized void reopenLogs() throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Request that the daemon closes and re-opens its log files

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### reportProgress(int, Verbosity, String) <a href="#reportprogress-9b1dc56091be" id="reportprogress-9b1dc56091be"></a>

```java
public synchronized void reportProgress(
    int tid,
    com.tailf.maapi.Maapi.Verbosity verbosity,
    String msg
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Verbosity](Maapi/Verbosity.md#verbosity-a9c618ec424f), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Report progress of an action or transaction.

**Parameters**

- `int tid` - transaction handle
- `com.tailf.maapi.Maapi.Verbosity verbosity` - at which verbosity level the message should be reported
- `String msg` - the message to report

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### requestAction(ConfXMLParam[], int, String, Object[]) <a href="#requestaction-82e02abb5cf9" id="requestaction-82e02abb5cf9"></a>

```java
public synchronized com.tailf.conf.ConfXMLParam[] requestAction(
    com.tailf.conf.ConfXMLParam[] params,
    int nshash,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Same as [`Maapi#requestAction(ConfXMLParam[], String, Object...)`](Maapi.md#requestaction-76bbfd533fa4)

 Since actions are not associated with transactions, the
 namespace hash `nshash` must be provided and the path
 to the action, i.e. the final element must be the name of the
 action in the data model.

 absolute - but see
 `requestActionTh(int,ConfXMLParam[],String,Object...)`.

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params` - action parameters
- `int nshash` - hashvalue for root namespace for the path represented by
        the `fmt` argument
- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Returns:** array of ConfXMLParam

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### requestAction(ConfXMLParam[], String, Object[]) <a href="#requestaction-76bbfd533fa4" id="requestaction-76bbfd533fa4"></a>

```java
public synchronized com.tailf.conf.ConfXMLParam[] requestAction(
    com.tailf.conf.ConfXMLParam[] params,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Invokes an action defined in the data model annotated with
 `tailf:action` (see tailf_yang_extensions(5)).

 The input parameters is specified as `ConfXMLParam`
 as the input array `param` which corresponds to
 the input section of the action.

 The output parameters returned from the method call returns
 a array of `ConfXMLParam` which corresponds to
 the output section of the action.

 Consider the following yang model:


```
 module cs {
     namespace "http://example.com/test/cs/1.0";
     prefix cs;
     import tailf-common {
         prefix tailf;
     }

     typedef math_op {
         type enumeration {
             enum add;
             enum sub;
             enum mul;
             enum div;
             enum square;
         }
     }

     container system {
         list computer {
             key name;
             leaf name {
                 type string;
             }
             tailf:action math {
                 tailf:actionpoint math_cs;
                 input {
                     list operation {
                         min-elements 1;
                         max-elements 3;
                         leaf number {
                             type int32;
                             mandatory true;
                         }
                         leaf type {
                             type math_op;
                             mandatory true;
                         }
                         leaf-list operands {
                             type int16;
                         }
                     }
                 }
                 output {
                     container result {
                         presence "";
                         leaf number {
                             type int32;
                             mandatory true;
                         }
                         leaf type {
                             type math_op;
                             mandatory true;
                         }
                         leaf value {
                             type int16;
                             mandatory true;
                         }
                     }
                 }
             }
         }
     }
 }
```



 The following is a example of how to assemble the action parameters into
 and array of ConfXMLParam and its subclasses:


```
 ConfNamespace n = new cs();
 ConfXMLParam[] params =
     new ConfXMLParam[] {
         new ConfXMLParamStart(n, cs.cs_operation_),
         new ConfXMLParamValue(n, cs.cs_number_,  new ConfInt32(13)),
         new ConfXMLParamValue(n, cs.cs_type_,    new ConfEnumeration(0)),
         new ConfXMLParamValue(n, cs.cs_operands_,
                               new ConfList(new ConfObject[] {
                                            new ConfInt16(13),
                                            new ConfInt16(25) })),
         new ConfXMLParamStop(n, cs.cs_operation_)};
```



 Using this we can call the action:



```
 Maapi maapi = Maapi(socket);
 maapi.setNamespace(
 maapi.startUserSession(admin,
     maapi,
     new String[] { admin },
     new SocketAddress(InetAddress.getLocalHost(), 0));
 //Invokes the specified action with input arguments params
 //and returns the output parameters
 ConfXMLParam[] res = maapi.requestAction(params,
                                /system/computer{fred}/math);
```



 The path given by `fmt` and the varargs list
 is the full path to the action, i.e. the final element must be the
 name of the action element in the YANG model.

 Since actions are not associated with transactions, the namespace
 must be provided and the path must be absolute
 transactions, the namespace must be provided and the path must be
 absolute - but see
 `requestActionTh(int,ConfXMLParam[],String,Object...)`.

 The `Maapi` instance must have an established user
 session before issuing this method call.

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params` - action input parameters
- `String fmt` - path string, this must be an absolute path with its
            root element prefixed, i.e., "/prefix:tagname/...."
- `Object[] arguments` - optional parameters for substitution in fmt

**Returns:** array of ConfXMLParam as the output parameters

**Throws**

- `ConfException` - If the methods invocation fails for some
            reason. The errorCode or message could be obtain
            through `getErrorCode`, `getMessage()`
- `IOException` - Signals that a I/O
            exception has occurred on the stream to ConfD/NCS

### requestAction(List&lt;ConfXMLParam&gt;, int, String, Object[]) <a href="#requestaction-5870f5cf33eb" id="requestaction-5870f5cf33eb"></a>

```java
public synchronized com.tailf.conf.ConfXMLParam[] requestAction(
    java.util.List<com.tailf.conf.ConfXMLParam> params,
    int nshash,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Requests an action

**Parameters**

- `java.util.List<com.tailf.conf.ConfXMLParam> params` - list of XML parameters
- `int nshash` - namespace hash
- `String fmt` - format string for the action path
- `Object[] arguments` - arguments for the format string

**Returns:** array of ConfXMLParam

**Throws**

- `IOException` - if I/O error occurs
- `ConfException` - if operation fails

### requestAction(List&lt;ConfXMLParam&gt;, String, Object[]) <a href="#requestaction-71188d0da7ce" id="requestaction-71188d0da7ce"></a>

```java
public synchronized com.tailf.conf.ConfXMLParam[] requestAction(
    java.util.List<com.tailf.conf.ConfXMLParam> params,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Same as [`Maapi#requestAction(ConfXMLParam[], String, Object...)`](Maapi.md#requestaction-76bbfd533fa4)
 with the difference that the `params` is `List`
 instead of `ConfXMLParam` array.

 The `Maapi` instance must have an established user
 session before issuing this method call.

**Parameters**

- `java.util.List<com.tailf.conf.ConfXMLParam> params` - action input parameters as `List`
- `String fmt` - path string, this must be an absolute path with its
            root element prefixed, i.e., "/prefix:tagname/...."
- `Object[] arguments` - optional parameters for substitution in fmt

**Returns:** array of `ConfXMLParam` as the output parameters

**Throws**

- `ConfException` - If the methods invocation fails for some
            reason. The errorCode or message could be obtain
            through `getErrorCode`, `getMessage()`
- `IOException` - Signals that a I/O
            exception has occurred on the stream to ConfD/NCS

### requestActionTh(int, ConfXMLParam[], String, Object[]) <a href="#requestactionth-966694378325" id="requestactionth-966694378325"></a>

```java
public synchronized com.tailf.conf.ConfXMLParam[] requestActionTh(
    int tid,
    com.tailf.conf.ConfXMLParam[] params,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Same as [`Maapi#requestAction(ConfXMLParam[], String, Object...)`](Maapi.md#requestaction-76bbfd533fa4)
 with the difference that the fmt is not required to have a namespace
 prefix in the root tag. The root namespace is instead retrieved from
 the transaction indicated by the tid argument.
 Also, the user session of the transaction owner is used for the action
 invocation.
 This function may be convenient in some cases where actions are invoked
 in conjunction with a transaction, and it must be used if the action
 needs to access the transaction store.

**Parameters**

- `int tid` - current transaction handle
- `com.tailf.conf.ConfXMLParam[] params` - action parameters
- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Returns:** array of ConfXMLParam

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### requestActionTh(int, List&lt;ConfXMLParam&gt;, String, Object[]) <a href="#requestactionth-07b010c43efc" id="requestactionth-07b010c43efc"></a>

```java
public synchronized com.tailf.conf.ConfXMLParam[] requestActionTh(
    int tid,
    java.util.List<com.tailf.conf.ConfXMLParam> params,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Requests an action

**Parameters**

- `int tid` - transaction identifier
- `java.util.List<com.tailf.conf.ConfXMLParam> params` - list of XML parameters
- `String fmt` - format string for the action path
- `Object[] arguments` - arguments for the format string

**Returns:** array of ConfXMLParam

**Throws**

- `IOException` - if I/O error occurs
- `ConfException` - if operation fails

### requestTerm(int, ConfEObject) <a href="#requestterm-a8fce80da6f1" id="requestterm-a8fce80da6f1"></a>

```java
protected com.tailf.conf.ConfResponse requestTerm(
    int op,
    com.tailf.proto.ConfEObject arg
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](../conf/ConfResponse.md#confresponse-fd02dad17b49), [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `int op`
- `com.tailf.proto.ConfEObject arg`

### requestTerm(int, int, boolean, ConfEObject) <a href="#requestterm-9be76a263e1e" id="requestterm-9be76a263e1e"></a>

```java
protected synchronized com.tailf.conf.ConfResponse requestTerm(
    int op,
    int thandle,
    boolean isRel,
    com.tailf.proto.ConfEObject arg
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfResponse](../conf/ConfResponse.md#confresponse-fd02dad17b49), [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `int op`
- `int thandle`
- `boolean isRel`
- `com.tailf.proto.ConfEObject arg`

### revert(int) <a href="#revert-72c8f2d56330" id="revert-72c8f2d56330"></a>

```java
public synchronized void revert(int tid) throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Remove all changes in the transaction.

**Parameters**

- `int tid` - transaction identifier

**Throws**

- `IOException` - if I/O error occurs
- `ConfException` - if operation fails

### rollbackConfig(int, String, String[]) <a href="#rollbackconfig-859e41b41c22" id="rollbackconfig-859e41b41c22"></a>

```java
public synchronized com.tailf.maapi.MaapiInputStream rollbackConfig(
    int tid,
    String fmt,
    String[] args
)
    throws com.tailf.maapi.MaapiException
```

Types: [MaapiInputStream](MaapiInputStream.md#maapiinputstream-2e53bf185d47), [MaapiException](MaapiException.md#maapiexception-af58eb4e109e)

This function can be used to save the equivalent of a rollback file for a
 given configuration before it is committed (or a subtree thereof) in
 curly bracket format.

 The provided path indicates where we want the configuration to be rooted.
 It must be a prefix pre pended keypath. If fmt is null, a rollback config
 for the entire configuration is dumped. If for example fmt is
 "/aaa:aaa/authentication/users" we create a rollback config for a part of
 the AAA data. It is not possible to extract non-config data using this
 function.

 The data is returned as a MaapiInputStream that is used to download the
 configuration @see MaapiInputStream

**Parameters**

- `int tid` - transaction id for current transaction
- `String fmt` - path indicating where the configuration to be rooted
- `String[] args` - variable argument list for c-style parameters in fmtPath

**Returns:** MaapiInputStream

**Throws**

- `MaapiException` - if the rollback config operation fails

### safeCreate(int, ConfPath) <a href="#safecreate-83138734c168" id="safecreate-83138734c168"></a>

```java
public synchronized void safeCreate(
    int tid,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Create a new list entity in the XML tree. This is variant of
 the create() method that doesn't throw an exception if the object already
 exists.

**Parameters**

- `int tid` - Transaction Identifier
- `com.tailf.conf.ConfPath path` - Path to the element to create

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### safeCreate(int, String, Object[]) <a href="#safecreate-fd641bd6a26a" id="safecreate-fd641bd6a26a"></a>

```java
public synchronized void safeCreate(
    int tid,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Create a new entity in the XML tree. This is variant of
 the create() method that doesn't throw an exception if the object already
 exists.

**Parameters**

- `int tid` - Transaction Identifier
- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### safeDelete(int, String, Object[]) <a href="#safedelete-63e20fc90d9c" id="safedelete-63e20fc90d9c"></a>

```java
public synchronized void safeDelete(
    int tid,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Deletes a node and all its children from the XML data tree.

 Version of
 `delete` that doesn't throw an exception if the
 element doesn't exist

**Parameters**

- `int tid` - Transaction Identifier
- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### safeGetElem(int, ConfPath) <a href="#safegetelem-dae7a1dfe2d6" id="safegetelem-dae7a1dfe2d6"></a>

```java
public synchronized com.tailf.conf.ConfValue safeGetElem(
    int tid,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Reads a value from the `path` specified


 The path must lead to a leaf element in the data tree.



 This is a equivalent method of[`getElem(int,String,Object[])`](Maapi.md#getelem-1415a215bb24)
 method which returns null if the element doesn't exist instead
 of throwing a exception.

**Parameters**

- `int tid` - transaction handle
- `com.tailf.conf.ConfPath path` - leaf element in data tree

**Returns:** A ConfValue that describes the value of the element.

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### safeGetElem(int, String, Object[]) <a href="#safegetelem-f0faee5cac1f" id="safegetelem-f0faee5cac1f"></a>

```java
public synchronized com.tailf.conf.ConfValue safeGetElem(
    int tid,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This reads a value from the path in fmt and returns the result. The path
 must lead to a leaf element in the XML data tree. This is a variant of
 the getElem() method which returns null if the element doesn't exist

**Parameters**

- `int tid` - Transaction Identifier
- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Returns:** A ConfValue that describes the value of the element.

**Throws**

- `MaapiException` - If the element cannot be retrieved
- `IOException` - Signals I/O exception on the underlying socket

### safeGetObject(int, String, Object[]) <a href="#safegetobject-adb85d9a574d" id="safegetobject-adb85d9a574d"></a>

```java
public synchronized com.tailf.conf.ConfObject[] safeGetObject(
    int tid,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This is a variant of getObject() that returns null if the object doesn't
 exist

**Parameters**

- `int tid` - Transaction Identifier
- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Returns:** An array of ConfObject which describes the object.

**Throws**

- `MaapiException` - If the operation fails
- `IOException` - Signals I/O exception on the underlying socket

### saveConfig(int, EnumSet&lt;MaapiConfigFlag&gt;) <a href="#saveconfig-d9663132ee61" id="saveconfig-d9663132ee61"></a>

```java
public synchronized com.tailf.maapi.MaapiInputStream saveConfig(
    int tid,
    java.util.EnumSet<com.tailf.maapi.MaapiConfigFlag> flags
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [MaapiInputStream](MaapiInputStream.md#maapiinputstream-2e53bf185d47), [MaapiConfigFlag](MaapiConfigFlag.md#maapiconfigflag-53df41e9a7b7), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Save the entire config in different formats.




<table BORDER=1>
  <caption>
  Retrieves an <code>InputStream</code> with <code>flags</code>
  parameter which controls the format as follows:
  </caption>
  <tr>
    <td></td>
    <!--<td align=CENTER > <b>Flag</b></td>
    <td align=CENTER > <b>Description</b></td>-->
    <td><b>Flag</b></td>
    <td><b>Description</b></td>
  </tr>
  <tr>
    <td><b>Raw-XML</b></td>
    <td>{@link MaapiConfigFlag#XML_FORMAT},
        {@link MaapiConfigFlag#MAAPI_CONFIG_XML}
    </td>
    <td>The configuration format is XML</td>
  </tr>
  <tr>
    <td><b>Pretty-XML</b></td>
    <td>{@link MaapiConfigFlag#XML_PRETTY},
        {@link MaapiConfigFlag#MAAPI_CONFIG_XML_PRETTY}
    </td>
    <td>The configuration format is pretty printed XML</td>
  </tr>
  <tr>
    <td><b>Juniper CLI format</b></td>
    <td>{@link MaapiConfigFlag#MAAPI_CONFIG_J},
      {@link MaapiConfigFlag#JUNIPER_CLI_FORMAT}
    </td>
    <td>The configuration is in curly brace Juniper CLI format</td>
  </tr>
  <tr>
    <td><b>Cisco XR CLI format</b></td>
    <td>{@link MaapiConfigFlag#MAAPI_CONFIG_C_IOS},
      {@link MaapiConfigFlag#CISCO_XR_FORMAT}
    </td>
    <td>The configuration is in Cisco XR style format</td>
  </tr>
  <tr>
    <td><b>Cisco IOS CLI format</b></td>
    <td>{@link MaapiConfigFlag#MAAPI_CONFIG_C_IOS},
      {@link MaapiConfigFlag#CISCO_IOS_FORMAT}
    </td>
    <td>The configuration is in Cisco IOS style format</td>
  </tr>

 </table>


 By default, the treatment of nodes with a  `tailf:hidden`
 statement depends on the state of the transaction. For a transaction
 started via MAAPI, no nodes are hidden, while for a transaction started
 by another northbound agent (e.g. CLI) and attached to, the nodes that
 are hidden are the same as in that agent session. The default can be
 overridden by using one of the flags
 [`MaapiConfigFlag#MAAPI_CONFIG_HIDE_ALL`](MaapiConfigFlag.md#maapi_config_hide_all-161f42eaba86) and
 [`MaapiConfigFlag#MAAPI_CONFIG_UNHIDE_ALL`](MaapiConfigFlag.md#maapi_config_unhide_all-6db0d84095d7).


 Entire configuration is dumped, except that
 namespaces with restricted export (from 'confdc/ncsc --export') are
 treated as follows:


- When the `MAAPI_CONFIG_XML` or
 `MAAPI_CONFIG_XML_PRETTY` formats are used, the context of the
 user session that started the transaction is used to select namespaces
 with restricted export. If the "system" context is used, all namespaces
 are selected, regardless of export restriction.
- When one of the CLI formats is used, the context used to select
 namespaces with restricted export is always "CLI".



 The library will initialize a new socket to the end point specified
 by the initial socket (which was created during initialization of
 this Maapi instance) thus it is up to the use

**Parameters**

- `int tid` - transaction id of the current transaction
- `java.util.EnumSet<com.tailf.maapi.MaapiConfigFlag> flags` - format parameters (see the table above ) with additional
            `MAAPI_CONFIG_WITH_DEFAULTS`,
            `MAAPI_CONFIG_SHOW_DEFAULTS` for controlling
            the defaults

**Returns:** MaapiInputStream On success

**Throws**

- `ConfException` - If the methods invocation fails for some
            reason. The errorCode or message could be obtain
            through `getErrorCode`, `getMessage()`
- `IOException` - Signals that a I/O
            exception has occurred on the stream to ConfD/NCS

**See also:** `#saveConfig(int,EnumSet,ConfPath)`

### saveConfig(int, EnumSet&lt;MaapiConfigFlag&gt;, ConfPath) <a href="#saveconfig-b6febd268628" id="saveconfig-b6febd268628"></a>

```java
public synchronized com.tailf.maapi.MaapiInputStream saveConfig(
    int tid,
    java.util.EnumSet<com.tailf.maapi.MaapiConfigFlag> flags,
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [MaapiInputStream](MaapiInputStream.md#maapiinputstream-2e53bf185d47), [MaapiConfigFlag](MaapiConfigFlag.md#maapiconfigflag-53df41e9a7b7), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Save the subtree in different formats.




<table BORDER=1>
  <caption>
  Retrieves an <code>InputStream</code> from a given path
  specified by <code>fmt</code> with <code>flags</code> parameter
  which controls the format as follows:
  </caption>
  <tr>
    <td></td>
    <!--<td align=CENTER > <b>Flag</b></td>
    <td align=CENTER > <b>Description</b></td>-->
    <td><b>Flag</b></td>
    <td><b>Description</b></td>
  </tr>
  <tr>
    <td><b>Raw-XML</b></td>
    <td>{@link MaapiConfigFlag#XML_FORMAT},
        {@link MaapiConfigFlag#MAAPI_CONFIG_XML}
    </td>
    <td>The configuration format is XML</td>
  </tr>
  <tr>
    <td><b>Pretty-XML</b></td>
    <td>{@link MaapiConfigFlag#XML_PRETTY},
        {@link MaapiConfigFlag#MAAPI_CONFIG_XML_PRETTY}
    </td>
    <td>The configuration format is pretty printed XML</td>
  </tr>
  <tr>
    <td><b>Juniper CLI format</b></td>
    <td>{@link MaapiConfigFlag#MAAPI_CONFIG_J},
      {@link MaapiConfigFlag#JUNIPER_CLI_FORMAT}
   </td>
    <td>The configuration is in curly brace Juniper CLI format</td>
  </tr>
  <tr>
    <td><b>Cisco XR CLI format</b></td>
    <td>{@link MaapiConfigFlag#MAAPI_CONFIG_C_IOS},
      {@link MaapiConfigFlag#CISCO_XR_FORMAT}
   </td>
    <td>The configuration is in Cisco XR style format</td>
  </tr>
  <tr>
    <td><b>Cisco IOS CLI format</b></td>
    <td>{@link MaapiConfigFlag#MAAPI_CONFIG_C_IOS},
      {@link MaapiConfigFlag#CISCO_IOS_FORMAT}
   </td>
    <td>The configuration is in Cisco IOS style format</td>
  </tr>

 </table>



  The provided path indicates from where the configuration is to be
 rooted. If for example fmt is "/aaa:aaa/authentication/users" we only
 dump a part of the AAA data. It must be a prefix pre pended keypath.

 By default, the treatment of nodes with a  `tailf:hidden`
 statement depends on the state of the transaction. For a transaction
 started via MAAPI, no nodes are hidden, while for a transaction started
 by another northbound agent (e.g. CLI) and attached to, the nodes that
 are hidden are the same as in that agent session. The default can be
 overridden by using one of the flags
 [`MaapiConfigFlag#MAAPI_CONFIG_HIDE_ALL`](MaapiConfigFlag.md#maapi_config_hide_all-161f42eaba86) and
 [`MaapiConfigFlag#MAAPI_CONFIG_UNHIDE_ALL`](MaapiConfigFlag.md#maapi_config_unhide_all-6db0d84095d7).

 By default, the NCS service-meta-data attributes (refcounter,
 backpointer, and original-value) are not included in the configuration.
 The flag [`MaapiConfigFlag#MAAPI_CONFIG_WITH_SERVICE_META`](MaapiConfigFlag.md#maapi_config_with_service_meta-262400830f06) can
 be used to request that these attributes should be included.

 The library will initialize a new socket to the end point specified
 by the initial socket (which was created during initialization of
 this Maapi instance) thus it is up to the use

**Parameters**

- `int tid` - transaction id of the current transaction
- `java.util.EnumSet<com.tailf.maapi.MaapiConfigFlag> flags` - format parameters (see the table above ) with additional
            `MAAPI_CONFIG_WITH_DEFAULTS`,
            `MAAPI_CONFIG_SHOW_DEFAULTS` for controlling
            the defaults
            `MAAPI_CONFIG_READ_WRITE_ACCESS_ONLY` for saving
            only nodes for which the user has read_write access
- `com.tailf.conf.ConfPath path` - path indicating where the configuration to be rooted

**Returns:** MaapiInputStream On success

**Throws**

- `ConfException` - If the methods invocation fails for some
            reason. The errorCode or message could be obtain
            through `getErrorCode`, `getMessage()`
- `IOException` - Signals that a I/O
            exception has occurred on the stream to ConfD/NCS

### saveConfig(int, EnumSet&lt;MaapiConfigFlag&gt;, String, Object[]) <a href="#saveconfig-3292de5923e0" id="saveconfig-3292de5923e0"></a>

```java
public synchronized com.tailf.maapi.MaapiInputStream saveConfig(
    int tid,
    java.util.EnumSet<com.tailf.maapi.MaapiConfigFlag> flags,
    String fmt,
    Object[] args
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [MaapiInputStream](MaapiInputStream.md#maapiinputstream-2e53bf185d47), [MaapiConfigFlag](MaapiConfigFlag.md#maapiconfigflag-53df41e9a7b7), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Save the subtree in different formats, with ability to XPath Filtering.




<table BORDER=1>
  <caption>
  Retrieves an <code>InputStream</code> from a given path
  specified by <code>fmt</code> with <code>flags</code> parameter
  which controls the format as follows:
  </caption>
  <tr>
    <td></td>
    <!--<td align=CENTER > <b>Flag</b></td>
    <td align=CENTER > <b>Description</b></td>-->
    <td><b>Flag</b></td>
    <td><b>Description</b></td>
  </tr>
  <tr>
    <td><b>Raw-XML</b></td>
    <td>{@link MaapiConfigFlag#XML_FORMAT},
        {@link MaapiConfigFlag#MAAPI_CONFIG_XML}
    </td>
    <td>The configuration format is XML</td>
  </tr>
  <tr>
    <td><b>Pretty-XML</b></td>
    <td>{@link MaapiConfigFlag#XML_PRETTY},
        {@link MaapiConfigFlag#MAAPI_CONFIG_XML_PRETTY}
    </td>
    <td>The configuration format is pretty printed XML</td>
  </tr>
  <tr>
    <td><b>Juniper CLI format</b></td>
    <td>{@link MaapiConfigFlag#MAAPI_CONFIG_J},
      {@link MaapiConfigFlag#JUNIPER_CLI_FORMAT}
   </td>
    <td>The configuration is in curly brace Juniper CLI format</td>
  </tr>
  <tr>
    <td><b>Cisco XR CLI format</b></td>
    <td>{@link MaapiConfigFlag#MAAPI_CONFIG_C_IOS},
      {@link MaapiConfigFlag#CISCO_XR_FORMAT}
   </td>
    <td>The configuration is in Cisco XR style format</td>
  </tr>
  <tr>
    <td><b>Cisco IOS CLI format</b></td>
    <td>{@link MaapiConfigFlag#MAAPI_CONFIG_C_IOS},
      {@link MaapiConfigFlag#CISCO_IOS_FORMAT}
   </td>
    <td>The configuration is in Cisco IOS style format</td>
  </tr>

 </table>



 The provided path indicates from where the configuration is to be
 rooted. If for example fmt is "/aaa:aaa/authentication/users" we only
 dump a part of the AAA data. It must be a prefix pre pended keypath.

 By default, the treatment of nodes with a  `tailf:hidden`
 statement depends on the state of the transaction. For a transaction
 started via MAAPI, no nodes are hidden, while for a transaction started
 by another northbound agent (e.g. CLI) and attached to, the nodes that
 are hidden are the same as in that agent session. The default can be
 overridden by using one of the flags
 [`MaapiConfigFlag#MAAPI_CONFIG_HIDE_ALL`](MaapiConfigFlag.md#maapi_config_hide_all-161f42eaba86) and
 [`MaapiConfigFlag#MAAPI_CONFIG_UNHIDE_ALL`](MaapiConfigFlag.md#maapi_config_unhide_all-6db0d84095d7).

 For `MAAPI_CONFIG_XML` and `MAAPI_CONFIG_XML_PRETTY`
 it is alternatively possible to give an XPath filter, by
 including the flag [`MaapiConfigFlag#MAAPI_CONFIG_XPATH`](MaapiConfigFlag.md#maapi_config_xpath-1457dd10cb74).

 The library will initialize a new socket to the end point specified
 by the initial socket (which was created during initialization of
 this Maapi instance) thus it is up to the user to close the returning
 InputStream after reading the configuration.

**Parameters**

- `int tid` - transaction id of the current transaction
- `java.util.EnumSet<com.tailf.maapi.MaapiConfigFlag> flags` - format parameters (see the table above ) with additional
            `MAAPI_CONFIG_WITH_DEFAULTS`,
            `MAAPI_CONFIG_SHOW_DEFAULTS` for controlling
            the defaults
- `String fmt` - path indicating where the configuration to be rooted
- `Object[] args` - variable argument list for c-style parameters in fmt

**Returns:** MaapiInputStream On success the library will initialize a
         new socket which is intended to be closed after usage of
         this method by the user

**Throws**

- `ConfException` - If the methods invocation fails for some
            reason. The errorCode or message could be obtain
            through `getErrorCode`, `getMessage()`
- `IOException` - Signals that a I/O
            exception has occurred on the stream to ConfD/NCS

**See also:** `#saveConfig(int,EnumSet,ConfPath)`

### setAttr(int, ConfAttributeValue, String, Object[]) <a href="#setattr-690596d9efb4" id="setattr-690596d9efb4"></a>

```java
public synchronized void setAttr(
    int tid,
    com.tailf.conf.ConfAttributeValue attr,
    String fmt,
    Object[] args
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfAttributeValue](../conf/ConfAttributeValue.md#confattributevalue-d38e058ca48e), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Set an attribute for a configuration node. See getAttrs() above for the
 supported attributes. if the attribute should be removed the
 ConfAttributeValue should be set attr.isRemoveValue()

**Parameters**

- `int tid` - current transaction
- `com.tailf.conf.ConfAttributeValue attr` - ConfAttributeValue object denoting the attribute to set
- `String fmt` - path indicating node to retrieve attributes from
- `Object[] args` - variable argument list for c-style parameters in fmtPath

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### setComment(int, String) <a href="#setcomment-c4c683b45db1" id="setcomment-c4c683b45db1"></a>

```java
public synchronized void setComment(
    int tid,
    String comment
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Set the "Comment" that is stored in the rollback file when a
 transaction towards running is committed. Setting the "Comment" for
 transactions via candidate can be done when the candidate is
 committed to running, by using the `Maapi#candidateCommitInfo`
 method. For a confirmed commit, the "Comment" must also be given via the
 `Maapi#candidateConfirmedCommitInfo` method.

**Parameters**

- `int tid` - Transaction Identifier
- `String comment` - Comment

**Throws**

- `MaapiException` - If setting the comment fails
- `IOException` - Signals I/O exception on the underlying socket

### setDelayedWhen(int, boolean) <a href="#setdelayedwhen-38f32854fd19" id="setdelayedwhen-38f32854fd19"></a>

```java
public synchronized boolean setDelayedWhen(
    int tid,
    boolean on
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This function enables/disables the "delayed when" mode of a transaction.
 When successful, it returns true/false as indication of whether
 "delayed when" was enabled or disabled before the call.

 The YANG when statement makes its parent data definition statement
 conditional. This can be problematic in cases where we don't have
 control over the order of writing different data nodes. E.g. when
 loading configuration from a file, the data that will satisfy the when
 condition may occur after the data that the when applies to, making it
 impossible to actually write the latter data into the transaction -
 since the when isn't satisifed, the data nodes effectively do not
 exist in the schema.

 This is addressed by the "delayed when" mode for a transaction. When
 "delayed when" is enabled, it is possible to write to data nodes even
 though they are conditional on a when that isn't satisfied. It has
 no effect on reading though - trying to read data that is conditional on
 an unsatisfied when will always result in ConfNoExists value or
 equivalent. When disabling "delayed when", any "delayed" when
 statements will take effect immediately - i.e. if the when isn't
 satisfied at that point, the conditional nodes and any data values for
 them will be deleted. If we don't explicitly disable "delayed when"
 by calling this function, it will be automatically disabled when the
 transaction enters the VALIDATE state (e.g. due to call of
 [`applyTrans(int, boolean)`](Maapi.md#applytrans-94f52f2648ce).

**Parameters**

- `int tid` - transaction id
- `boolean on` - true if "delayed when" mode should be activated,
  false if "delayed when" mode should be deactivated.

**Returns:** true if "delayed when" was active before this call,
  otherwise false

**Throws**

- `IOException` - Signals I/O exception on the underlying socket
- `ConfException` - Signals protocol/usage error

### setElem(int, ConfObject, ConfPath) <a href="#setelem-cec1d194abc2" id="setelem-cec1d194abc2"></a>

```java
public synchronized void setElem(
    int tid,
    com.tailf.conf.ConfObject value,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Set value to a leaf node.

 There two different methods to set a value to a leaf node.
 One where the value is a string and one where the value to set is a
 [`ConfObject`](../conf/ConfObject.md#confobject-5433616953b2). The string version
 is useful when we have implemented a management agent where the user
 enters values as strings.

 The version with `ConfObject` is useful when we
 are setting values which we have just read from various API methods
 that returns `ConfObject`.

**Parameters**

- `int tid` - Transaction Identifier
- `com.tailf.conf.ConfObject value` - The value to set.
- `com.tailf.conf.ConfPath path` - Path to the leaf node.

**Throws**

- `IOException` - signals I/O exception on the underlying socket.
- `ConfException` - signals protocol/usage error.

### setElem(int, ConfObject, String, Object[]) <a href="#setelem-d51f890ac736" id="setelem-d51f890ac736"></a>

```java
public synchronized void setElem(
    int tid,
    com.tailf.conf.ConfObject value,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Set value to a leaf node.

 There two different methods to set a value to a leaf node.
 One where the value is a string and one where the value to set is a
 [`ConfObject`](../conf/ConfObject.md#confobject-5433616953b2). The string version
 is useful when we have implemented a management agent where the user
 enters values as strings.

 The version with `ConfObject` is useful when we
 are setting values which we have just read from various API methods
 that returns `ConfObject`.

**Parameters**

- `int tid` - Transaction Identifier
- `com.tailf.conf.ConfObject value` - The value to set
- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `IOException` - Signals I/O exception on the underlying socket
- `ConfException` - Signals protocol/usage error

### setElem(int, String, ConfPath) <a href="#setelem-6e3977480252" id="setelem-6e3977480252"></a>

```java
public synchronized void setElem(
    int tid,
    String value,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Set value to a leaf node.

 There two different methods to set a value to a leaf node.
 One where the value is a string and one where the value to set is a
 [`ConfObject`](../conf/ConfObject.md#confobject-5433616953b2). The string version
 is useful when we have implemented a management agent where the user
 enters values as strings.

 The version with `ConfObject` is useful when we
 are setting values which we have just read from various API methods
 that returns `ConfObject`.

**Parameters**

- `int tid` - Transaction Identifier
- `String value` - The value to set
- `com.tailf.conf.ConfPath path` - ConfPath instance

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### setElem(int, String, String, Object[]) <a href="#setelem-915c0b578eea" id="setelem-915c0b578eea"></a>

```java
public synchronized void setElem(
    int tid,
    String value,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Set value to a leaf node.

 There two different methods to set a value to a leaf node.
 One where the value is a string and one where the value to set is a
 [`ConfObject`](../conf/ConfObject.md#confobject-5433616953b2). The string version
 is useful when we have implemented a management agent where the user
 enters values as strings.

 The version with `ConfObject` is useful when we
 are setting values which we have just read from various API methods
 that returns `ConfObject`.

**Parameters**

- `int tid` - Transaction Identifier
- `String value` - The value to set
- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `IOException` - signals I/O exception on the underlying socket
- `ConfException` - signals protocol/usage error.

### setFlags(int, EnumSet&lt;MaapiFlag&gt;) <a href="#setflags-1158755c6ac8" id="setflags-1158755c6ac8"></a>

```java
public synchronized void setFlags(
    int tid,
    java.util.EnumSet<com.tailf.maapi.MaapiFlag> flags
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [MaapiFlag](MaapiFlag.md#maapiflag-6e6635db8a9f), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This method can modify some aspects of the read/write session, see
 MaapiFlag The flags are an Enumset of [`MaapiFlag`](MaapiFlag.md#maapiflag-6e6635db8a9f)

**Parameters**

- `int tid` - current transaction
- `java.util.EnumSet<com.tailf.maapi.MaapiFlag> flags` - Enumset of [`MaapiFlag`](MaapiFlag.md#maapiflag-6e6635db8a9f)

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### setLabel(int, String) <a href="#setlabel-929d364c78d7" id="setlabel-929d364c78d7"></a>

```java
public synchronized void setLabel(
    int tid,
    String label
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Set the "Label" that is stored in the rollback file when a
 transaction towards running is committed. Setting the "Label" for
 transactions via candidate can be done when the candidate is
 committed to running, by using the `Maapi#candidateCommitInfo`
 method. For a confirmed commit, the "Label" must also be given via the
 `Maapi#candidateConfirmedCommitInfo` method.

**Parameters**

- `int tid` - Transaction Identifier
- `String label` - Label

**Throws**

- `MaapiException` - If setting the label fails
- `IOException` - Signals I/O exception on the underlying socket

### setNamespace(int, int) <a href="#setnamespace-d58798edaf04" id="setnamespace-d58798edaf04"></a>

```java
public synchronized void setNamespace(
    int tid,
    int nsid
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Set the namespace for the transaction using namespace ID.

**Parameters**

- `int tid` - Transaction identifier
- `int nsid` - Namespace ID

**Throws**

- `IOException` - if I/O error occurs
- `ConfException` - if namespace cannot be set

### setNamespace(int, String) <a href="#setnamespace-edc25cbc3dfd" id="setnamespace-edc25cbc3dfd"></a>

```java
public synchronized void setNamespace(
    int tid,
    String ns
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Before can invoke any of read or write functions, we must indicate which
 namespace we are going to use. It is possible to change the namespace
 several times during a transaction.


 The ns string is the namespace URL

**Parameters**

- `int tid` - Transaction Identifier
- `String ns` - Namespace uri

**Throws**

- `MaapiException` - If setting the namespace fails
- `IOException` - Signals I/O exception on the underlying socket

### setNextUserSessionId(int) <a href="#setnextusersessionid-f0914dda055b" id="setnextusersessionid-f0914dda055b"></a>

```java
public synchronized void setNextUserSessionId(
    int usid
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Set the user session id that will be assigned to the next user session
 started. The given value is silently forced to be in the range 100 ..
 2^31-1. This function can be used to ensure that session ids for user
 sessions started by northbound agents or via MAAPI are unique across a
 ConfD/NSO restart.

**Parameters**

- `int usid` - The session id to assign for the next user session

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket.

### setObject(int, ConfObject[], String, Object[]) <a href="#setobject-93cfe3ccc1a9" id="setobject-93cfe3ccc1a9"></a>

```java
public synchronized void setObject(
    int tid,
    com.tailf.conf.ConfObject[] values,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This writes a container object or a list entry object from the path in
 fmt and returns the result. The path must lead to a list entry or a
 container element in the XML data tree.

 The values to set is an array of ConfObjects that describe the entire
 structure. All plain values in the structure, such as strings, ints ip
 addresses are represented as ConfValue instances. If the structure
 contains containers, they are represented as ConfTag instances. Finally,
 optional leafs and containers in the structure that are missing are
 represented as ConfTypeDescriptor instances with type set to
 ConfObject.J_NOEXISTS.

**Parameters**

- `int tid` - the transaction identifier
- `com.tailf.conf.ConfObject[] values` - the values to set
- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `MaapiException` - If setting the object fails
- `IOException` - Signals I/O exception on the underlying socket

### setReadIntent(int, List&lt;String&gt;) <a href="#setreadintent-8a615528e4d7" id="setreadintent-8a615528e4d7"></a>

```java
public synchronized void setReadIntent(
    int tid,
    java.util.List<String> xpaths
)
    throws com.tailf.conf.ConfException, IllegalArgumentException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Set a read intent for the transaction.
 This will overwrite the current read intent.

**Parameters**

- `int tid` - Transaction Identifier
- `java.util.List<String> xpaths` - A list of XPath strings to set read intent

**Throws**

- `ConfException` - If setting read intent fails
- `IllegalArgumentException` - If the list of xpaths is null
- `IOException` - Signals I/O exception on the underlying socket

### setReadIntent(int, String) <a href="#setreadintent-66ba57478cb6" id="setreadintent-66ba57478cb6"></a>

```java
public synchronized void setReadIntent(
    int tid,
    String xpath
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Set a read intent for the transaction.
 This will overwrite the current read intent.

**Parameters**

- `int tid` - Transaction Identifier
- `String xpath` - XPath string to set read intent on

**Throws**

- `ConfException` - If setting read intent fails
- `IllegalArgumentException` - If the xpath is null
- `IOException` - Signals I/O exception on the underlying socket

### setReadOnlyMode(boolean) <a href="#setreadonlymode-fde2440b8220" id="setreadonlymode-fde2440b8220"></a>

```java
public synchronized void setReadOnlyMode(
    boolean flag
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Control if the node should accept write transactions

**Parameters**

- `boolean flag` - Mode

**Throws**

- `ConfException` - signals protocol/usage error
- `IOException` - signals I/O exception on the underlying socket

### setRunningDbStatus(int) <a href="#setrunningdbstatus-fa121ea57064" id="setrunningdbstatus-fa121ea57064"></a>

```java
public synchronized void setRunningDbStatus(
    int status
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Explicitly sets the systems notion of the consistency
 state.

**Parameters**

- `int status` - consistency state value

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### setUserSession(int) <a href="#setusersession-ff36c06a3ef4" id="setusersession-ff36c06a3ef4"></a>

```java
public synchronized void setUserSession(
    int usid
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Associate this Maapi instance with an already existing user session.

 This can be used instead
 [`Maapi#startUserSession(String, String, String[], SocketAddress,
 MaapiUserSessionFlag)`](Maapi.md#startusersession-677e9394622e)
 when we really do not want to start a new user session, e.g. if we want
 to call an action on behalf of a given user session

**Parameters**

- `int usid` - user session id

**Throws**

- `ConfException` - Signals protocol/usage error
- `IOException` - Signals I/O exception on the underlying socket

### setValues(int, ConfXMLParam[], ConfPath) <a href="#setvalues-27a83fbfcc37" id="setvalues-27a83fbfcc37"></a>

```java
public synchronized void setValues(
    int tid,
    com.tailf.conf.ConfXMLParam[] params,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Set arbitrary sub-elements of a container element in one bulk operation.

 If the container element itself, or any sub-elements that are specified
 as existing, do not exist before this call, they will be created,
 otherwise the existing values will be updated. Both non-optional and
 optional elements may be omitted from the array, and all omitted elements
 are left unchanged.

**Parameters**

- `int tid` - the transaction identifier
- `com.tailf.conf.ConfXMLParam[] params` - the list of parameters to set
- `com.tailf.conf.ConfPath path` - the path to the container element

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### setValues(int, ConfXMLParam[], String, Object[]) <a href="#setvalues-5a5e209f0f09" id="setvalues-5a5e209f0f09"></a>

```java
public synchronized void setValues(
    int tid,
    com.tailf.conf.ConfXMLParam[] params,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Set arbitrary sub-elements of a container element in one bulk operation.

 If the container element itself, or any sub-elements that are specified
 as existing, do not exist before this call, they will be created,
 otherwise the existing values will be updated. Both non-optional and
 optional elements may be omitted from the array, and all omitted elements
 are left unchanged.

**Parameters**

- `int tid` - the transaction identifier
- `com.tailf.conf.ConfXMLParam[] params` - the list of parameters to set
- `String fmt` - the format string for the path
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### setValues(int, List&lt;ConfXMLParam&gt;, ConfPath) <a href="#setvalues-79c83d25babb" id="setvalues-79c83d25babb"></a>

```java
public synchronized void setValues(
    int tid,
    java.util.List<com.tailf.conf.ConfXMLParam> params,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Set arbitrary sub-elements of a container element in one bulk operation.

 If the container element itself, or any sub-elements that are specified
 as existing, do not exist before this call, they will be created,
 otherwise the existing values will be updated. Both non-optional and
 optional elements may be omitted from the array, and all omitted elements
 are left unchanged.

**Parameters**

- `int tid` - the transaction identifier
- `java.util.List<com.tailf.conf.ConfXMLParam> params` - the list of parameters to set
- `com.tailf.conf.ConfPath path` - the path to the container element

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### setValues(int, List&lt;ConfXMLParam&gt;, String, Object[]) <a href="#setvalues-881fed8155cc" id="setvalues-881fed8155cc"></a>

```java
public synchronized void setValues(
    int tid,
    java.util.List<com.tailf.conf.ConfXMLParam> params,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Set arbitrary sub-elements of a container element in one bulk operation.

 If the container element itself, or any sub-elements that are specified
 as existing, do not exist before this call, they will be created,
 otherwise the existing values will be updated. Both non-optional and
 optional elements may be omitted from the array, and all omitted elements
 are left unchanged.

**Parameters**

- `int tid` - the transaction identifier
- `java.util.List<com.tailf.conf.ConfXMLParam> params` - the list of parameters to set
- `String fmt` - the format string for the path
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### sharedCreate(int, ConfPath) <a href="#sharedcreate-4e9109f58b36" id="sharedcreate-4e9109f58b36"></a>

```java
public synchronized void sharedCreate(
    int tid,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This is the variant of create() to use from FASTMAP code. I.e NCS
 code that creates NCS services.
 The sharedCreate() method is used by NCS service code to create
 data in the /devices/device tree which is shared by multiple
 NCS servcie instances. Everything that is created, gets a reference
 counter associated to it, this is so that the FASTMAP algorithm
 shall not delete data that is still used by other service
 instances.

 Furthermore, everything that is created with this method, also gets
 an additional attribute set, called 'Backpointer' which points
 back to the service instance that created the entity in the first
 place. This makes it possible to look at the /devices tree and answer
 the question which parts of the device configurtaion was created
 by which service(es)

**Parameters**

- `int tid` - Transaction Identifier
- `com.tailf.conf.ConfPath path` - Path to the element to create

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### sharedCreate(int, String, Object[]) <a href="#sharedcreate-a1cc616c4565" id="sharedcreate-a1cc616c4565"></a>

```java
public synchronized void sharedCreate(
    int tid,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Create shared element for NCS FastMap code.
 Equivalent to `sharedCreate(int, ConfPath)`.

**Parameters**

- `int tid` - Transaction identifier
- `String fmt` - Path string
- `Object[] arguments` - Optional parameters for substitution in fmt

**Throws**

- `IOException` - if I/O error occurs
- `ConfException` - if element cannot be created

### sharedSetElem(int, ConfObject, ConfPath) <a href="#sharedsetelem-5fcf55dfed0c" id="sharedsetelem-5fcf55dfed0c"></a>

```java
public synchronized void sharedSetElem(
    int tid,
    com.tailf.conf.ConfObject value,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Set value to a leaf node from NCS FastMap code.

**Parameters**

- `int tid` - Transaction Identifier
- `com.tailf.conf.ConfObject value` - The value to set
- `com.tailf.conf.ConfPath path` - Path to the leaf node

**Throws**

- `IOException` - if I/O error occurs
- `ConfException` - if element cannot be set

### sharedSetElem(int, ConfObject, String, Object[]) <a href="#sharedsetelem-f484c0aeee76" id="sharedsetelem-f484c0aeee76"></a>

```java
public synchronized void sharedSetElem(
    int tid,
    com.tailf.conf.ConfObject value,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Set value to a leaf node from NCS FastMap code
 This method is the equivalent of setElem() except that it
 can only be called from NCS FastMap service code. It will
 ensure that when service code manipulates leaves, everything
 will always be cleaned up when the service is removed.

**Parameters**

- `int tid` - Transaction Identifier
- `com.tailf.conf.ConfObject value` - The value to set
- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `IOException` - signals I/O exception on the underlying socket
- `ConfException` - signals protocol/usage error

### sharedSetElem(int, String, String, Object[]) <a href="#sharedsetelem-33c0b474ee87" id="sharedsetelem-33c0b474ee87"></a>

```java
public synchronized void sharedSetElem(
    int tid,
    String value,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Set value to a leaf node from NCS FastMap code.

**Parameters**

- `int tid` - Transaction Identifier
- `String value` - The value to set
- `String fmt` - path string
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `IOException` - if I/O error occurs
- `ConfException` - if element cannot be set

### sharedSetValues(int, ConfXMLParam[], ConfPath) <a href="#sharedsetvalues-d20611e05b40" id="sharedsetvalues-d20611e05b40"></a>

```java
public synchronized void sharedSetValues(
    int tid,
    com.tailf.conf.ConfXMLParam[] params,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Set arbitrary sub-elements of a container element in one bulk operation
 from NCS FastMap code.

 Everything that is set or created with this method, also gets
 an additional attribute set, called 'Backpointer' which points
 back to the service instance that created the entity in the first
 place. This makes it possible to look at the /devices tree and answer
 the question which parts of the device configuration were created
 by which service(s).

**Parameters**

- `int tid` - the transaction identifier
- `com.tailf.conf.ConfXMLParam[] params` - the list of parameters to set
- `com.tailf.conf.ConfPath path` - the path to the container element

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### sharedSetValues(int, ConfXMLParam[], String, Object[]) <a href="#sharedsetvalues-db5ccd228a3e" id="sharedsetvalues-db5ccd228a3e"></a>

```java
public synchronized void sharedSetValues(
    int tid,
    com.tailf.conf.ConfXMLParam[] params,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Set arbitrary sub-elements of a container element in one bulk operation
 from NCS FastMap code.

**Parameters**

- `int tid` - the transaction identifier
- `com.tailf.conf.ConfXMLParam[] params` - the list of parameters to set
- `String fmt` - the format string for the path
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### sharedSetValues(int, List&lt;ConfXMLParam&gt;, ConfPath) <a href="#sharedsetvalues-bfaa695e71b3" id="sharedsetvalues-bfaa695e71b3"></a>

```java
public synchronized void sharedSetValues(
    int tid,
    java.util.List<com.tailf.conf.ConfXMLParam> params,
    com.tailf.conf.ConfPath path
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Set arbitrary sub-elements of a container element in one bulk operation
 from NCS FastMap code.

 This method is the equivalent of setValues() except that it
 can only be called from NCS FastMap service code. It will
 ensure that when service code manipulates elements, everything
 will always be cleaned up when the service is removed.

**Parameters**

- `int tid` - the transaction identifier
- `java.util.List<com.tailf.conf.ConfXMLParam> params` - the list of parameters to set
- `com.tailf.conf.ConfPath path` - the path to the container element

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### sharedSetValues(int, List&lt;ConfXMLParam&gt;, String, Object[]) <a href="#sharedsetvalues-849a21e341c1" id="sharedsetvalues-849a21e341c1"></a>

```java
public synchronized void sharedSetValues(
    int tid,
    java.util.List<com.tailf.conf.ConfXMLParam> params,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Set arbitrary sub-elements of a container element in one bulk operation
 from NCS FastMap code.

**Parameters**

- `int tid` - the transaction identifier
- `java.util.List<com.tailf.conf.ConfXMLParam> params` - the list of parameters to set
- `String fmt` - the format string for the path
- `Object[] arguments` - optional parameters for substitution in fmt

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### snmpaReload(boolean) <a href="#snmpareload-4fd9a56bd262" id="snmpareload-4fd9a56bd262"></a>

```java
public synchronized void snmpaReload(
    boolean synchronous
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

When the ConfD/NCS SNMP Agent config tree is implemented by an external
 data provider, this method can be used by the data provider to notify
 ConfD/NCS when there is a change to the data.

**Parameters**

- `boolean synchronous` - Whether to wait for the daemon to complete reloading
           the data before returning.

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### snmpSendNotification(String, String, String, SnmpVarbind[]) <a href="#snmpsendnotification-22a7246d4ba1" id="snmpsendnotification-22a7246d4ba1"></a>

```java
public synchronized void snmpSendNotification(
    String notifName,
    String notifyTarget,
    String ctxName,
    com.tailf.conf.SnmpVarbind[] varbinds
)
    throws com.tailf.conf.ConfException
```

Types: [SnmpVarbind](../conf/SnmpVarbind.md#snmpvarbind-ef9f9c3d4932), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Send SNMP notification.

 Sends a notification to the management targets
 defined for 'notifyTarget' in the snmpNotifyTable in
 SNMP-NOTIFICATION-MIB from the specified context. If no NotifyName is
 specified (or if it is ""), the notification is sent to all management
 targets.

**Parameters**

- `String notifName` - Notification name
- `String notifyTarget` - Notification target name
- `String ctxName` - Context name.
- `com.tailf.conf.SnmpVarbind[] varbinds` - An array of variable bindings

**Throws**

- `ConfException` - Signals protocol/usage error

### startPhase(int) <a href="#startphase-752e85521d00" id="startphase-752e85521d00"></a>

```java
public synchronized void startPhase(
    int phase
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Once the ConfD/NCS daemon has been started in phase0 it is possible to
 use this function to tell the daemon to proceed to startPhase 1 or 2.
 Upon return the daemon has completed the transition.

**Parameters**

- `int phase` - Which start phase to proceed to, 1 or 2

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### startPhase(int, boolean) <a href="#startphase-cef9a0a12f3b" id="startphase-cef9a0a12f3b"></a>

```java
public synchronized void startPhase(
    int phase,
    boolean synchronous
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Once the ConfD/NCS daemon has been started in phase0 it is possible to
 use this function to tell the daemon to proceed to start phase 1 or 2.

**Parameters**

- `int phase` - Which start phase to proceed to, 1 or 2
- `boolean synchronous` - Whether to wait for the daemon to complete the
        transition to the requested start phase or return immediately.

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### startSpan(int, Verbosity, String, ConfPath, Attributes, Span[]) <a href="#startspan-e2d5c1669c4e" id="startspan-e2d5c1669c4e"></a>

```java
public synchronized com.tailf.progress.Span startSpan(
    int tid,
    com.tailf.maapi.Maapi.Verbosity verbosity,
    String msg,
    com.tailf.conf.ConfPath path,
    com.tailf.progress.Attributes attributes,
    com.tailf.progress.Span[] links
)
    throws java.io.IOException, java.security.InvalidParameterException, com.tailf.conf.ConfException
```

Types: [Span](../progress/Span.md#span-1e8b02bddf13), [Verbosity](Maapi/Verbosity.md#verbosity-a9c618ec424f), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [Attributes](../progress/Attributes.md#attributes-ca725b6502c4), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Create a progress span. This is the low level
 method that communicates with the progress trace
 framework to create spans. It is recommended
 to use `ProgressTrace#startSpan`
 instead.

**Parameters**

- `int tid` - the transasction ID
- `com.tailf.maapi.Maapi.Verbosity verbosity` - the verbosity of the message
- `String msg` - the message content
- `com.tailf.conf.ConfPath path` - the path of the service
- `com.tailf.progress.Attributes attributes` - attribute of the event
- `com.tailf.progress.Span[] links` - lists of spans that this span links to

**Returns:** Span the span object

**Throws**

- `IOException` - Signals I/O exception on the underlying socket
- `InvalidParameterException` - if the parameters are invalid
- `ConfException` - Signals protocol/usage error

### startTrans(int, int) <a href="#starttrans-5b69ebc4af09" id="starttrans-5b69ebc4af09"></a>

```java
public synchronized int startTrans(
    int dbname,
    int mode
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Start a new transaction towards the specified database
 `dbname` with a transaction mode `mode`.

 The main purpose of MAAPI is to provide read and write access into
 the transaction manager. Regardless of whether data is kept in
 CDB or in some* (or several) external data bases, the same API is used
 to access data.

 ConfD/NCS acts as a mediator and multiplexes the different commands to
 the code which is responsible for each individual data element.

 This function creates a new transaction towards a specified data
 base. If successful, it returns a new transaction identifier,
 a *tid* which must be used as a parameter in most of the
 `Maapi` methods which manipulate the transaction.

 We will drive this transaction forward through the different states a
 transaction goes through. If an external database is used, and it has
 registered callback functions for the different transaction states, those
 callbacks will be called when we in MAAPI invoke the different MAAPI
 transaction manipulation functions. For example when we call
 `startTrans` the `init` callback will be invoked
 in all external databases. If data is kept in CDB, the system will
 handle everything internally.

 The parameter `dbname` is supplied using on of
 [`Conf#DB_STARTUP`](../conf/Conf.md#db_startup-2ce085259486),[`Conf#DB_RUNNING`](../conf/Conf.md#db_running-c391f371da28),[`Conf#DB_CANDIDATE`](../conf/Conf.md#db_candidate-8b43a337ac93)

 Transaction mode `mode` is supplied using
 [`Conf#MODE_READ`](../conf/Conf.md#mode_read-1e4ced2f015c), to start a read only transaction
 [`Conf#MODE_READ_WRITE`](../conf/Conf.md#mode_read_write-0883a33af731) to start a read write transaction.

 A read only transaction will incur less resource usage, thus if no
 writes will be done (e.g. the purpose of the transaction is only
 to read operational data), it is best to use
 `Conf.MODE_READ`.

 There are also some cases where starting a read-write transaction
 is not allowed, e.g. if we start a transaction towards the running data
 store  is set to "writable-through-candidate" in confd.conf/ncs.conf,
 or if ConfD/NCS is running in HA secondary mode.

**Parameters**

- `int dbname` - Database that the transaction should operate on.
- `int mode` - Read or write mode.

**Returns:** New transaction identifier.

**Throws**

- `MaapiException` - If the transaction could not be started
            see the `ConfException#getMessage()`
- `IOException` - Signals I/O exception on the underlying socket

### startTrans(int, int, String, String, String, String) <a href="#starttrans-ced8c0d5d1ae" id="starttrans-ced8c0d5d1ae"></a>

```java
public synchronized int startTrans(
    int dbname,
    int mode,
    String vendor,
    String product,
    String version,
    String clientId
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Start a new transaction with client identification.

**Parameters**

- `int dbname` - Database that the transaction should operate on
- `int mode` - Read or write mode
- `String vendor` - Vendor name of the client
- `String product` - Product name of the client
- `String version` - Version of the client
- `String clientId` - Client ID of the client

**Returns:** New transaction identifier

**Throws**

- `IOException` - if I/O error occurs
- `ConfException` - if transaction cannot be started

### startTrans2(int, int, int) <a href="#starttrans2-f2ba2eb1c7f0" id="starttrans2-f2ba2eb1c7f0"></a>

```java
public synchronized int startTrans2(
    int dbname,
    int mode,
    int usid
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Start a new transaction towards database within an existing
 user session specified by `usid`.

 If we want to start new transactions inside actions, we can use
 this function to execute the new transaction within the existing
 user session.See [`startTrans(int,int)`](Maapi.md#starttrans-5b69ebc4af09) for available
 options on `dbname` and mode `mode`.

**Parameters**

- `int dbname` - Database that the transaction should operate on
- `int mode` - Read or write mode
- `int usid` - The user session id

**Returns:** New transaction identifier.

**Throws**

- `MaapiException` - If the transaction could not be started
            see the `ConfException#getMessage()`
- `IOException` - Signals I/O exception on the underlying socket.

### startTransFlags(int, int, int, EnumSet&lt;MaapiFlag&gt;) <a href="#starttransflags-cd1ec7f9d8f8" id="starttransflags-cd1ec7f9d8f8"></a>

```java
public synchronized int startTransFlags(
    int dbname,
    int mode,
    int usid,
    java.util.EnumSet<com.tailf.maapi.MaapiFlag> flags
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [MaapiFlag](MaapiFlag.md#maapiflag-6e6635db8a9f), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Start a new transaction towards the specified database
 `dbname` with a transaction mode `mode` with
 additional `flags` to control read/write sessions.

 This method makes it possible to provide flags that can otherwise be
 used with `setFlags(int,EnumSet)` already when starting a
 transaction, as well as setting the [`MaapiFlag#HIDE_INACTIVE`](MaapiFlag.md#hide_inactive-c1ab6b970578) and
 [`MaapiFlag#HIDE_ALL_HIDEGROUPS`](MaapiFlag.md#hide_all_hidegroups-27fac18f1f9d) flag that can only be used with
 this function.
 Otherwise its has functionality equivalent to  Maapi.startTrans2().

**Parameters**

- `int dbname` - Database that the transaction should operate on. Possible
            values are STARTUP, RUNNING, CANDIDATE
- `int mode` - Read or write mode. Possible values are READ and READ_WRITE
- `int usid` - User session id
- `java.util.EnumSet<com.tailf.maapi.MaapiFlag> flags` - EnumSet of MaapiFlag values.

**Returns:** New transaction identifier.

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### startTransInTrans(int, int, int) <a href="#starttransintrans-4e53d8f12a29" id="starttransintrans-4e53d8f12a29"></a>

```java
public synchronized int startTransInTrans(
    int mode,
    int usid,
    int tid
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Start a new transaction within an existing user session and another
 transaction as backend

**Parameters**

- `int mode` - Read or write mode. Possible values are READ and READ_WRITE
- `int usid` - User session id
- `int tid` - Backend transaction id

**Returns:** New transaction identifier.

**Throws**

- `MaapiException` - If the transaction cannot be started
- `IOException` - Signals I/O exception on the underlying socket

### startUserSession(String, InetAddress, String, String[], MaapiUserSessionFlag) <a href="#startusersession-2fe44878630c" id="startusersession-2fe44878630c"></a>

```java
public synchronized void startUserSession(
    String user,
    java.net.InetAddress source,
    String context,
    String[] groups,
    com.tailf.maapi.MaapiUserSessionFlag proto
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [MaapiUserSessionFlag](MaapiUserSessionFlag.md#maapiusersessionflag-ee298af54ca4), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `String user` - Login name of user
- `java.net.InetAddress source` - Source address where the user session originates
- `String context` - The context string parameter stated above
- `String[] groups` - An array of AAA groups that the user belongs to
- `com.tailf.maapi.MaapiUserSessionFlag proto` - Protocol used by the user for connecting to the device

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

**Deprecated:** Use
 [`Maapi#startUserSession(String, String, String[], SocketAddress,
  MaapiUserSessionFlag)`](Maapi.md#startusersession-677e9394622e) instead.

### startUserSession(String, InetAddress, String, String[], MaapiUserSessionFlag, String, String, String, String) <a href="#startusersession-97fb0f3aee95" id="startusersession-97fb0f3aee95"></a>

```java
public synchronized void startUserSession(
    String user,
    java.net.InetAddress source,
    String context,
    String[] groups,
    com.tailf.maapi.MaapiUserSessionFlag proto,
    String vendor,
    String product,
    String version,
    String clientId
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [MaapiUserSessionFlag](MaapiUserSessionFlag.md#maapiusersessionflag-ee298af54ca4), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `String user` - Login name of user
- `java.net.InetAddress source` - Source address where the user session originates
- `String context` - The context string parameter stated above
- `String[] groups` - An array of AAA groups that the user belongs to
- `com.tailf.maapi.MaapiUserSessionFlag proto` - Protocol used by the user for connecting to the device
- `String vendor` - Vendor name of the client
- `String product` - Product name of the client
- `String version` - Version of the client
- `String clientId` - Client ID of the client

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket.

**Deprecated:** Use
 [`Maapi#startUserSession(String, String, String[], SocketAddress,
  MaapiUserSessionFlag, String, String, String, String)`](Maapi.md#startusersession-e4130cb0aace) instead.

### startUserSession(String, String) <a href="#startusersession-d1c404925ea5" id="startusersession-d1c404925ea5"></a>

```java
public synchronized void startUserSession(
    String user,
    String context
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Starts a user session with default parameters.

**Parameters**

- `String user` - Login name of user
- `String context` - Context string for AAA authorization

**Throws**

- `IOException` - if I/O error occurs
- `ConfException` - if session cannot be started

### startUserSession(String, String, String[]) <a href="#startusersession-e8885f96f69b" id="startusersession-e8885f96f69b"></a>

```java
public synchronized void startUserSession(
    String user,
    String context,
    String[] groups
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Starts a user session with specified user groups.

**Parameters**

- `String user` - Login name of user
- `String context` - Context string for AAA authorization
- `String[] groups` - Array of AAA groups the user belongs to

**Throws**

- `IOException` - if I/O error occurs
- `ConfException` - if session cannot be started

### startUserSession(String, String, String[], SocketAddress) <a href="#startusersession-1afffb54d30c" id="startusersession-1afffb54d30c"></a>

```java
public synchronized void startUserSession(
    String user,
    String context,
    String[] groups,
    java.net.SocketAddress source
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Starts a user session with specified source address.

**Parameters**

- `String user` - Login name of user
- `String context` - Context string for AAA authorization
- `String[] groups` - Array of AAA groups the user belongs to
- `java.net.SocketAddress source` - Source address where session originates

**Throws**

- `IOException` - if I/O error occurs
- `ConfException` - if session cannot be started

### startUserSession(String, String, String[], SocketAddress, MaapiUserSessionFlag) <a href="#startusersession-677e9394622e" id="startusersession-677e9394622e"></a>

```java
public synchronized void startUserSession(
    String user,
    String context,
    String[] groups,
    java.net.SocketAddress source,
    com.tailf.maapi.MaapiUserSessionFlag proto
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [MaapiUserSessionFlag](MaapiUserSessionFlag.md#maapiusersessionflag-ee298af54ca4), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Establish a new user session on this `Maapi` instance.

 Once we have created a `Maapi` communication instance,
 we must also establish a user session.

 It is up to the user of the `Maapi` class to
 authenticate users.

 `Maapi` can be used to perform the actual
 authentication through a call to [`authenticate(String,String)`](Maapi.md#authenticate-9b081cc66ee1)
 but authentication may very well occur through some other
 external means.

 Thus, when we use this function to create a user session,
 we must provide all relevant information about the user.
 If we wish to execute read/write
 transactions over the MAAPI interface, we must first have an established
 user session.

 A user session corresponds to a NETCONF manager who has just
 established an authenticated SSH connection, but not yet sent any
 NETCONF commands on the SSH connection.

 The `user` string is the login name of the user.
 The user name is used when setting up the AAA environment for the
 session.

 The `srcip` address specifies from where
 did the session originate.

 The `context` parameter can be any string which is
 precisely the `context` string which will be
 used to authorize all data access through the AAA system.
 Each AAA rule has a context string which must match in order for a
 AAA rule to match. (See the AAA chapter in the User Guide).

 Using the string "system" for context has special significance:


- The session is exempt from all max sessions limits in the
     configuration file.

    - There will be no authorization checks done by the AAA system.

      - The session is not logged in the audit log.

        - The session is not shown in `'confd --status'` or
 `'ncs --status'`, nor `'show users'` in CLI etc.

          - The session may be started already in start phase 0.
  (However read-write transactions can not be started until phase 1)
  Thus this can be useful e.g. when we need to create the user session
  for an "internal" transaction done by an application, without relation
  to a session from a northbound agent. Of course the implications of the
  above need to be carefully considered in each case.

  It is not possible to create new user sessions until the system
  has reached start phase 2 with the above exception of a session
  with the context set to "system".

 The `proto` parameter specifies the protocol used
 by the user for connecting to the device. Can be
 one of [`MaapiUserSessionFlag#PROTO_SSH`](MaapiUserSessionFlag.md#proto_ssh-cc9a1a228f8c),
  [`MaapiUserSessionFlag#PROTO_CONSOLE`](MaapiUserSessionFlag.md#proto_console-78051500ad84),
  [`MaapiUserSessionFlag#PROTO_TCP`](MaapiUserSessionFlag.md#proto_tcp-828eb785fabf), and
 [`MaapiUserSessionFlag#PROTO_SSL`](MaapiUserSessionFlag.md#proto_ssl-5514b2e651a4)

**Parameters**

- `String user` - Login name of user
- `String context` - The context string parameter stated above
- `String[] groups` - An array of AAA groups that the user belongs to
- `java.net.SocketAddress source` - Source address where the user session originates
- `com.tailf.maapi.MaapiUserSessionFlag proto` - Protocol used by the user for connecting to the device

**Throws**

- `MaapiException` - If ConfD/NCS could not create a new
            session based on the parameters. To get detailed message
            use `MaapiException#getMessage()`
- `IOException` - signals I/O exception on the underlying socket

### startUserSession(String, String, String[], SocketAddress, MaapiUserSessionFlag, String, String, String, String) <a href="#startusersession-e4130cb0aace" id="startusersession-e4130cb0aace"></a>

```java
public synchronized void startUserSession(
    String user,
    String context,
    String[] groups,
    java.net.SocketAddress source,
    com.tailf.maapi.MaapiUserSessionFlag proto,
    String vendor,
    String product,
    String version,
    String clientId
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [MaapiUserSessionFlag](MaapiUserSessionFlag.md#maapiusersessionflag-ee298af54ca4), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Establish a new user session.

**Parameters**

- `String user` - Login name of user
- `String context` - The context string parameter stated above
- `String[] groups` - An array of AAA groups that the user belongs to
- `java.net.SocketAddress source` - Source address where the user session originates
- `com.tailf.maapi.MaapiUserSessionFlag proto` - Protocol used by the user for connecting to the device
- `String vendor` - Vendor name of the client
- `String product` - Product name of the client
- `String version` - Version of the client
- `String clientId` - Client ID of the client

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket.

### stop() <a href="#stop-a62ecc446f97" id="stop-a62ecc446f97"></a>

```java
public synchronized void stop() throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Requests that the daemon stops, returns when daemon has stopped.

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### stop(boolean) <a href="#stop-b13ec8bf1f99" id="stop-b13ec8bf1f99"></a>

```java
public synchronized void stop(
    boolean synchronous
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Stops the daemon. Upon return the connection to the daemon will be
 closed.

**Parameters**

- `boolean synchronous` - Whether to wait for the daemon to stop

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### sysMessage(String, String) <a href="#sysmessage-a411a01e7bae" id="sysmessage-a411a01e7bae"></a>

```java
public synchronized void sysMessage(
    String to,
    String message
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Send a message to a specific user, a specific user session or all users
 depending on the to parameter. If set to a user name, then message will
 be delivered to all CLI and Web UI sessions by that user. If set to an
 integer string, eg "10", then message will be delivered to that specific
 user session, CLI or Web UI. If set to "all" then all users will get the
 message. No formatting of the message is performed as opposed to the user
 message where a timestamp and sender information is added to the message.

**Parameters**

- `String to` - username, integer string session no or "all" for all users
- `String message` - string message to send

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

Returns a string representation of this Maapi instance.

**Returns:** string representation including cursor ID and socket info

### unhideGroup(int, String) <a href="#unhidegroup-55fe09fa160b" id="unhidegroup-55fe09fa160b"></a>

```java
public synchronized void unhideGroup(
    int tid,
    String groupName
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Unhide all nodes belonging to a hide group in a transaction that started
 with [`MaapiFlag#HIDE_ALL_HIDEGROUPS`](MaapiFlag.md#hide_all_hidegroups-27fac18f1f9d) flag.

**Parameters**

- `int tid` - Transaction Identifier
- `String groupName` - Group Name

**Throws**

- `MaapiException` - If unhiding the group fails
- `IOException` - Signals I/O exception on the underlying socket

### unlock(int) <a href="#unlock-70caddb6e1e6" id="unlock-70caddb6e1e6"></a>

```java
public synchronized void unlock(int db) throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This function releases a lock previously acquired using the lock()
 method.

**Parameters**

- `int db` - Database to unlock. Possible values are STARTUP, RUNNING, and
            CANDIDATE

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### unlockPartial(int) <a href="#unlockpartial-15faebb90da7" id="unlockpartial-15faebb90da7"></a>

```java
public synchronized void unlockPartial(
    int lockId
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

This methods releases a lock previously acquired using the lockPartial()
 method.

**Parameters**

- `int lockId` - The previously specified lock identifier

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket

### userMessage(String, String, String) <a href="#usermessage-36ed05d12234" id="usermessage-36ed05d12234"></a>

```java
public synchronized void userMessage(
    String to,
    String message,
    String sender
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Send a message to a specific user, a specific user session or all users
 depending on the to parameter. If set to a user name, then message will
 be delivered to all CLI and Web UI sessions by that user. If set to an
 integer string, eg "10", then message will be delivered to that specific
 user session, CLI or Web UI. If set to "all" then all users will get the
 message.

**Parameters**

- `String to` - username, integer string session no or "all" for all users
- `String message` - string message to send
- `String sender` - string

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### validateToken(String, InetAddress, int, String, MaapiUserSessionFlag) <a href="#validatetoken-edde5ce7f1c6" id="validatetoken-edde5ce7f1c6"></a>

```java
public synchronized String[] validateToken(
    String token,
    java.net.InetAddress srcAddr,
    int srcPort,
    String context,
    com.tailf.maapi.MaapiUserSessionFlag proto
)
    throws com.tailf.conf.ConfException, java.io.IOException
```

Types: [MaapiUserSessionFlag](MaapiUserSessionFlag.md#maapiusersessionflag-ee298af54ca4), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

If external token validation (see /confdConfig/aaa/externalValidation)
 is in use, this method can be used to ask ConfD/NSO to validate such
 a token.

**Parameters**

- `String token` - The token to validate
- `java.net.InetAddress srcAddr` - source address
- `int srcPort` - source port
- `String context` - context
- `com.tailf.maapi.MaapiUserSessionFlag proto` - extra information passed to the token validation executable
 (see /confdConfig/aaa/externalValidation/includeExtra)

**Returns:** An array of group names that the user belongs to.

**Throws**

- `ConfException` - Signals protocol/usage error.
- `IOException` - Signals I/O exception on the underlying socket.

### validateTrans(int, boolean, boolean) <a href="#validatetrans-8767da488cef" id="validatetrans-8767da488cef"></a>

```java
public synchronized void validateTrans(
    int tid,
    boolean unlock,
    boolean force
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Validates a transaction specified by transaction handle `tid`

 This method validates all data written in the transaction. This
 includes all XML checks, checking for uniqueness and dangling pointers.
 It also includes all defined semantic validation,
 i.e. user programs that have registered functions under validation
 points. (See user manual chapter Semantic Validation).


 If this method throws an exception due to a validation error, the
 transaction is still open for further editing. If unlock is true, the
 transaction is open for further editing even if validation succeeds. If
 unlock is false and the method returns, the next method to be called
 MUST be [`prepareTrans(int)`](Maapi.md#preparetrans-f5669cbf3002) or
 [`finishTrans(int)`](Maapi.md#finishtrans-0f920518d3c3).


 unlock = true can be used to implement a 'validate' command which can be
 given in the middle of an editing session. The first thing that happens
 is that a lock is set. If unlock = true, the lock is released on success.
 The lock is always released on failure.

 The force parameter should normally be false.
 It has no effect for a transaction towards the running or
 startup data stores, validation is always performed.
 For a transaction towards the candidate data store, validation will
 not be done unless force true. Avoiding this validation is preferable if
 we are going to commit the candidate to running
 e.g with [`candidateCommit()`](Maapi.md#candidatecommit-8dde71013b2b), since otherwise the validation
 will be done twice. However if we are implementing a 'validate' command,
 we should set force = true

**Parameters**

- `int tid` - Transaction Identifier
- `boolean unlock` - if true the transaction is open for further editing
- `boolean force` - if true validation will performed also for
        candidate data store

**Throws**

- `MaapiException` - If validation fails
- `IOException` - Signals I/O exception on the underlying socket

### waitStart(int) <a href="#waitstart-66da4d687e96" id="waitstart-66da4d687e96"></a>

```java
public synchronized void waitStart(
    int phase
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Wait until the daemon has completed a certain start phase.

**Parameters**

- `int phase` - Which start phase to wait for: 0, 1, or 2

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### waitStarted() <a href="#waitstarted-20657441709c" id="waitstarted-20657441709c"></a>

```java
public synchronized void waitStarted() throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Wait until the daemon is fully started, i.e. has completed start phase 2.

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### xpath2kpath(String) <a href="#xpath2kpath-bc8a863e2978" id="xpath2kpath-bc8a863e2978"></a>

```java
public synchronized com.tailf.conf.ConfPath xpath2kpath(
    String xpath
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Convert a XPath path to a ConfPath object. The XPath expression must be
 an "instance identifier", i.e. all elements and keys must be fully
 specified. Namespace prefixes are optional, unless required to resolve
 ambiguities (e.g. when multiple namespaces have the same root element).

**Parameters**

- `String xpath` - XPath expression to convert

**Returns:** ConfPath object representing the XPath expression.

**Throws**

- `IOException` - Signals I/O exception on the underlying socket.
- `ConfException` - Signals protocol/usage error.

### xpath2kpath_th(int, String) <a href="#xpath2kpath_th-5ce14c8a3095" id="xpath2kpath_th-5ce14c8a3095"></a>

```java
public synchronized com.tailf.conf.ConfPath xpath2kpath_th(
    int tid,
    String xpath
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `int tid`
- `String xpath`

### xpathEval(int, MaapiXPathEvalResult, MaapiXPathEvalTrace, String, Object, String, Object[]) <a href="#xpatheval-8e8640817c0b" id="xpatheval-8e8640817c0b"></a>

```java
public synchronized void xpathEval(
    int tid,
    com.tailf.maapi.MaapiXPathEvalResult xpatheval,
    com.tailf.maapi.MaapiXPathEvalTrace xpathtrace,
    String expr,
    Object initstate,
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [MaapiXPathEvalResult](MaapiXPathEvalResult.md#maapixpathevalresult-e5a539712098), [MaapiXPathEvalTrace](MaapiXPathEvalTrace.md#maapixpathevaltrace-4a63725791bd), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Evaluated the xpath expression as supplied in by
 `expr`.


 For each node in the resulting node set the[result(ConfObject[],ConfValue,Object)](MaapiXPathEvalResult.md#maapixpathevalresult-e5a539712098)
 method of @see MaapiXPathEvalResult is called
 with the keypath (as `ConfObject[]`) to the resulting
 node as the  first argument,
 and, if the node is a leaf and has a
 value (as `ConfValue`), the value of that node
 as the second argument otherwise it will return the string "undefined".

 The expression  will be evaluated using the root node as the
 context node, unless a path to an existing node is given as the
 *fmt* argument.


 For each invocation the
 ` result` method should return
 [ITER_CONTINUE](XPathNodeIterateResultFlag.md#xpathnodeiterateresultflag-a264e20c01cd) to tell the
 xpath evaluator to continue with the
 next resulting node. To stop the evaluation the result
 can return [ITER_STOP](XPathNodeIterateResultFlag.md#xpathnodeiterateresultflag-a264e20c01cd) instead.

 The [MaapiXPathEvalTrace](MaapiXPathEvalTrace.md#maapixpathevaltrace-4a63725791bd) implementation of
 a method [trace(String)](MaapiXPathEvalTrace.md#maapixpathevaltrace-4a63725791bd) that takes a
 single string as argument.


 If supplied (optional) it will be invoked when the xpath
 evaluator has trace output for the current expression.


 The `initstate` parameter can be used for any user
 supplied opaque
 data (i.e. whatever is supplied as initstate is passed as state
 to the `result` method for each invocation).

**Parameters**

- `int tid` - Transaction handle
- `com.tailf.maapi.MaapiXPathEvalResult xpatheval` - A implementation of `MaapiXPathEvalResult`
            callback method
- `com.tailf.maapi.MaapiXPathEvalTrace xpathtrace` - A implementation of `MaapiXPathEvalTrace` or
            null if no trace is wanted
- `String expr` - The XPath expression
- `Object initstate` - An opaque object for user supplied state
- `String fmt` - Path string (context node) root if not supplied
- `Object[] arguments` - Optional parameters for substitution in fmt

**Throws**

- `MaapiException` - Failed MaapiXPathEvaluate
- `IOException` - Failed to read/write maapi socket

### xpathEvalExpr(int, String, MaapiXPathEvalTrace, String, Object[]) <a href="#xpathevalexpr-32b3542af9d6" id="xpathevalexpr-32b3542af9d6"></a>

```java
public synchronized String xpathEvalExpr(
    int tid,
    String expr,
    com.tailf.maapi.MaapiXPathEvalTrace xpathtrace,
    String fmt,
    Object[] arg
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [MaapiXPathEvalTrace](MaapiXPathEvalTrace.md#maapixpathevaltrace-4a63725791bd), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Evaluate the xpath expression given in `expr` parameter
 and return the result as a string.


 It is possible to supply a path `fmt` (optional) which will
 be treated as the initial context node when evaluating `expr.`


 If the path is relative, this is treated as the starting point,
 and this is also the node that `current()` will return
 when used in the xpath expression.



  If null is given, the current maapi position is used
 (set by [`cd(int,String,Object...)`](Maapi.md#cd-2b29dc1e94f8))



 The [MaapiXPathEvalTrace](MaapiXPathEvalTrace.md#maapixpathevaltrace-4a63725791bd) implementation of
 the method [trace(String)](MaapiXPathEvalTrace.md#maapixpathevaltrace-4a63725791bd) which
 takes a single string as argument (optional) will be
 invoked if supplied (optional) when the xpath implementation has
 trace output for the current expression.

**Parameters**

- `int tid` - Transaction handle
- `String expr` - The xpath expression
- `com.tailf.maapi.MaapiXPathEvalTrace xpathtrace` - A implementation of `MaapiXPathEvalTrace`
            or null if no trace is wanted
            A implementation of `MaapiXPathEvalTrace` or null
            if no trace is wanted
- `String fmt` - Path string (context node) root if not supplied
- `Object[] arg` - Optional parameters for substitution in fmt

**Returns:** the result of the XPath expression evaluation as a string

**Throws**

- `ConfException` - Failed MaapiXPathEvaluate
- `IOException` - Failed to read/write maapi socket


## Nested Types

- [Progress](Maapi/Progress.md#progress-512cd01a4025)
- [TemplateType](Maapi/TemplateType.md#templatetype-08e95c149f38)
- [Verbosity](Maapi/Verbosity.md#verbosity-a9c618ec424f)
