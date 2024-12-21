# Configuração do tempo máximo de execução em minutos
$MaxDurationInMinutes = 180  # Tempo total (ajuste conforme necessário)
$IntervalInSeconds = 30    # Intervalo entre cada simulação de atividade

Write-Host "Keep-alive script iniciado. Duração máxima: $MaxDurationInMinutes minutos."

# Calcula o tempo final com base no tempo atual
$EndTime = (Get-Date).AddMinutes($MaxDurationInMinutes)

while ((Get-Date) -lt $EndTime) {
    Write-Host "Simulando atividade para manter a sessão ativa..."
    
    # Comando para simular uma ação (por exemplo, listar processos)
    Get-Process > $null

    # Aguarda o intervalo configurado antes de repetir
    Start-Sleep -Seconds $IntervalInSeconds
}

Write-Host "Keep-alive script finalizado. Tempo máximo atingido."
