extends Node2D

@export var spawnPositions: Array

var availableSpawns: Array
var enemy1 = preload("res://prefabs/forest-spirt.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in spawnPositions.size():
		availableSpawns.append(spawnPositions[i])
	
	_spawnEnemy()



func _spawnEnemy():
	var pick = availableSpawns.pick_random()
	
	var enemySpawned = enemy1.instantiate()
	
	enemySpawned._set_spawn_position(pick)
	
	add_child(enemySpawned)
	

func _on_timer_timeout():
	_spawnEnemy()
