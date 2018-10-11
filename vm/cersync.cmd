@echo off

if EXIST static_ip.map (
	SET /p STATIC_IP=<static_ip.map
) else (
	echo "static_ip.map" doesn't exist
	goto:eof
)

set SYNC_USER=rd
set SYNC_PWD=a
set SYNC_SRV=%STATIC_IP%:873
set LOCAL_REPOSITORY_BASE=E:\WorkPlace\cegame\storage\
set DEF_EXCLUDE_ARGS=^
	--exclude='*.pch'^
	--exclude='*.pdb'^
	--exclude='*.ncb'^
	--exclude='*.suo'^
	--exclude='*.user'^
	--exclude='*.user'^
	--exclude='*.dbproj.schemaview'^
	--exclude='*.log'^
	--exclude='*.obj'^
	--exclude='*.sdf'^
	--exclude='*.map'^
	--exclude='*.ilk'^
	--exclude='*.opendb'^
	--exclude='*.dmp'^
	--exclude='*.err'^
	--exclude='*.vs'^
	--exclude='*.aps'^
	--exclude='**/Debug'^
	--exclude='**/Release'^
	--exclude='/computation/log'^
	--exclude='/monserver/*_Log.txt'^
	--exclude='/tools/Release(MySQL)'^
	--exclude='/tools/Debug(MySQL)'^
	--exclude='/websvc/log'^
	--exclude='**/*[0-9][0-9][0-9][0-9].exe'^
	--exclude='**/*[0-9][0-9][0-9][0-9].out'

call:func_rsync_gitlab_backup
goto:eof
	
if %1==gitlab_backup (call:func_rsync_gitlab_backup)
goto:eof

:: gitlab backup
:func_rsync_gitlab_backup
set SRC_DIR_PATCH=gitlab_backup
set DST_DIR=%LOCAL_REPOSITORY_BASE%gitlab\backups
set ARGS=^
	--include='*_gitlab_backup.tar'^
	--exclude='*'
	
call:func_rsync_pull "gitlab backup" "%SRC_DIR_PATCH%" %DST_DIR% "%ARGS%"
endlocal
goto:eof

:: push data to linux
:func_rsync_push
echo #### push: synchronize %~1
setlocal

if %2 == "" (
	echo source directory empty, skip
	echo.
	goto:eof
)
if not exist %~2 (
	echo source directory '%~2' not found, skip
	echo.
	goto:eof
)
for /f %%i in ('wmic logicaldisk where "name='%CD:~0,2%'" get drivetype') do (
	if %%i==4 (
		echo current path '%~dp0' is at netdrive, skip
		echo.
		goto:eof
	)
)

:: environment variables
set HOME=%USERPROFILE%
set PATH=%~dp0\bin;%PATH%
set RSYNC_PASSWORD=%SYNC_PWD%

set SYNC_URI=rsync://%SYNC_USER%@%SYNC_SRV%
set RSYNC_CMD=rsync -aih --iconv=big5,utf-8 -O --no-o --no-g --no-p --exclude '.git' --exclude '.svn' --exclude '.settings'

set _SRC=%2
set _DST=%~3
set _ARGS=%~4

set _PWD=%cd% & cd /d %_SRC%

:: _SRC_U is _SRC with unix path format
for /f %%i in ('pwd') do set _SRC_U=%%i

cd %_PWD%

%RSYNC_CMD% %_ARGS% %_SRC_U%/ %SYNC_URI%/%_DST%

endlocal
goto:eof

:: pull data from linux
:func_rsync_pull
echo #### pull: synchronize %~1
setlocal

if %3 == "" (
	echo destination directory empty, skip
	echo.
	goto:eof
)
if not exist %~3 (
	echo destination directory '%~3' not found, skip
	echo.
	goto:eof
)
for /f %%i in ('wmic logicaldisk where "name='%CD:~0,2%'" get drivetype') do (
	if %%i==4 (
		echo current path '%~dp0' is at netdrive, skip
		echo.
		goto:eof
	)
)

:: environment variables
set HOME=%USERPROFILE%
set PATH=%~dp0\bin;%PATH%
set RSYNC_PASSWORD=%SYNC_PWD%

set SYNC_URI=rsync://%SYNC_USER%@%SYNC_SRV%
set RSYNC_CMD=rsync -aih --iconv=big5,utf-8 -O --no-o --no-g --no-p --exclude '.git' --exclude '.svn' --exclude '.settings'

set _SRC=%2
set _DST=%~3
set _ARGS=%~4

set _PWD=%cd% & cd /d %_DST%

:: _DST_U is _DST with unix path format
for /f %%i in ('pwd') do set _DST_U=%%i

cd %_PWD%

%RSYNC_CMD% %_ARGS% %SYNC_URI%/%_SRC% %_DST_U%/

endlocal
goto:eof