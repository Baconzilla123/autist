
print("Checking For Updates...")
shell.run("../update.lua")

local context = require "artist"()

-- Feel free to include custom modules here:
if peripheral.find("monitor") ~= nil then
    context:require "display"
end

context.config:save()

context:run()
