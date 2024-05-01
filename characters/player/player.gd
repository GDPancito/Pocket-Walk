extends CharacterBody2D

signal player_hit
signal stamina_changed(stamina, max_stamina)

var speed : int = 120 # Actual speed
@export var normal_speed : int = 120
@export var running_speed : int = 200
var direction = Vector2.ZERO

@export var max_stamina = 30
var stamina = 30 # Actual stamina


func _ready():
	$RegenerateStaminaTimer.start()


func _unhandled_input(_event):
	if not Input.is_action_pressed("run") or stamina <= 0:
		speed = normal_speed
	else:
		speed = running_speed


func _play_animations():
	if direction.x != 0:
		$AnimatedSprite.animation = "move_right"
		$AnimatedSprite.flip_h = direction.x < 0

	elif direction.y != 0:
		$AnimatedSprite.animation = ("move_down" if direction.y > 0 else "move_up")

	else:
		$AnimatedSprite.play("idle")


func _process(_delta):
	velocity = Vector2.ZERO
	
	# obtener dirección normalizada del movimiento
	direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	direction = direction.normalized()
	
	# mover
	if direction:
		velocity.x = direction.x * speed
		velocity.y = direction.y * speed
	else:
		velocity.x = -direction.x * speed
		velocity.y = -direction.y * speed
	
	_play_animations()
	move_and_slide()


func _on_regenerate_stamina():
	if not Input.is_action_pressed("run") and stamina < max_stamina:
		stamina += 1
		stamina_changed.emit(stamina, max_stamina)

	elif Input.is_action_pressed("run") and stamina > 0:
		stamina -= 1
		stamina_changed.emit(stamina, max_stamina)


func hit():
	set_process(false)
	$RegenerateStaminaTimer.stop()
	$AnimatedSprite.play("die")
	player_hit.emit()
