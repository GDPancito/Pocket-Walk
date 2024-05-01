extends CharacterBody2D

const Player = preload("res://characters/player/player.gd")

var movement_speed: float = 130.0
var movement_target_position: Vector2 = Vector2(300.0, 0.0)

@export var player: Player
@onready var navigation_agent: NavigationAgent2D = $NaviAgent


func _ready():
	# These values need to be adjusted for the actor's speed
	# and the navigation layout.
	navigation_agent.path_desired_distance = 4.0
	navigation_agent.target_desired_distance = 4.0

	# Make sure to not await during _ready.
	call_deferred("actor_setup")


func _process(_delta):
	# Cambiar el objetivo del enemigo a la ubicación del jugador
	set_movement_target(player.position)


func actor_setup():
	# Wait for the first physics frame so the NavigationServer can sync.
	await get_tree().physics_frame

	# Now that the navigation map is no longer empty, set the movement target.
	set_movement_target(movement_target_position)


func set_movement_target(movement_target: Vector2):
	navigation_agent.target_position = movement_target


func _physics_process(delta):
	if navigation_agent.is_navigation_finished():
		return

	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 = navigation_agent.get_next_path_position()

	velocity = current_agent_position.direction_to(next_path_position) * movement_speed
	move_and_slide()


func _on_area_2d_body_entered(body):
	if body is Player:
		$Area2D/AreaCollision.set_deferred("disabled", true)
		$Collision.set_deferred("disabled", true)
		hide()
		# El método hit() del jugador muestra la
		# pantalla de game_over y realiza el proceso
		# de muerte por sí mismo, por lo que no hace
		# falta que el enemigo lo haga
		body.hit()
