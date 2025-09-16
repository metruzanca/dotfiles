# If Go is installed, setup golang environment
if test -f $HOME/go/bin

  fish_add_path $HOME/go/bin

  # Install golang apps used in development environemnt if not already installed

  set -l golang_apps; # lists are weird in fish, but this makes it easier to read and append items to the list
  set golang_apps $golang_apps github.com/mfridman/tparse@latest
  set golang_apps $golang_apps mvdan.cc/gofumpt@latest
  set golang_apps $golang_apps github.com/sqlc-dev/sqlc/cmd/sqlc@latest

  for app in $golang_apps
    set -l app_name (basename (string split '@' $app)[1])
    if not type -q $app_name
      go install $app
    end
  end

end
