# This script was tested on Ubuntu 8.10

echo -e '\n\nInstalling required packages'

echo -e '\n\n=Updating packages'
sudo apt-get update

echo -e '\n\n= Git'
sudo apt-get install git-core -y

echo -e '\n\n= JDK'
sudo apt-get install sun-java6-jdk -y

echo -e '\n\n= Xml packages'
sudo apt-get -y install build-essential zlib1g zlib1g-dev libxml2 libxml2-dev libxslt-dev sqlite3 libsqlite3-dev locate -y

echo -e '\n\n= Wget, Curl'
sudo apt-get -y install curl wget -y 

echo -e '\n\n= RMagick'
sudo apt-get -y install libmagick9-dev -y

echo -e '\n\n= MySQL'
sudo apt-get install mysql-server mysql-client emma -y
sudo apt-get install mysql-ruby -y
sudo apt-get install libmysqlclient15-dev -y


echo -e '\n\n= Ruby (MRI)'
sudo apt-get -y install ruby1.8-dev ruby1.8 ri1.8 rdoc1.8 irb1.8 libreadline-ruby1.8 libruby1.8 libopenssl-ruby -y
sudo ln -s /usr/bin/ruby1.8 /usr/bin/ruby
sudo ln -s /usr/bin/rdoc1.8 /usr/bin/rdoc
sudo ln -s /usr/bin/irb1.8 /usr/bin/irb
sudo ln -s /usr/bin/ri1.8 /usr/bin/ri

echo -e '\n\n= Rubygems'
sudo apt-get install rubygems
sudo gem install rubygems-update
sudo /var/lib/gems/1.8/bin/update_rubygems

sudo chmod +x setup_gems.sh
./setup_gems.sh



