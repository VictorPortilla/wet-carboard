extends Area2D

@export var speed : float = 300
var isScreaming : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	_set_start_position()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	position.x -= speed * delta
	
	if position.x < 1280 and position.x > get_viewport_rect().size.x / 2:
		$AnimatedSprite2D.self_modulate.a += 0.7 * delta
	
	
	if position.x < get_viewport_rect().size.x / 2 and !isScreaming:
		isScreaming = true
		$AnimatedSprite2D.play("Scream")
	
	if position.x < 0:
		queue_free()
	
func _set_start_position():
	$AnimatedSprite2D.self_modulate.a = 0
	$AnimatedSprite2D.play("Fly")
	isScreaming = false
	position.x = get_viewport_rect().size.x + 10
	position.y = 200
