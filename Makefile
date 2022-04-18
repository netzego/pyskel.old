VENV   			:= .venv
PYTHON 		     	:= $(VENV)/bin/python3
SYS_PYTHON		:= $(shell which python)
PYTEST 		     	:= $(VENV)/bin/pytest
PYTEST_OPTIONS 	    	:= 
PYTEST_WATCH_OPTIONS	:= --quiet --no-header --no-summary
PIP			:= $(VENV)/bin/pip3


venv:
	$(SYS_PYTHON) -m venv $(VENV)

pip_install:
	$(PIP) install -r requirements.txt

pip_install_editable:
	$(PIP) install --editable .

pip_freeze: 
	$(PIP) freeze --exclude-editable > requirements.txt

pip_upgrade:
	$(PIP) install -r requirements.txt --upgrade
	$(PIP) freeze --exclude-editable > requirements.txt

test:
	@$(PYTEST) $(PYTEST_OPTIONS) tests/

distclean:
	rm -fr $(VENV)
	rm -fr src/*.egg-info

watch:
	fd -t f \.py$$ | entr -c $(PYTEST) $(PYTEST_WATCH_OPTIONS) tests/

init: venv install
install: pip_install pip_install_editable

.PHONY: venv freeze init test distclean install watch update editable all
