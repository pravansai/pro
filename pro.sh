#!/bin/bash

ACTION=$1
DATE=$(date +%Y-%m-%d_%H-%M)
AMI_NAME="Image Backup - $DATE"
AMI_DESCRIPTION="ami-backup-script"

if [ -z $ACTION ];
then
echo "Usage $1: Define ACTION of backup or delete or create or terminate"
exit 1
fi

function backup_ami () {

        prod_instances=`aws ec2 describe-instances --filters "Name=tag-value,Values=prod*" | jq -r ".Reservations[].Instances[].InstanceId"`

        for instance in $prod_instances
        do
            echo "Requesting AMI for instance $instance...\n"
            echo Creating ami for $instance $(aws ec2 create-image --instance-id $instance --name "$AMI_NAME" --description "$AMI_DESCRIPTION" --no-reboot)
        done
        if [ $? -eq 0 ]; then
        printf "AMI request complete!\n"
        fi
}

function delete_ami () {
        ami_list=`aws ec2 describe-images --filters Name=description,Values=ami-backup-script | jq .Images[].ImageId | sed 's/\"//g'`
        for ami in $ami_list
        do
            echo "Deleting ami : $ami"
            aws ec2 deregister-image --image-id $ami
            echo "Sucessfully Deleted ami : $ami" 
        done
        if [ $? -eq 0 ]; then
        printf "AMI deletion complete!\n"
        fi
}

function instance_creation () {
        ami_list=`aws ec2 describe-images --filters Name=description,Values=ami-backup-script | jq .Images[].ImageId | sed 's/\"//g'`
        for ami in $ami_list
        do
            echo "creating instance with ami : $ami"
            aws ec2 run-instances --image-id $ami --count 1 --instance-type t2.micro --key-name pro --region us-east-1
            echo "Sucessfully launched instance with ami : $ami"
        done
        if [ $? -eq 0 ]; then
        printf "Instance creation completed!\n"
        fi
}

function instance_terminate () {

        prod_instances=`aws ec2 describe-instances --filters "Name=tag-value,Values=prod*" | jq -r ".Reservations[].Instances[].InstanceId"`

        for instance in $prod_instances
        do
            echo Terminating instance $instance $(aws ec2 terminate-instances --instance-ids $instance)
        done
        if [ $? -eq 0 ]; then
        printf "Termination request completed!\n"
        fi
}



case $ACTION in

"backup")
backup_ami
;;

"delete")
delete_ami
;;

"create")
instance_creation
;;

"terminate")
instance_terminate
;;

esac





