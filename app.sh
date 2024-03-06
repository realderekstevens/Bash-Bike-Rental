#!/bin/bash
#https://www.youtube.com/watch?v=3s3IUCKkJ1k
#https://github.com/freeCodeCamp/learn-bash-and-sql-by-building-a-bike-rental-shop/blob/main/TUTORIAL.md
# Left off At 7:30 on Youtube Video

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
   echo -e "\n0. Return To Main Menu\n1. List Schema Menu\n2. Create Databases & Tables Menu\n3. Delete Databases & Tables Menu\n4. Insert Data Menu\n5. Select Data Menu\n"
   echo "Enter Command: "
   read DATABASE_MANAGEMENT_MENU_SELECTION
   case $DATABASE_MANAGEMENT_MENU_SELECTION in
   0) MAIN_MENU ;;
   1) LIST_SCHEMA_MENU ;;
   2) CREATE_DATABASE_AND_TABLES_MENU ;;
   3) DELETE_DATABASE_MANAGEMENT_MENU ;;
   4) INSERT_DATA_MENU ;;
   5) SELECT_DATA_MENU ;;
   *) DATABASE_MANAGEMENT_MENU "Please enter a valid option." ;;
esac
}
LIST_SCHEMA_MENU(){
   if [[ $1 ]]
   then
      echo -e "\n$1"
   fi
   echo -e "\n~~~~~ Show Schema Menu ~~~~~"
   echo -e "\n0. Return To Database Management Menu\n1. List Databases\n2. List Tables\n3. List Table Bikes\n4. List Table Customers\n5. List Table Rentals\n"
   echo "Enter Command: "
   read DATABASE_MANAGEMENT_MENU_SELECTION
   case $DATABASE_MANAGEMENT_MENU_SELECTION in
   0) DATABASE_MANAGEMENT_MENU ;;
   1) LIST_DATABASES ;;
   2) LIST_TABLES ;;
   3) LIST_TABLE_BIKES ;;
   4) LIST_TABLE_CUSTOMERS ;;
   5) LIST_TABLE_RENTALS ;;
   *) LIST_SCHEMA_MENU "Please enter a valid option." ;;
esac
}
CREATE_DATABASE_AND_TABLES_MENU(){
   if [[ $1 ]]
   then
      echo -e "\n$1"
   fi
   echo -e "\n~~~~~ Create Database & Tables Menu ~~~~~"
   echo -e "\n0. Return To Database Management Menu\n1. Create Database\n2. Create Table Bikes\n3. Create Table Customers\n4. Create Table Rentals\n"
   echo "Enter Command: "
   read DATABASE_MANAGEMENT_MENU_SELECTION
   case $DATABASE_MANAGEMENT_MENU_SELECTION in
   0) DATABASE_MANAGEMENT_MENU ;;
   1) CREATE_DATABASE ;;
   2) CREATE_TABLE_BIKES ;;
   3) CREATE_TABLE_CUSTOMERS ;;
   4) CREATE_TABLE_RENTALS ;;
   *) CREATE_DATABASE_AND_TABLES_MENU "Please enter a valid option." ;;
esac
}
DELETE_DATABASE_MANAGEMENT_MENU(){
   if [[ $1 ]]
   then
      echo -e "\n$1"
   fi
   echo -e "\n~~~~~ Delete Database & Tables Menu ~~~~~"
   echo -e "\n0. Return To Database Management Menu\n1. Delete Database Database\n2. Delete Table Bikes\n3. Delete Table Customers\n4. Delete Table Rentals\n"
   echo "Enter Command: "
   read DATABASE_MANAGEMENT_MENU_SELECTION
   case $DATABASE_MANAGEMENT_MENU_SELECTION in
   0) DATABASE_MANAGEMENT_MENU ;;
   1) DELETE_DATABASE ;;
   2) DELETE_TABLE_BIKES ;;
   3) DELETE_TABLE_CUSTOMERS ;;
   4) DELETE_TABLE_RENTALS ;;
   *) DELETE_DATABASE_MANAGEMENT_MENU "Please enter a valid option." ;;
esac
}
INSERT_DATA_MENU(){
   if [[ $1 ]]
   then
      echo -e "\n$1"
   fi
   echo -e "\n~~~~~ Insert Data Menu ~~~~~"
   echo -e "\n0. Return To Database Management Menu\n1. Insert Example Bikes Data\n"
   echo "Enter Command: "
   read DATABASE_MANAGEMENT_MENU_SELECTION
   case $DATABASE_MANAGEMENT_MENU_SELECTION in
   0) DATABASE_MANAGEMENT_MENU ;;
   1) INSERT_EXAMPLE_BIKES_DATA ;;
   *) INSERT_DATA_MENU "Please enter a valid option." ;;
