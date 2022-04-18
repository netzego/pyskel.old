A skeleton repository for python projects.

---

### USAGE

```bash
# 1.) Renaming
REPO_NAME=new_name
mv src/pyskel src/${REPO_NAME}
fd --type f -x sed -i 's/pyskel/${REPO_NAME}/g'
# 2.) Initialize the repo. This does a couple of things.
# - creates a virtual enviroment directory `.venv`
# - installs all packages
# - installs the repo as a local (editable) module
make init
# 3.) Upgrade to the newest package versions. (Optional)
make pip_upgrade
```

## Packages

- `pytest`
