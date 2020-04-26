$host.ui.RawUI.WindowTitle = 'FontForge Setup'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
[System.Environment]::SetEnvironmentVariable('PATH', $Env:Path + ';C:\Program Files (x86)\FontForgeBuilds\bin', [System.EnvironmentVariableTarget]::Machine)

New-Item C:\Build -ItemType Directory -Force
if (!(Test-Path C:\Build\fontforge-setup.exe))
{
	Invoke-WebRequest https://github.com/fontforge/fontforge/releases/download/20190801/FontForge-2019-08-01-Windows.exe -OutFile C:\Build\fontforge-setup.exe
}
Start-Process C:\Build\fontforge-setup.exe -Wait -ArgumentList '/SILENT'
