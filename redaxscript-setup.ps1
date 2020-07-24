$host.ui.RawUI.WindowTitle = 'Redaxscript Setup'

Start-Process git -Wait -ArgumentList 'clone https://github.com/redaxscript/redaxscript.git C:\Redaxscript'
Start-Process composer -Wait -ArgumentList 'install' -WorkingDirectory C:\Redaxscript
Start-Process npm -Wait -ArgumentList 'install' -WorkingDirectory C:\Redaxscript
