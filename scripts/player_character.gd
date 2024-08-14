extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -2600.0

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var attack_hitbox_shape = $AttackHitbox/AttackHitboxShape
@onready var attack_timer = $AttackHitbox/AttackTimer

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 12000
var has_double_jump = false
var has_triple_jump = false

var ABILITY_TRIPLE_JUMP = true

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if !has_double_jump and is_on_floor():
		has_double_jump = true
		has_triple_jump = true

	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		elif has_double_jump:
			velocity.y = JUMP_VELOCITY
			has_double_jump = false
		elif ABILITY_TRIPLE_JUMP and has_triple_jump:
			velocity.y = JUMP_VELOCITY * 0.7  
			has_triple_jump = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if Input.is_action_just_pressed("attack"):
		attack_timer.start()
		attack_hitbox_shape.disabled = false
		animated_sprite_2d.play("attack")
	elif !animated_sprite_2d.is_playing():
		animated_sprite_2d.play("default")

	move_and_slide()

