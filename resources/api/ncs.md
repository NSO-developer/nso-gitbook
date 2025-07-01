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

