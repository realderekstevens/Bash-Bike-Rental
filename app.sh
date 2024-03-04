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
   echo -e "\n0. Database Management Menu\n1. Rent Menu\n2. Exit Program\n"
   echo "Enter Command: "
   read MAIN_MENU_SELECTION
   case $MAIN_MENU_SELECTION in
   0) DATABASE_MANAGEMENT_MENU ;;
   1) RENT_MENU ;;
   2) EXIT ;;
   *) MAIN_MENU "Please enter a valid option." ;;
esac
}

DATABASE_MANAGEMENT_MENU(){
   if [[ $1 ]]
   then
      echo -e "\n$1"
   fi
   echo -e "\n~~~~~ DATABASE MANAGEMENT MENU ~~~~~"
   echo -e "\n0. Return To Main Menu\n1. Create Database\n2. Create Table Bikes\n3. Create Table Customers\n4. Delete Database\n5. Delete Table Bikes\n6. List Databases\n7. List Tables\n8. Show Schema Table Bikes\n9. Show Schema Table Customers\n"
   echo "Enter Command: "
   read DATABASE_MANAGEMENT_MENU_SELECTION
   case $DATABASE_MANAGEMENT_MENU_SELECTION in
   0) MAIN_MENU ;;
   1) CREATE_DATABASE ;;
   2) CREATE_TABLE_BIKES ;;
   3) CREATE_TABLE_CUSTOMERS ;;
   4) DELETE_DATABASE ;;
   5) DELETE_TABLE_BIKES ;;
   6) LIST_DATABASES ;;
   7) LIST_TABLES ;;
   8) LIST_TABLE_BIKES ;;
   9) LIST_TABLE_CUSTOMERS ;;
   *) DATABASE_MANAGEMENT_MENU "Please enter a valid option." ;;
esac
}

CREATE_DATABASE(){
	$PSQL_CreateDatabase "CREATE DATABASE bikes;"
	DATABASE_MANAGEMENT_MENU
}

CREATE_TABLE_BIKES(){
	$PSQL "CREATE TABLE bikes();"
	$PSQL "ALTER TABLE bikes ADD COLUMN bike_id SERIAL PRIMARY KEY;"
	$PSQL "ALTER TABLE bikes ADD COLUMN type VARCHAR(50) NOT NULL;"
	$PSQL "ALTER TABLE bikes ADD COLUMN size INT NOT NULL;"
	$PSQL "ALTER TABLE bikes ADD COLUMN available boolean NOT NULL Default(TRUE)";
	DATABASE_MANAGEMENT_MENU "Created Tables Bikes"
	
}

CREATE_TABLE_CUSTOMERS(){
	$PSQL "CREATE TABLE customers();"
	$PSQL "ALTER TABLE customers ADD COLUMN customer_id SERIAL PRIMARY KEY;"
	DATABASE_MANAGEMENT_MENU
}

DELETE_DATABASE(){
	$PSQL_CreateDatabase "DROP DATABASE bikes;"
	DATABASE_MANAGEMENT_MENU
}


RETURN_MENU(){
   echo "Return Menu"
}

EXIT(){
   echo -e "\nThanks for stopping in.\n"
}

LIST_DATABASES(){
	$PSQL_CreateDatabase "\l"
	DATABASE_MANAGEMENT_MENU
}



LIST_TABLES(){
	$PSQL "\dt+"
	DATABASE_MANAGEMENT_MENU "Listed Tables"
}

LIST_TABLE_BIKES(){
	$PSQL "\d bikes"
	DATABASE_MANAGEMENT_MENU "Listed Table Bikes"
}

LIST_TABLE_CUSTOMERS(){
	$PSQL "\d customers"
	DATABASE_MANAGEMENT_MENU "Listed Table Customers"
}


DELETE_TABLE_BIKES(){
	$PSQL "DROP TABLE bikes;"
	DATABASE_MANAGEMENT_MENU "Dropped Table Bikes"
}

MAIN_MENU
