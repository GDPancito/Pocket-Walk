extends Node

@export var GAME_OVER_WAIT_TIME = 3
var points = 0


func _ready():
	$World/Corn.point_earned.connect(self._point)
	$World/Player.stamina_changed.connect(
		$HUD._on_Player_stamina_changed)
	$World/Player.player_hit.connect(self._player_hit)

# TODO: toggle pause

func _player_hit():
	$HUD.game_over()
	$MusicPlayer.stop()
	$EffectsPlayer.play()
	await get_tree().create_timer(GAME_OVER_WAIT_TIME).timeout
	get_tree().change_scene_to_file("res://gui/menu/main_menu.tscn")


func _point():
	points += 1
	$HUD.update_points(points)
