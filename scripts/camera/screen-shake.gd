extends Camera2D

var shake_amount : float = 0.0

@onready var timer : Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta : float):
	offset = Vector2(randf_range(-1, 1) * shake_amount, randf_range(-1, 1) * shake_amount)

func _shake(time : float, amount : float):
	timer.wait_time = time
	shake_amount = amount
	set_process(true)
	timer.start()
	
func _on_timer_timeout() -> void: 
	set_process(false)
	Tween.interpolate_value(self, "offset", 1, 1, Tween.TRANS_LINEAR, Tween.EASE_IN)
