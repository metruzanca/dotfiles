# NixOS PATH setup. Linked from the `linux/` stow package.
# NixOS prepends /run/wrappers/bin so its setuid/file-capability wrappers win
# over the unprivileged copies in the system profile. Launchers that rebuild
# PATH (herdr does) hoist /run/current-system/sw/bin ahead of it, which shadows
# them: rootless podman then resolves the plain store newuidmap and fails with
# "write to uid_map failed: Operation not permitted". Restore the intended
# order, dropping the duplicate entry.
if test -d /run/wrappers/bin
    set -gx PATH /run/wrappers/bin (string match -v /run/wrappers/bin $PATH)
end
