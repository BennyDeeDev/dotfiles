# Local Rules

- Be terse. Prefer short answers over walls of text

- For any multi-step task, the orchestrator creates ONE per-session progress file at `opencode/tasks/<YYYY-MM-DD>-<HHMMSS>-<short-slug>.md` (e.g. `2026-07-12-143052-add-progressive-enhancement.md`) at the start of the task and keeps it current as work proceeds. There is exactly one progress file per session.

- Never run `kubectl exec` or `kubectl run`. These commands are blocked and will fail

- On NixOS, never run `home-manager switch`

- All projects live in `$HOME/Repos`

- Local documentation repos (cloned per `Docsfile`) live in `$HOME/Docs/<name>`

- Don't add comments just to describe what code does. Only add comments that help the IDE (e.g. hover docs, function explanations) or document a non-obvious decision

- After editing anything that needs building, run the appropriate build command to verify

