# Server Tools

A collection of useful server administration and monitoring scripts for web server environments.

## About

This repository contains various tools and scripts designed to help with server administration, monitoring, security management, and troubleshooting tasks. The tools are primarily focused on web server environments running Apache, PHP, Fail2Ban, and related technologies.

## Contents

### Scripts

#### `check-php-fpm.sh`
A comprehensive diagnostic script that checks PHP-FPM configuration and status on Apache web servers.

**What it does:**
- ✅ Verifies if Apache is using mod_php (and warns if it is, as PHP-FPM is more optimal)
- ✅ Checks Apache configuration for proper PHP-FPM proxy setup
- ✅ Monitors PHP-FPM service status
- ✅ Inspects PHP-FPM socket/port connections
- ✅ Lists active PHP-FPM pool processes

**Usage:**
```bash
chmod +x check-php-fpm.sh
./check-php-fpm.sh
```

**Purpose:**
This script is particularly useful for:
- Troubleshooting PHP-FPM configuration issues
- Verifying optimal Apache + PHP-FPM setup
- Server health checks and monitoring
- Performance optimization validation

#### `ban-ip.sh`
A Fail2Ban management script for manually banning IP addresses from specified jails.

**What it does:**
- 🚫 Bans one or more IP addresses in a Fail2Ban jail
- ✅ Validates IP address format before processing
- 🔧 Configurable jail name (default: apache-badbots)
- 📝 Provides clear feedback on ban status

**Usage:**
```bash
sudo chmod +x ban-ip.sh
sudo ./ban-ip.sh 192.168.1.100
sudo ./ban-ip.sh 192.168.1.100 10.0.0.50 172.16.0.25
```

#### `unban-ip.sh`
A Fail2Ban management script for manually unbanning IP addresses from specified jails.

**What it does:**
- ✅ Unbans one or more IP addresses from a Fail2Ban jail
- ✅ Validates IP address format before processing
- 🔧 Configurable jail name (default: apache-badbots)
- 📝 Provides clear feedback on unban status

**Usage:**
```bash
sudo chmod +x unban-ip.sh
sudo ./unban-ip.sh 192.168.1.100
sudo ./unban-ip.sh 192.168.1.100 10.0.0.50 172.16.0.25
```

**IP Management Purpose:**
These scripts are particularly useful for:
- Emergency IP blocking during security incidents
- Quickly unbanning legitimate users accidentally blocked
- Bulk IP management operations
- Automated security response workflows

## Requirements

- Linux/Unix environment
- Apache web server
- PHP-FPM (for PHP-FPM diagnostic script)
- Fail2Ban (for IP management scripts)
- Standard Unix utilities (grep, ps, ss, systemctl)
- Root/sudo access (required for IP ban/unban operations)

## Getting Started

1. Clone this repository
2. Make scripts executable: `chmod +x *.sh`
3. Run the desired script

## Contributing

Feel free to add more server administration tools and scripts to this collection.

## License

Open source - feel free to use and modify as needed.

