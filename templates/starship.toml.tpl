"$schema" = 'https://starship.rs/config-schema.json'

format = """
[ ](bg:accent)\
$os\
[ ](bg:accent)\
[](bg:foreground fg:accent)\
$directory\
[](fg:foreground bg:accent)\
$git_branch\
[](fg:accent bg:foreground)\
$kubernetes\
[](fg:foreground)\
$line_break\
$character
"""

palette = 'theme'

[os]
disabled = false
style = "bg:accent fg:background"

[os.symbols]
Windows = ""
Ubuntu = "󰕈"
SUSE = ""
Raspbian = "󰐿"
Mint = "󰣭"
Macos = "󰀵"
Manjaro = ""
Linux = "󰌽"
Gentoo = "󰣨"
Fedora = "󰣛"
Alpine = ""
Amazon = ""
Android = ""
AOSC = ""
Arch = "󰣇"
Artix = "󰣇"
CentOS = ""
Debian = "󰣚"
Redhat = "󱄛"
RedHatEnterprise = "󱄛"

[directory]
style = "bg:foreground fg:background"
format = "[ $path ]($style)"
truncation_length = 2
truncation_symbol = "…/"
truncate_to_repo = false

[git_branch]
symbol = ""
style = "bg:accent"
format = '[[ $symbol $branch ](fg:background bg:accent)]($style)'

[git_status]
style = "bg:accent"
format = '[[($all_status$ahead_behind )](fg:background bg:accent)]($style)'

[kubernetes]
disabled = false
symbol = "☸ "
style = "bg:accent"
format = '[[ $symbol$context( \($namespace\)) ](fg:background bg:accent)]($style)'

[line_break]
disabled = false

[character]
disabled = false
success_symbol = '[](bold fg:color2)'
error_symbol = '[](bold fg:color1)'
vimcmd_symbol = '[](bold fg:color2)'
vimcmd_replace_one_symbol = '[](bold fg:color5)'
vimcmd_replace_symbol = '[](bold fg:color5)'
vimcmd_visual_symbol = '[](bold fg:color3)'

[palettes.theme]
accent = "{{ accent }}"
foreground = "{{ foreground }}"
background = "{{ background }}"
cursor = "{{ cursor }}"
color0 = "{{ color0 }}"
color1 = "{{ color1 }}"
color2 = "{{ color2 }}"
color3 = "{{ color3 }}"
color4 = "{{ color4 }}"
color5 = "{{ color5 }}"
color6 = "{{ color6 }}"
color7 = "{{ color7 }}"
color8 = "{{ color8 }}"
color9 = "{{ color9 }}"
color10 = "{{ color10 }}"
color11 = "{{ color11 }}"
color12 = "{{ color12 }}"
color13 = "{{ color13 }}"
color14 = "{{ color14 }}"
color15 = "{{ color15 }}"
