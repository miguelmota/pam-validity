#!/bin/bash

echo "Reached sh"

RESULT=$(/usr/bin/python3 <<EOF
from prototype import *
open9x()
identify()
reboot()
exit()
EOF
)

echo $RESULT

if [[ $RESULT == *finger* ]]; then
  echo "Success!"
  exit 0
else
  echo "Failure!"
  exit 114
fi
