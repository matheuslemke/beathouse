#!/bin/bash

FILE=.env

if [-f "$FILE"]; then
  echo ".env already exists."
else
  touch $FILE
  echo "FIREBASE_API_KEY=$FIREBASE_API_KEY" >> $FILE
  echo "FIREBASE_APP_ID=$FIREBASE_APP_ID" >> $FILE
  echo "FIREBASE_MESSAGING_SENDER_ID=$FIREBASE_MESSAGING_SENDER_ID" >> $FILE
  echo "FIREBASE_PROJECT_ID=$FIREBASE_PROJECT_ID" >> $FILE
fi
