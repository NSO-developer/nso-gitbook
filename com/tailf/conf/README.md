# com.tailf.conf

Data types and utilities for communication with the server.

 The base class for all Conf terms is ConfObject. Not all Conf terms can
 contain a value. The ones that do all inherit the abstract class ConfValue.
 The inheritance hierarchy looks like this:



```
 ConfObject
         |
         +--ConfValue
         |         |
         |         +--ConfXYZ
         |         |
         |         :    :
         |         :    :
         |         |
         |         +--Conf
         |
         +--ConfKey
         |
         +--ConfTag
         |
         +--ConfTypeDescriptor
         |
         +--ConfXMLParam
                   |
                   +--ConfXMLParamStart
                   |         |
                   |         +-- ConfXMLParamCdbStart
                   |
                   +--ConfXMLParamStop
                   |
                   +--ConfXMLParamLeaf
                   |
                   +--ConfXMLParamValue
```



 In addition to the term and value classes there are some utility classes in
 this package.

## Types

- [AmbiguousNamespaceException](AmbiguousNamespaceException.md#cls-AmbiguousNamespaceException)
- [Compiler](Compiler.md#cls-Compiler)
- [Conf](Conf.md#cls-Conf)
- [ConfAttributeType](ConfAttributeType.md#cls-ConfAttributeType)
- [ConfAttributeValue](ConfAttributeValue.md#cls-ConfAttributeValue)
- [ConfBadTermException](ConfBadTermException.md#cls-ConfBadTermException)
- [ConfBinary](ConfBinary.md#cls-ConfBinary)
- [ConfBit32](ConfBit32.md#cls-ConfBit32)
- [ConfBit64](ConfBit64.md#cls-ConfBit64)
- [ConfBitBig](ConfBitBig.md#cls-ConfBitBig)
- [ConfBits](ConfBits.md#cls-ConfBits)
- [ConfBool](ConfBool.md#cls-ConfBool)
- [ConfBuf](ConfBuf.md#cls-ConfBuf)
- [ConfCdbUpgradePath](ConfCdbUpgradePath.md#cls-ConfCdbUpgradePath)
- [ConfCleaner](ConfCleaner.md#cls-ConfCleaner)
- [ConfCLIToken](ConfCLIToken.md#cls-ConfCLIToken)
- [ConfDate](ConfDate.md#cls-ConfDate)
- [ConfDatetime](ConfDatetime.md#cls-ConfDatetime)
- [ConfDecimal64](ConfDecimal64.md#cls-ConfDecimal64)
- [ConfDefault](ConfDefault.md#cls-ConfDefault)
- [ConfDottedQuad](ConfDottedQuad.md#cls-ConfDottedQuad)
- [ConfDouble](ConfDouble.md#cls-ConfDouble)
- [ConfDuration](ConfDuration.md#cls-ConfDuration)
- [ConfEmpty](ConfEmpty.md#cls-ConfEmpty)
- [ConfEnumeration](ConfEnumeration.md#cls-ConfEnumeration)
- [ConfException](ConfException.md#cls-ConfException)
- [ConfFindNextType](ConfFindNextType.md#cls-ConfFindNextType)
- [ConfFloat](ConfFloat.md#cls-ConfFloat)
- [ConfHaNode](ConfHaNode.md#cls-ConfHaNode)
- [ConfHexList](ConfHexList.md#cls-ConfHexList)
- [ConfHexString](ConfHexString.md#cls-ConfHexString)
- [ConfIdentityRef](ConfIdentityRef.md#cls-ConfIdentityRef)
- [ConfInt16](ConfInt16.md#cls-ConfInt16)
- [ConfInt32](ConfInt32.md#cls-ConfInt32)
- [ConfInt64](ConfInt64.md#cls-ConfInt64)
- [ConfInt8](ConfInt8.md#cls-ConfInt8)
- [ConfInternal](ConfInternal.md#cls-ConfInternal)
- [ConfIP](ConfIP.md#cls-ConfIP)
- [ConfIPAndPrefixLen](ConfIPAndPrefixLen.md#cls-ConfIPAndPrefixLen)
- [ConfIPPrefix](ConfIPPrefix.md#cls-ConfIPPrefix)
- [ConfIPv4](ConfIPv4.md#cls-ConfIPv4)
- [ConfIPv4AndPrefixLen](ConfIPv4AndPrefixLen.md#cls-ConfIPv4AndPrefixLen)
- [ConfIPv4Prefix](ConfIPv4Prefix.md#cls-ConfIPv4Prefix)
- [ConfIPv6](ConfIPv6.md#cls-ConfIPv6)
- [ConfIPv6AndPrefixLen](ConfIPv6AndPrefixLen.md#cls-ConfIPv6AndPrefixLen)
- [ConfIPv6Prefix](ConfIPv6Prefix.md#cls-ConfIPv6Prefix)
- [ConfIterate](ConfIterate.md#cls-ConfIterate)
- [ConfIterateFlags](ConfIterateFlags.md#cls-ConfIterateFlags)
- [ConfIterateResultFlag](ConfIterateResultFlag.md#cls-ConfIterateResultFlag)
- [ConfKey](ConfKey.md#cls-ConfKey)
- [ConfList](ConfList.md#cls-ConfList)
- [ConfNamespace](ConfNamespace.md#cls-ConfNamespace)
- [ConfNamespaceStub](ConfNamespaceStub.md#cls-ConfNamespaceStub)
- [ConfNoExists](ConfNoExists.md#cls-ConfNoExists)
- [ConfObject](ConfObject.md#cls-ConfObject)
- [ConfObjectRef](ConfObjectRef.md#cls-ConfObjectRef)
- [ConfOctetList](ConfOctetList.md#cls-ConfOctetList)
- [ConfOID](ConfOID.md#cls-ConfOID)
- [ConfPath](ConfPath.md#cls-ConfPath)
- [ConfQname](ConfQname.md#cls-ConfQname)
- [ConfResponse](ConfResponse.md#cls-ConfResponse)
- [ConfTag](ConfTag.md#cls-ConfTag)
- [ConfTagDefault](ConfTagDefault.md#cls-ConfTagDefault)
- [ConfTime](ConfTime.md#cls-ConfTime)
- [ConfTypeDescriptor](ConfTypeDescriptor.md#cls-ConfTypeDescriptor)
- [ConfUInt16](ConfUInt16.md#cls-ConfUInt16)
- [ConfUInt32](ConfUInt32.md#cls-ConfUInt32)
- [ConfUInt64](ConfUInt64.md#cls-ConfUInt64)
- [ConfUInt8](ConfUInt8.md#cls-ConfUInt8)
- [ConfUserInfo](ConfUserInfo.md#cls-ConfUserInfo)
- [ConfValue](ConfValue.md#cls-ConfValue)
- [ConfWarning](ConfWarning.md#cls-ConfWarning)
- [ConfWarningException](ConfWarningException.md#cls-ConfWarningException)
- [ConfXKey](ConfXKey.md#cls-ConfXKey)
- [ConfXMLParam](ConfXMLParam.md#cls-ConfXMLParam)
- [ConfXMLParamCdbStart](ConfXMLParamCdbStart.md#cls-ConfXMLParamCdbStart)
- [ConfXMLParamLeaf](ConfXMLParamLeaf.md#cls-ConfXMLParamLeaf)
- [ConfXMLParamStart](ConfXMLParamStart.md#cls-ConfXMLParamStart)
- [ConfXMLParamStartDel](ConfXMLParamStartDel.md#cls-ConfXMLParamStartDel)
- [ConfXMLParamStop](ConfXMLParamStop.md#cls-ConfXMLParamStop)
- [ConfXMLParamValue](ConfXMLParamValue.md#cls-ConfXMLParamValue)
- [ConfXMLTagH](ConfXMLTagH.md#cls-ConfXMLTagH)
- [ConfXPath](ConfXPath.md#cls-ConfXPath)
- [DiffIterateFlags](DiffIterateFlags.md#cls-DiffIterateFlags)
- [DiffIterateOperFlag](DiffIterateOperFlag.md#cls-DiffIterateOperFlag)
- [DiffIterateResultFlag](DiffIterateResultFlag.md#cls-DiffIterateResultFlag)
- [ErrorCode](ErrorCode.md#cls-ErrorCode)
- [ErrorMessageFormatter](ErrorMessageFormatter.md#cls-ErrorMessageFormatter)
- [ErrorVerbosity](ErrorVerbosity.md#cls-ErrorVerbosity)
- [InstancePath](InstancePath.md#cls-InstancePath)
- [IterateFlags](IterateFlags.md#cls-IterateFlags)
- [MountIdInterface](MountIdInterface.md#cls-MountIdInterface)
- [SnmpVarbind](SnmpVarbind.md#cls-SnmpVarbind)
- [SocketFactory](SocketFactory.md#cls-SocketFactory)
- [SocketFactoryCallback](SocketFactoryCallback.md#cls-SocketFactoryCallback)
- [XMLParamType](XMLParamType.md#cls-XMLParamType)
- [XPathAbrevCompiler](XPathAbrevCompiler.md#cls-XPathAbrevCompiler)
