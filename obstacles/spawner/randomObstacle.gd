extends Spatial

onready var ob1 = preload("res://obstacles/high_bar.tscn")
onready var ob2 = preload("res://obstacles/med_bar.tscn")
onready var ob3 = preload("res://obstacles/guillotine.tscn")

var rng = RandomNumberGenerator.new()
var ob

func _ready() -> void:
	rng.randomize()
	var choice = rng.randi_range(1,3)
	
	if choice == 1:
		var ob = ob1.instance()
		$"../".call_deferred("add_child",ob)
		ob.transform = global_transform
	elif choice == 2:
		var ob = ob2.instance()
		$"../".call_deferred("add_child",ob)
		ob.transform = global_transform
	elif choice == 3:
		var ob = ob3.instance()
		$"../".call_deferred("add_child",ob)
		ob.transform = global_transform
	queue_free()
