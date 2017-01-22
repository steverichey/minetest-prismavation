minetest.register_tool("prismavation:helmet_prisma", {
	description = "Prisma Helmet",
	inventory_image = "prisma_helmet_inv.png",
	groups = {
		armor_head = 5,
		armor_heal = 0,
		armor_use = 2000
	},
	wear = 0,
})

minetest.register_tool("prismavation:chestplate_prisma", {
	description = "Prisma Chestplate",
	inventory_image = "prisma_chestplate_inv.png",
	groups = {
		armor_torso = 10,
		armor_heal = 0,
		armor_use = 2000
	},
	wear = 0,
})

minetest.register_tool("prismavation:leggings_prisma", {
	description = "Prisma Leggings",
	inventory_image = "prisma_leggings_inv.png",
	groups = {
		armor_legs = 5,
		armor_heal = 0,
		armor_use = 2000
	},
	wear = 0,
})

minetest.register_tool("prismavation:boots_prisma", {
	description = "Prisma Boots",
	inventory_image = "prisma_boots_inv.png",
	groups = {
		armor_feet = 5,
		armor_heal = 0,
		armor_use = 2000
	},
	wear = 0,
})

minetest.register_craft({
	output = "prismavation:helmet_prisma",
	recipe = {
		{"prismavation:gem", "prismavation:gem", "prismavation:gem"},
		{"prismavation:gem", "", "prismavation:gem"},
		{"", "", ""},
	},
})

minetest.register_craft({
	output = "prismavation:chestplate_prisma",
	recipe = {
		{"prismavation:gem", "", "prismavation:gem"},
		{"prismavation:gem", "prismavation:gem", "prismavation:gem"},
		{"prismavation:gem", "prismavation:gem", "prismavation:gem"},
	},
})

minetest.register_craft({
	output = "prismavation:leggings_prisma",
	recipe = {
		{"prismavation:gem", "prismavation:gem", "prismavation:gem"},
		{"prismavation:gem", "", "prismavation:gem"},
		{"prismavation:gem", "", "prismavation:gem"},
	},
})

minetest.register_craft({
	output = "prismavation:boots_prisma",
	recipe = {
		{"prismavation:gem", "", "prismavation:gem"},
		{"prismavation:gem", "", "prismavation:gem"},
	},
})
