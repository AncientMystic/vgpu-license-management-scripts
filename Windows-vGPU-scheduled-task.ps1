$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoProfile -WindowStyle Hidden -File C:\Scripts\Windows-Update-vGPUToken.ps1"
$trigger = New-ScheduledTaskTrigger -Daily -DaysInterval 30 -At 03:00
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable
$principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest


Register-ScheduledTask -TaskName "Update vGPU Token" -Action $action -Trigger $trigger -Settings $settings -Principal $principal -Description "Refresh NVIDIA vGPU license token"
