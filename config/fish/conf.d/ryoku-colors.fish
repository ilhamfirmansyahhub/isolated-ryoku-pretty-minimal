# Ryoku palette for fish and fzf. Rendered by the theme daemon; do not edit.
#
# Dropped straight into conf.d, which fish sources on its own, so nothing in the
# shipped config has to include it. Your ~/.config/fish/user.fish loads last and
# still wins.

# Syntax highlighting.
set -g fish_color_normal D1D1C7
set -g fish_color_command AAD94C
set -g fish_color_keyword 39BAE6
set -g fish_color_quote E6B450
set -g fish_color_redirection 8E959E
set -g fish_color_end 39BAE6
set -g fish_color_error D95757
set -g fish_color_param D1D1C7
set -g fish_color_comment 8E959E
set -g fish_color_selection --background=1E222A
set -g fish_color_operator 39BAE6
set -g fish_color_escape E6B450
set -g fish_color_autosuggestion 8E959E
set -g fish_color_cancel D95757
set -g fish_color_search_match --background=1E222A
set -g fish_color_valid_path --underline

# Completion pager.
set -g fish_pager_color_progress 8E959E
set -g fish_pager_color_prefix AAD94C
set -g fish_pager_color_completion D1D1C7
set -g fish_pager_color_description 8E959E
set -g fish_pager_color_selected_background --background=1E222A

# fzf takes the same palette, so Ctrl-R and Ctrl-T match the terminal they open
# in. Appended to whatever options are already set rather than replacing them.
set -gx FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS \
--color=fg:#D1D1C7,bg:-1,hl:#AAD94C \
--color=fg+:#D1D1C7,bg+:#1E222A,hl+:#AAD94C \
--color=info:#E6B450,prompt:#AAD94C,pointer:#39BAE6 \
--color=marker:#39BAE6,spinner:#E6B450,header:#8E959E \
--color=border:#31353d"
