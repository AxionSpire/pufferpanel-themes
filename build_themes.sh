#! /bin/bash
mkdir -p output
echo "Building themes..."
for dir in */; do
    # Skip unwanted folders
    [ "$dir" = ".github/" ] && continue
    [ "$dir" = "output/" ] && continue
    # Skip files in the root directory
    [ ! -d "$dir" ] && continue

    theme_name=$(basename "$dir")

    # Check required files exist
    if [[ -f "$dir/theme.json" && -f "$dir/theme.css" ]]; then
        if [[ -d "$dir/img" ]]; then
            tar -cf "output/${theme_name}.tar" -C "$dir" theme.css theme.json img/
        else
            tar -cf "output/${theme_name}.tar" -C "$dir" theme.css theme.json
        fi
        echo "Built $theme_name successfully."
    else
        echo "Skipping $theme_name as one or more required files are missing."
        fi
    done