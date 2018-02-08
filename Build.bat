@echo off

set installationDir="F:\Program Files\Unity 2017.3.0f3\Editor\Unity.exe"
set projectPath="F:\Work\Game\endless-nameless\EndlessNameless.Unity\"
set buildsPath=F:\Work\Game\endless-nameless\EndlessNameless.Builds

if "%1"=="windows" (
    set os=Windows
)
if "%1"=="linux" (
    set os=Linux
)
if "%1"=="macos" (
    set os=macOS
)

if "%2"=="-l" (
    if not exist "%buildsPath%\%os%" (
        echo No builds for "%os%"
        exit /B 0
    )

    for /F "delims=" %%i IN ('dir "%buildsPath%\%os%\" /b /ad-h /t:c /od') DO SET a=%%i
    
    echo Most recent "%os%" build version is %a%

    exit /B 0
)

set buildPath=%buildsPath%\%os%\[%2] Endless Nameless

if exist "%buildPath%" (
    echo Version %2 for %1 is already built.
    exit /b 1
)

md .\BuildTemp\
echo Copying the project to a temp directory.
xcopy F:\Work\Game\endless-nameless\EndlessNameless.Unity .\BuildTemp\ /q /s /y /exclude:F:\Work\Game\endless-nameless\Excludes.txt
set projectPath=.\BuildTemp\

echo Starting a build for %1, version %2 in "%buildPath%"

if "%os%"=="Windows" (
    %installationDir% -projectPath F:\Work\Game\endless-nameless\BuildTemp\ -buildWindowsPlayer "%buildPath%\Endless Nameless.exe" -quit -batchmode -nographics
    if ERRORLEVEL 1 (
        echo Build failed
    ) else (
        echo Build succeeded
    )
    start explorer "%buildPath%"
)

if "%os%"=="Linux" (
    %installationDir% -projectPath %projectPath% -buildLinuxUniversalPlayer "%buildPath%\Endless Nameless" -quit -batchmode -nographics
    if ERRORLEVEL 1 (
        echo Build failed
    ) else (
        echo Build succeeded
    )
    start explorer "%buildPath%"
)

if "%os%"=="macOS" (
    %installationDir% -projectPath %projectPath% -buildOSXUniversalPlayer  "%buildPath%\Endless Nameless.app" -quit -batchmode -nographics
    if ERRORLEVEL 1 (
        echo Build failed
    ) else (
        echo Build succeeded
    )
    start explorer "%buildPath%"
)

rd %projectPath% /s /q
