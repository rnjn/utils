# utils

## start-work
fish script to start resource hungry and work-only services on my home computer. It starts the following -
- Docker.app
- Minikube
- Visual Studio Code
- (Optional) Specified Docker containers

### Installation

1. Clone this repository or download the `start-work.fish` script.
2. Make the script executable:
   ```
   chmod +x path/to/start-work.fish
   ```
3. Move the script to a directory in your PATH, for example:
   ```
   mv path/to/start-work.fish /usr/local/bin/start-work
   ```

### Usage

To start services:
``` 
start-work start
```
To stop services:
```
start-work stop
```




