@rem check to make sure that the main powershell script exists before attempting to run it
@if not exist "Tools\lib\Installer.ps1" (
    echo ERROR: Tools\lib\Installer.ps1 not found.
    echo ERROR: ----------
    echo ERROR: Please make sure you are running this script from the correct location
    echo ERROR: and have extracted all files from the archive.
    echo.
    pause
    exit /B 1
)

@rem Note: If choosing to run this command manually, only use it from "powershell.exe" onwards, and change "%~dp0" to "%CD%"
@start "BiRaitBec WorkBase Improved" powershell.exe -ExecutionPolicy Bypass -Command "& '%~dp0\Tools\lib\Installer.ps1'"
