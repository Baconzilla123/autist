function wait(seconds) local start = os.time() repeat until os.time() > start + seconds end

print("Checking For Updates...")

local req, err = http.get("https://raw.githubusercontent.com/baconzilla123/autist/HEAD/version.txt")
if not req then 
    error("Version Fetch failed: " .. err, 0) 
else
    local file = fs.open(".artist.d/version.txt", "r")
    local version = file.readLine()
    local target = req.readAll()

    print("Online Version:" ..target)

    if version ~= target then
        print("Version "..version.." Does not match "..target, 0)

        shell.run("wget run https://raw.githubusercontent.com/baconzilla123/autist/HEAD/installer.lua")
        print(" ")
        print("Updated! \n")
    else
        print("Version "..version.." Does match "..target, 0)
    end
    --file.write(req.readAll())
end

req.close()

--wait(4)

local context = require "artist"()

-- Feel free to include custom modules here:
if peripheral.find("monitor") ~= nil then
    context:require "display"
end

context.config:save()

context:run()
