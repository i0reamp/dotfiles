#!/usr/bin/env bash
# Toggle screen recording: first press → выбрать область и начать запись,
# второе нажатие → остановить и сохранить.
if pgrep -x wf-recorder >/dev/null; then
    pkill -SIGINT wf-recorder
    notify-send -t 2000 "Запись остановлена" "Сохранено в ~/recordings/"
else
    mkdir -p ~/recordings
    OUT=~/recordings/$(date +%F-%H%M%S).mp4
    region=$(slurp) || exit 0
    notify-send -t 1500 "Запись началась" "$OUT"
    wf-recorder -g "$region" -f "$OUT"
fi
