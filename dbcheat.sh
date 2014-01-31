#!/bin/bash
 
echo -n "Enter the MySQL root password: "
read -s rootpw
echo -n "Enter database name: "
read dbname
echo -n "Enter database username: "
read dbuser
echo -n "Enter database user password: "
read dbpw
echo -n "Enter project name: "
read project 

db="create database $dbname;GRANT ALL PRIVILEGES ON $dbname.* TO $dbuser@localhost IDENTIFIED BY '$dbpw';FLUSH PRIVILEGES;"
mysql -u root -p$rootpw -e "$db"
 
if [ $? != "0" ]; then
 echo "[Error]: Database creation failed"
 exit 1
else
 echo "------------------------------------------"
 echo " Database has been created successfully "
 echo "------------------------------------------"
 echo " DB Info: "
 echo ""
 echo " DB Name: $dbname"
 echo " DB User: $dbuser"
 echo " DB Pass: $dbpw"
 echo ""
 echo "------------------------------------------"
 
 echo "DB_NAME=$dbname" >> ".env"
 echo "DB_USER=$dbuser" >> ".env"
 echo "DB_PASSWORD=$dbpw" >> ".env"
 echo "DB_HOST=localhost" >> ".env"
 
 echo "WP_ENV=development" >> ".env"
 echo "WP_HOME=http://$project.fmay.boxes.codiodev.com:3000/" >> ".env"
 echo "WP_SITEURL=http://$project.fmay.boxes.codiodev.com:3000/wp"  >> ".env"
fi
