---
description: Latest features and enhancements added in this release.
---

# What's New

{% hint style="info" %}
Only significant new updates are listed here. To see the complete list of changes, refer to the [NSO Changelog Explorer](https://developer.cisco.com/docs/nso/changelog-explorer/).
{% endhint %}

## Release Highlights <a href="#d5e42" id="d5e42"></a>

This release includes major enhancements in the following areas:

<details>

<summary><strong>Containerized Build Environment for NSO Packages</strong></summary>

A new container image, called Development Image, is available from [Cisco Software Download](https://software.cisco.com/download/home). This image comes with the necessary environment and software for building NSO packages.

Documentation Updates:

* Updated and expanded the [Containerized NSO](administration/installation-and-deployment/containerized-nso.md) describing the new image flavor.

</details>

<details>

<summary><strong>Support for LDAP and TACACS+ Authentication</strong></summary>

Two new authentication packages are now available in `$NCS_DIR/packages/auth`: `cisco-nso-ldap-auth` and `cisco-nso-tacacs-auth`. They provide support for LDAP and TACACS+ protocols through the Package Authentication mechanism.

Documentation Updates:

* Refer to the respective `README` file inside each package for usage and configuration options.

</details>

<details>

<summary><strong>DNS Update Support for Tailf-hcc</strong></summary>

The tailf-hcc package now allows submitting an RFC2136 Dynamic DNS Update to a name server on High Availability (HA) failover, simplifying geographically redundant NSO HA setup.

Documentation Updates:

* Added the section [Layer-3 DNS Update](administration/management/high-availability.md#ug.ha.hcc.deployment) describing the new functionality.

</details>

<details>

<summary><strong>Nano Service Usability</strong></summary>

Multiple changes with nano services (documented in [Nano Services for Staged Provisioning](development/core-concepts/nano-services-staged-provisioning.md)) streamline their development and use:

* The `ncs-make-package` command now supports the `--nano-skeleton [python/java]` option.
* The functionality of `self-as-service-status` is now the default.
* The self component in a nano service plan is now generated automatically if not defined in the service model.
* Canceled actions in the side effects queue can be manually scheduled for a retry.
* Improved performance of initial create of a nano service with the `converge-on-re-deploy` extension.

Documentation Updates:

* Updated the section [NACM Rules and Services](administration/management/aaa-infrastructure.md#d5e6693) to better document required permissions for nano services.

</details>

<details>

<summary><strong>Upgrade Improvements</strong></summary>

CDB schema upgrades now use an optimized algorithm, resulting in faster upgrades and the ability to preview schema changes through a packages reload dry-run option. A separate upgrade log can be configured for information about CDB upgrade as well.

Additionally, information on upgrading HA Raft clusters has been added.

Documentation Updates:

* Updated the section [Loading Packages](administration/management/nso-packages.md#ug.package\_mgmt.loading) describing the dry-run functionality.
* Added the section [Packages Upgrades in Raft Cluster](administration/management/high-availability.md#packages-upgrades-in-raft-cluster) and the section called [Version Upgrade of Cluster Nodes](administration/management/high-availability.md#ch\_ha.raft\_upgrade) for Raft HA.

</details>

<details>

<summary><strong>NED Documentation Update</strong></summary>

The old NED Development document has been updated and split into two parts. The part on managing and using NEDs is now incorporated into Administration, while the part detailing the creation of new NEDs is now found in the Development.

Documentation Updates:

* Added [NED Administration](administration/management/ned-administration.md) on managing and using NEDs.
* Added [NED Development](development/advanced-development/developing-neds/) on the creation of new NEDs.

</details>
