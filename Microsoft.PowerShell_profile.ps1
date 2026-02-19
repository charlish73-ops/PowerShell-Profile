# --- 1. BANNER DE BIENVENIDA (CENTRADOR) ---
function Show-Banner {
    $banner = @'
 ____     _     ____   _         ___    ____  
/ ___|   / \    |  _ \ | |       / _ \  / ___| 
| |      / _ \   | |_) || |       | | | | \___ \ 
| |___  / ___ \ |  _ < | |___  | |_| |  ___) |
 \____|/_/   \_\|_| \_\|_____|  \___/  |____/ 
'@
    $choices = $banner -split "`n"
    $width = $Host.UI.RawUI.WindowSize.Width
    foreach ($line in $choices) {
        $offset = [int](($width - $line.Length) / 2)
        if ($offset -lt 0) { $offset = 0 }
        Write-Host (" " * $offset + $line) -ForegroundColor Cyan
    }
}

# --- 2. PROMPT PERSONALIZADO ---
function prompt {
    $path = $(Get-Location)
    Write-Host "[CARLOS]" -NoNewline -ForegroundColor Green
    Write-Host " @ " -NoNewline -ForegroundColor Gray
    Write-Host "$path" -NoNewline -ForegroundColor Cyan
    Write-Host "`n> " -NoNewline -ForegroundColor White
    return " "
}

# --- 3. FUNCIONES DE PRODUCTIVIDAD ---

function inicio {
    if (Test-Path "C:\Program Files\Google\Chrome\Application\chrome.exe") {
        & "C:\Program Files\Google\Chrome\Application\chrome.exe" "https://www.google.com"
    } else {
        start chrome "https://www.google.com"
    }
    start firefox
    start msedge
    start msedge --app="https://music.youtube.com"
    start "whatsapp:"
    start "tg:"
    Write-Host "--- MODO TRABAJO COMPLETO: APPS LISTAS ---" -ForegroundColor Cyan
}

function matrix {
    $Host.UI.RawUI.WindowTitle = "Matrix"
    $Host.UI.RawUI.ForegroundColor = "Green"
    $Host.UI.RawUI.BackgroundColor = "Black"
    Clear-Host
    $width = $Host.UI.RawUI.WindowSize.Width
    $height = $Host.UI.RawUI.WindowSize.Height
    $cols = @{}
    for ($i = 0; $i -lt $width; $i++) { $cols[$i] = Get-Random -Minimum 0 -Maximum $height }
    while ($true) {
        $str = ""
        for ($i = 0; $i -lt $width; $i++) {
            if ($i % 2 -eq 0) {
                if ($cols[$i] -le 0) {
                    $str += [char](Get-Random -Minimum 33 -Maximum 126)
                    $cols[$i] = Get-Random -Minimum 10 -Maximum $height
                } else {
                    $str += " "
                    $cols[$i]--
                }
            } else { $str += " " }
        }
        Write-Host $str -NoNewline
        if ([console]::KeyAvailable) { break }
    }
}

function tele {
    Clear-Host
    Write-Host "--- CENTRAL DE VIDEO: CANALES RD ---" -ForegroundColor Cyan
    Write-Host "1) Teleantillas (C2)   7) Digital 15"
    Write-Host "2) RTVD (C4)           8) Telefuturo (C23)"
    Write-Host "3) Telemicro (C5)      9) CDN (C37)"
    Write-Host "4) Color Vision (C9)   10) AME (C47)"
    Write-Host "5) Telesistema (C11)   11) Zol 106.5 TV"
    Write-Host "6) Telecentro (C13)    12) Z 101 TV"
    Write-Host "q) Salir"
    $opcion = Read-Host "Sintonizar Canal"
    switch ($opcion) {
        "1"  { start msedge --app="https://teleantillas.com.do/en-vivo/" }
        "2"  { start msedge --app="https://rtvd.gob.do/" }
        "3"  { start msedge --app="https://telemicro.com.do/telemicro-en-vivo/" }
        "4"  { start msedge --app="https://colorvision.com.do/en-vivo/" }
        "5"  { start msedge --app="https://telesistema11.com.do/en-vivo/" }
        "6"  { start msedge --app="https://telemicro.com.do/telecentro-en-vivo/" }
        "7"  { start msedge --app="https://telemicro.com.do/digital-15-en-vivo/" }
        "8"  { start msedge --app="http://www.telefuturo.com.do/" }
        "9"  { start msedge --app="https://cdn.com.do/envivo/" }
        "10" { start msedge --app="https://dominicanchannels.com/ame-47/" }
        "11" { start msedge --app="https://zolfm.com/streaming" }
        "12" { start msedge --app="https://z101digital.com/ztv/" }
        "q"  { return }
    }
}

