# Glossary

**Purpose:** Define terminology used in The Briefcase methodology

**Last Updated:** [YYYY-MM-DD]

---

## The Briefcase Terms

### The Briefcase
The overall Git-based persistent memory framework for AI-assisted projects.

### Level 1 Documentation
Navigation and overview documentation (master_plan.md) - provides high-level context and references.

### Level 2 Documentation
Domain-specific documentation - detailed procedures, current state, what's been done, what needs doing.

### Level 3 Documentation
System-specific documentation - granular technical details, configuration files, implementation specifics.

### Session
A single period of work with an AI assistant, bounded by Git commits. Sessions start by loading context and end by committing changes.

### Context Loading
The process of an AI reading key documentation files at session start to understand the project.

### Strategic Decisions
Documented constraints and technology choices that shape how the project operates. These are not up for re-debate.

### Ripple Effect
When a change in one area necessitates updates in other areas. Tracked in TODO.md to prevent documentation loops.

### Session Capture
Temporary in-the-moment notes during active work. Triaged at session end and cleared.

### Triage
The weekly process of reviewing suggestions in IMPROVEMENTS.md and deciding which to pursue.

### Persistent Memory
Using Git-versioned documentation as the source of truth that persists across AI sessions.

---

## Git Terms

### Working Tree
The current state of files in your project directory, excluding the .git folder.

### Commit
A snapshot of the project at a specific point in time, with a message describing the changes.

### Push
Uploading local commits to a remote repository (e.g., GitHub).

### Pull
Downloading commits from a remote repository and merging them into your local copy.

### Branch
A parallel version of the repository, allowing work on features without affecting the main codebase.

### Main/Master
The primary branch containing the stable, production-ready code.

### .gitignore
A file specifying which files and directories Git should ignore (not track).

### Remote
A version of the repository hosted on a server (e.g., GitHub, GitLab).

---

## AI Terms

### Claude Code
Anthropic's CLI tool for AI-assisted coding with direct file system and Git access.

### Claude Desktop
Anthropic's GUI application for Claude, can use MCP servers for system access.

### GitHub Copilot
Microsoft's AI pair programmer that integrates with VS Code and other IDEs.

### ChatGPT
OpenAI's conversational AI assistant, accessible via web or API.

### MCP (Model Context Protocol)
A protocol allowing AI assistants to access external systems and data sources.

### Prompt
The input text or instruction given to an AI assistant.

### Context Window
The amount of text an AI can process at once (recent conversation + files loaded).

---

## Project-Specific Terms

[Add your project-specific terminology here]

---

**Last Updated:** [YYYY-MM-DD]
