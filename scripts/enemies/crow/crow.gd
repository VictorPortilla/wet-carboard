extends StaticBody2D

var SPEED = 200.0
@onready var attack_timer = $AttackTimer
@onready var hurtbox = $HurtboxCollisionShape
@onready var hitbox = $EnemyHitbox/HitboxShape2D
@onready var audio_stream_player_2d = $AudioStreamPlayer2D 

@export var yPositions: Array = []

var isActive : bool = false

var stage = 0
# Called when the node enters the scene tree for the first time.

func _ready():
	# TODO: play initial sound
	audio_stream_player_2d.play()   
	attack_timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += delta * -SPEED
	pass

func _on_attack_timer_timeout():
	match stage:
		0:
			# Starting teleport. Enemy disappears.
			audio_stream_player_2d.play()
			attack_timer.wait_time = 0.75
			attack_timer.start()
			SPEED = 0.0
			hurtbox.disabled = true
			stage += 1
		1:
			# Ending teleport. Enemy appears near player.
			# TODO: change speed  
			audio_stream_player_2d.play()
			position.x = 320
			attack_timer.wait_time = 0.5   
			attack_timer.start()
			hurtbox.disabled = false
			stage += 1
		2:
			# Enemy attacks and fades out
			# TODO: play attack sound
			audio_stream_player_2d.play()
			attack_timer.wait_time  = 0.25
			attack_timer.start()
			attack_timer.one_shot = true 
			hitbox.disabled = false
			stage += 1
		3:
			# Enemy disappears
			audio_stream_player_2d.play()
			_set_initial_position()
			set_process(false)
	pass # Replace with function body.

func _set_spawn_position(newPos:Vector2):
	position.y = newPos.y
	position.x = newPos.x + 50
	isActive = true
	show()

func _set_initial_position():
	position.x = 3000
	position.y = 3000
	isActive = false
	hide()
