#!/bin/sh

pip install bottle==0.12.13 psycopg2 --upgrade redis==2.10.5
python -u sender.py