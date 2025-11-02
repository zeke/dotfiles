# Claude Code

My personal configuration files for [Claude Code](https://docs.anthropic.com/claude-code).

## How to Use These Configs

These configs live in `~/.claude/` and are shared across all projects. You can:

1. Copy the entire `.claude` directory to your home directory (`~/.claude`)
2. Pick and choose individual files that fit your workflow
3. Use as a reference to build your own configs

Feel free to fork this repo and adapt it to your needs. If you create your own Claude Code configs, please share them!

## Core Configuration

- [CLAUDE.md](CLAUDE.md) - Instructions for Claude Code
  - Git workflow (semantic commits, feature branches)
  - GitHub and Linear integrations
  - PR writing guidelines
  - Code style preferences

- [settings.json](settings.json) - Tool permissions and hooks
  - Pre-approved commands (git, npm, gh, etc.)
  - Hook configurations for all lifecycle events
  - Plugin settings

## Commands

Located in [commands/](commands/):

- **pr.md** - Create branch, commit, push, and open PR with CI monitoring
- **draft-social-post.md** - Draft social posts via Typefully API
- **apply-replicate-writing-style.md** - Apply Replicate's style guide to text

## Hooks

Located in [hooks/](hooks/):

- **log-event.sh** - Logs all hook events to JSONL
- **aggregate-prompts.sh** - Collects user prompts into PROMPTS.md
- **notify-input-needed.sh** - Alerts when Claude needs input (macOS)

See [hooks/README.md](hooks/README.md) for details.

## Agents

- **django-code-reviewer.md** - Reviews Django/Python code for quality and best practices

## Plugins

- **feature-dev** - Guided feature development with codebase understanding

## MCP servers

Here are the MCP servers I use:

```sh
claude mcp add chrome-devtools --scope user -- npx chrome-devtools-mcp@latest
claude mcp add cloudflare-docs https://docs.mcp.cloudflare.com/sse --transport sse --scope user
claude mcp add cloudflare-bindings https://bindings.mcp.cloudflare.com/sse --transport sse --scope user
claude mcp add cloudflare-builds https://builds.mcp.cloudflare.com/sse --transport sse --scope user
claude mcp add linear https://mcp.linear.app/sse --scope user --transport sse
claude mcp add notion https://mcp.notion.com/sse --scope user --transport sse
claude mcp add obs --scope user -- npx -y obs-mcp@latest
claude mcp add playwright --scope user -- npx @playwright/mcp@latest --extension
claude mcp add replicate https://mcp.replicate.com/sse --transport sse --scope user
claude mcp add slack --scope user --transport stdio -- npx -y slack-mcp-server@latest
```

☝️ I find it's best to install MCP servers globally with the "user" scope, so they're avaialable across all projects.