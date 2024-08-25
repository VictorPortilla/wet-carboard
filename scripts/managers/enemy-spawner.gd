extends Node2D

@export var spawnPositions: Array

var availableSpawns: Array
var enemy1 = preload("res://prefabs/enemies/forest-spirt.tscn")
var enemy2 = preload("res://prefabs/enemies/flying-eye-ball.tscn")
var enemy3 = preload("res://prefabs/enemies/goblin.tscn")
var enemy4 = preload("res://prefabs/enemies/banshee.tscn")
var enemy5 = preload("res://prefabs/enemies/crow.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in spawnPositions.size():
		availableSpawns.append(spawnPositions[i])
	
func _spawnEnemy(enemyToSpawn):
	var enemySpawned = enemyToSpawn.instantiate()
	var pick: Vector2 = enemySpawned.yPositions.pick_random()
	print("Spawning enemy at:" + str(pick))
	enemySpawned._set_spawn_position(pick)
	add_child(enemySpawned)

func _on_forest_spirit_timer_timeout():
	_spawnEnemy(enemy1)

func _on_flying_eye_ball_timer_timeout():
	_spawnEnemy(enemy2)
	
func _on_goblin_timer_timeout():
	_spawnEnemy(enemy3)

func _on_banshee_timer_timeout():
	_spawnEnemy(enemy4)

func _on_crow_timer_timeout():
	_spawnEnemy(enemy5)
