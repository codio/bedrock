#!/bin/bash
 
cp wp-config-sample.php ~/workspace/wp/wp-config.php 

echo -n "Enter project name: "
read project 

db="create database wp;GRANT ALL PRIVILEGES ON wp.* TO root@localhost IDENTIFIED BY 'qqqqqq';FLUSH PRIVILEGES;"
mysqladmin -u root password qqqqqq
mysql -u root -pqqqqqq -e "$db"
 
if [ $? != "0" ]; then
 echo "[Error]: Database creation failed"
 exit 1
else
 echo "----------------------------------------------"
 echo " Database details added by Codio cheat script "
 echo "---------------------------------------------"
 echo " DB Info: "
 echo ""
 echo " DB Name: wp"
 echo " DB User: root"
 echo ""
 echo "------------------------------------------"
 
 echo "DB_NAME=wp" >> ".env"
 echo "DB_USER=root" >> ".env"
 echo "DB_PASSWORD=qqqqqq" >> ".env"
 echo "DB_HOST=localhost" >> ".env"
 
 echo "WP_ENV=development" >> ".env"
 echo "WP_HOME=http://$project.fmay.boxes.codiodev.com:3000/" >> ".env"
 echo "WP_SITEURL=http://$project.fmay.boxes.codiodev.com:3000/wp"  >> ".env"
fi
