@echo off
REM Script para reproducir la segunda lista de videos en MPV usando yt-dlp.
SET "PLAYLIST_FILE=lista2.txt"

REM --- 1. VERIFICAR ARCHIVO DE PLAYLIST ---
IF NOT EXIST "%PLAYLIST_FILE%" (
    ECHO ERROR: El archivo %PLAYLIST_FILE% no se encuentra en esta carpeta.
    ECHO Asegurate de que este guardado dentro de la carpeta de PowerShell.
    PAUSE
    EXIT /B 1
)

REM --- 2. INICIAR MPV ---
ECHO Iniciando reproduccion de la Lista 2 con MPV...
ECHO (Procesando enlaces, espera unos segundos...)

REM Ejecuta el reproductor usando la segunda lista
start "" mpv.exe --ytdl --playlist="%PLAYLIST_FILE%"

EXIT /B 0