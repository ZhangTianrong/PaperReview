DIR := ${CURDIR}

sync:
	rclone sync -P $(DIR) Union:Markdown\PaperReview
	powershell If (Test-Path U:) {$$null = rclone rc vfs/forget}
