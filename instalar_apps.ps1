# ==========================================================
# SCRIPT DE INSTALACIÓN AUTOMÁTICA - CARLOS SETUP
# Instalación de aplicaciones vía Winget
# ==========================================================

Write-Host "--- Iniciando instalación de aplicaciones para Carlos ---" -ForegroundColor Cyan

# Función para instalar con verificación básica
function Instalar-App {
    param (
        [string]$Nombre,
        [string]$Id
    )
    Write-Host "`n> Instalando: $Nombre..." -ForegroundColor Yellow
    winget install --id $Id --silent --accept-package-agreements --accept-source-agreements
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✅ $Nombre instalado con éxito." -ForegroundColor Green
    } else {
        Write-Host "❌ Hubo un detalle con $Nombre o ya estaba instalado." -ForegroundColor Red
    }
}

# --- LISTA DE APLICACIONES ---

# Reproductores y Herramientas de Video
Instalar-App "MPV Player" "mpv.mpv"
Instalar-App "YT-DLP" "yt-dlp.yt-dlp"
Instalar-App "OBS Studio" "OBSProject.OBSStudio"

# Navegadores
Instalar-App "Firefox" "Mozilla.Firefox"
Instalar-App "Google Chrome" "Google.Chrome"
Instalar-App "Opera" "Opera.Opera"
Instalar-App "Brave Browser" "Brave.Brave"

# Comunicación
Instalar-App "Telegram Desktop" "Telegram.TelegramDesktop"
Instalar-App "WhatsApp" "9NKSQGP7F2NH" # ID de la Microsoft Store

# Música y Juegos
Instalar-App "Clementine (Música)" "Clementine.Clementine"
Instalar-App "Steam" "Valve.Steam"

Write-Host "`n--- PROCESO FINALIZADO ---" -ForegroundColor Cyan
Write-Host "Recuerda reiniciar la terminal para que comandos como yt-dlp se reconozcan en cualquier ruta." -ForegroundColor White