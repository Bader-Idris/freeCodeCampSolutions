#!/bin/bash

# PSQL="psql --username=freecodecamp --dbname=salon -c"
PSQL="psql -U postgres -d salon -p 5433 -t -c"

export PGPASSWORD=$(cat ~/.pgpass | awk -F: '{if ($1 == "localhost") print $5}')


echo -e "\n~~~~~ MY SALON ~~~~~\n"
MAIN_MENU() {
  if [[ $1 ]]; then
    echo -e "\n$1"
  fi
  echo 'How may I help you?'
  echo -e "\n1. cut\n2. color\n3. perm\n4. style \n5. trim"
  read MAIN_MENU_SELECTION
  case $MAIN_MENU_SELECTION in
  1) CUT ;;
  2) COLOR ;;
  3) PERM ;;
  4) STYLE ;;
  5) TRIM ;;
  *) MAIN_MENU "I could not find that service. What would you like today?" ;;
  esac
}
CUT() {
  PHONE_TXT
}
COLOR() {
  PHONE_TXT
}
PERM() {
  PHONE_TXT
}
STYLE() {
  PHONE_TXT
}
TRIM() {
  PHONE_TXT
}
PHONE_TXT() {
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_PHONE_INFO=$($PSQL "SELECT phone FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_PHONE_INFO ]]; then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    APPOINTMENT_TIME
  else
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    APPOINTMENT_TIME
  fi
}
APPOINTMENT_TIME() {
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $MAIN_MENU_SELECTION")
  echo -e "\nWhat time would you like your $(echo $SERVICE_NAME | sed 's/ |/"/'), $(echo $CUSTOMER_NAME | sed 's/ |/"/')."

  # while user doesn't provide a valid string, it'll repeat same err:msg
  while read SERVICE_TIME && [[ -z $SERVICE_TIME ]]; do
    echo "Please provide a valid time."
  done

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  INSERT_APPOUNTMENT_RESULT=$($PSQL "INSERT INTO appointments(service_id, customer_id, time) VALUES($MAIN_MENU_SELECTION, $CUSTOMER_ID, '$SERVICE_TIME')")
  echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed 's/ |/"/') at $(echo $SERVICE_TIME | sed 's/ |/"/'), $(echo $CUSTOMER_NAME | sed 's/ |/"/')."
}
MAIN_MENU

# I can improve the code, by stopping users from repeating appointment time,
#  but that's not a reuirement in the course, so I'll keep learning new courses