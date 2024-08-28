#!/usr/bin/env fish

function pull-all 
    for dir in *
        if test -d $dir && test -d "$dir/.git"
            echo "Pulling latest changes for --- $dir ---"
            cd $dir
            if git ls-files --others --exclude-standard;
                git pull --rebase
            else
                echo (git ls-files --others --exclude-standard)
                echo (set_color red) "Repo in $dir is dirty and needs a commit first" (set_color normal)
            end
            cd ..
        end
    end
end