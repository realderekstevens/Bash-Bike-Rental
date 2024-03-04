#!/bin/bash
#https://www.youtube.com/watch?v=3s3IUCKkJ1k
#https://github.com/freeCodeCamp/learn-bash-and-sql-by-building-a-bike-rental-shop/blob/main/TUTORIAL.md


PSQL="psql -X --username=postgres --dbname=bikes --tuples-only -c"
PSQL_CreateDatabase="psql -X --username=postgres --dbname=postgres --tuples-only -c"

MAIN_MENU(){
   if [[ $1 ]]
   then
      echo -e "\n$1"
   fi
   echo -e "\n~~~~~ Bike Rental Shop ~~~~~"
   echo "How may I help you?"
   echo -e "\n0. Create Database\n1. Delete Database\n2. Rent a Bike \n3. Return a Bike\n4. Exit\n5. List Databases\n6. Create Table Bikes\n7. List Tables\n8. Show Schema Table Bikes\n9. Drop Table Bikes\n"
   echo "Enter Command: "
   read MAIN_MENU_SELECTION
   case $MAIN_MENU_SELECTION in
   0) CREATE_DATABASE ;;
   1) DELETE_DATABASE ;;
   2) RENT_MENU ;;
   3) RETURN_MENU ;;
   4) EXIT ;;
   5) LIST_DATABASES ;;
   6) CREATE_TABLE_BIKES ;;
   7) LIST_TABLES ;;
   8) LIST_TABLE_BIKES ;;
   9) DROP_TABLE_BIKES ;;
   *) MAIN_MENU "Please enter a valid option." ;;
esac
}

CREATE_DATABASE(){
	$PSQL_CreateDatabase "CREATE DATABASE bikes;"
	MAIN_MENU "Bikes Database Created"
}

DELETE_DATABASE(){
	$PSQL_CreateDatabase "DROP DATABASE bikes;"
	MAIN_MENU "Bikes Database Deleted"
}


RETURN_MENU(){
   echo "Return Menu"
}

EXIT(){
   echo -e "\nThank you for stopping in.\n"
}

LIST_DATABASES(){
	$PSQL_CreateDatabase "\l"
	MAIN_MENU "Listed Databases"
}

CREATE_TABLE_BIKES(){
	$PSQL "CREATE TABLE bikes();"
	$PSQL "ALTER TABLE bikes ADD COLUMN bike_id SERIAL PRIMARY KEY;"
	$PSQL "ALTER TABLE bikes ADD COLUMN type VARCHAR(50) NOT NULL;"
	$PSQL "ALTER TABLE bikes ADD COLUMN size INT NOT NULL;"
	MAIN_MENU "Created Tables Bikes"
	
}

LIST_TABLES(){
	$PSQL "\dt+"
	MAIN_MENU "Listed Tables"
}

LIST_TABLE_BIKES(){
	$PSQL "\d bikes"
	MAIN_MENU "Listed Table Bikes"
}

DROP_TABLE_BIKES(){
	$PSQL "DROP TABLE bikes;"
	MAIN_MENU "Dropped Table Bikes"
}

MAIN_MENU
