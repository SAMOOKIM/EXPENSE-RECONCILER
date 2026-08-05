@echo off
setlocal
cd /d "%~dp0"
echo ============================================
echo  Expense Reconciler - Windows Portable Build
echo ============================================
echo.
where py >nul 2>nul
if errorlevel 1 (
  echo Python launcher "py" was not found.
  echo This script is for BUILDING the portable EXE, not for end users.
  pause
  exit /b 1
)
py -3.11 -m venv .buildenv
call .buildenv\Scripts\activate.bat
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
python -m pip install pyinstaller
if not exist tesseract mkdir tesseract
echo.
echo Downloading Tesseract Windows package...
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$u='https://digi.bib.uni-mannheim.de/tesseract/tesseract-ocr-w64-setup-5.4.0.20240606.exe';" ^
  "$o='tesseract-installer.exe'; Invoke-WebRequest -Uri $u -OutFile $o"
echo.
echo Installing Tesseract into local build folder...
tesseract-installer.exe /S /D="%CD%\tesseract"
if not exist "tesseract\tesseract.exe" (
  echo Tesseract extraction failed.
  pause
  exit /b 1
)
echo.
echo Building portable EXE...
python -m PyInstaller --clean --noconfirm Expense_Reconciler.spec
echo.
echo Build finished. See dist\Expense_Reconciler.exe
pause
