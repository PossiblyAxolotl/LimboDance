extends Spatial

var level = 1

func _ready():
	$TextureButton/Tween.interpolate_property($TextureButton,"rect_rotation",0,360,2,Tween.TRANS_EXPO)
	$OptionButton.add_item("5 obstacles",1)
	$OptionButton.add_item("10 obstacles",2)
	$OptionButton.add_item("15 obstacles",3)
	var file = File.new()
	if file.file_exists("user://eyes"):
		$eyes.show()
	if file.file_exists("user://debug"):
		$OptionButton.add_item("playerscene",4)
		$OptionButton.add_item("pausemenu",5)
		$OptionButton.add_item("toggle eyes",6)
		$OptionButton.add_item("toggle invert clr",7)
		$OptionButton.add_item("disable debug",8)

func _on_Button_pressed():
	$AudioStreamPlayer.play()
	$Player/deathload/AnimationPlayer.play("die")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "die" and level < 4:
		get_tree().change_scene("res://levels/rng"+str(level)+".tscn")
	elif level == 4:
		get_tree().change_scene("res://player/Player.tscn")
	elif level == 5:
		get_tree().change_scene("res://player/pausemenu.tscn")
	elif level == 6:
		var file = File.new()
		if file.file_exists("user://eyes"):
			var dir = Directory.new()
			dir.remove("user://eyes")
		else:
			file.open("user://eyes",File.WRITE)
			file.store_string("debugged but still eye'd")
			file.close()
		get_tree().reload_current_scene()
	elif level == 7:
		Autoload.darkmode = !Autoload.darkmode
		$Control.visible = !$Control.visible
		get_tree().reload_current_scene()
	elif level == 8:
		var dir = Directory.new()
		dir.remove("user://debug")
		get_tree().reload_current_scene()
	
func _on_Button3_pressed():
	$AudioStreamPlayer.play()
	$Player/deathload/AnimationPlayer.play_backwards("live")
	yield(get_tree().create_timer(.7),"timeout")
	get_tree().quit()


func _on_Button2_pressed():
	$AudioStreamPlayer.play()
	OS.window_fullscreen = !OS.window_fullscreen


func _on_TextureButton_pressed():
	$AudioStreamPlayer.play()
	$TextureButton/Tween.start()


func _on_OptionButton_item_selected(index):
	level = index+1
	if level <= 5:
		$Button.text = "[Play]"
	else:
		$Button.text = "[Run]"
	print(level)


func _on_Button4_pressed():
	var file = File.new()
	if !file.file_exists("user://debug"):
		file.open("user://debug",File.WRITE)
		file.store_string("debug more like bugs")
		file.close()
		get_tree().reload_current_scene()


func _on_Tween_tween_all_completed():
	OS.shell_open("https://possiblyaxolotl.itch.io")
	$TextureButton/Tween.interpolate_property($TextureButton,"rect_rotation",0,360,2,Tween.TRANS_EXPO)
