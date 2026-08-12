@echo off
REM =============================================================
REM Aegis Watch -- environment setup (Windows)
REM Creates a fresh, named virtual environment, installs every
REM dependency in requirements.txt, and registers it as a Jupyter
REM kernel so it shows up in your kernel picker by name.
REM
REM Usage:
REM   1. Edit ENV_NAME below if you want a different name.
REM   2. Double-click this file, or run it from a terminal in the
REM      project folder:  setup_env.bat
REM =============================================================

setlocal
set ENV_NAME=aegiswatch-env
set DISPLAY_NAME=Aegis Watch (aegiswatch-env)

echo.
echo === Creating virtual environment: %ENV_NAME% ===
python -m venv %ENV_NAME%
if errorlevel 1 (
    echo Failed to create venv. Make sure Python is installed and on PATH.
    exit /b 1
)

echo.
echo === Activating %ENV_NAME% ===
call %ENV_NAME%\Scripts\activate.bat

echo.
echo === Upgrading pip ===
python -m pip install --upgrade pip

echo.
echo === Installing project requirements ===
pip install -r requirements.txt

echo.
echo === Installing ipykernel (needed to register this env as a Jupyter kernel) ===
pip install ipykernel

echo.
echo === Registering Jupyter kernel: %ENV_NAME% ===
python -m ipykernel install --user --name=%ENV_NAME% --display-name "%DISPLAY_NAME%"

echo.
echo =============================================================
echo Done. In Jupyter, select kernel:  %DISPLAY_NAME%
echo To run the Streamlit app instead:
echo   %ENV_NAME%\Scripts\activate.bat
echo   streamlit run app.py
echo =============================================================
endlocal
