extends StaticBody2D

var SPEED = 200.0
@onready var attack_timer = $AttackTimer
@onready var hurtbox = $HurtboxCollisionShape
@onready var hitbox = $Hitbox/HitboxShape2D
@onready var audio_stream_player_2d = $AudioStreamPlayer2D 
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
			# TODO: make node disappear instead
			audio_stream_player_2d.play()
			hurtbox.disabled = true
			hitbox.disabled = true
	pass # Replace with function body.
