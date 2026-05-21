#!/bin/bash

echo "Today's date is $date"

START_TIME=${date +%s}
END_TIME=${date +%s}

TOTAL_TIME=${($START_TIME-$END_TIME)}

echo "Time took to execute script is $TOTAL_TIME"