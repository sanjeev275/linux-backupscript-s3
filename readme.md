# 🛡️ Automated Linux Backup Script to AWS S3

This project is a shell script that automates the backup of critical Linux system directories (`/etc` and `/var/log`), compresses them, and uploads the archive to an AWS S3 bucket securely.

---

## 📂 What It Does

- Creates timestamped `.tar.gz` backup of system config and logs
- Uploads the backup file to a private S3 bucket using AWS CLI
- Logs all actions to `/var/log/backup.log`
- Can be scheduled using `cron` for automatic daily backups

---

## 🧰 Tools Used

- Bash (shell scripting)
- tar, gzip
- AWS S3
- IAM Role (for EC2) / `aws configure` (for local Linux)
- Cron

---

## ⚙️ Setup Instructions

1. Create a private S3 bucket in AWS.
2. On your EC2 or Linux machine:
   - Clone this repo
   - Edit `linux_backup.sh` and set your S3 bucket name
	[backup_script](./Screenshot-script.png)
   - Run manually or set up a cronjob
3. To set up cron:
   ```bash
   	crontab -e
# Add:
   
   	0 0 * * * /path/to/linux_backup.sh >> /var/log/backup-cron.log 2>&1
#Referencepicture:
	- [crontab_view](./screenshot-cron.png)
	- [outputlog](./screenshot-output.png)
	- [S3-view](./screenshot-s3view.png)
# Notes

*Be sure to grant proper IAM permissions (AmazonS3FullAccess or custom policy).
*Use aws configure or an IAM role for authentication.
*This script only works when the machine is online (consider CloudWatch Events for more reliable automation).
