#!/bin/bash

paths_dir="${DOTFILES_DIR}/paths"

default_paths=(
    /usr/local/sbin
    /usr/local/bin
    /usr/sbin
    /usr/bin
    /sbin
    /bin
)

paths=""

function prepend_path() {
    local path="${1}"

    # Test if dir exists, contains executable and not already in path
    if [ -n "${path}" -a -d "${path}" ] && dir_has_executables "${path}" && ! echo "${paths}" | grep -oE '[^:]+' | grep -q "^${path}\$"; then
        paths="${path}:${paths}"
    fi
}

# default POSIX paths
for path in $(reverse_args ${default_paths[@]}); do
    prepend_path "${path}"
done

# prepend current PATH in reverse order (to maintain original order)
for path in $(reverse_args $(echo "${PATH}" | grep -oE '[^:]+')); do
    prepend_path "${path}"
done

# prepend custom PATH in reverse order (to maintain original order)
if [ -d "${paths_dir}" ]; then
    for gen in $(ls -1r "${paths_dir}"/*); do
        path=$(cat_or_exec "${gen}")
        for p in $path; do
            prepend_path "$p"
        done
    done
fi

# See http://stackoverflow.com/questions/11532157/unix-removing-duplicate-lines-without-sorting
echo $paths | grep -oE '[^:]+' | awk ' !x[$0]++'

