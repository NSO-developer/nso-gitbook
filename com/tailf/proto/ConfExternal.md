# ConfExternal <a href="#confexternal-b3f171f59fb9" id="confexternal-b3f171f59fb9"></a>

```java
public class com.tailf.proto.ConfExternal
```

Provides a collection of constants used when encoding and decoding E terms.

## Members

**Fields**:

- [atomTag](#atomtag-fd4ab67203f2)
- [binTag](#bintag-cc229ec1cee4)
- [compressed](#compressed-ceaa149030cf)
- [doubleTag](#doubletag-2cf4bc1aabfc)
- [erlMax](#erlmax-290c3944fa32)
- [erlMin](#erlmin-831ec495b105)
- [floatTag](#floattag-c19ce09342ad)
- [intTag](#inttag-2e8e433f5945)
- [largeBigTag](#largebigtag-179640a49b5b)
- [largeTupleTag](#largetupletag-75873843635b)
- [listTag](#listtag-af35af6b82fb)
- [maxAtomLength](#maxatomlength-01af45a93ca2)
- [newPidTag](#newpidtag-295c54ed5aa5)
- [newRefTag](#newreftag-4614e6f01b0a)
- [nilTag](#niltag-def97cf2525e)
- [pidTag](#pidtag-3bf06e445059)
- [portTag](#porttag-6eaf75c51137)
- [refTag](#reftag-d90eeb88d641)
- [smallAtomUtf8Tag](#smallatomutf8tag-a08aa40f835c)
- [smallBigTag](#smallbigtag-5e11243ddfb3)
- [smallIntTag](#smallinttag-c28fc0057a76)
- [smallTupleTag](#smalltupletag-81ceadebb1d7)
- [stringTag](#stringtag-3cd2da5222d0)
- [versionTag](#versiontag-af9b9d0f900e)

## Fields

### atomTag <a href="#atomtag-fd4ab67203f2" id="atomtag-fd4ab67203f2"></a>

```java
public static final int atomTag = 100;
```

The tag used for atoms.
 Starting with OTP 26 atoms are no longer encoded with this tag

### binTag <a href="#bintag-cc229ec1cee4" id="bintag-cc229ec1cee4"></a>

```java
public static final int binTag = 109;
```

The tag used for binaries

### compressed <a href="#compressed-ceaa149030cf" id="compressed-ceaa149030cf"></a>

```java
public static final int compressed = 80;
```

The tag is used for compressed terms

### doubleTag <a href="#doubletag-2cf4bc1aabfc" id="doubletag-2cf4bc1aabfc"></a>

```java
public static final int doubleTag = 70;
```

The tag used for double numbers

### erlMax <a href="#erlmax-290c3944fa32" id="erlmax-290c3944fa32"></a>

```java
public static final int erlMax = 134217727;
```

The largest value that can be encoded as an integer

### erlMin <a href="#erlmin-831ec495b105" id="erlmin-831ec495b105"></a>

```java
public static final int erlMin = -134217728;
```

The smallest value that can be encoded as an integer

### floatTag <a href="#floattag-c19ce09342ad" id="floattag-c19ce09342ad"></a>

```java
public static final int floatTag = 99;
```

The tag used for floating point numbers

### intTag <a href="#inttag-2e8e433f5945" id="inttag-2e8e433f5945"></a>

```java
public static final int intTag = 98;
```

The tag used for integers

### largeBigTag <a href="#largebigtag-179640a49b5b" id="largebigtag-179640a49b5b"></a>

```java
public static final int largeBigTag = 111;
```

The tag used for large bignums

### largeTupleTag <a href="#largetupletag-75873843635b" id="largetupletag-75873843635b"></a>

```java
public static final int largeTupleTag = 105;
```

The tag used for large tuples

### listTag <a href="#listtag-af35af6b82fb" id="listtag-af35af6b82fb"></a>

```java
public static final int listTag = 108;
```

The tag used for non-empty lists

### maxAtomLength <a href="#maxatomlength-01af45a93ca2" id="maxatomlength-01af45a93ca2"></a>

```java
public static final int maxAtomLength = 255;
```

The longest allowed E atom

### newPidTag <a href="#newpidtag-295c54ed5aa5" id="newpidtag-295c54ed5aa5"></a>

```java
public static final int newPidTag = 88;
```

The new tag used for PIDs.
 Starting with OTP 23 all pids are now encoded using NEW_PID_EXT

### newRefTag <a href="#newreftag-4614e6f01b0a" id="newreftag-4614e6f01b0a"></a>

```java
public static final int newRefTag = 114;
```

The tag used for new style references

### nilTag <a href="#niltag-def97cf2525e" id="niltag-def97cf2525e"></a>

```java
public static final int nilTag = 106;
```

The tag used for empty lists

### pidTag <a href="#pidtag-3bf06e445059" id="pidtag-3bf06e445059"></a>

```java
public static final int pidTag = 103;
```

The tag used for PIDs.
 Starting with OTP 23 PIDs are no longer encoded with this tag

### portTag <a href="#porttag-6eaf75c51137" id="porttag-6eaf75c51137"></a>

```java
public static final int portTag = 102;
```

The tag used for ports

### refTag <a href="#reftag-d90eeb88d641" id="reftag-d90eeb88d641"></a>

```java
public static final int refTag = 101;
```

The tag used for old stype references

### smallAtomUtf8Tag <a href="#smallatomutf8tag-a08aa40f835c" id="smallatomutf8tag-a08aa40f835c"></a>

```java
public static final int smallAtomUtf8Tag = 119;
```

The tag used for small atoms UTF-8.
 Starting with OTP 26 atoms are encoded using SMALL_ATOM_UTF8_EXT

### smallBigTag <a href="#smallbigtag-5e11243ddfb3" id="smallbigtag-5e11243ddfb3"></a>

```java
public static final int smallBigTag = 110;
```

The tag used for small bignums

### smallIntTag <a href="#smallinttag-c28fc0057a76" id="smallinttag-c28fc0057a76"></a>

```java
public static final int smallIntTag = 97;
```

The tag used for small integers

### smallTupleTag <a href="#smalltupletag-81ceadebb1d7" id="smalltupletag-81ceadebb1d7"></a>

```java
public static final int smallTupleTag = 104;
```

The tag used for small tuples

### stringTag <a href="#stringtag-3cd2da5222d0" id="stringtag-3cd2da5222d0"></a>

```java
public static final int stringTag = 107;
```

The tag used for strings and lists of small integers

### versionTag <a href="#versiontag-af9b9d0f900e" id="versiontag-af9b9d0f900e"></a>

```java
public static final int versionTag = 131;
```

The version number used to mark serialized E terms
