local lavalamps_list = {
	{ "Red Lava Lamp", "red"},
	{ "Orange Lava Lamp", "orange"},	
	{ "Yellow Lava Lamp", "yellow"},
	{ "Green Lava Lamp", "green"},
	{ "Blue Lava Lamp", "blue"},
	{ "Violet Lava Lamp", "violet"},
}

for i in ipairs(lavalamps_list) do
	local lavalampdesc = lavalamps_list[i][1]
	local colour = lavalamps_list[i][2]

	minetest.register_node("lavalamp:"..colour, {
	    description = lavalampdesc,
	    drawtype = "nodebox",
	    tiles = {
	        "lavalamp_lamp_top.png",
	        "lavalamp_lamp_bottom.png",
	        {
	            name="lavalamp_lamp_anim_"..colour..".png",
	            animation={
	                type="vertical_frames",
	                aspect_w=40,
	                aspect_h=40,
	                length=3.0,
	            },
	        },
	    },    
	    paramtype = "light",
	    paramtype2 = "facedir",
	    node_box = {
	        type = "fixed",
	        fixed = {        
				-- base
	            { -0.1875, -0.5,  -0.1875,  0.1875, -0.3125,  0.1875, },
	            { -0.0625, -0.5,  -0.3125,  0.0625, -0.3125,  -0.1875, },
	            { -0.3125, -0.5,  -0.0625,  -0.1875, -0.3125,  0.0625, },
	            { 0.1875, -0.5,  -0.0625,  0.3125, -0.3125,  0.0625, },
	            { -0.0625, -0.5,  0.1875,  0.0625, -0.3125,  0.3125, },            
	            -- lamp
	            { -0.1875, -0.3125,  -0.0625,  0.1875,  0.5,  0.0625, },
	            { -0.0625,  -0.3125,  -0.1875,  0.0625,  0.5,  -0.0625, },
	            { -0.0625,  -0.3125,  0.0625,  0.0625,  0.5,  0.1875, },	            			
	        },
	    },
	    sunlight_propagates = true,
	    walkable = false,
	    light_source = 14,
	    selection_box = {
	        type = "fixed",
	        fixed = { -0.3125, -0.5, -0.3125, 0.3125,0.5, 0.3125 },
	    },
		groups = {cracky=2,oddly_breakable_by_hand=1},
		on_rightclick = function(pos, node, clicker)
	        node.name = "lavalamp:"..colour.."_off"
	        minetest.env:set_node(pos, node)
	    end,
	})

	minetest.register_node("lavalamp:"..colour.."_off", {
	    description = lavalampdesc.." off",
	    drawtype = "nodebox",
	    tiles = {
	        "lavalamp_lamp_top.png",
	        "lavalamp_lamp_bottom.png",
	        "lavalamp_lamp_off_sides.png",
	    },	    
	    paramtype = "light",
	    paramtype2 = "facedir",
	    node_box = {
	        type = "fixed",
	        fixed = {       
				-- base
	            { -0.1875, -0.5,  -0.1875,  0.1875, -0.3125,  0.1875, },
	            { -0.0625, -0.5,  -0.3125,  0.0625, -0.3125,  -0.1875, },
	            { -0.3125, -0.5,  -0.0625,  -0.1875, -0.3125,  0.0625, },
	            { 0.1875, -0.5,  -0.0625,  0.3125, -0.3125,  0.0625, },
	            { -0.0625, -0.5,  0.1875,  0.0625, -0.3125,  0.3125, },
	            -- lamp
	            { -0.1875, -0.3125,  -0.0625,  0.1875,  0.5,  0.0625, },
	            { -0.0625,  -0.3125,  -0.1875,  0.0625,  0.5,  -0.0625, },
	            { -0.0625,  -0.3125,  0.0625,  0.0625,  0.5,  0.1875, },	            			
	        },
	    },
	    sunlight_propagates = true,
	    walkable = false,
	    selection_box = {
	        type = "fixed",
	        fixed = { -0.3125, -0.5, -0.3125, 0.3125,0.5, 0.3125 },
	    },
		groups = {cracky=2,oddly_breakable_by_hand=1},
	    drop = "lavalamp:"..colour,
		on_rightclick = function(pos, node, clicker)
	        node.name = "lavalamp:"..colour
	        minetest.env:set_node(pos, node)
	    end,
	})

	minetest.register_craft({
		output = "lavalamp:"..colour,
		recipe = {
			{"", "wool:"..colour, "", },
			{"", "bucket:bucket_water", "", },
			{"", "wool:black", "", }
		}
	})
	
end





