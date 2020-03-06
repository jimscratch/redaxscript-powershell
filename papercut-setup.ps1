$host.ui.RawUI.WindowTitle = 'Papercut Setup'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

New-Item C:\build -ItemType Directory -Force
if (!(Test-Path C:\build\papercut.zip))
{
	Invoke-WebRequest https://github.com/ChangemakerStudios/Papercut/releases/download/5.5.1/PapercutService.5.5.1.zip -Outfile C:\build\papercut.zip
}
if (!(Test-Path C:\Papercut))
{
	Expand-Archive C:\build\papercut.zip -DestinationPath C:\Papercut -Force
}
Start-Process C:\Papercut\Papercut.Service.exe -Wait -ArgumentList 'install --sudo'
Start-Process C:\Papercut\Papercut.Service.exe -Wait -ArgumentList 'start'
