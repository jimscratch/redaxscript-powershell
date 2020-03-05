$host.ui.RawUI.WindowTitle = 'Papercut Setup'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

New-Item build -ItemType Directory -Force
Invoke-WebRequest https://github.com/ChangemakerStudios/Papercut/releases/download/5.5.1/PapercutService.5.5.1.zip -Outfile build\papercut.zip
Expand-Archive build\papercut.zip -DestinationPath C:\Papercut -Force
Start-Process C:\Papercut\Install-Papercut-Service.bat
