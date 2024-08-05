extends Node2D

enum movement_phase {PHASE_ONE, PHASE_TWO, PHASE_THREE}
var current_phase = movement_phase.PHASE_ONE
var velocity : float = 650.0
var vert_velocity : float = 30.0

## Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.


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
	position.y += pow(vert_velocity, 2) * delta
	position.x += -200 * delta
	if position.y > 800:
		current_phase = movement_phase.PHASE_THREE
	
	
func _phase_three(delta):
	position.x -= velocity * delta
	if position.x < -300:
		queue_free()
