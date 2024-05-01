extends Control


func update_points(points):
	$HBoxContainer/PointsLabel.text = str(points)


func game_over():
	$GameOverLabel.show()


func _on_Player_stamina_changed(stamina, max_stamina):
	# Convertir la estamina a porcentaje
	$StaminaBar.value = stamina * 100 / max_stamina
	
	if $StaminaBar.value >= 100:
		# Al alcanzar el 100% de estamina,
		# esperar 0.8 segundos y luego ocultar la barra
		await get_tree().create_timer(0.8).timeout
		$StaminaBar.hide()
	
	else:
		$StaminaBar.show()
