# vgpu-license-management-scripts
<hr> 

<br> reason for creation: when using vGPU, Windows seems to be reluctant to install a new license after the last one expires, so i created these fairly basic scripts hoping automating the whole process will stop it from causing problems and/or being a headache every time the time comes to update the licnese token. 
<br>
<br> <b>basic vGPU license management scripts.</b>
<br> for the Linux-update-vgpu-token.sh & Windows-Update-vGPUToken.ps1 scripts just change the DLS_URL="" line to your FastAPI-DLS server ip.
<br> <b>example:</b> DlsUrl = "https://10.0.0.220" and it will work to sync a new token and reset the nvidia service. 

### to run them:
<br> cd the directory and then 

### Windows: 
    ./Windows-Update-vGPUToken.ps1
    
<br> Note: If your execution policy is set to "Restricted," you will need to change it if you want to run your custom scripts. You can modify the execution policy using the command:

    Set-ExecutionPolicy RemoteSigned

### Linux:
<br> Make it executable:

    chmod +x Linux-update-vgpu-token.sh
    
<br> Make it executable:

    ./Linux-update-vgpu-token.sh

<hr>

### you can use the Windows-vGPU-scheduled-task.ps1 script / commands to set it up as a scheduled task so you can forget about it. 

### for linux: 
<br> Make it executable:

    chmod +x /home/user/scripts/Linux-update-vgpu-token.sh

<br> Schedule monthly cron job:

    crontab -e
    0 3 1 * * /home/user/scripts/Linux-update-vgpu-token.sh

<br> note: obviously replace /home/user/scripts with where ever you will be keeping the script. 
<br> this will run at 3 AM on the 1st of every month.
<hr>
<br> once you have the license server running and this script is scheduled to run, a VM should then maintain its own vGPU license without hassle. 

<hr> 

<br> these are meant to be used in conjunction with the following projects:
- [FastAPI-DLS](https://git.collinwebdesigns.de/oscar.krause/fastapi-dls)
- [gridd-unlock-patcher](https://git.collinwebdesigns.de/vgpu/gridd-unlock-patcher)

<br> many thanks to the creators. 
