#!/bin/bash
clear
read -r -p "What is the DOMAIN Name for this wordpress? " DOMAIN
read -r -p "What is the SUB-DOMAIN Name for this wordpress? (By default 'www' will be used if no subdomain is selected). " SUBDOMAIN
read -r -p "MYSQL Hostname? (By default 'localhost' will be used.) " DB_HOST
read -r -p "MYSQL Username? " DB_USER
read -r -p "MYSQL Database? " DB_NAME
read -r -p "MYSQL Password? " DB_PASSWORD
read -r -p "What network to add onto TRAEFIK? " TNETWORK

if [ -z "$SUBDOMAIN" ]; then
   SUBDOMAIN=www
fi
if [ -z "$DB_HOST" ]; then
   DB_HOST=localhost
fi


echo "$(tput setaf 1)Creating the .env file with the values we have gathered"
printf "\\n"
cat << EOF > .env
EOF
{
echo "DOMAIN=$DOMAIN"
echo "SUBDOMAIN=$SUBDOMAIN"
echo "DB_HOST=$DB_HOST"
echo "DB_USER=$DB_USER"
echo "DB_NAME=$DB_NAME"
echo "DB_PASSWORD=$DB_PASSWORD"
echo "TNETWORK=$TNETWORK"
} >> .env
echo ".env file creation complete"
printf "\\n\\n"

# Download & Launch the containers
echo "The containers will now be pulled and launched"
echo "This may take a while depending on your download speed"
read -r -p "Press any key to continue... " -n1 -s
printf "\\n\\n"
docker-compose up -d
printf "\\n\\n"


printf "Setup Complete - Open a browser and go to: \\n\\n"
printf "https://"$SUBDOMAIN"."$DOMAIN"\\n\\n"


