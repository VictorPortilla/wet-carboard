extends CanvasLayer

@export var hearths: Array[TextureRect]
@export var curretHearth: int
@export var maxHearths: int

func _ready():
	maxHearths = hearths.size() - 1
	curretHearth = maxHearths

func _add_health(value: int):
	curretHearth += value
	hearths[curretHearth].show()
	
	if(curretHearth > maxHearths):
		curretHearth = maxHearths

func _remove_health(value: int):
	hearths[curretHearth].hide()
	curretHearth -= value
	
	if(curretHearth < 0):
		print("Im dead")
		curretHearth = 0
		_fully_heal()

func _fully_heal():
	curretHearth = maxHearths
	
	for i in hearths.size():
		hearths[i].show()
	
func _physics_process(delta):
	if Input.is_action_just_pressed("healthChangeUp"):
		_add_health(1)
		print("currentHearth " + str(curretHearth))
	if Input.is_action_just_pressed("healthChangeDown"):
		_remove_health(1)
		print("currentHearth " + str(curretHearth))
