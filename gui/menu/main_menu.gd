extends Control


func _ready():
	Global.load_settings()
	$StartButton.grab_focus()
	
	var points = Global.config.get_value("game", "points", 0)
	if points > 0:
		$HighScoreLabel.show()
		$HighScoreLabel.text = tr("HIGH_SCORE") + str(points)


func _on_button_pressed():
	get_tree().change_scene_to_file("res://main/main.tscn")


func _on_settings_button_pressed():
	get_tree().change_scene_to_file("res://gui/settings_menu/settings_menu.tscn")


func _on_about_button_pressed():
	get_tree().change_scene_to_file("res://gui/about_menu/about_menu.tscn")
