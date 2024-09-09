extends Node

var isAlive: bool = true

func _revive():
	isAlive = true

func _die():
	isAlive = false
	#get_parent().queue_free()
