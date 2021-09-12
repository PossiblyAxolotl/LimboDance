extends KinematicBody

var crouch = .15
var speed = 10
onready var particles = preload("res://player/jumpParticles.tscn")
var playing = true
var vel = Vector3()

func _physics_process(delta) -> void:
	if scale.y < 1:
		if Input.is_action_pressed("rc") and playing:
			scale.y += .2 * delta
		else:
			scale.y += .1 * delta
	
	if Input.is_action_just_pressed("jump") and playing:
		scale.y -= crouch
		vel.x = speed
		$"../AudioStreamPlayer".stop()
		$"../todd/Armature".add_child(particles.instance())
		$"../todd/AnimationPlayer3".play("jump")
	
	if scale.y <= .1:
		die()
	
	$"../todd".global_transform.origin = Vector3(global_transform.origin.x,$"../todd".global_transform.origin.y,global_transform.origin.z)
	$"../todd/AnimationPlayer".seek(scale.y, true)
	
	vel.x = lerp(vel.x, 0, 0.1)
	
	move_and_slide(vel)

func die() -> void:
	playing = false
	$"../todd/AnimationPlayer".stop()
	$"../todd/Armature/Skeleton".physical_bones_start_simulation()
	yield(get_tree().create_timer(.7),"timeout")
	$"../deathload/AnimationPlayer".play_backwards("live")
	$"../Timer".start()

func reset():
	$"../deathload/AnimationPlayer".play_backwards("live")
	$"../Timer2".start()

func _on_Timer_timeout():
	get_tree().reload_current_scene()


func _on_Timer2_timeout():
	get_tree().change_scene("res://menu/title.tscn")
