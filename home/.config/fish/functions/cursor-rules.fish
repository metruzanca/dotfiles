if type -q cursor
  function cursor-rules
		set -l target $HOME/.cursorrules.mdc
		set -l link ./.cursor/rules/main.mdc
		# Ensure the directory exists
		mkdir -p ./.cursor/rules
		# Remove existing symlink or file
		if test -e $link
			rm $link
		end
		ln -s $target $link
	end
end
