# Desativar o firewall temporariamente (não recomendado em ambientes públicos)
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

# Baixar e instalar o Chrome Remote Desktop
& {
  $P = $env:TEMP + '\chromeremotedesktophost.msi'
  Invoke-WebRequest 'https://dl.google.com/edgedl/chrome-remote-desktop/chromeremotedesktophost.msi' -OutFile $P
  Start-Process $P -Wait
  Remove-Item $P
}

# Baixar e instalar o Google Chrome
& {
  $P = $env:TEMP + '\chrome_installer.exe'
  Invoke-WebRequest 'https://dl.google.com/chrome/install/latest/chrome_installer.exe' -OutFile $P
  Start-Process -FilePath $P -Args '/install' -Verb RunAs -Wait
  Remove-Item $P
}

# Reativar o firewall após a execução
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
