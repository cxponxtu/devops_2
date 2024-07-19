#! /bin/sh

# Timestamp
echo "`date +'%d-%m-%y_%H_%M_%S'`\nStart of log\n" >> deploy.log

# Pulling images
echo "Pulling images..."
docker compose pull 2>&1 | cat >> deploy.log
if [ $? -eq 0 ]
then
    echo "Images pulled successfully."
else
    echo "Error pulling images. See deploy.log for more details."
    exit 1
fi

# Restarting services
echo "Restarting services..."
docker compose up -d --build 2>&1 | cat >> deploy.log
if [ $? -eq 0 ]
then
    echo "Services restarted successfully."
else
    echo "Error restarting services. See deploy.log for more details."
    exit 1
fi

echo "\nEnd of log file.\n\n\n" >> deploy.log
