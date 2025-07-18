# Python ncs Module

NCS Python high level module.

The high-level APIs provided by this module are an abstraction on top of the
low-level APIs. This makes them easier to use, improves code readability and
development rate for common use cases, such as service and action callbacks.

As an example, the maagic module greatly simplifies the way of accessing data.
First it helps in navigating the data model, using standard Python object dot
notation, giving very clear and readable code. The context handlers remove the
need to close sockets, user sessions and transactions. Finally, by removing the
need to know the data types of the leafs, allows you to focus on the program
logic.

This top module imports the following modules:

* alarm -- NSO alarm handling
* application -- module for implementing packages and services
* cdb -- placeholder for low-level _ncs.cdb items
* dp -- data provider, actions
* error -- placeholder for low-level _ncs.error items
* events -- placeholder for low-level _ncs.events items
* ha -- placeholder for low-level _ncs.ha items
* log -- logging utilities
* maagic -- data access module
* maapi -- MAAPI interface
* template -- module for working with templates
* service_log -- module for doing service logging
* upgrade -- module for writing upgrade components
* util -- misc utilities

## Submodules

- [ncs.alarm](ncs.alarm.md): NCS Alarm Manager module.
- [ncs.application](ncs.application.md): Module for building NCS applications.
- [ncs.cdb](ncs.cdb.md): CDB high level module.
- [ncs.dp](ncs.dp.md): Callback module for connecting data providers to ConfD/NCS.
- [ncs.experimental](ncs.experimental.md): Experimental stuff.
- [ncs.log](ncs.log.md): This module provides some logging utilities.
- [ncs.maagic](ncs.maagic.md): Confd/NCS data access module.
- [ncs.maapi](ncs.maapi.md): MAAPI high level module.
- [ncs.progress](ncs.progress.md): MAAPI progress trace high level module.
- [ncs.service_log](ncs.service_log.md): This module provides service logging
- [ncs.template](ncs.template.md): This module implements classes to simplify template processing.
- [ncs.util](ncs.util.md): Utility module, low level abstrations

## Predefined Values

