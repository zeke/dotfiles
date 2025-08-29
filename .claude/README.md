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