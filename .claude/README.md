# Claude Code Configuration

Configuration files for [Claude Code](https://docs.anthropic.com/claude-code).

- [CLAUDE.md](CLAUDE.md) - Instructions for Claude Code
- [settings.json](settings.json) - Tool permissions and settings
- [commands/](commands/) - Custom slash commands
- [agents/](agents/) - Custom agent configs  
- [plugins/](plugins/) - Plugin configs and repos

## Commands

Shell commands for rounding up Claude Code settings that have cropped up in local `.claude` directories.

Find them:

```sh
npx yolox find all files recursively in this directory with the name settings.local.json
# Command: find . -type f -name ".claude/settings.local.json
```

Cat them:

```sh
npx yolox find all files recursively in this directory with the name settings.local.json and cat their content 
# Command: find . -type f -name "settings.local.json" -exec cat {} +
```

## MCP servers

```sh
claude mcp add chrome-devtools --scope user -- npx chrome-devtools-mcp@latest
claude mcp add linear https://mcp.linear.app/sse --scope user --transport sse
claude mcp add obs --scope user -- npx -y obs-mcp@latest
claude mcp add playwright --scope user -- npx @playwright/mcp@latest --extension
claude mcp add replicate https://mcp.replicate.com/sse --transport sse --scope user
claude mcp add slack --scope user --transport stdio -- npx -y slack-mcp-server@latest
```