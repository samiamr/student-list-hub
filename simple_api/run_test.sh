#!/bin/bash

# we run student-list api
nohup python /student_age.py &

sleep 10s

# we run test
if [ "$(curl -u toto:python -X GET http://127.0.0.1:5000/pozos/api/v1.0/get_student_ages | python -c "import sys, json; print json.load(sys.stdin)['student_ages']['bob']")" = "13" ] && [ "$(curl -u toto:python -X GET http://127.0.0.1:5000/pozos/api/v1.0/get_student_ages | python -c "import sys, json; print json.load(sys.stdin)['student_ages']['alice']")" = "12" ]; then echo "test OK"; exit 0; else echo "test KO"; exit 1; fi

