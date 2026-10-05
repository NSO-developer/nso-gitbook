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

- [ApplyResult](ApplyResult.md#cls-ApplyResult)
- [CLICmdToPathResult](CLICmdToPathResult.md#cls-CLICmdToPathResult)
- [CLIInteraction](CLIInteraction.md#cls-CLIInteraction)
- [CLIInteractionFlag](CLIInteractionFlag.md#cls-CLIInteractionFlag)
- [CLIPathCmdFlag](CLIPathCmdFlag.md#cls-CLIPathCmdFlag)
- [CommitParams](CommitParams.md#cls-CommitParams)
- [CommitQueueResult](CommitQueueResult.md#cls-CommitQueueResult)
- [DryRunResult](DryRunResult.md#cls-DryRunResult)
- [Maapi](Maapi.md#cls-Maapi)
- [MaapiAuthentication](MaapiAuthentication.md#cls-MaapiAuthentication)
- [MaapiConfigFlag](MaapiConfigFlag.md#cls-MaapiConfigFlag)
- [MaapiCrypto](MaapiCrypto.md#cls-MaapiCrypto)
- [MaapiCryptoType](MaapiCryptoType.md#cls-MaapiCryptoType)
- [MaapiCursor](MaapiCursor.md#cls-MaapiCursor)
- [MaapiDeleteAllFlag](MaapiDeleteAllFlag.md#cls-MaapiDeleteAllFlag)
- [MaapiDiffIterate](MaapiDiffIterate.md#cls-MaapiDiffIterate)
- [MaapiException](MaapiException.md#cls-MaapiException)
- [MaapiFlag](MaapiFlag.md#cls-MaapiFlag)
- [MaapiInputStream](MaapiInputStream.md#cls-MaapiInputStream)
- [MaapiIterate](MaapiIterate.md#cls-MaapiIterate)
- [MaapiMNsException](MaapiMNsException.md#cls-MaapiMNsException)
- [MaapiMNsMissingException](MaapiMNsMissingException.md#cls-MaapiMNsMissingException)
- [MaapiOutputStream](MaapiOutputStream.md#cls-MaapiOutputStream)
- [MaapiProto](MaapiProto.md#cls-MaapiProto)
- [MaapiRetryableOp](MaapiRetryableOp.md#cls-MaapiRetryableOp)
- [MaapiSchemaNS](MaapiSchemaNS.md#cls-MaapiSchemaNS)
- [MaapiSchemas](MaapiSchemas.md#cls-MaapiSchemas)
- [MaapiSchemasUtil](MaapiSchemasUtil.md#cls-MaapiSchemasUtil)
- [MaapiUserSession](MaapiUserSession.md#cls-MaapiUserSession)
- [MaapiUserSessionFlag](MaapiUserSessionFlag.md#cls-MaapiUserSessionFlag)
- [MaapiUserSessionId](MaapiUserSessionId.md#cls-MaapiUserSessionId)
- [MaapiWarningException](MaapiWarningException.md#cls-MaapiWarningException)
- [MaapiXPathEvalResult](MaapiXPathEvalResult.md#cls-MaapiXPathEvalResult)
- [MaapiXPathEvalTrace](MaapiXPathEvalTrace.md#cls-MaapiXPathEvalTrace)
- [MountIdCb](MountIdCb.md#cls-MountIdCb)
- [MoveWhereFlag](MoveWhereFlag.md#cls-MoveWhereFlag)
- [ProgressAttributeLiteral](ProgressAttributeLiteral.md#cls-ProgressAttributeLiteral)
- [ProgressAttributeNumber](ProgressAttributeNumber.md#cls-ProgressAttributeNumber)
- [ProgressAttributeValue](ProgressAttributeValue.md#cls-ProgressAttributeValue)
- [ProgressLink](ProgressLink.md#cls-ProgressLink)
- [QNameTypeMethodsImpl](QNameTypeMethodsImpl.md#cls-QNameTypeMethodsImpl)
- [QueryResult](QueryResult.md#cls-QueryResult)
- [QueryResultIterator](QueryResultIterator.md#cls-QueryResultIterator)
- [ResultType](ResultType.md#cls-ResultType)
- [ResultTypeKeyPath](ResultTypeKeyPath.md#cls-ResultTypeKeyPath)
- [ResultTypeKeyPathImpl](ResultTypeKeyPathImpl.md#cls-ResultTypeKeyPathImpl)
- [ResultTypeKeyPathValue](ResultTypeKeyPathValue.md#cls-ResultTypeKeyPathValue)
- [ResultTypeKeyPathValueImpl](ResultTypeKeyPathValueImpl.md#cls-ResultTypeKeyPathValueImpl)
- [ResultTypeString](ResultTypeString.md#cls-ResultTypeString)
- [ResultTypeStringImpl](ResultTypeStringImpl.md#cls-ResultTypeStringImpl)
- [ResultTypeTag](ResultTypeTag.md#cls-ResultTypeTag)
- [ResultTypeTagImpl](ResultTypeTagImpl.md#cls-ResultTypeTagImpl)
- [XPathNodeIterateResultFlag](XPathNodeIterateResultFlag.md#cls-XPathNodeIterateResultFlag)
