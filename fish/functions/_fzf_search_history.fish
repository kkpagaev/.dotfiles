function _fzf_search_history --description "Search command history. Replace the command line with the selected command."
    # history merge incorporates history changes from other fish sessions
    # it errors out if called in private mode
    if test -z "$fish_private_mode"
        builtin history merge
    end

    if not set --query fzf_history_time_format
        # Reference https://devhints.io/strftime to understand strftime format symbols
        set -f fzf_history_time_format "%m-%d %H:%M:%S"
    end

    # Delinate commands throughout pipeline using null rather than newlines because commands can be multi-line
    set -f commands_selected (
        set prompt $(commandline -b | head -n 1)
        switch $prompt
          case "cu*" 
          builtin history --null -p "curl" |
            _fzf_wrapper --read0 \
                --print0 \
                --multi \
                --scheme=history \
                --prompt="CURL> " \
                --query=(commandline) \
                --preview="echo -- {} | string replace --regex '^.*? │ ' '' | fish_indent --ansi" \
                --preview-window="right:wrap" \
                $fzf_history_opts 

          case '*'
            builtin history --null |
                _fzf_wrapper --read0 \
                    --print0 \
                    --multi \
                    --scheme=history \
                    --prompt="Search History> " \
                    --query=(commandline) \
                    --preview="echo -- {} | string replace --regex '^.*? │ ' '' | fish_indent --ansi" \
                    --preview-window="right:wrap" \
                    $fzf_history_opts 
        end

        # if string match  "curl"
        #   echo "foo"
        # else
          # _fzf_wrapper --read0 \
          #     --print0 \
          #     --multi \
          #     --scheme=history \
          #     --prompt="Search History> " \
          #     --query=(commandline) \
          #     --preview="echo -- {} | string replace --regex '^.*? │ ' '' | fish_indent --ansi" \
          #     --preview-window="right:wrap" \
          #     $fzf_history_opts 
        # end

        # string split0 |
        # remove timestamps from commands selected
        # string replace --regex '^.*? │ ' ''
    )

    if test $status -eq 0
        commandline --replace -- $commands_selected
    end

    commandline --function repaint
end
