if [ -x "$(command -v espanso)" ]; then 
  stow home;
  
  stow private;
else
  echo "GNU stow not installed".
fi

if [ -x "$(command -v espanso)" ]; then 
  espanso restart
fi
