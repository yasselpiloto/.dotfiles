-- reload hs configuration on change
hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

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
  
  local idx = choice["idx"]
  local name = choice["text"]
  dev = hs.audiodevice.allOutputDevices()[idx]
  if not dev:setDefaultOutputDevice() then
    hs.alert.show("Unable to enable audio output device " .. name)
  else
    hs.alert.show("Audio output device is now: " .. name)
  end
end)

audioChooser:choices(audiochoices)
hs.hotkey.bind({"cmd", "alt"}, "A", function()
  audioChooser:show()
end)

