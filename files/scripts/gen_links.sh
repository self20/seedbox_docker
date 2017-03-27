#!/bin/bash

rm files/start_menu/www/dl.html files/start_menu/www/autodl.html files/start_menu/www/stream.html files/start_menu/www/tools.html
touch files/start_menu/www/dl.html files/start_menu/www/autodl.html files/start_menu/www/stream.html files/start_menu/www/tools.html

for APP in "${INSTALLED[@]}"
do
        CNAME=_CNAME
        CPORT=_CPORT
        ICON=_ICON
        CONTNAME=$(eval "echo \$$APP$CNAME")
        FPORT=$(eval "echo \$$APP$CPORT")
        FICON=$(eval "echo \$$APP$ICON")
        FNAME=`echo $CONTNAME | awk -F_ '{print $2}'`
	STATE=`docker inspect -f {{.State.Running}} $CONTNAME`

        echo -e "${CYELLOW} Download apps : $CEND"
        echo " "
        for KEY in "${dl[@]}"
        do
                if [ "$KEY" == "$APP" ]
                then
			echo "        <a href=\"http://$LAN:$FPORT\" target=\"_blank\" title=\"$FNAME\">" >> files/start_menu/www/dl.html
			echo "          <i class=\"fa $FICON\"></i>" >> files/start_menu/www/dl.html
			echo "        </a>" >> files/start_menu/www/dl.html
			if [ "$STATE" == "true" ]
			then
				echo -e "=> [ ${CGREEN}OK$CEND ] $FNAME is now installed and running."
			else
				echo -e "!! [ ${CRED}KO$CEND ] $FNAME is not installed, but not running. Please check logs with "docker logs $CONTNAME" !"
			fi
                fi
        done

	echo -e "${CYELLOW} Download automation apps : $CEND"
        echo " "
        for KEY in "${autodl[@]}"
        do
                if [ "$KEY" == "$APP" ]
                then
                        echo "        <a href=\"http://$LAN:$FPORT\" target=\"_blank\" title=\"$FNAME\">" >> files/start_menu/www/autodl.html
                        echo "          <i class=\"fa $FICON\"></i>" >> files/start_menu/www/autodl.html
                        echo "        </a>" >> files/start_menu/www/autodl.html
                        if [ "$STATE" == "true" ]
                        then
                                echo -e "=> [ ${CGREEN}OK$CEND ] $FNAME is now installed and running."
                        else
                                echo -e "!! [ ${CRED}KO$CEND ] $FNAME is not installed, but not running. Please check logs with "docker logs $CONTNAME" !"
                        fi
                fi
        done

        echo -e "${CYELLOW} Streaming apps : $CEND"
        echo " "
        for KEY in "${stream[@]}"
        do
                if [ "$KEY" == "$APP" ]
                then
                        echo "        <a href=\"http://$LAN:$FPORT\" target=\"_blank\" title=\"$FNAME\">" >> files/start_menu/www/stream.html
                        echo "          <i class=\"fa $FICON\"></i>" >> files/start_menu/www/stream.html
                        echo "        </a>" >> files/start_menu/www/stream.html
                        if [ "$STATE" == "true" ]
                        then
                                echo -e "=> [ ${CGREEN}OK$CEND ] $FNAME is now installed and running."
                        else
                                echo -e "!! [ ${CRED}KO$CEND ] $FNAME is not installed, but not running. Please check logs with "docker logs $CONTNAME" !"
                        fi
                fi
        done

        echo -e "${CYELLOW} Tools : $CEND"
        echo " "
        for KEY in "${tool[@]}"
        do
                if [ "$KEY" == "$APP" ]
                then
                        echo "        <a href=\"http://$LAN:$FPORT\" target=\"_blank\" title=\"$FNAME\">" >> files/start_menu/www/tools.html
                        echo "          <i class=\"fa $FICON\"></i>" >> files/start_menu/www/tools.html
                        echo "        </a>" >> files/start_menu/www/tools.html
                        if [ "$STATE" == "true" ]
                        then
                                echo -e "=> [ ${CGREEN}OK$CEND ] $FNAME is now installed and running. Please configure it trough it's own interface."
                        else
                                echo -e "!! [ ${CRED}KO$CEND ] $FNAME is not installed, but not running. Please check logs with "docker logs $CONTNAME" !"
                        fi
                fi
        done
done 
