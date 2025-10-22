# Bash Scripts for SysAdmin

A collection of useful bash scripts for system administration, server maintenance, and automation tasks.

## Script Categories

### System Information
- `system-stats.sh` - Comprehensive system health check
- `service-monitor.sh` - Monitor critical services

### Security
- `fail2ban-setup.sh` - Automated Fail2Ban installation & configuration
- `ssh-hardening.sh` - SSH server security hardening

### Backup & Recovery
- `mysql-backup.sh` - Automated MySQL/MariaDB backups
- `website-backup.sh` - Complete website backup (files + database)

### Maintenance
- `log-cleaner.sh` - Automated log rotation and cleanup
- `update-system.sh` - Safe system update with pre/post checks

### Network
- `port-scanner.sh` - Network port scanner
- `connection-monitor.sh` - Monitor network connectivity

## Quick Start

1. **Clone the repository**
```
git clone https://github.com/davidalvarezp/bash-scripts.git
cd bash-scripts
```

2. **Make scripts executable**
```
chmod +x script-name.sh
```

3. **Run with appropriate permissions**
```
sudo ./script-name.sh
```

## Usage Examples

### System Health Check
```
./system-info/system-stats.sh
```

### Automated Backups
```
# Add to crontab for daily backups
0 2 * * * /path/to/bash-scripts/backup/mysql-backup.sh
```

### Security Hardening
```
sudo ./security/ssh-hardening.sh
```

## Safety Notes
- Always review scripts before running
- Test in non-production environment first
- Keep backups before making system changes
- Some scripts may require customization for your environment

## Contributing
Found a bug or have improvements?

- Fork the repository
- Create your feature branch
- Commit your changes
- Push to the branch
- Open a Pull Request

## License
This project is licensed under the MIT License - see the LICENSE file for details.

## Author
**davidalvarezp**

- Website: [davidalvarezp.com](https://davidalvarezp.com)
- GitHub: [@davidalvarezp](https://davidalvarezp.com)

## If you find these scripts useful, please give the repository a star!
