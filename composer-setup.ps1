$host.ui.RawUI.WindowTitle = 'Composer Setup'

New-Item C:\build -ItemType Directory -Force
if (!(Test-Path C:\build\fontforge-setup.exe))
{
	Invoke-WebRequest https://getcomposer.org/Composer-Setup.exe -OutFile C:\build\composer-setup.exe
}
Start-Process C:\build\composer-setup.exe -Wait -ArgumentList '/SILENT /SUPPRESSMSGBOXES'
