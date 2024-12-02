# shellcheck disable=SC2148

check_root() {
    uuid=$(id -u)
    if [ "${uuid}" -ne 0 ]; then
        echo "This script must be run as root. Exiting..." >&2
        exit 1
    fi
}
