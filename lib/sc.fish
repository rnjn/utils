#!/usr/bin/env fish

function pull-all 
    for dir in *
        if test -d $dir && test -d "$dir/.git"
            echo "Pulling latest changes for --- $dir ---"
            cd $dir
            if git diff-index --quiet HEAD --;
                git pull --rebase
            else
                echo (set_color red) "Repo in $dir is dirty and needs a commit first" (set_color normal)
            end
            cd ..
        end
    end
end