If ((Get-WMIObject win32_operatingsystem).OSArchitecture -eq '64-bit')
{
	$title = 'MySQL Setup (64-Bit)'
	$url = 'https://cdn.mysql.com//Downloads/MySQLInstaller/mysql-installer-community-8.0.12.0.msi'
}
Else
{
	$title = 'MySQL Setup (32-Bit)'
	$url = 'https://cdn.mysql.com//Downloads/MySQLInstaller/mysql-installer-web-community-8.0.12.0.msi'
}
$host.ui.RawUI.WindowTitle = $title

New-Item build -ItemType Directory -Force
Invoke-WebRequest $url -OutFile build\mysql-setup.msi
Start-Process msiexec -ArgumentList '/i build\mysql-setup.msi /passive' -Wait
