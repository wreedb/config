function fish_prompt
  set -l cyan (set_color -o cyan)
  set -l green (set_color -o green)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l magenta (set_color -o magenta)
  set -l yellow (set_color -o yellow)
  set -l white (set_color -o white)
  set -l black (set_color -o black)
  echo $yellow(whoami)$white@$magenta(hostname) $black\($blue(pwd | perl -pe 's|/home/wbr|~|g')$black\) $green\>\<\(\(\($white\"$green\>
  echo -n "$cyan> $(set_color -o normal)"
end
