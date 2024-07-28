extends Node2D

var enemy_scene = preload("res://prefabs/forest-spirt.tscn")

var enemy_queue: Array = []

var spawn_timer:Timer

@export var spawn_interval: float = 5.0
@export var max_enemies: int = 5

'''
# Called when the node enters the scene tree for the first time.
func _ready():
	
	# Initialize enemy queue
	for i in max_enemies:
		var enemy = enemy_scene.instantiate()
		enemy_queue.append(enemy)
		
	# Start the spawn timer
	spawn_timer = $Timer
	spawn_timer.wait_time = spawn_interval
	spawn_timer.start()
	
	print("done :p")
	print(enemy_queue.size())
	
func _on_timer_timeout():
	while  true:
		if(!enemy_queue.is_empty()):
			var pick = enemy_queue.pick_random()
			var pickIndex = enemy_queue.find(pick,0)
			
			if(pickIndex != -1):
				enemy_queue[pickIndex]._set_start_position()
				enemy_queue.pop_at(pickIndex)
				print("Spawn")
				break
		else :
			print("No enemies ready :c")
			break'''
