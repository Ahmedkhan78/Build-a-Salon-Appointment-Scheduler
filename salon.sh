#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

DISPLAY_SERVICES() {
  echo -e "\n~~~~~ MY SALON ~~~~~"
  echo -e "\nWelcome to My Salon, how can I help you?"

  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  echo "$SERVICES" | while IFS="|" read SERVICE_ID SERVICE_NAME
  do
   echo "$SERVICE_ID) $SERVICE_NAME"
  done
  if [[ -z $SERVICES ]]
  then 
   echo $SERVICES
  fi

}
GET_SERVICE() {
echo -e "\nPlease select a service by entering the corresponding number:"
  read SERVICE_ID_SELECTED

  # Check if the selected service exists
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  
  # If service does not exist, show error and display services again
  while [[ -z $SERVICE_NAME ]]; do
    echo -e "\nI could not find that service. What would you like today?"
    DISPLAY_SERVICES
    echo -e "\nPlease select a service by entering the corresponding number:"
    read SERVICE_ID_SELECTED
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  done

}

DISPLAY_SERVICES

GET_SERVICE


echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE

CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

if [[ -z $CUSTOMER_NAME ]]
then
  echo -e "\nI don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME

  INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
fi


echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME)"
read SERVICE_TIME

CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE' ")

INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES('$CUSTOMER_ID','$SERVICE_ID_SELECTED','$SERVICE_TIME')")

echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."