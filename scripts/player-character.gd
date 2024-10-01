extends CharacterBody2D

@export var GOD_MODE = false

const SPEED = 300.0
const JUMP_VELOCITY = -2600.0
var can_move: bool
var can_be_damaged:bool

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var attack_hitbox_shape = $BasicAttackHitbox/BasicAttackHitboxShape
@onready var attack_timer = $BasicAttackHitbox/BasicAttackTimer

@onready var ability2_hitbox_shape = $Ability2Hitbox/Ability2HitboxShape
@onready var ability2_timer = $Ability2Hitbox/Ability2Timer

@onready var ability4_hitbox_shape = $Ability4Hitbox/Ability4HitboxShape
@onready var ability4_timer = $Ability4Hitbox/Ability4Timer
var can_use_ability_4: bool

@onready var combo_progression = $"Combo-progession"

@onready var PlayerCamera = get_parent().get_node("PlayerCamera")

@onready var player_health = $"Health-sytem"

@onready var player_health_UI = get_parent().get_node("Player-health")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 12000
var has_double_jump = false
var has_triple_jump = false

func _ready():
	can_move = true
	can_be_damaged = true
	can_use_ability_4 = true
	player_health._fully_heal()
	
	if GOD_MODE:
		combo_progression._unlock_all_abilities()

func _physics_process(delta):
	if is_on_floor():
		can_use_ability_4 = true
	# Add the gravity.
	if not is_on_floor() and can_move:
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
		can_be_damaged = false
		attack_hitbox_shape.disabled = false
		animated_sprite_2d.play("attack")
	
	elif Input.is_action_just_pressed("downAttack") and not is_on_floor() and combo_progression.abilityThreeIsUnlocked:
		ability2_hitbox_shape.disabled = false
		can_be_damaged = false
		animated_sprite_2d.play("ability2")
		ability2_timer.start()
		
	
	elif Input.is_action_just_pressed("ability4") and not is_on_floor() and can_use_ability_4 and combo_progression.abilityFourIsUnlocked:
		can_move = false
		can_be_damaged = false
		can_use_ability_4 = false
		ability4_hitbox_shape.disabled = false
		animated_sprite_2d.play("ability4")
		ability4_timer.start()

	elif !animated_sprite_2d.is_playing():
		animated_sprite_2d.play("default")

	if !can_move:
		velocity.y = 0
		 
	move_and_slide()

func _damagePlayer():
	if !can_be_damaged:
		return 
	player_health._take_damage(20)
	player_health_UI._remove_health(1)
	combo_progression._reset_combo()
	PlayerCamera._shake(0.2, 5)
	$"../ComboCanvas".update_text(0)
	animated_sprite_2d.play("hurt")
	
func _jump(multiplier : float):
	velocity.y = JUMP_VELOCITY * multiplier
	

