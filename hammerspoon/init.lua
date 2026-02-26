require("hs.ipc")

hs.spaces.MCwaitTime = 0.3

hs.loadSpoon("SpoonInstall")

spoon.SpoonInstall.repos.PaperWM = {
    url    = "https://github.com/mogenson/PaperWM.spoon",
    desc   = "PaperWM.spoon repository",
    branch = "release",
}

spoon.SpoonInstall:andUse("PaperWM", {
    repo = "PaperWM",
    config = {
        window_gap    = { top = 12, bottom = 12, left = 12, right = 12 },
        window_ratios = { 1 / 2, 1 },
        center_mouse  = false,
    },
    start = false,
    hotkeys = {
        focus_left  = { { "ctrl" }, "h" },
        focus_right = { { "ctrl" }, "l" },
        focus_up    = { { "ctrl" }, "k" },
        focus_down  = { { "ctrl" }, "j" },

        swap_left  = { { "ctrl", "shift" }, "h" },
        swap_right = { { "ctrl", "shift" }, "l" },
        swap_up    = { { "ctrl", "shift" }, "k" },
        swap_down  = { { "ctrl", "shift" }, "j" },

        decrease_width = { { "ctrl" }, "-" },
        increase_width = { { "ctrl" }, "=" },

        cycle_width = { { "ctrl" }, "g" },
        toggle_floating = { { "ctrl" }, "v" },
        focus_floating  = { { "ctrl" }, "f" },

        switch_space_1 = { { "ctrl" }, "1" },
        switch_space_2 = { { "ctrl" }, "2" },
        switch_space_3 = { { "ctrl" }, "3" },
        switch_space_4 = { { "ctrl" }, "4" },
        switch_space_5 = { { "ctrl" }, "5" },
        switch_space_6 = { { "ctrl" }, "6" },
        switch_space_7 = { { "ctrl" }, "7" },
        switch_space_8 = { { "ctrl" }, "8" },
        switch_space_9 = { { "ctrl" }, "9" },

        move_window_1 = { { "shift" }, "f1" },
        move_window_2 = { { "shift" }, "f2" },
        move_window_3 = { { "shift" }, "f3" },
        move_window_4 = { { "shift" }, "f4" },
        move_window_5 = { { "shift" }, "f5" },
        move_window_6 = { { "shift" }, "f6" },
        move_window_7 = { { "shift" }, "f7" },
        move_window_8 = { { "shift" }, "f8" },
        move_window_9 = { { "shift" }, "f9" },
    },
})

local rejected_apps = {
    -- system utilities
    "Finder",
    "System Settings",
    "System Preferences",
    "Activity Monitor",
    "Disk Utility",
    "Console",
    "Audio MIDI Setup",
    "AirPort Utility",
    "ColorSync Utility",
    "Digital Color Meter",
    "Migration Assistant",
    "System Information",
    "Screenshot",
    "Font Book",
    "App Store",
    "AppCleaner",
    "Automator",
    "Shortcuts",
    "Time Machine",
    "Mission Control",
    "Siri",
    "Tips",
    -- small/fixed-size apps
    "Calculator",
    "Clock",
    "Weather",
    "Stocks",
    "Dictionary",
    "Chess",
    "Phone",
    -- communication (popover style)
    "FaceTime",
    "Messages",
    "Mail",
    "Contacts",
    "Calendar",
    "Reminders",
    "Notes",
    "Maps",
    "FindMy",
    "Home",
    "Journal",
    "Freeform",
    -- media/content
    "Photos",
    "Photo Booth",
    "Podcasts",
    "News",
    "VoiceMemos",
    -- one-shot utilities
    "Archive Utility",
    "The Unarchiver",
    "Image Capture",
    "Bluetooth File Exchange",
    "TextEdit",
    "Preview",
    -- password/security
    "KeePassXC",
    "Passwords",
    -- misc
    "Hammerspoon",
    "Google Drive",
    "Stickies",
    "iPhone Mirroring",
    "Ice",
    "Stats",
}

for _, app in ipairs(rejected_apps) do
    spoon.PaperWM.window_filter:rejectApp(app)
end

-- spoon.PaperWM.window_filter:setAppFilter("Preview", { rejectTitles = { "Open" } })

-- hs.window.animationDuration = 0.1

spoon.PaperWM:start()

-- 3-finger swipe to focus adjacent windows
hs.loadSpoon("Swipe")
local swipe_actions = spoon.PaperWM.actions.actions()
local swipe_current_id, swipe_threshold
spoon.Swipe:start(3, function(direction, distance, id)
    if id == swipe_current_id then
        if distance > swipe_threshold then
            swipe_threshold = math.huge
            if direction == "left" then
                swipe_actions.focus_left()
            elseif direction == "right" then
                swipe_actions.focus_right()
            elseif direction == "up" then
                swipe_actions.focus_up()
            elseif direction == "down" then
                swipe_actions.focus_down()
            end
        end
    else
        swipe_current_id = id
        swipe_threshold = 0.01
    end
end)

local function launch(app) return function() hs.application.launchOrFocus(app) end end

local full_width = spoon.PaperWM.windows.toggleWindowFullWidth()
spoon.PaperWM.window_filter:subscribe(hs.window.filter.windowCreated, function(win)
  hs.timer.doAfter(hs.window.animationDuration, function()
    if hs.window.focusedWindow() == win then
      full_width()
    end
  end)
end)

hs.hotkey.bind({ "ctrl", "shift" }, "f", function()
  local windows = hs.window.orderedWindows()
  for _, win in ipairs(windows) do
    local win_id = win:id()
    if spoon.PaperWM.state.isTiled(win_id) then
      win:focus()
      return
    end
  end
end)

hs.hotkey.bind({"cmd", "shift"}, "t", function()
  hs.task.new("/usr/bin/open", nil, {"-na", "Ghostty"}):start()
end)

hs.hotkey.bind({"cmd", "shift"}, "b", function()
  hs.task.new("/usr/bin/open", nil, {"-na", "Brave Browser"}):start()
end)

hs.hotkey.bind({"cmd", "shift"}, "e", function()
  hs.task.new("/opt/homebrew/bin/code", nil, {"--new-window"}):start()
end)

hs.hotkey.bind({ "cmd", "shift" }, "p", launch("KeePassXC"))
hs.hotkey.bind({ "cmd", "shift" }, "s", launch("Spotify"))
