extends StaticBody2D

@export var speed : float = 300
@export var yPositions: Array = []
var isScreaming : bool
var isActive : bool

func _process(delta):
	
	position.x -= speed * delta
	
	if position.x < 1280 and position.x > get_viewport_rect().size.x / 2:
		$AnimatedSprite2D.self_modulate.a += 0.7 * delta
	
	
	if position.x < get_viewport_rect().size.x / 2 and !isScreaming:
		isScreaming = true
		$AnimatedSprite2D.play("Scream")
	
	if position.x < 0:
		_set_initial_position()
		set_process(false)

func _set_spawn_position(newPos:Vector2):
	$AnimatedSprite2D.self_modulate.a = 0
	$AnimatedSprite2D.play("Fly")
	isScreaming = false
	position.y = newPos.y
	position.x = newPos.x + 50
	isActive = true
	show()

func _kill_enemy():
	$"Health-system-enemies"._die()
	_set_initial_position()

func _set_initial_position():
	position.x = 3000
	position.y = 3000
	isActive = false
	hide()
