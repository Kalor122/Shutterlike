extends CharacterBody2D
class_name Entity

signal effect_gained(what: EntityEffectData)

func take_damage(health: BigNumber, ammount: BigNumber, entity_effects: Array[EntityEffectData]):
	if not health.is_less_than_or_equal_to(ammount):
		health.minus_equals(ammount)
		GlobalSignals.entity_damaged.emit(self, ammount)
	else:
		health.minus_equals(health)
		GlobalSignals.entity_damaged.emit(self, ammount)
	
	var effect_exist = false
	
	if entity_effects.size() > 0:
		for i in entity_effects:
			for x in get_children():
				if x is EntityEffect:
					if x.data.effect_id == i.effect_id:
						effect_exist = true
						break
					else:
						effect_exist = false
			if effect_exist == false:
				add_child(load(i.scene_path).instantiate())
			effect_gained.emit(i)
			
