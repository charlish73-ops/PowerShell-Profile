# ==============================================================================
# SCRIPT DE INSTALACIÓN AUTOMÁTICA DE APLICACIONES (WINGET)
# Autor: Carlos (Charlish73-Ops)
# Descripción: Instala automáticamente tus aplicaciones esenciales usando WinGet
# ==============================================================================

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "   INICIANDO INSTALACIÓN AUTOMÁTICA DE APLICACIONES        " -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host ""

# Lista de aplicaciones a instalar con sus IDs oficiales de WinGet
$apps = @(
    @{ Name = "yt-dlp";          ID = "yt-dlp.yt-dlp" },
    @{ Name = "MPV Player";      ID = "JerryKoy.MPV" },
    @{ Name = "OBS Studio";      ID = "OBSProject.OBSStudio" },
    @{ Name = "Google Chrome";   ID = "Google.Chrome" },
    @{ Name = "Brave Browser";   ID = "Brave.Brave" },
    @{ Name = "Vivaldi";         ID = "Vivaldi.Vivaldi" },
    @{ Name = "Mozilla Firefox"; ID = "Mozilla.Firefox" },
    @{ Name = "Nahimic";         ID = "A-Volute.Nahimic" },
    @{ Name = "Telegram Desktop";ID = "Telegram.TelegramDesktop" },
    @{ Name = "WhatsApp";        ID = "WhatsApp.WhatsApp" },
    @{ Name = "Lenovo Vantage";  ID = "Lenovo.LenovoVantage" }
)

# Verificar si WinGet está disponible en el sistema
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "[ERROR] WinGet no está instalado o no se encuentra en el PATH." -ForegroundColor Red
    Write-Host "Por favor, instala 'App Installer' desde la Microsoft Store antes de continuar." -ForegroundColor Yellow
    Exit
}

# Bucle para instalar cada aplicación
foreach ($app in $apps) {
    Write-Host "----------------------------------------------------------" -ForegroundColor Gray
    Write-Host "Preparando instalación de: $($app.Name)..." -ForegroundColor Yellow
    
    # Comando de instalación silencioso y aceptando licencias automáticamente
    winget install --id $app.ID --silent --accept-package-agreements --accept-source-agreements
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "[OK] $($app.Name) se instaló correctamente." -ForegroundColor Green
    } else {
        Write-Host "[!] Hubo un detalle o ya estaba instalado: $($app.Name) (Código: $LASTEXITCODE)" -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "==========================================================" -ForegroundColor Green
Write-Host "   ¡PROCESO FINALIZADO CON ÉXITO!                         " -ForegroundColor Green
Write-Host "==========================================================" -ForegroundColor Green