# DpProto <a href="#dpproto-caad98905406" id="dpproto-caad98905406"></a>

```java
public class com.tailf.dp.DpProto
```

General class for protocol constants

## Members

**Constructors**:

- [DpProto()](#dpproto-13681c4c4fa7)

**Fields**:

- [CONFD_ACCESS_CHK_DESCENDANT](#confd_access_chk_descendant-ded46d6c8368)
- [CONFD_ACCESS_CHK_FINAL](#confd_access_chk_final-1b3f46662a22)
- [CONFD_ACCESS_CHK_INTERMEDIATE](#confd_access_chk_intermediate-16c19b367168)
- [CONFD_ACCESS_OP_CREATE](#confd_access_op_create-01fc15e19623)
- [CONFD_ACCESS_OP_DELETE](#confd_access_op_delete-9389e655ae5f)
- [CONFD_ACCESS_OP_EXECUTE](#confd_access_op_execute-5d13c7409685)
- [CONFD_ACCESS_OP_READ](#confd_access_op_read-47bc3a748f25)
- [CONFD_ACCESS_OP_UPDATE](#confd_access_op_update-13b4eb006a7e)
- [CONFD_ACCESS_OP_WRITE](#confd_access_op_write-b4d4218cc906)
- [CONFD_CALL_ACTION](#confd_call_action-2d555fa376bc)
- [CONFD_CALL_ACTION_COMMAND](#confd_call_action_command-d3b8f1a124d3)
- [CONFD_CALL_ACTION_COMPLETION](#confd_call_action_completion-92760515dc8b)
- [CONFD_CALL_ACTION_SYNC](#confd_call_action_sync-b823d1986ed0)
- [CONFD_DATA_CB_CREATE](#confd_data_cb_create-34c80b4ea558)
- [CONFD_DATA_CB_DELETE](#confd_data_cb_delete-6e9d76f62a5f)
- [CONFD_DATA_CB_EXISTS_OPTIONAL](#confd_data_cb_exists_optional-d1348784153b)
- [CONFD_DATA_CB_FIND_NEXT](#confd_data_cb_find_next-b2bc7f473eb3)
- [CONFD_DATA_CB_FIND_NEXT_OBJECT](#confd_data_cb_find_next_object-787660c8bd7b)
- [CONFD_DATA_CB_GET_ATTRS](#confd_data_cb_get_attrs-9bee6e833400)
- [CONFD_DATA_CB_GET_CASE](#confd_data_cb_get_case-e0f8be0218b6)
- [CONFD_DATA_CB_GET_ELEM](#confd_data_cb_get_elem-01695ae45e9a)
- [CONFD_DATA_CB_GET_NEXT](#confd_data_cb_get_next-3431660bdb40)
- [CONFD_DATA_CB_GET_NEXT_OBJECT](#confd_data_cb_get_next_object-ee2d077cba95)
- [CONFD_DATA_CB_GET_OBJECT](#confd_data_cb_get_object-0d16865f063c)
- [CONFD_DATA_CB_MOVE_AFTER](#confd_data_cb_move_after-212636b2dee0)
- [CONFD_DATA_CB_NUM_INSTANCES](#confd_data_cb_num_instances-00a1118215a3)
- [CONFD_DATA_CB_SET_ATTR](#confd_data_cb_set_attr-b7cb9eb93d8f)
- [CONFD_DATA_CB_SET_CASE](#confd_data_cb_set_case-e68c2859431a)
- [CONFD_DATA_CB_SET_ELEM](#confd_data_cb_set_elem-d2e61e108fcc)
- [CONFD_DATA_CB_WRITE_ALL](#confd_data_cb_write_all-9509d955c9ef)
- [CONFD_DB_CB_REGISTER](#confd_db_cb_register-75da099d9e43)
- [CONFD_ERRTYPE_VALIDATION](#confd_errtype_validation-46e8f8fa9287)
- [CONFD_GET_CRYPTO_KEYS](#confd_get_crypto_keys-ad274b8eeea2)
- [CONFD_NANO_SERVICE_CB_CREATE](#confd_nano_service_cb_create-dfd1e209ebfa)
- [CONFD_NANO_SERVICE_CB_DELETE](#confd_nano_service_cb_delete-3795b389f849)
- [CONFD_PROTO_ABORT](#confd_proto_abort-013a7690bda9)
- [CONFD_PROTO_ABORT_ACTION](#confd_proto_abort_action-60e9389d2b5e)
- [CONFD_PROTO_ACTION_CB](#confd_proto_action_cb-6f66d5a2d026)
- [CONFD_PROTO_ACTIVATE_CHECKPOINT_RUNNING](#confd_proto_activate_checkpoint_running-725047d49835)
- [CONFD_PROTO_ADD_CHECKPOINT_RUNNING](#confd_proto_add_checkpoint_running-108a50ee80a2)
- [CONFD_PROTO_AUTH_CB](#confd_proto_auth_cb-8a121bbf196a)
- [CONFD_PROTO_AUTHORIZATION_CB](#confd_proto_authorization_cb-4737b015fa28)
- [CONFD_PROTO_CALLBACK](#confd_proto_callback-9fabcfa49f45)
- [CONFD_PROTO_CALLBACK_TIMEOUT](#confd_proto_callback_timeout-a83bf6dc51bc)
- [CONFD_PROTO_CANDIDATE_CHK_NOT_MODIFIED](#confd_proto_candidate_chk_not_modified-6beaaee3ef44)
- [CONFD_PROTO_CANDIDATE_COMMIT](#confd_proto_candidate_commit-cf7fc03744c1)
- [CONFD_PROTO_CANDIDATE_CONFIRMING_COMMIT](#confd_proto_candidate_confirming_commit-5b9b147751b7)
- [CONFD_PROTO_CANDIDATE_RESET](#confd_proto_candidate_reset-6fa7284d7fd7)
- [CONFD_PROTO_CANDIDATE_ROLLBACK_RUNNING](#confd_proto_candidate_rollback_running-a3325fd0fc63)
- [CONFD_PROTO_CANDIDATE_VALIDATE](#confd_proto_candidate_validate-7bd4d9db26ee)
- [CONFD_PROTO_CHK_CMD_ACCESS](#confd_proto_chk_cmd_access-c2ef9fda5959)
- [CONFD_PROTO_CHK_DATA_ACCESS](#confd_proto_chk_data_access-8bc7e32878b4)
- [CONFD_PROTO_CLOSE_TRANS](#confd_proto_close_trans-e497fa5ead55)
- [CONFD_PROTO_CLOSE_USESS](#confd_proto_close_usess-5a655e0ec2ae)
- [CONFD_PROTO_CLOSE_VALIDATE](#confd_proto_close_validate-08f6e4502ca0)
- [CONFD_PROTO_COMMIT](#confd_proto_commit-2330757f2d46)
- [CONFD_PROTO_COPY_RUNNING_TO_STARTUP](#confd_proto_copy_running_to_startup-dcf8ebfaa618)
- [CONFD_PROTO_DAEMON](#confd_proto_daemon-c94dc41e5ea0)
- [CONFD_PROTO_DAEMON_TIMEOUT](#confd_proto_daemon_timeout-03fbeef0dd6f)
- [CONFD_PROTO_DATA_CB](#confd_proto_data_cb-9db28e18025c)
- [CONFD_PROTO_DB_REPLY](#confd_proto_db_reply-365eb747ef2a)
- [CONFD_PROTO_DEBUG](#confd_proto_debug-3123f5f3c017)
- [CONFD_PROTO_DEL_CHECKPOINT_RUNNING](#confd_proto_del_checkpoint_running-cf01dc4b6219)
- [CONFD_PROTO_DELETE_CONFIG](#confd_proto_delete_config-2f8cbf407473)
- [CONFD_PROTO_ERROR](#confd_proto_error-f7457a928644)
- [CONFD_PROTO_ERROR_CB](#confd_proto_error_cb-74cbbc9b0ba9)
- [CONFD_PROTO_ID](#confd_proto_id-b054c23b587e)
- [CONFD_PROTO_INTERRUPT](#confd_proto_interrupt-22441dbe3f74)
- [CONFD_PROTO_LOCK](#confd_proto_lock-1fe2aec94fcb)
- [CONFD_PROTO_LOCK_PARTIAL](#confd_proto_lock_partial-8217bf732b20)
- [CONFD_PROTO_NANO_SERVICE_CB](#confd_proto_nano_service_cb-ccaa01ddf1d1)
- [CONFD_PROTO_NEW_ACTION](#confd_proto_new_action-306a1d2fbd9d)
- [CONFD_PROTO_NEW_TRANS](#confd_proto_new_trans-d7cf1ee8565e)
- [CONFD_PROTO_NEW_USESS](#confd_proto_new_usess-18637d13985b)
- [CONFD_PROTO_NEW_VALIDATE](#confd_proto_new_validate-55821ed99b07)
- [CONFD_PROTO_NOTIF_FLUSH](#confd_proto_notif_flush-0231543cdc46)
- [CONFD_PROTO_NOTIF_GET_LOG_TIMES](#confd_proto_notif_get_log_times-d9d1b619e4d5)
- [CONFD_PROTO_NOTIF_RECV_SNMP](#confd_proto_notif_recv_snmp-5778f7039640)
- [CONFD_PROTO_NOTIF_REPLAY](#confd_proto_notif_replay-e177b3db63f7)
- [CONFD_PROTO_NOTIF_REPLAY_COMPLETE](#confd_proto_notif_replay_complete-2b38bea2eab6)
- [CONFD_PROTO_NOTIF_REPLAY_FAILED](#confd_proto_notif_replay_failed-de28b78d1714)
- [CONFD_PROTO_NOTIF_SEND](#confd_proto_notif_send-defacef41f29)
- [CONFD_PROTO_NOTIF_SEND_SNMP](#confd_proto_notif_send_snmp-a69f61f0ad6c)
- [CONFD_PROTO_NOTIF_SNMP_INFORM_CB](#confd_proto_notif_snmp_inform_cb-4fdb1cf35ebc)
- [CONFD_PROTO_NOTIF_SNMP_INFORM_RESULT](#confd_proto_notif_snmp_inform_result-dc45dd41898b)
- [CONFD_PROTO_NOTIF_SNMP_INFORM_TARGETS](#confd_proto_notif_snmp_inform_targets-02abeab9f2d4)
- [CONFD_PROTO_NOTIF_STREAM_CB](#confd_proto_notif_stream_cb-466a4bb616f6)
- [CONFD_PROTO_NOTIF_SUB_CB](#confd_proto_notif_sub_cb-faf87306cc06)
- [CONFD_PROTO_NOTIF_SUB_SNMP_CB](#confd_proto_notif_sub_snmp_cb-d09a0abaa466)
- [CONFD_PROTO_OLD_USESS](#confd_proto_old_usess-9a02b5bb068e)
- [CONFD_PROTO_PREPARE](#confd_proto_prepare-a32a930c1f10)
- [CONFD_PROTO_PUSH_ON_CHANGE](#confd_proto_push_on_change-8ab55f01befe)
- [CONFD_PROTO_PUSH_ON_CHANGE_CB](#confd_proto_push_on_change_cb-a6f133a4259a)
- [CONFD_PROTO_REGISTER](#confd_proto_register-a4f11dbedd2d)
- [CONFD_PROTO_REGISTER_DONE](#confd_proto_register_done-fe5e7aa7f187)
- [CONFD_PROTO_REGISTER_NANO](#confd_proto_register_nano-74fdf4906324)
- [CONFD_PROTO_REGISTER_RANGE](#confd_proto_register_range-7e14f78c772e)
- [CONFD_PROTO_REQUEST](#confd_proto_request-93e8c74abb70)
- [CONFD_PROTO_RUNNING_CHK_NOT_MODIFIED](#confd_proto_running_chk_not_modified-d9d1a2600f4f)
- [CONFD_PROTO_SERVICE_CB](#confd_proto_service_cb-945c3071bb69)
- [CONFD_PROTO_SUBSCRIBE_ON_CHANGE](#confd_proto_subscribe_on_change-91a69226bbf7)
- [CONFD_PROTO_TRANS_LOCK](#confd_proto_trans_lock-46eb78055828)
- [CONFD_PROTO_TRANS_UNLOCK](#confd_proto_trans_unlock-295334ec5c88)
- [CONFD_PROTO_UNLOCK](#confd_proto_unlock-b763f38bad7c)
- [CONFD_PROTO_UNLOCK_PARTIAL](#confd_proto_unlock_partial-2de330055a15)
- [CONFD_PROTO_UNSUBSCRIBE_ON_CHANGE](#confd_proto_unsubscribe_on_change-7d82e5f7aec8)
- [CONFD_PROTO_USERTYPE_CB](#confd_proto_usertype_cb-e384f682ad17)
- [CONFD_PROTO_VALIDATE_CB](#confd_proto_validate_cb-6fcaa6d0b640)
- [CONFD_PROTO_WARNING](#confd_proto_warning-135b1e051958)
- [CONFD_PROTO_WORKER](#confd_proto_worker-dfb608f16ae5)
- [CONFD_PROTO_WRITE_START](#confd_proto_write_start-4c85e9073c94)
- [CONFD_SERVICE_CB_CREATE](#confd_service_cb_create-3cc7b8b20ade)
- [CONFD_SERVICE_CB_POST_MODIFICATION](#confd_service_cb_post_modification-db2139ff03cc)
- [CONFD_SERVICE_CB_PRE_MODIFICATION](#confd_service_cb_pre_modification-c6a002fdf05a)
- [CONFD_TRANS_CB_REGISTER](#confd_trans_cb_register-91bd1f328cf4)
- [CONFD_TYPECMD_CHECK_VAL](#confd_typecmd_check_val-2a618d16a3b1)
- [CONFD_TYPECMD_CLEAN_SAVED](#confd_typecmd_clean_saved-047615a0f7ed)
- [CONFD_TYPECMD_CLEAN_STATE](#confd_typecmd_clean_state-910b21e7abb9)
- [CONFD_TYPECMD_GET_POINTS](#confd_typecmd_get_points-6c1d44bcb303)
- [CONFD_TYPECMD_INIT](#confd_typecmd_init-c45992c6a930)
- [CONFD_TYPECMD_LOAD](#confd_typecmd_load-72aa0b2b7a9b)
- [CONFD_TYPECMD_RESTORE_SAVED](#confd_typecmd_restore_saved-8587fcc90b5a)
- [CONFD_TYPECMD_SAVE_STATE](#confd_typecmd_save_state-b2dc5a267ef3)
- [CONFD_TYPECMD_STR2VAL](#confd_typecmd_str2val-8c4d3374e985)
- [CONFD_TYPECMD_VAL2STR](#confd_typecmd_val2str-b8b539f1fcd0)
- [CONFD_VALIDATE_VALUE](#confd_validate_value-7faf9cef217f)
- [MASK_ACT_ABORT](#mask_act_abort-44e2cf9b2b5b)
- [MASK_ACT_ACTION](#mask_act_action-c8548dadc2b9)
- [MASK_ACT_COMMAND](#mask_act_command-90e82531a8f5)
- [MASK_ACT_COMPLETION](#mask_act_completion-498a09910c15)
- [MASK_ACT_INIT](#mask_act_init-d9782e86d5f2)
- [MASK_CHK_CMD_ACCESS](#mask_chk_cmd_access-71378bbe979d)
- [MASK_CHK_DATA_ACCESS](#mask_chk_data_access-3341923b3567)
- [MASK_DATA_CREATE](#mask_data_create-cc3ac546f6ba)
- [MASK_DATA_EXISTS_OPTIONAL](#mask_data_exists_optional-a626473fc985)
- [MASK_DATA_FIND_NEXT](#mask_data_find_next-642731e9bc7a)
- [MASK_DATA_FIND_NEXT_OBJECT](#mask_data_find_next_object-c9e2f7fa2d48)
- [MASK_DATA_GET_ATTRS](#mask_data_get_attrs-6b951df12741)
- [MASK_DATA_GET_CASE](#mask_data_get_case-04546f41227c)
- [MASK_DATA_GET_ELEM](#mask_data_get_elem-1c78fd687360)
- [MASK_DATA_GET_NEXT](#mask_data_get_next-3250d6ec3ed4)
- [MASK_DATA_GET_NEXT_OBJECT](#mask_data_get_next_object-63a6092120ce)
- [MASK_DATA_GET_OBJECT](#mask_data_get_object-3c9ce4c40cfa)
- [MASK_DATA_MOVE_AFTER](#mask_data_move_after-2fee0221ec34)
- [MASK_DATA_NUM_INSTANCES](#mask_data_num_instances-5052a7fd1aa8)
- [MASK_DATA_REMOVE](#mask_data_remove-1cec18b92301)
- [MASK_DATA_SET_ATTR](#mask_data_set_attr-37d0d0c53e02)
- [MASK_DATA_SET_CASE](#mask_data_set_case-fad0652427be)
- [MASK_DATA_SET_ELEM](#mask_data_set_elem-a8be95e890e7)
- [MASK_DATA_WANT_FILTER](#mask_data_want_filter-a66bfecb9372)
- [MASK_DATA_WRITE_ALL](#mask_data_write_all-43e24460a23f)
- [MASK_DB_ACTIVATE_CHECKPOINT_RUNNING](#mask_db_activate_checkpoint_running-129efdc05876)
- [MASK_DB_ADD_CHECKPOINT_RUNNING](#mask_db_add_checkpoint_running-c36d04f3911f)
- [MASK_DB_CANDIDATE_CHK_NOT_MODIFIED](#mask_db_candidate_chk_not_modified-66e78060591f)
- [MASK_DB_CANDIDATE_COMMIT](#mask_db_candidate_commit-327bfb1e14d6)
- [MASK_DB_CANDIDATE_CONFIRMING_COMMIT](#mask_db_candidate_confirming_commit-41e11d414ee2)
- [MASK_DB_CANDIDATE_RESET](#mask_db_candidate_reset-b3027411317f)
- [MASK_DB_CANDIDATE_ROLLBACK_RUNNING](#mask_db_candidate_rollback_running-4b02fd5a965f)
- [MASK_DB_CANDIDATE_VALIDATE](#mask_db_candidate_validate-17ca2e4bbca9)
- [MASK_DB_COPY_RUNNING_TO_STARTUP](#mask_db_copy_running_to_startup-6561fae3e0b0)
- [MASK_DB_DEL_CHECKPOINT_RUNNING](#mask_db_del_checkpoint_running-dba0677f87f3)
- [MASK_DB_DELETE_CONFIG](#mask_db_delete_config-47ea8d53e48f)
- [MASK_DB_LOCK](#mask_db_lock-74c62539aadf)
- [MASK_DB_LOCK_PARTIAL](#mask_db_lock_partial-31c5b86310e1)
- [MASK_DB_RUNNING_CHK_NOT_MODIFIED](#mask_db_running_chk_not_modified-62222a072b54)
- [MASK_DB_UNLOCK](#mask_db_unlock-beabdd1f0301)
- [MASK_DB_UNLOCK_PARTIAL](#mask_db_unlock_partial-e216cbdbee73)
- [MASK_NANO_SERVICE_CREATE](#mask_nano_service_create-99a391453384)
- [MASK_NANO_SERVICE_DELETE](#mask_nano_service_delete-60fd5e22274e)
- [MASK_NOTIF_GET_LOG_TIMES](#mask_notif_get_log_times-30ea4c7f37fa)
- [MASK_NOTIF_REPLAY](#mask_notif_replay-65e3e9c96611)
- [MASK_NOTIF_SNMP_INFORM_RESULT](#mask_notif_snmp_inform_result-02d170a743a9)
- [MASK_NOTIF_SNMP_INFORM_TARGETS](#mask_notif_snmp_inform_targets-ff2eb0e856df)
- [MASK_SERVICE_CREATE](#mask_service_create-a74311b1cf3d)
- [MASK_SERVICE_POST_MODIFICATION](#mask_service_post_modification-979461ccbfd5)
- [MASK_SERVICE_PRE_MODIFICATION](#mask_service_pre_modification-13da7cc79aee)
- [MASK_TR_ABORT](#mask_tr_abort-395896663f95)
- [MASK_TR_COMMIT](#mask_tr_commit-c40ec51a9520)
- [MASK_TR_FINISH](#mask_tr_finish-3a7ded7c8319)
- [MASK_TR_INIT](#mask_tr_init-20a3bbde8951)
- [MASK_TR_INTERRUPT](#mask_tr_interrupt-a133bbe1705f)
- [MASK_TR_PREPARE](#mask_tr_prepare-2a44ac87ede4)
- [MASK_TR_TRANS_LOCK](#mask_tr_trans_lock-b13781a99429)
- [MASK_TR_TRANS_UNLOCK](#mask_tr_trans_unlock-cd657f481f65)
- [MASK_TR_WRITE_START](#mask_tr_write_start-53e1a35b2e04)

## Constructors

### DpProto() <a href="#dpproto-13681c4c4fa7" id="dpproto-13681c4c4fa7"></a>

```java
public DpProto()
```


## Fields

### CONFD_ACCESS_CHK_DESCENDANT <a href="#confd_access_chk_descendant-ded46d6c8368" id="confd_access_chk_descendant-ded46d6c8368"></a>

```java
public static final int CONFD_ACCESS_CHK_DESCENDANT = 1024;
```

### CONFD_ACCESS_CHK_FINAL <a href="#confd_access_chk_final-1b3f46662a22" id="confd_access_chk_final-1b3f46662a22"></a>

```java
public static final int CONFD_ACCESS_CHK_FINAL = 512;
```

### CONFD_ACCESS_CHK_INTERMEDIATE <a href="#confd_access_chk_intermediate-16c19b367168" id="confd_access_chk_intermediate-16c19b367168"></a>

```java
public static final int CONFD_ACCESS_CHK_INTERMEDIATE = 256;
```

### CONFD_ACCESS_OP_CREATE <a href="#confd_access_op_create-01fc15e19623" id="confd_access_op_create-01fc15e19623"></a>

```java
public static final int CONFD_ACCESS_OP_CREATE = 4;
```

### CONFD_ACCESS_OP_DELETE <a href="#confd_access_op_delete-9389e655ae5f" id="confd_access_op_delete-9389e655ae5f"></a>

```java
public static final int CONFD_ACCESS_OP_DELETE = 16;
```

### CONFD_ACCESS_OP_EXECUTE <a href="#confd_access_op_execute-5d13c7409685" id="confd_access_op_execute-5d13c7409685"></a>

```java
public static final int CONFD_ACCESS_OP_EXECUTE = 2;
```

### CONFD_ACCESS_OP_READ <a href="#confd_access_op_read-47bc3a748f25" id="confd_access_op_read-47bc3a748f25"></a>

```java
public static final int CONFD_ACCESS_OP_READ = 1;
```

### CONFD_ACCESS_OP_UPDATE <a href="#confd_access_op_update-13b4eb006a7e" id="confd_access_op_update-13b4eb006a7e"></a>

```java
public static final int CONFD_ACCESS_OP_UPDATE = 8;
```

### CONFD_ACCESS_OP_WRITE <a href="#confd_access_op_write-b4d4218cc906" id="confd_access_op_write-b4d4218cc906"></a>

```java
public static final int CONFD_ACCESS_OP_WRITE = 32;
```

### CONFD_CALL_ACTION <a href="#confd_call_action-2d555fa376bc" id="confd_call_action-2d555fa376bc"></a>

```java
public static final int CONFD_CALL_ACTION = 152;
```

### CONFD_CALL_ACTION_COMMAND <a href="#confd_call_action_command-d3b8f1a124d3" id="confd_call_action_command-d3b8f1a124d3"></a>

```java
public static final int CONFD_CALL_ACTION_COMMAND = 153;
```

### CONFD_CALL_ACTION_COMPLETION <a href="#confd_call_action_completion-92760515dc8b" id="confd_call_action_completion-92760515dc8b"></a>

```java
public static final int CONFD_CALL_ACTION_COMPLETION = 154;
```

### CONFD_CALL_ACTION_SYNC <a href="#confd_call_action_sync-b823d1986ed0" id="confd_call_action_sync-b823d1986ed0"></a>

```java
public static final int CONFD_CALL_ACTION_SYNC = 155;
```

### CONFD_DATA_CB_CREATE <a href="#confd_data_cb_create-34c80b4ea558" id="confd_data_cb_create-34c80b4ea558"></a>

```java
public static final int CONFD_DATA_CB_CREATE = 105;
```

### CONFD_DATA_CB_DELETE <a href="#confd_data_cb_delete-6e9d76f62a5f" id="confd_data_cb_delete-6e9d76f62a5f"></a>

```java
public static final int CONFD_DATA_CB_DELETE = 106;
```

### CONFD_DATA_CB_EXISTS_OPTIONAL <a href="#confd_data_cb_exists_optional-d1348784153b" id="confd_data_cb_exists_optional-d1348784153b"></a>

```java
public static final int CONFD_DATA_CB_EXISTS_OPTIONAL = 107;
```

### CONFD_DATA_CB_FIND_NEXT <a href="#confd_data_cb_find_next-b2bc7f473eb3" id="confd_data_cb_find_next-b2bc7f473eb3"></a>

```java
public static final int CONFD_DATA_CB_FIND_NEXT = 116;
```

### CONFD_DATA_CB_FIND_NEXT_OBJECT <a href="#confd_data_cb_find_next_object-787660c8bd7b" id="confd_data_cb_find_next_object-787660c8bd7b"></a>

```java
public static final int CONFD_DATA_CB_FIND_NEXT_OBJECT = 117;
```

### CONFD_DATA_CB_GET_ATTRS <a href="#confd_data_cb_get_attrs-9bee6e833400" id="confd_data_cb_get_attrs-9bee6e833400"></a>

```java
public static final int CONFD_DATA_CB_GET_ATTRS = 112;
```

### CONFD_DATA_CB_GET_CASE <a href="#confd_data_cb_get_case-e0f8be0218b6" id="confd_data_cb_get_case-e0f8be0218b6"></a>

```java
public static final int CONFD_DATA_CB_GET_CASE = 110;
```

### CONFD_DATA_CB_GET_ELEM <a href="#confd_data_cb_get_elem-01695ae45e9a" id="confd_data_cb_get_elem-01695ae45e9a"></a>

```java
public static final int CONFD_DATA_CB_GET_ELEM = 102;
```

### CONFD_DATA_CB_GET_NEXT <a href="#confd_data_cb_get_next-3431660bdb40" id="confd_data_cb_get_next-3431660bdb40"></a>

```java
public static final int CONFD_DATA_CB_GET_NEXT = 101;
```

### CONFD_DATA_CB_GET_NEXT_OBJECT <a href="#confd_data_cb_get_next_object-ee2d077cba95" id="confd_data_cb_get_next_object-ee2d077cba95"></a>

```java
public static final int CONFD_DATA_CB_GET_NEXT_OBJECT = 109;
```

### CONFD_DATA_CB_GET_OBJECT <a href="#confd_data_cb_get_object-0d16865f063c" id="confd_data_cb_get_object-0d16865f063c"></a>

```java
public static final int CONFD_DATA_CB_GET_OBJECT = 103;
```

### CONFD_DATA_CB_MOVE_AFTER <a href="#confd_data_cb_move_after-212636b2dee0" id="confd_data_cb_move_after-212636b2dee0"></a>

```java
public static final int CONFD_DATA_CB_MOVE_AFTER = 114;
```

### CONFD_DATA_CB_NUM_INSTANCES <a href="#confd_data_cb_num_instances-00a1118215a3" id="confd_data_cb_num_instances-00a1118215a3"></a>

```java
public static final int CONFD_DATA_CB_NUM_INSTANCES = 108;
```

### CONFD_DATA_CB_SET_ATTR <a href="#confd_data_cb_set_attr-b7cb9eb93d8f" id="confd_data_cb_set_attr-b7cb9eb93d8f"></a>

```java
public static final int CONFD_DATA_CB_SET_ATTR = 113;
```

### CONFD_DATA_CB_SET_CASE <a href="#confd_data_cb_set_case-e68c2859431a" id="confd_data_cb_set_case-e68c2859431a"></a>

```java
public static final int CONFD_DATA_CB_SET_CASE = 111;
```

### CONFD_DATA_CB_SET_ELEM <a href="#confd_data_cb_set_elem-d2e61e108fcc" id="confd_data_cb_set_elem-d2e61e108fcc"></a>

```java
public static final int CONFD_DATA_CB_SET_ELEM = 104;
```

### CONFD_DATA_CB_WRITE_ALL <a href="#confd_data_cb_write_all-9509d955c9ef" id="confd_data_cb_write_all-9509d955c9ef"></a>

```java
public static final int CONFD_DATA_CB_WRITE_ALL = 115;
```

### CONFD_DB_CB_REGISTER <a href="#confd_db_cb_register-75da099d9e43" id="confd_db_cb_register-75da099d9e43"></a>

```java
public static final int CONFD_DB_CB_REGISTER = 10;
```

### CONFD_ERRTYPE_VALIDATION <a href="#confd_errtype_validation-46e8f8fa9287" id="confd_errtype_validation-46e8f8fa9287"></a>

```java
public static final int CONFD_ERRTYPE_VALIDATION = 1;
```

### CONFD_GET_CRYPTO_KEYS <a href="#confd_get_crypto_keys-ad274b8eeea2" id="confd_get_crypto_keys-ad274b8eeea2"></a>

```java
public static final int CONFD_GET_CRYPTO_KEYS = 8;
```

### CONFD_NANO_SERVICE_CB_CREATE <a href="#confd_nano_service_cb_create-dfd1e209ebfa" id="confd_nano_service_cb_create-dfd1e209ebfa"></a>

```java
public static final int CONFD_NANO_SERVICE_CB_CREATE = 210;
```

### CONFD_NANO_SERVICE_CB_DELETE <a href="#confd_nano_service_cb_delete-3795b389f849" id="confd_nano_service_cb_delete-3795b389f849"></a>

```java
public static final int CONFD_NANO_SERVICE_CB_DELETE = 211;
```

### CONFD_PROTO_ABORT <a href="#confd_proto_abort-013a7690bda9" id="confd_proto_abort-013a7690bda9"></a>

```java
public static final int CONFD_PROTO_ABORT = 25;
```

### CONFD_PROTO_ABORT_ACTION <a href="#confd_proto_abort_action-60e9389d2b5e" id="confd_proto_abort_action-60e9389d2b5e"></a>

```java
public static final int CONFD_PROTO_ABORT_ACTION = 151;
```

### CONFD_PROTO_ACTION_CB <a href="#confd_proto_action_cb-6f66d5a2d026" id="confd_proto_action_cb-6f66d5a2d026"></a>

```java
public static final int CONFD_PROTO_ACTION_CB = 132;
```

### CONFD_PROTO_ACTIVATE_CHECKPOINT_RUNNING <a href="#confd_proto_activate_checkpoint_running-725047d49835" id="confd_proto_activate_checkpoint_running-725047d49835"></a>

```java
public static final int CONFD_PROTO_ACTIVATE_CHECKPOINT_RUNNING = 71;
```

### CONFD_PROTO_ADD_CHECKPOINT_RUNNING <a href="#confd_proto_add_checkpoint_running-108a50ee80a2" id="confd_proto_add_checkpoint_running-108a50ee80a2"></a>

```java
public static final int CONFD_PROTO_ADD_CHECKPOINT_RUNNING = 69;
```

### CONFD_PROTO_AUTH_CB <a href="#confd_proto_auth_cb-8a121bbf196a" id="confd_proto_auth_cb-8a121bbf196a"></a>

```java
public static final int CONFD_PROTO_AUTH_CB = 181;
```

### CONFD_PROTO_AUTHORIZATION_CB <a href="#confd_proto_authorization_cb-4737b015fa28" id="confd_proto_authorization_cb-4737b015fa28"></a>

```java
public static final int CONFD_PROTO_AUTHORIZATION_CB = 137;
```

### CONFD_PROTO_CALLBACK <a href="#confd_proto_callback-9fabcfa49f45" id="confd_proto_callback-9fabcfa49f45"></a>

```java
public static final int CONFD_PROTO_CALLBACK = 28;
```

### CONFD_PROTO_CALLBACK_TIMEOUT <a href="#confd_proto_callback_timeout-a83bf6dc51bc" id="confd_proto_callback_timeout-a83bf6dc51bc"></a>

```java
public static final int CONFD_PROTO_CALLBACK_TIMEOUT = 29;
```

### CONFD_PROTO_CANDIDATE_CHK_NOT_MODIFIED <a href="#confd_proto_candidate_chk_not_modified-6beaaee3ef44" id="confd_proto_candidate_chk_not_modified-6beaaee3ef44"></a>

```java
public static final int CONFD_PROTO_CANDIDATE_CHK_NOT_MODIFIED = 65;
```

### CONFD_PROTO_CANDIDATE_COMMIT <a href="#confd_proto_candidate_commit-cf7fc03744c1" id="confd_proto_candidate_commit-cf7fc03744c1"></a>

```java
public static final int CONFD_PROTO_CANDIDATE_COMMIT = 62;
```

### CONFD_PROTO_CANDIDATE_CONFIRMING_COMMIT <a href="#confd_proto_candidate_confirming_commit-5b9b147751b7" id="confd_proto_candidate_confirming_commit-5b9b147751b7"></a>

```java
public static final int CONFD_PROTO_CANDIDATE_CONFIRMING_COMMIT = 60;
```

### CONFD_PROTO_CANDIDATE_RESET <a href="#confd_proto_candidate_reset-6fa7284d7fd7" id="confd_proto_candidate_reset-6fa7284d7fd7"></a>

```java
public static final int CONFD_PROTO_CANDIDATE_RESET = 63;
```

### CONFD_PROTO_CANDIDATE_ROLLBACK_RUNNING <a href="#confd_proto_candidate_rollback_running-a3325fd0fc63" id="confd_proto_candidate_rollback_running-a3325fd0fc63"></a>

```java
public static final int CONFD_PROTO_CANDIDATE_ROLLBACK_RUNNING = 61;
```

### CONFD_PROTO_CANDIDATE_VALIDATE <a href="#confd_proto_candidate_validate-7bd4d9db26ee" id="confd_proto_candidate_validate-7bd4d9db26ee"></a>

```java
public static final int CONFD_PROTO_CANDIDATE_VALIDATE = 64;
```

### CONFD_PROTO_CHK_CMD_ACCESS <a href="#confd_proto_chk_cmd_access-c2ef9fda5959" id="confd_proto_chk_cmd_access-c2ef9fda5959"></a>

```java
public static final int CONFD_PROTO_CHK_CMD_ACCESS = 190;
```

### CONFD_PROTO_CHK_DATA_ACCESS <a href="#confd_proto_chk_data_access-8bc7e32878b4" id="confd_proto_chk_data_access-8bc7e32878b4"></a>

```java
public static final int CONFD_PROTO_CHK_DATA_ACCESS = 191;
```

### CONFD_PROTO_CLOSE_TRANS <a href="#confd_proto_close_trans-e497fa5ead55" id="confd_proto_close_trans-e497fa5ead55"></a>

```java
public static final int CONFD_PROTO_CLOSE_TRANS = 27;
```

### CONFD_PROTO_CLOSE_USESS <a href="#confd_proto_close_usess-5a655e0ec2ae" id="confd_proto_close_usess-5a655e0ec2ae"></a>

```java
public static final int CONFD_PROTO_CLOSE_USESS = 41;
```

### CONFD_PROTO_CLOSE_VALIDATE <a href="#confd_proto_close_validate-08f6e4502ca0" id="confd_proto_close_validate-08f6e4502ca0"></a>

```java
public static final int CONFD_PROTO_CLOSE_VALIDATE = 146;
```

### CONFD_PROTO_COMMIT <a href="#confd_proto_commit-2330757f2d46" id="confd_proto_commit-2330757f2d46"></a>

```java
public static final int CONFD_PROTO_COMMIT = 26;
```

### CONFD_PROTO_COPY_RUNNING_TO_STARTUP <a href="#confd_proto_copy_running_to_startup-dcf8ebfaa618" id="confd_proto_copy_running_to_startup-dcf8ebfaa618"></a>

```java
public static final int CONFD_PROTO_COPY_RUNNING_TO_STARTUP = 72;
```

### CONFD_PROTO_DAEMON <a href="#confd_proto_daemon-c94dc41e5ea0" id="confd_proto_daemon-c94dc41e5ea0"></a>

```java
public static final int CONFD_PROTO_DAEMON = 1;
```

### CONFD_PROTO_DAEMON_TIMEOUT <a href="#confd_proto_daemon_timeout-03fbeef0dd6f" id="confd_proto_daemon_timeout-03fbeef0dd6f"></a>

```java
public static final int CONFD_PROTO_DAEMON_TIMEOUT = 195;
```

### CONFD_PROTO_DATA_CB <a href="#confd_proto_data_cb-9db28e18025c" id="confd_proto_data_cb-9db28e18025c"></a>

```java
public static final int CONFD_PROTO_DATA_CB = 130;
```

### CONFD_PROTO_DB_REPLY <a href="#confd_proto_db_reply-365eb747ef2a" id="confd_proto_db_reply-365eb747ef2a"></a>

```java
public static final int CONFD_PROTO_DB_REPLY = 90;
```

### CONFD_PROTO_DEBUG <a href="#confd_proto_debug-3123f5f3c017" id="confd_proto_debug-3123f5f3c017"></a>

```java
public static final int CONFD_PROTO_DEBUG = 5;
```

### CONFD_PROTO_DEL_CHECKPOINT_RUNNING <a href="#confd_proto_del_checkpoint_running-cf01dc4b6219" id="confd_proto_del_checkpoint_running-cf01dc4b6219"></a>

```java
public static final int CONFD_PROTO_DEL_CHECKPOINT_RUNNING = 70;
```

### CONFD_PROTO_DELETE_CONFIG <a href="#confd_proto_delete_config-2f8cbf407473" id="confd_proto_delete_config-2f8cbf407473"></a>

```java
public static final int CONFD_PROTO_DELETE_CONFIG = 68;
```

### CONFD_PROTO_ERROR <a href="#confd_proto_error-f7457a928644" id="confd_proto_error-f7457a928644"></a>

```java
public static final int CONFD_PROTO_ERROR = 6;
```

### CONFD_PROTO_ERROR_CB <a href="#confd_proto_error_cb-74cbbc9b0ba9" id="confd_proto_error_cb-74cbbc9b0ba9"></a>

```java
public static final int CONFD_PROTO_ERROR_CB = 180;
```

### CONFD_PROTO_ID <a href="#confd_proto_id-b054c23b587e" id="confd_proto_id-b054c23b587e"></a>

```java
public static final int CONFD_PROTO_ID = 0;
```

### CONFD_PROTO_INTERRUPT <a href="#confd_proto_interrupt-22441dbe3f74" id="confd_proto_interrupt-22441dbe3f74"></a>

```java
public static final int CONFD_PROTO_INTERRUPT = 30;
```

### CONFD_PROTO_LOCK <a href="#confd_proto_lock-1fe2aec94fcb" id="confd_proto_lock-1fe2aec94fcb"></a>

```java
public static final int CONFD_PROTO_LOCK = 66;
```

### CONFD_PROTO_LOCK_PARTIAL <a href="#confd_proto_lock_partial-8217bf732b20" id="confd_proto_lock_partial-8217bf732b20"></a>

```java
public static final int CONFD_PROTO_LOCK_PARTIAL = 73;
```

### CONFD_PROTO_NANO_SERVICE_CB <a href="#confd_proto_nano_service_cb-ccaa01ddf1d1" id="confd_proto_nano_service_cb-ccaa01ddf1d1"></a>

```java
public static final int CONFD_PROTO_NANO_SERVICE_CB = 140;
```

### CONFD_PROTO_NEW_ACTION <a href="#confd_proto_new_action-306a1d2fbd9d" id="confd_proto_new_action-306a1d2fbd9d"></a>

```java
public static final int CONFD_PROTO_NEW_ACTION = 150;
```

### CONFD_PROTO_NEW_TRANS <a href="#confd_proto_new_trans-d7cf1ee8565e" id="confd_proto_new_trans-d7cf1ee8565e"></a>

```java
public static final int CONFD_PROTO_NEW_TRANS = 20;
```

### CONFD_PROTO_NEW_USESS <a href="#confd_proto_new_usess-18637d13985b" id="confd_proto_new_usess-18637d13985b"></a>

```java
public static final int CONFD_PROTO_NEW_USESS = 40;
```

### CONFD_PROTO_NEW_VALIDATE <a href="#confd_proto_new_validate-55821ed99b07" id="confd_proto_new_validate-55821ed99b07"></a>

```java
public static final int CONFD_PROTO_NEW_VALIDATE = 145;
```

### CONFD_PROTO_NOTIF_FLUSH <a href="#confd_proto_notif_flush-0231543cdc46" id="confd_proto_notif_flush-0231543cdc46"></a>

```java
public static final int CONFD_PROTO_NOTIF_FLUSH = 174;
```

### CONFD_PROTO_NOTIF_GET_LOG_TIMES <a href="#confd_proto_notif_get_log_times-d9d1b619e4d5" id="confd_proto_notif_get_log_times-d9d1b619e4d5"></a>

```java
public static final int CONFD_PROTO_NOTIF_GET_LOG_TIMES = 160;
```

### CONFD_PROTO_NOTIF_RECV_SNMP <a href="#confd_proto_notif_recv_snmp-5778f7039640" id="confd_proto_notif_recv_snmp-5778f7039640"></a>

```java
public static final int CONFD_PROTO_NOTIF_RECV_SNMP = 162;
```

### CONFD_PROTO_NOTIF_REPLAY <a href="#confd_proto_notif_replay-e177b3db63f7" id="confd_proto_notif_replay-e177b3db63f7"></a>

```java
public static final int CONFD_PROTO_NOTIF_REPLAY = 161;
```

### CONFD_PROTO_NOTIF_REPLAY_COMPLETE <a href="#confd_proto_notif_replay_complete-2b38bea2eab6" id="confd_proto_notif_replay_complete-2b38bea2eab6"></a>

```java
public static final int CONFD_PROTO_NOTIF_REPLAY_COMPLETE = 171;
```

### CONFD_PROTO_NOTIF_REPLAY_FAILED <a href="#confd_proto_notif_replay_failed-de28b78d1714" id="confd_proto_notif_replay_failed-de28b78d1714"></a>

```java
public static final int CONFD_PROTO_NOTIF_REPLAY_FAILED = 172;
```

### CONFD_PROTO_NOTIF_SEND <a href="#confd_proto_notif_send-defacef41f29" id="confd_proto_notif_send-defacef41f29"></a>

```java
public static final int CONFD_PROTO_NOTIF_SEND = 170;
```

### CONFD_PROTO_NOTIF_SEND_SNMP <a href="#confd_proto_notif_send_snmp-a69f61f0ad6c" id="confd_proto_notif_send_snmp-a69f61f0ad6c"></a>

```java
public static final int CONFD_PROTO_NOTIF_SEND_SNMP = 173;
```

### CONFD_PROTO_NOTIF_SNMP_INFORM_CB <a href="#confd_proto_notif_snmp_inform_cb-4fdb1cf35ebc" id="confd_proto_notif_snmp_inform_cb-4fdb1cf35ebc"></a>

```java
public static final int CONFD_PROTO_NOTIF_SNMP_INFORM_CB = 136;
```

### CONFD_PROTO_NOTIF_SNMP_INFORM_RESULT <a href="#confd_proto_notif_snmp_inform_result-dc45dd41898b" id="confd_proto_notif_snmp_inform_result-dc45dd41898b"></a>

```java
public static final int CONFD_PROTO_NOTIF_SNMP_INFORM_RESULT = 164;
```

### CONFD_PROTO_NOTIF_SNMP_INFORM_TARGETS <a href="#confd_proto_notif_snmp_inform_targets-02abeab9f2d4" id="confd_proto_notif_snmp_inform_targets-02abeab9f2d4"></a>

```java
public static final int CONFD_PROTO_NOTIF_SNMP_INFORM_TARGETS = 163;
```

### CONFD_PROTO_NOTIF_STREAM_CB <a href="#confd_proto_notif_stream_cb-466a4bb616f6" id="confd_proto_notif_stream_cb-466a4bb616f6"></a>

```java
public static final int CONFD_PROTO_NOTIF_STREAM_CB = 133;
```

### CONFD_PROTO_NOTIF_SUB_CB <a href="#confd_proto_notif_sub_cb-faf87306cc06" id="confd_proto_notif_sub_cb-faf87306cc06"></a>

```java
public static final int CONFD_PROTO_NOTIF_SUB_CB = 134;
```

### CONFD_PROTO_NOTIF_SUB_SNMP_CB <a href="#confd_proto_notif_sub_snmp_cb-d09a0abaa466" id="confd_proto_notif_sub_snmp_cb-d09a0abaa466"></a>

```java
public static final int CONFD_PROTO_NOTIF_SUB_SNMP_CB = 135;
```

### CONFD_PROTO_OLD_USESS <a href="#confd_proto_old_usess-9a02b5bb068e" id="confd_proto_old_usess-9a02b5bb068e"></a>

```java
public static final int CONFD_PROTO_OLD_USESS = 12;
```

### CONFD_PROTO_PREPARE <a href="#confd_proto_prepare-a32a930c1f10" id="confd_proto_prepare-a32a930c1f10"></a>

```java
public static final int CONFD_PROTO_PREPARE = 24;
```

### CONFD_PROTO_PUSH_ON_CHANGE <a href="#confd_proto_push_on_change-8ab55f01befe" id="confd_proto_push_on_change-8ab55f01befe"></a>

```java
public static final int CONFD_PROTO_PUSH_ON_CHANGE = 230;
```

### CONFD_PROTO_PUSH_ON_CHANGE_CB <a href="#confd_proto_push_on_change_cb-a6f133a4259a" id="confd_proto_push_on_change_cb-a6f133a4259a"></a>

```java
public static final int CONFD_PROTO_PUSH_ON_CHANGE_CB = 141;
```

### CONFD_PROTO_REGISTER <a href="#confd_proto_register-a4f11dbedd2d" id="confd_proto_register-a4f11dbedd2d"></a>

```java
public static final int CONFD_PROTO_REGISTER = 3;
```

### CONFD_PROTO_REGISTER_DONE <a href="#confd_proto_register_done-fe5e7aa7f187" id="confd_proto_register_done-fe5e7aa7f187"></a>

```java
public static final int CONFD_PROTO_REGISTER_DONE = 11;
```

### CONFD_PROTO_REGISTER_NANO <a href="#confd_proto_register_nano-74fdf4906324" id="confd_proto_register_nano-74fdf4906324"></a>

```java
public static final int CONFD_PROTO_REGISTER_NANO = 16;
```

### CONFD_PROTO_REGISTER_RANGE <a href="#confd_proto_register_range-7e14f78c772e" id="confd_proto_register_range-7e14f78c772e"></a>

```java
public static final int CONFD_PROTO_REGISTER_RANGE = 4;
```

### CONFD_PROTO_REQUEST <a href="#confd_proto_request-93e8c74abb70" id="confd_proto_request-93e8c74abb70"></a>

```java
public static final int CONFD_PROTO_REQUEST = 15;
```

### CONFD_PROTO_RUNNING_CHK_NOT_MODIFIED <a href="#confd_proto_running_chk_not_modified-d9d1a2600f4f" id="confd_proto_running_chk_not_modified-d9d1a2600f4f"></a>

```java
public static final int CONFD_PROTO_RUNNING_CHK_NOT_MODIFIED = 75;
```

### CONFD_PROTO_SERVICE_CB <a href="#confd_proto_service_cb-945c3071bb69" id="confd_proto_service_cb-945c3071bb69"></a>

```java
public static final int CONFD_PROTO_SERVICE_CB = 139;
```

### CONFD_PROTO_SUBSCRIBE_ON_CHANGE <a href="#confd_proto_subscribe_on_change-91a69226bbf7" id="confd_proto_subscribe_on_change-91a69226bbf7"></a>

```java
public static final int CONFD_PROTO_SUBSCRIBE_ON_CHANGE = 220;
```

### CONFD_PROTO_TRANS_LOCK <a href="#confd_proto_trans_lock-46eb78055828" id="confd_proto_trans_lock-46eb78055828"></a>

```java
public static final int CONFD_PROTO_TRANS_LOCK = 21;
```

### CONFD_PROTO_TRANS_UNLOCK <a href="#confd_proto_trans_unlock-295334ec5c88" id="confd_proto_trans_unlock-295334ec5c88"></a>

```java
public static final int CONFD_PROTO_TRANS_UNLOCK = 22;
```

### CONFD_PROTO_UNLOCK <a href="#confd_proto_unlock-b763f38bad7c" id="confd_proto_unlock-b763f38bad7c"></a>

```java
public static final int CONFD_PROTO_UNLOCK = 67;
```

### CONFD_PROTO_UNLOCK_PARTIAL <a href="#confd_proto_unlock_partial-2de330055a15" id="confd_proto_unlock_partial-2de330055a15"></a>

```java
public static final int CONFD_PROTO_UNLOCK_PARTIAL = 74;
```

### CONFD_PROTO_UNSUBSCRIBE_ON_CHANGE <a href="#confd_proto_unsubscribe_on_change-7d82e5f7aec8" id="confd_proto_unsubscribe_on_change-7d82e5f7aec8"></a>

```java
public static final int CONFD_PROTO_UNSUBSCRIBE_ON_CHANGE = 221;
```

### CONFD_PROTO_USERTYPE_CB <a href="#confd_proto_usertype_cb-e384f682ad17" id="confd_proto_usertype_cb-e384f682ad17"></a>

```java
public static final int CONFD_PROTO_USERTYPE_CB = 138;
```

### CONFD_PROTO_VALIDATE_CB <a href="#confd_proto_validate_cb-6fcaa6d0b640" id="confd_proto_validate_cb-6fcaa6d0b640"></a>

```java
public static final int CONFD_PROTO_VALIDATE_CB = 131;
```

### CONFD_PROTO_WARNING <a href="#confd_proto_warning-135b1e051958" id="confd_proto_warning-135b1e051958"></a>

```java
public static final int CONFD_PROTO_WARNING = 7;
```

### CONFD_PROTO_WORKER <a href="#confd_proto_worker-dfb608f16ae5" id="confd_proto_worker-dfb608f16ae5"></a>

```java
public static final int CONFD_PROTO_WORKER = 2;
```

### CONFD_PROTO_WRITE_START <a href="#confd_proto_write_start-4c85e9073c94" id="confd_proto_write_start-4c85e9073c94"></a>

```java
public static final int CONFD_PROTO_WRITE_START = 23;
```

### CONFD_SERVICE_CB_CREATE <a href="#confd_service_cb_create-3cc7b8b20ade" id="confd_service_cb_create-3cc7b8b20ade"></a>

```java
public static final int CONFD_SERVICE_CB_CREATE = 202;
```

### CONFD_SERVICE_CB_POST_MODIFICATION <a href="#confd_service_cb_post_modification-db2139ff03cc" id="confd_service_cb_post_modification-db2139ff03cc"></a>

```java
public static final int CONFD_SERVICE_CB_POST_MODIFICATION = 201;
```

### CONFD_SERVICE_CB_PRE_MODIFICATION <a href="#confd_service_cb_pre_modification-c6a002fdf05a" id="confd_service_cb_pre_modification-c6a002fdf05a"></a>

```java
public static final int CONFD_SERVICE_CB_PRE_MODIFICATION = 200;
```

### CONFD_TRANS_CB_REGISTER <a href="#confd_trans_cb_register-91bd1f328cf4" id="confd_trans_cb_register-91bd1f328cf4"></a>

```java
public static final int CONFD_TRANS_CB_REGISTER = 9;
```

### CONFD_TYPECMD_CHECK_VAL <a href="#confd_typecmd_check_val-2a618d16a3b1" id="confd_typecmd_check_val-2a618d16a3b1"></a>

```java
public static final int CONFD_TYPECMD_CHECK_VAL = 5;
```

### CONFD_TYPECMD_CLEAN_SAVED <a href="#confd_typecmd_clean_saved-047615a0f7ed" id="confd_typecmd_clean_saved-047615a0f7ed"></a>

```java
public static final int CONFD_TYPECMD_CLEAN_SAVED = 8;
```

### CONFD_TYPECMD_CLEAN_STATE <a href="#confd_typecmd_clean_state-910b21e7abb9" id="confd_typecmd_clean_state-910b21e7abb9"></a>

```java
public static final int CONFD_TYPECMD_CLEAN_STATE = 7;
```

### CONFD_TYPECMD_GET_POINTS <a href="#confd_typecmd_get_points-6c1d44bcb303" id="confd_typecmd_get_points-6c1d44bcb303"></a>

```java
public static final int CONFD_TYPECMD_GET_POINTS = 2;
```

### CONFD_TYPECMD_INIT <a href="#confd_typecmd_init-c45992c6a930" id="confd_typecmd_init-c45992c6a930"></a>

```java
public static final int CONFD_TYPECMD_INIT = 0;
```

### CONFD_TYPECMD_LOAD <a href="#confd_typecmd_load-72aa0b2b7a9b" id="confd_typecmd_load-72aa0b2b7a9b"></a>

```java
public static final int CONFD_TYPECMD_LOAD = 1;
```

### CONFD_TYPECMD_RESTORE_SAVED <a href="#confd_typecmd_restore_saved-8587fcc90b5a" id="confd_typecmd_restore_saved-8587fcc90b5a"></a>

```java
public static final int CONFD_TYPECMD_RESTORE_SAVED = 9;
```

### CONFD_TYPECMD_SAVE_STATE <a href="#confd_typecmd_save_state-b2dc5a267ef3" id="confd_typecmd_save_state-b2dc5a267ef3"></a>

```java
public static final int CONFD_TYPECMD_SAVE_STATE = 6;
```

### CONFD_TYPECMD_STR2VAL <a href="#confd_typecmd_str2val-8c4d3374e985" id="confd_typecmd_str2val-8c4d3374e985"></a>

```java
public static final int CONFD_TYPECMD_STR2VAL = 3;
```

### CONFD_TYPECMD_VAL2STR <a href="#confd_typecmd_val2str-b8b539f1fcd0" id="confd_typecmd_val2str-b8b539f1fcd0"></a>

```java
public static final int CONFD_TYPECMD_VAL2STR = 4;
```

### CONFD_VALIDATE_VALUE <a href="#confd_validate_value-7faf9cef217f" id="confd_validate_value-7faf9cef217f"></a>

```java
public static final int CONFD_VALIDATE_VALUE = 147;
```

### MASK_ACT_ABORT <a href="#mask_act_abort-44e2cf9b2b5b" id="mask_act_abort-44e2cf9b2b5b"></a>

```java
public static final int MASK_ACT_ABORT = 2;
```

### MASK_ACT_ACTION <a href="#mask_act_action-c8548dadc2b9" id="mask_act_action-c8548dadc2b9"></a>

```java
public static final int MASK_ACT_ACTION = 4;
```

### MASK_ACT_COMMAND <a href="#mask_act_command-90e82531a8f5" id="mask_act_command-90e82531a8f5"></a>

```java
public static final int MASK_ACT_COMMAND = 8;
```

### MASK_ACT_COMPLETION <a href="#mask_act_completion-498a09910c15" id="mask_act_completion-498a09910c15"></a>

```java
public static final int MASK_ACT_COMPLETION = 16;
```

### MASK_ACT_INIT <a href="#mask_act_init-d9782e86d5f2" id="mask_act_init-d9782e86d5f2"></a>

```java
public static final int MASK_ACT_INIT = 1;
```

### MASK_CHK_CMD_ACCESS <a href="#mask_chk_cmd_access-71378bbe979d" id="mask_chk_cmd_access-71378bbe979d"></a>

```java
public static final int MASK_CHK_CMD_ACCESS = 1;
```

### MASK_CHK_DATA_ACCESS <a href="#mask_chk_data_access-3341923b3567" id="mask_chk_data_access-3341923b3567"></a>

```java
public static final int MASK_CHK_DATA_ACCESS = 2;
```

### MASK_DATA_CREATE <a href="#mask_data_create-cc3ac546f6ba" id="mask_data_create-cc3ac546f6ba"></a>

```java
public static final int MASK_DATA_CREATE = 16;
```

### MASK_DATA_EXISTS_OPTIONAL <a href="#mask_data_exists_optional-a626473fc985" id="mask_data_exists_optional-a626473fc985"></a>

```java
public static final int MASK_DATA_EXISTS_OPTIONAL = 1;
```

### MASK_DATA_FIND_NEXT <a href="#mask_data_find_next-642731e9bc7a" id="mask_data_find_next-642731e9bc7a"></a>

```java
public static final int MASK_DATA_FIND_NEXT = 32768;
```

### MASK_DATA_FIND_NEXT_OBJECT <a href="#mask_data_find_next_object-c9e2f7fa2d48" id="mask_data_find_next_object-c9e2f7fa2d48"></a>

```java
public static final int MASK_DATA_FIND_NEXT_OBJECT = 65536;
```

### MASK_DATA_GET_ATTRS <a href="#mask_data_get_attrs-6b951df12741" id="mask_data_get_attrs-6b951df12741"></a>

```java
public static final int MASK_DATA_GET_ATTRS = 2048;
```

### MASK_DATA_GET_CASE <a href="#mask_data_get_case-04546f41227c" id="mask_data_get_case-04546f41227c"></a>

```java
public static final int MASK_DATA_GET_CASE = 512;
```

### MASK_DATA_GET_ELEM <a href="#mask_data_get_elem-1c78fd687360" id="mask_data_get_elem-1c78fd687360"></a>

```java
public static final int MASK_DATA_GET_ELEM = 2;
```

### MASK_DATA_GET_NEXT <a href="#mask_data_get_next-3250d6ec3ed4" id="mask_data_get_next-3250d6ec3ed4"></a>

```java
public static final int MASK_DATA_GET_NEXT = 4;
```

### MASK_DATA_GET_NEXT_OBJECT <a href="#mask_data_get_next_object-63a6092120ce" id="mask_data_get_next_object-63a6092120ce"></a>

```java
public static final int MASK_DATA_GET_NEXT_OBJECT = 256;
```

### MASK_DATA_GET_OBJECT <a href="#mask_data_get_object-3c9ce4c40cfa" id="mask_data_get_object-3c9ce4c40cfa"></a>

```java
public static final int MASK_DATA_GET_OBJECT = 128;
```

### MASK_DATA_MOVE_AFTER <a href="#mask_data_move_after-2fee0221ec34" id="mask_data_move_after-2fee0221ec34"></a>

```java
public static final int MASK_DATA_MOVE_AFTER = 8192;
```

### MASK_DATA_NUM_INSTANCES <a href="#mask_data_num_instances-5052a7fd1aa8" id="mask_data_num_instances-5052a7fd1aa8"></a>

```java
public static final int MASK_DATA_NUM_INSTANCES = 64;
```

### MASK_DATA_REMOVE <a href="#mask_data_remove-1cec18b92301" id="mask_data_remove-1cec18b92301"></a>

```java
public static final int MASK_DATA_REMOVE = 32;
```

### MASK_DATA_SET_ATTR <a href="#mask_data_set_attr-37d0d0c53e02" id="mask_data_set_attr-37d0d0c53e02"></a>

```java
public static final int MASK_DATA_SET_ATTR = 4096;
```

### MASK_DATA_SET_CASE <a href="#mask_data_set_case-fad0652427be" id="mask_data_set_case-fad0652427be"></a>

```java
public static final int MASK_DATA_SET_CASE = 1024;
```

### MASK_DATA_SET_ELEM <a href="#mask_data_set_elem-a8be95e890e7" id="mask_data_set_elem-a8be95e890e7"></a>

```java
public static final int MASK_DATA_SET_ELEM = 8;
```

### MASK_DATA_WANT_FILTER <a href="#mask_data_want_filter-a66bfecb9372" id="mask_data_want_filter-a66bfecb9372"></a>

```java
public static final int MASK_DATA_WANT_FILTER = 131072;
```

### MASK_DATA_WRITE_ALL <a href="#mask_data_write_all-43e24460a23f" id="mask_data_write_all-43e24460a23f"></a>

```java
public static final int MASK_DATA_WRITE_ALL = 16384;
```

### MASK_DB_ACTIVATE_CHECKPOINT_RUNNING <a href="#mask_db_activate_checkpoint_running-129efdc05876" id="mask_db_activate_checkpoint_running-129efdc05876"></a>

```java
public static final int MASK_DB_ACTIVATE_CHECKPOINT_RUNNING = 256;
```

### MASK_DB_ADD_CHECKPOINT_RUNNING <a href="#mask_db_add_checkpoint_running-c36d04f3911f" id="mask_db_add_checkpoint_running-c36d04f3911f"></a>

```java
public static final int MASK_DB_ADD_CHECKPOINT_RUNNING = 64;
```

### MASK_DB_CANDIDATE_CHK_NOT_MODIFIED <a href="#mask_db_candidate_chk_not_modified-66e78060591f" id="mask_db_candidate_chk_not_modified-66e78060591f"></a>

```java
public static final int MASK_DB_CANDIDATE_CHK_NOT_MODIFIED = 8;
```

### MASK_DB_CANDIDATE_COMMIT <a href="#mask_db_candidate_commit-327bfb1e14d6" id="mask_db_candidate_commit-327bfb1e14d6"></a>

```java
public static final int MASK_DB_CANDIDATE_COMMIT = 1;
```

### MASK_DB_CANDIDATE_CONFIRMING_COMMIT <a href="#mask_db_candidate_confirming_commit-41e11d414ee2" id="mask_db_candidate_confirming_commit-41e11d414ee2"></a>

```java
public static final int MASK_DB_CANDIDATE_CONFIRMING_COMMIT = 2;
```

### MASK_DB_CANDIDATE_RESET <a href="#mask_db_candidate_reset-b3027411317f" id="mask_db_candidate_reset-b3027411317f"></a>

```java
public static final int MASK_DB_CANDIDATE_RESET = 4;
```

### MASK_DB_CANDIDATE_ROLLBACK_RUNNING <a href="#mask_db_candidate_rollback_running-4b02fd5a965f" id="mask_db_candidate_rollback_running-4b02fd5a965f"></a>

```java
public static final int MASK_DB_CANDIDATE_ROLLBACK_RUNNING = 16;
```

### MASK_DB_CANDIDATE_VALIDATE <a href="#mask_db_candidate_validate-17ca2e4bbca9" id="mask_db_candidate_validate-17ca2e4bbca9"></a>

```java
public static final int MASK_DB_CANDIDATE_VALIDATE = 32;
```

### MASK_DB_COPY_RUNNING_TO_STARTUP <a href="#mask_db_copy_running_to_startup-6561fae3e0b0" id="mask_db_copy_running_to_startup-6561fae3e0b0"></a>

```java
public static final int MASK_DB_COPY_RUNNING_TO_STARTUP = 512;
```

### MASK_DB_DEL_CHECKPOINT_RUNNING <a href="#mask_db_del_checkpoint_running-dba0677f87f3" id="mask_db_del_checkpoint_running-dba0677f87f3"></a>

```java
public static final int MASK_DB_DEL_CHECKPOINT_RUNNING = 128;
```

### MASK_DB_DELETE_CONFIG <a href="#mask_db_delete_config-47ea8d53e48f" id="mask_db_delete_config-47ea8d53e48f"></a>

```java
public static final int MASK_DB_DELETE_CONFIG = 4096;
```

### MASK_DB_LOCK <a href="#mask_db_lock-74c62539aadf" id="mask_db_lock-74c62539aadf"></a>

```java
public static final int MASK_DB_LOCK = 1024;
```

### MASK_DB_LOCK_PARTIAL <a href="#mask_db_lock_partial-31c5b86310e1" id="mask_db_lock_partial-31c5b86310e1"></a>

```java
public static final int MASK_DB_LOCK_PARTIAL = 8192;
```

### MASK_DB_RUNNING_CHK_NOT_MODIFIED <a href="#mask_db_running_chk_not_modified-62222a072b54" id="mask_db_running_chk_not_modified-62222a072b54"></a>

```java
public static final int MASK_DB_RUNNING_CHK_NOT_MODIFIED = 32768;
```

### MASK_DB_UNLOCK <a href="#mask_db_unlock-beabdd1f0301" id="mask_db_unlock-beabdd1f0301"></a>

```java
public static final int MASK_DB_UNLOCK = 2048;
```

### MASK_DB_UNLOCK_PARTIAL <a href="#mask_db_unlock_partial-e216cbdbee73" id="mask_db_unlock_partial-e216cbdbee73"></a>

```java
public static final int MASK_DB_UNLOCK_PARTIAL = 16384;
```

### MASK_NANO_SERVICE_CREATE <a href="#mask_nano_service_create-99a391453384" id="mask_nano_service_create-99a391453384"></a>

```java
public static final int MASK_NANO_SERVICE_CREATE = 1;
```

### MASK_NANO_SERVICE_DELETE <a href="#mask_nano_service_delete-60fd5e22274e" id="mask_nano_service_delete-60fd5e22274e"></a>

```java
public static final int MASK_NANO_SERVICE_DELETE = 2;
```

### MASK_NOTIF_GET_LOG_TIMES <a href="#mask_notif_get_log_times-30ea4c7f37fa" id="mask_notif_get_log_times-30ea4c7f37fa"></a>

```java
public static final int MASK_NOTIF_GET_LOG_TIMES = 1;
```

### MASK_NOTIF_REPLAY <a href="#mask_notif_replay-65e3e9c96611" id="mask_notif_replay-65e3e9c96611"></a>

```java
public static final int MASK_NOTIF_REPLAY = 2;
```

### MASK_NOTIF_SNMP_INFORM_RESULT <a href="#mask_notif_snmp_inform_result-02d170a743a9" id="mask_notif_snmp_inform_result-02d170a743a9"></a>

```java
public static final int MASK_NOTIF_SNMP_INFORM_RESULT = 2;
```

### MASK_NOTIF_SNMP_INFORM_TARGETS <a href="#mask_notif_snmp_inform_targets-ff2eb0e856df" id="mask_notif_snmp_inform_targets-ff2eb0e856df"></a>

```java
public static final int MASK_NOTIF_SNMP_INFORM_TARGETS = 1;
```

### MASK_SERVICE_CREATE <a href="#mask_service_create-a74311b1cf3d" id="mask_service_create-a74311b1cf3d"></a>

```java
public static final int MASK_SERVICE_CREATE = 4;
```

### MASK_SERVICE_POST_MODIFICATION <a href="#mask_service_post_modification-979461ccbfd5" id="mask_service_post_modification-979461ccbfd5"></a>

```java
public static final int MASK_SERVICE_POST_MODIFICATION = 2;
```

### MASK_SERVICE_PRE_MODIFICATION <a href="#mask_service_pre_modification-13da7cc79aee" id="mask_service_pre_modification-13da7cc79aee"></a>

```java
public static final int MASK_SERVICE_PRE_MODIFICATION = 1;
```

### MASK_TR_ABORT <a href="#mask_tr_abort-395896663f95" id="mask_tr_abort-395896663f95"></a>

```java
public static final int MASK_TR_ABORT = 32;
```

### MASK_TR_COMMIT <a href="#mask_tr_commit-c40ec51a9520" id="mask_tr_commit-c40ec51a9520"></a>

```java
public static final int MASK_TR_COMMIT = 64;
```

### MASK_TR_FINISH <a href="#mask_tr_finish-3a7ded7c8319" id="mask_tr_finish-3a7ded7c8319"></a>

```java
public static final int MASK_TR_FINISH = 128;
```

### MASK_TR_INIT <a href="#mask_tr_init-20a3bbde8951" id="mask_tr_init-20a3bbde8951"></a>

```java
public static final int MASK_TR_INIT = 1;
```

### MASK_TR_INTERRUPT <a href="#mask_tr_interrupt-a133bbe1705f" id="mask_tr_interrupt-a133bbe1705f"></a>

```java
public static final int MASK_TR_INTERRUPT = 256;
```

### MASK_TR_PREPARE <a href="#mask_tr_prepare-2a44ac87ede4" id="mask_tr_prepare-2a44ac87ede4"></a>

```java
public static final int MASK_TR_PREPARE = 16;
```

### MASK_TR_TRANS_LOCK <a href="#mask_tr_trans_lock-b13781a99429" id="mask_tr_trans_lock-b13781a99429"></a>

```java
public static final int MASK_TR_TRANS_LOCK = 2;
```

### MASK_TR_TRANS_UNLOCK <a href="#mask_tr_trans_unlock-cd657f481f65" id="mask_tr_trans_unlock-cd657f481f65"></a>

```java
public static final int MASK_TR_TRANS_UNLOCK = 4;
```

### MASK_TR_WRITE_START <a href="#mask_tr_write_start-53e1a35b2e04" id="mask_tr_write_start-53e1a35b2e04"></a>

```java
public static final int MASK_TR_WRITE_START = 8;
```
