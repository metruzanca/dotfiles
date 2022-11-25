
export isWSL="$(grep microsoft /proc/version)"

if [[ ${isWSL} ]]; then
  export BROWSER="explorer.exe";

  # https://superuser.com/questions/1602401/vscode-terminal-behaves-strangely-when-opening-a-project-that-is-inside-wsl2
  fix_wsl2_interop() {
      for i in $(pstree -np -s $$ | grep -o -E '[0-9]+'); do
          if [[ -e "/run/WSL/${i}_interop" ]]; then
              export WSL_INTEROP=/run/WSL/${i}_interop
          fi
      done
  }

  fix_wsl2_interop
fi


