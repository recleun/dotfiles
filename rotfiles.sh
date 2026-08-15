#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
MODULES_DIR="$SCRIPT_DIR/modules"
BUNDLES_DIR="$SCRIPT_DIR/bundles"

usage() {
    echo "Usage:"
    echo "  $0 install <module>"
    echo "  $0 uninstall <module>"
    echo "  $0 install bundle <bundle>"
    echo "  $0 uninstall bundle <bundle>"
    echo "  $0 list"
    echo "  $0 list modules"
    echo "  $0 list bundles"
    echo "  $0 status"
    echo "  $0 status <module>"
}

module_exists() {
    [[ -d "$MODULES_DIR/$1" ]]
}

variants_exists() {
    [[ -d "$MODULES_DIR/$1/variants" ]]
}

variant_exists() {
    [[ -d "$MODULES_DIR/$1/variants/$2" ]]
}

common_exists() {
    [[ -d "$MODULES_DIR/$1/common" ]]
}

install_module() {
    local module="$1"
    local module_dir="$MODULES_DIR/$module"

    if ! module_exists "$module"; then
        echo "Error: module '$module' does not exist."
        return 1
    fi

    echo "==> Installing $module"

    if [[ -x "$module_dir/dependencies.sh" ]]; then
        echo "==> Installing dependencies for $module"
        "$module_dir/dependencies.sh"
    fi

    echo "==> Linking $module"
    stow \
        --dir="$MODULES_DIR" \
        --target="$HOME" \
        --ignore="^(dependencies\.sh|unlink\.sh)$" \
        "$module"

    echo "==> $module installed"
}

uninstall_module() {
    local module="$1"
    local module_dir="$MODULES_DIR/$module"

    if ! module_exists "$module"; then
        echo "Error: module '$module' does not exist."
        return 1
    fi

    echo "==> Unlinking $module"

    stow \
        --dir="$MODULES_DIR" \
        --target="$HOME" \
        --delete \
        "$module"

    if [[ -x "$module_dir/unlink.sh" ]]; then
        echo "==> Running cleanup for $module"
        "$module_dir/unlink.sh"
    fi

    echo "==> $module uninstalled"
}

install_variant() {
    local module="$1"
    local variant="$2"
    local module_dir="$MODULES_DIR/$module"

    if ! module_exists "$module"; then
        echo "Error: module '$module' does not exist."
        return 1
    fi

    if ! common_exists "$module"; then
        echo "Error: common directory for '$module' does not exist."
        return 1
    fi

    if ! variant_exists "$module" "$variant"; then
        echo "Error: variant '$variant' doesn't exist for '$module' does not exist."
        return 1
    fi

    echo "==> Installing $module ($variant variant)"

    if [[ -x "$module_dir/dependencies.sh" ]]; then
        echo "==> Installing dependencies for $module"
        "$module_dir/dependencies.sh"
    fi

    echo "==> Linking common directory of $module"
    stow \
        --dir="$module_dir" \
        --target="$HOME" \
        "common"

    echo "==> Linking $variant variant of $module"
    stow \
        --dir="$module_dir/variants" \
        --target="$HOME" \
        "$variant"

    echo "==> $module installed ($variant variant)"
}

install_bundle() {
    local bundle="$1"
    local bundle_file="$BUNDLES_DIR/$bundle"

    if [[ ! -f "$bundle_file" ]]; then
        echo "Error: bundle '$bundle' does not exist."
        return 1
    fi

    while IFS= read -r module || [[ -n "$module" ]]; do
        [[ -z "$module" || "$module" == \#* ]] && continue

        install_module "$module"
    done < "$bundle_file"
}

uninstall_bundle() {
    local bundle="$1"
    local bundle_file="$BUNDLES_DIR/$bundle"

    if [[ ! -f "$bundle_file" ]]; then
        echo "Error: bundle '$bundle' does not exist."
        return 1
    fi

    while IFS= read -r module || [[ -n "$module" ]]; do
        [[ -z "$module" || "$module" == \#* ]] && continue

        uninstall_module "$module"
    done < "$bundle_file"
}

list_modules() {
    echo "Modules:"

    if [[ -z "$(ls -A $MODULES_DIR)" ]]; then
        echo "  No modules found."
        exit 1
    fi

    for module_dir in "$MODULES_DIR"/*/; do
        [[ -d "$module_dir" ]] || continue

        module="$(basename "$module_dir")"
        echo "  $module"
    done
}

list_bundles() {
    echo "Bundles:"

    if [[ -z "$(ls -A $BUNDLES_DIR)" ]]; then
        echo "  No bundles found."
        exit 1
    fi

    for bundle_file in "$BUNDLES_DIR"/*; do
        [[ -f "$bundle_file" ]] || continue

        bundle="$(basename "$bundle_file")"
        echo "  $bundle"
    done
}

module_status() {
    local module="$1"
    local module_dir="$MODULES_DIR/$module"

    local total=0
    local linked=0

    while IFS= read -r -d '' source; do
        local relative="${source#"$module_dir"/}"
        local target="$HOME/$relative"

        ((++total))

        if [[ -e "$target" ]]; then
            if [[ "$(realpath "$source")" == "$(realpath "$target")" ]]; then
                ((++linked))
            fi
        fi

    done < <(
        find "$module_dir" \
            -type f \
            ! -name 'dependencies.sh' \
            ! -name 'unlink.sh' \
            -print0
    )

    if (( total == linked )); then
        echo "installed"
    elif (( linked == 0 )); then
        echo "not installed"
    else
        echo "partially installed"
    fi
}

list_status() {
    echo "Modules:"

    for module_dir in "$MODULES_DIR"/*/; do
        local module="$(basename "$module_dir")"

        printf "  %-20s %s\n" \
            "$module" \
            "$(module_status "$module")"
    done
}

if [[ $# -eq 0 ]]; then
    usage
    exit 1
fi

case "$1" in
    install)
        if [[ "$2" == "bundle" ]]; then
            [[ -n "$3" ]] || {
                echo "Error: missing bundle name."
                exit 1
            }

            install_bundle "$3"
        else
            [[ -n "$2" ]] || {
                echo "Error: missing module name."
                exit 1
            }

            install_module "$2"
        fi
        ;;

    uninstall)
        if [[ "$2" == "bundle" ]]; then
            [[ -n "$3" ]] || {
                echo "Error: missing bundle name."
                exit 1
            }

            uninstall_bundle "$3"
        else
            [[ -n "$2" ]] || {
                echo "Error: missing module name."
                exit 1
            }

            uninstall_module "$2"
        fi
        ;;

    status)
        if [[ -n "$2" ]] && module_exists "$2"; then
            echo "Module:"
            printf "  %-20s %s\n" \
                "$2" \
                "$(module_status "$2")"
        else
            list_status
        fi
        ;;

    list)
        case "$2" in
            modules)
                list_modules
                ;;
            module)
                list_modules
                ;;

            bundles)
                list_bundles
                ;;
            bundle)
                list_bundles
                ;;

            "")
                list_modules
                echo
                list_bundles
                ;;

            *)
                echo "Error: unknown list target '$2'"
                echo "Usage: $0 list [modules|bundles]"
                exit 1
                ;;
        esac
        ;;

    *)
        usage
        exit 1
        ;;
esac

