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

New-Item build -ItemType Directory -Force
Invoke-WebRequest $url -OutFile build\postgresql-setup.exe
Start-Process build\postgresql-setup.exe
