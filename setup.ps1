# Atualiza o sistema e instala pacotes necessários
Write-Host "Iniciando a configuração inicial..."

# Exemplo: Instalar o Google Chrome (se necessário)
Invoke-WebRequest -Uri "https://dl.google.com/chrome/install/latest/chrome_installer.exe" -OutFile "$env:TEMP\chrome_installer.exe"
Start-Process -FilePath "$env:TEMP\chrome_installer.exe" -ArgumentList "/silent /install" -Wait

Write-Host "Configuração inicial concluída!"
