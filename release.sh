#! /bin/bash
mkdir -p build
for dir in */; do
    # Skip unwanted folders
    [ "$dir" = ".github/" ] && continue
    [ "$dir" = "build/" ] && continue
    # Skip files in the root directory
    [ ! -d "$dir" ] && continue

    theme_name=$(basename "$dir")

    # Check required files exist
    if [[ -f "$dir/theme.json" ]]; then
        tar -cf "build/${theme_name}.tar" -C "$dir" theme.css theme.json img/
        echo "Built $theme_name successfully."
    else
        echo "Skipping $theme_name as a required file is missing."
        fi
    done