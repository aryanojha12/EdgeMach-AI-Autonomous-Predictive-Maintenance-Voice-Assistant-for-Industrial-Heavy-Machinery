#!/usr/bin/env bash
# =============================================================
# Aegis Watch -- environment setup (macOS / Linux)
# Creates a fresh, named virtual environment, installs every
# dependency in requirements.txt, and registers it as a Jupyter
# kernel so it shows up in your kernel picker by name.
#
# Usage:
#   1. Edit ENV_NAME below if you want a different name.
#   2. chmod +x setup_env.sh && ./setup_env.sh
# =============================================================
set -e

ENV_NAME="aegiswatch-env"
DISPLAY_NAME="Aegis Watch (aegiswatch-env)"

echo
echo "=== Creating virtual environment: $ENV_NAME ==="
python3 -m venv "$ENV_NAME"

echo
echo "=== Activating $ENV_NAME ==="
source "$ENV_NAME/bin/activate"

echo
echo "=== Upgrading pip ==="
python -m pip install --upgrade pip

echo
echo "=== Installing project requirements ==="
pip install -r requirements.txt

echo
echo "=== Installing ipykernel (needed to register this env as a Jupyter kernel) ==="
pip install ipykernel

echo
echo "=== Registering Jupyter kernel: $ENV_NAME ==="
python -m ipykernel install --user --name="$ENV_NAME" --display-name "$DISPLAY_NAME"

echo
echo "============================================================="
echo "Done. In Jupyter, select kernel:  $DISPLAY_NAME"
echo "To run the Streamlit app instead:"
echo "  source $ENV_NAME/bin/activate"
echo "  streamlit run app.py"
echo "============================================================="
