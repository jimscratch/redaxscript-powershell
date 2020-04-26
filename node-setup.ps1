If ((Get-WMIObject win32_operatingsystem).OSArchitecture -eq '64-bit')
{
	$title = 'Node Setup (64-Bit)'
	$url = 'https://nodejs.org/dist/v13.8.0/node-v13.8.0-x64.msi'
}
Else
{
	$title = 'Node Setup (32-Bit)'
	$url = 'https://nodejs.org/dist/v13.8.0/node-v13.8.0-x86.msi'
}
$host.ui.RawUI.WindowTitle = $title

New-Item C:\Build -ItemType Directory -Force
if (!(Test-Path C:\Build\node-setup.msi))
{
	Invoke-WebRequest $url -OutFile C:\Build\node-setup.msi
}
Start-Process msiexec -Wait -ArgumentList '/i C:\Build\node-setup.msi /passive'
