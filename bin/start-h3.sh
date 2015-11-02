#!/usr/bin/env bash
#
# Start the VNC server.
#
echo -e "qqqqqq\nqqqqqq\n" | vnc4server -geometry 800x600 -depth 16
export DISPLAY=:1

#
# WebSockify proxying of the port.
#
websockify --web=/home/raptor/novnc/ 8081 localhost:5901 1>/dev/null 2>&1 &

cd "/home/raptor/.wine/drive_c/Program Files (x86)/3DO/Heroes III Demo"
wine h3demo.exe

#
# cleanup processes
#
kill $(ps | grep -v bash | grep -v grep | grep -v PID | tr -s " " | cut -f2 -d\ )

