---
description: Operate NSO using the Web UI.
icon: window
---

# Web UI

The NSO Web UI provides an intuitive northbound interface to your NSO deployment. The UI consists of individual views, each with a different purpose to perform operations such as device management, service management, commit handling, etc.

The main components of the Web UI are shown in the figure below.

The UI works by auto-rendering the underlying device and service models. This gives the benefit that the Web UI is immediately updated when new devices or services are added to the system. For example, say you have added support for a new device vendor. Then, without any programming requirements, the NSO Web UI provides the capability to configure those devices.

{% hint style="info" %}
It's important to realize that the bulk of concepts and configuration options in Web UI are shared with the NSO CLI. The rest of the documentation covers these in detail. You need to be familiar with the fundamental concepts to work with the Web UI.
{% endhint %}

## Browser Requirements <a href="#d5e5676" id="d5e5676"></a>

All modern web browsers are supported, and no plug-ins are needed. The interface itself is a JavaScript client.

## Accessing the Web UI <a href="#d5e5679" id="d5e5679"></a>

By default, the Web UI is accessible on port 8080 of the NSO server for an NSO Local Install and port 8888 for a System Install. The port can be changed in the `ncs.conf` file. Users are required to authenticate before accessing the Web UI.

## Basic Operations <a href="#d5e5683" id="d5e5683"></a>

### **Log In**

Log in to the NSO Web UI by using the username and password provided by your administrator. SSO SAML login is available if set up by your administrator. If applicable, use the SSO option to log in.

### **Log Out**

Log out by clicking your username on the top-right corner and choosing **Logout**.

### **Help Options**

Access the help options by clicking the help options icon in the UI banner. The following options are available:

* **Online documentation**: Access the Web UI's online help.
* **Manage hidden groups**: Administer hidden groups, e.g., for debugging. Read more about hide groups in [NSO CLI](../cli/introduction-to-nso-cli.md).
* **NSO version**: Information about the version of NSO you are running.

In the Web UI, supplementary help text, whenever applicable, is available on the configuration fields and can be accessed by clicking the info icons.

## Dirty State

Anytime a configuration is changed in the Web UI (such as a device or service configuration change), the UI reflects the change with a so-called color-coded "dirty state" with the following meanings:

* <mark style="color:blue;">Blue</mark> color: An addition was made.
* <mark style="color:red;">Red</mark> color: A deletion was made.
* <mark style="color:green;">Green</mark> color: A modification was made to an already-committed list element.

## Commit Manager <a href="#d5e5718" id="d5e5718"></a>

The Commit Manager is accessible at all times from the UI banner. A number, corresponding to the number of changes in a transaction, is displayed next to the Commit Manager icon when changes are available for review. For certain action, it is possible to skip the Commit Manager review and apply the changes directly. Working with the Commit Manager is described further in [Tools](tools.md).
