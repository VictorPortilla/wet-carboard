extends Area2D

@export var speed : float = 300
var isScreaming : bool

func _process(delta):
	
	position.x -= speed * delta
	
	if position.x < 1280 and position.x > get_viewport_rect().size.x / 2:
		$AnimatedSprite2D.self_modulate.a += 0.7 * delta
	
	
	if position.x < get_viewport_rect().size.x / 2 and !isScreaming:
		isScreaming = true
		$AnimatedSprite2D.play("Scream")
	
	if position.x < 0:
		queue_free()

func _set_spawn_position(newPos:Vector2):
	$AnimatedSprite2D.self_modulate.a = 0
	$AnimatedSprite2D.play("Fly")
	isScreaming = false
	position.y = newPos.y
	position.x = newPos.x + 50

func _kill_enemy():
	$"Health-system-enemies"._die()
