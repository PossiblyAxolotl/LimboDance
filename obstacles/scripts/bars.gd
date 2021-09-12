extends Area

func _on_HighBars_body_entered(body):
	if body.name == "playerBody":
		body.die()
