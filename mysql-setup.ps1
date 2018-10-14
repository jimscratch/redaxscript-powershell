If ((Get-WMIObject win32_operatingsystem).OSArchitecture -eq '64-bit')
{
	$title = 'MariaDB Setup (64-Bit)'
	$url = 'https://downloads.mariadb.org/f/mariadb-10.3.10/winx64-packages/mariadb-10.3.10-winx64.msi'
}
Else
{
	$title = 'MariaDB Setup (32-Bit)'
	$url = 'https://downloads.mariadb.org/f/mariadb-10.3.10/win32-packages/mariadb-10.3.10-win32.msi'
}
$host.ui.RawUI.WindowTitle = $title

New-Item build -ItemType Directory -Force
Invoke-WebRequest $url -OutFile build\mysql-setup.msi
Start-Process msiexec -ArgumentList '/i build\mysql-setup.msi /passive'
