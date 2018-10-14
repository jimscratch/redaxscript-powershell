$host.ui.RawUI.WindowTitle = 'Redaxscript Start'

Start-Process C:\Papercut\Papercut.Service.exe -ArgumentList 'start'
Start-Process grunt -ArgumentList 'serve -O' -WorkingDirectory redaxscript
