export DISPLAY=:0

Xvfb :0 -screen 0 1920x1080x24 -ac >> xvfb.log 2>&1 &
sleep 10s
nohup openbox >> openbox.log 2>&1 &
sleep 10s
x11vnc -shared -forever -display :0 >> vnc.log 2>&1 &
sleep 10s

yarn start