esac
}
SELECT_DATA_MENU(){
   if [[ $1 ]]
   then
      echo -e "\n$1"
   fi
   echo -e "\n~~~~~ Insert Data Menu ~~~~~"
   echo -e "\n0. Return To Database Management Menu\n1. Select All Bikes\n"
   echo "Enter Command: "
   read DATABASE_MANAGEMENT_MENU_SELECTION
   case $DATABASE_MANAGEMENT_MENU_SELECTION in
   0) DATABASE_MANAGEMENT_MENU ;;
   1) SELECT_ALL_BIKES ;;
   *) SELECT_DATA_MENU "Please enter a valid option." ;;
esac
}




CREATE_DATABASE(){
	$PSQL_CreateDatabase "CREATE DATABASE bikes;"
	CREATE_DATABASE_AND_TABLES_MENU
}
CREATE_TABLE_BIKES(){
	$PSQL "CREATE TABLE bikes();"
	$PSQL "ALTER TABLE bikes ADD COLUMN bike_id SERIAL PRIMARY KEY;"
	$PSQL "ALTER TABLE bikes ADD COLUMN type VARCHAR(50) NOT NULL;"
	$PSQL "ALTER TABLE bikes ADD COLUMN size INT NOT NULL;"
	$PSQL "ALTER TABLE bikes ADD COLUMN available boolean NOT NULL Default(TRUE)";
	CREATE_DATABASE_AND_TABLES_MENU "Created Tables Bikes"
	
}
CREATE_TABLE_CUSTOMERS(){
	$PSQL "CREATE TABLE customers();"
	$PSQL "ALTER TABLE customers ADD COLUMN customer_id SERIAL PRIMARY KEY;"
	$PSQL "ALTER TABLE customers ADD COLUMN phone INT NOT NULL UNIQUE;"
	$PSQL "ALTER TABLE customers ADD COLUMN name VARCHAR(40) NOT NULL;"
	CREATE_DATABASE_AND_TABLES_MENU
}
CREATE_TABLE_RENTALS(){
	$PSQL "CREATE TABLE rentals();"
	$PSQL "ALTER TABLE rentals ADD COLUMN rental_id SERIAL PRIMARY KEY;"
	$PSQL "ALTER TABLE rentals ADD COLUMN customer_id INT NOT NULL UNIQUE;"
	$PSQL "ALTER TABLE rentals ADD FOREIGN KEY(customer_id) REFERENCES customers(customer_id);"
	$PSQL "ALTER TABLE rentals ADD COLUMN bike_id INT NOT NULL;"
	$PSQL "ALTER TABLE rentals ADD FOREIGN KEY(bike_id) REFERENCES bikes(bike_id);"
	$PSQL "ALTER TABLE rentals ADD COLUMN date_rented DATE NOT NULL Default(Now());"
	$PSQL "ALTER TABLE rentals ADD COLUMN date_returned DATE;"
	CREATE_DATABASE_AND_TABLES_MENU
}






LIST_DATABASES(){
	$PSQL_CreateDatabase "\l"
	DATABASE_MANAGEMENT_MENU "Listed Databases"
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
LIST_TABLE_RENTALS(){
	$PSQL "\d rentals"
	DATABASE_MANAGEMENT_MENU "Listed Table Rentals"
}






DELETE_DATABASE(){
	$PSQL_CreateDatabase "DROP DATABASE bikes;"
	DELETE_DATABASE_MANAGEMENT_MENU
}
DELETE_TABLE_BIKES(){
	$PSQL "DROP TABLE bikes;"
	DELETE_DATABASE_MANAGEMENT_MENU
}
DELETE_TABLE_CUSTOMERS(){
	$PSQL "DROP TABLE customers;"
	DELETE_DATABASE_MANAGEMENT_MENU
}
DELETE_TABLE_RENTALS(){
	$PSQL "DROP TABLE rentals;"
	DELETE_DATABASE_MANAGEMENT_MENU
}






INSERT_EXAMPLE_BIKES_DATA(){
	$PSQL "INSERT INTO bikes (type, size) VALUES ('Mountain', 27);"
	$PSQL "INSERT INTO bikes (type, size) VALUES ('Mountain', 28);"
	$PSQL "INSERT INTO bikes (type, size) VALUES ('Mountain', 29);"
	$PSQL "INSERT INTO bikes (type, size) VALUES ('Road', 27);"
	$PSQL "INSERT INTO bikes (type, size) VALUES ('Road', 28);"
	$PSQL "INSERT INTO bikes (type, size) VALUES ('Road', 29);"
	$PSQL "INSERT INTO bikes (type, size) VALUES ('BMX', 19);"
	$PSQL "INSERT INTO bikes (type, size) VALUES ('BMX', 20);"
	$PSQL "INSERT INTO bikes (type, size) VALUES ('BMX', 21);"
	DATABASE_MANAGEMENT_MENU "Inserted Example Bikes"
}






SELECT_ALL_BIKES(){
	$PSQL "SELECT * FROM bikes"
	SELECT_DATA_MENU
}


EXIT(){
   echo -e "\nClosing Program.\n"
}
MAIN_MENU