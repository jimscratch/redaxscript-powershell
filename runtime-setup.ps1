If ((Get-WMIObject win32_operatingsystem).OSArchitecture -eq '64-bit')
{
	$title = 'Runtime Setup (64-Bit)'
	$url = 'https://aka.ms/vs/16/release/VC_redist.x64.exe'
}
Else
{
	$title = 'Runtime Setup (32-Bit)'
	$url = 'https://aka.ms/vs/16/release/VC_redist.x86.exe'
}
$host.ui.RawUI.WindowTitle = $title
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

New-Item C:\Build -ItemType Directory -Force
if (!(Test-Path C:\Build\runtime-setup.exe))
{
	Invoke-WebRequest $url -OutFile C:\Build\runtime-setup.exe
}
Start-Process C:\Build\runtime-setup.exe -Wait -ArgumentList '/SILENT'
