If ((Get-WMIObject win32_operatingsystem).OSArchitecture -eq '64-bit')
{
	$title = 'MySQL Setup (64-Bit)'
	$url = 'https://downloads.mariadb.org/f/mariadb-10.4.12/winx64-packages/mariadb-10.4.12-winx64.msi'
}
Else
{
	$title = 'MySQL Setup (32-Bit)'
	$url = 'https://downloads.mariadb.org/f/mariadb-10.4.12/win32-packages/mariadb-10.4.12-win32.msi'
}
$host.ui.RawUI.WindowTitle = $title

New-Item C:\build -ItemType Directory -Force
if (!(Test-Path C:\build\mysql-setup.msi))
{
	Invoke-WebRequest $url -OutFile C:\build\mysql-setup.msi
}
Start-Process msiexec -Wait -ArgumentList '/i C:\build\mysql-setup.msi /passive'
