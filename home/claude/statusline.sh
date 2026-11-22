# Claude Code statusline: dir, git branch, model, and rate-limit usage.

input=$(cat)

eval "$(echo "$input" | jq -r '
  def secs_left:
    if . == null then empty
    elif type == "number" then . - now
    else (try (fromdateiso8601 - now) catch empty)
    end
    | if . > 0 then (. | floor | tostring) else empty end;
  @sh "dir=\(.workspace.current_dir)",
  @sh "model=\(.model.display_name)",
  @sh "five=\(.rate_limits.five_hour.used_percentage // empty)",
  @sh "week=\(.rate_limits.seven_day.used_percentage // empty)",
  @sh "five_left=\(.rate_limits.five_hour.resets_at | secs_left)"
')"
dir=$(basename "$dir")

# Git branch (skip optional locks so this never blocks on a busy repo)
branch=$(git --no-optional-locks branch --show-current 2>/dev/null)

RESET=$'\033[0m'
BLUE=$'\033[34m'
MAGENTA=$'\033[35m'
BOLD=$'\033[1m'
GREEN=$'\033[32m'
YELLOW=$'\033[33m'
RED=$'\033[31m'

usage_color() {
  n=$(printf '%.0f' "$1")
  if [ "$n" -ge 90 ]; then
    printf '%s' "$RED"
  elif [ "$n" -ge 70 ]; then
    printf '%s' "$YELLOW"
  else
    printf '%s' "$GREEN"
  fi
}

fmt_left() {
  h=$(( $1 / 3600 ))
  m=$(( ($1 % 3600) / 60 ))
  if [ "$h" -gt 0 ]; then
    printf '%dh%02dm' "$h" "$m"
  else
    printf '%dm' "$m"
  fi
}

limits=""
if [ -n "$five" ]; then
  limits="$(usage_color "$five")5h:$(printf '%.0f' "$five")%${RESET}"
  if [ -n "$five_left" ]; then
    limits="$limits($(fmt_left "$five_left"))"
  fi
fi
if [ -n "$week" ]; then
  [ -n "$limits" ] && limits="$limits "
  limits="${limits}$(usage_color "$week")7d:$(printf '%.0f' "$week")%${RESET}"
fi

out="${BLUE}${dir}${RESET}"
if [ -n "$branch" ]; then
  out="$out ${MAGENTA}(${branch})${RESET}"
fi
out="$out ${BOLD}[${model}]${RESET}"
if [ -n "$limits" ]; then
  out="$out | $limits"
fi

printf '%s' "$out"
