# ==============================================================================
# SCRIPT DE CONFIGURACIÓN RÁPIDA DE GIT Y CREDENCIALES
# Autor: Carlos (Charlish73-Ops)
# ==============================================================================

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "   CONFIGURANDO IDENTIDAD Y CREDENCIALES DE GIT           " -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host ""

# 1. Configurar los datos de tu cuenta de GitHub
Write-Host "-> Configurando nombre de usuario y correo..." -ForegroundColor Yellow
git config --global user.name "Charlish73-Ops"
git config --global user.email "charlish73@gmail.com"

# 2. Activar el Administrador de Credenciales de Windows
# Esto hace que Windows recuerde tu Token de forma segura y encriptada
Write-Host "-> Activando el gestor de credenciales seguro de Windows..." -ForegroundColor Yellow
git config --global credential.helper manager

Write-Host ""
Write-Host "[OK] Git ha sido configurado globalmente con tu usuario." -ForegroundColor Green
Write-Host "[!] La primera vez que intentes descargar o subir algo, Windows" -ForegroundColor Yellow
Write-Host "    te pedirá tu Token. Lo pegas ahí UNA SOLA VEZ y Windows" -ForegroundColor Yellow
Write-Host "    lo recordará para siempre de forma totalmente segura." -ForegroundColor Yellow
Write-Host "==========================================================" -ForegroundColor Green