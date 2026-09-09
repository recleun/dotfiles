function git
    if test "$argv[1]" = clone; and string match -rq '^[^/]+/[^/]+$' -- $argv[2]
        set -l repo $argv[2]
        command git clone "https://github.com/$repo.git" $argv[3..-1]
    else
        command git $argv
    end
end
