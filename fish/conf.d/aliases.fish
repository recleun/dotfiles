function vim
    nvim $argv
end

function gs
    git status
end

function gc
    git commit $argv
end

function gl
    git log --oneline
end
