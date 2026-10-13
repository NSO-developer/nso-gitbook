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

- [AmbiguousNamespaceException](AmbiguousNamespaceException.md#ambiguousnamespaceexception-2f0452c4518b)
- [Compiler](Compiler.md#compiler-552d3a56b931)
- [Conf](Conf.md#conf-4868d3a88b04)
- [ConfAttributeType](ConfAttributeType.md#confattributetype-292ad441835a)
- [ConfAttributeValue](ConfAttributeValue.md#confattributevalue-d38e058ca48e)
- [ConfBadTermException](ConfBadTermException.md#confbadtermexception-cf79bd96951c)
- [ConfBinary](ConfBinary.md#confbinary-ae691d2ce296)
- [ConfBit32](ConfBit32.md#confbit32-ce32a7d3e924)
- [ConfBit64](ConfBit64.md#confbit64-1837aeb3d331)
- [ConfBitBig](ConfBitBig.md#confbitbig-bae7e7d1d299)
- [ConfBits](ConfBits.md#confbits-fa772b723e51)
- [ConfBool](ConfBool.md#confbool-0916eaf5ea31)
- [ConfBuf](ConfBuf.md#confbuf-c460585d9115)
- [ConfCdbUpgradePath](ConfCdbUpgradePath.md#confcdbupgradepath-fe0db0ca5cb5)
- [ConfCleaner](ConfCleaner.md#confcleaner-57a771480d75)
- [ConfCLIToken](ConfCLIToken.md#confclitoken-ea1f8407bd42)
- [ConfDate](ConfDate.md#confdate-ffbd0843ec7e)
- [ConfDatetime](ConfDatetime.md#confdatetime-8f67d7ff6ae8)
- [ConfDecimal64](ConfDecimal64.md#confdecimal64-831b3867e03e)
- [ConfDefault](ConfDefault.md#confdefault-2e2c2aa1733d)
- [ConfDottedQuad](ConfDottedQuad.md#confdottedquad-2ac2afbc6e7a)
- [ConfDouble](ConfDouble.md#confdouble-667ec1a19411)
- [ConfDuration](ConfDuration.md#confduration-ccb0a76da9ec)
- [ConfEmpty](ConfEmpty.md#confempty-ddfbcdb54c9c)
- [ConfEnumeration](ConfEnumeration.md#confenumeration-c8557b4aeb53)
- [ConfException](ConfException.md#confexception-baeaab99f7f9)
- [ConfFindNextType](ConfFindNextType.md#conffindnexttype-c34c1027a581)
- [ConfFloat](ConfFloat.md#conffloat-ad1957df90a2)
- [ConfHaNode](ConfHaNode.md#confhanode-6a79a4c8e218)
- [ConfHexList](ConfHexList.md#confhexlist-8c011575f713)
- [ConfHexString](ConfHexString.md#confhexstring-548f8b3261aa)
- [ConfIdentityRef](ConfIdentityRef.md#confidentityref-1a367056e764)
- [ConfInt16](ConfInt16.md#confint16-4ec55eee1d8a)
- [ConfInt32](ConfInt32.md#confint32-581d5d0c6b8b)
- [ConfInt64](ConfInt64.md#confint64-0d4ed81a2e2f)
- [ConfInt8](ConfInt8.md#confint8-f9f87aa2aa7e)
- [ConfInternal](ConfInternal.md#confinternal-8b8c22804846)
- [ConfIP](ConfIP.md#confip-c1dfd6ba577e)
- [ConfIPAndPrefixLen](ConfIPAndPrefixLen.md#confipandprefixlen-dbeb26ceb9c7)
- [ConfIPPrefix](ConfIPPrefix.md#confipprefix-f03d2a982755)
- [ConfIPv4](ConfIPv4.md#confipv4-bea876f903ce)
- [ConfIPv4AndPrefixLen](ConfIPv4AndPrefixLen.md#confipv4andprefixlen-0d777e73ddb4)
- [ConfIPv4Prefix](ConfIPv4Prefix.md#confipv4prefix-aec792cc8d1c)
- [ConfIPv6](ConfIPv6.md#confipv6-d036fe3b26c6)
- [ConfIPv6AndPrefixLen](ConfIPv6AndPrefixLen.md#confipv6andprefixlen-bd905e7d81ce)
- [ConfIPv6Prefix](ConfIPv6Prefix.md#confipv6prefix-053d59995a32)
- [ConfIterate](ConfIterate.md#confiterate-bf30f0c248a0)
- [ConfIterateFlags](ConfIterateFlags.md#confiterateflags-74fb5551dac9)
- [ConfIterateResultFlag](ConfIterateResultFlag.md#confiterateresultflag-47d57f8165d1)
- [ConfKey](ConfKey.md#confkey-e4e1ca98e867)
- [ConfList](ConfList.md#conflist-a9c192ad3c99)
- [ConfNamespace](ConfNamespace.md#confnamespace-51b928e168d1)
- [ConfNamespaceStub](ConfNamespaceStub.md#confnamespacestub-81838488f663)
- [ConfNoExists](ConfNoExists.md#confnoexists-bdcf8f2c7ab9)
- [ConfObject](ConfObject.md#confobject-5433616953b2)
- [ConfObjectRef](ConfObjectRef.md#confobjectref-6b7c225d0d3d)
- [ConfOctetList](ConfOctetList.md#confoctetlist-4cec81a6f263)
- [ConfOID](ConfOID.md#confoid-11dc95a517d2)
- [ConfPath](ConfPath.md#confpath-327831c6fc7d)
- [ConfQname](ConfQname.md#confqname-32a7566f68b5)
- [ConfResponse](ConfResponse.md#confresponse-fd02dad17b49)
- [ConfTag](ConfTag.md#conftag-73757b87bc93)
- [ConfTagDefault](ConfTagDefault.md#conftagdefault-00d683b9bd42)
- [ConfTime](ConfTime.md#conftime-ba056a3a6559)
- [ConfTypeDescriptor](ConfTypeDescriptor.md#conftypedescriptor-54bbccc6dd79)
- [ConfUInt16](ConfUInt16.md#confuint16-04cad4bd46f9)
- [ConfUInt32](ConfUInt32.md#confuint32-e9d053dbaab3)
- [ConfUInt64](ConfUInt64.md#confuint64-c6c48fa366b2)
- [ConfUInt8](ConfUInt8.md#confuint8-423b682c23b7)
- [ConfUserInfo](ConfUserInfo.md#confuserinfo-e4beb1511ed2)
- [ConfValue](ConfValue.md#confvalue-769292781c7d)
- [ConfWarning](ConfWarning.md#confwarning-732794cbb596)
- [ConfWarningException](ConfWarningException.md#confwarningexception-0eb4469acfd8)
- [ConfXKey](ConfXKey.md#confxkey-ea6808e1c745)
- [ConfXMLParam](ConfXMLParam.md#confxmlparam-f5f4394b46a7)
- [ConfXMLParamCdbStart](ConfXMLParamCdbStart.md#confxmlparamcdbstart-9b866d8bd682)
- [ConfXMLParamLeaf](ConfXMLParamLeaf.md#confxmlparamleaf-107412653048)
- [ConfXMLParamStart](ConfXMLParamStart.md#confxmlparamstart-05eace141688)
- [ConfXMLParamStartDel](ConfXMLParamStartDel.md#confxmlparamstartdel-3d1390860b5a)
- [ConfXMLParamStop](ConfXMLParamStop.md#confxmlparamstop-d1e86c4fdecc)
- [ConfXMLParamValue](ConfXMLParamValue.md#confxmlparamvalue-9f41fb2668c9)
- [ConfXMLTagH](ConfXMLTagH.md#confxmltagh-212ec0c58c51)
- [ConfXPath](ConfXPath.md#confxpath-0180bbe0b500)
- [DiffIterateFlags](DiffIterateFlags.md#diffiterateflags-79473c9fdab6)
- [DiffIterateOperFlag](DiffIterateOperFlag.md#diffiterateoperflag-d1cd8560c2ec)
- [DiffIterateResultFlag](DiffIterateResultFlag.md#diffiterateresultflag-3bcd05ed3269)
- [ErrorCode](ErrorCode.md#errorcode-65263de08890)
- [ErrorMessageFormatter](ErrorMessageFormatter.md#errormessageformatter-ac64ccc06c80)
- [ErrorVerbosity](ErrorVerbosity.md#errorverbosity-7dabb9fc7bcd)
- [InstancePath](InstancePath.md#instancepath-7694a1545db3)
- [IterateFlags](IterateFlags.md#iterateflags-eb19614d573f)
- [MountIdInterface](MountIdInterface.md#mountidinterface-113d1b54dae0)
- [SnmpVarbind](SnmpVarbind.md#snmpvarbind-ef9f9c3d4932)
- [SocketFactory](SocketFactory.md#socketfactory-4c528c23b1bd)
- [SocketFactoryCallback](SocketFactoryCallback.md#socketfactorycallback-4ebb017096f5)
- [XMLParamType](XMLParamType.md#xmlparamtype-3881bed6e84d)
- [XPathAbrevCompiler](XPathAbrevCompiler.md#xpathabrevcompiler-e30fd52264f6)
