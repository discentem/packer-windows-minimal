cmd.exe /c powershell -Command "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force"
echo "Set Execution Policy 64 Bit"

C:\Windows\SysWOW64\cmd.exe /c powershell -Command "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force"
echo "Set Execution Policy 32 Bit"

cmd.exe /c reg add "HKLM\System\CurrentControlSet\Control\Network\NewNetworkWindowOff"
echo "Turn off network prompt"

cmd.exe /c C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -File a:\fixnetwork.ps1
echo "Fix public network"

C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -File a:\disable-winrm.ps1
echo "Disable WinRM"

cmd.exe /c wmic useraccount where "name='vagrant'" set PasswordExpires=FALSE
echo "Disable password expiration for vagrant user"

cmd.exe /c C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -File a:\enable-winrm.ps1
echo "Enable WinRM"
