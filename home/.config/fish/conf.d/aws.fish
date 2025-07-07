# AWS Cli has no way to get the profile from the command line, so we use grep to extract it from the config file.
if test -f ~/.aws/config
    set -x AWS_PROFILE (grep -E '^\[profile |^\[default\]' ~/.aws/config | sed 's/^\[profile //;s/^\[default\]/default/;s/\]$//')
end
