extends Node2D

var TestCamera : Camera2D 

func _ready():
	TestCamera = get_node("Camera2D")
	
func _process(_delta):
	if Input.is_action_just_pressed("jump"):
		TestCamera._shake(1.0, 10)
