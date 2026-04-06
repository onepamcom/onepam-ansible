# OnePAM Ansible Collection

[![Ansible Galaxy](https://img.shields.io/badge/galaxy-onepam.agent-blue.svg)](https://galaxy.ansible.com/ui/repo/published/onepam/agent/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Ansible collection for deploying the **OnePAM agent** on Linux servers.

[OnePAM](https://onepam.com) is a unified Zero Trust Privileged Access Management platform.

## Installation

```bash
ansible-galaxy collection install onepam.agent
```

## Requirements

- Ansible >= 2.9
- Target: Linux with systemd and root access
- Network access to `updates.onepam.com` (port 443)

## Usage

```yaml
- hosts: servers
  become: true
  roles:
    - role: onepam.agent.onepam_agent
      vars:
        onepam_tenant_id: "YOUR-TENANT-UUID"
        onepam_server_url: "https://onepam.com"
```

## Role Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `onepam_server_url` | OnePAM server URL | `https://onepam.com` |
| `onepam_tenant_id` | Organisation UUID (**required**) | — |
| `onepam_group_uuid` | Optional group assignment | `""` |
| `onepam_agent_version` | Agent version | `latest` |
| `onepam_log_level` | Log level (debug, info, warn, error) | `info` |
| `onepam_release_url` | Binary download base URL | `https://updates.onepam.com` |
| `onepam_install_dir` | Installation directory | `/opt/onepam` |

## Supported Platforms

- Ubuntu 20.04, 22.04, 24.04
- Debian 11, 12
- RHEL / CentOS / Rocky / Alma 8, 9
- Amazon Linux 2, 2023

## Documentation

- [OnePAM Ansible Docs](https://onepam.com/docs/install/ansible)
- [OnePAM Documentation](https://onepam.com/docs)

## Support

- Email: support@onepam.com
- Issues: https://github.com/onepamcom/onepam-ansible/issues
