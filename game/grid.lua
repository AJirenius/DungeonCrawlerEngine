local M = {}

local dir_views = {
	{
		{-2,4},{-1,4},{0,4},{1,4},{2,4},
		{-2,3},{-1,3},{0,3},{1,3},{2,3},
		{-2,2},{-1,2},{0,2},{1,2},{2,2},
		{-1,1},{0,1},{1,1},
		{-1,0},{1,0},
	},
	{
		{4,2},{4,1},{4,0},{4,-1},{4,-2},
		{3,2},{3,1},{3,0},{3,-1},{3,-2},
		{2,2},{2,1},{2,0},{2,-1},{2,-2},
		{1,1},{1,0},{1,-1},
		{0,1},{0,-1},
	},
	{
		{2,-4},{1,-4},{0,-4},{-1,-4},{-2,-4},
		{2,-3},{1,-3},{0,-3},{-1,-3},{-2,-3},
		{2,-2},{1,-2},{0,-2},{-1,-2},{-2,-2},
		{1,-1},{0,-1},{-1,-1},
		{1,0},{-1,0},
	},
	{
		{-4,-2},{-4,-1},{-4,0},{-4,1},{-4,2},
		{-3,-2},{-3,-1},{-3,0},{-3,1},{-3,2},
		{-2,-2},{-2,-1},{-2,0},{-2,1},{-2,2},
		{-1,-1},{-1,0},{-1,1},
		{0,-1},{0,1},
	},
}
local url
function M.create(map_url)
	local start_x, start_y, map_width, map_height = tilemap.get_bounds(map_url)
	url = map_url
	M.grid = {}
	
	for x = 1, map_width do
		local column = {}
		for y = 1, map_height do
			local tile = tilemap.get_tile(map_url, "layer1", x, y)
			local slot = {
				grid_pos = vmath.vector3(x,y,0),
				is_wall = false
			}
			if tile == 1 then slot.is_wall = true end
			table.insert(column, slot)
		end
		table.insert(M.grid, column)
	end
end


function M.set_minimap(pos, val)
	local start_x, start_y, map_width, map_height = tilemap.get_bounds(url)
	tilemap.set_tile(url, "layer1", pos.x, pos.y, val)
end

function M.is_walkable(pos) 
	local s = M.grid[pos.x][pos.y]
	if s.is_wall then return false end
	return true
end

function M.get_view(pos, direction)
	local view = {}
	local dir = dir_views[direction]
	local column
	local slot
	for i,v in ipairs(dir) do
		--wall = 0
		column = M.grid[pos.x+v[1]]
		slot = M.grid[1][1]
		if column then 
			slot = column[pos.y+v[2]]
			if slot == nil then slot = M.grid[1][1] end --if slot and slot.is_wall == true then wall = 1 end 
		end
		table.insert(view, slot)
	end
	return view
end

return M