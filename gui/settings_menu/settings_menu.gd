extends Control


func _ready():
	$Button.grab_focus()
	var i = Global.config.get_value("preferences", "lang_index", 0)
	%LangOptionButton.select(i)


# UI
func _on_button_pressed():
	get_tree().change_scene_to_file("res://gui/menu/main_menu.tscn")


# Config
func _on_option_button_item_selected(index):
	Global.set_setting("preferences", "lang_index", index)
	
	var v = ""
	match %LangOptionButton.get_item_text(index):
		"español": v = "es"
		"english": v = "en"
		_: v = OS.get_locale_language()
	
	Global.set_setting("game", "lang", v)
