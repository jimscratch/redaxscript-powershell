If ((Get-CimInStance CIM_OperatingSystem).OSArchitecture -eq '64-bit')
{
	$title = 'MySQL Setup (64-Bit)'
	$url = 'https://downloads.mariadb.org/interstitial/mariadb-10.5.10/winx64-packages/mariadb-10.5.10-winx64.msi'
}
Else
{
	$title = 'MySQL Setup (32-Bit)'
	$url = 'https://downloads.mariadb.org/interstitial/mariadb-10.5.10/win32-packages/mariadb-10.5.10-win32.msi'
}
$host.ui.RawUI.WindowTitle = $title

New-Item C:\Build -ItemType Directory -Force
if (!(Test-Path C:\Build\mysql-setup.msi))
{
	Invoke-WebRequest $url -OutFile C:\Build\mysql-setup.msi
}
Start-Process msiexec -Wait -ArgumentList '/i C:\Build\mysql-setup.msi /passive'
