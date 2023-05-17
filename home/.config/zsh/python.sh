#!/usr/bin/env bash

alias venv-create='python3 -m venv .venv && source .venv/bin/activate'
alias venv='source .venv/bin/activate'
# I want to prevent installing globally so I'm checking if the virtual environment is active
alias venv-install='[ -n "$VIRTUAL_ENV" ] && pip install -r requirements.txt'
# Convenience alias
alias pm='python3 manage.py'
