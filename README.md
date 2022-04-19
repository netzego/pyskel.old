A skeleton repository for python projects.

#### USAGE

```bash
# 1.) Choose a name for your new repository.
REPO_NAME=your_new_repository

# 2.) Clone this repo and change into the directory.
git clone https://github.com/netzego/pyskel.git ${REPO_NAME} && cd ${REPO_NAME}

# 3.) Renaming
mv src/pyskel src/${REPO_NAME}
fd --type f -x sed -i 's/pyskel/${REPO_NAME}/g' {}

# 4.) Initialize the repo. This does a couple of things.
#   - creates a virtual enviroment directory `.venv`
#   - installs all packages
#   - installs the repo as a local (editable) module
# `make init` is an shortcut for:
#   - make venv
#   - make pip_install
#   - make pip_install_editable
make init

# 5.) Upgrade to the newest package versions. (Optional)
make pip_upgrade

# 6.) Set an `author` and `author_email` inside `setup.py`
AUTHOR="Alice A."
EMAIL=mail@domain.tld
sed -i "s/author=\"\"/author=\"${AUTHOR}\"" setup.py
sed -i "s/author_email=\"\"/author_email=\"${EMAIL}\"" setup.py

# 7.) Cleaning rules
make clean
make distclean

# 8.) Testing with pytest
make pytest
make pytest_watch
```

#### PACKAGES

-   `pytest`

#### DEPENDENCIES

-   `python`
-   `make`
-   `fd`
-   `entr`
