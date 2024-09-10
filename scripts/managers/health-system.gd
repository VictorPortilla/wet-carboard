extends Node

@export var maxHealth : int = 100
var current_health : int  

func _set_health(new_health: int):
	current_health = new_health
	
	if current_health <= 0:
		_die()

func  _fully_heal():
	_set_health(maxHealth)
	
func _take_damage(damage_taken):
	_set_health(current_health - damage_taken)

func _die():
	get_parent().queue_free()
