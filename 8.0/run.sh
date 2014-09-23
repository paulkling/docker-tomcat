#!/bin/bash

if [ ! -f /.tomcat_admin_created ]; then
    /create_tomcat_admin_user.sh
fi

if [ ! -f /.cp_enviroment_settings.sh ]; then
    /cp_enviroment_settings.sh
fi

exec ${CATALINA_HOME}/bin/catalina.sh run
