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
* Use the Development Image containing the necessary environment for compiling NSO packages.

## Overview of NSO Images <a href="#d5e8294" id="d5e8294"></a>

Cisco provides the following two NSO images based on Red Hat UBI.&#x20;

* [Production Image](containerized-nso.md#production-image)
* [Development Image](containerized-nso.md#development-image)

<table data-full-width="true">
<thead><tr><th width="208">Intended Use</th><th width="139">Develop NSO Packages</th><th width="139">Build NSO Packages</th><th width="114">Run NSO</th><th>NSO Install Type</th></tr></thead>
<tbody>
<tr><td><p>Development Host </p><p><img src="../../images/laptop.png" alt="" data-size="line"></p></td><td><img src="../../images/acknowledge.png" alt="" data-size="line"></td><td><img src="../../images/reject.png" alt="" data-size="line"></td><td><img src="../../images/reject.png" alt="" data-size="line"></td><td>None or Local Install</td></tr>
<tr><td><p>Development Image </p><p><img src="../../images/container.png" alt="" data-size="line"></p></td><td><img src="../../images/reject.png" alt="" data-size="line"></td><td><img src="../../images/acknowledge.png" alt="" data-size="line"></td><td><img src="../../images/reject.png" alt="" data-size="line"></td><td>System Install</td></tr>
<tr><td><p>Production Image </p><p><img src="../../images/container.png" alt="" data-size="line"></p></td><td><img src="../../images/reject.png" alt="" data-size="line"></td><td><img src="../../images/reject.png" alt="" data-size="line"></td><td><img src="../../images/acknowledge.png" alt="" data-size="line"></td><td>System Install</td></tr>
</tbody></table>

{% hint style="info" %}
The Red Hat UBI is an OCI-compliant image that is freely distributable and independent of platform and technical dependencies. You can read more about Red Hat UBI [here](https://www.redhat.com/en/blog/introducing-red-hat-universal-base-image), and about Open Container Initiative (OCI) [here](https://opencontainers.org/faq/).
{% endhint %}

### Production Image

The Production Image is a production-ready NSO image for system-wide deployment and use. It is a pre-built Red Hat UBI-based NSO image created on [System Install](system-install.md) and available from the [Cisco Software Download](https://software.cisco.com/download/home) site.&#x20;

Use the pre-built image as the base image in the container file (e.g., Dockerfile) and mount your own packages (such as NEDs and service packages) to run a final image for your production environment (see examples below).

{% hint style="info" %}
Consult the [Installation](./#d5e46-1) documentation for information on installing NSO on a Docker host, building NSO packages, etc.
{% endhint %}

{% hint style="info" %}
See [Developing and Deploying a Nano Service](../../development/development/developing-nano-services.md) for an example that uses the container to deploy an SSH-key-provisioning nano service.&#x20;

The `$NCS_DIR/examples.ncs/development-guide/nano-services/netsim-sshkey/README` provides a link to the container-based deployment variant of the example. See the `setup_ncip.sh` script and `README` in the `netsim-sshkey` deployment example for details.
{% endhint %}

### Development Image

The Development Image is a separate standalone NSO image with the necessary environment and software for building packages. It is also a pre-built Red Hat UBI-based image provided specifically to address the developer needs of building packages.&#x20;

The image is available as a signed package (e.g., `nso-VERSION.container-image-dev.linux.ARCH.signed.bin`) from the Cisco [Software Download](https://software.cisco.com/download/home) site. You can run the Development Image in different ways, and a simple tool for defining and running multi-container Docker applications is [Docker Compose](https://docs.docker.com/compose/) (see examples below).&#x20;

The container provides the necessary environment to build custom packages. The Development Image adds a few Linux packages that are useful for development, such as Ant, JDK, net-tools, pip, etc. Additional Linux packages can be added using, for example, the `dnf` command. The `dnf list installed` command lists all the installed packages.

## Downloading and Extracting the Images <a href="#sec.fetch-images" id="sec.fetch-images"></a>

To fetch and extract NSO images:

1. On Cisco's official [Software Download](https://software.cisco.com/download/home) site, search for "Network Services Orchestrator". Select the relevant NSO version in the drop-down list, e.g., "Crosswork Network Services Orchestrator 6"**,** and click "Network Services Orchestrator Software". Locate the binary, which is delivered as a signed package (e.g., `nso-6.1.container-image-prod.linux.x86_64.signed.bin`).
2.  Extract the image and other files from the signed package, for example:

    ```
    sh nso-6.1.container-image-prod.linux.x86_64.signed.bin
    ```

{% hint style="info" %}
**Signed Archive File Pattern**

The signed archive file name has the following pattern:&#x20;

`nso-VERSION.container-image-PROD_DEV.linux.ARCH.signed.bin`, where:

* `VERSION` denotes the image's NSO version.
* `PROD_DEV` denotes the type of the container (i.e., `prod` for Production, and `dev` for Development).
* `ARCH` is the CPU architecture.
{% endhint %}

## System Requirements <a href="#sec.system-reqs" id="sec.system-reqs"></a>

To run the images, make sure that your system meets the following requirements:

* A system running Linux `x86_64` or `ARM64`, or macOS `x86_64` or Apple Silicon. Linux for production.
* A container platform, such as Docker. Docker is the recommended platform and is used as an example in this guide for running NSO images. You may, however, use another container runtime of your choice. Note, however, that commands in this guide are Docker-specific. if you use another container runtime, make sure to use the respective commands.

{% hint style="info" %}
Docker on Mac uses a Linux VM to run the Docker engine, which is compatible with the normal Docker images built for Linux. You do not need to recompile your NSO-in-Docker images when moving between a Linux machine and Docker on Mac as they both essentially run Docker on Linux.
{% endhint %}

## Administrative Information <a href="#d5e8371" id="d5e8371"></a>

This section covers the necessary administrative information about the NSO Production Image.

### Migrate to Containerized NSO Setup <a href="#sec.migrate-to-containerizednso" id="sec.migrate-to-containerizednso"></a>

If you have NSO installed for production use using System Install, you can migrate to the Containerized NSO setup by following the instructions in this section. Migrating your Network Services Orchestrator (NSO) to a containerized setup can provide numerous benefits, including improved scalability, easier version management, and enhanced isolation of services.

The migration process is designed to ensure a smooth transition from a System-Installed NSO to a container-based deployment. Detailed steps guide you through preparing your existing environment, exporting the necessary configurations and state data, and importing them into your new containerized NSO instance. During the migration, consider the container runtime you plan to use, as this impacts the migration process.

**Before You Start**

* We recommend reading through this guide to understand better the expectations, requirements, and functioning aspects of a containerized deployment.
* Verify the compatibility of your current system configurations with the containerized NSO setup. See [System Requirements](containerized-nso.md#sec.system-reqs) for more information.
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

    ```
    docker container create --name temp -v NSO-evol:/nso/etc hello-world
    docker cp ncs.conf temp:/nso/etc
    docker rm temp
    ```
4.  Add the run directory as a volume, mounted to `/nso/run` in the container and copy the CDB data, packages, etc., from the previous System Install instance.

    ```
    cd path-to-previous-run-dir
    docker container create --name temp -v NSO-rvol:/nso/run hello-world
    docker cp . temp:/nso/run
    docker rm temp
    ```
5.  Create a volume for the log directory.

    ```
    docker volume create --name NSO-lvol
    ```
6.  Start the container. Example:

    ```
    docker run -v NSO-rvol:/nso/run -v NSO-evol:/nso/etc -v NSO-lvol:/log -itd \
    --name cisco-nso -e EXTRA_ARGS=--with-package-reload -e ADMIN_USERNAME=admin \
    -e ADMIN_PASSWORD=admin cisco-nso-prod:6.1
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

### Pre- and Post-Start Scripts <a href="#d5e8475" id="d5e8475"></a>

If you need to perform operations before or after the `ncs` process is started in the Production container, you can use Python and/or Bash scripts to achieve this. Add the scripts to the `$NCS_CONFIG_DIR/pre-ncs-start.d/` and `$NCS_CONFIG_DIR/post-ncs-start.d/` directories to have the `run-nso.sh` script run them.

### Admin User Creation <a href="#d5e8482" id="d5e8482"></a>

An admin user can be created on startup by the run script in the container. Three environment variables control the addition of an admin user:

* `ADMIN_USERNAME`: Username of the admin user to add, default is `admin`.
* `ADMIN_PASSWORD`: Password of the admin user to add.
* `ADMIN_SSHKEY`: Private SSH key of the admin user to add.

As `ADMIN_USERNAME` already has a default value, only `ADMIN_PASSWORD`, or `ADMIN_SSHKEY` need to be set in order to create an admin user. For example:

```
docker run -itd --name cisco-nso -e ADMIN_PASSWORD=admin cisco-nso-prod:6.1
```

This can be useful when starting up a container in CI for testing or development purposes. It is typically not required in a production environment where there is a permanent CDB that already contains the required user accounts.

{% hint style="info" %}
When using a permanent volume for CDB, etc., and restarting the NSO container multiple times with a different `ADMIN_USERNAME` or `ADMIN_PASSWORD`, note that the start script uses the `ADMIN_USERNAME` and `ADMIN_PASSWORD` environment variables to generate an XML file to the CDB directory which NSO reads at startup. When restarting NSO, if the persisted CDB configuration file already exists in the CDB directory, NSO will only load the persisted configuration and no XML files at startup, and the generated `add_admin_user.xml` in the CDB directory needs to be loaded by the application, using, for example, the `ncs_load` command.
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

```
docker run -d --name cisco-nso -v NSO-vol:/nso -v NSO-log-vol:/log cisco-nso-prod:6.1
```

To take a backup:

*   Run the `ncs-backup` command. The backup file is written to `/nso/run/backups`.

    ```
    docker exec -it cisco-nso ncs-backup
    INFO  Backup /nso/run/backups/ncs-6.1@2024-11-03T11:31:07.backup.gz created successfully
    ```

**Restore a Backup**

To restore a backup, NSO must not be running. As you likely only have access to the `ncs-backup` tool, the volume containing CDB, and other run-time data from inside of the NSO container, this poses a slight challenge. Additionally, shutting down NSO will terminate the NSO container.

To restore a backup:

1.  Shut down the NSO container:&#x20;

    ```
    docker stop cisco-nso
    docker rm cisco-nso
    ```
2.  Run the `ncs-backup --restore` command. Start a new container with the same persistent shared volumes mounted but with a different command. Instead of running the `/run-nso.sh`, which is the normal command of the NSO container, run the `restore` command.

    ```
    docker run -it --rm --volumes-from cisco-nso -v NSO-vol:/nso -v NSO-log-vol:/log \
    --entrypoint ncs-backup cisco-nso-prod:6.1 \
    --restore /nso/run/backups/ncs-6.1@2024-11-03T11:31:07.backup.gz

    Restore /etc/ncs from the backup (y/n)? y
    Restore /nso/run from the backup (y/n)? y
    INFO  Restore completed successfully
    ```
3.  Restoring an NSO backup should move the current run directory (`/nso/run` to `/nso/run.old`) and restore the run directory from the backup to the main run directory (`/nso/run`). After this is done, start the regular NSO container again as usual.\


    ```
    docker run -d --name cisco-nso -v NSO-vol:/nso -v NSO-log-vol:/log cisco-nso-prod:6.1
    ```

### SSH Host Key <a href="#d5e8566" id="d5e8566"></a>

The NSO image `/run-nso.sh` script looks for an SSH host key named `ssh_host_ed25519_key` in the `/nso/etc/ssh` directory to be used by the NSO built-in SSH server for the CLI and NETCONF interfaces.

If an SSH host key exists, which is for a typical production setup stored in a persistent shared volume, it remains the same after restarts or upgrades of NSO. If no SSH host key exists, the script generates a private and public key.

In a high-availability (HA) setup, the host key is typically shared by all NSO nodes in the HA group and stored in a persistent shared volume. I.e., each NSO node does not generate its host key to avoid fetching the public host key after each failover from the new primary to access the primary's NSO CLI and NETCONF interfaces.

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

### NSO System Dump and Disable Memory Overcommit <a href="#d5e8605" id="d5e8605"></a>

By default, the Linux kernel allows overcommit of memory. However, memory overcommit produces an unexpected and unreliable environment for NSO since the Linux Out Of Memory Killer, or OOM-killer, may terminate NSO without restarting it if the system is critically low on memory.

Also, when the OOM-killer terminates NSO, NSO will not produce a system dump file, and the debug information will be lost. Thus, it is strongly recommended that overcommit is disabled with Linux NSO production container hosts with an overcommit ratio of less than 100% (max).

See [Step - 4. Run the Installer](system-install.md#si.run.the.installer) in System Install for information on memory overcommit recommendations for a Linux system hosting NSO production containers.

{% hint style="info" %}
By default, NSO writes a system dump to the NSO run-time directory, default `NCS_RUN_DIR=/nso/run`. If the `NCS_RUN_DIR` is not mounted on the host or to give the NSO system dump file a unique name, the `NCS_DUMP="/path/to/mounted/dir/ncs_crash.dump.<my-timestamp>"` variable need to be set.
{% endhint %}

{% hint style="info" %}
The `docker run` command `--memory="[ram]"` and `--memory-swap="[ram+swap]"` option settings can be used to limit Docker container memory usage. The default setting is max, i.e., all of the host memory is used. Suppose the Docker container reaches a memory limit set by the --memory option. In that case, the default Docker setting is to have Docker terminate the container, no NSO system dump will be generated, and the debug information will be lost.
{% endhint %}

### Startup Arguments

The `/nso-run.sh` script that starts NSO is executed as an `ENTRYPOINT` instruction and the `CMD` instruction can be used to provide arguments to the entrypoint-script. Another alternative is to use the `EXTRA_ARGS` variable to provide arguments. The `/nso-run.sh` script will first check the `EXTRA_ARGS` variable before the `CMD` instruction.

An example using `docker run` with the `CMD` instruction:

```
docker run --name nso -itd cisco-nso-prod:6.1 --with-package-reload \
--ignore-initial-validation
```

With the `EXTRA_ARGS` variable:

```
docker run --name nso \
-e EXTRA_ARGS='--with-package-reload --ignore-initial-validation' \
-itd cisco-nso-prod:6.1
```

An example using a Docker Compose file, `compose.yaml`, with the `CMD` instruction:

```
services:
    nso:
        image: cisco-nso-prod:6.1
        container_name: nso
        command:
            - --with-package-reload
            - --ignore-initial-validation
```

With the `EXTRA_ARGS` variable:

```
services:
    nso:
        image: cisco-nso-prod:6.1
        container_name: nso
        environment:
            - EXTRA_ARGS=--with-package-reload --ignore-initial-validation
```

## Examples <a href="#d5e8625" id="d5e8625"></a>

This section provides examples to exhibit the use of NSO images.

### Running the Production Image using Docker CLI <a href="#d5e8628" id="d5e8628"></a>

This example shows how to run the standalone NSO Production Image using the Docker CLI.

The instructions and CLI examples used in this example are Docker-specific. If you are using a non-Docker container runtime, you will need to: fetch the NSO image from the Cisco software download site, then load and run the image with packages and networking, and finally log in to NSO CLI to run commands.

If you intend to run multiple images (i.e., both Production and Development), Docker Compose is a tool that simplifies defining and running multi-container Docker applications. See the example ([Running the NSO Images using Docker Compose](containerized-nso.md#sec.example-docker-compose)) below for detailed instructions.

**Steps**

Follow the steps below to run the Production Image using Docker CLI:

1. Start your container engine.
2. Next, load the image and run it. Navigate to the directory where you extracted the base image and load it. This will restore the image and its tag:

```
docker load -i nso-6.1.container-image-prod.linux.x86_64.tar.gz
```

3. Start a container from the image. Supply additional arguments to mount the packages and `ncs.conf` as separate volumes ([`-v` flag](https://docs.docker.com/engine/reference/commandline/run/)), and publish ports for networking ([`-p` flag](https://docs.docker.com/engine/reference/commandline/run/)) as needed. The container starts NSO using the `/run-nso.sh` script. To understand how the `ncs.conf` file is used, see [`ncs.conf` File Configuration and Preference](containerized-nso.md#ug.admin\_guide.containers.ncs).

```
docker run -itd --name cisco-nso \
-v NSO-vol:/nso \
-v NSO-log-vol:/log \
--net=host \
-e ADMIN_USERNAME=admin\
-e ADMIN_PASSWORD=admin\
cisco-nso-prod:6.1
```

{% hint style="warning" %}
**Overriding Environment Variables**

Overriding basic environment variables (`NCS_CONFIG_DIR`, `NCS_LOG_DIR`, `NCS_RUN_DIR`, etc.) is not supported and therefore should be avoided. Using, for example, the `NCS_CONFIG_DIR` environment variable to mount a configuration directory will result in an error. Instead, to mount your configuration directory, do it appropriately in the correct place, which is under `/nso/etc`.
{% endhint %}

<details>

<summary>Examples: Running the Image with and without Named Volumes</summary>

The following examples show how to run the image with and without named volumes.

**Running without a named volume**: This is the minimal way of running the image but does not provide any persistence when the container is destroyed.

```
docker run -itd --name cisco-nso \
-p 8888:8888 \
-e ADMIN_USERNAME=admin\
-e ADMIN_PASSWORD=admin\
cisco-nso-prod
```

**Running with a single named volume**: This way provides persistence for the NSO mount point with a `NSO-vol` volume. Logs, however, are not persistent.

```

docker run -itd --name cisco-nso \
-v NSO-vol:/nso \
-p 8888:8888 \
-e ADMIN_USERNAME=admin\
-e ADMIN_PASSWORD=admin\
cisco-nso-prod
```

\
**Running with two named volumes**: This way provides full persistence for both the NSO and the log mount points.

```
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

    ```
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

```
docker exec -it cisco-nso bash
#  ncs_cli -u admin
admin@ncs>
```

You can also use the `docker exec -it cisco-nso ncs_cli -u admin` command to access the CLI from the host's terminal.

### Upgrading NSO using Docker CLI <a href="#d5e8715" id="d5e8715"></a>

This example describes how to upgrade your NSO to run a newer NSO version in the container. The overall upgrade process is outlined in the steps below. In the example below, NSO is to be upgraded from version 6.0 to 6.1.

To upgrade your NSO version:

1.  Start a container with the `docker run` command. In the example below, it mounts the `/nso` directory in the container to the `NSO-vol` named volume to persist the data. Another option is using a bind mount of the directory on the host machine. At this point, the `/cdb` directory is empty.

    ```
    docker run -itd -—name cisco-nso -v NSO-vol:/nso cisco-nso-prod:6.0
    ```
2.  Perform a backup, either by running the `docker exec` command (make sure that the backup is placed somewhere we have mounted) or by creating a tarball of `/data/nso` on the host machine.

    ```
    docker exec -it cisco-nso ncs-backup
    ```
3.  Stop the NSO by issuing the following command, or by stopping the container itself which will run the `ncs stop` command automatically.

    ```
    docker exec -it cisco-nso ncs --stop 
    ```
4.  Remove the old NSO.

    ```
    docker rm -f cisco-nso
    ```
5.  Start a new container and mount the `/nso` directory in the container to the `NSO-vol` named volume. This time the `/cdb` folder is not empty, so instead of starting a fresh NSO, an upgrade will be performed.

    ```
    docker run -itd --name cisco-nso -v NSO-vol:/nso cisco-nso-prod:6.1
    ```

At this point, you only have one container that is running the desired version 6.1 and you do not need to uninstall the old NSO.

### Running the NSO Images using Docker Compose <a href="#sec.example-docker-compose" id="sec.example-docker-compose"></a>

This example covers the necessary information to manifest the use of NSO images to compile packages and run NSO. Using Docker Compose is not a requirement, but a simple tool for defining and running a multi-container setup where you want to run both the Production and Development images in an efficient manner.

#### **Packages**

The packages used in this example are taken from the `examples.ncs/development-guide/nano-services/netsim-sshkey` example:

* `distkey`: A simple Python + template service package that automates the setup of SSH public key authentication between netsim (ConfD) devices and NSO using a nano service.
* `ne`: A NETCONF NED package representing a netsim network element that implements a configuration subscriber Python application that adds or removes the configured public key, which the netsim (ConfD) network element checks when authenticating public key authentication clients.

#### **`docker-compose.yaml` - Docker Compose File Example**

A basic Docker Compose file is shown in the example below. It describes the containers running on a machine:

* The Production container runs NSO.
* The Development container builds the NSO packages.
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
                    image: cisco-nso-prod:6.1
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
                    image: cisco-nso-dev:6.1
                    container_name: build-nso-pkgs
                    network_mode: none
                    profiles:
                      - dev
                    volumes:
                      - type: bind
                        source: /path/to/packages/NSO-1
                        target: /nso/run/packages

                  EXAMPLE:
                    image: cisco-nso-prod:6.1
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

* **`profiles`**: Profiles can be used to group containers in a Compose file, and they work perfectly for the Production, Development, and netsim containers. By adding multiple containers on the same machine (as a developer normally would), you can easily start the Production, Development, and netsim containers using their respective profiles (`prod`, `dev`, and `example`).
* **The command used in the netsim example**: Creates a directory called `/netsim` where the netsims will be set up, then starts the netsims, followed by generating two `init.xml` files and editing the `ncs.conf` file for the Production container. Finally, it keeps the container running. If you want this to be more elegant, you need a netsim container image with a script in it that is well-documented.
*   **`volumes`**: The Production and Development images are configured intentionally to have the same bind mount with `/path/to/packages/NSO-1` as the source and `/nso/run/packages` as the target. The Production Image mounts both the `/log` and `/nso` directories in the container. The `/log` directory is simply a bind mount, while the `/nso` directory is an actual volume.

    \
    Named volumes are recommended over bind mounts as described by the Docker Volumes documentation. The NSO `/run` directory should therefore be mounted as a named volume. However, you can make the `/run` directory a bind mount as well.

    The Compose file, typically named `docker-compose.yaml`, declares a volume called `NSO-1-rvol`. This is a named volume and will be created automatically by Compose. You can create this volume externally, at which point this volume must be declared as external. If the external volume doesn't exist, the container will not start.

    \
    The `example` netsim container will mount the network element NED in the packages directory. This package should be compiled. Note that the `NSO-1-rvol` volume is used by the `example` container to share the generated `init.xml` and `ncs.conf` files with the NSO Production container.
* **`healthcheck`**: The image comes with its own health check (similar to the one shown here in Compose), and this is how you configure it yourself. The health check for the netsim `example` container checks if the `ncs.conf` file has been generated, and the first Netsim instance started in the container. You could, in theory, start more netsims inside the container.

</details>

#### **Steps**

Follow the steps below to run the images using Docker Compose:

1.  Start the Development container. This starts the services in the Compose file with the profile `dev`.

    ```
    docker compose --profile dev up -d
    ```
2.  Copy the packages from the `netsim-sshkey` example and compile them in the NSO Development container. The easiest way to do this is by using the `docker exec` command, which gives more control over what to build and the order of it. You can also do this with a script to make it easier and less verbose. Normally you populate the package directory from the host. Here, we use the packages from an example.

    ```
    docker exec -it build-nso-pkgs sh -c 'cp -r ${NCS_DIR}/examples.ncs/development-guide \
        /nano-services/netsim-sshkey/packages ${NCS_RUN_DIR}'

    docker exec -it build-nso-pkgs sh -c 'for f in ${NCS_RUN_DIR}/packages/*/src; \
        do make -C "$f" all || exit 1; done'
    ```
3.  Start the netsim container. This outputs the generated `init.xml` and `ncs.conf` files to the NSO Production container. The `--wait` flag instructs to wait until the health check returns healthy.

    ```
    docker compose --profile example up --wait
    ```
4.  Start the NSO Production container.

    ```
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
    docker compose --profile dev down
    docker compose --profile example down -v
    docker compose --profile prod down -v
    rm -rf ./packages/NSO-1/* ./log/NSO-1/*

    printf "${GREEN}##### Start the dev container used for building the NSO NED
        and service packages\n${NC}"
    docker compose --profile dev up -d

    printf "${GREEN}##### Get the packages\n${NC}"
    printf "${PURPLE}##### NOTE: Normally you populate the package directory from the host.
    Here, we use packages from an NSO example\n${NC}"
    docker exec -it build-nso-pkgs sh -c 'cp -r
     ${NCS_DIR}/examples.ncs/development-guide/nano-services/netsim-sshkey/packages ${NCS_RUN_DIR}'

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
     ${NCS_DIR}/examples.ncs/development-guide/nano-services/netsim-sshkey/showcase.sh'
    docker exec -it nso1 sh -c 'cd ${NCS_RUN_DIR};
     ${NCS_DIR}/examples.ncs/development-guide/nano-services/netsim-sshkey/showcase.sh 1'
    ```

### Upgrading NSO using Docker Compose <a href="#d5e8861" id="d5e8861"></a>

This example describes how to upgrade NSO when using Docker Compose.

#### **Upgrade to a New Minor or Major Version**

To upgrade to a new minor or major version, for example, from 6.0 to 6.1, follow the steps below:

1. Change the image version in the Compose file to the new version, i.e., 6.1.
2. Run the `docker compose up --profile dev -d` command to start up the Development container with the new image.
3.  Compile the packages using the Development container.

    ```
    docker exec -it build-nso-pkgs sh -c 'for f in
    ${NCS_RUN_DIR}/packages/*/src;do make -C "$f" all || exit 1; done'
    ```
4. Run the `docker compose up --profile prod --wait` command to start the Production container with the new packages that were just compiled.

#### **Upgrade to a New Maintenance Version**

To upgrade to a new maintenance release version, for example, to 6.1.1, follow the steps below:

1. Change the image version in the Compose file to the new version, i.e., 6.1.1.
2.  Run the `docker compose up --profile prod --wait` command.

    Upgrading in this way does not require a recompile. Docker detects changes and upgrades the image in the container to the new version.
