$host.ui.RawUI.WindowTitle = 'Redaxscript Setup'

Start-Process git -ArgumentList 'clone https://github.com/redaxscript/redaxscript.git C:\redaxscript' -Wait
Start-Process npm -ArgumentList 'install' -WorkingDirectory C:\redaxscript
Start-Process composer -ArgumentList 'install' -WorkingDirectory C:\redaxscript
