function cdir
    argparse 'p' -- $argv or return 1

    if test (count $argv) -eq 0
        cd
        return
    end

    if set -q _flag_p
        mkdir -p $argv
    else
        mkdir $argv
    end
    or return 1

    cd $argv
end
