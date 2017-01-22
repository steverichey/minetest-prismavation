local modpath = minetest.get_modpath(minetest.get_current_modname())
local worldpath = minetest.get_worldpath()

dofile(modpath.."/claw.lua")
dofile(modpath.."/virus.lua")
dofile(modpath.."/armor.lua")
dofile(modpath.."/Gem.lua")

minetest.register_node("prismavation:cage",{
	description = "Prisma Cage",
	tiles = {"prisma_cage.png"},
 	drop = "prismavation:gem",
	groups = {cracky=1},
	light_source = LIGHT_MAX
})

minetest.register_node("prismavation:dimension", {
	description = "Prisma Dimension Block",
	tiles = {"prisma_dimension.png"},
	groups = {cracky = 1, level = 2},
	drop = "prismavation:dimension",
	-- sounds = default.node_sound_stone_defaults(),
	on_dig = function(pos, node, digger)
			minetest.node_dig(pos, node, digger)
		end
})

minetest.register_craftitem("prismavation:item",{
	description = "Item.name(/())",
	inventory_image = "prisma_item.png"
})

minetest.register_node("prismavation:ore", {
	description = "Prisma Ore",
	tiles = {"prisma_ore.png"},
	drop = "prismavation:gem",
	groups={cracky=1}
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "prismavation:ore",
	wherein        = "default:stone",
	clust_scarcity = 32*32*32,
	clust_num_ores = 10,
	clust_size     = 3,
	height_min     = -100,
	height_max     = -20,
})

minetest.register_node("prismavation:tnt",{
	description = "Prisma tnt",
	tiles = {"prisma_tnt.png"},
	drop = "prismavation:bomb",
	groups={cracky=1},
	on_punch = function(pos, node, puncher)
		radius = 3

		minetest.add_particlespawner({
			amount = 64000,
			time = 3.9,
			minpos = vector.subtract(pos, radius / 2),
			maxpos = vector.add(pos, radius / 2),
			minvel = {x=-20, y=-20, z=-20},
			maxvel = {x=20,  y=20,  z=20},
			minacc = vector.new(),
			maxacc = vector.new(),
			minexptime = 1,
			maxexptime = 3,
			minsize = 8,
			maxsize = 16,
			texture = "prismavation_boom.png",
		})

		minetest.add_particlespawner({
			amount = 640,
			time = 1.0,
			minpos = vector.subtract(pos, radius / 2),
			maxpos = vector.add(pos, radius / 2),
			minvel = {x=-200, y=-200, z=-200},
			maxvel = {x=-20,  y=-20,  z=-20},
			minacc = vector.new(),
			maxacc = vector.new(),
			minexptime = 1,
			maxexptime = 3,
			minsize = 8,
			maxsize = 16,
			texture = "smpoke.png",
		})
	end
})

minetest.register_tool("prismavation:bomb", {
	description = "Prismavation Bomb",
	inventory_image = "Prisma_bomb.png",
	on_use = function(itemstack, user, pointed_thing)
		local pos = pointed_thing.under
		node = minetest.set_node(pos, {name="tnt:tnt_burning"})

	end
})

minetest.register_tool("prismavation:potion", {
	description = "Danger",
	inventory_image = "spootf.png",
	on_use = function(itemstack, user, point_thing)
		--if user != null then
			user:set_sky("purple", "plain")
		--end
	end
})

minetest.register_tool("prismavation:axe", {
	description = "Prisma axe is the only thing that can break prisma virus. /hint",
	inventory_image = "prisma_axe.png",
	on_use = function(itemstack, user, pointed_thing)
		if pointed_thing.type ~= "node" then
			return
		end

		local pos = pointed_thing.under

		if minetest.is_protected(pos, user:get_player_name()) then
			minetest.record_protection_violation(pos, user:get_player_name())
			return
		end

		local node = minetest.get_node(pos)

		if node.name == "prismavation:virus" then
			minetest.remove_node(pos)
			foundMoreBlocks = true

			while foundMoreBlocks do
				pos = minetest.find_node_near(pos, 16, "prismavation:virus")

				if pos then
					minetest.remove_node(pos)
				else
					foundMoreBlocks = false
				end
			end
		end

		return itemstack
	end,
	on_place = function(itemstack, user, pointed_thing)
		-- screwdriver_handler(itemstack, user, pointed_thing, screwdriver.ROTATE_AXIS)
		return itemstack
	end,
})

minetest.register_craft({
	output = "prismavation:potion",
	recipe = {
		{"","shields:shield_admin",""},
		{"shields:shield_admin","prismavation:virus","shields:shield_admin"},
		{"","shields:shield_admin",""}
	}
})

minetest.register_craft({
	output = "prismavation:axe",
	recipe = {
		{"prismavation:gem", "prismavation:gem", ""},
		{"default:stick", "prismavation:gem", ""},
		{"default:stick", "", ""}
	}
})

minetest.register_craft({
	output = "prismavation:cage",
	recipe = {
		{"prismavation:virus", "prismavation:gem", "prismavation:bomb"},
		{"prismavation:gem", "shields:shield_admin", "prismavation:gem"},
		{"prismavation:gem", "prismavation:virus", "prismavation:gem"}
	}
})

minetest.register_craft({
	output = "prismavation:item",
	recipe = {
		{"prismavation:gem", "prismavation:gem", "prismavation:gem"},
		{"prismavation:gem", "prismavation:gem", "prismavation:gem"},
		{"", "prismavation:gem", ""},
	}
})

minetest.register_craft({
	output = "prismavation:bomb",
	recipe = {
{"tnt:tnt","tnt:tnt","tnt:tnt"},
{"tnt:tnt","tnt:gunpowder","tnt:tnt"},
		{"prismavation:virus","tnt:tnt","prismavation:virus"}
	}
})

minetest.register_craft({
	output = "prismavation:dimension",
	recipe = {
		{"dye:red","prismavation:bomb","dye:red"},
		{"default:gold_ingot","default:gold_lump","default:gold_ingot"},
		{"","default:stick",""}
	}
})

if minetest.setting_getbool("log_mods") then
	minetest.log("action", "Carbone: [prismavation] loaded.")
end

minetest.register_tool("prismavation:pill", {
	description = "Prisma Pill",
	inventory_image = "prisma.pill.png"
})

minetest.register_craft({
	output = "prismavation:pill",
	recipe = {
		{"prismavation:virus","","prismavation:gem"},
		{"","prismavation:cage",""},
		{"prismavation:gem","","prismavation:virus"}
	}
})

minetest.register_tool("prismavation:SuperSword" , {
	description = "Prisma Sword",
	inventory_image = "prismaBlade.png",
	tool_capabilities = {
		full_punch_interval = 20,
		max_drop_level=15,
		groupcaps={
			snappy={times={[25]=16.9,  [5]=5.50}, uses=5000, maxlevel=55}
		},
		damage_groups = {fleshy=15}
	}
})

minetest.register_tool("prismavation:SuperPick", {
	description = "Prisma Pickaxe",
	inventory_image = "prisma.piclk",
	tool_capabilities = {
		full_punch_interval = 15,
		max_drop_level=10,
		groupcaps={
			snappy={times={[20]=11.9, [0]=0.50}, uses=4995, maxlevel=55}
		},
	}
})
