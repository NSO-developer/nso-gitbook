---
description: Learn about different ways to install and deploy NSO.
icon: download
---

# Installation and Deployment

## Ways to Deploy NSO <a href="#d5e46" id="d5e46"></a>

* [By installation](./#by-installation)
* [By using Cisco-provided container images](./#by-using-cisco-provided-container-images)

### By Installation

Choose this way if you want to install NSO on a system. Before proceeding with the installation, decide on the install type.

#### Install Types

The installation of NSO comes in two variants.

{% hint style="info" %}
Both variants can be installed in **standard mode** or in [**FIPS**](https://www.nist.gov/itl/publications-0/federal-information-processing-standards-fips)**-compliant** mode. See the detailed installation instructions for more information.
{% endhint %}

<table data-card-size="large" data-view="cards"><thead><tr><th></th><th></th><th data-hidden data-card-target data-type="content-ref"></th></tr></thead><tbody><tr><td><strong>Local Install</strong></td><td>Local Install is used for development, lab, and evaluation purposes. It unpacks all the application components, including docs and examples. It can be used by the engineer to run multiple, unrelated, instances of NSO for different labs and demos on a single workstation.</td><td><a href="local-install.md">local-install.md</a></td></tr><tr><td><strong>System Install</strong></td><td>System Install is used when installing NSO for a centralized, always-on, production-grade, system-wide deployment. It is configured as a system daemon that would start and end with the underlying operating system. The default users of admin and operator are not included and the file structure is more distributed.</td><td><a href="system-install.md">system-install.md</a></td></tr></tbody></table>

{% hint style="info" %}
All the NSO examples and README steps provided with the installation are based on and intended for Local Install only. Use Local Install for evaluation and development purposes only.

System Install should be used only for production deployment. For all other purposes, use the Local Install procedure.
{% endhint %}

### By Using Cisco-Provided Container Images

Choose this way if you want to run NSO in a container, such as Docker. Visit the link below for more information.

{% content-ref url="containerized-nso.md" %}
[containerized-nso.md](containerized-nso.md)
{% endcontent-ref %}

***

> **Supporting Information**
>
> If you are evaluating NSO, you should have a designated support contact. If you have an NSO support agreement, please use the support channels specified in the agreement. In either case, do not hesitate to reach out to us if you have questions or feedback.
