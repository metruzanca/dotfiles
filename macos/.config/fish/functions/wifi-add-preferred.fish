function wifi-add-preferred --description 'Add a macOS preferred Wi-Fi network from Proton Pass'
    set -l vault nix

    if not command -q pass-cli
        echo "wifi-add-preferred: pass-cli is not installed (rebuild first: make switch)" >&2
        return 1
    end

    if not command -q networksetup
        echo "wifi-add-preferred: networksetup is not available" >&2
        return 1
    end

    if not pass-cli info >/dev/null 2>&1
        echo "wifi-add-preferred: no Proton Pass session — run 'make pass-login' once" >&2
        return 1
    end

    # Query Wi-Fi items from Proton Pass instead of hardcoding titles.
    set -l items (pass-cli item list --vault-name "$vault" --filter-type wifi 2>/dev/null | string match -rg '\]: (.+) \(state=')

    set -l interface (networksetup -listallhardwareports | awk '/Hardware Port: Wi-Fi/{getline; sub("Device: ", ""); print}')
    if test -z "$interface"
        echo "wifi-add-preferred: could not find the Wi-Fi interface" >&2
        return 1
    end

    set -l index 0
    set -l failed 0
    # Proton Pass exposes the Wi-Fi template fields as `ssid` and `password`.
    for item in $items
        set -l ssid (pass-cli item view --vault-name "$vault" --item-title "$item" --field ssid 2>/dev/null | string collect)
        set -l password (pass-cli item view --vault-name "$vault" --item-title "$item" --field password 2>/dev/null | string collect)
        if test -z "$ssid"; or test -z "$password"
            echo "wifi-add-preferred: could not retrieve credentials for $item" >&2
            set failed 1
            continue
        end

        if networksetup -addpreferredwirelessnetworkatindex "$interface" "$ssid" $index WPA2 "$password" >/dev/null
            echo "wifi-add-preferred: added $ssid to the preferred network list"
            set index (math $index + 1)
        else
            echo "wifi-add-preferred: failed to add $ssid to the preferred network list" >&2
            set failed 1
        end
    end

    return $failed
end
