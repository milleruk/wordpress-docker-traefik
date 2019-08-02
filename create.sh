clear
read -r -p "What is the DOMAIN Name for this wordpress? " DOMAIN
read -r -p "What is the SUB-DOMAIN Name for this wordpress? " SUBDOMAIN
read -r -p "MYSQL Hostname? " DB_HOST
read -r -p "MYSQL Username? " DB_USER
read -r -p "MYSQL Database? " DB_NAME
read -r -p "MYSQL Password? " DB_PASSWORD
read -r -p "What network to add onto TRAEFIK? " TNETWORK



echo "Creating the .env file with the values we have gathered"
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
