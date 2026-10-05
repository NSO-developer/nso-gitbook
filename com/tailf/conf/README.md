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

- [AmbiguousNamespaceException](AmbiguousNamespaceException.md#s-AmbiguousNamespaceException)
- [Compiler](Compiler.md#s-Compiler)
- [Conf](Conf.md#s-Conf)
- [ConfAttributeType](ConfAttributeType.md#s-ConfAttributeType)
- [ConfAttributeValue](ConfAttributeValue.md#s-ConfAttributeValue)
- [ConfBadTermException](ConfBadTermException.md#s-ConfBadTermException)
- [ConfBinary](ConfBinary.md#s-ConfBinary)
- [ConfBit32](ConfBit32.md#s-ConfBit32)
- [ConfBit64](ConfBit64.md#s-ConfBit64)
- [ConfBitBig](ConfBitBig.md#s-ConfBitBig)
- [ConfBits](ConfBits.md#s-ConfBits)
- [ConfBool](ConfBool.md#s-ConfBool)
- [ConfBuf](ConfBuf.md#s-ConfBuf)
- [ConfCdbUpgradePath](ConfCdbUpgradePath.md#s-ConfCdbUpgradePath)
- [ConfCleaner](ConfCleaner.md#s-ConfCleaner)
- [ConfCLIToken](ConfCLIToken.md#s-ConfCLIToken)
- [ConfDate](ConfDate.md#s-ConfDate)
- [ConfDatetime](ConfDatetime.md#s-ConfDatetime)
- [ConfDecimal64](ConfDecimal64.md#s-ConfDecimal64)
- [ConfDefault](ConfDefault.md#s-ConfDefault)
- [ConfDottedQuad](ConfDottedQuad.md#s-ConfDottedQuad)
- [ConfDouble](ConfDouble.md#s-ConfDouble)
- [ConfDuration](ConfDuration.md#s-ConfDuration)
- [ConfEmpty](ConfEmpty.md#s-ConfEmpty)
- [ConfEnumeration](ConfEnumeration.md#s-ConfEnumeration)
- [ConfException](ConfException.md#s-ConfException)
- [ConfFindNextType](ConfFindNextType.md#s-ConfFindNextType)
- [ConfFloat](ConfFloat.md#s-ConfFloat)
- [ConfHaNode](ConfHaNode.md#s-ConfHaNode)
- [ConfHexList](ConfHexList.md#s-ConfHexList)
- [ConfHexString](ConfHexString.md#s-ConfHexString)
- [ConfIdentityRef](ConfIdentityRef.md#s-ConfIdentityRef)
- [ConfInt16](ConfInt16.md#s-ConfInt16)
- [ConfInt32](ConfInt32.md#s-ConfInt32)
- [ConfInt64](ConfInt64.md#s-ConfInt64)
- [ConfInt8](ConfInt8.md#s-ConfInt8)
- [ConfInternal](ConfInternal.md#s-ConfInternal)
- [ConfIP](ConfIP.md#s-ConfIP)
- [ConfIPAndPrefixLen](ConfIPAndPrefixLen.md#s-ConfIPAndPrefixLen)
- [ConfIPPrefix](ConfIPPrefix.md#s-ConfIPPrefix)
- [ConfIPv4](ConfIPv4.md#s-ConfIPv4)
- [ConfIPv4AndPrefixLen](ConfIPv4AndPrefixLen.md#s-ConfIPv4AndPrefixLen)
- [ConfIPv4Prefix](ConfIPv4Prefix.md#s-ConfIPv4Prefix)
- [ConfIPv6](ConfIPv6.md#s-ConfIPv6)
- [ConfIPv6AndPrefixLen](ConfIPv6AndPrefixLen.md#s-ConfIPv6AndPrefixLen)
- [ConfIPv6Prefix](ConfIPv6Prefix.md#s-ConfIPv6Prefix)
- [ConfIterate](ConfIterate.md#s-ConfIterate)
- [ConfIterateFlags](ConfIterateFlags.md#s-ConfIterateFlags)
- [ConfIterateResultFlag](ConfIterateResultFlag.md#s-ConfIterateResultFlag)
- [ConfKey](ConfKey.md#s-ConfKey)
- [ConfList](ConfList.md#s-ConfList)
- [ConfNamespace](ConfNamespace.md#s-ConfNamespace)
- [ConfNamespaceStub](ConfNamespaceStub.md#s-ConfNamespaceStub)
- [ConfNoExists](ConfNoExists.md#s-ConfNoExists)
- [ConfObject](ConfObject.md#s-ConfObject)
- [ConfObjectRef](ConfObjectRef.md#s-ConfObjectRef)
- [ConfOctetList](ConfOctetList.md#s-ConfOctetList)
- [ConfOID](ConfOID.md#s-ConfOID)
- [ConfPath](ConfPath.md#s-ConfPath)
- [ConfQname](ConfQname.md#s-ConfQname)
- [ConfResponse](ConfResponse.md#s-ConfResponse)
- [ConfTag](ConfTag.md#s-ConfTag)
- [ConfTagDefault](ConfTagDefault.md#s-ConfTagDefault)
- [ConfTime](ConfTime.md#s-ConfTime)
- [ConfTypeDescriptor](ConfTypeDescriptor.md#s-ConfTypeDescriptor)
- [ConfUInt16](ConfUInt16.md#s-ConfUInt16)
- [ConfUInt32](ConfUInt32.md#s-ConfUInt32)
- [ConfUInt64](ConfUInt64.md#s-ConfUInt64)
- [ConfUInt8](ConfUInt8.md#s-ConfUInt8)
- [ConfUserInfo](ConfUserInfo.md#s-ConfUserInfo)
- [ConfValue](ConfValue.md#s-ConfValue)
- [ConfWarning](ConfWarning.md#s-ConfWarning)
- [ConfWarningException](ConfWarningException.md#s-ConfWarningException)
- [ConfXKey](ConfXKey.md#s-ConfXKey)
- [ConfXMLParam](ConfXMLParam.md#s-ConfXMLParam)
- [ConfXMLParamCdbStart](ConfXMLParamCdbStart.md#s-ConfXMLParamCdbStart)
- [ConfXMLParamLeaf](ConfXMLParamLeaf.md#s-ConfXMLParamLeaf)
- [ConfXMLParamStart](ConfXMLParamStart.md#s-ConfXMLParamStart)
- [ConfXMLParamStartDel](ConfXMLParamStartDel.md#s-ConfXMLParamStartDel)
- [ConfXMLParamStop](ConfXMLParamStop.md#s-ConfXMLParamStop)
- [ConfXMLParamValue](ConfXMLParamValue.md#s-ConfXMLParamValue)
- [ConfXMLTagH](ConfXMLTagH.md#s-ConfXMLTagH)
- [ConfXPath](ConfXPath.md#s-ConfXPath)
- [DiffIterateFlags](DiffIterateFlags.md#s-DiffIterateFlags)
- [DiffIterateOperFlag](DiffIterateOperFlag.md#s-DiffIterateOperFlag)
- [DiffIterateResultFlag](DiffIterateResultFlag.md#s-DiffIterateResultFlag)
- [ErrorCode](ErrorCode.md#s-ErrorCode)
- [ErrorMessageFormatter](ErrorMessageFormatter.md#s-ErrorMessageFormatter)
- [ErrorVerbosity](ErrorVerbosity.md#s-ErrorVerbosity)
- [InstancePath](InstancePath.md#s-InstancePath)
- [IterateFlags](IterateFlags.md#s-IterateFlags)
- [MountIdInterface](MountIdInterface.md#s-MountIdInterface)
- [SnmpVarbind](SnmpVarbind.md#s-SnmpVarbind)
- [SocketFactory](SocketFactory.md#s-SocketFactory)
- [SocketFactoryCallback](SocketFactoryCallback.md#s-SocketFactoryCallback)
- [XMLParamType](XMLParamType.md#s-XMLParamType)
- [XPathAbrevCompiler](XPathAbrevCompiler.md#s-XPathAbrevCompiler)
