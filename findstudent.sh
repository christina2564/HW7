#!/bin/bash

if [ "$#" -eq 1 ]; then
	student_id=$1
else 
	read -p "Enter student ID: " student_id
fi

grade=$(jq -r ".[] | select(.id == \"$student_id\") | .grade" students.json)

if [ ! -z "$grade" ]; then
	echo "Final Grade $student_id: $grade"
else
	echo "No grade data found for student $student_id"

fi
