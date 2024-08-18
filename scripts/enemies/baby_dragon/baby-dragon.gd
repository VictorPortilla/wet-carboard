extends Node2D

enum movement_phase {PHASE_ONE, PHASE_TWO, PHASE_THREE}
var enemy_lanes : Array = [450, 800]
var current_phase = movement_phase.PHASE_ONE
var velocity : float = 650.0
var vert_velocity : float = 30.0
var descent_limit

func _ready():
	descent_limit = enemy_lanes[randi() % enemy_lanes.size()]
	print("Selected Element: ", descent_limit)

## Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match current_phase:
		movement_phase.PHASE_ONE:
			_phase_one(delta)
		movement_phase.PHASE_TWO:
			_phase_two(delta)
		movement_phase.PHASE_THREE:
			_phase_three(delta)

func _phase_one(delta):
	position.x += velocity * delta
	if position.x > 1350:
		current_phase = movement_phase.PHASE_TWO
	
	
func _phase_two(delta):
	position.x += -velocity * 2 * delta
	position.y -= -sqrt(((-100 * (position.x - 1350)) / 3)) * vert_velocity * delta
	if position.y > descent_limit:
		current_phase = movement_phase.PHASE_THREE
	
	
func _phase_three(delta):
	position.x -= velocity * delta * 3.1
	if position.x < -300:
		queue_free()
