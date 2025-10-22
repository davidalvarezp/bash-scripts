#!/bin/bash

# Log Cleaner and Rotator
# Cleans old logs and manages log rotation

echo "🧹 Starting Log Maintenance"

# Clean old log files
find /var/log -name "*.log" -type f -mtime +30 -delete
find /var/log -name "*.gz" -type f -mtime +60 -delete
find /var/log -name "*.1" -type f -mtime +15 -delete

# Clean temporary files
find /tmp -type f -atime +7 -delete
find /var/tmp -type f -atime +30 -delete

# Clean package cache
apt-get clean 2>/dev/null || yum clean all 2>/dev/null

# Clear systemd journal logs older than 1 week
journalctl --vacuum-time=7d

# Clean thumbnails cache (if desktop environment)
[ -d "/home" ] && find /home -type d -name ".thumbnails" -exec rm -rf {} \; 2>/dev/null

echo "✅ Log maintenance completed"
echo "💾 Disk space freed:"
df -h / | awk 'NR==2{print "Available: " $4}'
