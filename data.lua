roboport_wagon = table.deepcopy(data.raw["cargo-wagon"]["cargo-wagon"])
roboport_wagon.equipment_grid = "roboport-wagon-equipment-grid"
roboport_wagon.name = "roboport-wagon"
roboport_wagon.minable = {mining_time = 0.5, result = "roboport-wagon"}

table.insert(data.raw["technology"]["personal-roboport-equipment"].effects, {type = "unlock-recipe", recipe = "roboport-wagon"})

data:extend(
{
	{
		type = "equipment-grid",
		name = "roboport-wagon-equipment-grid",
		width = 4,
		height = 4,
		equipment_categories = {"armor"},
		locked = true
	},
	{
		type = "generator-equipment",
		name = "burner-generator",
		categories = {"armor"},
		energy_source = {
			buffer_capacity = "16MW",
			type = "electric",
			usage_priority = "secondary-output",
		},
		shape = {
			type = "full",
			width = 2,
			height = 2,
		},
		sprite = {
			filename = "__base__/graphics/icons/boiler.png",
			size = 32,
		},
		power = "16MW",
		burner = {
			type = "burner",
			fuel_inventory_size = 1,
		},
	},
	{
		type = "item",
		name = "burner-generator",
		icon = "__base__/graphics/icons/boiler.png",
		icon_size = 32,
		placed_as_equipment_result = "burner-generator",
		subgroup = "equipment",
		order = "a[energy-source]-b[fusion-reactor]",
		stack_size = 20,
	},
	{
		type = "item-with-entity-data",
		name = "roboport-wagon",
		icon = "__base__/graphics/icons/cargo-wagon.png",
		icon_size = 32,
		subgroup = "transport",
		order = "a[train-system]-g[roboport-wagon]",
		place_result = "roboport-wagon",
		stack_size = 5,
	},
	{
		type = "recipe",
		name = "roboport-wagon",
		energy_required = 1,
		enabled = false,
		ingredients =
		{
			{"steel-plate", 45},
			{"iron-gear-wheel", 55},
			{"advanced-circuit", 45},
			{"iron-plate", 20},
		},
		result = "roboport-wagon"
	},
	roboport_wagon,
})
