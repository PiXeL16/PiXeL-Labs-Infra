# Ansible Playbook for PixelLabs Infrastructure

This playbook sets up common configurations and installs necessary for a simple Labs Infrastructure using Dockploy.

## Prerequisites

Before running this playbook, you need:

1. Python and pip installed
2. SSH key pair configured (`~/.ssh/pixeltowers-staging-ansible`)
3. Environment variables configured (see Environment Setup section)

## Environment Setup

1. Create a `.env` file in the project root:


## Roles

### Common
- Installs and configures common packages
- Sets up security (UFW, fail2ban)
- Configures system settings (timezone, NTP, logrotate)
- Enables automatic security updates

### Dockploy
- Installs Docker and related packages
- Sets up Docker service
- Installs Dokploy deployment tool

## Usage

To use this Makefile, ensure you're in the same directory as the Makefile and run the desired command.

### Available Commands

1. Install dependencies:
   ```
   make install-deps
   ```

2. Run the playbook for all environments:
   ```
   make
   ```
   or
   ```
   make run-playbook
   ```

3. Run the playbook for pixel_labs environment:
   ```
   make pixel_labs
   ```

4. Run the playbook with verbose output:
   ```
   make run-playbook-verbose
   ```

5. Check the playbook syntax:
   ```
   make syntax-check
   ```

6. Run Ansible Lint on the playbook:
   ```
   make lint
   ```

7. Display help information:
   ```
   make help
   ```

## Configuration Files

- `ansible.cfg`: Contains default Ansible configuration
- `inventories/staging/hosts`: Defines server inventory
- `group_vars/all.yml`: Contains variables shared across all groups
- `site.yml`: Main playbook file

## Security Features

The playbook sets up several security measures:
- UFW firewall with allowed ports (22, 80, 443, 3000)
- Fail2ban for intrusion prevention
- Automatic security updates
- Logrotate configuration
- Chrony for time synchronization

## Notes

- The playbook uses root as the remote user (configured in ansible.cfg)
- Host key checking is disabled for easier development
- All commands are executed through the `run-ansible.sh` wrapper script to ensure environment variables are loaded

## Contributing

Feel free to submit issues or pull requests if you have suggestions for improvements or encounter any problems.

## License
 Apache 2.0, etc