extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -2600.0

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var attack_hitbox_shape = $BasicAttackHitbox/BasicAttackHitboxShape
@onready var attack_timer = $BasicAttackHitbox/BasicAttackTimer

@onready var ability4_hitbox_shape = $Ability4Hitbox/Ability4HitboxShape
@onready var ability4_timer = $Ability4Hitbox/Ability4Timer

@onready var combo_progression = $"Combo-progession"

@onready var PlayerCamera = get_parent().get_node("PlayerCamera")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 12000
var has_double_jump = false
var has_triple_jump = false

func _ready():
	$"Health-sytem"._fully_heal()

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
			_jump(1.08)
		elif has_double_jump:
			_jump(1.08)
			has_double_jump = false
		elif combo_progression.abilityOneIsUnlocked and has_triple_jump:
			_jump(0.8) 
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

	elif Input.is_action_just_pressed("ability4") and not is_on_floor() and combo_progression.abilityTwoIsUnlocked:
		ability4_timer.start()
		ability4_hitbox_shape.disabled = false
		animated_sprite_2d.play("ability4")

	elif !animated_sprite_2d.is_playing():
		animated_sprite_2d.play("default")

	move_and_slide()
	
func _damagePlayer():
	$"Health-sytem"._take_damage(20)
	combo_progression._reset_combo()
	PlayerCamera._shake(0.2, 5)
	$"../ComboCanvas".update_text(0)
	animated_sprite_2d.play("hurt")
	
func _jump(multiplier : float):
	velocity.y = JUMP_VELOCITY * multiplier
	

