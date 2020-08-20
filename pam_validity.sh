#!/bin/bash

RESULT=$(/usr/bin/python3 <<EOF
from prototype import *
open9x()
identify()
reboot()
exit()
EOF
)

if [[ $RESULT == *finger* ]]; then
  exit 0
else
  exit 114
fi
