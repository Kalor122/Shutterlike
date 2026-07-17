extends Node

signal recalculate_stats
signal after_recalculate

signal enemy_spawned(who: EnemyEntity)
signal enemy_killed(who: EnemyEntity)
signal enemy_hit(who: EnemyEntity, parent: Node2D)

signal round_start
signal round_end

signal time_passed(time: int)

signal thing_bought(what)
signal cant_afford(what)

signal wi_weapon_grabbed(what: WeaponData)
signal wi_weapon_dropped(what: WeaponData, slot: int, target_slot: int)
