# Just git commands
git config --global alias.rename 'branch -m --';
git config --global alias.current "rev-parse --abbrev-ref HEAD";
git config --global alias.undo "reset HEAD~1 --mixed";
git config --global alias.initial "git add . && git commit -m \"Initial Commit.\"";
# Git Add Commit
git config --global alias.ac "!sh git add . && git commit -m $1";

# See https://github.com/metruzanca/git-scripts
# Uses bash scripts
# git config --global alias.co "!sh $PWD/bin/checkout.sh";
# git config --global alias.identity "!node $PWD/bin/identity.js";
# git config --global alias.initial "!sh $PWD/bin/initial.sh";
# git config --global alias.master "!sh $PWD/bin/master.sh";
# git config --global alias.new "!sh $PWD/bin/new.sh";
# git config --global alias.pr "!node $PWD/bin/pr.js";
# git config --global alias.pub "!sh $PWD/bin/publish.sh";
# git config --global alias.sync "!sh $PWD/bin/sync.sh";

# SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# if [[ ! -f "$SCRIPT_DIR/identities.json" ]]; then
#   node ./lib/identities.js
# fi