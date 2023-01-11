Scriptname wb_thrummingstone_quest_script extends Quest

wb_thrummingstone_spawner_script[] property stone_slots auto

int stone_index = 0

int Function AddStone(wb_thrummingstone_spawner_script stone)
	int index = stone_index
	wb_thrummingstone_spawner_script last_stone = stone_slots[index]
	
	if last_stone
		last_stone.StopEffect()
	endif
	
	stone_slots[index] = stone
	stone_index = (stone_index + 1) % stone_slots.length
	
	return index
endFunction
