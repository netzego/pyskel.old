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

pytest:
	@$(PYTEST) $(PYTEST_OPTIONS) tests/

pytest_watch:
	fd -t f \.py$$ | entr -c $(PYTEST) $(PYTEST_WATCH_OPTIONS) tests/

distclean:
	rm -fr $(VENV)
	rm -fr src/*.egg-info

init: venv install
install: pip_install pip_install_editable
test: pytest

.PHONY: venv pip_install pip_install_editable pip_freeze pip_upgrade pytest pytest_watch \
	distclean init install test
