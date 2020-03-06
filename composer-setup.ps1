$host.ui.RawUI.WindowTitle = 'Composer Setup'

New-Item build -ItemType Directory -Force
Invoke-WebRequest https://getcomposer.org/Composer-Setup.exe -OutFile build\composer-setup.exe
Start-Process build\composer-setup.exe -ArgumentList '/SILENT /SUPPRESSMSGBOXES'
