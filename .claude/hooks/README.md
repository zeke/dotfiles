# Claude Code Hooks

Custom hooks for Claude Code events.

## Installed Hooks

### aggregate-prompts.sh
- **Event**: UserPromptSubmit
- **What it does**: Collects user prompts into a PROMPTS.md file in the project directory

### notify-input-needed.sh
- **Event**: Notification
- **What it does**: Shows a macOS notification when Claude needs input

## Hook Types

You can create hooks for these events:

- `SessionStart` - When Claude Code starts
- `SessionEnd` - When Claude Code exits
- `UserPromptSubmit` - When you submit a prompt
- `PreToolUse` - Before a tool executes (can block with exit 1)
- `PostToolUse` - After a tool completes
- `Stop` - When Claude finishes responding
- `SubagentStop` - When a subagent finishes
- `Notification` - During system notifications

## Hook Structure

Hooks receive JSON input via stdin and can:
- Exit 0 to allow the operation (and optionally print messages)
- Exit 1 to block the operation (for Pre hooks)

### Example: Block writes to certain files

```bash
#!/bin/bash
input=$(cat)
file_path=$(echo "$input" | jq -r '.file_path // empty')

if [[ "$file_path" == *".env"* ]]; then
    echo "Blocked: Cannot write to .env files"
    exit 1
fi

exit 0
```

### Example: Tool-specific hook

Add a matcher to target specific tools:

```json
"PreToolUse": [
  {
    "matcher": "Write",
    "hooks": [
      {
        "type": "command",
        "command": "/path/to/validate-write.sh"
      }
    ]
  }
]
```

## Useful Tips

- Use `jq` to parse JSON input properly
- Keep hooks fast (they block operations)
- Add timeouts for long-running hooks
- Check `$CLAUDE_*` environment variables for context
- Test hooks by running them directly with sample JSON

## Testing Your Hooks

Test a hook manually:
```bash
echo '{"command": "git push --force"}' | ./hooks/your-hook.sh
```

## Resources

- [Official hooks documentation](https://docs.claude.com/en/docs/claude-code/hooks)
