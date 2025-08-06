# clot_tui
a TUI interface to [CLOT site](https://no-cqrt.github.io/clot/) (but also for any Github Repo)

A simple script in **bash** that recover le issue list from a repo and navigate/search in it.
the issue is temporary dowloaded in markdown and rendered with **glow**

## Requirements:

- bash (for the script)
- curl (grab the data)
- jq (read the JSON)
- fzf (fuzzy search)
- glow (render markdown)

## Instructions:

- Be sure to install required packages (largely available for any distro/system)
- Dowload the script in your favourite directory
- Edit the file and change `GITHUB_USER="YOURNAME"` and `REPO="YOURREPO"` with the target repo
- Save the script ant make it executable
```
chmod +x CLOT_TUI.sh
```  
- Run it, enjoy! 
```
./CLOT_TUI.sh
```  
>[!WARNING]
>This sofware is provided "as is", and just for fun
>Feel free to suggest and improve new features
