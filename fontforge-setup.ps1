$host.ui.RawUI.WindowTitle = 'FontForge Setup'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
[System.Environment]::SetEnvironmentVariable('PATH', $Env:Path + ';C:\Program Files (x86)\FontForgeBuilds\bin', 'User')

New-Item build -ItemType Directory -Force
Invoke-WebRequest https://github.com/fontforge/fontforge/releases/download/20190801/FontForge-2019-08-01-Windows.exe -OutFile build\fontforge-setup.exe
Start-Process build\fontforge-setup.exe -ArgumentList '/SILENT'
