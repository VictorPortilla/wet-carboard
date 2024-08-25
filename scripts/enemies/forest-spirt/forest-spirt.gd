extends StaticBody2D

@export var speed: float = 400.0
@export var yPositions: Array = []
var isActive: bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= speed * delta
	
	if position.x < -5:
		#queue_free()
		hide()
		_set_initial_position()
		set_process(false)

func _set_spawn_position(newPos:Vector2):
	position.y = newPos.y
	position.x = newPos.x + 50
	isActive = true
	show()

func _set_initial_position():
	position.x = 3000
	position.y = 3000
	isActive = false

func _kill_enemy():
	$"Health-system-enemies"._die()
