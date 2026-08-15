extends Marker2D

func _shoot(bullet: PackedScene, exit: Node2D, damage: BigNumber):
	var instance = bullet.instantiate()
	if instance is BulletEntity:
		instance.global_position = exit.global_position
		instance.global_rotation = exit.global_rotation
		instance.direction = instance.direction.rotated(exit.global_rotation)
		instance.parent = self
		get_tree().current_scene.add_child(instance)
		instance.damage.exponent = 0
		instance.damage.mantissa = 0
		instance.damage.plus_equals(damage)
