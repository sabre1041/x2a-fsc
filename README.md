# x2ansible Field Source Content

Deployment of the x2ansible environment — Ansible Automation Platform, GitLab, Red Hat Developer Hub, and Vault — using Red Hat Demo Platform (RHDP) Field Source Content.

## 1. Provisioning via Red Hat Demo Platform Field Source Content

1. Order the **Field Sourced Content - OpenShift (Dedicated Clusters)** CI from [Red Hat Demo Platform](https://catalog.demo.redhat.com/catalog/babylon-catalog-prod?item=babylon-catalog-prod/published.ocp-field-asset.prod&utm_source=webapp&utm_medium=share-link).
2. Select the following options:
* Cloud Provider: CNV
* Cluster Size: Multinode
* Select "Ansible Automation Platform" (under "Select Base Workloads")
* OpenShift Worker Count: 5
* OpenShift Worker memory: 16Gi
* OpenShift Worker CPU: 8
* Existing GitOps Repo
  * GitOps Repo: https://github.com/sabre1041/x2a-fsc (or a fork)
  * GitOps Revision: main
  * GitOps Path: bootstrap
* Select "Enable LiteMaaS/MaaS API Keys (for AI/LLM demos)" (under "AI/LLM Configuration")
  * Model: gpt-oss-120b-a5b
  * Expiry: 30d

## 2. Default URLs

| Component | URL |
|-----------|-----|
| Ansible Automation Platform (gateway) | `https://aap-aap.apps.<cluster-domain>` |
| GitLab | `https://gitlab.apps.<cluster-domain>` |
| Red Hat Developer Hub (x2ansible) | `https://x2ansible.apps.<cluster-domain>` |

Replace `<cluster-domain>` with your cluster's domain (e.g. `cluster-nrxn5.dyn.redhatworkshops.io`).

## 3. Default Credentials

| Component | Username | Password |
|-----------|----------|----------|
| GitLab | `x2ansible` | `r3dh@t123` |
| GitLab | `root` | Auto-generated — Secret `gitlab-gitlab-initial-root-password` in the `gitlab` namespace |
| Ansible Automation Platform | `admin` | Injected by the RHDP deployer (`aap.adminPassword`) |
| Ansible Automation Platform | `x2ansible` | `x2ansible` |
