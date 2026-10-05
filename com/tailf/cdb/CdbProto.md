# CdbProto <a href="#cdbproto-3cf455453285" id="cdbproto-3cf455453285"></a>

```java
public class com.tailf.cdb.CdbProto
```

General class for protocol constants

## Members

**Constructors**:

- [CdbProto()](#cdbproto-c4f733603cad)

**Fields**:

- [ERROR_FLAG_MASK](#error_flag_mask-cd8dd5e7393a)
- [OP_CD](#op_cd-f00a7e5b64cd)
- [OP_CLIENT_INFO](#op_client_info-1bcbadb16af5)
- [OP_CLIENT_NAME](#op_client_name-57fee0e8652a)
- [OP_CREATE](#op_create-0bbf3220e743)
- [OP_DELETE](#op_delete-716d7376f15a)
- [OP_END_SESSION](#op_end_session-fc32e8dd6d1b)
- [OP_EXISTS](#op_exists-539d0163c2c7)
- [OP_GET](#op_get-ec97ad4d6542)
- [OP_GET2](#op_get2-090490e327c1)
- [OP_GET_ATTRS](#op_get_attrs-82677c589cd0)
- [OP_GET_CASE](#op_get_case-e4f1414ab877)
- [OP_GET_CLI](#op_get_cli-52f104a16308)
- [OP_GET_COMPACTION_INFO](#op_get_compaction_info-f519067278e5)
- [OP_GET_MODIFICATIONS](#op_get_modifications-5890a8446bf3)
- [OP_GET_MOUNT_ID](#op_get_mount_id-aa728c511739)
- [OP_GET_OBJECT](#op_get_object-5656835e409c)
- [OP_GET_OBJECTS](#op_get_objects-3af47caacf1f)
- [OP_GET_PHASE](#op_get_phase-50c857bb87ab)
- [OP_GET_REPLAY_TXID](#op_get_replay_txid-12e7d77de6e0)
- [OP_GET_TRANS_TID](#op_get_trans_tid-8096529724c7)
- [OP_GET_TXID](#op_get_txid-08c12864072b)
- [OP_GET_USER_SESSION](#op_get_user_session-24ca65db0119)
- [OP_GET_VALUES](#op_get_values-935703cadf86)
- [OP_GETCWD](#op_getcwd-a68dd856a654)
- [OP_INITIATE_COMPACTION](#op_initiate_compaction-a5e8cd1a36d3)
- [OP_INITIATE_DBFILE_COMPACTION](#op_initiate_dbfile_compaction-5f9474e0b453)
- [OP_IS_DEFAULT](#op_is_default-ef9825c6b9e8)
- [OP_KEY_INDEX](#op_key_index-9952e77ae679)
- [OP_MANDATORY_SUBSCRIBER](#op_mandatory_subscriber-cc12f921f6ff)
- [OP_MASK](#op_mask-c7ac325f5da5)
- [OP_NEW_SESSION](#op_new_session-be8cb4e9241c)
- [OP_NUM_INSTANCES](#op_num_instances-8ac53ee9efca)
- [OP_NXT_INDEX](#op_nxt_index-3ca4c0397b04)
- [OP_OPER_SUBSCRIBE](#op_oper_subscribe-8fa9796318aa)
- [OP_POPD](#op_popd-72ff6aad6c33)
- [OP_PUSHD](#op_pushd-7c9f06eed53b)
- [OP_REPLAY_SUBS](#op_replay_subs-0eaca953f7c8)
- [OP_SET_ATTR](#op_set_attr-a31b720d557d)
- [OP_SET_CASE](#op_set_case-81c3749e05de)
- [OP_SET_ELEM](#op_set_elem-0d05e348a583)
- [OP_SET_ELEM2](#op_set_elem2-56dd66044100)
- [OP_SET_NAMESPACE](#op_set_namespace-10c87714cfc0)
- [OP_SET_OBJECT](#op_set_object-fa6d83dece30)
- [OP_SET_TIMEOUT](#op_set_timeout-b783b91cd319)
- [OP_SET_VALUES](#op_set_values-046ce9907472)
- [OP_SUB_EVENT](#op_sub_event-12f8b5e52f91)
- [OP_SUB_ITERATE](#op_sub_iterate-19c0ddfe2746)
- [OP_SUB_PROGRESS](#op_sub_progress-f0a6be193cfd)
- [OP_SUBSCRIBE](#op_subscribe-b2e2b3e2b2ae)
- [OP_SUBSCRIBE_DONE](#op_subscribe_done-472a3c31d0ce)
- [OP_SYNC_SUB](#op_sync_sub-45bca6081e0f)
- [OP_TRIGGER_OPER_SUBS](#op_trigger_oper_subs-9ba8712f55da)
- [OP_TRIGGER_SUBS](#op_trigger_subs-7930fa5d0305)
- [OP_UNSUBSCRIBE](#op_unsubscribe-f5a645d0e50a)
- [OP_WAIT_START](#op_wait_start-dd0479d73a65)
- [REL_FLAG_MASK](#rel_flag_mask-6bd4446449ad)

## Constructors

### CdbProto() <a href="#cdbproto-c4f733603cad" id="cdbproto-c4f733603cad"></a>

```java
public CdbProto()
```


## Fields

### ERROR_FLAG_MASK <a href="#error_flag_mask-cd8dd5e7393a" id="error_flag_mask-cd8dd5e7393a"></a>

```java
public static final int ERROR_FLAG_MASK = -2147483648;
```

### OP_CD <a href="#op_cd-f00a7e5b64cd" id="op_cd-f00a7e5b64cd"></a>

```java
public static final int OP_CD = 5;
```

### OP_CLIENT_INFO <a href="#op_client_info-1bcbadb16af5" id="op_client_info-1bcbadb16af5"></a>

```java
public static final int OP_CLIENT_INFO = 19;
```

### OP_CLIENT_NAME <a href="#op_client_name-57fee0e8652a" id="op_client_name-57fee0e8652a"></a>

```java
public static final int OP_CLIENT_NAME = 0;
```

### OP_CREATE <a href="#op_create-0bbf3220e743" id="op_create-0bbf3220e743"></a>

```java
public static final int OP_CREATE = 50;
```

### OP_DELETE <a href="#op_delete-716d7376f15a" id="op_delete-716d7376f15a"></a>

```java
public static final int OP_DELETE = 51;
```

### OP_END_SESSION <a href="#op_end_session-fc32e8dd6d1b" id="op_end_session-fc32e8dd6d1b"></a>

```java
public static final int OP_END_SESSION = 2;
```

### OP_EXISTS <a href="#op_exists-539d0163c2c7" id="op_exists-539d0163c2c7"></a>

```java
public static final int OP_EXISTS = 8;
```

### OP_GET <a href="#op_get-ec97ad4d6542" id="op_get-ec97ad4d6542"></a>

```java
public static final int OP_GET = 4;
```

### OP_GET2 <a href="#op_get2-090490e327c1" id="op_get2-090490e327c1"></a>

```java
public static final int OP_GET2 = 11;
```

### OP_GET_ATTRS <a href="#op_get_attrs-82677c589cd0" id="op_get_attrs-82677c589cd0"></a>

```java
public static final int OP_GET_ATTRS = 79;
```

### OP_GET_CASE <a href="#op_get_case-e4f1414ab877" id="op_get_case-e4f1414ab877"></a>

```java
public static final int OP_GET_CASE = 17;
```

### OP_GET_CLI <a href="#op_get_cli-52f104a16308" id="op_get_cli-52f104a16308"></a>

```java
public static final int OP_GET_CLI = 41;
```

### OP_GET_COMPACTION_INFO <a href="#op_get_compaction_info-f519067278e5" id="op_get_compaction_info-f519067278e5"></a>

```java
public static final int OP_GET_COMPACTION_INFO = 81;
```

### OP_GET_MODIFICATIONS <a href="#op_get_modifications-5890a8446bf3" id="op_get_modifications-5890a8446bf3"></a>

```java
public static final int OP_GET_MODIFICATIONS = 40;
```

### OP_GET_MOUNT_ID <a href="#op_get_mount_id-aa728c511739" id="op_get_mount_id-aa728c511739"></a>

```java
public static final int OP_GET_MOUNT_ID = 78;
```

### OP_GET_OBJECT <a href="#op_get_object-5656835e409c" id="op_get_object-5656835e409c"></a>

```java
public static final int OP_GET_OBJECT = 12;
```

### OP_GET_OBJECTS <a href="#op_get_objects-3af47caacf1f" id="op_get_objects-3af47caacf1f"></a>

```java
public static final int OP_GET_OBJECTS = 13;
```

### OP_GET_PHASE <a href="#op_get_phase-50c857bb87ab" id="op_get_phase-50c857bb87ab"></a>

```java
public static final int OP_GET_PHASE = 65;
```

### OP_GET_REPLAY_TXID <a href="#op_get_replay_txid-12e7d77de6e0" id="op_get_replay_txid-12e7d77de6e0"></a>

```java
public static final int OP_GET_REPLAY_TXID = 72;
```

### OP_GET_TRANS_TID <a href="#op_get_trans_tid-8096529724c7" id="op_get_trans_tid-8096529724c7"></a>

```java
public static final int OP_GET_TRANS_TID = 70;
```

### OP_GET_TXID <a href="#op_get_txid-08c12864072b" id="op_get_txid-08c12864072b"></a>

```java
public static final int OP_GET_TXID = 66;
```

### OP_GET_USER_SESSION <a href="#op_get_user_session-24ca65db0119" id="op_get_user_session-24ca65db0119"></a>

```java
public static final int OP_GET_USER_SESSION = 67;
```

### OP_GET_VALUES <a href="#op_get_values-935703cadf86" id="op_get_values-935703cadf86"></a>

```java
public static final int OP_GET_VALUES = 14;
```

### OP_GETCWD <a href="#op_getcwd-a68dd856a654" id="op_getcwd-a68dd856a654"></a>

```java
public static final int OP_GETCWD = 10;
```

### OP_INITIATE_COMPACTION <a href="#op_initiate_compaction-a5e8cd1a36d3" id="op_initiate_compaction-a5e8cd1a36d3"></a>

```java
public static final int OP_INITIATE_COMPACTION = 76;
```

### OP_INITIATE_DBFILE_COMPACTION <a href="#op_initiate_dbfile_compaction-5f9474e0b453" id="op_initiate_dbfile_compaction-5f9474e0b453"></a>

```java
public static final int OP_INITIATE_DBFILE_COMPACTION = 77;
```

### OP_IS_DEFAULT <a href="#op_is_default-ef9825c6b9e8" id="op_is_default-ef9825c6b9e8"></a>

```java
public static final int OP_IS_DEFAULT = 18;
```

### OP_KEY_INDEX <a href="#op_key_index-9952e77ae679" id="op_key_index-9952e77ae679"></a>

```java
public static final int OP_KEY_INDEX = 15;
```

### OP_MANDATORY_SUBSCRIBER <a href="#op_mandatory_subscriber-cc12f921f6ff" id="op_mandatory_subscriber-cc12f921f6ff"></a>

```java
public static final int OP_MANDATORY_SUBSCRIBER = 74;
```

### OP_MASK <a href="#op_mask-c7ac325f5da5" id="op_mask-c7ac325f5da5"></a>

```java
public static final int OP_MASK = 2147483647;
```

### OP_NEW_SESSION <a href="#op_new_session-be8cb4e9241c" id="op_new_session-be8cb4e9241c"></a>

```java
public static final int OP_NEW_SESSION = 1;
```

### OP_NUM_INSTANCES <a href="#op_num_instances-8ac53ee9efca" id="op_num_instances-8ac53ee9efca"></a>

```java
public static final int OP_NUM_INSTANCES = 9;
```

### OP_NXT_INDEX <a href="#op_nxt_index-3ca4c0397b04" id="op_nxt_index-3ca4c0397b04"></a>

```java
public static final int OP_NXT_INDEX = 16;
```

### OP_OPER_SUBSCRIBE <a href="#op_oper_subscribe-8fa9796318aa" id="op_oper_subscribe-8fa9796318aa"></a>

```java
public static final int OP_OPER_SUBSCRIBE = 38;
```

### OP_POPD <a href="#op_popd-72ff6aad6c33" id="op_popd-72ff6aad6c33"></a>

```java
public static final int OP_POPD = 7;
```

### OP_PUSHD <a href="#op_pushd-7c9f06eed53b" id="op_pushd-7c9f06eed53b"></a>

```java
public static final int OP_PUSHD = 6;
```

### OP_REPLAY_SUBS <a href="#op_replay_subs-0eaca953f7c8" id="op_replay_subs-0eaca953f7c8"></a>

```java
public static final int OP_REPLAY_SUBS = 71;
```

### OP_SET_ATTR <a href="#op_set_attr-a31b720d557d" id="op_set_attr-a31b720d557d"></a>

```java
public static final int OP_SET_ATTR = 80;
```

### OP_SET_CASE <a href="#op_set_case-81c3749e05de" id="op_set_case-81c3749e05de"></a>

```java
public static final int OP_SET_CASE = 54;
```

### OP_SET_ELEM <a href="#op_set_elem-0d05e348a583" id="op_set_elem-0d05e348a583"></a>

```java
public static final int OP_SET_ELEM = 48;
```

### OP_SET_ELEM2 <a href="#op_set_elem2-56dd66044100" id="op_set_elem2-56dd66044100"></a>

```java
public static final int OP_SET_ELEM2 = 49;
```

### OP_SET_NAMESPACE <a href="#op_set_namespace-10c87714cfc0" id="op_set_namespace-10c87714cfc0"></a>

```java
public static final int OP_SET_NAMESPACE = 3;
```

### OP_SET_OBJECT <a href="#op_set_object-fa6d83dece30" id="op_set_object-fa6d83dece30"></a>

```java
public static final int OP_SET_OBJECT = 52;
```

### OP_SET_TIMEOUT <a href="#op_set_timeout-b783b91cd319" id="op_set_timeout-b783b91cd319"></a>

```java
public static final int OP_SET_TIMEOUT = 73;
```

### OP_SET_VALUES <a href="#op_set_values-046ce9907472" id="op_set_values-046ce9907472"></a>

```java
public static final int OP_SET_VALUES = 53;
```

### OP_SUB_EVENT <a href="#op_sub_event-12f8b5e52f91" id="op_sub_event-12f8b5e52f91"></a>

```java
public static final int OP_SUB_EVENT = 33;
```

### OP_SUB_ITERATE <a href="#op_sub_iterate-19c0ddfe2746" id="op_sub_iterate-19c0ddfe2746"></a>

```java
public static final int OP_SUB_ITERATE = 36;
```

### OP_SUB_PROGRESS <a href="#op_sub_progress-f0a6be193cfd" id="op_sub_progress-f0a6be193cfd"></a>

```java
public static final int OP_SUB_PROGRESS = 39;
```

### OP_SUBSCRIBE <a href="#op_subscribe-b2e2b3e2b2ae" id="op_subscribe-b2e2b3e2b2ae"></a>

```java
public static final int OP_SUBSCRIBE = 32;
```

### OP_SUBSCRIBE_DONE <a href="#op_subscribe_done-472a3c31d0ce" id="op_subscribe_done-472a3c31d0ce"></a>

```java
public static final int OP_SUBSCRIBE_DONE = 37;
```

### OP_SYNC_SUB <a href="#op_sync_sub-45bca6081e0f" id="op_sync_sub-45bca6081e0f"></a>

```java
public static final int OP_SYNC_SUB = 34;
```

### OP_TRIGGER_OPER_SUBS <a href="#op_trigger_oper_subs-9ba8712f55da" id="op_trigger_oper_subs-9ba8712f55da"></a>

```java
public static final int OP_TRIGGER_OPER_SUBS = 75;
```

### OP_TRIGGER_SUBS <a href="#op_trigger_subs-7930fa5d0305" id="op_trigger_subs-7930fa5d0305"></a>

```java
public static final int OP_TRIGGER_SUBS = 68;
```

### OP_UNSUBSCRIBE <a href="#op_unsubscribe-f5a645d0e50a" id="op_unsubscribe-f5a645d0e50a"></a>

```java
public static final int OP_UNSUBSCRIBE = 35;
```

### OP_WAIT_START <a href="#op_wait_start-dd0479d73a65" id="op_wait_start-dd0479d73a65"></a>

```java
public static final int OP_WAIT_START = 64;
```

### REL_FLAG_MASK <a href="#rel_flag_mask-6bd4446449ad" id="rel_flag_mask-6bd4446449ad"></a>

```java
public static final int REL_FLAG_MASK = -2147483648;
```
