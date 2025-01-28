---
icon: spider-web
description: Best practice guidelines for deploying NSO on Kubernetes.
---

# NSO on Kubernetes

Deploying Cisco NSO on Kubernetes offers numerous advantages, including consistent deployments, self-healing capabilities, and better version control. This document outlines best practices for deploying NSO on Kubernetes to ensure optimal performance, security, and maintainability.

{% hint style="success" %}
See also the documentation for the Cisco-provided [Containerized NSO](https://cisco-tailf.gitbook.io/nso-docs/guides/administration/installation-and-deployment/containerized-nso) images.
{% endhint %}

## Prerequisites <a href="#prerequisites" id="prerequisites"></a>

### Kubernetes Cluster <a href="#kubernetes-cluster" id="kubernetes-cluster"></a>

* **Version Compatibility**: Ensure that your Kubernetes cluster is within the three most recent minor releases to maintain official support.
* **Persistent Storage**: Install a Container Storage Interface (CSI) if not using a managed Kubernetes service. Managed services like EKS on AWS or GKE on GCP handle this automatically.
* **Networking**: Install a Container Network Interface (CNI) such as Cilium, Calico, Flannel, or Weave. Additionally, configure an ingress controller or load balancer as needed to expose services.
* **TLS Certificates**: Use TLS certificates for HTTPS access and to secure communication between different NSO instances. This is crucial for securing data transmission.

## Deployment Architecture <a href="#deployment-architecture" id="deployment-architecture"></a>

### Namespace Design <a href="#namespace-design" id="namespace-design"></a>

* **Isolation**: Run NSO in its own namespace to isolate its resources (pods, services, secrets, and so on.) from other applications and services in the cluster. This logical separation helps manage resources and apply specific RBAC policies.

### Pod Design <a href="#pod-design" id="pod-design"></a>

* **Stateful Pods**: Use StatefulSets for production deployments to ensure that each NSO pod retains its data across restarts by mounting the same PersistentVolume. StatefulSets also provide a stable network identity for each pod.
* **Data Persistence**: Attach persistent volumes to NSO pods to ensure data persistence. Avoid using hostPath volumes in production due to security risks.

### Service Design <a href="#service-design" id="service-design"></a>

* **Service Types**:
  * **ClusterIP**: Use for internal communications between NSO instances or other Kubernetes resources.
  * **NodePort**: Use for testing purposes only, as it exposes pods over the address of a Kubernetes node.
  * **LoadBalancer**: Use for external access, such as exposing SSH/NETCONF ports.
* **Ingress Controllers**: Use Ingress for managing external access to HTTP or HTTPS traffic. For more advanced routing capabilities, consider using the Gateway API.

## Storage Design <a href="#storage-design" id="storage-design"></a>

### Volume Management <a href="#volume-management" id="volume-management"></a>

* **Persistent Volumes**: Use PersistentVolumeClaims to manage storage and ensure that critical directories like NSO running directory, packages directory, and logs directory persist through restarts.
* **NSO Directories**: Mount necessary directories, such as the NSO running directory, packages directory, and logs directory to persistent volumes.
* **Avoid HostPath**: Refrain from using hostPath volumes in production environments, as they expose NSO data to the host system and add maintenance overhead.

## Deployment Strategies <a href="#deployment-strategies" id="deployment-strategies"></a>

### YAML Manifests <a href="#yaml-manifests" id="yaml-manifests"></a>

* **Version Control**: Define Kubernetes objects using YAML manifests and manage them via version control. This ensures consistent deployments and easier rollback capabilities.
* **ConfigMaps and Secrets**: Use ConfigMaps for non-sensitive configuration files and Secrets for sensitive data like Docker registry credentials. ConfigMaps are used to manage NSO configuration files, while Secrets can store sensitive information such as passwords and API keys. In NSO, the sensitive data that should go into Secrets is, for example, encryption keys for the CDB.

### Helm Charts <a href="#helm-charts" id="helm-charts"></a>

* **Simplified Deployment**: Use Helm charts for packaging YAML manifests, simplifying the deployment process. Manage deployment parameters through a `values.yaml` file.
* **Custom Configuration**: Expose runtime parameters, service ports, URLs, and other configurations via Helm templates. Helm charts allow for more dynamic and reusable configurations.

## Security Considerations <a href="#security-considerations" id="security-considerations"></a>

### Running as Non-Root <a href="#running-as-non-root" id="running-as-non-root"></a>

* **SecurityContext**: Limit the Linux capabilities that are allowed for the NSO container and avoid running containers as the root user. This can be done by defining a SecurityContext in the Pod specification.
* **Custom Dockerfile**: Create a Dockerfile to add a non-root user and adjust folder permissions, ensuring NSO runs as a dedicated user. This can help in adhering to the principle of least privilege.

### Network Policies <a href="#network-policies" id="network-policies"></a>

* **Ingress and Egress Control**: Implement network policies to restrict access to NSO instances and managed devices. Limit the communication to trusted IP ranges and namespaces.
* **Service Accounts**: Create dedicated service accounts for NSO pods to minimize permissions and reduce security risks. This ensures that each service account only has the permissions it needs for its tasks.

## Monitoring & Logging <a href="#monitoring--logging" id="monitoring--logging"></a>

### Observability Exporter <a href="#observability-exporter" id="observability-exporter"></a>

* **Setup**: Transform Docker Compose files to Kubernetes manifests using tools like Kompose. Deploy the observability exporter to export data in industry-standard formats such as OpenTelemetry.
* **Container Probes**: Implement readiness probes to monitor the health and readiness of NSO containers. Use HTTP checks to ensure that the NSO API is operational. Probes can help in ensuring that the application is functioning correctly and can handle traffic.

## Scaling & Performance Optimization <a href="#scaling--performance-optimization" id="scaling--performance-optimization"></a>

### Resource Requests & Limits <a href="#resource-requests--limits" id="resource-requests--limits"></a>

* **Resource Management**: Define resource requests and limits for NSO pods to ensure appropriate CPU and memory allocation. This helps maintain cluster stability and performance by preventing any single pod from using excessive resources.

### Affinity & Anti-Affinity <a href="#affinity--anti-affinity" id="affinity--anti-affinity"></a>

* **Pod Distribution**: Use affinity and anti-affinity rules to ensure optimal distribution of NSO pods across worker nodes. This helps in achieving high availability and resilience by ensuring that pods are evenly distributed across nodes.

## High Availability & Resiliency <a href="#high-availability--resiliency" id="high-availability--resiliency"></a>

### Raft HA <a href="#raft-ha" id="raft-ha"></a>

* **Setup**: Configure a three-node Raft cluster for high availability. Ensure that each node has a unique pod and network identity, as well as its own PersistentVolume and PersistentVolumeClaim.
* **Annotations**: Use annotations to direct requests to the primary NSO instance. Implement sidecar containers to periodically check and update the Raft HA status. This ensures that the primary instance is always up and running.

## Backup & Disaster Recovery <a href="#backup--disaster-recovery" id="backup--disaster-recovery"></a>

### NSO Backup <a href="#nso-backup" id="nso-backup"></a>

* **Automated Backups**: Use Kubernetes CronJobs to automate regular NSO backups. Store the backups securely and periodically verify them.
* **Disaster Recovery**: Ensure that NSO backups are stored in a secure location and can be restored in case of cluster failure. Use temporary container instances to restore backups without running NSO.

## Upgrade & Maintenance <a href="#upgrade--maintenance" id="upgrade--maintenance"></a>

### Upgrading NSO <a href="#upgrading-nso" id="upgrading-nso"></a>

* **Persistent Storage**: Ensure that the NSO running directory uses persistent storage to maintain data integrity during upgrades.
* **Testing**: Test upgrades on a dummy instance before applying them to production. Clone the existing PVC and spin up a new NSO instance for testing.
* **Rolling Upgrades**: Update the container image version in YAML manifests or Helm charts. Delete the old NSO pods to allow Kubernetes to deploy the new ones. This minimizes downtime and ensures a smooth transition to the new version.

### Cluster Maintenance <a href="#cluster-maintenance" id="cluster-maintenance"></a>

* **Rolling Upgrades**: Perform rolling node upgrades to minimize downtime and ensure high availability. Ensure the compatibility with Kubernetes API and resource definitions before upgrading.
* **Node Draining**: Drain and cordon nodes to safely migrate NSO instances during maintenance. This helps in ensuring that the cluster remains functional during maintenance activities.

## Conclusion <a href="#conclusion" id="conclusion"></a>

By adhering to these best practices, you can ensure a robust, secure, and efficient deployment of Cisco NSO on Kubernetes. These guidelines help maintain operational stability, improve performance, and enhance the overall manageability of your Kubernetes deployments. Implementing these practices will help in achieving a reliable and scalable Kubernetes environment for NSO.
