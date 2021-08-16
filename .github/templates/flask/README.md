# api_test Flask Application

This is a Flask application.

## Installation

From source:

```bash
git clone https://github.com/renvieir/api-test api_test
cd api_test
make install
```

From pypi:

```bash
pip install api_test
```

## Executing

This application has a CLI interface that extends the Flask CLI.

Just run:

```bash
$ api_test
```

or

```bash
$ python -m api_test
```

To see the help message and usage instructions.

## First run

```bash
api_test create-db   # run once
api_test populate-db  # run once (optional)
api_test add-user -u admin -p 1234  # ads a user
api_test run
```

Go to:

- Website: http://localhost:5000
- Admin: http://localhost:5000/admin/
  - user: admin, senha: 1234
- API GET:
  - https://localhost:5000/api/v1/product/
  - https://localhost:5000/api/v1/product/1
  - https://localhost:5000/api/v1/product/2
  - https://localhost:5000/api/v1/product/3


> **Note**: You can also use `flask run` to run the application.
