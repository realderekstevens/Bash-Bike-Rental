#!/bin/bash

PSQL="psql -X --username=postgres --dbname=bikes --tuples-only -c"

echo -e "\n~~~~~ Bike Rental Shop ~~~~~"

MAIN_MENU(){
   if [[ $1 ]]
   then
      echo -e "\n$1"
   fi
   echo "How may I help you?"
   echo -e "\n1. Rent a bike\n2. Return a bike \n3. Exit "
   read MAIN_MENU_SELECTION
   case $MAIN_MENU_SELECTION in
   1) RENT_MENU ;;
   2) RETURN_MENU ;;
   3) EXIT ;;
   *) MAIN_MENU "Please enter a valid option." ;;
esac
}

RENT_MENU(){
   AVAILABLE_BIKES=$($PSQL "SELECT bike_id, type, size FROM bikes WHERE available = true ORDER BY bike_id")
   echo "$AVAILABLE_BIKES"
}

RETURN_MENU(){
   echo "Return Menu"
}

EXIT(){
   echo "Thank you for stopping in."
}

MAIN_MENU
