# Makefile for AutoHotkey keyboard shortcuts

.PHONY: run force-reload stop help

# Run the remapping script
run:
	@echo "Starting AutoHotkey remapping script..."
	@start "" "remap_shortcuts.ahk"

# Force reload the script (stop and start)
force-reload:
	@echo "Reloading AutoHotkey script..."
	@taskkill /f /im "remap_shortcuts.exe" 2>nul || echo "Script not running"
	@start "" "remap_shortcuts.ahk"

# Stop the script
stop:
	@echo "Stopping AutoHotkey script..."
	@taskkill /f /im "remap_shortcuts.exe" 2>nul || echo "Script not running"

# Show help
help:
	@echo "Available commands:"
	@echo "  make run     - Start the remapping script"
	@echo "  make force-reload  - Force-reload the script (stop and start)"
	@echo "  make stop    - Stop the script"
	@echo "  make help    - Show this help"

# Default target
.DEFAULT_GOAL := help
