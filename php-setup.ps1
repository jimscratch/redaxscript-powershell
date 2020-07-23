If ((Get-WMIObject win32_operatingsystem).OSArchitecture -eq '64-bit')
{
	$title = 'PHP Setup (64-Bit)'
	$url = 'https://windows.php.net/downloads/releases/latest/php-7.4-Win32-VC15-x64-latest.zip'

}
Else
{
	$title = 'PHP Setup (32-Bit)'
	$url = 'https://windows.php.net/downloads/releases/latest/php-7.4-Win32-VC15-x86-latest.zip'
}
$host.ui.RawUI.WindowTitle = $title
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
[System.Environment]::SetEnvironmentVariable('PATH', $Env:Path + ';C:\PHP', [System.EnvironmentVariableTarget]::Machine)
$env:Path = [System.Environment]::GetEnvironmentVariable('Path', 'Machine')

New-Item C:\Build -ItemType Directory -Force
if (!(Test-Path C:\Build\php.zip))
{
	Invoke-WebRequest $url -OutFile C:\Build\php.zip
}
if (!(Test-Path C:\PHP))
{
	Expand-Archive C:\Build\php.zip -DestinationPath C:\PHP -Force
}
Invoke-WebRequest https://raw.githubusercontent.com/redaxscript/redaxscript-powershell/master/php.ini -OutFile C:\PHP\php.ini
