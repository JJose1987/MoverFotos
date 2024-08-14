@echo off
setlocal enabledelayedexpansion

REM Obtener el nombre de usuario
for /f "tokens=*" %%i in ('echo %username%') do set USERNAME=%%i

REM Crear la carpeta "Camera" en el escritorio
set DESKTOP_PATH=C:\Users\%USERNAME%\Desktop
set CAMERA_PATH=%DESKTOP_PATH%\Camera

if not exist "%CAMERA_PATH%" mkdir "%CAMERA_PATH%"

echo Primero movamos todas las fotos y/o videos a la carpeta "%CAMERA_PATH%".
pause

REM Generar una lista de archivos en la carpeta "Camera"
dir "%CAMERA_PATH%" > listFiles.txt

REM Procesar el archivo de lista
for /f "delims=" %%A in (listFiles.txt) do (
    set FILE=%%A
    set EXT=%%~xA

    REM Convertir a minúsculas
    set EXT=!EXT:.JPG=.jpg!
    set EXT=!EXT:.JPEG=.jpeg!
    set EXT=!EXT:.PNG=.png!
    set EXT=!EXT:.BMP=.bmp!
    set EXT=!EXT:.GIF=.gif!
    set EXT=!EXT:.TIFF=.tiff!
    set EXT=!EXT:.HEIF=.heif!
    set EXT=!EXT:.RAW=.raw!
    set EXT=!EXT:.PSD=.psd!
    set EXT=!EXT:.AVI=.avi!
    set EXT=!EXT:.MP4=.mp4!
    set EXT=!EXT:.WMV=.wmv!
    set EXT=!EXT:.WMA=.wma!
    set EXT=!EXT:.MOV=.mov!
    set EXT=!EXT:.FLV=.flv!
    set EXT=!EXT:.RM=.rm!
    set EXT=!EXT:.RMVB=.rmvb!
    set EXT=!EXT:.MKV=.mkv!
    set EXT=!EXT:.3GP=.3gp!
    set EXT=!EXT:.264=.264!
    set EXT=!EXT:.MPG=.mpg!
    
    REM Si es un archivo permitido lo activa verdadero
    set EXT=!EXT:.jpg=.true!
    set EXT=!EXT:.jpeg=.true!
    set EXT=!EXT:.png=.true!
    set EXT=!EXT:.bmp=.true!
    set EXT=!EXT:.gif=.true!
    set EXT=!EXT:.tiff=.true!
    set EXT=!EXT:.heif=.true!
    set EXT=!EXT:.raw=.true!
    set EXT=!EXT:.psd=.true!
    set EXT=!EXT:.avi=.true!
    set EXT=!EXT:.mp4=.true!
    set EXT=!EXT:.wmv=.true!
    set EXT=!EXT:.wma=.true!
    set EXT=!EXT:.mov=.true!
    set EXT=!EXT:.flv=.true!
    set EXT=!EXT:.rm=.true!
    set EXT=!EXT:.rmvb=.true!
    set EXT=!EXT:.mkv=.true!
    set EXT=!EXT:.3gp=.true!
    set EXT=!EXT:.264=.true!
    set EXT=!EXT:.mpg=.true!

    REM Si el archivo es una imagen o vídeo
    if /i "!EXT!"==".true" (
        REM Extraer la fecha del archivo (simulada, se requiere ajuste real según formato de fecha en MS-DOS)
        set DIA=!FILE:~0,2!
        set MES=!FILE:~3,2!
        set ANO=!FILE:~6,4!
        set NAME_FILE=!FILE:~36!

        REM Crear la carpeta de destino y mover el archivo
        set DEST_FOLDER=%CAMERA_PATH%\!ANO!-!MES!-!DIA!_
        echo "!NAME_FILE!"
        if not exist "!DEST_FOLDER!" mkdir "!DEST_FOLDER!"
        move "%CAMERA_PATH%\!NAME_FILE!" "!DEST_FOLDER!\!NAME_FILE!"
    )
)

REM Limpiar archivos temporales
del listFiles.txt

pause