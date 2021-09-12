extends Spatial

func _process(delta) -> void:
	rotation.y = lerp(rotation.y,$Node2D.get_global_mouse_position().x*0.0001-.2,0.1)
	rotation.x = lerp(rotation.x,$Node2D.get_global_mouse_position().y*0.0001,0.1)
