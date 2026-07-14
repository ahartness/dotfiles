local function read_trim(path)
	local f = io.open(path, "r")
	if not f then
		return nil
	end
	local s = f:read("*a")
	f:close()
	return (s and s:match("^%s*(.-)%s*$")) or nil
end

local model = read_trim("/sys/class/dmi/id/product_name") or "unknown"
local make = read_trim("/sys/class/dmi/id/sys_vendor") or "unknown"

print("Detected machine: " .. make .. " " .. model)
