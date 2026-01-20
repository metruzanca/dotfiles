# Loosely check if Go is installed 
if test -d $HOME/go/bin
  fish_add_path $HOME/go/bin

  ## Install golang apps used in development environemnt
  set -l golang_apps;

  # If app is not installed, add it to the queue to be installed
  function add_golang_app
    set -l app $argv[1]
    set -l app_name (basename (string split '@' $app)[1])
    if not type -q $app_name
      set golang_apps $golang_apps $app
    end
  end

  # go test output formatter
  add_golang_app github.com/mfridman/tparse@latest
  # better go formatter
  add_golang_app mvdan.cc/gofumpt@latest
  # sqlc code generator
  add_golang_app github.com/sqlc-dev/sqlc/cmd/sqlc@latest

  if test (count $golang_apps) -gt 0
    gum log "Installing golang tools: $golang_apps"
  end

  for app in $golang_apps
    set -l app_name (basename (string split '@' $app)[1])
    if not type -q $app_name
      go install $app
    end
  end

  # Golang abbreviations
  abbr gotest "CI=\"true\" go test -v ./... -json | tparse -all"
  abbr gogen "go generate ./..."
end
