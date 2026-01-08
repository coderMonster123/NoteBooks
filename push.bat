@echo off
echo ========================================
echo Git Auto Push Script
echo ========================================
echo.

echo Step 1: Adding all changes...
git add .
if %errorlevel% neq 0 (
    echo Error: Failed to add files
    pause
    exit /b 1
)

echo Step 2: Committing changes...
if "%~1"=="" (
    set COMMIT_MSG=Auto commit from push.bat
) else (
    set COMMIT_MSG=%~1
)
git commit -m "%COMMIT_MSG%"
if %errorlevel% neq 0 (
    echo Warning: Nothing to commit or commit failed
)

echo Step 3: Pushing to remote...
git push origin main
if %errorlevel% neq 0 (
    echo Error: Failed to push
    pause
    exit /b 1
)

echo.
echo ========================================
echo Done! Changes pushed successfully.
echo ========================================
pause
