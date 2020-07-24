$host.ui.RawUI.WindowTitle = 'Redaxscript Setup'

Set-Location C:\Redaxscript
Start-Process git -ArgumentList 'clone https://github.com/redaxscript/redaxscript.git' -Wait
Start-Process npm -ArgumentList 'install'
Start-Process composer -ArgumentList 'install'
