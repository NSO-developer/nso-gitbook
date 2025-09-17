# confd_lib Man Page

`confd_lib` - C library for connecting to NSO

## Library

NSO Library, (`libconfd`, `-lconfd`)

## Description

The `libconfd` shared library is used to connect to NSO. The
documentation for the library is divided into several manual pages:

[confd_lib_lib(3)](confd_lib_lib.3.md)  
> Common Library Functions

[confd_lib_dp(3)](confd_lib_dp.3.md)  
> The Data Provider API

[confd_lib_events(3)](confd_lib_events.3.md)  
> The Event Notification API

[confd_lib_ha(3)](confd_lib_ha.3.md)  
> The High Availability API

[confd_lib_cdb(3)](confd_lib_cdb.3.md)  
> The CDB API

[confd_lib_maapi(3)](confd_lib_maapi.3.md)  
> The Management Agent API

There is also a C header file associated with each of these manual
pages:

`#include <confd_lib.h>`  
> Common type definitions and prototypes for the functions in the
> [confd_lib_lib(3)](confd_lib_lib.3.md) manual page. Always needed.

`#include <confd_dp.h>`  
> Needed when functions in the [confd_lib_dp(3)](confd_lib_dp.3.md)
> manual page are used.

`#include <confd_events.h>`  
> Needed when functions in the
> [confd_lib_events(3)](confd_lib_events.3.md) manual page are used.

`#include <confd_ha.h>`  
> Needed when functions in the [confd_lib_ha(3)](confd_lib_ha.3.md)
> manual page are used.

`#include <confd_cdb.h>`  
> Needed when functions in the [confd_lib_cdb(3)](confd_lib_cdb.3.md)
> manual page are used.

`#include <confd_maapi.h>`  
> Needed when functions in the
> [confd_lib_maapi(3)](confd_lib_maapi.3.md) manual page are used.

For backwards compatibility, `#include <confd.h>` can also be used, and
is equivalent to:

<div class="informalexample">

    #include <confd_lib.h>
    #include <confd_dp.h>
    #include <confd_events.h>
    #include <confd_ha.h>

</div>

## See Also

The NSO User Guide
