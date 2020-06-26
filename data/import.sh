#! /bin/bash

#mongoimport --host mongodb --db test --collection census
mongorestore --drop --gzip --host mongodb data/sample_mflix