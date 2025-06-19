# Server Tools

A collection of useful server administration and monitoring scripts for web server environments.

## About

This repository contains various tools and scripts designed to help with server administration, monitoring, and troubleshooting tasks. The tools are primarily focused on web server environments running Apache, PHP, and related technologies.

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

## Requirements

- Linux/Unix environment
- Apache web server
- PHP-FPM
- Standard Unix utilities (grep, ps, ss, systemctl)

## Getting Started

1. Clone this repository
2. Make scripts executable: `chmod +x *.sh`
3. Run the desired script

## Contributing

Feel free to add more server administration tools and scripts to this collection.

## License

Open source - feel free to use and modify as needed.

