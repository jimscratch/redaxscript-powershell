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
[System.Environment]::SetEnvironmentVariable('PATH', $Env:Path + ';C:\PHP', 'User')

New-Item build -ItemType Directory -Force
Invoke-WebRequest https://raw.githubusercontent.com/redaxscript/redaxscript-powershell/master/php.ini -OutFile C:\PHP\php.ini
Invoke-WebRequest $url -OutFile build\php.zip
Expand-Archive build\php.zip -DestinationPath C:\PHP -Force
