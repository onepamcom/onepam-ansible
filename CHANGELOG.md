# Changelog

All notable changes to the OnePAM Ansible collection will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-04-08

### Added

- `agent` role with install, config, and service management
- Automatic binary download with SHA256 checksum verification
- Systemd service unit management with environment file
- Support for `present`/`absent` lifecycle (clean install and uninstall)
- Architecture detection (amd64/arm64)
- Agent ID generation and persistence
- Configurable parameters: `onepam_server_url`, `onepam_tenant_id`, `onepam_group_uuid`, `onepam_agent_version`, `onepam_log_level`, `onepam_release_url`, `onepam_install_dir`
- Jinja2 templates for agent environment and systemd service unit
- `deploy-agent` playbook for quick deployments
- Support for Ubuntu 20.04/22.04/24.04, Debian 11/12, RHEL/CentOS/Rocky/Alma 8/9
- Ansible 2.9+ compatibility
- CI workflow with ansible-lint and ansible-test sanity
- Publish workflow for Ansible Galaxy
- Apache 2.0 license
