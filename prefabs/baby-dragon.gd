extends Node2D

var velocity : float = 650.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.x < 1350:
		position.x += velocity * delta
	else: 
		position.x = 1350
