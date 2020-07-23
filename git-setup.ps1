If ((Get-WMIObject win32_operatingsystem).OSArchitecture -eq '64-bit')
{
	$title = 'Git Setup (64-Bit)'
	$url = 'https://github.com/git-for-windows/git/releases/download/v2.27.0.windows.1/Git-2.27.0-64-bit.exe'
}
Else
{
	$title = 'Git Setup (32-Bit)'
	$url = 'https://github.com/git-for-windows/git/releases/download/v2.27.0.windows.1/Git-2.27.0-32-bit.exe'
}
$host.ui.RawUI.WindowTitle = $title
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
[System.Environment]::SetEnvironmentVariable('PATH', $Env:Path + ';C:\Program Files\Git\bin', [System.EnvironmentVariableTarget]::Machine)

New-Item C:\Build -ItemType Directory -Force
if (!(Test-Path C:\Build\git-setup.exe))
{
	Invoke-WebRequest $url -OutFile C:\Build\git-setup.exe
}
Start-Process C:\Build\git-setup.exe -Wait -ArgumentList '/SILENT'
