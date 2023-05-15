# Bash Cheat-sheet

I'm constantly looking this shit up so here it is once and for all:

## Check if variable is defined
```bash
if [ -v var ]; then
  echo "Variable is defined"
fi
```

## Check if variable is not defined
```bash
if [ -z "$var" ]; then
  echo "Variable is not defined or is set to an empty string"
fi
```

## Default values
```bash
# When using a variable
echo $var_name
echo ${var_name:-"default value"}
```
