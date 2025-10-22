#!/bin/bash

# SSH Server Hardening Script
# Improves SSH security configuration

SSH_CONFIG="/etc/ssh/sshd_config"
BACKUP_FILE="/etc/ssh/sshd_config.backup.$(date +%Y%m%d)"

echo "🔒 SSH Hardening Script"
echo "Backing up current config to: $BACKUP_FILE"
cp $SSH_CONFIG $BACKUP_FILE

echo "Applying security enhancements..."

# Disable root login
sed -i 's/#PermitRootLogin yes/PermitRootLogin no/' $SSH_CONFIG
sed -i 's/PermitRootLogin yes/PermitRootLogin no/' $SSH_CONFIG

# Change default port (uncomment to enable)
# sed -i 's/#Port 22/Port 2222/' $SSH_CONFIG

# Disable password authentication (use keys only)
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' $SSH_CONFIG
sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' $SSH_CONFIG

# Configure allowed authentication methods
echo "AuthenticationMethods publickey" >> $SSH_CONFIG

# Configure allowed users (replace with your username)
echo "AllowUsers david" >> $SSH_CONFIG

# Set idle timeout
sed -i 's/#ClientAliveInterval 0/ClientAliveInterval 300/' $SSH_CONFIG
sed -i 's/#ClientAliveCountMax 3/ClientAliveCountMax 2/' $SSH_CONFIG

# Limit maximum authentication attempts
sed -i 's/#MaxAuthTries 6/MaxAuthTries 3/' $SSH_CONFIG

echo "✅ SSH configuration updated"
echo "⚠️  Important: Ensure you have SSH key access before restarting!"
echo "Restart SSH service with: systemctl restart sshd"
