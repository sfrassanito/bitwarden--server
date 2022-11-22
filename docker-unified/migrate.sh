#!/bin/bash

# Set domain
BW_DOMAIN=$(sed -E -n "s/^url.*\/\/(.*)$/\1/p" bwdata/config.yml)
sed -E -i '' "s/^(BW_DOMAIN=).*/\1$BW_DOMAIN/" settings.env

# Set database provider
BW_DB_PROVIDER=sqlserver
sed -E -i '' "s/^(BW_DB_PROVIDER=).*/\1$BW_DB_PROVIDER/" settings.env

# Set database name
BW_DB_DATABASE=$(sed -E -n "s/^.*connectionString.*Catalog=([^;]*);.*$/\1/p" bwdata/env/global.override.env)
sed -E -i '' "s/^(BW_DB_DATABASE=).*/\1$BW_DB_DATABASE/" settings.env

# Set database username
BW_DB_USERNAME=$(sed -E -n "s/^.*connectionString.*ID=([^;]*);.*$/\1/p" bwdata/env/global.override.env)
sed -E -i '' "s/^(BW_DB_USERNAME=).*/\1$BW_DB_USERNAME/" settings.env

# Set database password
BW_DB_PASSWORD=$(sed -E -n "s/^.*connectionString.*Password=([^;]*);.*$/\1/p" bwdata/env/global.override.env)
sed -E -i '' "s/^(BW_DB_PASSWORD=).*/\1$BW_DB_PASSWORD/" settings.env

# Set installation ID
BW_INSTALLATION_ID=$(sed -E -n "s/^.*installation__id=(.*)$/\1/p" bwdata/env/global.override.env)
sed -E -i '' "s/^(BW_INSTALLATION_ID=).*/\1$BW_INSTALLATION_ID/" settings.env

# Set installation key
BW_INSTALLATION_KEY=$(sed -E -n "s/^.*installation__key=(.*)$/\1/p" bwdata/env/global.override.env)
sed -E -i '' "s/^(BW_INSTALLATION_KEY=).*/\1$BW_INSTALLATION_KEY/" settings.env

# Set email settings
globalSettings__mail__replyToEmail=$(sed -E -n "s/^.*mail__replyToEmail=(.*)$/\1/p" bwdata/env/global.override.env)
sed -E -i '' "s/^#*(globalSettings__mail__replyToEmail=).*/\1$globalSettings__mail__replyToEmail/" settings.env
