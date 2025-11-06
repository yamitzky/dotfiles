function pressKey(modifier, key)
  hs.eventtap.event.newKeyEvent(modifier, key, true):post()
  hs.timer.usleep(100)
  hs.eventtap.event.newKeyEvent(modifier, key, false):post()
end

function launchOrHide(...)
  bundleIDs = {...}
  app = hs.application.frontmostApplication()
  for _, bundleID in pairs(bundleIDs) do
    if app:bundleID() == bundleID then
      app:hide()
      return
    end
  end
  for _, bundleID in pairs(bundleIDs) do
    for _, app in pairs(hs.application.runningApplications()) do
      if app:bundleID() == bundleID then
        app:activate()
        return
      end
    end
  end
  hs.application.launchOrFocusByBundleID(bundleID)
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
  launchOrHide("com.mitchellh.ghostty")
end)
hs.hotkey.bind({"cmd"}, "2", function()
  launchOrHide("com.todesktop.230313mzl4w4u92", "com.microsoft.VSCode")
end)
hs.hotkey.bind({"cmd"}, "3", function()
  launchOrHide("com.google.Chrome", "com.openai.atlas", "ai.perplexity.comet", "com.google.Chrome.canary")
end)
hs.hotkey.bind({"cmd"}, "4", function()
  launchOrHide("notion.id")
end)
hs.hotkey.bind({"cmd"}, "5", function()
  launchOrHide("com.tinyspeck.slackmacgap")
end)

hs.hotkey.bind({"cmd", "alt", "shift"}, "X", function()
  pressKey({"cmd"}, "l")
  pressKey({"cmd"}, "c")
end)
