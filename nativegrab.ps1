"nativegrab for Native Access 2"
"brought to you by goop32 and viewers like you. thank you!"
""

$na_download_dir = "C:\Users\Public\Downloads"
$output_dir = "$env:USERPROFILE\native\out\"

if (Test-Path -Path $output_dir) {
	"INFO: Output path exists already."
} else {
	"INFO: Output path does not exist, creating."
	New-Item -Path $output_dir -ItemType Directory *>&1
}

if (Get-Process NTKDaemon) {
	"INFO: NTKDaemon is running, continuing."
} else {
	"ERROR: NTKDaemon is not running. Try relaunching Native Access."
	exit
}

while (-not (Get-ChildItem -File $na_download_dir -Recurse -Include ("*.exe", "*.iso") )) {
	"INFO: Nothing downloaded yet, will check again in 3 seconds."
	Start-Sleep -Seconds 3
}

# there's gotta be an easier way to get the file path???
$file = Get-ChildItem -File $na_download_dir -Recurse -Include ("*.exe", "*.iso", "*.zip")
$file_path = $file | ForEach-Object{$_.FullName}
"INFO: File found, path is $file_path."

# while .aria2 file still exists, do NOT kill ntkd or move anything
while (Get-ChildItem -File $na_download_dir -Recurse -Include *.aria2) {
	"INFO: .aria2 file still exists, looping until it's gone."
	Start-Sleep -Seconds 2
}

"INFO: Download complete, killing NTKDaemon to avoid file deletion."
Stop-Process -Name "NTKDaemon" -Force

if ($file_path.contains(".exe")) {
	"INFO: Not a disk image, no need to unmount anything."
} else {
	"INFO: Dismounting disk image so we can move it."
	Dismount-DiskImage -ImagePath $file_path *>&1
}

"INFO: Moving $file_path to $output_dir."

Move-Item $file_path -Destination $output_dir
Stop-Process -Name "Native Access" -Force
"INFO: Moved file and killed Native Access. Rerun the program to download something else! :)"