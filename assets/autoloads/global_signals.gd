extends Node

signal enemy_spawned(who: EnemyEntity)
signal enemy_killed(who: EnemyEntity)
signal enemy_hit(who: EnemyEntity, parent: Node2D)

signal round_start
signal round_end

signal thing_bought(what)
