#!/bin/bash

e=${ENVIROMENT}
if [ "$e" = "dev" ]; then
	echo dev
	cp /tomcat/deploy/dev/* /tomcat/conf
elif [ "$e" = "qa" ]; then
	echo qa
	cp /tomcat/deploy/qa/* /tomcat/conf
elif [ "$e" = "prod" ]; then
	echo prod
	cp /tomcat/deploy/prod/* /tomcat/conf
else
	echo Not set
fi



echo ========================================================================
echo Tomcat is using enviroment:
echo "     ${e}"
echo ========================================================================