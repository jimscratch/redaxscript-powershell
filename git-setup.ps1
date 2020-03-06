If ((Get-WMIObject win32_operatingsystem).OSArchitecture -eq '64-bit')
{
	$title = 'Git Setup (64-Bit)'
	$url = 'https://github.com/git-for-windows/git/releases/download/v2.25.0.windows.1/Git-2.25.0-64-bit.exe'
}
Else
{
	$title = 'Git Setup (32-Bit)'
	$url = 'https://github.com/git-for-windows/git/releases/download/v2.25.0.windows.1/Git-2.25.0-32-bit.exe'
}
$host.ui.RawUI.WindowTitle = $title
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

New-Item C:\build -ItemType Directory -Force
if (!(Test-Path C:\build\git-setup.exe))
{
	Invoke-WebRequest $url -OutFile C:\build\git-setup.exe
}
Start-Process C:\build\git-setup.exe -ArgumentList '/SILENT'
