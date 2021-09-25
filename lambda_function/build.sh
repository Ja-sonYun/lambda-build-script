#!/bin/sh

PSYCOPG_LAMBDA_SUPPORT_PATH=./temp/psycopg2_lambda_support/

if [ -d "./psycopg2" ]; then
    echo "**********************************************"
    echo "** use psycopg2 package that support lambda **"
    echo "**********************************************"
    git clone git@github.com:jkehler/awslambda-psycopg2.git $PSYCOPG_LAMBDA_SUPPORT_PATH
    rm -rf ./psycopg2
    mv $PSYCOPG_LAMBDA_SUPPORT_PATH/psycopg2-3.8 ./psycopg2
    rm -rf $PSYCOPG_LAMBDA_SUPPORT_PATH
    echo "**********************************************"
fi

