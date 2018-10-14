Start-Process git -ArgumentList 'clone https://github.com/redaxscript/redaxscript.git' -Wait
Start-Process npm -ArgumentList 'install' -WorkingDirectory redaxscript
Start-Process composer -ArgumentList 'install' -WorkingDirectory redaxscript
