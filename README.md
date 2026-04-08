# OnePAM Ansible Collection

Ansible collection for deploying and managing [OnePAM](https://onepam.com) agents on Linux hosts.

## Requirements

- Ansible 2.9+
- Python 3.8+
- Target: Linux with systemd, root access, network access to OnePAM server

## Installation

Clone the repository and copy the role into your Ansible roles path:

```bash
git clone https://github.com/onepamcom/onepam-ansible.git
cp -r onepam-ansible/roles/agent /etc/ansible/roles/onepam_agent
```

Or add it as a git submodule in your playbook project:

```bash
git submodule add https://github.com/onepamcom/onepam-ansible.git vendor/onepam-ansible
```

Then reference the role path in your `ansible.cfg`:

```ini
[defaults]
roles_path = vendor/onepam-ansible/roles
```

## Quick Start

### Using the bundled playbook

```bash
cd onepam-ansible
ansible-playbook -i inventory.yml playbooks/deploy-agent.yml \
  -e onepam_tenant_id="YOUR-TENANT-UUID"
```

### Using the role in your own playbook

```yaml
- hosts: all
  become: true
  roles:
    - role: agent
      vars:
        onepam_tenant_id: "YOUR-TENANT-UUID"
```

### Inventory example

```yaml
all:
  hosts:
    server1.example.com:
    server2.example.com:
  vars:
    onepam_tenant_id: "YOUR-TENANT-UUID"
    onepam_server_url: "https://onepam.com"
```

## Role Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `onepam_state` | `present` to install, `absent` to remove | `present` |
| `onepam_server_url` | OnePAM server URL | `https://onepam.com` |
| `onepam_tenant_id` | Organisation UUID (**required**) | `""` |
| `onepam_group_uuid` | Optional group assignment | `""` |
| `onepam_agent_version` | Agent version to install | `latest` |
| `onepam_log_level` | Logging verbosity | `info` |
| `onepam_release_url` | Base URL for binary downloads | `https://updates.onepam.com` |
| `onepam_install_dir` | Installation directory | `/opt/onepam` |

## What it does

1. **Install** -- Downloads the OnePAM agent binary with SHA256 checksum verification
2. **Configure** -- Generates a unique agent ID and renders the environment file
3. **Service** -- Deploys a systemd unit, enables and starts the agent

Set `onepam_state: absent` to reverse the process (stop service, remove files).

## Supported Platforms

- Ubuntu 20.04, 22.04, 24.04
- Debian 11, 12
- RHEL / CentOS / Rocky / Alma 8, 9

## Development

```bash
# Lint
pip install ansible ansible-lint
ansible-lint
```

## License

Apache-2.0

## Links

- [OnePAM Documentation](https://onepam.com/docs/install/ansible)
- [GitHub](https://github.com/onepamcom/onepam-ansible)
