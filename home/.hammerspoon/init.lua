function pressKey(modifier, key)
  hs.eventtap.event.newKeyEvent(modifier, key, true):post()
  hs.timer.usleep(100)
  hs.eventtap.event.newKeyEvent(modifier, key, false):post()
end
function launchOrHide(launchAppName, activeAppName)
  app = hs.application.frontmostApplication()
  if app:name() == activeAppName then
    app:hide()
  else
    hs.application.launchOrFocus(launchAppName)
  end
end

hs.hotkey.bind({"ctrl"}, 102, function() end)
hs.hotkey.bind({"shift"}, 102, function() end)

hs.hotkey.bind({"cmd", "alt", "shift"}, "J", function()
  pressKey({"cmd", "shift"}, "[")
end)
hs.hotkey.bind({"cmd", "alt", "shift"}, "L", function()
  pressKey({"cmd", "shift"}, "]")
end)

hs.hotkey.bind({"cmd"}, "1", function()
  launchOrHide("iTerm", "iTerm2")
end)
hs.hotkey.bind({"cmd"}, "2", function()
  launchOrHide("Atom", "Atom")
end)
hs.hotkey.bind({"cmd"}, "3", function()
  launchOrHide("Google Chrome", "Google Chrome")
end)
hs.hotkey.bind({"cmd"}, "4", function()
  launchOrHide("IntelliJ IDEA CE", "IntelliJ IDEA")
end)
