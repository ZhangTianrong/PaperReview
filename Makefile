DIR := ${CURDIR}

sync:
	rclone sync -P $(DIR) Union:Markdown\PaperReview --exclude /.*/
	powershell -Command {If (Test-Path U:) {$$null = rclone rc vfs/forget}}
