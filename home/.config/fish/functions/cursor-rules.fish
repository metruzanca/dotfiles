if type -q cursor
  function cursor-rules
		# Ensure the directory exists
		mkdir -p ./.cursor/rules

		# Symlink all files from $HOME/.config/cursor/rules/ into ./.cursor/rules/
		for file in $HOME/.config/cursor/rules/*
			set -l filename (basename $file)
			set -l link ./.cursor/rules/$filename
			# Remove existing symlink or file
			if test -e $link
				rm $link
			end
			ln -s $file $link
		end

	end
end
