If ((Get-WMIObject win32_operatingsystem).OSArchitecture -eq '64-bit')
{
	$title = 'PHP Setup (64-Bit)'
	$url = 'https://windows.php.net/downloads/releases/php-7.3.1-Win32-VC15-x64.zip'
}
Else
{
	$title = 'PHP Setup (32-Bit)'
	$url = 'https://windows.php.net/downloads/releases/php-7.3.1-Win32-VC15-x86.zip'
}
$host.ui.RawUI.WindowTitle = $title
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
[System.Environment]::SetEnvironmentVariable('PATH', $Env:Path + ';C:\PHP', 'User')

New-Item build -ItemType Directory -Force
Invoke-WebRequest $url -OutFile build\php.zip
Expand-Archive build\php.zip -DestinationPath C:\PHP -Force
Copy-Item php.ini -Destination C:\PHP\php.ini
