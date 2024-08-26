extends CharacterBody2D

var SPEED = 400.0
const JUMP_VELOCITY = -1000.0
var has_jumped: bool = false
@onready var jump_timer = $JumpTimer
@onready var ray_cast_2d = $RayCast2D
@export var yPositions: Array = []

var isActive : bool = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 1400

func _physics_process(delta):
	# Fall if not on floor
	if not is_on_floor():
		velocity.y += gravity * delta
	elif !ray_cast_2d.is_colliding():
		SPEED = 20.0 # match ground speed

	# Jump if near player.
	if !has_jumped and position.x <= 500  and is_on_floor():
		has_jumped = true
		jump_timer.start()
		# print("Preparing to jump!")
		SPEED = 0.0
		# .play("jump_anticipation") or jump idk
		# velocity.y = JUMP_VELOCITY

	velocity.x = -SPEED
	# velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	if position.x < -5:
		_set_initial_position()
		set_process(false)

func _on_jump_timer_timeout():
	print("Jump!")
	velocity.y = JUMP_VELOCITY
	SPEED = 400.0


func _kill_enemy():
	$"Health-system-enemies"._die()

func _set_spawn_position(newPos:Vector2):
	position.y = newPos.y + 10 
	position.x = newPos.x + 50
	isActive = true
	show()

func _set_initial_position():
	position.x = 3000
	position.y = 3000
	isActive = false
	hide()

