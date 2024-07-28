#!/bin/bash

echo "[INFO]: Uninstalling yt-local..."
sudo systemctl stop quartz-server.service
sudo systemctl disable quartz-server.service
sudo rm /etc/systemd/system/quartz-server.service
sudo systemctl daemon-reload
sudo rm -rf quartz
sudo rm /usr/bin/quartz-start.sh
