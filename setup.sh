#!/bin/bash

# clone repo and save path as variable
git clone https://github.com/jackyzha0/quartz
cd quartz
path="$(pwd)"
echo "[INFO]: PATH: $path"

# npm install
sudo npm i

# creating starting script in /usr/bin/
cd ..
echo "[INFO]: Creating starting script..."
echo "#!/bin/bash" > quartz-start.sh
echo "cd $path" >> quartz-start.sh
echo "npx quartz build --serve" >> quartz-start.sh
sudo chmod +x quartz-start.sh
sudo cp quartz-start.sh /usr/bin/

# install systemd service
echo "[INFO]: Installing systemd service..."
sudo cp quartz-server.service /etc/systemd/system/
sudo systemctl enable quartz-server.service
sudo systemctl start quartz-server.service
