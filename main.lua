local root = ya.sync(function() return cx.active.current.cwd end)
local function entry()
	local cwd = root()
	local cmd = Command("fd"):arg {"--type", "f", "--changed-within", "5d"}
                             :cwd(tostring(cwd))
	local output, err = cmd:output()
    ya.emit("tab_create", {})
	local id = ya.id("ft")
	local vitual_dir = cwd:into_search("Recent 5d")
	ya.emit("cd", { Url(vitual_dir) })
	ya.emit("update_files", { op = fs.op("part", { id = id, url = Url(vitual_dir), files = {} }) })
	local files = {}
	for path in output.stdout:gmatch("[^\r\n]+") do
		local url = vitual_dir:join(path)
		local cha = fs.cha(url, true)
		if cha then
			files[#files + 1] = File { url = url, cha = cha }
		end
	end
	ya.emit("update_files", { op = fs.op("part", { id = id, url = Url(vitual_dir), files = files }) })
	ya.emit("update_files", { op = fs.op("done", { id = id, url = vitual_dir, cha = Cha { kind = 16 } }) })
end
return { entry = entry }
