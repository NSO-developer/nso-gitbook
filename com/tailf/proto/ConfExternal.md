# ConfExternal <a href="#cls-ConfExternal" id="cls-ConfExternal"></a>

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

### atomTag <a href="#m-atomTag" id="m-atomTag"></a>

```java
public static final int atomTag = 100;
```

The tag used for atoms.
 Starting with OTP 26 atoms are no longer encoded with this tag

### binTag <a href="#m-binTag" id="m-binTag"></a>

```java
public static final int binTag = 109;
```

The tag used for binaries

### compressed <a href="#m-compressed" id="m-compressed"></a>

```java
public static final int compressed = 80;
```

The tag is used for compressed terms

### doubleTag <a href="#m-doubleTag" id="m-doubleTag"></a>

```java
public static final int doubleTag = 70;
```

The tag used for double numbers

### erlMax <a href="#m-erlMax" id="m-erlMax"></a>

```java
public static final int erlMax = 134217727;
```

The largest value that can be encoded as an integer

### erlMin <a href="#m-erlMin" id="m-erlMin"></a>

```java
public static final int erlMin = -134217728;
```

The smallest value that can be encoded as an integer

### floatTag <a href="#m-floatTag" id="m-floatTag"></a>

```java
public static final int floatTag = 99;
```

The tag used for floating point numbers

### intTag <a href="#m-intTag" id="m-intTag"></a>

```java
public static final int intTag = 98;
```

The tag used for integers

### largeBigTag <a href="#m-largeBigTag" id="m-largeBigTag"></a>

```java
public static final int largeBigTag = 111;
```

The tag used for large bignums

### largeTupleTag <a href="#m-largeTupleTag" id="m-largeTupleTag"></a>

```java
public static final int largeTupleTag = 105;
```

The tag used for large tuples

### listTag <a href="#m-listTag" id="m-listTag"></a>

```java
public static final int listTag = 108;
```

The tag used for non-empty lists

### maxAtomLength <a href="#m-maxAtomLength" id="m-maxAtomLength"></a>

```java
public static final int maxAtomLength = 255;
```

The longest allowed E atom

### newPidTag <a href="#m-newPidTag" id="m-newPidTag"></a>

```java
public static final int newPidTag = 88;
```

The new tag used for PIDs.
 Starting with OTP 23 all pids are now encoded using NEW_PID_EXT

### newRefTag <a href="#m-newRefTag" id="m-newRefTag"></a>

```java
public static final int newRefTag = 114;
```

The tag used for new style references

### nilTag <a href="#m-nilTag" id="m-nilTag"></a>

```java
public static final int nilTag = 106;
```

The tag used for empty lists

### pidTag <a href="#m-pidTag" id="m-pidTag"></a>

```java
public static final int pidTag = 103;
```

The tag used for PIDs.
 Starting with OTP 23 PIDs are no longer encoded with this tag

### portTag <a href="#m-portTag" id="m-portTag"></a>

```java
public static final int portTag = 102;
```

The tag used for ports

### refTag <a href="#m-refTag" id="m-refTag"></a>

```java
public static final int refTag = 101;
```

The tag used for old stype references

### smallAtomUtf8Tag <a href="#m-smallAtomUtf8Tag" id="m-smallAtomUtf8Tag"></a>

```java
public static final int smallAtomUtf8Tag = 119;
```

The tag used for small atoms UTF-8.
 Starting with OTP 26 atoms are encoded using SMALL_ATOM_UTF8_EXT

### smallBigTag <a href="#m-smallBigTag" id="m-smallBigTag"></a>

```java
public static final int smallBigTag = 110;
```

The tag used for small bignums

### smallIntTag <a href="#m-smallIntTag" id="m-smallIntTag"></a>

```java
public static final int smallIntTag = 97;
```

The tag used for small integers

### smallTupleTag <a href="#m-smallTupleTag" id="m-smallTupleTag"></a>

```java
public static final int smallTupleTag = 104;
```

The tag used for small tuples

### stringTag <a href="#m-stringTag" id="m-stringTag"></a>

```java
public static final int stringTag = 107;
```

The tag used for strings and lists of small integers

### versionTag <a href="#m-versionTag" id="m-versionTag"></a>

```java
public static final int versionTag = 131;
```

The version number used to mark serialized E terms
