extends StaticBody2D

@export var speed: float = 200
@export var amplitude: float = 50
@export var frequency: float = 2
@export var yPositions: Array = []

var direction: Vector2
var start_position: Vector2
var time_passed: float = 0
var isActive: bool = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += speed * delta * direction.x
	
	position.y = start_position.y + amplitude * sin(frequency * position.x * 0.01)
	
	if position.x < 0:
		_set_initial_position()
		set_process(false)
	
func _set_spawn_position(newPos:Vector2):
	position.y = newPos.y
	position.x = newPos.x + 50
	direction.x = -1
	direction.y = 0
	start_position = position
	isActive = true
	show()

func _set_initial_position():
	position.x = 3000
	position.y = 3000
	isActive = false
	hide()

func _kill_enemy():
	$"Health-system-enemies"._die()
	_set_initial_position()

	
