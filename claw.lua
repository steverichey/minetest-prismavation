minetest.register_tool("prismavation:claw", {
	description = "Prisma Claw",
	inventory_image="Claw.png",
	on_use = function(itemstack, user, pointed_thing)

	end
})

minetest.register_craft({
	output = "prismavation:claw",
	recipe = {
		{"","",""},
		{"","",""},
		{"","",""}
	}
})
