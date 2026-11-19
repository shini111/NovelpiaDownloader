@echo off
setlocal
cd /d "%~dp0"
echo Building NovelpiaDownloader (Release)...
echo.

set "MSBUILD="
set "VSWHERE=%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe"
if not exist "%VSWHERE%" goto :nofind
for /f "usebackq delims=" %%i in (`"%VSWHERE%" -latest -products * -requires Microsoft.Component.MSBuild -find MSBuild\**\Bin\MSBuild.exe`) do set "MSBUILD=%%i"
:nofind
if defined MSBUILD goto :build
set "MSBUILD=%windir%\Microsoft.NET\Framework64\v4.0.30319\MSBuild.exe"
if exist "%MSBUILD%" goto :build

echo MSBuild was not found.
echo Install "Visual Studio Build Tools" with the ".NET desktop build tools" workload,
echo or Visual Studio Community with ".NET desktop development", then run this again.
pause
exit /b 1

:build
echo Using: %MSBUILD%
echo.
"%MSBUILD%" NovelpiaDownloader.sln /t:Rebuild /p:Configuration=Release /v:minimal
if errorlevel 1 goto :failed

echo.
echo Build finished: %~dp0bin\Release\NovelpiaDownloader.exe
start "" "%~dp0bin\Release"
pause
exit /b 0

:failed
echo.
echo Build FAILED. Copy the error lines above (the ones containing "error") and send them to me.
echo If it says the .NET Framework 4.8 targeting pack is missing, install the
echo ".NET Framework 4.8 Developer Pack" from Microsoft and try again.
pause
exit /b 1
