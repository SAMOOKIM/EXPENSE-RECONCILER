@echo off
setlocal
cd /d "%~dp0"

echo ============================================
echo Expense Reconciler - Windows Portable Build
echo ============================================
echo.

python -m venv .buildenv
call .buildenv\Scripts\activate.bat

python -m pip install --upgrade pip
python -m pip install -r requirements.txt
python -m pip install pyinstaller

echo.
echo Building portable EXE...
python -m PyInstaller --clean --noconfirm Expense_Reconciler.spec

echo.
echo Build finished. See dist\Expense_Reconciler.exe
