---
description: Latest features and enhancements added in this release.
icon: sparkles
---

# What's New

{% hint style="info" %}
Only significant new updates are listed here. To see the complete list of changes, refer to the [NSO Changelog Explorer](https://developer.cisco.com/docs/nso/changelog-explorer/?from=6.7\&to=6.8).
{% endhint %}

## Release Highlights

This release includes major enhancements in the following areas:

<details>

<summary>Post-Quantum Cryptography Support</summary>

For built-in SSH connections, NSO 6.8 adds the hybrid key-exchange algorithm `mlkem768x25519-sha256` to the default preference lists of the SSH server and Erlang/OTP SSH client. It combines ML-KEM-768 with X25519 and requires an Erlang/OTP SSH implementation that supports [RFC 10042](https://www.rfc-editor.org/rfc/rfc10042.html) and a peer that offers the algorithm. This SSH addition does not provide the full algorithm set in the SEC-CRY-PRIM guidance.

For TLS 1.3 RESTCONF and Web UI connections, NSO 6.8 adds configuration for post-quantum key-agreement groups and ML-DSA signature algorithms. Availability depends on the Erlang/OTP and OpenSSL build; these options require OTP compiled against OpenSSL 3.5 or later.

Documentation Updates:

* Updated [SSH Key Management](operation-and-usage/operations/ssh-key-management.md) with PQC key-exchange support for the built-in SSH server and Erlang/OTP SSH client.
* Updated [Secure Deployment](administration/installation-and-deployment/deployment/secure-deployment.md) with PQC TLS support and its build requirements.

</details>

