@echo off
REM Script para reproducir videos en MPV usando yt-dlp para el streaming.
SET "PLAYLIST_FILE=playlist.txt"

REM --- 1. VERIFICAR ARCHIVO DE PLAYLIST ---
IF NOT EXIST "%PLAYLIST_FILE%" (
    ECHO ERROR: El archivo %PLAYLIST_FILE% no se encuentra en esta carpeta.
    ECHO Asegurate de crearlo con los enlaces.
    PAUSE
    EXIT /B 1
)

REM --- 2. INICIAR MPV ---
ECHO Iniciando reproduccion con MPV.
ECHO (Esto puede tomar unos segundos mientras yt-dlp procesa los enlaces...)

REM El comando:
REM mpv.exe: Ejecuta el reproductor (debe estar en la misma carpeta o en el PATH).
REM --ytdl: Le indica a MPV que use el backend yt-dlp.
REM --playlist: Carga la lista de enlaces.
start "" mpv.exe --ytdl --playlist="%PLAYLIST_FILE%"

EXIT /B 0