class_name Corn
extends Area2D

# le cambia el nombre a "body_entered" por
# uno más fácil de entender
signal point_earned

func _on_body_entered(_body):
	point_earned.emit()
