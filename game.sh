#!/usr/bin/env bash

TERMINAL=$(tty)
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Choose Your Own DevOps"
TITLE="The DevOps Simulator"
MENU="Choose one of the following paths for your infrastructure:"

OPTIONS=(1 "On-Prem"
         2 "Cloud-Based"
         3 "Hybrid Cloud"
	 4 "Multi-Cloud")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >$TERMINAL)

clear
case $CHOICE in
        1)
            echo "You chose Option 1"
            ;;
        2)
            echo "You chose Option 2"
            ;;
        3)
            echo "You chose Option 3"
            ;;
	4)
	    echo "You chose Option 4"
	    ;;
esac
