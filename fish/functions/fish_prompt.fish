function _git_branch_name
  echo (command git symbolic-ref HEAD 2>/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty 2>/dev/null)
end

function fish_prompt
  set -l last_status $status
  # Nier Automata inspired palette
  set -l fg      (set_color normal)
  set -l white   (set_color white)
  set -l accent  (set_color cyan)
  set -l faded   (set_color brblack)
  set -l yellow  (set_color yellow)
  set -l red     (set_color red)
  set -l blue    (set_color blue)
  set -l green   (set_color green)
  set -l magenta (set_color magenta)
  set -l cyan    (set_color cyan)
  set -l orange  (set_color bryellow)
  set -l normal  (set_color normal)


  if test $last_status = 0
      set status_indicator "$white➜ "
  else
      set status_indicator "$red✗ "
  end
  set -l cwd $blue(prompt_pwd)

  if [ (_git_branch_name) ]

    if test (_git_branch_name) = 'master'
      set -l git_branch (_git_branch_name)
      set git_info "$white ($purple$git_branch$white)"
    else
      set -l git_branch (_git_branch_name)
      set git_info "$normal ($blue$git_branch$normal)"
    end

    if [ (_is_git_dirty) ]
      set -l dirty "$yellow ✗"
      set git_info "$git_info$dirty"
    end
  end

  # Notify if a command took more than 5 minutes
  if [ "$CMD_DURATION" -gt 300000 ]
    echo The last command took (math "$CMD_DURATION/1000") seconds.
  end

  echo -n -s $cwd $git_info ' ' $status_indicator $normal
end

