#!/usr/bin/env bash


zip -r ~/'Документы'/avenmes.zip target/avenmes-1.0-SNAPSHOT.jar
ls ~/'Документы'

#unzip /home/pi/gps/target.zip


#mvn clean package

#echo 'Copy files...'
#scp -i "/home/vlad/Документы/test.pem" \
#    target/avenmes-1.0-SNAPSHOT.jar \
#    ubuntu@ec2-54-236-115-225.compute-1.amazonaws.com:/home/ubuntu/

#echo 'Restart server...'
#ssh -i "/home/vlad/Документы/test.pem" ubuntu@ec2-54-236-115-225.compute-1.amazonaws.com << EOF
#   pgrep java | xargs kill -9
#    nohup java -jar avenmes-1.0-SNAPSHOT.jar > log.txt &
#EOF
#echo 'Bye'