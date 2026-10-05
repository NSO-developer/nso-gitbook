# ArrayTool <a href="#arraytool-bba3b5e0d853" id="arraytool-bba3b5e0d853"></a>

```java
public class com.tailf.util.ArrayTool
```

Tools for array manipulation.

## Members

**Methods**:

- [concatArrays(Object[], Object)](#concatarrays-f32733fb7851)
- [concatArrays(Object[], Object[])](#concatarrays-d5889ad0c069)
- [copyOfRange(T[], int, int)](#copyofrange-69de5e44fd9f)

## Methods

### concatArrays(Object[], Object) <a href="#concatarrays-f32733fb7851" id="concatarrays-f32733fb7851"></a>

```java
public static Object[] concatArrays(Object[] a, Object o)
```

Appends an object to the end of an array, creating a new array.

**Parameters**

- `Object[] a` - source array
- `Object o` - object to append

**Returns:** new array with the object appended

### concatArrays(Object[], Object[]) <a href="#concatarrays-d5889ad0c069" id="concatarrays-d5889ad0c069"></a>

```java
public static Object[] concatArrays(Object[] a, Object[] b)
```

Concatenates two arrays into a new array.

**Parameters**

- `Object[] a` - first array to concatenate
- `Object[] b` - second array to concatenate

**Returns:** new array containing elements from both arrays

### copyOfRange(T[], int, int) <a href="#copyofrange-69de5e44fd9f" id="copyofrange-69de5e44fd9f"></a>

```java
public static <T> T[] copyOfRange(T[] original, int from, int to)
```

Returns a subarray from the `original` array
 from `from` to `to`.

 Copies the specified range of the specified array into a new array.

 The initial index of the range (`from`) must lie between zero
 and `original.length`, inclusive.

 The value at `original[from]` is placed into the initial
 element of the copy
 (unless `from == original.length` or `from == to`).

 Values from subsequent elements in the original array are placed into
 subsequent elements in the copy.  The final index of the range
 (`to`), which must be greater than or equal to `from`,
 may be greater than `original.length`, in which case
 `null` is placed in all elements of the copy whose index is
 greater than or equal to `original.length - from`.  The length
 of the returned array will be `to - from`.

  The resulting array is of exactly the same class as the original
 array.

**Type Parameters**

- `T` - the type of array elements

**Parameters**

- `T[] original` - the array from which a range is to be copied
- `int from` - the initial index of the range to be copied, inclusive
- `int to` - the final index of the range to be copied, exclusive.
     (This index may lie outside the array.)

**Returns:** a new array containing the specified range from the original
 array,
     truncated or padded with nulls to obtain the required length

**Throws**

- `ArrayIndexOutOfBoundsException` - if `from < 0`
     or `from > original.length`
- `IllegalArgumentException` - if `from > to`
- `NullPointerException` - if `original` is null
