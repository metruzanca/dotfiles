# If this system has rust installed, setup my rust environment how I like it.

if type -q cargo;
    # Cargo fish integration
    if test -f "$HOME/.cargo/env.fish"
        source "$HOME/.cargo/env.fish"
    end

    # If build cache not installed, install it
    if not type -q sccache;
        cargo install sccache;
    end

    # Set rustc to use build cache
    set -gx RUSTC_WRAPPER sccache;

end
