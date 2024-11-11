function dev
    cd ~/dev/"$argv"
end

complete -f -c dev -a "(find ~/dev/ -maxdepth 3 -type d -printf \"%h/%f\n\" | cut -d/ -f5-)"
