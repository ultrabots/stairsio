-- Minetest 0.4 mod: stairsio
-- See README.txt for licensing and other information.

stairsio = {}

-- Node will be called stairsio:stairi_<subname>
function stairsio.register_stairi(subname, recipeitem, groups, images, description, sounds)
	minetest.register_node(":stairsio:stairi_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
                {-0.5, 0.5, -0.5, 0, 0, 0},
			},
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local param2 = 0

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {
					x = p1.x - placer_pos.x,
					y = p1.y - placer_pos.y,
					z = p1.z - placer_pos.z
				}
				param2 = minetest.dir_to_facedir(dir)
			end

			if p0.y-1 == p1.y then
				param2 = param2 + 20
				if param2 == 21 then
					param2 = 23
				elseif param2 == 23 then
					param2 = 21
				end
			end

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
		end,
	})

	minetest.register_craft({
		output = 'stairsio:stairi_' .. subname .. ' 6',
		recipe = {
			{recipeitem, "", ""},
			{recipeitem, "default:torch", ""},
			{recipeitem, recipeitem, recipeitem},
		},
	})

	-- Flipped recipe for the silly minecrafters
	minetest.register_craft({
		output = 'stairsio:stairi_' .. subname .. ' 6',
		recipe = {
			{"", "", recipeitem},
			{"", "default:torch", recipeitem},
			{recipeitem, recipeitem, recipeitem},
		},
	})
end

-- this is area for outer
-- Node will be called stairsio:stairo_<subname>
function stairsio.register_stairo(subname, recipeitem, groups, images, description, sounds)
	minetest.register_node(":stairsio:stairo_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{0, 0, 0, 0.5, 0.5, 0.5},
			},
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local param2 = 0

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {
					x = p1.x - placer_pos.x,
					y = p1.y - placer_pos.y,
					z = p1.z - placer_pos.z
				}
				param2 = minetest.dir_to_facedir(dir)
			end

			if p0.y-1 == p1.y then
				param2 = param2 + 20
				if param2 == 21 then
					param2 = 23
				elseif param2 == 23 then
					param2 = 21
				end
			end

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
		end,
	})

	minetest.register_craft({
		output = 'stairsio:stairo_' .. subname .. ' 6',
		recipe = {
			{"", "", ""},
			{recipeitem, "default:torch", ""},
			{recipeitem, recipeitem, recipeitem},
		},
	})

	-- Flipped recipe for the silly minecrafters
	minetest.register_craft({
		output = 'stairsio:stairo_' .. subname .. ' 6',
		recipe = {
			{"", "", ""},
			{"", "default:torch", recipeitem},
			{recipeitem, recipeitem, recipeitem},
		},
	})
end

--

-- Nodes will be called stairsio:{stairi,stairo}_<subname>
function stairsio.register_stairsio(subname, recipeitem, groups, images, desc_stairi, desc_stairo, sounds)
	stairsio.register_stairi(subname, recipeitem, groups, images, desc_stairi, sounds)
	stairsio.register_stairo(subname, recipeitem, groups, images, desc_stairo, sounds)
end

stairsio.register_stairsio("wood", "default:wood",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"default_wood.png"},
		"Wooden Inner Corner",
		"Wooden Outer Corner",
		default.node_sound_wood_defaults())

stairsio.register_stairsio("stone", "default:stone",
		{cracky=3},
		{"default_stone.png"},
		"Stone Inner Corner",
		"Stone Outer Corner",
		default.node_sound_stone_defaults())

stairsio.register_stairsio("cobble", "default:cobble",
		{cracky=3},
		{"default_cobble.png"},
		"Cobblestone Inner Corner",
		"Cobblestone Outer Corner",
		default.node_sound_stone_defaults())

stairsio.register_stairsio("desert_stone", "default:desert_stone",
		{cracky=3},
		{"default_desert_stone.png"},
		"Desertstone Inner Corner",
		"Desertstone Outer Corner",
		default.node_sound_stone_defaults())

stairsio.register_stairsio("desert_cobble", "default:desert_cobble",
		{cracky=3},
		{"default_desert_cobble.png"},
		"Desert Cobblestone Inner Corner",
		"Desert Cobblestone Outer Corner",
		default.node_sound_stone_defaults())

stairsio.register_stairsio("desert_stonebrick", "default:desert_stonebrick",
		{cracky=3},
		{"default_desert_stone_brick.png"},
		"Desert Stone Brick Inner Corner",
		"Desert Stone Brick Outer Corner",
		default.node_sound_stone_defaults())

stairsio.register_stairsio("brick", "default:brick",
		{cracky=3},
		{"default_brick.png"},
		"Brick Inner Corner",
		"Brick Outer Corner",
		default.node_sound_stone_defaults())

stairsio.register_stairsio("sandstone", "default:sandstone",
		{crumbly=2,cracky=2},
		{"default_sandstone.png"},
		"Sandstone Inner Corner",
		"Sandstone Outer Corner",
		default.node_sound_stone_defaults())
		
stairsio.register_stairsio("sandstonebrick", "default:sandstonebrick",
		{crumbly=2,cracky=2},
		{"default_sandstone_brick.png"},
		"Sandstone Inner Corner",
		"Sandstone Brick Outer Corner",
		default.node_sound_stone_defaults())

stairsio.register_stairsio("junglewood", "default:junglewood",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"default_junglewood.png"},
		"Junglewood Inner Corner",
		"Junglewood Outer Corner",
		default.node_sound_wood_defaults())

stairsio.register_stairsio("stonebrick", "default:stonebrick",
		{cracky=3},
		{"default_stone_brick.png"},
		"Stone Brick Inner Corner",
		"Stone Brick Outer Corner",
		default.node_sound_stone_defaults())

stairsio.register_stairsio("pinewood", "default:pinewood",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"default_pinewood.png"},
		"Pinewood Inner Corner",
		"Pinewood Outer Corner",
		default.node_sound_wood_defaults())

stairsio.register_stairsio("obsidian", "default:obsidian",
		{cracky=1,level=2},
		{"default_obsidian.png"},
		"Obsidian Inner Corner",
		"Obsidian Outer Corner",
		default.node_sound_stone_defaults())

stairsio.register_stairsio("obsidianbrick", "default:obsidianbrick",
		{cracky=1,level=2},
		{"default_obsidian_brick.png"},
		"Obsidian Brick Inner Corner",
		"Obsidian Brick Outer Corner",
		default.node_sound_stone_defaults())

-- add support for mods; quartz
if( minetest.registered_nodes["quartz:block" ]) then
    stairsio.register_stairsio("quartzblock", "quartz:block",
		{cracky=3, oddly_breakable_by_hand=1},
		{"quartz_block.png"},
		"Quartz Inner Corner",
		"Quartz Outer Corner",
		default.node_sound_glass_defaults())
end
