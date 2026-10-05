<a id="s-ConfExternal"></a>
# ConfExternal

```java
public class com.tailf.proto.ConfExternal
```

Provides a collection of constants used when encoding and decoding E terms.

## Members

**Fields**:

- [atomTag](#s-atomTag)
- [binTag](#s-binTag)
- [compressed](#s-compressed)
- [doubleTag](#s-doubleTag)
- [erlMax](#s-erlMax)
- [erlMin](#s-erlMin)
- [floatTag](#s-floatTag)
- [intTag](#s-intTag)
- [largeBigTag](#s-largeBigTag)
- [largeTupleTag](#s-largeTupleTag)
- [listTag](#s-listTag)
- [maxAtomLength](#s-maxAtomLength)
- [newPidTag](#s-newPidTag)
- [newRefTag](#s-newRefTag)
- [nilTag](#s-nilTag)
- [pidTag](#s-pidTag)
- [portTag](#s-portTag)
- [refTag](#s-refTag)
- [smallAtomUtf8Tag](#s-smallAtomUtf8Tag)
- [smallBigTag](#s-smallBigTag)
- [smallIntTag](#s-smallIntTag)
- [smallTupleTag](#s-smallTupleTag)
- [stringTag](#s-stringTag)
- [versionTag](#s-versionTag)

## Fields

<a id="s-atomTag"></a>
### atomTag

```java
public static final int atomTag = 100;
```

The tag used for atoms.
 Starting with OTP 26 atoms are no longer encoded with this tag

<a id="s-binTag"></a>
### binTag

```java
public static final int binTag = 109;
```

The tag used for binaries

<a id="s-compressed"></a>
### compressed

```java
public static final int compressed = 80;
```

The tag is used for compressed terms

<a id="s-doubleTag"></a>
### doubleTag

```java
public static final int doubleTag = 70;
```

The tag used for double numbers

<a id="s-erlMax"></a>
### erlMax

```java
public static final int erlMax = 134217727;
```

The largest value that can be encoded as an integer

<a id="s-erlMin"></a>
### erlMin

```java
public static final int erlMin = -134217728;
```

The smallest value that can be encoded as an integer

<a id="s-floatTag"></a>
### floatTag

```java
public static final int floatTag = 99;
```

The tag used for floating point numbers

<a id="s-intTag"></a>
### intTag

```java
public static final int intTag = 98;
```

The tag used for integers

<a id="s-largeBigTag"></a>
### largeBigTag

```java
public static final int largeBigTag = 111;
```

The tag used for large bignums

<a id="s-largeTupleTag"></a>
### largeTupleTag

```java
public static final int largeTupleTag = 105;
```

The tag used for large tuples

<a id="s-listTag"></a>
### listTag

```java
public static final int listTag = 108;
```

The tag used for non-empty lists

<a id="s-maxAtomLength"></a>
### maxAtomLength

```java
public static final int maxAtomLength = 255;
```

The longest allowed E atom

<a id="s-newPidTag"></a>
### newPidTag

```java
public static final int newPidTag = 88;
```

The new tag used for PIDs.
 Starting with OTP 23 all pids are now encoded using NEW_PID_EXT

<a id="s-newRefTag"></a>
### newRefTag

```java
public static final int newRefTag = 114;
```

The tag used for new style references

<a id="s-nilTag"></a>
### nilTag

```java
public static final int nilTag = 106;
```

The tag used for empty lists

<a id="s-pidTag"></a>
### pidTag

```java
public static final int pidTag = 103;
```

The tag used for PIDs.
 Starting with OTP 23 PIDs are no longer encoded with this tag

<a id="s-portTag"></a>
### portTag

```java
public static final int portTag = 102;
```

The tag used for ports

<a id="s-refTag"></a>
### refTag

```java
public static final int refTag = 101;
```

The tag used for old stype references

<a id="s-smallAtomUtf8Tag"></a>
### smallAtomUtf8Tag

```java
public static final int smallAtomUtf8Tag = 119;
```

The tag used for small atoms UTF-8.
 Starting with OTP 26 atoms are encoded using SMALL_ATOM_UTF8_EXT

<a id="s-smallBigTag"></a>
### smallBigTag

```java
public static final int smallBigTag = 110;
```

The tag used for small bignums

<a id="s-smallIntTag"></a>
### smallIntTag

```java
public static final int smallIntTag = 97;
```

The tag used for small integers

<a id="s-smallTupleTag"></a>
### smallTupleTag

```java
public static final int smallTupleTag = 104;
```

The tag used for small tuples

<a id="s-stringTag"></a>
### stringTag

```java
public static final int stringTag = 107;
```

The tag used for strings and lists of small integers

<a id="s-versionTag"></a>
### versionTag

```java
public static final int versionTag = 131;
```

The version number used to mark serialized E terms
