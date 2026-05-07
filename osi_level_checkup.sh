#!/bin/bash

echo "=== Network diagnostic $(date) ==="
echo ""
echo "[L1] interfce status:"
ip link show | grep -E "UP|DOWN"
echo ""
echo "[L2] Gateway Reachable:"
GW=$(ip route | grep default | awk '{print $3}')
ping -c 2 $GW &>/dev/null && echo "Gateway $GW: ok" || echo "Gateway $GW: FAIL"
echo ""
echo "[L3] Routing table:"
ip route show
echo ""
echo "[L7] DNS RESOLUTION:"
nslookup google.com &>/dev/null && echo "DNS: ok" || echo "DNS: FAIL"
echo ""
echo "[L7] Internet Connectivity:"
curl -s --max-time 5 https://google.com &>/dev/null && echo "Internet: ok" || echo "Internet: FAIL"

