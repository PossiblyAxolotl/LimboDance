extends Spatial

func _ready() -> void:
	var file = File.new()
	
	if !file.file_exists("user://has played"):
		file.open("user://has played",File.WRITE)
		file.store_string("yes they have played lololololololollo \ndelete this to see the tutorial again")
		file.close()
	else:
		$Label.hide()
