If ((Get-WMIObject win32_operatingsystem).OSArchitecture -eq '64-bit')
{
	$title = 'PostgreSQL Setup (64-Bit)'
	$url = 'https://get.enterprisedb.com/postgresql/postgresql-12.1-3-windows-x64.exe'
}
Else
{
	$title = 'PostgreSQL Setup (32-Bit)'
	$url = 'https://get.enterprisedb.com/postgresql/postgresql-10.11-3-windows.exe'
}
$host.ui.RawUI.WindowTitle = $title
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

New-Item C:\build -ItemType Directory -Force
if (!(Test-Path C:\build\postgresql-setup.exe))
{
	Invoke-WebRequest $url -OutFile C:\build\postgresql-setup.exe
}
Start-Process C:\build\postgresql-setup.exe -Wait -ArgumentList '--mode unattended'
