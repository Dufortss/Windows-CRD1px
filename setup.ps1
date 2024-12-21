# Atualiza o sistema e instala pacotes necessários
Write-Host "Iniciando a configuração inicial..."

# Instalar Chrome Remote Desktop
Invoke-WebRequest -Uri "https://dl.google.com/chrome-remote-desktop/chrome_remote_desktop.msi" -OutFile "chrome_remote_desktop.msi"
Start-Process "chrome_remote_desktop.msi" -ArgumentList "/quiet" -Wait

Write-Host "Configuração inicial concluída!"
