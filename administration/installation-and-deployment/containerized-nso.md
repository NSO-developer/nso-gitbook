---
description: Deploy NSO in a containerized setup using Cisco-provided images.
---

# Containerized NSO

NSO can be deployed in your environment using a container, such as Docker. Cisco offers two pre-built images for this purpose that you can use to run NSO and build packages (see [Overview of NSO Images](containerized-nso.md#d5e8294)).

***

**Migration Information**

If you are migrating from an existing NSO System Install to a container-based setup, follow the guidelines given below in [Migration to Containerized NSO](containerized-nso.md#sec.migrate-to-containerizednso).

***

## Use Cases for Containerized Approach

Running NSO in a container offers several benefits that you would generally expect from a containerized approach, such as ease of use and convenient distribution. More specifically, a containerized NSO approach allows you to:

* Run a container image of a specific version of NSO and your packages which can then be distributed as one unit.
* Deploy and distribute the same version across your production environment.
* Use the Build Image containing the necessary environment for compiling NSO packages.

## Overview of NSO Images <a href="#d5e8294" id="d5e8294"></a>

Cisco provides the following two NSO images based on Red Hat UBI.

* [Production Image](containerized-nso.md#production-image)
* [Build Image](containerized-nso.md#build-image)

<table data-full-width="false"><thead><tr><th>Intended Use</th><th>Develop NSO Packages</th><th>Build NSO Packages</th><th>Run NSO</th><th>NSO Install Type</th></tr></thead><tbody><tr><td>Development Host</td><td><div><figure><img src="../../.gitbook/assets/acknowledge.png" alt="" width="22"><figcaption></figcaption></figure></div></td><td><div><figure><img src="../../.gitbook/assets/reject.png" alt="" width="22"><figcaption></figcaption></figure></div></td><td><div><figure><img src="../../.gitbook/assets/reject.png" alt="" width="22"><figcaption></figcaption></figure></div></td><td>None or Local Install</td></tr><tr><td>Build Image</td><td><div><figure><img src="../../.gitbook/assets/reject.png" alt="" width="22"><figcaption></figcaption></figure></div></td><td><div><figure><img src="../../.gitbook/assets/acknowledge.png" alt="" width="22"><figcaption></figcaption></figure></div></td><td><div><figure><img src="../../.gitbook/assets/reject.png" alt="" width="22"><figcaption></figcaption></figure></div></td><td>System Install</td></tr><tr><td>Production Image</td><td><div><figure><img src="../../.gitbook/assets/reject.png" alt="" width="22"><figcaption></figcaption></figure></div></td><td><div><figure><img src="../../.gitbook/assets/reject.png" alt="" width="22"><figcaption></figcaption></figure></div></td><td><div><figure><img src="../../.gitbook/assets/acknowledge.png" alt="" width="22"><figcaption></figcaption></figure></div></td><td>System Install</td></tr></tbody></table>

{% hint style="info" %}
The Red Hat UBI is an OCI-compliant image that is freely distributable and independent of platform and technical dependencies. You can read more about Red Hat UBI [here](https://www.redhat.com/en/blog/introducing-red-hat-universal-base-image), and about Open Container Initiative (OCI) [here](https://opencontainers.org/faq/).
{% endhint %}

### Production Image

The Production Image is a production-ready NSO image for system-wide deployment and use. It is based on NSO [System Install](system-install.md) and is available from the [Cisco Software Download](https://software.cisco.com/download/home) site.

Use the pre-built image as the base image in the container file (e.g., Dockerfile) and mount your own packages (such as NEDs and service packages) to run a final image for your production environment (see examples below).

{% hint style="info" %}
Consult the [Installation](./) documentation for information on installing NSO on a Docker host, building NSO packages, etc.
{% endhint %}

{% hint style="info" %}
See [Developing and Deploying a Nano Service](deployment/develop-and-deploy-a-nano-service.md) for an example that uses the container to deploy an SSH-key-provisioning nano service.

The README in the [examples.ncs/getting-started/netsim-sshkey](https://github.com/NSO-developer/nso-examples/tree/6.6/getting-started/netsim-sshkey) example provides a link to the container-based deployment variant of the example. See the `setup_ncip.sh` script and `README` in the `netsim-sshkey` deployment example for details.
{% endhint %}

### Build Image

The Build Image is a separate standalone NSO image with the necessary environment and software for building packages. It is provided specifically to address the developer needs of building packages.

The image is available as a signed package (e.g., `nso-VERSION.container-image-build.linux.ARCH.signed.bin`) from the Cisco [Software Download](https://software.cisco.com/download/home) site. You can run the Build Image in different ways, and a simple tool for defining and running multi-container Docker applications is [Docker Compose](https://docs.docker.com/compose/) (see examples below).

The container provides the necessary environment to build custom packages. The Build Image adds a few Linux packages that are useful for development, such as Ant, JDK, net-tools, pip, etc. Additional Linux packages can be added using, for example, the `dnf` command. The `dnf list installed` command lists all the installed packages.

## Downloading and Extracting the Images <a href="#sec.fetch-images" id="sec.fetch-images"></a>

To fetch and extract NSO images:

1. On Cisco's official [Software Download](https://software.cisco.com/download/home) site, search for "Network Services Orchestrator". Select the relevant NSO version in the drop-down list, e.g., "Crosswork Network Services Orchestrator 6"**,** and click "Network Services Orchestrator Software". Locate the binary, which is delivered as a signed package (e.g., `nso-6.4.container-image-prod.linux.x86_64.signed.bin`).
2.  Extract the image and other files from the signed package, for example:

    ```bash
    sh nso-6.4.container-image-prod.linux.x86_64.signed.bin
    ```

{% hint style="info" %}
**Signed Archive File Pattern**

The signed archive file name has the following pattern:

`nso-VERSION.container-image-PROD_BUILD.linux.ARCH.signed.bin`, where:

* `VERSION` denotes the image's NSO version.
* `PROD_BUILD` denotes the type of the container (i.e., `prod` for Production, and `build` for Build).
* `ARCH` is the CPU architecture.
{% endhint %}

## System Requirements <a href="#sec.system-reqs" id="sec.system-reqs"></a>

To run the images, make sure that your system meets the following requirements:

* A system running Linux `x86_64` or `ARM64`, or macOS `x86_64` or Apple Silicon. Linux for production.
* A container platform. Docker is the recommended platform and is used as an example in this guide for running NSO images. You may use another container runtime of your choice. Note that commands in this guide are Docker-specific. if you use another container runtime, make sure to use the respective commands.
*   To check the Java (JDK) and Python versions included in the container, use the following command, (where `cisco-nso-prod:6.5` is the image you want to check):

    <pre class="language-bash" data-title="Example: Check Java and Python Versions of Container"><code class="lang-bash">docker run --rm cisco-nso-prod:6.5 sh -c "java -version &#x26;&#x26; python --version"
    </code></pre>

{% hint style="info" %}
Docker on Mac uses a Linux VM to run the Docker engine, which is compatible with the normal Docker images built for Linux. You do not need to recompile your NSO-in-Docker images when moving between a Linux machine and Docker on Mac as they both essentially run Docker on Linux.
{% endhint %}

## Administrative Information <a href="#d5e8371" id="d5e8371"></a>

This section covers the necessary administrative information about the NSO Production Image.

### Migrate to Containerized NSO Setup <a href="#sec.migrate-to-containerizednso" id="sec.migrate-to-containerizednso"></a>

If you have NSO installed as a System Install, you can migrate to the Containerized NSO setup by following the instructions in this section. Migrating your Network Services Orchestrator (NSO) to a containerized setup can provide numerous benefits, including improved scalability, easier version management, and enhanced isolation of services.

The migration process is designed to ensure a smooth transition from a System-Installed NSO to a container-based deployment. Detailed steps guide you through preparing your existing environment, exporting the necessary configurations and state data, and importing them into your new containerized NSO instance. During the migration, consider the container runtime you plan to use, as this impacts the migration process.

**Before You Start**

* We recommend reading through this guide to understand better the expectations, requirements, and functioning aspects of a containerized deployment.
* Verify the compatibility of your current system configurations with the containerized NSO setup. See [System Requirements](containerized-nso.md#sec.system-reqs) for more information.
* Note that [NSO runs from a non-root user ](containerized-nso.md#nso-runs-from-a-non-root-user)with the containerized NSO setup[.](containerized-nso.md#nso-runs-from-a-non-root-user)
* Determine and install the container orchestration tool you plan to use (e.g., Docker, etc.).
* Ensure that your current NSO installation is fully operational and backed up and that you have a clear rollback strategy in case any issues arise. Pay special attention to customizations and integrations that your current NSO setup might have, and verify their compatibility with the containerized version of NSO.
* Have a contingency plan in place for quick recovery in case any issues are encountered during migration.

**Migration Steps**

Prepare:

1. Document your current NSO environment's specifics, including custom configurations and packages.
2. Perform a complete backup of your existing NSO instance, including configurations, packages, and data.
3. Set up the container environment and download/extract the NSO production image. See [Downloading and Extracting the Images](containerized-nso.md#sec.fetch-images) for details.

Migrate:

1. Stop the current NSO instance.
2. Save the run directory from the NSO instance in an appropriate place.
3.  Use the same `ncs.conf` and High Availability (HA) setup previously used with your System Install. We assume that the `ncs.conf` follows the best practice and uses the `NCS_DIR`, `NCS_RUN_DIR`, `NCS_CONFIG_DIR`, and `NCS_LOG_DIR` variables for all paths. The `ncs.conf` can be added to a volume and mounted to `/nso/etc` in the container.

    ```bash
    docker container create --name temp -v NSO-evol:/nso/etc hello-world
    docker cp ncs.conf temp:/nso/etc
    docker rm temp
    ```
4.  Add the run directory as a volume, mounted to `/nso/run` in the container and copy the CDB data, packages, etc., from the previous System Install instance.

    ```bash
    cd path-to-previous-run-dir
    docker container create --name temp -v NSO-rvol:/nso/run hello-world
    docker cp . temp:/nso/run
    docker rm temp
    ```
5.  Create a volume for the log directory.

    ```bash
    docker volume create --name NSO-lvol
    ```
6.  Start the container. Example:

    ```bash
    docker run -v NSO-rvol:/nso/run -v NSO-evol:/nso/etc -v NSO-lvol:/log -itd \
    --name cisco-nso -e EXTRA_ARGS=--with-package-reload -e ADMIN_USERNAME=admin \
    -e ADMIN_PASSWORD=admin cisco-nso-prod:6.4
    ```

Finalize:

1. Ensure that the containerized NSO instance functions as expected and validate system operations.
2. Plan and execute your cutover transition from the System-Installed NSO to the containerized version with minimal disruption.
3. Monitor the new setup thoroughly to ensure stability and performance.

### `ncs.conf` File Configuration and Preference <a href="#ug.admin_guide.containers.ncs" id="ug.admin_guide.containers.ncs"></a>

The `run-nso.sh` script runs a check at startup to determine which `ncs.conf` file to use. The order of preference is as below:

1. The `ncs.conf` file specified in the Dockerfile (i.e., `ENV $NCS_CONFIG_DIR /etc/ncs/`) is used as the first preference.
2. The second preference is to use the `ncs.conf` file mounted in the `/nso/etc/` run directory.
3. If no `ncs.conf` file is found at either `/etc/ncs` or `/nso/etc`, the default `ncs.conf` file provided with the NSO image in `/defaults` is used.

{% hint style="info" %}
If the `ncs.conf` file is edited after startup, it can be reloaded using MAAPI `reload_config()`. Example: `$ ncs_cmd -c "reload"`.
{% endhint %}

{% hint style="info" %}
The default `ncs.conf` file in `/defaults` has a set of environment variables that can be used to enable interfaces (all interfaces are disabled by default) which is useful when spinning up the Production container for quick testing. An interface can be enabled by setting the corresponding environment variable to `true`.

* `NCS_CLI_SSH`: Enables CLI over SSH on port `2024`.
* `NCS_WEBUI_TRANSPORT_TCP`: Enables JSON-RPC and RESTCONF over TCP on port `8080`.
* `NCS_WEBUI_TRANSPORT_SSL`: Enables JSON-RPC and RESTCONF over SSL/TLS on port `8888`.
* `NCS_NETCONF_TRANSPORT_SSH`: Enables NETCONF over SSH on port `2022`.
* `NCS_NETCONF_TRANSPORT_TCP`: Enables NETCONF over TCP on port `2023`.
{% endhint %}

### Pre- and Post-Start Scripts <a href="#d5e8475" id="d5e8475"></a>

If you need to perform operations before or after the `ncs` process is started in the Production container, you can use Python and/or Bash scripts to achieve this. Add the scripts to the `$NCS_CONFIG_DIR/pre-ncs-start.d/` and `$NCS_CONFIG_DIR/post-ncs-start.d/` directories to have the `run-nso.sh` script run them.

### NSO Runs from a Non-Root User

NSO is installed with the `--run-as-user` option for build and production containers to run NSO from the non-root `nso` user that belongs to the `nso` user group.

When migrating from container versions where NSO has `root` privilege, ensure the `nso` user owns or has access rights to the required files and directories. Examples include application directories, SSH host keys, SSH keys used to authenticate with devices, etc. See the deployment example variant referenced by the [examples.ncs/getting-started/netsim-sshkey/README.md](https://github.com/NSO-developer/nso-examples/tree/6.6/getting-started/netsim-sshkey) for an example.

The NSO container runs a script called `take-ownership.sh` as part of its startup, which takes ownership of all the directories that NSO needs. The script will be one of the first things to run. The script can be overridden to take ownership of even more directories, such as mounted volumes or bind mounts.

### Admin User Creation <a href="#d5e8482" id="d5e8482"></a>

An admin user can be created on startup by the run script in the container. Three environment variables control the addition of an admin user:

* `ADMIN_USERNAME`: Username of the admin user to add, default is `admin`.
* `ADMIN_PASSWORD`: Password of the admin user to add.
* `ADMIN_SSHKEY`: Private SSH key of the admin user to add.

As `ADMIN_USERNAME` already has a default value, only `ADMIN_PASSWORD`, or `ADMIN_SSHKEY` need to be set in order to create an admin user. For example:

```bash
docker run -itd --name cisco-nso -e ADMIN_PASSWORD=admin cisco-nso-prod:6.4
```

This can be useful when starting up a container in CI for testing or development purposes. It is typically not required in a production environment where CDB already contains the required user accounts.

{% hint style="info" %}
When using a permanent volume for CDB, and restarting the NSO container multiple times with a different `ADMIN_USERNAME` or `ADMIN_PASSWORD`, the start script uses these environment variables to generate an XML file named `add_admin_user.xml`. The generated XML file is added to the CDB directory to be read at startup. But if the persisted CDB configuration file already exists in the CDB directory, NSO will not load any XML files at startup, instead the generated `add_admin_user.xml` in the CDB directory needs to be loaded manually.
{% endhint %}

{% hint style="info" %}
The default `ncs.conf` file performs authentication using only the Linux PAM, with local authentication disabled. For the `ADMIN_USERNAME`, `ADMIN_PASSWORD`, and `ADMIN_SSHKEY` variables to take effect, NSO's local authentication, in `/ncs-conf/aaa/local-authentication`, needs to be enabled. Alternatively, you can create a local Linux admin user that is authenticated by NSO using Linux PAM.
{% endhint %}

### Exposing Ports <a href="#sec.exposed_ports" id="sec.exposed_ports"></a>

The default `ncs.conf` NSO configuration file does not enable any northbound interfaces, and no ports are exposed externally to the container. Ports can be exposed externally of the container when starting the container with the northbound interfaces and their ports correspondingly enabled in `ncs.conf`.

### Backup and Restore <a href="#d5e8524" id="d5e8524"></a>

The backup behavior of running NSO in vs. outside the container is largely the same, except that when running NSO in a container, the SSH and SSL certificates are not included in the backup produced by the `ncs-backup` script. This is different from running NSO outside a container where the default configuration path `/etc/ncs` is used to store the SSH and SSL certificates, i.e., `/etc/ncs/ssh` for SSH and `/etc/ncs/ssl` for SSL.

**Take a Backup**

Let's assume we start a production image container using:

```bash
docker run -d --name cisco-nso -v NSO-vol:/nso -v NSO-log-vol:/log cisco-nso-prod:6.4
```

To take a backup:

*   Run the `ncs-backup` command. The backup file is written to `/nso/run/backups`.

    ```bash
    docker exec -it cisco-nso ncs-backup
    INFO  Backup /nso/run/backups/ncs-6.4@2024-11-03T11:31:07.backup.gz created successfully
    ```

**Restore a Backup**

To restore a backup, NSO must be stopped. As you likely only have access to the `ncs-backup` tool, the volume containing CDB and other run-time data from inside of the NSO container, this poses a slight challenge. Additionally, shutting down NSO will terminate the NSO container.

To restore a backup:

1.  Shut down the NSO container:

    ```bash
    docker stop cisco-nso
    docker rm cisco-nso
    ```
2.  Run the `ncs-backup --restore` command. Start a new container with the same persistent shared volumes mounted but with a different command. Instead of running the `/run-nso.sh`, which is the normal command of the NSO container, run the `restore` command.

    ```bash
    docker run -u root -it --rm -v NSO-vol:/nso -v NSO-log-vol:/log \
    --entrypoint ncs-backup cisco-nso-prod:6.4 \
    --restore /nso/run/backups/ncs-6.4@2024-11-03T11:31:07.backup.gz

    Restore /etc/ncs from the backup (y/n)? y
    Restore /nso/run from the backup (y/n)? y
    INFO  Restore completed successfully
    ```
3.  Restoring an NSO backup should move the current run directory (`/nso/run` to `/nso/run.old`) and restore the run directory from the backup to the main run directory (`/nso/run`). After this is done, start the regular NSO container again as usual.\\

    ```bash
    docker run -d --name cisco-nso -v NSO-vol:/nso -v NSO-log-vol:/log cisco-nso-prod:6.4
    ```

### SSH Host Key <a href="#d5e8566" id="d5e8566"></a>

The NSO image `/run-nso.sh` script looks for an SSH host key named `ssh_host_ed25519_key` in the `/nso/etc/ssh` directory to be used by the NSO built-in SSH server for the CLI and NETCONF interfaces.

If an SSH host key exists, which is for a typical production setup stored in a persistent shared volume, it remains the same after restarts or upgrades of NSO. If no SSH host key exists, the script generates a private and public key.

In a high-availability (HA) setup, the host key is typically shared by all NSO nodes in the HA group and stored in a persistent shared volume. This is done to avoid fetching the public host key from the new primary after each failover.

### HTTPS TLS Certificate <a href="#d5e8574" id="d5e8574"></a>

NSO expects to find a TLS certificate and key at `/nso/ssl/cert/host.cert` and `/nso/ssl/cert/host.key` respectively. Since the `/nso` path is usually on persistent shared volume for production setups, the certificate remains the same across restarts or upgrades.

If no certificate is present, one will be generated. It is a self-signed certificate valid for 30 days making it possible to use both in development and staging environments. It is not meant for the production environment. You should replace it with a properly signed certificate for production and it is encouraged to do so even for test and staging environments. Simply generate one and place it at the provided path, for example using the following, which is the command used to generate the temporary self-signed certificate:

```
openssl req -new -newkey rsa:4096 -x509 -sha256 -days 30 -nodes \
-out /nso/ssl/cert/host.cert -keyout /nso/ssl/cert/host.key \
-subj "/C=SE/ST=NA/L=/O=NSO/OU=WebUI/CN=Mr. Self-Signed"
```

### YANG Model Changes (destructive) <a href="#d5e8584" id="d5e8584"></a>

The database in NSO, called CDB, uses YANG models as the schema for the database. It is only possible to store data in CDB according to the YANG models that define the schema.

If the YANG models are changed, particularly if the nodes are removed or renamed (rename is the removal of one leaf and an addition of another), any data in CDB for those leaves will also be removed. NSO normally warns about this when you attempt to load new packages, for example, `request packages reload` command refuses to reload the packages if the nodes in the YANG model have disappeared. You would then have to add the **force** argument, e.g., `request packages reload force`.

### Health Check <a href="#d5e8591" id="d5e8591"></a>

The base Production Image comes with a basic container health check. It uses `ncs_cmd` to get the state that NCS is currently in. Only the result status is observed to check if `ncs_cmd` was able to communicate with the `ncs` process. The result indicates if the `ncs` process is responding to IPC requests.

{% hint style="info" %}
The default `--health-start-period duration` in health check is set to 60 seconds. NSO will report an `unhealthy` state if it takes more than 60 seconds to start up. To resolve this, set the `--health-start-period duration` value to a relatively higher value, such as 600 seconds, or however long you expect NSO will take to start up.

To disable the health check, use the `--no-healthcheck` command.
{% endhint %}

### NSO System Dump and Enable Strict Overcommit Accounting on the Host <a href="#d5e8605" id="d5e8605"></a>

By default, the Linux kernel allows overcommit of memory. However, memory overcommit produces an unexpected and unreliable environment for NSO since the Linux Out‑Of‑Memory (OOM) killer may terminate NSO without restarting it if the system is critically low on memory.

Also, when the OOM-killer terminates NSO, NSO will not produce a system dump file, and the debug information will be lost. Thus, it is strongly recommended that overcommit is disabled with Linux NSO production container hosts with an overcommit ratio of less than 100% (max). Use a 5% headroom (overcommit\_ratio≈95 when no swap) or increase if the host runs additional services. Or use vm.overcommit\_kbytes for a fixed CommitLimit.

See [Step - 4. Run the Installer](system-install.md#si.run.the.installer) in System Install for information on memory overcommit recommendations for a Linux system hosting NSO production containers.

{% hint style="info" %}
By default, NSO writes a system dump to the NSO run-time directory, default `NCS_RUN_DIR=/nso/run`. If the `NCS_RUN_DIR` is not pointing to a persistent, host‑mounted volume so dumps survive container restarts or to give the NSO system dump file a unique name, the `NCS_DUMP="/path/to/mounted/dir/ncs_crash.dump.$(date +%Y%m%d-%H%M%S)"` variable needs to be set.
{% endhint %}

#### Recommended: Host Configured for Strict Overcommit

With the host configured for strict overcommit (`vm.overcommit_memory=2`), containers inherit the host’s CommitLimit behavior. Note that `vm.overcommit_memory`, `vm.overcommit_ratio`, and `vm.overcommit_kbytes` are host‑global and cannot be set per container. These `vm.*` settings are configured on the host and apply to all containers.

* Optionally use the `docker run` command to set memory limits and swap:
  * Use `--memory=<ram>` to cap the container’s RAM.
  * Set `--memory-swap=<ram>` equal to `--memory` to effectively disable swap for the container.
  * If swap must be enabled, use a fast disk, for example, an NVMe SSD.

#### **Alternative: Heuristic Overcommit Mode**

The alternative, using heuristic overcommit mode, can be useful if the NSO host has severe memory limitations. For example, if RAM sizing for the NSO host did not take into account that the schema (from YANG models) is loaded into memory by NSO Python and Java packages affecting total committed memory (Committed\_AS) and after considering the recommendations in [CDB Stores the YANG Model Schema](../../development/advanced-development/scaling-and-performance-optimization.md#d5e8743).

As an alternative to the recommended strict mode, `vm.overcommit_memory=2`, you can keep `vm.overcommit_memory=0` configured on the host to allow overcommit of memory and trigger `ncs --debug-dump` when Committed\_AS reaches, for example, 95% of CommitLimit or when the container’s cgroup memory usage reaches, for example, 90% of its cap.

* This approach does not prevent the Linux OOM-killer from killing NSO or the container; it only attempts to capture diagnostic data before memory pressure becomes critical. OOM kills can occur even when Committed\_AS < CommitLimit due to cgroup limits or reclaim failure.
* The same `docker run` memory and swap options as above can be used.
* Monitor the Committed\_AS vs CommitLimit and cgroup memory usage vs cap using, for example, a script or an observability tool.
  * Note that Committed\_AS and CommitLimit from `/proc/meminfo` are host‑wide values. Inside a container, they reflect the host, not the container’s cgroup budget.
  * cgroup memory.current vs memory.max is the primary predictor for container OOM events; the host CommitLimit is an additional early‑warning signal.
* Ensure the user running the monitor has permission to execute `ncs --debug-dump` and write to the chosen dump directory.

{% code title="Simple example of an NSO debug-dump monitor inside a container" overflow="wrap" %}
```bash
#!/usr/bin/env bash
# Simple NSO debug-dump monitor inside a container (vm.overcommit_memory=0 on host).
# Triggers ncs --debug-dump when Committed_AS reaches 95% of CommitLimit
# or when the container’s cgroup memory usage reaches 90% of its cap.

THRESHOLD_PCT=95         # CommitLimit threshold (5% headroom).
CGROUP_THRESHOLD_PCT=90  # Trigger when memory.current >= 90% of memory.max.
POLL_INTERVAL=5          # Seconds between checks.
PROCESS_CHECK_INTERVAL=30
DUMP_COUNT=10
DUMP_DELAY=10
DUMP_PREFIX="dump"

command -v ncs >/dev/null 2>&1 || { echo "ncs command not found in PATH."; exit 1; }

find_nso_pid() {
  pgrep -x ncs.smp | head -n1 || true
}

read_cgroup_mem_kb() {
  # Outputs: current_kb max_kb (max_kb=0 if unlimited or not found)
  if [ -r /sys/fs/cgroup/memory.current ]; then
    local cur max
    cur=$(cat /sys/fs/cgroup/memory.current 2>/dev/null)
    max=$(cat /sys/fs/cgroup/memory.max 2>/dev/null)
    [ "$max" = "max" ] && max=0
    echo "$((cur/1024)) $((max/1024))"
  else
    echo "0 0"
  fi
}

while true; do
  pid="$(find_nso_pid)"
  if [ -z "${pid:-}" ]; then
    echo "NSO not running; retry in ${PROCESS_CHECK_INTERVAL}s..."
    sleep "$PROCESS_CHECK_INTERVAL"
    continue
  fi

  committed="$(awk '/Committed_AS:/ {print $2}' /proc/meminfo)"
  commit_limit="$(awk '/CommitLimit:/ {print $2}' /proc/meminfo)"
  if [ -z "$committed" ] || [ -z "$commit_limit" ]; then
    echo "Unable to read /proc/meminfo; retry in ${POLL_INTERVAL}s..."
    sleep "$POLL_INTERVAL"
    continue
  fi

  threshold=$(( commit_limit * THRESHOLD_PCT / 100 ))
  read cg_current_kb cg_max_kb < <(read_cgroup_mem_kb)
  cgroup_trigger=0
  if [ "${cg_max_kb:-0}" -gt 0 ]; then
    cgroup_pct=$(( cg_current_kb * 100 / cg_max_kb ))
    [ "$cgroup_pct" -ge "$CGROUP_THRESHOLD_PCT" ] && cgroup_trigger=1
    echo "PID=${pid} Committed_AS=${committed}kB; CommitLimit=${commit_limit}kB; Threshold=${threshold}kB; cgroup=${cg_current_kb}kB/${cg_max_kb}kB (${cgroup_pct}%)."
  else
    echo "PID=${pid} Committed_AS=${committed}kB; CommitLimit=${commit_limit}kB; Threshold=${threshold}kB; cgroup=unlimited."
  fi

  if [ "$committed" -ge "$threshold" ] || [ "$cgroup_trigger" -eq 1 ]; then
    echo "Threshold crossed; collecting ${DUMP_COUNT} debug dumps..."
    for i in $(seq 1 "$DUMP_COUNT"); do
      file="${DUMP_PREFIX}.${i}.bin"
      echo "Dump $i -> ${file}"
      if ! ncs --debug-dump "$file"; then
        echo "Debug dump $i failed."
      fi
      sleep "$DUMP_DELAY"
    done
    echo "All debug dumps completed; exiting."
    exit 0
  fi

  sleep "$POLL_INTERVAL"
done
```
{% endcode %}

### Startup Arguments

The `/nso-run.sh` script that starts NSO is executed as an `ENTRYPOINT` instruction and the `CMD` instruction can be used to provide arguments to the entrypoint-script. Another alternative is to use the `EXTRA_ARGS` variable to provide arguments. The `/nso-run.sh` script will first check the `EXTRA_ARGS` variable before the `CMD` instruction.

An example using `docker run` with the `CMD` instruction:

```bash
docker run --name nso -itd cisco-nso-prod:6.4 --with-package-reload \
--ignore-initial-validation
```

With the `EXTRA_ARGS` variable:

```bash
docker run --name nso \
-e EXTRA_ARGS='--with-package-reload --ignore-initial-validation' \
-itd cisco-nso-prod:6.4
```

An example using a Docker Compose file, `compose.yaml`, with the `CMD` instruction:

```
services:
    nso:
        image: cisco-nso-prod:6.4
        container_name: nso
        command:
            - --with-package-reload
            - --ignore-initial-validation
```

With the `EXTRA_ARGS` variable:

```
services:
    nso:
        image: cisco-nso-prod:6.4
        container_name: nso
        environment:
            - EXTRA_ARGS=--with-package-reload --ignore-initial-validation
```

## Examples <a href="#d5e8625" id="d5e8625"></a>

This section provides examples to exhibit the use of NSO images.

### Running the Production Image using Docker CLI

This example shows how to run the standalone NSO Production Image using the Docker CLI.

The instructions and CLI examples used in this example are Docker-specific. If you are using a non-Docker container runtime, you will need to: fetch the NSO image from the Cisco software download site, then load and run the image with packages and networking, and finally log in to NSO CLI to run commands.

If you intend to run multiple images (i.e., both Production and Build), Docker Compose is a tool that simplifies defining and running multi-container Docker applications. See the example ([Running the NSO Images using Docker Compose](containerized-nso.md#sec.example-docker-compose)) below for detailed instructions.

**Steps**

Follow the steps below to run the Production Image using Docker CLI:

1. Start your container engine.
2. Next, load the image and run it. Navigate to the directory where you extracted the base image and load it. This will restore the image and its tag:

```bash
docker load -i nso-6.4.container-image-prod.linux.x86_64.tar.gz
```

3. Start a container from the image. Supply additional arguments to mount the packages and `ncs.conf` as separate volumes ([`-v` flag](https://docs.docker.com/engine/reference/commandline/run/)), and publish ports for networking ([`-p` flag](https://docs.docker.com/engine/reference/commandline/run/)) as needed. The container starts NSO using the `/run-nso.sh` script. To understand how the `ncs.conf` file is used, see [`ncs.conf` File Configuration and Preference](containerized-nso.md#ug.admin_guide.containers.ncs).

```bash
docker run -itd --name cisco-nso \
-v NSO-vol:/nso \
-v NSO-log-vol:/log \
--net=host \
-e ADMIN_USERNAME=admin \
-e ADMIN_PASSWORD=admin \
cisco-nso-prod:6.4
```

{% hint style="warning" %}
**Overriding Environment Variables**

Overriding basic environment variables (`NCS_CONFIG_DIR`, `NCS_LOG_DIR`, `NCS_RUN_DIR`, etc.) is not supported and therefore should be avoided. Using, for example, the `NCS_CONFIG_DIR` environment variable to mount a configuration directory will result in an error. Instead, to mount your configuration directory, do it appropriately in the correct place, which is under `/nso/etc`.
{% endhint %}

<details>

<summary>Examples: Running the Image with and without Named Volumes</summary>

The following examples show how to run the image with and without named volumes.

**Running without a named volume**: This is the minimal way of running the image but does not provide any persistence when the container is destroyed.

```bash
docker run -itd --name cisco-nso \
-p 8888:8888 \
-e ADMIN_USERNAME=admin\
-e ADMIN_PASSWORD=admin\
cisco-nso-prod
```

**Running with a single named volume**: This way provides persistence for the NSO mount point with a `NSO-vol` volume. Logs, however, are not persistent.

```bash

docker run -itd --name cisco-nso \
-v NSO-vol:/nso \
-p 8888:8888 \
-e ADMIN_USERNAME=admin\
-e ADMIN_PASSWORD=admin\
cisco-nso-prod
```

\
**Running with two named volumes**: This way provides full persistence for both the NSO and the log mount points.

```bash
docker run -itd --name cisco-nso \
-v NSO-vol:/nso \
-v NSO-log-vol:/log \
-p 8888:8888 \
-e ADMIN_USERNAME=admin\
-e ADMIN_PASSWORD=admin\
cisco-nso-prod
```

</details>

{% hint style="info" %}
**Loading the Packages**

* Loading the packages by mounting the default load path `/nso/run` as a volume is preferred. You can also load the packages by copying them manually into the `/nso/run/packages` directory in the container. During development, a bind mount of the package directory on the host machine makes it easy to update packages in NSO by simply changing the packages on the host.
*   The default load path is configured in the `ncs.conf` file as `$NCS_RUN_DIR/packages`, where `$NCS_RUN_DIR` expands to `/nso/run` in the container. To find the load path, check the `ncs.conf` file in the `/etc/ncs/` directory.

    ```xml
    <load-path>
    <dir>${NCS_RUN_DIR}/packages</dir>
    <dir>${NCS_DIR}/etc/ncs</dir>
    ...
    </load-path>
    ```
{% endhint %}

{% hint style="info" %}
**Logging**

* With the Production Image, use a shared volume to persist data across restarts. If remote (Syslog) logging is used, there is little need to persist logs. If local logging is used, then persistent logging is recommended.
* NSO starts a cron job to handle logrotate of NSO logs by default. i.e., the `CRON_ENABLE` and `LOGROTATE_ENABLE` variables are set to `true` using the `/etc/logrotate.conf` configuration. See the `/etc/ncs/post-ncs-start.d/10-cron-logrotate.sh` script. To set how often the cron job runs, use the crontab file.
{% endhint %}

4. Finally, log in to NSO CLI to run commands. Open an interactive shell on the running container and access the NSO CLI.

```bash
docker exec -it cisco-nso bash
#  ncs_cli -u admin
admin@ncs>
```

You can also use the `docker exec -it cisco-nso ncs_cli -u admin` command to access the CLI from the host's terminal.

### Upgrading NSO using Docker CLI <a href="#d5e8715" id="d5e8715"></a>

This example describes how to upgrade your NSO to run a newer NSO version in the container. The overall upgrade process is outlined in the steps below. In the example below, NSO is to be upgraded from version 6.3 to 6.4.

To upgrade your NSO version:

1.  Start a container with the `docker run` command. In the example below, it mounts the `/nso` directory in the container to the `NSO-vol` named volume to persist the data. Another option is using a bind mount of the directory on the host machine. At this point, the `/cdb` directory is empty.

    ```bash
    docker run -itd -—name cisco-nso -v NSO-vol:/nso cisco-nso-prod:6.3
    ```
2.  Perform a backup, either by running the `docker exec` command (make sure that the backup is placed somewhere we have mounted) or by creating a tarball of `/data/nso` on the host machine.

    ```bash
    docker exec -it cisco-nso ncs-backup
    ```
3.  Stop the NSO by issuing the following command, or by stopping the container itself which will run the `ncs stop` command automatically.

    ```bash
    docker exec -it cisco-nso ncs --stop 
    ```
4.  Remove the old NSO.

    ```bash
    docker rm -f cisco-nso
    ```
5.  Start a new container and mount the `/nso` directory in the container to the `NSO-vol` named volume. This time the `/cdb` folder is not empty, so instead of starting a fresh NSO, an upgrade will be performed.

    ```bash
    docker run -itd --name cisco-nso -v NSO-vol:/nso cisco-nso-prod:6.4
    ```

At this point, you only have one container that is running the desired version 6.4 and you do not need to uninstall the old NSO.

### Running the NSO Images using Docker Compose <a href="#sec.example-docker-compose" id="sec.example-docker-compose"></a>

This example covers the necessary information to manifest the use of NSO images to compile packages and run NSO. Using Docker Compose is not a requirement, but a simple tool for defining and running a multi-container setup where you want to run both the Production and Build images in an efficient manner.

#### **Packages**

The packages used in this example are taken from the [examples.ncs/getting-started/netsim-sshkey](https://github.com/NSO-developer/nso-examples/tree/6.6/getting-started/netsim-sshkey) example:

* `distkey`: A simple Python + template service package that automates the setup of SSH public key authentication between netsim (ConfD) devices and NSO using a nano service.
* `ne`: A NETCONF NED package representing a netsim network element that implements a configuration subscriber Python application that adds or removes the configured public key, which the netsim (ConfD) network element checks when authenticating public key authentication clients.

#### **`docker-compose.yaml` - Docker Compose File Example**

A basic Docker Compose file is shown in the example below. It describes the containers running on a machine:

* The Production container runs NSO.
* The Build container builds the NSO packages.
* A third `example` container runs the netsim device.

Note that the packages use a shared volume in this simple example setup. In a more complex production environment, you may want to consider a dedicated redundant volume for your packages.

```
                version: '1.0'
                volumes:
                  NSO-1-rvol:

                networks:
                  NSO-1-net:

                services:
                  NSO-1:
                    image: cisco-nso-prod:6.4
                    container_name: nso1
                    profiles:
                      - prod
                    environment:
                      - EXTRA_ARGS=--with-package-reload
                      - ADMIN_USERNAME=admin
                      - ADMIN_PASSWORD=admin
                    networks:
                      - NSO-1-net
                    ports:
                      - "2024:2024"
                      - "8888:8888"
                    volumes:
                      - type: bind
                        source: /path/to/packages/NSO-1
                        target: /nso/run/packages
                      - type: bind
                        source: /path/to/log/NSO-1
                        target: /log
                      - type: volume
                        source: NSO-1-rvol
                        target: /nso
                    healthcheck:
                      test: ncs_cmd -c "wait-start 2"
                      interval: 5s
                      retries: 5
                      start_period: 10s
                      timeout: 10s

                  BUILD-NSO-PKGS:
                    image: cisco-nso-build:6.4
                    container_name: build-nso-pkgs
                    network_mode: none
                    profiles:
                      - build
                    volumes:
                      - type: bind
                        source: /path/to/packages/NSO-1
                        target: /nso/run/packages

                  EXAMPLE:
                    image: cisco-nso-prod:6.4
                    container_name: ex-netsim
                    profiles:
                      - example
                    networks:
                      - NSO-1-net
                    healthcheck:
                      test: test -f /nso-run-prod/etc/ncs.conf && ncs-netsim --dir /netsim is-alive ex0
                      interval: 5s
                      retries: 5
                      start_period: 10s
                      timeout: 10s
                      entrypoint: bash
                    command: -c 'rm -rf /netsim
                        && mkdir /netsim
                        && ncs-netsim --dir /netsim create-network /network-element 1 ex
                        && PYTHONPATH=/opt/ncs/current/src/ncs/pyapi ncs-netsim --dir
                            /netsim start
                        && mkdir -p /nso-run-prod/run/cdb
                        && echo "<devices xmlns=\"http://tail-f.com/ns/ncs\">
                            <authgroups><group><name>default</name>
                            <umap><local-user>admin</local-user>
                            <remote-name>admin</remote-name><remote-password>
                            admin</remote-password></umap></group>
                            </authgroups></devices>"
                            > /nso-run-prod/run/cdb/init1.xml
                        && ncs-netsim --dir /netsim ncs-xml-init >
                            /nso-run-prod/run/cdb/init2.xml
                        && sed -i.orig -e "s|127.0.0.1|ex-netsim|"
                            /nso-run-prod/run/cdb/init2.xml
                        && mkdir -p /nso-run-prod/etc
                        && sed -i.orig -e "s|</cli>|<style>c</style>
                            </cli>|" -e "/<ssh>/{n;s|<enabled>false
                                </enabled>|
                                <enabled>true</enabled>|}" defaults/ncs.conf
                        && sed -i.bak -e "/<local-authentication>/{n;s|
                            <enabled>false</enabled>|<enabled>true
                            </enabled>|}" defaults/ncs.conf
                        && sed "/<ssl>/{n;s|<enabled>false</enabled>|
                            <enabled>true</enabled>|}" defaults/ncs.conf
                            > /nso-run-prod/etc/ncs.conf
                        && mv defaults/ncs.conf.orig defaults/ncs.conf
                        && tail -f /dev/null'
                    volumes:
                      - type: bind
                        source: /path/to/packages/NSO-1/ne
                        target: /network-element
                      - type: volume
                        source: NSO-1-rvol
                        target: /nso-run-prod
```

<details>

<summary>Explanation of the Docker Compose File</summary>

A description of noteworthy Compose file items is given below.

* **`profiles`**: Profiles can be used to group containers in a Compose file, and they work perfectly for the Production, Build, and netsim containers. By adding multiple containers on the same machine (as a developer normally would), you can easily start the Production, Build, and netsim containers using their respective profiles (`prod`, `build`, and `example`).
* **The command used in the netsim example**: Creates a directory called `/netsim` where the netsims will be set up, then starts the netsims, followed by generating two `init.xml` files and editing the `ncs.conf` file for the Production container. Finally, it keeps the container running. If you want this to be more elegant, you need a netsim container image with a script in it that is well-documented.
*   **`volumes`**: The Production and Build images are configured intentionally to have the same bind mount with `/path/to/packages/NSO-1` as the source and `/nso/run/packages` as the target. The Production Image mounts both the `/log` and `/nso` directories in the container. The `/log` directory is simply a bind mount, while the `/nso` directory is an actual volume.

    \
    Named volumes are recommended over bind mounts as described by the Docker Volumes documentation. The NSO `/run` directory should therefore be mounted as a named volume. However, you can make the `/run` directory a bind mount as well.

    The Compose file, typically named `docker-compose.yaml`, declares a volume called `NSO-1-rvol`. This is a named volume and will be created automatically by Compose. You can create this volume externally, at which point this volume must be declared as external. If the external volume doesn't exist, the container will not start.

    \
    The `example` netsim container will mount the network element NED in the packages directory. This package should be compiled. Note that the `NSO-1-rvol` volume is used by the `example` container to share the generated `init.xml` and `ncs.conf` files with the NSO Production container.
* **`healthcheck`**: The image comes with its own health check (similar to the one shown here in Compose), and this is how you configure it yourself. The health check for the netsim `example` container checks if the `ncs.conf` file has been generated, and the first Netsim instance started in the container. You could, in theory, start more netsims inside the container.

</details>

#### **Steps**

Follow the steps below to run the images using Docker Compose:

1.  Start the Build container. This starts the services in the Compose file with the profile `build`.

    ```bash
    docker compose --profile build up -d
    ```
2.  Copy the packages from the `netsim-sshkey` example and compile them in the NSO Build container. The easiest way to do this is by using the `docker exec` command, which gives more control over what to build and the order of it. You can also do this with a script to make it easier and less verbose. Normally you populate the package directory from the host. Here, we use the packages from an example.

    ```bash
    docker exec -it build-nso-pkgs sh -c 'cp -r ${NCS_DIR}/examples.ncs/getting-started \
        /netsim-sshkey/packages ${NCS_RUN_DIR}'

    docker exec -it build-nso-pkgs sh -c 'for f in ${NCS_RUN_DIR}/packages/*/src; \
        do make -C "$f" all || exit 1; done'
    ```
3.  Start the netsim container. This outputs the generated `init.xml` and `ncs.conf` files to the NSO Production container. The `--wait` flag instructs to wait until the health check returns healthy.

    ```bash
    docker compose --profile example up --wait
    ```
4.  Start the NSO Production container.

    ```bash
    docker compose --profile prod up --wait
    ```

    \
    At this point, NSO is ready to run the service example to configure the netsim device(s). A bash script (`demo.sh`) that runs the above steps and showcases the `netsim-sshkey` example is given below:

    ```
    #!/bin/bash
    set -eu # Abort the script if a command returns with a non-zero exit code or if
            # a variable name is dereferenced when the variable hasn't been set
    GREEN='\033[0;32m'
    PURPLE='\033[0;35m'
    NC='\033[0m' # No Color

    printf "${GREEN}##### Reset the container setup\n${NC}";
    docker compose --profile build down
    docker compose --profile example down -v
    docker compose --profile prod down -v
    rm -rf ./packages/NSO-1/* ./log/NSO-1/*

    printf "${GREEN}##### Start the build container used for building the NSO NED
        and service packages\n${NC}"
    docker compose --profile build up -d

    printf "${GREEN}##### Get the packages\n${NC}"
    printf "${PURPLE}##### NOTE: Normally you populate the package directory from the host.
    Here, we use packages from an NSO example\n${NC}"
    docker exec -it build-nso-pkgs sh -c 'cp -r
     ${NCS_DIR}/examples.ncs/getting-started/netsim-sshkey/packages ${NCS_RUN_DIR}'

    printf "${GREEN}##### Build the packages\n${NC}"
    docker exec -it build-nso-pkgs sh -c 'for f in ${NCS_RUN_DIR}/packages/*/src;
        do make -C "$f" all || exit 1; done'

    printf "${GREEN}##### Start the simulated device container and setup the example\n${NC}"
    docker compose --profile example up --wait

    printf "${GREEN}##### Start the NSO prod container\n${NC}"
    docker compose --profile prod up --wait

    printf "${GREEN}##### Showcase the netsim-sshkey example from NSO on the prod container\n${NC}"
    if [[ $# -eq 0 ]] ; then # Ask for input only if no argument was passed to this script
        printf "${PURPLE}##### Press any key to continue or ctrl-c to exit\n${NC}"
        read -n 1 -s -r
    fi
    docker exec -it nso1 sh -c 'sed -i.orig -e "s/make/#make/"
     ${NCS_DIR}/examples.ncs/getting-started/netsim-sshkey/showcase.sh'
    docker exec -it nso1 sh -c 'cd ${NCS_RUN_DIR};
     ${NCS_DIR}/examples.ncs/getting-started/netsim-sshkey/showcase.sh 1'
    ```

### Upgrading NSO using Docker Compose <a href="#d5e8861" id="d5e8861"></a>

This example describes how to upgrade NSO when using Docker Compose.

#### **Upgrade to a New Minor or Major Version**

To upgrade to a new minor or major version, for example, from 6.3 to 6.4, follow the steps below:

1. Change the image version in the Compose file to the new version, here 6.4.
2. Run the `docker compose up --profile build -d` command to start the Build container with the new image.
3.  Compile the packages using the Build container.

    ```bash
    docker exec -it build-nso-pkgs sh -c 'for f in
    ${NCS_RUN_DIR}/packages/*/src;do make -C "$f" all || exit 1; done'
    ```
4. Run the `docker compose up --profile prod --wait` command to start the Production container with the new packages that were just compiled.

#### **Upgrade to a New Maintenance Version**

To upgrade to a new maintenance release version, for example, 6.4.1, follow the steps below:

1. Change the image version in the Compose file to the new version, here 6.4.1.
2.  Run the `docker compose up --profile prod --wait` command.

    Upgrading in this way does not require a recompile. Docker detects changes and upgrades the image in the container to the new version.
