#!/bin/bash
# prep raw Amazon Linux EC2 instance for base setup of Quantum Sprinkles

######################################################################
# INCLUDE THIS FILE AS "USER DATA" WHEN YOU LAUNCH THE EC2 INSTANCE
######################################################################

# install the AWS CLI tool
sudo pip install awscli > $LOG 2>&1

# copy the quantum-sprinkles init.d script and add to chkconfig
sudo aws s3 cp s3://quantum-sprinkles/aws/setup-webserver.bash /home/ec2-user/setup-webserver.bash
sudo chown ec2-user:ec2-user /home/ec2-user/setup-webserver.bash
sudo chmod 755 /home/ec2-user/setup-webserver.bash

# run the webserver setup as the user that will be running the webserver
# currently this is ec2-user, if the user changes this script may need
# to be modified to deal with changing sudo permissions because you are
# probably trying to run as a user that does NOT have sudo ALL perms
sudo -u ec2-user /home/ec2-user/setup-webserver.bash

