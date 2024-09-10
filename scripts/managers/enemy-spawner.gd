extends Node2D

@export var spawnPositions: Array

var availableSpawns: Array
var enemy1 = preload("res://prefabs/enemies/forest-spirt.tscn")
var enemy2 = preload("res://prefabs/enemies/flying-eye-ball.tscn")
var enemy4 = preload("res://prefabs/enemies/banshee.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in spawnPositions.size():
		availableSpawns.append(spawnPositions[i])
	

func _spawnEnemy(enemyToSpawn):
	var pick = availableSpawns.pick_random()
	var enemySpawned = enemyToSpawn.instantiate()
	enemySpawned._set_spawn_position(pick)
	add_child(enemySpawned)

func _on_forest_spirit_timer_timeout():
	_spawnEnemy(enemy1)

func _on_flying_eye_ball_timer_timeout():
	_spawnEnemy(enemy2)

func _on_banshee_timer_timeout():
	_spawnEnemy(enemy4)
