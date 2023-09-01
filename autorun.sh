mkdir -p /home/minecraft/backup

find /home/minecraft/backup -mtime +14 -type f -name "*.zip" -exec rm -rf {} \;

sleep 2

mkdir -p /home/minecraft/backup/temp

echo 'mkdir done'

mkdir -p /home/minecraft/backup/temp/mcserver

cp -r /home/minecraft/worlds/* /home/minecraft/backup/temp/mcserver

sleep 2

echo 'copy done'

zip -q -r /home/minecraft/backup/mcserver$(date +%Y%m%d).zip /home/minecraft/backup/temp/mcserver

echo 'zip done'

sleep 2

rm -rf /home/minecraft/backup/temp

echo 'backup finished'



sleep 2

screen -dmS minecraft

sleep 2

screen -x -S minecraft -p 0 -X stuff "cd /home/minecraft"

screen -x -S minecraft -p 0 -X stuff '\n'

screen -x -S minecraft -p 0 -X stuff "sudo LD_LIBRARY_PATH=. ./bedrock_server"

screen -x -S minecraft -p 0 -X stuff '\n'

echo 'server opened'

echo 'all done'

exit 0
