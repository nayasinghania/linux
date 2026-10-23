if [[ "$XDG_VTNR" == 1 ]] && uwsm check may-start; then
    exec uwsm start hyprland.desktop
fi
