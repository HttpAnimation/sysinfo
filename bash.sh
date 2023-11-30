#!/bin/bash

# Function to display system information
display_info() {
  echo "System Information:"
  echo "1. Uptime: $(uptime -p)"
  echo "2. IP Address: $(hostname -I | cut -d' ' -f1)"
  echo "3. CPU Usage: $(top -bn1 | grep "Cpu(s)" | awk '{print $2}')%"
  echo "4. RAM: $(free -m | awk '/^Mem:/{print $3 " MB used / " $2 " MB total"}')"
  echo "5. Disk Usage: $(df -h | awk '$NF=="/"{print "Used: " $3 " / Total: " $2}')"
  echo "6. Network: $(ip route | grep default | awk '{print $5}')"
  echo "7. Logged-in Users: $(who | awk '{print $1}' | sort -u | tr '\n' ', ')"
  echo "8. Timestamp: $(date)"
}

# Display system information
display_info
