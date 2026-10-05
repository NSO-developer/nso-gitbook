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

- [ApplyResult](ApplyResult.md#s-ApplyResult)
- [CLICmdToPathResult](CLICmdToPathResult.md#s-CLICmdToPathResult)
- [CLIInteraction](CLIInteraction.md#s-CLIInteraction)
- [CLIInteractionFlag](CLIInteractionFlag.md#s-CLIInteractionFlag)
- [CLIPathCmdFlag](CLIPathCmdFlag.md#s-CLIPathCmdFlag)
- [CommitParams](CommitParams.md#s-CommitParams)
- [CommitQueueResult](CommitQueueResult.md#s-CommitQueueResult)
- [DryRunResult](DryRunResult.md#s-DryRunResult)
- [Maapi](Maapi.md#s-Maapi)
- [MaapiAuthentication](MaapiAuthentication.md#s-MaapiAuthentication)
- [MaapiConfigFlag](MaapiConfigFlag.md#s-MaapiConfigFlag)
- [MaapiCrypto](MaapiCrypto.md#s-MaapiCrypto)
- [MaapiCryptoType](MaapiCryptoType.md#s-MaapiCryptoType)
- [MaapiCursor](MaapiCursor.md#s-MaapiCursor)
- [MaapiDeleteAllFlag](MaapiDeleteAllFlag.md#s-MaapiDeleteAllFlag)
- [MaapiDiffIterate](MaapiDiffIterate.md#s-MaapiDiffIterate)
- [MaapiException](MaapiException.md#s-MaapiException)
- [MaapiFlag](MaapiFlag.md#s-MaapiFlag)
- [MaapiInputStream](MaapiInputStream.md#s-MaapiInputStream)
- [MaapiIterate](MaapiIterate.md#s-MaapiIterate)
- [MaapiMNsException](MaapiMNsException.md#s-MaapiMNsException)
- [MaapiMNsMissingException](MaapiMNsMissingException.md#s-MaapiMNsMissingException)
- [MaapiOutputStream](MaapiOutputStream.md#s-MaapiOutputStream)
- [MaapiProto](MaapiProto.md#s-MaapiProto)
- [MaapiRetryableOp](MaapiRetryableOp.md#s-MaapiRetryableOp)
- [MaapiSchemaNS](MaapiSchemaNS.md#s-MaapiSchemaNS)
- [MaapiSchemas](MaapiSchemas.md#s-MaapiSchemas)
- [MaapiSchemasUtil](MaapiSchemasUtil.md#s-MaapiSchemasUtil)
- [MaapiUserSession](MaapiUserSession.md#s-MaapiUserSession)
- [MaapiUserSessionFlag](MaapiUserSessionFlag.md#s-MaapiUserSessionFlag)
- [MaapiUserSessionId](MaapiUserSessionId.md#s-MaapiUserSessionId)
- [MaapiWarningException](MaapiWarningException.md#s-MaapiWarningException)
- [MaapiXPathEvalResult](MaapiXPathEvalResult.md#s-MaapiXPathEvalResult)
- [MaapiXPathEvalTrace](MaapiXPathEvalTrace.md#s-MaapiXPathEvalTrace)
- [MountIdCb](MountIdCb.md#s-MountIdCb)
- [MoveWhereFlag](MoveWhereFlag.md#s-MoveWhereFlag)
- [ProgressAttributeLiteral](ProgressAttributeLiteral.md#s-ProgressAttributeLiteral)
- [ProgressAttributeNumber](ProgressAttributeNumber.md#s-ProgressAttributeNumber)
- [ProgressAttributeValue](ProgressAttributeValue.md#s-ProgressAttributeValue)
- [ProgressLink](ProgressLink.md#s-ProgressLink)
- [QNameTypeMethodsImpl](QNameTypeMethodsImpl.md#s-QNameTypeMethodsImpl)
- [QueryResult](QueryResult.md#s-QueryResult)
- [QueryResultIterator](QueryResultIterator.md#s-QueryResultIterator)
- [ResultType](ResultType.md#s-ResultType)
- [ResultTypeKeyPath](ResultTypeKeyPath.md#s-ResultTypeKeyPath)
- [ResultTypeKeyPathImpl](ResultTypeKeyPathImpl.md#s-ResultTypeKeyPathImpl)
- [ResultTypeKeyPathValue](ResultTypeKeyPathValue.md#s-ResultTypeKeyPathValue)
- [ResultTypeKeyPathValueImpl](ResultTypeKeyPathValueImpl.md#s-ResultTypeKeyPathValueImpl)
- [ResultTypeString](ResultTypeString.md#s-ResultTypeString)
- [ResultTypeStringImpl](ResultTypeStringImpl.md#s-ResultTypeStringImpl)
- [ResultTypeTag](ResultTypeTag.md#s-ResultTypeTag)
- [ResultTypeTagImpl](ResultTypeTagImpl.md#s-ResultTypeTagImpl)
- [XPathNodeIterateResultFlag](XPathNodeIterateResultFlag.md#s-XPathNodeIterateResultFlag)
