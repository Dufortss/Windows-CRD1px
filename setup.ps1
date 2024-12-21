# Iniciar a configuração inicial
Write-Host "Iniciando a configuração inicial..."

# Verificar se o Chrome Remote Desktop já está instalado
$chromeRemoteDesktopPath = "C:\Program Files (x86)\Google\Chrome Remote Desktop\CurrentVersion\remoting_start_host.exe"
if (Test-Path $chromeRemoteDesktopPath) {
    Write-Host "Chrome Remote Desktop já está instalado." -ForegroundColor Green
    exit 0
}

# Define o URL do instalador do Chrome Remote Desktop
$chromeRemoteDesktopUrl = "https://dl.google.com/edgedl/chrome-remote-desktop/chromeremotedesktophost.msi"
$outputFile = "chrome_remote_desktop.msi"

# Baixar o instalador do Chrome Remote Desktop
Write-Host "Baixando o instalador do Chrome Remote Desktop..."
try {
    Invoke-WebRequest -Uri $chromeRemoteDesktopUrl -OutFile $outputFile -ErrorAction Stop
    Write-Host "Download concluído com sucesso."
} catch {
    Write-Host "Erro ao baixar o instalador. Verifique o link ou a conexão com a internet." -ForegroundColor Red
    Write-Host "Erro detalhado: $_" -ForegroundColor Red
    Exit 1
}

# Instalar o Chrome Remote Desktop
Write-Host "Instalando o Chrome Remote Desktop..."
try {
    Start-Process msiexec.exe -ArgumentList "/i", $outputFile, "/quiet", "/norestart" -Wait -ErrorAction Stop
    Write-Host "Instalação concluída com sucesso." -ForegroundColor Green
} catch {
    Write-Host "Erro ao instalar o Chrome Remote Desktop. Verifique permissões ou dependências." -ForegroundColor Red
    Write-Host "Erro detalhado: $_" -ForegroundColor Red
    Exit 1
}

# Limpar o instalador após a instalação (opcional)
if (Test-Path $outputFile) {
    Remove-Item $outputFile -Force
    Write-Host "Arquivo de instalação removido." -ForegroundColor Green
}

Write-Host "Configuração inicial concluída com sucesso!" -ForegroundColor Green

