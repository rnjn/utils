#!/usr/bin/env fish

function start_services
    set -l start_containers false
    set -l containers

    # Parse arguments
    for arg in $argv
        switch $arg
            case --containers
                set start_containers true
            case "*"
                set -a containers $arg
        end
    end

    echo "Starting Docker.app..."
    open -a Docker

    # Wait for Docker to be ready
    while not docker info >/dev/null 2>&1
        echo "Waiting for Docker to start..."
        sleep 5
    end

    echo "Starting Minikube..."
    minikube start

    # Start specified containers only if --containers flag is used
    if test $start_containers = true
        for container in $containers
            echo "Starting container: $container"
            docker start $container
        end
    end

    echo "Starting Visual Studio Code..."
    open -a "Visual Studio Code"

    echo "All services started successfully."
end

function stop_services
    echo "Stopping all running Docker containers..."
    docker stop (docker ps -q)

    echo "Stopping Minikube..."
    minikube stop

    echo "Quitting Docker.app..."
    osascript -e 'quit app "Docker"'

    echo "Quitting Visual Studio Code..."
    osascript -e 'quit app "Visual Studio Code"'

    echo "All services stopped successfully."
end

# Main script logic
switch $argv[1]
    case start
        start_services $argv[2..-1]
    case stop
        stop_services
    case "*"
        echo "Usage: "(status filename)" {start|stop} [--containers container1 container2 ...]"
        echo "  start: Start Docker, Minikube, and VS Code (containers optional)"
        echo "  stop: Stop all running containers, Minikube, Docker, and VS Code"
        echo "  --containers: Flag to start specific containers (only with 'start')"
        exit 1
end
