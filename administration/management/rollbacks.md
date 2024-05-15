---
description: Configure NSO to roll back committed changes.
---

# Rollbacks

NSO supports creating rollback files during the commit of a transaction that allows for rolling back the introduced changes. Rollbacks do not come without a cost and should be disabled if the functionality is not going to be used. Enabling rollbacks impacts both the time it takes to commit a change and requires sufficient storage on disk.

Rollback files contain a set of headers and the data required to restore the changes that were made when the rollback was created. One of the header fields includes a unique rollback ID that can be used to address the rollback file independent of the rollback numbering format.

The use of rollbacks from the supported APIs and the CLI is documented in the documentation for the given API.

## `ncs.conf` Config for Rollback <a href="#d5e5666" id="d5e5666"></a>

As described [earlier](user-management.md), NSO is configured through the configuration file, `ncs.conf`. In that file, we have the following items related to rollbacks:

<table><thead><tr><th width="376">Configuration Setting</th><th>Description</th></tr></thead><tbody><tr><td><code>/ncs-config/rollback/enabled</code></td><td>If set to <code>true</code>, then a rollback file will be created whenever the running configuration is modified.</td></tr><tr><td><code>/ncs-config/rollback/directory</code></td><td>Location where rollback files will be created.</td></tr><tr><td><code>/ncs-config/rollback/history-size</code></td><td>The number of old rollback files to save.</td></tr></tbody></table>
