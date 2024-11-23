# shellcheck disable=SC2148
handle_error() {
    local CIS_CODE="$1"
    local log_file="log.txt"

    echo "${CIS_CODE}: NOT OK" | tee -a "$log_file"


}

setup_error_trap() {
    trap 'handle_error "${CIS_CODE}"' ERR
}