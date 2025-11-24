# Loosely check if Go is installed 
if test -d $HOME/go/bin
  fish_add_path $HOME/go/bin

  # Setup golang environment

  ## Install golang apps used in development environemnt
  
  # lists are weird in fish, but this makes it easier to read and append items to the list
  # I also don't like ending lines in "\"
  set -l golang_apps;
  set golang_apps $golang_apps github.com/mfridman/tparse@latest
  set golang_apps $golang_apps mvdan.cc/gofumpt@latest
  set golang_apps $golang_apps github.com/sqlc-dev/sqlc/cmd/sqlc@latest

  for app in $golang_apps
    set -l app_name (basename (string split '@' $app)[1])
    if not type -q $app_name
      go install $app
    end
  end

  # Golang abbreviations
  abbr got "CI=\"true\" go test -v ./... -json | tparse -all"
  abbr gog "go generate ./..."
end
