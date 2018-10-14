New-Item build -ItemType Directory -Force
Invoke-WebRequest https://nodejs.org/dist/v10.12.0/node-v10.12.0-x64.msi -OutFile build\node-setup.msi
Start-Process msiexec -ArgumentList '/i build\node-setup.msi /passive' -Wait
Start-Process npm -ArgumentList 'install --global grunt-cli'
