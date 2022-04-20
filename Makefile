WORKDIR			:= .
VENV   			:= .venv
PYTHON 		     	:= $(VENV)/bin/python3
SYS_PYTHON		:= $(shell which python)
PYTEST 		     	:= $(VENV)/bin/pytest
PYTEST_OPTIONS 	    	:= 
PYTEST_WATCH_OPTIONS	:= --quiet --no-header --no-summary
PIP			:= $(VENV)/bin/pip3

venv:
	$(SYS_PYTHON) -m venv $(VENV)

pip_first_install:
	$(PIP) install --editable $(WORKDIR)[dev]
	$(PIP) freeze --exclude-editable > requirements.txt

pip_install:
	$(PIP) install -r requirements.txt --editable $(WORKDIR)[dev]

pip_freeze: 
	$(PIP) freeze --exclude-editable > requirements.txt

pip_upgrade:
	$(PIP) install -r requirements.txt --upgrade --editable $(WORKDIR)[dev]
	$(PIP) freeze --exclude-editable > requirements.txt

pytest:
	@$(PYTEST) $(PYTEST_OPTIONS) tests/

pytest_watch:
	fd -t f \.py$$ | entr -c $(PYTEST) $(PYTEST_WATCH_OPTIONS) tests/

clean:
	rm -fr **/__pycache__
	rm -fr **/.pytest_cache

distclean: clean
	rm -fr $(VENV)
	rm -fr src/*.egg-info

init: venv pip_first_install
install: pip_install
test: pytest
watch: pytest_watch

.PHONY: venv pip_install pip_install_editable pip_freeze pip_upgrade pytest pytest_watch \
	clean distclean init install test
