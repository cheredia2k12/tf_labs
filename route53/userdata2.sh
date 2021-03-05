#!/bin/bash
export PATH=$PATH:/usr/local/bin
sudo -i
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
yum install -y httpd curl bind-utils
echo "SALE ESA CALL MI REY? EL SNOW COME" > /var/www/html/index.html
systemctl start httpd
systemctl enable httpd
echo "test_datasource" > hola.txt