---
description: Operate NSO using the Web UI.
icon: window
---

# Web UI

The NSO Web UI consists of a suite of web-based applications. Each application has its own distinct concern, for instance, handling configuration, transaction handling, managing devices, managing services, or monitoring the system. The different applications can be accessed from the application hub, which is shown directly after authentication.

The Web UI is a mix of custom-built applications and auto-rendering from the underlying device and service models. The latter gives the benefit that a Web UI is immediately updated when new devices or services are added to the system. So, say you add support for a new device vendor. Without any programming, is the NSO Web UI capable of configuring those devices?

All modern web browsers are supported and no plug-ins are required. The interface is a pure JavaScript Client.

## Using the Web UI <a href="#d5e5509" id="d5e5509"></a>

The Web UI is available on port 8080 on the NSO server. The port can be changed in the `ncs.conf` file. An NSO user must exist.

More help on how to use the Web UI is present in the Web UI applications. The help is located in the user menu, which can be found to the right in the application header.

## Transactions and Commit <a href="#d5e5514" id="d5e5514"></a>

Take special notice to the Commit Manager application, whenever a transaction has started, the active changes can be inspected and evaluated before they are committed and pushed to the network. The data is saved to the NSO datastore and pushed to the network when a user presses "Commit".

Any network-wide change can be picked up as a rollback file. That rollback can then be applied to undo whatever happened to the network.
