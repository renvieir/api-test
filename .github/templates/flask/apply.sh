#!/usr/bin/env bash
echo "Creating a flask application"

# Add requirements
if [ ! -f pyproject.toml ]
then
    cat .github/templates/flask/requirements.txt >> requirements.txt
    cat .github/templates/flask/requirements-test.txt >> requirements-test.txt
else
    for item in $(cat .github/templates/flask/requirements.txt)
    do
        poetry add "${item}"
    done
    for item in $(cat .github/templates/flask/requirements-test.txt)
    do
        poetry add --dev "${item}"
    done
fi

# Move module files
rm -rf api_test
rm -rf tests
cp -R .github/templates/flask/module api_test
cp -R .github/templates/flask/tests tests

cp .github/templates/flask/README.md README.md
cp .github/templates/flask/wsgi.py wsgi.py
cp .github/templates/flask/.env .env
cp .github/templates/flask/settings.toml settings.toml

# install
make clean

if [ ! -f pyproject.toml ]
then
    make virtualenv
    make install
    echo "Applied Flask template"
    echo "Ensure you activate your env with 'source .venv/bin/activate'"
    echo "then run api_test or python -m api_test"
else
    poetry install
    echo "Applied Flask template"
    echo "Ensure you activate your env with 'poetry shell'"
    echo "then run api_test or python -m api_test or poetry run api_test"
fi
