if arg[2] == "debug" then
    require("lldebugger").start()
end

-- print("Hello World")

os.execute("odin build . -out:crawling_chaos.exe -o:speed")

os.execute("odin run .")
--[[
TODO Write build script to replace powershell script
]]
