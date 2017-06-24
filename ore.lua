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

minetest.register_node("prismavation:antiore", {
  description = "Anti Prisma Ore",
  tiles = {"antiprismaore.png"},
  drop = "prismavation:antigem",
  groups={cracky=1}
})
