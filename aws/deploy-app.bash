#!/bin/bash

LOG=/home/ec2-user/deploy-app.log
touch $LOG

cd /home/ec2-user

# stop app
sudo service quantum-sprinkles stop

echo "Pulling code from S3"

# get bashrc
aws s3 cp s3://quantum-sprinkles/aws/ec2-user-bashrc /home/ec2-user/.bashrc >> $LOG 2>&1
chmod 644 /home/ec2-user/.bashrc >> $LOG 2>&1

# pull app from S3
tar cpf /home/ec2-user/rollback.tar /home/ec2-user/app
rm -rf /home/ec2-user/app
aws s3 cp s3://quantum-sprinkles/deploy /home/ec2-user/app --recursive >> $LOG 2>&1

# get deploy script
# won't matter on this run but will take effect next time
aws s3 cp s3://quantum-sprinkles/aws/deploy-app.bash /home/ec2-user/deploy-app.bash >> $LOG 2>&1
chmod 755 /home/ec2-user/deploy-app.bash >> $LOG 2>&1

# bundle install sinatra and such
cd /home/ec2-user/app
bundle install --without documentation >> $LOG 2>&1

# start app
sudo service quantum-sprinkles start

