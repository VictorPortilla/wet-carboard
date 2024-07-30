extends Area2D

@export var speed : float = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	_set_start_position()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	position.x -= speed * delta
	
	if position.x == get_viewport_rect().size.x / 2:
		$AnimatedSprite2D.play("Scream")
	
	if position.x < 0:
		queue_free()
	
func _set_start_position():
	position.x = get_viewport_rect().size.x + 10
	position.y = 200
