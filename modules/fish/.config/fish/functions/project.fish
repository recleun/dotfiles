function project
    cd ~/dev/
    set target (fzf)
    cd $target/..
    vim ~/dev/$target
end
