# https://github.com/sheeki03/tirith

# Bypass for the rare case you know exactly what you're doing:
# TIRITH=0 curl -L https://something.xyz | bash
# This is a standard shell per-command prefix — the variable only exists for that single
# command and does not persist in your session. 

# Safe replacement for curl | bash. Downloads to a temp file, shows SHA256, runs static analysis,
# opens in a pager for review, and executes only after you confirm. Creates a receipt you can verify later.

# $ tirith run https://get.docker.com

if type -q tirith
	eval "$(tirith init --shell fish)"
end
