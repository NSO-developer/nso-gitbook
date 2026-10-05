<a id="cls-ConfExternal"></a>
# ConfExternal

```java
public class com.tailf.proto.ConfExternal
```

Provides a collection of constants used when encoding and decoding E terms.

## Members

**Fields**:

- [atomTag](#m-atomTag)
- [binTag](#m-binTag)
- [compressed](#m-compressed)
- [doubleTag](#m-doubleTag)
- [erlMax](#m-erlMax)
- [erlMin](#m-erlMin)
- [floatTag](#m-floatTag)
- [intTag](#m-intTag)
- [largeBigTag](#m-largeBigTag)
- [largeTupleTag](#m-largeTupleTag)
- [listTag](#m-listTag)
- [maxAtomLength](#m-maxAtomLength)
- [newPidTag](#m-newPidTag)
- [newRefTag](#m-newRefTag)
- [nilTag](#m-nilTag)
- [pidTag](#m-pidTag)
- [portTag](#m-portTag)
- [refTag](#m-refTag)
- [smallAtomUtf8Tag](#m-smallAtomUtf8Tag)
- [smallBigTag](#m-smallBigTag)
- [smallIntTag](#m-smallIntTag)
- [smallTupleTag](#m-smallTupleTag)
- [stringTag](#m-stringTag)
- [versionTag](#m-versionTag)

## Fields

<a id="m-atomTag"></a>
### atomTag

```java
public static final int atomTag = 100;
```

The tag used for atoms.
 Starting with OTP 26 atoms are no longer encoded with this tag

<a id="m-binTag"></a>
### binTag

```java
public static final int binTag = 109;
```

The tag used for binaries

<a id="m-compressed"></a>
### compressed

```java
public static final int compressed = 80;
```

The tag is used for compressed terms

<a id="m-doubleTag"></a>
### doubleTag

```java
public static final int doubleTag = 70;
```

The tag used for double numbers

<a id="m-erlMax"></a>
### erlMax

```java
public static final int erlMax = 134217727;
```

The largest value that can be encoded as an integer

<a id="m-erlMin"></a>
### erlMin

```java
public static final int erlMin = -134217728;
```

The smallest value that can be encoded as an integer

<a id="m-floatTag"></a>
### floatTag

```java
public static final int floatTag = 99;
```

The tag used for floating point numbers

<a id="m-intTag"></a>
### intTag

```java
public static final int intTag = 98;
```

The tag used for integers

<a id="m-largeBigTag"></a>
### largeBigTag

```java
public static final int largeBigTag = 111;
```

The tag used for large bignums

<a id="m-largeTupleTag"></a>
### largeTupleTag

```java
public static final int largeTupleTag = 105;
```

The tag used for large tuples

<a id="m-listTag"></a>
### listTag

```java
public static final int listTag = 108;
```

The tag used for non-empty lists

<a id="m-maxAtomLength"></a>
### maxAtomLength

```java
public static final int maxAtomLength = 255;
```

The longest allowed E atom

<a id="m-newPidTag"></a>
### newPidTag

```java
public static final int newPidTag = 88;
```

The new tag used for PIDs.
 Starting with OTP 23 all pids are now encoded using NEW_PID_EXT

<a id="m-newRefTag"></a>
### newRefTag

```java
public static final int newRefTag = 114;
```

The tag used for new style references

<a id="m-nilTag"></a>
### nilTag

```java
public static final int nilTag = 106;
```

The tag used for empty lists

<a id="m-pidTag"></a>
### pidTag

```java
public static final int pidTag = 103;
```

The tag used for PIDs.
 Starting with OTP 23 PIDs are no longer encoded with this tag

<a id="m-portTag"></a>
### portTag

```java
public static final int portTag = 102;
```

The tag used for ports

<a id="m-refTag"></a>
### refTag

```java
public static final int refTag = 101;
```

The tag used for old stype references

<a id="m-smallAtomUtf8Tag"></a>
### smallAtomUtf8Tag

```java
public static final int smallAtomUtf8Tag = 119;
```

The tag used for small atoms UTF-8.
 Starting with OTP 26 atoms are encoded using SMALL_ATOM_UTF8_EXT

<a id="m-smallBigTag"></a>
### smallBigTag

```java
public static final int smallBigTag = 110;
```

The tag used for small bignums

<a id="m-smallIntTag"></a>
### smallIntTag

```java
public static final int smallIntTag = 97;
```

The tag used for small integers

<a id="m-smallTupleTag"></a>
### smallTupleTag

```java
public static final int smallTupleTag = 104;
```

The tag used for small tuples

<a id="m-stringTag"></a>
### stringTag

```java
public static final int stringTag = 107;
```

The tag used for strings and lists of small integers

<a id="m-versionTag"></a>
### versionTag

```java
public static final int versionTag = 131;
```

The version number used to mark serialized E terms
