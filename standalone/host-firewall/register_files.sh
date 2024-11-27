#!/usr/bin/env bash

set -euo pipefail

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

CIS_CODE="4.2.3"

setup() {
    echo -e "\n- Start remediation - logfiles have appropriate permissions and ownership"

    find /var/log -type f | while read -r fname; do
        bname="$(basename "$fname")"

        case "$bname" in
        lastlog | lastlog.* | wtmp | wtmp.* | btmp | btmp.*)
            if ! stat -Lc "%a" "$fname" | grep -Pq -- '^\h*[0,2,4,6][0,2,4,6][0,4]\h*$'; then
                echo "- changing mode on \"$fname\""
                chmod ug-x,o-wx "$fname"
            fi
            if ! stat -Lc "%U" "$fname" | grep -Pq -- '^\h*root\h*$'; then
                echo "- changing owner on \"$fname\""
                chown root "$fname"
            fi
            if ! stat -Lc "%G" "$fname" | grep -Pq -- '^\h*(utmp|root)\h*$'; then
                echo "- changing group on \"$fname\""
                chgrp root "$fname"
            fi
            ;;
        secure | auth.log)
            if ! stat -Lc "%a" "$fname" | grep -Pq -- '^\h*[0,2,4,6][0,4]0\h*$'; then
                echo "- changing mode on \"$fname\""
                chmod u-x,g-wx,o-rwx "$fname"
            fi
            if ! stat -Lc "%U" "$fname" | grep -Pq -- '^\h*(syslog|root)\h*$'; then
                echo "- changing owner on \"$fname\""
                chown root "$fname"
            fi
            if ! stat -Lc "%G" "$fname" | grep -Pq -- '^\h*(adm|root)\h*$'; then
                echo "- changing group on \"$fname\""
                chgrp root "$fname"
            fi
            ;;
        SSSD | sssd)
            if ! stat -Lc "%a" "$fname" | grep -Pq -- '^\h*[0,2,4,6][0,2,4,6]0\h*$'; then
                echo "- changing mode on \"$fname\""
                chmod ug-x,o-rwx "$fname"
            fi
            if ! stat -Lc "%U" "$fname" | grep -Piq -- '^\h*(SSSD|root)\h*$'; then
                echo "- changing owner on \"$fname\""
                chown root "$fname"
            fi
            if ! stat -Lc "%G" "$fname" | grep -Piq -- '^\h*(SSSD|root)\h*$'; then
                echo "- changing group on \"$fname\""
                chgrp root "$fname"
            fi
            ;;
        gdm | gdm3)
            if ! stat -Lc "%a" "$fname" | grep -Pq -- '^\h*[0,2,4,6][0,2,4,6]0\h*$'; then
                echo "- changing mode on \"$fname\""
                chmod ug-x,o-rwx "$fname"
            fi
            if ! stat -Lc "%U" "$fname" | grep -Pq -- '^\h*root\h*$'; then
                echo "- changing owner on \"$fname\""
                chown root "$fname"
            fi
            if ! stat -Lc "%G" "$fname" | grep -Pq -- '^\h*(gdm3?|root)\h*$'; then
                echo "- changing group on \"$fname\""
                chgrp root "$fname"
            fi
            ;;
        *.journal)
            if ! stat -Lc "%a" "$fname" | grep -Pq -- '^\h*[0,2,4,6][0,4]0\h*$'; then
                echo "- changing mode on \"$fname\""
                chmod u-x,g-wx,o-rwx "$fname"
            fi
            if ! stat -Lc "%U" "$fname" | grep -Pq -- '^\h*root\h*$'; then
                echo "- changing owner on \"$fname\""
                chown root "$fname"
            fi
            if ! stat -Lc "%G" "$fname" | grep -Pq -- '^\h*(systemdjournal|root)\h*$'; then
                echo "- changing group on \"$fname\""
                chgrp root "$fname"
            fi
            ;;
        *)
            if ! stat -Lc "%a" "$fname" | grep -Pq -- '^\h*[0,2,4,6][0,4]0\h*$'; then
                echo "- changing mode on \"$fname\""
                chmod u-x,g-wx,o-rwx "$fname"
            fi
            if ! stat -Lc "%U" "$fname" | grep -Pq -- '^\h*(syslog|root)\h*$'; then
                echo "- changing owner on \"$fname\""
                chown root "$fname"
            fi
            if ! stat -Lc "%G" "$fname" | grep -Pq -- '^\h*(adm|root)\h*$'; then
                echo "- changing group on \"$fname\""
                chgrp root "$fname"
            fi
            ;;
        esac
    done

    echo -e "- End remediation - logfiles have appropriate permissions and ownership\n"

}

main() {
    check_root
    setup

}
main
