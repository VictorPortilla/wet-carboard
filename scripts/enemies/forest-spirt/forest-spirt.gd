extends StaticBody2D

@export var speed: float = 400.0
@export var yPositions: Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	_set_start_position()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= speed * delta
	
	if position.x < -5:
		queue_free()
	
func _set_start_position():
	position.y = yPositions.pick_random()
	position.x = get_viewport_rect().size.x + 50

'''func _move(delta):
	position.x -= speed * delta
	
	if position.x < get_viewport_rect().size.x + 100:
		queue_free()'''
