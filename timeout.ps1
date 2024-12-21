# Configuração do tempo máximo de execução em minutos
$MaxDurationInMinutes = 180  # Tempo total (ajuste conforme necessário)
$IntervalInSeconds = 30      # Intervalo entre cada simulação de atividade

Write-Host "Keep-alive script iniciado. Duração máxima: $MaxDurationInMinutes minutos."

# Calcula o tempo final com base no tempo atual
$EndTime = (Get-Date).AddMinutes($MaxDurationInMinutes)

# Loop para manter a sessão ativa até atingir o tempo final
while ((Get-Date) -lt $EndTime) {
    $TimeRemaining = $EndTime - (Get-Date)
    Write-Host "Simulando atividade para manter a sessão ativa... Tempo restante: $($TimeRemaining.Hours)h $($TimeRemaining.Minutes)m $($TimeRemaining.Seconds)s"
    
    # Comando para simular uma ação leve (aqui substituindo Get-Process por uma mensagem simples)
    Write-Host "Keep-alive"

    # Aguarda o intervalo configurado antes de repetir
    Start-Sleep -Seconds $IntervalInSeconds
}

Write-Host "Keep-alive script finalizado. Tempo máximo atingido."
