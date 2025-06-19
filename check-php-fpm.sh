#!/bin/bash
# Check if Apache is using mod_php or PHP-FPM

echo "=== Checking for mod_php ==="
if apachectl -M 2>/dev/null | grep -q php_module; then
    echo "[❌] mod_php is enabled. This is NOT optimal for performance."
else
    echo "[✅] mod_php is NOT enabled."
fi

echo ""
echo "=== Checking Apache PHP Proxy (FPM) Configuration ==="
PROXY_HANDLER=$(grep -r "SetHandler" /etc/httpd/conf.d/ 2>/dev/null | grep -E "proxy:unix|proxy:fcgi")

if [ -n "$PROXY_HANDLER" ]; then
    echo "[✅] PHP requests are proxied to PHP-FPM:"
    echo "$PROXY_HANDLER"
else
    echo "[❌] No proxy to PHP-FPM found. Check your Apache configuration."
fi

echo ""
echo "=== Checking PHP-FPM Service ==="
if systemctl is-active --quiet php-fpm; then
    echo "[✅] PHP-FPM is running."
else
    echo "[❌] PHP-FPM is NOT running."
fi

echo ""
echo "=== Checking PHP-FPM UNIX Socket or Port ==="
ss -lxp | grep php-fpm || echo "[❌] No PHP-FPM socket or port detected."

echo ""
echo "=== Checking Active PHP-FPM Processes ==="
ps aux | grep 'php-fpm: pool' | grep -v grep || echo "[❌] No active php-fpm pool processes found."
