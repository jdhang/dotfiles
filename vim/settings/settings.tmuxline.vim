" tmuxline
let g:tmuxline_preset = {
  \'a'            : '#S:#I',
  \'b'            : '#W',
  \'c disabled'   : '',
  \'win'          : ['#I', '#W'],
  \'cwin'         : ['#I', '#W'],
  \'y'            : ['%a', '%Y-%m-%d', '%H:%M', '#(~/.tmux/plugins/tmux-battery/scripts/battery_percentage.sh) #(~/.tmux/plugins/tmux-battery/scripts/battery_remain.sh)'],
  \'z'            : ['#(whoami)']}
