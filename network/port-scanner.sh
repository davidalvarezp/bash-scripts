#!/bin/bash

# Simple Network Port Scanner
# Checks common ports on a target host

TARGET=${1:-127.0.0.1}
TIMEOUT=2

# Common ports to scan
PORTS="21 22 23 25 53 80 110 143 443 465 587 993 995 2082 2083 2086 2087 2095 2096 3306 3389 5432"

echo "🔍 Scanning $TARGET..."
echo "Port    Status   Service"
echo "========================"

for PORT in $PORTS; do
    # Use different methods based on available tools
    if command -v nc &> /dev/null; then
        nc -z -w $TIMEOUT $TARGET $PORT >/dev/null 2>&1
    elif command -v telnet &> /dev/null; then
        timeout $TIMEOUT telnet $TARGET $PORT >/dev/null 2>&1
    else
        echo "❌ No network tools available (install nc or telnet)"
        exit 1
    fi
    
    if [ $? -eq 0 ]; then
        case $PORT in
            21) SERVICE="FTP" ;;
            22) SERVICE="SSH" ;;
            80) SERVICE="HTTP" ;;
            443) SERVICE="HTTPS" ;;
            3306) SERVICE="MySQL" ;;
            *) SERVICE="Unknown" ;;
        esac
        echo "$PORT     OPEN     $SERVICE"
    else
        echo "$PORT     CLOSED   -"
    fi
done

echo "Scan completed: $(date)"
