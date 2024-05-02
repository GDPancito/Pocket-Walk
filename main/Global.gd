extends Node


const SETTINGS_PATH = "user://preferences.cfg"
var axis = Vector2.ZERO
var config = ConfigFile.new()


func get_axis() -> Vector2:
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return axis.normalized()


func load_settings():
	if not FileAccess.file_exists(SETTINGS_PATH):
		var f = FileAccess.open(SETTINGS_PATH, FileAccess.WRITE)
		f.close()
	
	var err = config.load(SETTINGS_PATH)
	if err != OK:
		return

	_reload_settings()


func _reload_settings():
	TranslationServer.set_locale(config.get_value("game","lang",OS.get_locale()))


func set_setting(section, key, value):
	config.set_value(section, key, value)
	config.save(SETTINGS_PATH)
	_reload_settings()
