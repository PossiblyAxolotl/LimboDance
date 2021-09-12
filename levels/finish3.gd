extends Spatial

func _on_Area_body_entered(body):
	if body.name == "playerBody":
		body.playing = false
		$AudioStreamPlayer.play()
		$CPUParticles.emitting = true
		yield(get_tree().create_timer(2),"timeout")
		body.reset()

