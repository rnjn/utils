# chotu 🛠️
chotu helps me automate some of my daily tasks. It is a collection of fish scripts that I use to help me do my repeated work faster. 

## Activities 
scripts are classified by activity. Each subcommand is a fish file that collects functions related to that activity, for example, `work.fish` contains functions related to work. and you as `chotu` to run the scripts as `chotu work start`.

### work
fish script to start resource hungry and work-only services on my home computer. It starts the following -
- Docker.app
- Minikube
- Visual Studio Code
- (Optional) Specified Docker containers

### git
fish script to automate git commands. It contains functions to -
- attempts to run `git pull --rebase` on all subfolders of the current folder

## Installation

1. Clone this repository
2. Link `chotu.fish` to your favourite alias file in `~/.local/bin` (or wherever you keep fish executable scripts) and add the path to the directory to the fish path.:
   ```
   ln -s path/to/chotu.fish ~/.local/bin/chotu
   set -U fish_user_paths ~/.local/bin $fish_user_paths
   ```
3. Link `lib` folder to the same directory:
   ```
   ln -s path/to/lib ~/.local/bin/lib
   ```
3. Make the script executable:
   ```
   chmod +x path/to/chotu.fish
   ```
4. Run `chotu` or your preferred alias to test.

### Usage

To run work related commands:
``` 
chotu work start
```
To stop services:
```
chotu work stop
```




