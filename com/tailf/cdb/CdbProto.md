<a id="s-CdbProto"></a>
# CdbProto

```java
public class com.tailf.cdb.CdbProto
```

General class for protocol constants

## Members

**Constructors**:

- [CdbProto()](#s-CdbProto-1)

**Fields**:

- [ERROR_FLAG_MASK](#s-ERROR_FLAG_MASK)
- [OP_CD](#s-OP_CD)
- [OP_CLIENT_INFO](#s-OP_CLIENT_INFO)
- [OP_CLIENT_NAME](#s-OP_CLIENT_NAME)
- [OP_CREATE](#s-OP_CREATE)
- [OP_DELETE](#s-OP_DELETE)
- [OP_END_SESSION](#s-OP_END_SESSION)
- [OP_EXISTS](#s-OP_EXISTS)
- [OP_GET](#s-OP_GET)
- [OP_GET2](#s-OP_GET2)
- [OP_GET_ATTRS](#s-OP_GET_ATTRS)
- [OP_GET_CASE](#s-OP_GET_CASE)
- [OP_GET_CLI](#s-OP_GET_CLI)
- [OP_GET_COMPACTION_INFO](#s-OP_GET_COMPACTION_INFO)
- [OP_GET_MODIFICATIONS](#s-OP_GET_MODIFICATIONS)
- [OP_GET_MOUNT_ID](#s-OP_GET_MOUNT_ID)
- [OP_GET_OBJECT](#s-OP_GET_OBJECT)
- [OP_GET_OBJECTS](#s-OP_GET_OBJECTS)
- [OP_GET_PHASE](#s-OP_GET_PHASE)
- [OP_GET_REPLAY_TXID](#s-OP_GET_REPLAY_TXID)
- [OP_GET_TRANS_TID](#s-OP_GET_TRANS_TID)
- [OP_GET_TXID](#s-OP_GET_TXID)
- [OP_GET_USER_SESSION](#s-OP_GET_USER_SESSION)
- [OP_GET_VALUES](#s-OP_GET_VALUES)
- [OP_GETCWD](#s-OP_GETCWD)
- [OP_INITIATE_COMPACTION](#s-OP_INITIATE_COMPACTION)
- [OP_INITIATE_DBFILE_COMPACTION](#s-OP_INITIATE_DBFILE_COMPACTION)
- [OP_IS_DEFAULT](#s-OP_IS_DEFAULT)
- [OP_KEY_INDEX](#s-OP_KEY_INDEX)
- [OP_MANDATORY_SUBSCRIBER](#s-OP_MANDATORY_SUBSCRIBER)
- [OP_MASK](#s-OP_MASK)
- [OP_NEW_SESSION](#s-OP_NEW_SESSION)
- [OP_NUM_INSTANCES](#s-OP_NUM_INSTANCES)
- [OP_NXT_INDEX](#s-OP_NXT_INDEX)
- [OP_OPER_SUBSCRIBE](#s-OP_OPER_SUBSCRIBE)
- [OP_POPD](#s-OP_POPD)
- [OP_PUSHD](#s-OP_PUSHD)
- [OP_REPLAY_SUBS](#s-OP_REPLAY_SUBS)
- [OP_SET_ATTR](#s-OP_SET_ATTR)
- [OP_SET_CASE](#s-OP_SET_CASE)
- [OP_SET_ELEM](#s-OP_SET_ELEM)
- [OP_SET_ELEM2](#s-OP_SET_ELEM2)
- [OP_SET_NAMESPACE](#s-OP_SET_NAMESPACE)
- [OP_SET_OBJECT](#s-OP_SET_OBJECT)
- [OP_SET_TIMEOUT](#s-OP_SET_TIMEOUT)
- [OP_SET_VALUES](#s-OP_SET_VALUES)
- [OP_SUB_EVENT](#s-OP_SUB_EVENT)
- [OP_SUB_ITERATE](#s-OP_SUB_ITERATE)
- [OP_SUB_PROGRESS](#s-OP_SUB_PROGRESS)
- [OP_SUBSCRIBE](#s-OP_SUBSCRIBE)
- [OP_SUBSCRIBE_DONE](#s-OP_SUBSCRIBE_DONE)
- [OP_SYNC_SUB](#s-OP_SYNC_SUB)
- [OP_TRIGGER_OPER_SUBS](#s-OP_TRIGGER_OPER_SUBS)
- [OP_TRIGGER_SUBS](#s-OP_TRIGGER_SUBS)
- [OP_UNSUBSCRIBE](#s-OP_UNSUBSCRIBE)
- [OP_WAIT_START](#s-OP_WAIT_START)
- [REL_FLAG_MASK](#s-REL_FLAG_MASK)

## Constructors

<a id="s-CdbProto-1"></a>
### CdbProto()

```java
public CdbProto()
```


## Fields

<a id="s-ERROR_FLAG_MASK"></a>
### ERROR_FLAG_MASK

```java
public static final int ERROR_FLAG_MASK = -2147483648;
```

<a id="s-OP_CD"></a>
### OP_CD

```java
public static final int OP_CD = 5;
```

<a id="s-OP_CLIENT_INFO"></a>
### OP_CLIENT_INFO

```java
public static final int OP_CLIENT_INFO = 19;
```

<a id="s-OP_CLIENT_NAME"></a>
### OP_CLIENT_NAME

```java
public static final int OP_CLIENT_NAME = 0;
```

<a id="s-OP_CREATE"></a>
### OP_CREATE

```java
public static final int OP_CREATE = 50;
```

<a id="s-OP_DELETE"></a>
### OP_DELETE

```java
public static final int OP_DELETE = 51;
```

<a id="s-OP_END_SESSION"></a>
### OP_END_SESSION

```java
public static final int OP_END_SESSION = 2;
```

<a id="s-OP_EXISTS"></a>
### OP_EXISTS

```java
public static final int OP_EXISTS = 8;
```

<a id="s-OP_GET"></a>
### OP_GET

```java
public static final int OP_GET = 4;
```

<a id="s-OP_GET2"></a>
### OP_GET2

```java
public static final int OP_GET2 = 11;
```

<a id="s-OP_GET_ATTRS"></a>
### OP_GET_ATTRS

```java
public static final int OP_GET_ATTRS = 79;
```

<a id="s-OP_GET_CASE"></a>
### OP_GET_CASE

```java
public static final int OP_GET_CASE = 17;
```

<a id="s-OP_GET_CLI"></a>
### OP_GET_CLI

```java
public static final int OP_GET_CLI = 41;
```

<a id="s-OP_GET_COMPACTION_INFO"></a>
### OP_GET_COMPACTION_INFO

```java
public static final int OP_GET_COMPACTION_INFO = 81;
```

<a id="s-OP_GET_MODIFICATIONS"></a>
### OP_GET_MODIFICATIONS

```java
public static final int OP_GET_MODIFICATIONS = 40;
```

<a id="s-OP_GET_MOUNT_ID"></a>
### OP_GET_MOUNT_ID

```java
public static final int OP_GET_MOUNT_ID = 78;
```

<a id="s-OP_GET_OBJECT"></a>
### OP_GET_OBJECT

```java
public static final int OP_GET_OBJECT = 12;
```

<a id="s-OP_GET_OBJECTS"></a>
### OP_GET_OBJECTS

```java
public static final int OP_GET_OBJECTS = 13;
```

<a id="s-OP_GET_PHASE"></a>
### OP_GET_PHASE

```java
public static final int OP_GET_PHASE = 65;
```

<a id="s-OP_GET_REPLAY_TXID"></a>
### OP_GET_REPLAY_TXID

```java
public static final int OP_GET_REPLAY_TXID = 72;
```

<a id="s-OP_GET_TRANS_TID"></a>
### OP_GET_TRANS_TID

```java
public static final int OP_GET_TRANS_TID = 70;
```

<a id="s-OP_GET_TXID"></a>
### OP_GET_TXID

```java
public static final int OP_GET_TXID = 66;
```

<a id="s-OP_GET_USER_SESSION"></a>
### OP_GET_USER_SESSION

```java
public static final int OP_GET_USER_SESSION = 67;
```

<a id="s-OP_GET_VALUES"></a>
### OP_GET_VALUES

```java
public static final int OP_GET_VALUES = 14;
```

<a id="s-OP_GETCWD"></a>
### OP_GETCWD

```java
public static final int OP_GETCWD = 10;
```

<a id="s-OP_INITIATE_COMPACTION"></a>
### OP_INITIATE_COMPACTION

```java
public static final int OP_INITIATE_COMPACTION = 76;
```

<a id="s-OP_INITIATE_DBFILE_COMPACTION"></a>
### OP_INITIATE_DBFILE_COMPACTION

```java
public static final int OP_INITIATE_DBFILE_COMPACTION = 77;
```

<a id="s-OP_IS_DEFAULT"></a>
### OP_IS_DEFAULT

```java
public static final int OP_IS_DEFAULT = 18;
```

<a id="s-OP_KEY_INDEX"></a>
### OP_KEY_INDEX

```java
public static final int OP_KEY_INDEX = 15;
```

<a id="s-OP_MANDATORY_SUBSCRIBER"></a>
### OP_MANDATORY_SUBSCRIBER

```java
public static final int OP_MANDATORY_SUBSCRIBER = 74;
```

<a id="s-OP_MASK"></a>
### OP_MASK

```java
public static final int OP_MASK = 2147483647;
```

<a id="s-OP_NEW_SESSION"></a>
### OP_NEW_SESSION

```java
public static final int OP_NEW_SESSION = 1;
```

<a id="s-OP_NUM_INSTANCES"></a>
### OP_NUM_INSTANCES

```java
public static final int OP_NUM_INSTANCES = 9;
```

<a id="s-OP_NXT_INDEX"></a>
### OP_NXT_INDEX

```java
public static final int OP_NXT_INDEX = 16;
```

<a id="s-OP_OPER_SUBSCRIBE"></a>
### OP_OPER_SUBSCRIBE

```java
public static final int OP_OPER_SUBSCRIBE = 38;
```

<a id="s-OP_POPD"></a>
### OP_POPD

```java
public static final int OP_POPD = 7;
```

<a id="s-OP_PUSHD"></a>
### OP_PUSHD

```java
public static final int OP_PUSHD = 6;
```

<a id="s-OP_REPLAY_SUBS"></a>
### OP_REPLAY_SUBS

```java
public static final int OP_REPLAY_SUBS = 71;
```

<a id="s-OP_SET_ATTR"></a>
### OP_SET_ATTR

```java
public static final int OP_SET_ATTR = 80;
```

<a id="s-OP_SET_CASE"></a>
### OP_SET_CASE

```java
public static final int OP_SET_CASE = 54;
```

<a id="s-OP_SET_ELEM"></a>
### OP_SET_ELEM

```java
public static final int OP_SET_ELEM = 48;
```

<a id="s-OP_SET_ELEM2"></a>
### OP_SET_ELEM2

```java
public static final int OP_SET_ELEM2 = 49;
```

<a id="s-OP_SET_NAMESPACE"></a>
### OP_SET_NAMESPACE

```java
public static final int OP_SET_NAMESPACE = 3;
```

<a id="s-OP_SET_OBJECT"></a>
### OP_SET_OBJECT

```java
public static final int OP_SET_OBJECT = 52;
```

<a id="s-OP_SET_TIMEOUT"></a>
### OP_SET_TIMEOUT

```java
public static final int OP_SET_TIMEOUT = 73;
```

<a id="s-OP_SET_VALUES"></a>
### OP_SET_VALUES

```java
public static final int OP_SET_VALUES = 53;
```

<a id="s-OP_SUB_EVENT"></a>
### OP_SUB_EVENT

```java
public static final int OP_SUB_EVENT = 33;
```

<a id="s-OP_SUB_ITERATE"></a>
### OP_SUB_ITERATE

```java
public static final int OP_SUB_ITERATE = 36;
```

<a id="s-OP_SUB_PROGRESS"></a>
### OP_SUB_PROGRESS

```java
public static final int OP_SUB_PROGRESS = 39;
```

<a id="s-OP_SUBSCRIBE"></a>
### OP_SUBSCRIBE

```java
public static final int OP_SUBSCRIBE = 32;
```

<a id="s-OP_SUBSCRIBE_DONE"></a>
### OP_SUBSCRIBE_DONE

```java
public static final int OP_SUBSCRIBE_DONE = 37;
```

<a id="s-OP_SYNC_SUB"></a>
### OP_SYNC_SUB

```java
public static final int OP_SYNC_SUB = 34;
```

<a id="s-OP_TRIGGER_OPER_SUBS"></a>
### OP_TRIGGER_OPER_SUBS

```java
public static final int OP_TRIGGER_OPER_SUBS = 75;
```

<a id="s-OP_TRIGGER_SUBS"></a>
### OP_TRIGGER_SUBS

```java
public static final int OP_TRIGGER_SUBS = 68;
```

<a id="s-OP_UNSUBSCRIBE"></a>
### OP_UNSUBSCRIBE

```java
public static final int OP_UNSUBSCRIBE = 35;
```

<a id="s-OP_WAIT_START"></a>
### OP_WAIT_START

```java
public static final int OP_WAIT_START = 64;
```

<a id="s-REL_FLAG_MASK"></a>
### REL_FLAG_MASK

```java
public static final int REL_FLAG_MASK = -2147483648;
```
