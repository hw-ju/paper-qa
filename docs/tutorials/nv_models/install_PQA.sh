### 1. Clone Your Fork (or the main repo)
git clone https://github.com/hw-ju/paper-qa.git
cd paper-qa

# Switch to your branch if needed
git checkout selfhost_NIMs
git branch


### 2. (Optional) Install Python 3.11 (if not already installed)
# paper-qa requires >=3.11
# Commands below were used on a Brev instance with only Python 3.10 pre-installed.

# Ubuntu/Debian: add deadsnakes PPA and install Python 3.11
sudo apt update
sudo apt install -y software-properties-common
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt update
sudo apt install -y python3.11 python3.11-venv python3.11-dev

# Verify
python3.11 --version


### 3. Install in Editable Mode
# Create a venv with 3.11 and use it for the steps below:
cd paper-qa
python3.11 -m venv .venv
source .venv/bin/activate
# Now python and pip are 3.11
python3 --version

# - pymupdf: PDF fallback when nemotron-parse fails on a page
# - nemotron: paper-qa-nemotron (parse_pdf_to_pages, LiteLLM call to nemotron-parse NIM)
pip install --upgrade pip
pip install -e ".[pymupdf,nemotron]"

# Sanity check
python -c "import paperqa; import paperqa_nemotron; print('OK')"

# Notebook support
pip install ipykernel


### 4. Verify Installation
### Check Python Environment
which python
python --version

# Check pip packages
pip list | grep paper-qa

# Test Import
python -c "import paperqa; print(paperqa.__file__)"
# Expected output: path to `.../paper-qa/src/paperqa/__init__.py` under your repo


### 5. Register Jupyter Kernel
# Register the environment as a Jupyter kernel
python -m ipykernel install --user --name=paperqa-dev --display-name="PaperQA Dev"

# List Available Kernels
jupyter kernelspec list