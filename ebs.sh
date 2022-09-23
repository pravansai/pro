#!/bin/bash

ACTION=$1
#AGE=$2

if [ -z $ACTION ];
then
echo "Usage $1: Define ACTION of backup or delete"
exit 1
fi

#if [ "$ACTION" == "delete" ]; 
#then
#       echo "Please enter the age of backups you would like to delete"
#       exit 1
#fi

function backup_ebs () {

        prod_instances=`aws ec2 describe-instances --filters "Name=tag-value,Values=prod*" | jq -r ".Reservations[].Instances[].InstanceId"`

        for instance in $prod_instances
        do

                volumes=`aws ec2 describe-volumes --filter Name=attachment.instance-id,Values=$instance | jq .Volumes[].VolumeId | sed 's/\"//g'`

                for volume in $volumes
                do
                        echo Creating snapshot for $volume $(aws ec2 create-snapshot --volume-id $volume --description "ebs-backup-script")
                done

        done
}

function delete_snapshots () {

                snapshot=`aws ec2 describe-snapshots --filters Name=description,Values=ebs-backup-script | jq .Snapshots[].SnapshotId | sed 's/\"//g'`
                echo "Deleting snapshot : $snapshot"
                aws ec2 delete-snapshot --snapshot-id $snapshot
                echo "Sucessfully Deleted snapshot : $snapshot"
}

case $ACTION in

"backup")
backup_ebs
;;

"delete")
delete_snapshots
;;

esac
