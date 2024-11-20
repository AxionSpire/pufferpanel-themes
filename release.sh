#! /bin/bash
mkdir -p output
for dir in */; do
    # Skip unwanted folders
    [ "$dir" = ".github/" ] && continue
    [ "$dir" = "output/" ] && continue
    # Skip files in the root directory
    [ ! -d "$dir" ] && continue

    theme_name=$(basename "$dir")

    # Check required files exist
    if [[ -f "$dir/theme.json" ]]; then
        find "$dir" -name "*.png" -o -name "*.jpg" | tar -cf "output/${theme_name}.tar" -C "$dir" theme.css theme.json -T -
        echo "Built $theme_name successfully."
    else
        echo "Skipping $theme_name as a required file is missing."
        fi
    done