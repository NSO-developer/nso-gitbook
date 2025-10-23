---
description: Alter your examples to work with System Install.
---

# Modify Examples for System Install

{% hint style="warning" %}
Applies to System Install.
{% endhint %}

Since all the NSO examples and README steps that come with the installer are primarily aimed at Local Install, you need to modify them to run them on a System Install.

To work with the System Install structure, this may require a little or bigger modification depending on the example.

For example, to port the [example.ncs/nano-services/basic-vrouter](https://github.com/NSO-developer/nso-examples/tree/6.6/nano-services/basic-vrouter) example to the System Install structure:

1.  Make the following changes to the `basic-vrouter/ncs.conf` file:

    ```xml
    <enabled>false</enabled>
    <ip>0.0.0.0</ip>
    <port>8888</port>
    -<key-file>${NCS_DIR}/etc/ncs/ssl/cert/host.key</key-file>
    -<cert-file>${NCS_DIR}/etc/ncs/ssl/cert/host.cert</cert-file>
    +<key-file>${NCS_CONFIG_DIR}/etc/ncs/ssl/cert/host.key</key-file>
    +<cert-file>${NCS_CONFIG_DIR}/etc/ncs/ssl/cert/host.cert</cert-file>
    </ssl>
    </transport>
    ```
2. Copy the Local Install `$NCS_DIR/var/ncs/cdb/aaa_init.xml` file to the `basic-vrouter/` folder.

Other, more complex examples may require more `ncs.conf` file changes or require a copy of the Local Install default `$NCS_DIR/etc/ncs/ncs.conf` file together with the modification described above, or require the Local Install tool `$NCS_DIR/bin/ncs-setup` to be installed, as the `ncs-setup` command is usually not useful with a System Install. See [Migrate to System Install](migrate-to-system-install.md) for more information.
