$host.ui.RawUI.WindowTitle = 'Redaxscript Setup'

Start-Process git -ArgumentList 'clone https://github.com/redaxscript/redaxscript.git C:\Redaxscript' -Wait
Start-Process composer -ArgumentList 'install' -WorkingDirectory C:\Redaxscript -Wait
Start-Process npm -ArgumentList 'install' -WorkingDirectory C:\Redaxscript -Wait
