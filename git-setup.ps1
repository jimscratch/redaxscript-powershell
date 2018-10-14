$host.ui.RawUI.WindowTitle = 'Git Setup'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

New-Item build -ItemType Directory -Force
Invoke-WebRequest https://github.com/git-for-windows/git/releases/download/v2.19.1.windows.1/Git-2.19.1-64-bit.exe -OutFile build\git-setup.exe
Start-Process build\git-setup.exe
