#!/usr/bin/env bash

# Much of this below was initially adapted from an answer on an Ask Ubuntu question found here: 
# https://askubuntu.com/questions/1705/how-can-i-create-a-select-menu-in-a-shell-script

TERMINAL=$(tty)
HEIGHT=15
WIDTH=78
BACKTITLE="Choose Your Own DevOps"
TITLE="The DevOps Simulator"


function menu () {
    dialog --backtitle "$BACKTITLE" \
            --title "$TITLE" \
            --menu "$MENU" \
            $HEIGHT $WIDTH $CHOICE_HEIGHT \
            "${OPTIONS[@]}" \
            2>&1 >$TERMINAL
}

function intro () {
    dialog --clear \
    --backtitle "$BACKTITLE" \
    --title "WELCOME EMAIL" "$@" \
    --msgbox "Welcome to ACME Corp!
We're so happy you could start a week early!
We just got approval on our hiring spend, but didn't want to
start bothering people on LinkedIn until you made some platform
decisions to help us with our search.

Can you get these back to us by the end of the day?

I know this is your first Lead role since being a senior engineer,
but we're sure you're going to nail it!

Besides, everyone else who applied for the position wanted
double what you were asking, so it's win-win, right?" 0 0
}


function infra () {
    CHOICE_HEIGHT=4
    MENU="Choose one of the following paths for your infrastructure:"

    OPTIONS=(1 "On-Prem"
             2 "Cloud-Based"
             3 "Hybrid Cloud"
             4 "Multi-Cloud")

    INFRA=$(menu)
    #INFRA=$(dialog --clear \
    #                --backtitle "$BACKTITLE" \
    #                --title "$TITLE" \
    #                --menu "$MENU" \
    #                $HEIGHT $WIDTH $CHOICE_HEIGHT \
    #                "${OPTIONS[@]}" \
    #                2>&1 >$TERMINAL)

    case $INFRA in
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
}


function arch () {
    CHOICE_HEIGHT=5
    MENU="Choose the architecture that is going to be your primary platform:"

    OPTIONS=(1 "X86-64"
            2 "ARM"
            3 "RISC"
            4 "MIPS"
            5 "Power")

    ARCH=$(menu)
    #ARCH=$(dialog --clear \
    #        --backtitle "$BACKTITLE" \
    #        --title "$TITLE" \
    #        --menu "$MENU" \
    #        $HEIGHT $WIDTH $CHOICE_HEIGHT \
    #        "${OPTIONS[@]}" \
    #        2>&1 >$TERMINAL)
}


function email_reply () {
    dialog --sleep 1 \
    --backtitle "$BACKTITLE" \
    --title "WELCOME EMAIL" "$@" \
    --title "Reply from Talent Development" "$@" \
    --msgbox "Hey thanks for getting back to us so quickly!
I pushed out a job req. for another Lead to help you, one for a
VP and a desktop support technician.

Wasn't sure what you meant about \"CI/CD\" so I just wrote down
what we used at my last place: Team Foundation Server - same thing,
right?" 0 0
}


function cloud () {
    CHOICE_HEIGHT=7
    MENU="Please select from one or more of the most popular cloud providers:"
    OPTIONS=(1 "AWS"
            2 "GCP"
            3 "Azure"
            4 "AliCloud"
            5 "Oracle"
            6 "IBM Cloud Services"
            7 "Salesforce")

    CLOUD=$(menu)
    #CLOUD=$(dialog --clear \
    #        --backtitle "$BACKTITLE" \
    #        --title "$TITLE" \
    #        --menu "$MENU" \
    #        $HEIGHT $WIDTH $CHOICE_HEIGHT \
    #        "${OPTIONS[@]}" \
    #        2>&1 >$TERMINAL)
}

function database () {
    CHOICE_HEIGHT=11
    MENU="Please select your primary datastore:"

    OPTIONS=(1 "MySQL"
            2 "MariaDB"
            3 "PostgreSQL"
            4 "Oracle DB"
            5 "IBM DB2"
            6 "Microsoft SQL Server"
            7 "Cassandra"
            8 "HBase"
            9 "Redis"
            10 "Elasticsearch"
            11 "Mongo")

    DATABASE=$(menu)
    #DATABASE=$(dialog --clear \
    #        --backtitle "$BACKTITLE" \
    #        --title "$TITLE" \
    #        --menu "$MENU" \
    #        $HEIGHT $WIDTH $CHOICE_HEIGHT \
    #        "${OPTIONS[@]}" \
    #        2>&1 >$TERMINAL)
}


function language () {
    CHOICE_HEIGHT=20
    MENU="Please select your primary programming language:"

    OPTIONS=(1 "Javascript"
            2 "PHP"
            3 "Ruby"
            4 "Python"
            5 "C#"
            6 "C++"
            7 "Java"
            8 "R"
            9 "Objective-C"
            10 "Swift"
            11 "Kotlin"
            12 "Typescript"
            13 "Go"
            14 "Rust"
            15 "Scala"
            16 "Dart"
            17 "Lua"
            18 "Erlang"
            19 "Perl"
            20 "Haskell")
    LANGUAGE=$(menu)
    #LANGUAGE=$(dialog --clear \
    #        --backtitle "$BACKTITLE" \
    #        --title "$TITLE" \
    #        --menu "$MENU" \
    #        $HEIGHT $WIDTH $CHOICE_HEIGHT \
    #        "${OPTIONS[@]}" \
    #        2>&1 >$TERMINAL)
}


function main () {
    intro 
    infra
    arch
    cloud
    language
    database
    email_reply
    clear
}

main
