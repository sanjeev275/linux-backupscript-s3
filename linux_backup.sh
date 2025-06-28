#!/bin/bash

backup_dir="/home/sanju/practice/backups"
timestamp=$(date +%F-%H-%M-%S)
archive_name="backup-$timestamp.tar.gz" 
target="/etc /var/log"
s3="s3://linux-backup-sanju"

#create a archive

tar -czf $backup_dir/$archive_name $target

#upload to s3

aws s3 cp $backup_dir/$archive_name $s3

echo "Backup completed: $archive_name uploaded to S3 at $timestamp" >> /var/log/backup.log
