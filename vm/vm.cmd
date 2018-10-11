@echo off

set vm_manage=D:\Program\Oracle\VirtualBox\VBoxManage.exe

goto:main

REM params: vm_name
REM return: 0 (failed), 1 (failed)
:check_exist
setlocal
set vm_name=%1
for /F "delims=" %%x in ('%vm_manage% list vms ^| findstr "%vm_name%"') do set res=%%x
if "%res%" == "" (
	exit /b 1
) else (
	exit /b 0
)
goto:eof

REM params: vm_name vm_state
REM vm_state: "powered off", "running"
REM return: 0 (failed), 1 (failed)
:check_state
setlocal
set vm_name=%1
set pattern="^State:.*%~2"
for /F "delims=" %%x in ('%vm_manage% showvminfo "%vm_name%" ^| findstr /r /c:%pattern%') do set res=%%x
if "%res%" == "" (
	exit /b 1
) else (
	exit /b 0
)
goto:eof

REM params: vm_name vm_state
REM vm_state: "powered off", "running"
:wait_state
setlocal
:wait_begin
set vm_name=%1
set vm_state=%2
call :check_state %vm_name% %vm_state%
if not %ERRORLEVEL% == 0 (
	timeout /t 1 > nul
	goto:wait_begin
)
endlocal
goto:eof

REM params: vm_name
:start
setlocal
set vm_name=%1
set vm_state="running"
call :check_state %vm_name% %vm_state%
if %ERRORLEVEL% == 0 (
	goto:eof
)
%vm_manage% startvm %vm_name%
call :wait_state %vm_name% %vm_state%
endlocal
goto:eof

REM params: vm_name, stop_method
REM stop_method: "savestate", "acpipowerbutton"
:stop
setlocal
set vm_name=%1
set vm_state="powered off"
call :check_state %vm_name% %vm_state%
if %ERRORLEVEL% == 0 (
	goto:eof
)
%vm_manage% controlvm %vm_name% %~2
call :wait_state %vm_name% %vm_state%
endlocal
goto:eof

:main
if %1==check_exist (call :check_exist %2)
if %1==check_state (call :check_state %2 %3)
if %1==wait_state (call :check_state %2 %3)
if %1==start (call :start %2 %3)
if %1==stop (call :stop %2 %3)