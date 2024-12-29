local merge = require("lib").merge

data:extend({
	merge(data.raw["lightning-attractor"]["lightning-rod"], {
		type = "accumulator",
		name = "charging-rod",
		minable = { mining_time = 0.1, result = "charging-rod" },
		collision_box = { { -0.65, -0.85 }, { 0.65, 0.85 } },
		selection_box = { { -0.9, -1 }, { 0.9, 1 } },
		-- range_elongation = 0,
		factoriopedia_simulation = "nil",
		energy_source = {
			type = "electric",
			usage_priority = "tertiary",
			buffer_capacity = "12MJ", -- from 5MJ
			input_flow_limit = "500kW",
			output_flow_limit = "500kW",
		},
		chargable_graphics = merge(data.raw["lightning-attractor"]["lightning-rod"].chargable_graphics, {
			discharge_animation = {
				layers = {
					util.sprite_load("__Cerys-Moon-of-Fulgora__/graphics/entity/charging-rod/charging-rod-discharge", {
						priority = "high",
						blend_mode = "additive",
						scale = 0.75,
						frame_count = 24,
						draw_as_glow = true,
					}),
				},
			},
			charge_animation = {
				layers = {
					util.sprite_load("__Cerys-Moon-of-Fulgora__/graphics/entity/charging-rod/charging-rod-charge", {
						priority = "high",
						blend_mode = "additive",
						scale = 0.75,
						frame_count = 24,
						draw_as_glow = true,
					}),
				},
			},
			picture = {
				layers = {
					util.sprite_load("__Cerys-Moon-of-Fulgora__/graphics/entity/charging-rod/charging-rod", {
						priority = "high",
						scale = 0.75,
					}),
					util.sprite_load("__Cerys-Moon-of-Fulgora__/graphics/entity/charging-rod/charging-rod-shadow", {
						priority = "high",
						draw_as_shadow = true,
						scale = 0.75,
					}),
				},
			},
			charge_animation_is_looped = true,
		}),
		surface_conditions = {
			{ property = "magnetic-field", min = 120, max = 120 }, -- Don't allow scripts to run on other surfaces
		},
		working_sound = {
			main_sounds = {
				{
					sound = {
						filename = "__base__/sound/accumulator-working.ogg",
						volume = 0.9,
					},
					match_volume_to_activity = true,
					activity_to_volume_modifiers = { offset = 2, inverted = true },
					fade_in_ticks = 4,
					fade_out_ticks = 20,
				},
				{
					sound = {
						filename = "__base__/sound/accumulator-discharging.ogg",
						volume = 0.9,
					},
					match_volume_to_activity = true,
					activity_to_volume_modifiers = { offset = 1 },
					fade_in_ticks = 4,
					fade_out_ticks = 20,
				},
			},
		},
		icon = "__Cerys-Moon-of-Fulgora__/graphics/icons/charging-rod.png",
	}),


	{
		type = "corpse",
		name = "charging-rod-remnants",
		icon = "__Cerys-Moon-of-Fulgora__/graphics/icons/charging-rod.png",
		flags = { "placeable-neutral", "not-on-map" },
		hidden_in_factoriopedia = true,
		subgroup = "environmental-protection-remnants",
		order = "a-k-a",
		selection_box = { { -0.9, -1 }, { 0.9, 1 } },
		tile_width = 2,
		tile_height = 2,
		expires = false,
		animation = util.sprite_load("__Cerys-Moon-of-Fulgora__/graphics/entity/charging-rod/charging-rod-remnants",
			{
				direction_count = 1,
				scale = 0.75
			}
		)
	},

	merge(data.raw["lamp"]["small-lamp"], {
		name = "charging-rod-lamp",
		minable = nil,
		hidden_in_factoriopedia = true,
		next_upgrade = nil,
		flags = { "not-blueprintable", "not-deconstructable", "placeable-off-grid", "not-on-map" },
		selectable_in_game = false,
		collision_box = { { 0, 0 }, { 0, 0 } },
		selection_box = { { 0, 0 }, { 0, 0 } },
		collision_mask = { layers = {} },
		picture_off = {
			filename = "__core__/graphics/empty.png",
			priority = "high",
			width = 1,
			height = 1,
			frame_count = 1,
			axially_symmetrical = false,
			direction_count = 1,
		},
		picture_on = {
			filename = "__core__/graphics/empty.png",
			priority = "high",
			width = 1,
			height = 1,
			frame_count = 1,
			axially_symmetrical = false,
			direction_count = 1,
		},
		light = { intensity = 0.4, size = 50, color = { r = 0.5, g = 0.5, b = 1 } },
		light_when_colored = { intensity = 0.5, size = 50 * 0.15, color = { r = 0.5, g = 0.5, b = 1 } },
		energy_usage_per_tick = "1kW",
		always_on = true,
	}),
})
