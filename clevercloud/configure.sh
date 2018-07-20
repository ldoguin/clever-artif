#!/bin/bash

if [ ! -f /app/artifactory/home/etc/artifactory.config.xml ]; then
	mkdir /app/artifactory/home
	mkdir /app/artifactory/home/etc
fi
rm /app/artifactory/home/etc/db.properties
rm /app/artifactory/home/etc/binarystore.xml
echo "type=postgresql
driver=org.postgresql.Driver
url=jdbc:postgresql://$POSTGRESQL_ADDON_HOST:$POSTGRESQL_ADDON_PORT/$POSTGRESQL_ADDON_DB
username=$POSTGRESQL_ADDON_USER
password=$POSTGRESQL_ADDON_PASSWORD"  >> /app/artifactory/home/etc/db.properties
echo '<?xml version="1.0" encoding="UTF-8"?>
<config version="v1">
	<chain template="file-system"/>
	<provider id="file-system" type="file-system">
	    <baseDataDir>/app/artifactory/data</baseDataDir>
	    <fileStoreDir>/app/artifactory/filestore</fileStoreDir>
	    <tempDir>/app/artifactory/temp</tempDir>
	</provider>
</config>' >>  /app/artifactory/home/etc/binarystore.xml

