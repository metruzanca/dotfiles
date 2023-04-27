#!/usr/bin/env bash

# If no venv, create one
alias venv-create='[[ ! -d .venv ]] && python3 -m venv .venv && source .venv/bin/activate'
# if venv, activate it
alias venv-activate='[[ -d .venv ]] && source .venv/bin/activate'
# If we're in a venv, install requirements
alias venv-install='[ -n "$VIRTUAL_ENV" ] && pip install -r requirements.txt'
# Convenience alias
alias pm='python3 manage.py'
