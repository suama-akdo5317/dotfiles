#!/usr/bin/env bash
# Claude Code statusLine
# Fields: [dir] | [git branch (dirty marker)] | [model] | [context remaining %] | [5h rate limit %] | [7d rate limit %]

input=$(cat)

# --- Colors (dim-friendly ANSI) ---
C_RESET=$'\033[0m'
C_DIR=$'\033[36m'      # cyan
C_GIT=$'\033[33m'      # yellow
C_DIRTY=$'\033[31m'    # red
C_MODEL=$'\033[35m'    # magenta
C_CTX_OK=$'\033[32m'   # green
C_CTX_WARN=$'\033[33m' # yellow
C_CTX_LOW=$'\033[31m'  # red
C_RL_OK=$'\033[32m'    # green
C_RL_WARN=$'\033[33m'  # yellow
C_RL_HIGH=$'\033[31m'  # red
C_SEP=$'\033[2m'       # dim

# --- 1. Directory (basename of cwd) ---
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty')
[ -z "$cwd" ] && cwd="$PWD"
dir_name=$(basename "$cwd")

# --- 2. Git branch + dirty marker ---
git_segment=""
if git -C "$cwd" --no-optional-locks rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  branch=$(git -C "$cwd" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null)
  if [ -z "$branch" ]; then
    branch=$(git -C "$cwd" --no-optional-locks rev-parse --short HEAD 2>/dev/null)
  fi
  if [ -n "$branch" ]; then
    if [ -n "$(git -C "$cwd" --no-optional-locks status --porcelain 2>/dev/null)" ]; then
      git_segment="${C_GIT}${branch}${C_DIRTY}*${C_RESET}"
    else
      git_segment="${C_GIT}${branch}${C_RESET}"
    fi
  fi
fi

# --- 3. Model name ---
model_name=$(echo "$input" | jq -r '.model.display_name // "unknown"')

# --- 4. Context window remaining percentage ---
remaining=$(echo "$input" | jq -r '.context_window.remaining_percentage // empty')
ctx_segment=""
if [ -n "$remaining" ]; then
  remaining_rounded=$(printf '%.0f' "$remaining")
  if [ "$remaining_rounded" -ge 50 ]; then
    ctx_color="$C_CTX_OK"
  elif [ "$remaining_rounded" -ge 20 ]; then
    ctx_color="$C_CTX_WARN"
  else
    ctx_color="$C_CTX_LOW"
  fi
  ctx_segment="${ctx_color}ctx:${remaining_rounded}%${C_RESET}"
else
  ctx_segment="${C_SEP}ctx:--%${C_RESET}"
fi

# --- 5. Rate limit usage (5-hour / 7-day), if provided by Claude Code ---
rl_color_for_used() {
  # $1 = used percentage (rounded int). Higher usage = worse.
  local used="$1"
  if [ "$used" -ge 80 ]; then
    echo "$C_RL_HIGH"
  elif [ "$used" -ge 50 ]; then
    echo "$C_RL_WARN"
  else
    echo "$C_RL_OK"
  fi
}

five_hour_used=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
five_hour_segment=""
if [ -n "$five_hour_used" ]; then
  five_hour_rounded=$(printf '%.0f' "$five_hour_used")
  five_hour_color=$(rl_color_for_used "$five_hour_rounded")
  five_hour_segment="${five_hour_color}5h:${five_hour_rounded}%${C_RESET}"
fi

seven_day_used=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
seven_day_segment=""
if [ -n "$seven_day_used" ]; then
  seven_day_rounded=$(printf '%.0f' "$seven_day_used")
  seven_day_color=$(rl_color_for_used "$seven_day_rounded")
  seven_day_segment="${seven_day_color}7d:${seven_day_rounded}%${C_RESET}"
fi

# --- Assemble ---
sep=" ${C_SEP}|${C_RESET} "

line="${C_DIR}${dir_name}${C_RESET}"
[ -n "$git_segment" ] && line="${line}${sep}${git_segment}"
line="${line}${sep}${C_MODEL}${model_name}${C_RESET}${sep}${ctx_segment}"
[ -n "$five_hour_segment" ] && line="${line}${sep}${five_hour_segment}"
[ -n "$seven_day_segment" ] && line="${line}${sep}${seven_day_segment}"

printf '%s' "$line"
