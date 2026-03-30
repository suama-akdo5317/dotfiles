# Guidelines

This document defines the project's rules, objectives, and progress management methods. Please proceed with the project according to the following content.

## Top-Level Rules

- **Responses must be in Japanese.**.
- To understand how to use a library, **always use the Context7 MCP** to retrieve the latest information.
- To investigate source code, **always use the Serena MCP** for code exploration and analysis.
- For front-end implementation, please ensure to verify the functionality using browser tools before considering the work complete.
  - **browser-use CLI** (default): Use for quick visual checks, screenshots, form interactions, and browsing with existing Chrome profiles (logged-in sessions).
  - **Playwright MCP**: Use when advanced debugging is needed — console log monitoring, network request inspection, dialog handling.
  - **Chrome DevTools MCP**: Use when DevTools-specific features are needed — performance profiling, detailed DOM inspection.
- When seeking a decision, **use `AskUserQuestion`**.
- For temporary notes for design, create a markdown in `.tmp` and save it.
- Please respond critically and without pandering to my opinions, but please don't be forceful in your criticism.
