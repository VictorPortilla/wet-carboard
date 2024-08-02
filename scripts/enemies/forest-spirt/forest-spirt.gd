extends StaticBody2D

@export var speed: float = 400.0
@export var yPositions: Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	#_set_start_position()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= speed * delta
	
	if position.x < -5:
		queue_free()
	
func _set_start_position():
	position.y = 650
	position.x = get_viewport_rect().size.x + 50

func _set_spawn_position(newPos:Vector2):
	position.y = newPos.y
	position.x = newPos.x + 50
