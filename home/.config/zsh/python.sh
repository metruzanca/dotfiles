#!/usr/bin/env bash

alias pm="python3 manage.py"

# Python Related
venv-install() {
    deactivate &> /dev/null
    # if no virtual environment exists, create one
    if [[ ! -d .venv ]]; then
        python3 -m venv .venv
    fi
    # activate the virtual environment
    source .venv/bin/activate
    # install the requirements
    pip install -r requirements.txt
}

# Venv is super inconsistent for some reason. sigh.

venv() {
    # Deactivate the venv if the cwd is not a subdirectory of the venv
    # if [ -v "$VIRTUAL_ENV" ]; then
    #     prefix=$(dirname "$VIRTUAL_ENV");
    #     echo "$(pwd) $prefix";
    #     if [[ "$(pwd)" != "$prefix"* ]]; then
    #         deactivate &> /dev/null
    #     fi
    # fi
    # check if a .venv directory exists
    if [[ -d .venv ]]; then
        source .venv/bin/activate 
    fi
}

cd() {
    # do everything normal `cd` does
    builtin cd "$@" || return 
    # list the contents of the directory
    ls;
    # activate the virtual environment if it exists
    venv;
}

venv;
