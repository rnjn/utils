#!/usr/bin/env fish

# Define the path to the directory containing the fish files
source (dirname (status -f))/lib/work.fish
source (dirname (status -f))/lib/sc.fish

# Check if the first argument is provided
if test -z $argv[1]
    echo "Usage: chotu <subcommand> <action>"
    exit 1
end

# Define the subcommand and action
set subcommand $argv[1]
set action $argv[2]

# Define the fish file based on the subcommand and action
switch $subcommand
    case "work"
        switch $action
            case "start"
                start_services
            case "stop"
                stop_services
            case "*"
                echo "Invalid action: $action"
                exit 1
        end
    case "sc"
        switch $action
            case "pull-all"
                pull-all
            case "*"
                echo "Invalid action: $action"
                exit 1
        end
    case "*"
        echo "Invalid subcommand: $subcommand"
        exit 1
end

# Check if the fish file exists
if test -f $fish_file
    # Execute the fish file
    source $fish_file
else
    echo "Fish file not found: $fish_file"
    exit 1
end