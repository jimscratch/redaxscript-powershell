$host.ui.RawUI.WindowTitle = 'Composer Setup'

New-Item C:\Build -ItemType Directory -Force
if (!(Test-Path C:\Build\composer-setup.exe))
{
	Invoke-WebRequest https://getcomposer.org/Composer-Setup.exe -OutFile C:\Build\composer-setup.exe
}
Start-Process C:\Build\composer-setup.exe -Wait -ArgumentList '/SILENT /SUPPRESSMSGBOXES'
