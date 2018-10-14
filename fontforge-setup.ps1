$host.ui.RawUI.WindowTitle = 'FontForce Setup'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
[System.Environment]::SetEnvironmentVariable('PATH', $Env:Path + ';C:\Program Files (x86)\FontForgeBuilds\bin', 'User')

New-Item build -ItemType Directory -Force
Invoke-WebRequest https://github.com/fontforge/fontforge/releases/download/20170731/FontForge-2017-07-31-Windows-r2.exe -OutFile build\fontforge-setup.exe
Start-Process build\fontforge-setup.exe
