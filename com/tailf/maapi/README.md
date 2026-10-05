# com.tailf.maapi

MAAPI is an API which provides full access to the systems internal
 transaction engine.
  MAAPI is used in a number of different settings.


- We use MAAPI if we want to write our own management application.
   Using the MAAPI interface, it is for example possible to implement
   a custom built command line interface (CLI) or Web UI. This usage
   is described below.
- We use MAAPI to access  data inside a not yet committed
   transaction when we wish to implement semantic validation in Java.
   or implement hook or transformation code.
- We use MAAPI to access data inside a not yet committed transaction
 when we wish to implement CLI wizards in Java. Here we can invoke an
 external program which can read and write, both to the executing
 transaction, but also interact with the CLI user.
- Finally MAAPI is also used during database upgrade to access and
 write data to a special upgrade transaction.




 A typical sequence of API calls when using MAAPI to write a
 management application would be


2. Create a user session, this is the equivalent of an established
     SSH connection from a NETCONF manager. It is up to the
     MAAPI application to authenticate users. The TCP connection from the
     MAAPI application to the system is a clear text connection.
4. Establish a new transaction
6. Issue a series of read and write operations towards the transaction
8. Commit or abort the transaction



 MAAPI also has support for several operations that do not work
 immediately towards a transaction. This includes users session management,
  locking, and candidate manipulation.

## Types

- [ApplyResult](ApplyResult.md#applyresult-77b049ed4f17)
- [CLICmdToPathResult](CLICmdToPathResult.md#clicmdtopathresult-3b4d365dbceb)
- [CLIInteraction](CLIInteraction.md#cliinteraction-ffa8d4bd97e3)
- [CLIInteractionFlag](CLIInteractionFlag.md#cliinteractionflag-e5edaaf18139)
- [CLIPathCmdFlag](CLIPathCmdFlag.md#clipathcmdflag-23bdfd65bbce)
- [CommitParams](CommitParams.md#commitparams-819d9b5483cc)
- [CommitQueueResult](CommitQueueResult.md#commitqueueresult-0daa10abf91a)
- [DryRunResult](DryRunResult.md#dryrunresult-28828490822f)
- [Maapi](Maapi.md#maapi-67bcbe89c42e)
- [MaapiAuthentication](MaapiAuthentication.md#maapiauthentication-b8288dadf67d)
- [MaapiConfigFlag](MaapiConfigFlag.md#maapiconfigflag-53df41e9a7b7)
- [MaapiCrypto](MaapiCrypto.md#maapicrypto-2f94e265c842)
- [MaapiCryptoType](MaapiCryptoType.md#maapicryptotype-eed6b72aa0d2)
- [MaapiCursor](MaapiCursor.md#maapicursor-788c065e30cb)
- [MaapiDeleteAllFlag](MaapiDeleteAllFlag.md#maapideleteallflag-ab18714d13ee)
- [MaapiDiffIterate](MaapiDiffIterate.md#maapidiffiterate-199d02e1da37)
- [MaapiException](MaapiException.md#maapiexception-af58eb4e109e)
- [MaapiFlag](MaapiFlag.md#maapiflag-6e6635db8a9f)
- [MaapiInputStream](MaapiInputStream.md#maapiinputstream-2e53bf185d47)
- [MaapiIterate](MaapiIterate.md#maapiiterate-7712a2112a17)
- [MaapiMNsException](MaapiMNsException.md#maapimnsexception-c5654bb45674)
- [MaapiMNsMissingException](MaapiMNsMissingException.md#maapimnsmissingexception-37f8556358f1)
- [MaapiOutputStream](MaapiOutputStream.md#maapioutputstream-97ebc772623b)
- [MaapiProto](MaapiProto.md#maapiproto-c19075173332)
- [MaapiRetryableOp](MaapiRetryableOp.md#maapiretryableop-cfc27c59f49e)
- [MaapiSchemaNS](MaapiSchemaNS.md#maapischemans-0020218f86d5)
- [MaapiSchemas](MaapiSchemas.md#maapischemas-821ac70b83b7)
- [MaapiSchemasUtil](MaapiSchemasUtil.md#maapischemasutil-bc1b43597fd6)
- [MaapiUserSession](MaapiUserSession.md#maapiusersession-2d8a37dd2abf)
- [MaapiUserSessionFlag](MaapiUserSessionFlag.md#maapiusersessionflag-ee298af54ca4)
- [MaapiUserSessionId](MaapiUserSessionId.md#maapiusersessionid-2dac3a536c51)
- [MaapiWarningException](MaapiWarningException.md#maapiwarningexception-52f654d7ae54)
- [MaapiXPathEvalResult](MaapiXPathEvalResult.md#maapixpathevalresult-e5a539712098)
- [MaapiXPathEvalTrace](MaapiXPathEvalTrace.md#maapixpathevaltrace-4a63725791bd)
- [MountIdCb](MountIdCb.md#mountidcb-b2c40ac53111)
- [MoveWhereFlag](MoveWhereFlag.md#movewhereflag-bbc0edc34bda)
- [ProgressAttributeLiteral](ProgressAttributeLiteral.md#progressattributeliteral-a7e13d2dafd0)
- [ProgressAttributeNumber](ProgressAttributeNumber.md#progressattributenumber-6c4a8293ede8)
- [ProgressAttributeValue](ProgressAttributeValue.md#progressattributevalue-ec36459ec7af)
- [ProgressLink](ProgressLink.md#progresslink-49caea742f77)
- [QNameTypeMethodsImpl](QNameTypeMethodsImpl.md#qnametypemethodsimpl-7cc2db36e342)
- [QueryResult](QueryResult.md#queryresult-6b83e74c93ef)
- [QueryResultIterator](QueryResultIterator.md#queryresultiterator-05c3c45152b8)
- [ResultType](ResultType.md#resulttype-1a8a08651698)
- [ResultTypeKeyPath](ResultTypeKeyPath.md#resulttypekeypath-6681ecc7f47b)
- [ResultTypeKeyPathImpl](ResultTypeKeyPathImpl.md#resulttypekeypathimpl-59e42f251896)
- [ResultTypeKeyPathValue](ResultTypeKeyPathValue.md#resulttypekeypathvalue-73a624076b63)
- [ResultTypeKeyPathValueImpl](ResultTypeKeyPathValueImpl.md#resulttypekeypathvalueimpl-e8e61bf396b4)
- [ResultTypeString](ResultTypeString.md#resulttypestring-6e023ffcb7ea)
- [ResultTypeStringImpl](ResultTypeStringImpl.md#resulttypestringimpl-df6f97277332)
- [ResultTypeTag](ResultTypeTag.md#resulttypetag-91d1aeee8818)
- [ResultTypeTagImpl](ResultTypeTagImpl.md#resulttypetagimpl-c9f0a89be0ae)
- [XPathNodeIterateResultFlag](XPathNodeIterateResultFlag.md#xpathnodeiterateresultflag-a264e20c01cd)
