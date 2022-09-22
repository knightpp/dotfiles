
function fzfpac
    argparse h/help i/install r/remove -- $argv
    or return

    if set -q _flag_help
        echo "fzfpac [-h|--help] [-i|--install] [-r|--remove] [ARGUMENT ...]"
        return 0
    end

    if set -q _flag_install
        set packages (pacman -Slq"$argv" | fzf --multi --preview='pacman -Si {}')
        if test $status -eq 0
            sudo pacman -Syu "$packages"
        end
    else if set -q _flag_remove
        set packages (pacman -Qq"$argv" | fzf --multi --preview='pacman -Qi {}')
        if test $status -eq 0
            sudo pacman -Rs "$packages"
        end
    end
end
