#!bin/bash

curl -X POST -H "Content-Type: application/x-www-form-urlencoded" -d 'result=sample&query=environmental_package%3D%22host-associated%22&format=tsv' "https://www.ebi.ac.uk/ena/portal/api/search"
