function wait(seconds) local start = os.time() repeat until os.time() > start + seconds end

print("Checking For Updates...")
shell.run("wget run https://raw.githubusercontent.com/baconzilla123/autist/HEAD/installer.lua")

wait(4)

local context = require "artist"()

-- Feel free to include custom modules here:
if peripheral.find("monitor") ~= nil then
    context:require "display"
end

context.config:save()

context:run()
