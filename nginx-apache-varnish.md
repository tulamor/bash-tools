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

### Using vagrant

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
### Apache
yum install httpd
systemctl status httpd
systemctl enable httpd
systemctl start httpd
systemctl stop httpd
systemctl reload httpd <-- just reload configuration of apache (instead of restart)
journalctl -u apache.service


# ports configuration
nano /etc/apache2/ports.conf     [On Debian/Ubuntu]
nano /etc/httpd/conf/httpd.conf  [On RHEL/CentOS]
setenforce 0 <-- if apache coould not start tru to Disable SELinux temporarily for debugging

/var/www/html  # index.html location
tail /var/log/httpd/access_log
tail /var/log/httpd/error_log


### NGINX
yum install epel-release yum-utils # # add the CentOS 7 EPEL repository
yum install nginx
systemctl start nginx
systemctl enable nginx # enable Nginx to start when your system boots

nano /etc/nginx/nginx.conf # global configuration
tail /var/log/nginx/access.log
tail /var/log/nginx/error.log
sudo nginx -t # -t test configuration for nginx

### PHP
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum-config-manager --enable remi-php73
yum install php php-fpm


```
