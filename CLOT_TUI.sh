#!/bin/bash

# Configure GitHub repo
GITHUB_USER="YOURNAME"
REPO="YOURREPO"

while true; do
    # recover issues from repo
    issues=$(curl -s "https://api.github.com/repos/$GITHUB_USER/$REPO/issues")

    # Estract title and number
    issue_list=$(echo "$issues" | jq -r '.[] | "\(.number): \(.title)"' | \
        fzf --prompt="Select issue or press ESC to exit: " --height=20 --border)

    # check for "ESC"
    if [[ -z "$issue_list" ]]; then
        clear
        echo "Exited."
        break
    fi

    # Estract issue number
    issue_number=$(echo "$issue_list" | cut -d':' -f1)

    # Recover issue detail
    detail=$(curl -s "https://api.github.com/repos/$GITHUB_USER/$REPO/issues/$issue_number" | \
        jq -r '"# \(.title)\n\n\(.body)\n\n---"')

    # Save Markdown in the same dir
    md_file="./issue.md"
    echo "$detail" > "$md_file"

    # Show content with glow
    clear
    glow "$md_file"
    echo -e "\nPress [b] to go back"

    # Block every key except 'b'
    while true; do
        read -n1 -s key
        if [[ "$key" == "b" ]]; then
            rm -f "$md_file"
            clear
            break
        fi
    done
done