```python

ACCUMULATE = 1
ADDR = '127.0.0.1'
ALREADY_LOCKED = -4
ATTR_ANNOTATION = 2147483649
ATTR_BACKPOINTER = 2147483651
ATTR_INACTIVE = 0
ATTR_ORIGIN = 2147483655
ATTR_ORIGINAL_VALUE = 2147483653
ATTR_OUT_OF_BAND = 2147483664
ATTR_REFCOUNT = 2147483650
ATTR_TAGS = 2147483648
ATTR_WHEN = 2147483652
CANDIDATE = 1
CMP_EQ = 1
CMP_GT = 3
CMP_GTE = 4
CMP_LT = 5
CMP_LTE = 6
CMP_NEQ = 2
CMP_NOP = 0
CONFD_EOF = -2
CONFD_ERR = -1
CONFD_OK = 0
CONFD_PORT = 4565
CS_NODE_CMP_NORMAL = 0
CS_NODE_CMP_SNMP = 1
CS_NODE_CMP_SNMP_IMPLIED = 2
CS_NODE_CMP_UNSORTED = 4
CS_NODE_CMP_USER = 3
CS_NODE_HAS_DISPLAY_WHEN = 1024
CS_NODE_HAS_META_DATA = 2048
CS_NODE_HAS_MOUNT_POINT = 32768
CS_NODE_HAS_WHEN = 512
CS_NODE_IS_ACTION = 8
CS_NODE_IS_CASE = 128
CS_NODE_IS_CDB = 4
CS_NODE_IS_CONTAINER = 256
CS_NODE_IS_DYN = 1
CS_NODE_IS_LEAFREF = 16384
CS_NODE_IS_LEAF_LIST = 8192
CS_NODE_IS_LIST = 1
CS_NODE_IS_NOTIF = 64
CS_NODE_IS_PARAM = 16
CS_NODE_IS_RESULT = 32
CS_NODE_IS_STRING_AS_BINARY = 65536
CS_NODE_IS_WRITE = 2
CS_NODE_IS_WRITE_ALL = 4096
C_BINARY = 39
C_BIT32 = 29
C_BIT64 = 30
C_BITBIG = 50
C_BOOL = 17
C_BUF = 5
C_CDBBEGIN = 37
C_DATE = 20
C_DATETIME = 19
C_DECIMAL64 = 43
C_DEFAULT = 42
C_DOUBLE = 14
C_DQUAD = 46
C_DURATION = 27
C_EMPTY = 53
C_ENUM_HASH = 28
C_ENUM_VALUE = 28
C_HEXSTR = 47
C_IDENTITYREF = 44
C_INT16 = 7
C_INT32 = 8
C_INT64 = 9
C_INT8 = 6
C_IPV4 = 15
C_IPV4PREFIX = 40
C_IPV4_AND_PLEN = 48
C_IPV6 = 16
C_IPV6PREFIX = 41
C_IPV6_AND_PLEN = 49
C_LIST = 31
C_NOEXISTS = 1
C_OBJECTREF = 34
C_OID = 38
C_PTR = 36
C_QNAME = 18
C_STR = 4
C_SYMBOL = 3
C_TIME = 23
C_UINT16 = 11
C_UINT32 = 12
C_UINT64 = 13
C_UINT8 = 10
C_UNION = 35
C_XMLBEGIN = 32
C_XMLBEGINDEL = 45
C_XMLEND = 33
C_XMLMOVEAFTER = 52
C_XMLMOVEFIRST = 51
C_XMLTAG = 2
DB_INVALID = 0
DB_VALID = 1
DEBUG = 1
DELAYED_RESPONSE = 2
EOF = -2
ERR = -1
ERRCODE_ACCESS_DENIED = 3
ERRCODE_APPLICATION = 4
ERRCODE_APPLICATION_INTERNAL = 5
ERRCODE_DATA_MISSING = 8
ERRCODE_INCONSISTENT_VALUE = 2
ERRCODE_INTERNAL = 7
ERRCODE_INTERRUPT = 9
ERRCODE_IN_USE = 0
ERRCODE_PROTO_USAGE = 6
ERRCODE_RESOURCE_DENIED = 1
ERRINFO_KEYPATH = 0
ERRINFO_STRING = 1
ERR_ABORTED = 49
ERR_ACCESS_DENIED = 3
ERR_ALREADY_EXISTS = 2
ERR_APPLICATION_INTERNAL = 39
ERR_BADPATH = 8
ERR_BADSTATE = 17
ERR_BADTYPE = 5
ERR_BAD_CONFIG = 36
ERR_BAD_KEYREF = 14
ERR_CLI_CMD = 59
ERR_DATA_MISSING = 58
ERR_EOF = 45
ERR_EXTERNAL = 19
ERR_HA_ABORT = 71
ERR_HA_BADCONFIG = 69
ERR_HA_BADFXS = 27
ERR_HA_BADNAME = 29
ERR_HA_BADTOKEN = 28
ERR_HA_BADVSN = 52
ERR_HA_BIND = 30
ERR_HA_CLOSED = 26
ERR_HA_CONNECT = 25
ERR_HA_NOTICK = 31
ERR_HA_WITH_UPGRADE = 47
ERR_INCONSISTENT_VALUE = 38
ERR_INTERNAL = 18
ERR_INUSE = 11
ERR_INVALID_INSTANCE = 43
ERR_LIB_NOT_INITIALIZED = 34
ERR_LOCKED = 10
ERR_MALLOC = 20
ERR_MISSING_INSTANCE = 42
ERR_MUST_FAILED = 41
ERR_NOEXISTS = 1
ERR_NON_UNIQUE = 13
ERR_NOSESSION = 22
ERR_NOSTACK = 9
ERR_NOTCREATABLE = 6
ERR_NOTDELETABLE = 7
ERR_NOTMOVABLE = 46
ERR_NOTRANS = 61
ERR_NOTSET = 12
ERR_NOT_IMPLEMENTED = 51
ERR_NOT_WRITABLE = 4
ERR_NO_MOUNT_ID = 67
ERR_OS = 24
ERR_POLICY_COMPILATION_FAILED = 54
ERR_POLICY_EVALUATION_FAILED = 55
ERR_POLICY_FAILED = 53
ERR_PROTOUSAGE = 21
ERR_RESOURCE_DENIED = 37
ERR_STALE_INSTANCE = 68
ERR_START_FAILED = 57
ERR_SUBAGENT_DOWN = 33
ERR_TIMEOUT = 48
ERR_TOOMANYTRANS = 23
ERR_TOO_FEW_ELEMS = 15
ERR_TOO_MANY_ELEMS = 16
ERR_TOO_MANY_SESSIONS = 35
ERR_TRANSACTION_CONFLICT = 70
ERR_UNAVAILABLE = 44
ERR_UNSET_CHOICE = 40
ERR_UPGRADE_IN_PROGRESS = 60
ERR_VALIDATION_WARNING = 32
ERR_XPATH = 50
EXEC_COMPARE = 13
EXEC_CONTAINS = 11
EXEC_DERIVED_FROM = 9
EXEC_DERIVED_FROM_OR_SELF = 10
EXEC_RE_MATCH = 8
EXEC_STARTS_WITH = 7
EXEC_STRING_COMPARE = 12
FALSE = 0
FIND_NEXT = 0
FIND_SAME_OR_NEXT = 1
HKP_MATCH_FULL = 3
HKP_MATCH_HKP = 2
HKP_MATCH_NONE = 0
HKP_MATCH_TAGS = 1
INTENDED = 7
IN_USE = -5
ITER_CONTINUE = 3
ITER_RECURSE = 2
ITER_STOP = 1
ITER_SUSPEND = 4
ITER_UP = 5
ITER_WANT_ANCESTOR_DELETE = 2
ITER_WANT_ATTR = 4
ITER_WANT_CLI_ORDER = 1024
ITER_WANT_CLI_STR = 8
ITER_WANT_LEAF_FIRST_ORDER = 32
ITER_WANT_LEAF_LAST_ORDER = 64
ITER_WANT_PREV = 1
ITER_WANT_P_CONTAINER = 256
ITER_WANT_REVERSE = 128
ITER_WANT_SCHEMA_ORDER = 16
ITER_WANT_SUPPRESS_OPER_DEFAULTS = 2048
LF_AND = 1
LF_CMP = 3
LF_CMP_LL = 7
LF_EXEC = 5
LF_EXISTS = 4
LF_NOT = 2
LF_OR = 0
LF_ORIGIN = 6
LIB_API_VSN = 134610944
LIB_API_VSN_STR = '08060000'
LIB_PROTO_VSN = 86
LIB_PROTO_VSN_STR = '86'
LIB_VSN = 134610944
LIB_VSN_STR = '08060000'
LISTENER_CLI = 8
LISTENER_IPC = 1
LISTENER_NETCONF = 2
LISTENER_SNMP = 4
LISTENER_WEBUI = 16
LOAD_SCHEMA_HASH = 65536
LOAD_SCHEMA_NODES = 1
LOAD_SCHEMA_TYPES = 2
MMAP_SCHEMAS_FIXED_ADDR = 2
MMAP_SCHEMAS_KEEP_SIZE = 1
MOP_ATTR_SET = 6
MOP_CREATED = 1
MOP_DELETED = 2
MOP_MODIFIED = 3
MOP_MOVED_AFTER = 5
MOP_VALUE_SET = 4
NCS_ERR_CONNECTION_CLOSED = 64
NCS_ERR_CONNECTION_REFUSED = 56
NCS_ERR_CONNECTION_TIMEOUT = 63
NCS_ERR_DEVICE = 65
NCS_ERR_SERVICE_CONFLICT = 62
NCS_ERR_TEMPLATE = 66
NCS_LISTENER_NETCONF_CALL_HOME = 32
NCS_PORT = 4569
NO_DB = 0
OK = 0
OPERATIONAL = 4
PATH = None
PORT = 4569
PRE_COMMIT_RUNNING = 6
PROGRESS_INFO = 3
PROGRESS_START = 1
PROGRESS_STOP = 2
PROTO_CONSOLE = 4
PROTO_HTTP = 6
PROTO_HTTPS = 7
PROTO_SSH = 2
PROTO_SSL = 5
PROTO_SYSTEM = 3
PROTO_TCP = 1
PROTO_TLS = 9
PROTO_TRACE = 3
PROTO_UDP = 8
PROTO_UNKNOWN = 0
QUERY_HKEYPATH = 1
QUERY_HKEYPATH_VALUE = 2
QUERY_STRING = 0
QUERY_TAG_VALUE = 3
READ = 1
READ_WRITE = 2
RUNNING = 2
SERIAL_HKEYPATH = 2
SERIAL_NONE = 0
SERIAL_TAG_VALUE = 3
SERIAL_VALUE_T = 1
SILENT = 0
SNMP_COL_ROW = 3
SNMP_Counter32 = 6
SNMP_Counter64 = 9
SNMP_INTEGER = 1
SNMP_Interger32 = 2
SNMP_IpAddress = 5
SNMP_NULL = 0
SNMP_OBJECT_IDENTIFIER = 4
SNMP_OCTET_STRING = 3
SNMP_OID = 2
SNMP_Opaque = 8
SNMP_TimeTicks = 7
SNMP_Unsigned32 = 10
SNMP_VARIABLE = 1
STARTUP = 3
TIMEZONE_UNDEF = -111
TRACE = 2
TRANSACTION = 5
TRANS_CB_FLAG_FILTERED = 1
TRUE = 1
USESS_FLAG_FORWARD = 1
USESS_FLAG_HAS_IDENTIFICATION = 2
USESS_FLAG_HAS_OPAQUE = 4
USESS_LOCK_MODE_EXCLUSIVE = 2
USESS_LOCK_MODE_NONE = 0
USESS_LOCK_MODE_PRIVATE = 1
USESS_LOCK_MODE_SHARED = 3
VALIDATION_FLAG_COMMIT = 2
VALIDATION_FLAG_TEST = 1
VALIDATION_WARN = -3
VERBOSITY_DEBUG = 3
VERBOSITY_NORMAL = 0
VERBOSITY_VERBOSE = 1
VERBOSITY_VERY_VERBOSE = 2
```
