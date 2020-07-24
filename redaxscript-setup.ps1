$host.ui.RawUI.WindowTitle = 'Redaxscript Setup'

Start-Process git -ArgumentList 'clone https://github.com/redaxscript/redaxscript.git C:\Redaxscript' -Wait
Start-Process npm -ArgumentList 'install' -WorkingDirectory C:\Redaxscript
Start-Process composer -ArgumentList 'install' -WorkingDirectory C:\Redaxscript
Set-Location C:\Redaxscript
