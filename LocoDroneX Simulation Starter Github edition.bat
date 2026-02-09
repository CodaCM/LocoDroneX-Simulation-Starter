@echo off

echo LocoDroneX simulation Starter - Made by CodaCM

echo Starting Spyder
start C:\*locopthon location*\LocoPython_3-8-0\Spyder.exe
echo Starting LocoPython simulation
start C:\*locopython location*\LocoPython_3-8-0\scripts\sim_scripts\start_dronekit.bat
echo Waiting for MavProxy to start...

set appName=mavproxy.exe
set checkInterval=5

:check_loop
rem Check if the application is running
tasklist /FI "IMAGENAME eq %appName%" | find /I "%appName%" > nul

rem Check the ERRORLEVEL produced by the find command
IF %ERRORLEVEL% equ 0 (
    rem The application is running
    echo %appName% is open. Continuing script...
    goto continue
) else (
    rem The application is not running
    echo %appName% not found. Waiting %checkInterval% seconds...
    timeout /T %checkInterval% /nobreak > nul
    goto check_loop
)

:continue

echo Starting Mission Planner
start "" "C:Program Files (x86)\Mission Planner\MissionPlanner.exe"

echo All programs are now running

Pause