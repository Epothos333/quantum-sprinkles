#!/bin/bash
# prep not-quite-raw Amazon Linux EC2 instance for deployment of Quantum Sprinkles

######################################################################
# This should be run as the user that will own/run the webserver, if
# this changes from ec2-user make sure the sudo stuff gets sorted
#
# Currently this is being called at the end of the setup-server.bash
# script which is being passwd to AWS as user data during EC2 launch
######################################################################

LOG=/home/ec2-user/setup-webserver.log
touch $LOG

# install ruby and prep for sinatra
sudo yum install ruby22 ruby22-devel -y >> $LOG 2>&1
sudo update-alternatives --set ruby /usr/bin/ruby2.2 >> $LOG 2>&1
gem install bundler >> $LOG 2>&1

# redirect default HTTP/HTTPS ports to default rackup port
sudo iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 9292 >> $LOG 2>&1
sudo iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 443 -j REDIRECT --to-port 9292 >> $LOG 2>&1
sudo iptables-save >> $LOG 2>&1

# copy the quantum-sprinkles init.d script and add to chkconfig
sudo aws s3 cp s3://quantum-sprinkles/aws/quantum-sprinkles /etc/init.d/quantum-sprinkles >> $LOG 2>&1
sudo chmod 755 /etc/init.d/quantum-sprinkles >> $LOG 2>&1
sudo chkconfig --add quantum-sprinkles >> $LOG 2>&1

# get deploy script
sudo aws s3 cp s3://quantum-sprinkles/aws/deploy-app.bash /home/ec2-user/deploy-app.bash >> $LOG 2>&1
sudo chmod 755 /home/ec2-user/deploy-app.bash >> $LOG 2>&1

# pull app from S3
sudo aws s3 cp s3://quantum-sprinkles/deploy /home/ec2-user/app --recursive >> $LOG 2>&1
sudo chown -R ec2-user:ec2-user /home/ec2-user/app >> $LOG 2>&1

# broken due to env at runtime, figure out later

# bundle install sinatra and such
#cd /home/ec2-user/app
#bundle install >> $LOG 2>&1

# start app
#sudo service quantum-sprinkles start

