extends Node2D

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _process(_delta) -> void:
	$inside.position = lerp($inside.position,get_global_mouse_position(),0.2)
	$outside.position = get_global_mouse_position()
	if Input.is_action_just_pressed("lc") and !$AnimationPlayer.is_playing():
		$AnimationPlayer.play("click")
	if Input.is_action_just_pressed("ric"):
		$AnimationPlayer.play("grow")
	if Input.is_action_just_released("ric"):
		$AnimationPlayer.play("shrink")
	
func _input(event) -> void:
	if event is InputEventMouseMotion:
		if event.relative.x >= .01:
			$outside.scale.y = -event.relative.x * .01+.8
		elif event.relative.x <= .01:
			$outside.scale.y = event.relative.x * .01+.8
		if event.relative.y >= .01:
			$outside.scale.x = -event.relative.y * .01+.8
		elif event.relative.y <= .01:
			$outside.scale.x = event.relative.y * .01+.8


func _on_AnimationPlayer_animation_finished(anim_name) -> void:
	if anim_name == "grow":
		$AnimationPlayer.play("big")
