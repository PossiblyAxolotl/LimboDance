extends Node2D

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if get_tree().paused:
			get_tree().paused = false
			$AnimationPlayer.play_backwards("pauz")
		else:
			get_tree().paused = true
			$AnimationPlayer.play("pauz")


func _on_Button_pressed():
	$AudioStreamPlayer.play()
	get_tree().paused = false
	$AnimationPlayer.play_backwards("pauz")


func _on_Button2_pressed():
	$AudioStreamPlayer.play()
	$AnimationPlayer.play("menu")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "menu":
		get_tree().paused=false
		get_tree().change_scene("res://menu/title.tscn")
