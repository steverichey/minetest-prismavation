local function isAir(pos)
	local nn = minetest.get_node(pos).name
	return nn == "air"
end

local function isVirus(pos)
	local nn = minetest.get_node(pos).name
	return nn == "prismavation:virus"
end

local function makeVirus(pos)
	if (not pos == nil) then
		if not isVirus(pos) then
			minetest.set_node(pos, {name="prismavation:virus"})
		end
  end
end

minetest.register_node("prismavation:virus", {
	description = "Prismavirus",
	tiles = {"prismablock.png"},
	drop = "",
	groups = {unbreakable = 1, not_in_creative_inventory = 0}, -- For Map Tools' admin pickaxe.
	-- sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "prismavation:virus",
	recipe = {
		{"dye:magenta", "dye:red", "dye:red"},
		{"dye:red", "prismavation:gem", "dye:red"},
		{"dye:red", "dye:red", "dye:grey"}
	}
})

minetest.register_abm({
	nodenames = {"prismavation:virus"},
	light_source = 1,
	interval = 8,
	chance = 10,
	action = function(pos)
		-- up
		makeVirus({x=pos.x, y=pos.y-1, z=pos.z-1})
		makeVirus({x=pos.x-1, y=pos.y-1, z=pos.z-1})
		makeVirus({x=pos.x+1, y=pos.y-1, z=pos.z-1})
		makeVirus({x=pos.x, y=pos.y, z=pos.z-1})
		makeVirus({x=pos.x-1, y=pos.y, z=pos.z-1})
		makeVirus({x=pos.x+1, y=pos.y, z=pos.z-1})
		makeVirus({x=pos.x, y=pos.y+1, z=pos.z-1})
		makeVirus({x=pos.x-1, y=pos.y+1, z=pos.z-1})
		makeVirus({x=pos.x+1, y=pos.y+1, z=pos.z-1})
		-- flat
		makeVirus({x=pos.x, y=pos.y-1, z=pos.z})
		makeVirus({x=pos.x-1, y=pos.y-1, z=pos.z})
		makeVirus({x=pos.x+1, y=pos.y-1, z=pos.z})
		-- makeVirus({x=pos.x, y=pos.y, z=pos.z})
		makeVirus({x=pos.x-1, y=pos.y, z=pos.z})
		makeVirus({x=pos.x+1, y=pos.y, z=pos.z})
		makeVirus({x=pos.x, y=pos.y+1, z=pos.z})
		makeVirus({x=pos.x-1, y=pos.y+1, z=pos.z})
		makeVirus({x=pos.x+1, y=pos.y+1, z=pos.z})
		-- down
		makeVirus({x=pos.x, y=pos.y-1, z=pos.z+1})
		makeVirus({x=pos.x-1, y=pos.y-1, z=pos.z+1})
		makeVirus({x=pos.x+1, y=pos.y-1, z=pos.z+1})
		makeVirus({x=pos.x, y=pos.y, z=pos.z+1})
		makeVirus({x=pos.x-1, y=pos.y, z=pos.z+1})
		makeVirus({x=pos.x+1, y=pos.y, z=pos.z+1})
		makeVirus({x=pos.x, y=pos.y+1, z=pos.z+1})
		makeVirus({x=pos.x-1, y=pos.y+1, z=pos.z+1})
		makeVirus({x=pos.x+1, y=pos.y+1, z=pos.z+1})
	end,
})
