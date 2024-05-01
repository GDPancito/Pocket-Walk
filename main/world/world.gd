extends Node2D

const Enemy = preload("res://characters/enemy/enemy.tscn")
const ENEMY_SPAWN_POSITION = Vector2(90, 90)
const CORN_SPAWN_ZONE = {
	"from_width": 90,
	"from_height": 90,
	"to_width": 700,
	"to_height": 520
}


func _ready():
	# para no interrumpir el flujo de ejecución
	call_deferred("_spawn_enemy_when_point_earned")


func _spawn_enemy_when_point_earned():
	await $Corn.point_earned

	var enemy = Enemy.instantiate()
	enemy.position = ENEMY_SPAWN_POSITION
	enemy.player = $Player
	call_deferred("add_child", enemy)


func spawn_corn():
	$Corn.position = _get_random_spawn_position()


func _get_random_spawn_position():
	var x = randi_range(
		CORN_SPAWN_ZONE["from_width"],
		CORN_SPAWN_ZONE["to_width"]
	)
	
	var y = randi_range(
		CORN_SPAWN_ZONE["from_height"],
		CORN_SPAWN_ZONE["to_height"]
	)
	
	return Vector2(x, y)
