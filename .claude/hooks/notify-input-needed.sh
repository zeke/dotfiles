#!/bin/bash

# Get the notification message from stdin
MESSAGE=$(cat)

# Only trigger for "waiting for input" notifications
if [[ "$MESSAGE" == *"waiting for your input"* ]] || [[ "$MESSAGE" == *"needs your input"* ]]; then
    # Play an alert sound three times for extra attention
    (afplay /System/Library/Sounds/Glass.aiff && sleep 0.2 && afplay /System/Library/Sounds/Glass.aiff && sleep 0.2 && afplay /System/Library/Sounds/Glass.aiff) &

    # Display a prominent dialog box that requires dismissal
    osascript <<EOF &
        display dialog "🎉 Claude is waiting for your input! 🎉" with title "Input Required" buttons {"OK"} default button "OK" with icon caution giving up after 10
EOF

    # Also show a system notification
    osascript -e "display notification \"$MESSAGE\" with title \"🤖 Claude Needs Your Input\" sound name \"Glass\""

    # Make terminal window bounce continuously in dock until dismissed
    osascript -e 'tell application "System Events"
        set activeApp to name of first application process whose frontmost is true
        if activeApp is not in {"Terminal", "iTerm2", "iTerm"} then
            set visible of process "Terminal" to true
        end if
    end tell' 2>/dev/null || \
    osascript -e 'tell application "System Events"
        set activeApp to name of first application process whose frontmost is true
        if activeApp is not in {"Terminal", "iTerm2", "iTerm"} then
            set visible of process "iTerm2" to true
        end if
    end tell' 2>/dev/null
fi
