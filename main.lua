local root = ya.sync(function() return cx.active.current.cwd end)

local function entry(_, job)
    local range = (job.args and job.args[1]) or "5d"
	local cwd = root()
	local cmd = Command("fd"):arg { "--type", "f", "--changed-within", range }:cwd(tostring(cwd))
	local output, err = cmd:output()

	local id = ya.id("ft")
	local virtual_dir = cwd:into_search("Recent " .. range)
	ya.emit("cd", { Url(virtual_dir) })
	ya.emit("update_files", {
		op = fs.op("part", { id = id, url = Url(virtual_dir), files = {} })
	})

	local files = {}
	for path in output.stdout:gmatch("[^\r\n]+") do
		local url = virtual_dir:join(path)
		local cha = fs.cha(url, true)
		if cha then
			files[#files + 1] = File { url = url, cha = cha }
		end
	end

	ya.emit("update_files", {op = fs.op("part", { id = id, url = Url(virtual_dir), files = files })})
	ya.emit("update_files", {op = fs.op("done", { id = id, url = virtual_dir, cha = Cha { kind = 16 }})})
end

return { entry = entry }
