hyper = {"cmd", "alt", "ctrl", "shift"}

-- reload hs configuration on change
hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

-- load caffeine
hs.loadSpoon("Caffeine")
spoon.Caffeine:bindHotkeys({toggle = {hyper, "C"},})
spoon.Caffeine:start()

-- show / hide terminal
hs.hotkey.bind({"alt"}, "`", function()
  local alacritty = hs.application.find('alacritty')
  if alacritty:isFrontmost() then
    alacritty:hide()
  else
    hs.application.launchOrFocus("/Applications/Alacritty.app")
  end
end)


-- toggle terminal opacity on / off
hs.hotkey.bind({"cmd"}, "U", function()
  alacritty_file_name = string.format("%s/.config/alacritty.yml", os.getenv("HOME"))

  opaque = "opacity: 1"
  transparent = "opacity: 0.9"

  local file = io.open(alacritty_file_name)

  local content = file:read "*a"
  file:close()

  if string.match(content, opaque) then
    content = string.gsub(content, opaque, transparent)
  else
    content = string.gsub(content, transparent, opaque)
  end

  local fileedited = io.open(alacritty_file_name, "w")
  fileedited:write(content)
  fileedited:close()
end)


-- choose audio output device
local audiochoices = {}

for i, v in ipairs(hs.audiodevice.allOutputDevices()) do
  table.insert(audiochoices, {text = v:name(), idx = i})
end

local audioChooser = hs.chooser.new(function(choice)
  if not choice then
    return
  end
  
  -- get output device
  local output_idx = choice["idx"]
  local name = choice["text"]
  output = hs.audiodevice.allOutputDevices()[output_idx]
  
  -- get input device id based on the choosen name
  
  local input = hs.fnutils.find(hs.audiodevice.allInputDevices(), function(device)
    return device:name() == name
  end)

  if not (output:setDefaultOutputDevice() and input:setDefaultInputDevice()) then
    hs.alert.show("Unable to enable audio device " .. name)
  else
    hs.alert.show("Audio device is now: " .. name)
  end
end)

audioChooser:choices(audiochoices)
hs.hotkey.bind({"cmd", "alt"}, "A", function()
  audioChooser:show()
end)

-- move window to next screen
function moveToNextScreen()
  local app = hs.window.focusedWindow()
  app:moveToScreen(app:screen():next())
  app:maximize()
end

hs.hotkey.bind(hyper, "left", moveToNextScreen)
hs.hotkey.bind(hyper, "right", moveToNextScreen)