function playlist {
    param([string]$url)
    if (-not $url) { $url = Read-Host "Pega el link de la lista" }
    
    $url = $url.Trim().Trim("'").Trim('"')

    Clear-Host
    Write-Host "==============================================" -ForegroundColor Cyan
    Write-Host "        REPRODUCTOR RADIO CARLOS (V5.3)       " -ForegroundColor Cyan
    Write-Host "==============================================" -ForegroundColor Cyan
    Write-Host "  ESTADO: Máxima Compatibilidad                " -ForegroundColor Green
    Write-Host "  Controles: [Enter] Siguiente | [p] Pausa     " -ForegroundColor Gray
    Write-Host "==============================================" -ForegroundColor Cyan
    Write-Host ""

    mpv "$url" --no-video `
        --gapless-audio=yes `
        --prefetch-playlist=yes `
        --cache=yes `
        --cache-secs=450 `
        --demuxer-readahead-secs=300 `
        --volume=100 `
        --loop-playlist=inf `
        --ytdl-raw-options="yes-playlist=,ignore-config=" `
        --term-playing-msg="`n>>> ESCUCHANDO: ${media-title} <<<`n"
}

function m {
    Clear-Host
    Write-Host "==========================================================" -ForegroundColor Cyan
    Write-Host "              BIBLIOTECA MUSICAL DE CARLOS                " -ForegroundColor Cyan
    Write-Host "==========================================================" -ForegroundColor Cyan
    Write-Host " 1. SALSA                    10. PLAYERO                   " 
    Write-Host " 2. REGUETON VIEJO           11. MERENGUE PARA BAILAR      " 
    Write-Host " 3. REGUETON SUAVE           12. OZUNA NUEVO               " 
    Write-Host " 4. CONCIERTO DADDY YANKY    13. MAMBO                     " 
    Write-Host " 5. URBANO 2020              14. CIMA SABOR NAVIDENO 1     " -ForegroundColor Green
    Write-Host " 6. SALSA 20                 15. CIMA SABOR NAVIDENO 2     " -ForegroundColor Green
    Write-Host " 7. LA NOTA                  16. HECTOR LAVOE              " -ForegroundColor Yellow
    Write-Host " 8. DEMBOW                   17. FRANKIE RUIZ              " -ForegroundColor Yellow
    Write-Host " 9. BACHATA                  18. EDDIE SANTIAGO            " -ForegroundColor Yellow
    Write-Host " q. SALIR                                                 " -ForegroundColor Red
    Write-Host "==========================================================" -ForegroundColor Cyan
    
    $choice = Read-Host "Elige un numero"

    switch ($choice) {
        "1"  { $url = 'https://music.youtube.com/watch?v=xWDsNex_VKA&list=RDCLAK5uy_lRQbFalJOe45Qa-ERq9tTVUIv6WZFW_WA' }
        "2"  { $url = 'https://music.youtube.com/watch?v=1WSUrECDvec&list=PL0V7q1HYjwBFZjT9GSJzQxxrPFMPoKLor' }
        "3"  { $url = 'https://music.youtube.com/watch?v=FXovf5dsRTw&list=PLegCzvHttBUJSfhIFKX-afB7BAFfar8Or' }
        "4"  { $url = 'https://music.youtube.com/playlist?list=PLAShHsny6t4JUkLK50JGXe5iOkCU-8Rt1' }
        "5"  { $url = 'https://music.youtube.com/playlist?list=PLAShHsny6t4IC6FtjNbzN8_UoCMnWc57L' }
        "6"  { $url = 'https://music.youtube.com/watch?v=CoWfU6C9tnY&list=PLAShHsny6t4KRGUV9gFA1vlXR8W57_HiK' }
        "7"  { $url = 'https://music.youtube.com/watch?v=IWrZpP24H8I&list=PLfbJBmoDv1zZ7Uvc1W84n0zL4AUMYjeUY' }
        "8"  { $url = 'https://music.youtube.com/watch?v=79XCNh-Rcs8&list=PLAShHsny6t4JuWZmEUQdXWLjFk1DrkDQv' }
        "9"  { $url = 'https://music.youtube.com/watch?v=z6YnfxsY5M0&list=PLAShHsny6t4JX1-OqoQRsIgqWD3Js9j0G' }
        "10" { $url = 'https://music.youtube.com/watch?v=DhYKYCMv644&list=PLAShHsny6t4KpnWwmioFLzYczDJBZOBou' }
        "11" { $url = 'https://music.youtube.com/watch?v=0yazzzUxLWY&list=PLAShHsny6t4IuT_bsTXHpDN8lWuBxCnGR' }
        "12" { $url = 'https://music.youtube.com/watch?v=Nz_q7x-5lAk&list=PLAShHsny6t4JHmJ4eWJEdQtbChNcv0uV7' }
        "13" { $url = 'https://music.youtube.com/watch?v=1SZPeVxJld4&list=PLAShHsny6t4Lj78lzSETjxfXI1TMW7v61' }
        "14" { $url = 'https://music.youtube.com/watch?v=Q-OGCde5XU4&list=PLj_eUaiCu1ZlF2hjKLzc0RYw9UwJiZ9vU' }
        "15" { $url = 'https://music.youtube.com/watch?v=Fz3pPMyzkXU&list=PLAShHsny6t4KuPETMMYWhWbwbPO5ekW1q' }
        "16" { $url = 'https://music.youtube.com/watch?v=iAH7SiBDjBw&list=RDEMFLnWNDazY60BcgLqPABKjg' }
        "17" { $url = 'https://music.youtube.com/watch?v=nAkN2Hz7ZXs&list=OLAK5uy_mERZ6qQIUEIOuV4xKdZfxOOg3AlQAiDDM' }
        "18" { $url = 'https://music.youtube.com/watch?v=JiiCJ6pWdKo&list=OLAK5uy_lAX_vA_Ji253-Q3CdUs3diauDX1OLJVr4' }
        "q"  { return }
        Default { return }
    }
    playlist $url
}

# --- 4. MENU DE AYUDA ---
function ayuda {
    Write-Host "`n==========================================================" -ForegroundColor Cyan
    Write-Host "          SISTEMA DE COMANDOS - CARLOS                    " -ForegroundColor Black -BackgroundColor Cyan
    Write-Host "==========================================================" -ForegroundColor Cyan
    Write-Host "  inicio   - Lanza Navegadores y Apps"
    Write-Host "  m        - Biblioteca Musical"
    Write-Host "  tele     - Canales de TV Dominicana"
    Write-Host "  matrix   - Efecto Matrix"
    Write-Host "  reboot   - Reiniciar PC"
    Write-Host "  apagar   - Apagar PC"
    Write-Host "==========================================================" -ForegroundColor Cyan
}

# --- 5. FUNCIONES DE SISTEMA ---
function reboot {
    Write-Host "Reiniciando el sistema de Carlos... ¡Nos vemos pronto!" -ForegroundColor Yellow
    Restart-Computer
}

function apagar {
    Write-Host "Apagando i5-11500 + GTX 1660 SUPER. ¡Adiós, Carlos!" -ForegroundColor Red
    Stop-Computer
}

# --- 6. EJECUCION AL INICIAR ---
Clear-Host
Show-Banner
ayuda

function subir {
    # Guardamos los cambios actuales
    git add .
    
    # Creamos un mensaje con la fecha y hora actual
    $fecha = Get-Date -Format "dd/MM/yyyy HH:mm"
    git commit -m "Actualización del perfil: $fecha"
    
    # Lo enviamos a GitHub
    git push
    
    Write-Host "--- PERFIL RESPALDADO EN GITHUB EXITOSAMENTE ---" -ForegroundColor Green
}