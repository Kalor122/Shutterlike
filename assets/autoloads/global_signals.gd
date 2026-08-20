extends Node

signal recalculate_stats
signal after_recalculate

signal game_over

signal player_take_damage(ammont: float, who: Node2D)

signal enemy_spawned(who: EnemyEntity)
signal enemy_killed(who: EnemyEntity)
signal enemy_hit(who: EnemyEntity, parent: Node2D, damage: BigNumber)
signal entity_damaged(who: EnemyEntity, damage: BigNumber)

signal round_start
signal round_end

signal time_passed(time: int)

signal thing_bought(what)
signal cant_afford(what)

signal wi_weapon_grabbed(what: WeaponData)
signal wi_weapon_dropped(what: WeaponData, slot: int, target_slot: int)
signal sell_weapon(w_slot: int)
