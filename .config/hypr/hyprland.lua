----------------
---- CONFIG ----
----------------

hl.config({
	dwindle = {
		preserve_split = true,
	},

	general = {
		gaps_in = 5,
		gaps_out = 7,
        border_size = 2,
        resize_on_border = true,

		col = {
			active_border = {
				colors = {
					"rgba(203, 166, 247, 1)",
					"rgba(203, 166, 247, 1)",
				},
				angle = 45,
			},

			inactive_border = "rgba(30, 30, 46, 1)",
		},

		layout = "dwindle",
	},

	decoration = {
		rounding = 10,
		rounding_power = 2,
	},

	xwayland = {
		force_zero_scaling = true,
	},

	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
        background_color = "#1E1E2E",
		font_family = "Noto Sans"
	},
})

----------------------
----  AUTOSTARTS  ----
----------------------

hl.on("hyprland.start", function()
	hl.exec_cmd("uwsm app -- librewolf")
	hl.exec_cmd("uwsm app -- wl-paste --type text --watch cliphist store")
	hl.exec_cmd("uwsm app wl-paste --type image --watch cliphist store")
end)

------------------
---- MONITORS ----
------------------

hl.monitor({
	output = "",
	mode = "3440x1440@60",
	position = "0x0",
	scale = "1.33",
})

----------------
---- CURVES ----
----------------

hl.curve("almostLinear", {
    type = "bezier",
    points = { { 0.5, 0.5 }, { 0.75, 1 } }
})

--------------------
---- ANIMATIONS ----
--------------------

hl.animation({ leaf = "global", enabled = true, speed = 1, bezier = "linear" })
hl.animation({
    leaf = "windowsMove",
    enabled = true,
    speed = 3,
    bezier = "almostLinear",
})

-------------------------------
---- KEY BINDINGS ----
-------------------------------

local mainMod = "SUPER"

hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("uwsm app -- kitty"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("uwsm app -- fuzzel"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy'))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))

hl.bind(mainMod .. " + X", function()
	if hl.get_workspace("special:minimized") then
		hl.dispatch(hl.dsp.window.move({ workspace = hl.get_active_workspace(), window = "tag:minimized" }))
		hl.dispatch(hl.dsp.window.clear_tags({ window = "tag:minimized" }))
	else
		hl.dispatch(hl.dsp.window.tag({ tag = "minimized", window = hl.get_active_window() }))
		hl.dispatch(hl.dsp.window.move({ workspace = "special:minimized", follow = false }))
	end
end)

hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd('grim -g "$(slurp)" - | swappy -f -'))
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd("cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"))

hl.bind("XF86Tools", hl.dsp.exec_cmd("systemctl suspend"))

------------------------
---- MOUSE BINDINGS ----
------------------------

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

---------------------------------------
---- MEDIA AND BRIGHTNESS BINDINGS ----
---------------------------------------

hl.bind(
	"XF86MonBrightnessUp",
	hl.dsp.exec_cmd("ddcutil --noverify setvcp 10 + 25"),
	{ locked = true, repeating = true }
)

hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd("ddcutil --noverify setvcp 10 - 25"),
	{ locked = true, repeating = true }
)

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
    "XF86AudioPause",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true }
)
hl.bind(
    "XF86AudioPlay",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true }
)

-----------------------
---- WINDOW RULES ----
-----------------------
---
hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})
