#! /bin/sh

# Timestamp
echo "`date +'%d-%m-%y %H:%M:%S'`\tStart of command" >> deploy.log

# Pulling images
echo "Pulling latest images..."
echo "`date +'%d-%m-%y %H:%M:%S'`\tPulling latest images..." >> deploy.log
err="`docker compose pull 2>&1`"
if [ $? -eq 0 ]
then
    echo "Images pulled successfully"
    echo "`date +'%d-%m-%y %H:%M:%S'`\tImages pulled successfully" >> deploy.log
else
    # echo "`date +'%d-%m-%y %H:%M:%S'`\t$err" >> deploy.log
    echo "Error pulling images. See deploy.log for more details."
    echo "`date +'%d-%m-%y %H:%M:%S'`\t$err" >> deploy.log
    echo "`date +'%d-%m-%y %H:%M:%S'`\tEnd of command\n\n" >> deploy.log
    exit 1
fi

# Restarting services
echo "Restarting services..."
echo "`date +'%d-%m-%y %H:%M:%S'`\tRestarting services..." >> deploy.log
err="`docker compose up -d --build 2>&1`"
if [ $? -eq 0 ]
then
    echo "Services restarted successfully"
    echo "`date +'%d-%m-%y %H:%M:%S'`\tServices restarted successfully" >> deploy.log
else
    echo "`date +'%d-%m-%y %H:%M:%S'`\t$err" >> deploy.log
    echo "`date +'%d-%m-%y %H:%M:%S'`\tEnd of command\n\n" >> deploy.log
    echo "Error restarting services. See deploy.log for more details."
    exit 1
fi

echo "`date +'%d-%m-%y %H:%M:%S'`\tEnd of command\n\n" >> deploy.log
