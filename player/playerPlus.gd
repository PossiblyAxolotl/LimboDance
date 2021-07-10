extends Spatial

func _physics_process(delta) -> void:
	$Camera.global_transform.origin = lerp($Camera.global_transform.origin, Vector3($todd.global_transform.origin.x+1,$todd.global_transform.origin.y,$todd.global_transform.origin.z+6),0.1)
	if $playerBody.playing: $deathwall.global_transform.origin.x += 1 * delta
	
func _on_Area_body_entered(body):
	if body.name == "playerBody":
		body.die()
