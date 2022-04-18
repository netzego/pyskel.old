A skeleton repository for python projects.

---

## USAGE

```bash
# 1.) Choose a name for your new repository.
REPO_NAME=your_new_repository_name

# 2.) Clone this repo and change into the directory.
git clone https://github.com/netzego/pyskel.git ${REPO_NAME} && cd ${REPO_NAME}

# 3.) Renaming
mv src/pyskel src/${REPO_NAME}
fd --type f -x sed -i 's/pyskel/${REPO_NAME}/g'

# 4.) Initialize the repo. This does a couple of things.
#     - creates a virtual enviroment directory `.venv`
#     - installs all packages
#     - installs the repo as a local (editable) module
make init

# 5.) Upgrade to the newest package versions. (Optional)
make pip_upgrade

# 6.) Check out all the rules defined in the Makefile. (Optional)
# ...
```

## PACKAGES

- `pytest`
