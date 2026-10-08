#!/bin/bash
# Claude Code status line — context progress bar + rate limits

input=$(cat)

# Color by usage: green < 50%, yellow 50-79%, red >= 80%
reset=$'\033[0m'
usage_color() {
  if [ "$1" -ge 80 ]; then
    printf '\033[31m'
  elif [ "$1" -ge 50 ]; then
    printf '\033[33m'
  else
    printf '\033[32m'
  fi
}

# Model display name
model=$(echo "$input" | jq -r '.model.display_name // empty')
if [ -n "$model" ] && [ "$model" != "null" ]; then
  printf '[%s]' "$model"
fi

used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# Context usage percentage
if [ -n "$used" ] && [ "$used" != "null" ]; then
  used_int=$(printf "%.0f" "$used")
  ctx_color=$(usage_color "$used_int")
  [ -n "$model" ] && [ "$model" != "null" ] && printf " "
  printf "[ctx:%s%s%%%s]" "$ctx_color" "$used_int" "$reset"
fi

# Rate limits (only shown when available, i.e. for Claude.ai subscribers)
# Helper: format seconds as human-readable time (e.g. 2h15m, 45m, 3d2h)
format_remaining() {
  local secs="$1"
  if [ "$secs" -le 0 ]; then
    echo "now"
    return
  fi
  local days=$(( secs / 86400 ))
  local hours=$(( (secs % 86400) / 3600 ))
  local mins=$(( (secs % 3600) / 60 ))
  if [ "$days" -gt 0 ]; then
    printf "%dd%dh" "$days" "$hours"
  elif [ "$hours" -gt 0 ]; then
    printf "%dh%dm" "$hours" "$mins"
  else
    printf "%dm" "$mins"
  fi
}

now=$(date +%s)
five_pct=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
five_resets=$(echo "$input" | jq -r '.rate_limits.five_hour.resets_at // empty')
week_pct=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
week_resets=$(echo "$input" | jq -r '.rate_limits.seven_day.resets_at // empty')

rate_out=""
if [ -n "$five_pct" ] && [ "$five_pct" != "null" ] && [ -n "$five_resets" ] && [ "$five_resets" != "null" ]; then
  five_int=$(printf "%.0f" "$five_pct")
  five_remaining=$(( 100 - five_int ))
  five_secs=$(( ${five_resets%.*} - now ))
  five_left=$(format_remaining "$five_secs")
  rate_color=$(usage_color "$five_int")
  rate_reset="$reset"
  rate_out="${rate_out}[${five_left}:${rate_color}${five_remaining}%${rate_reset}]"
fi
if [ -n "$week_pct" ] && [ "$week_pct" != "null" ] && [ -n "$week_resets" ] && [ "$week_resets" != "null" ]; then
  week_int=$(printf "%.0f" "$week_pct")
  week_remaining=$(( 100 - week_int ))
  week_secs=$(( ${week_resets%.*} - now ))
  week_left=$(format_remaining "$week_secs")
  rate_color=$(usage_color "$week_int")
  rate_reset="$reset"
  [ -n "$rate_out" ] && rate_out="${rate_out} "
  rate_out="${rate_out}[${week_left}:${rate_color}${week_remaining}%${rate_reset}]"
fi

if [ -n "$rate_out" ]; then
  if [ -n "$used" ] && [ "$used" != "null" ]; then
    printf " "
  fi
  printf "%s" "$rate_out"
fi

printf "\n"
