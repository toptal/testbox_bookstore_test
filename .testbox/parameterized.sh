#!/bin/bash

key=$1
data=$2

ruby -r json -e "pp JSON.parse('$data')['$key']"
