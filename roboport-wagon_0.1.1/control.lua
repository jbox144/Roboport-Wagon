script.on_init(function()
	global.robotport_wagon_table = {}
end)

script.on_event(defines.events.on_built_entity, function(event)
	entity = event.created_entity
	if entity.name == "roboport-wagon" then
		entity.grid.put{name="burner-generator", position={0, 0}}
		entity.grid.put{name="personal-roboport-mk2-equipment", position={2, 0}}
		entity.grid.put{name="personal-roboport-mk2-equipment", position={0, 2}}
		entity.grid.put{name="personal-roboport-mk2-equipment", position={2, 2}}
		table.insert(global.robotport_wagon_table, entity)
	end
end)

script.on_nth_tick(60, function(event)
	for x, entity in ipairs(global.robotport_wagon_table) do
		if entity.valid then
			burner_inventory = entity.grid.get({0, 0}).burner.inventory
			wagon_inventory = entity.get_inventory(defines.inventory.cargo_wagon)
			for i = 0, #wagon_inventory - 1 do
				itemstack = wagon_inventory[#wagon_inventory - i]
				if itemstack.valid then
					burner_inventory[1].transfer_stack(itemstack)
				end
			end
		else
			table.remove(global.robotport_wagon_table, x)
		end
	end
end)