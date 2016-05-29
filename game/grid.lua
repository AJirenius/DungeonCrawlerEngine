local M = {}

function M.create(map_url)
	local start_x, start_y, map_width, map_height = tilemap.get_bounds(map_url)
	
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


return M