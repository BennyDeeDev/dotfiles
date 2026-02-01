# Copilot instructions (dotfiles)

These instructions apply when working in this repo.

**Required workflow for any Hyprland question:**

1. **Search the hyprland-wiki first** using grep_search or semantic_search to confirm names, syntax, and semantics
2. **Search omarchy config files** to check for relevant defaults, conventions, or example implementations
3. **Link to relevant sources** in your response using markdown: `[Environment-variables](hyprland-wiki/content/Configuring/Environment-variables.md)` or `[hyprland.conf](omarchy/config/hypr/hyprland.conf)`
4. **If uncertain or information is missing**, explicitly state what you couldn't verify

**Example response format:**
> According to [Environment-variables.md](hyprland-wiki/content/Configuring/Environment-variables.md), `XCURSOR_SIZE` controls X11 cursor size. The omarchy default in [hyprland.conf](omarchy/config/hypr/hyprland.conf) uses 24px.

Never state facts about Hyprland configuration without searching and citing sources.

## Shell scripting (simplicity + maintainability)

- Keep scripts small, readable, and non-clever.
- Prefer a few straightforward commands over dense bash tricks.
- Avoid unnecessary branching; only add conditionals when they prevent real breakage.
- Provide user feedback with simple `echo` statements.
