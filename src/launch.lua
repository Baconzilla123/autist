local context = require "artist"()

-- Feel free to include custom modules here:
if peripheral.find("monitor")[1] ~= nil then
    context:require "display"
end

context.config:save()

context:run()
