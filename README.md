# Workshop DevOps - Infrastructure Control Plane

This repository contains the environment setup for the DevOps AWS Workshop. It uses a **Docker-based Control Node** provisioned via **Ansible** to provide a consistent, isolated, and high-performance workspace.

---

## ### Project Architecture

- **Local Host:** Zorin OS (Linux)
- **Control Node:** Ubuntu 24.04 Container (via Docker Compose)
- **Provisioning:** Ansible (running on Host, connecting via `docker_connection`)
- **Interface:** VS Code + **Dev Containers** Extension

---

## ### 1. Prerequisites

Ensure the following are installed on your **Zorin OS (Host)**:

- **Docker & Docker Compose**
- **Ansible**
- **Ansible Collection:** `ansible-galaxy collection install community.docker`
- **VS Code Extension:** `ms-vscode-remote.remote-containers`

---

## ### 2. Directory Structure

```text
.
├── infra-configs/ansible/
│ ├── host_vars/workshop-container.yml # Environment variables (admin_username, etc.)
│ ├── playbooks/site.yml # Main entry point for provisioning
│ ├── roles/common/tasks/main.yml # Toolchain installation logic
│ ├── ansible.cfg # Ansible configuration and sudo settings
│ └── inventory.ini # Connection settings (ansible_connection=docker)
├── servidor-container/
│ ├── Dockerfile # Base image setup with Python and Sudo
│ └── docker-compose.yml # Container, Volume, and SSH Key mapping
└── README.md
```

### 3. Environment Setup Steps

Step 1: Start the Container
Navigate to the container directory and spin up the environment:

Bash

cd servidor-container
docker compose up -d

Note: This mounts your specific workshop SSH key from ~/.ssh/ansible-workshop-aws to the container's internal path /home/bryan/.ssh/id_ed25519 as read-only.
Step 2: Provision the Toolchain
Run the Ansible playbook from your Host machine to install all necessary DevOps tools inside the running container:

Bash

cd ../infra-configs/ansible
ansible-playbook -i inventory.ini playbooks/site.yml

Step 3: Connect via VS Code
Open the project root folder in VS Code.
Press Ctrl+Shift+P and select "Dev Containers: Attach to Running Container".
Choose workshop-container.
Once attached, open the integrated terminal. All tools are ready.

### 4. Installed Toolchain

Tool
Verification Command
Description
AWS CLI
aws --version
Amazon Web Services Management
Terraform
terraform --version
Infrastructure as Code (IaC)
Kubectl
kubectl version --client
Kubernetes Cluster Orchestration
Helm
helm version
Kubernetes Package Manager
Kustomize
kustomize version
Kubernetes Configuration Management

### 5. Key Advantages

Native Keyboard Support: By using VS Code's "Attach" mode, your native keyboard layout (accents, symbols) works perfectly.
Persistent Storage: Your home directory and tool configurations are stored in the workshop_data Docker volume.
Security: Your SSH private key is mapped specifically for this container, preventing the need to copy sensitive files manually.
Isolation: Keeps your Host OS clean by containing all CLI tools within the Docker environment.

### 6. Troubleshooting

Permission Denied (Docker): Ensure your user is in the docker group on Zorin: sudo usermod -aG docker $USER.
Ansible Connection Error: Ensure the container is running (docker ps) and the community.docker collection is installed.
SSH Key not found: Verify the path in docker-compose.yml matches your actual key location on the Host.
Undefined Variables: Ensure host_vars/workshop-container.yml matches the host name defined in inventory.ini.
