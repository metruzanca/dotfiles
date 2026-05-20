# Cargo fish integration
if test -f "$HOME/.cargo/env.fish"
    source "$HOME/.cargo/env.fish"
end

if type -q cargo
    # TODO try to see if this works ok on macos/linux. On WSL sccache is being strange.
    # if not grep -q microsoft /proc/version
    #     if not type -q sccache;
    #         cargo install sccache;
    #         set -gx RUSTC_WRAPPER sccache;
    #     end
    # end

    set -gx CARGO_TARGET_DIR "$HOME/.cache/cargo-target"
end
