```bash

## Setting up a php web server with load balancer

uname -a
lsb_release -a

### Prepare TEST ENV at your host
echo "deb http://download.virtualbox.org/virtualbox/debian buster contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
wget https://www.virtualbox.org/download/oracle_vbox_2016.asc
sudo apt-key add oracle_vbox_2016.asc
sudo apt-get update
sudo apt-get install -y virtualbox-6.0 # (version 6.1 is not supported by default vagrant version 2.2.3)
sudo apt-get install vagrant
vagrant init centos/7

### Using vagrand

# change resources under config.vm.provider
# vagrant up
# vagrant destroy
# vagrant suspend
# vagrant resume
# vagrant reload
# vagrant box list
# export VAGRANT_DEFAULT_PROVIDER=virtualbox (if needed)

vagrant ssh

### Create actual web server using centos 7

sudo yum install httpd
sudo systemctl status httpd
sudo systemctl enable httpd
sudo systemctl start  httpd

# /var/log/httpd <-- apache logs located here
# /var/www/html  <-- put the actual index.html page here


# systemctl reload httpd <-- just reload configuration of apache (instead of restart)
# systemctl stop httpd

```