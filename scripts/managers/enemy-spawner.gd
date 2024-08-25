extends Node2D

@export var maxEnemies : int = 5

var enemyOneArray : Array
var enemyTwoArray : Array
var enemyThreeArray : Array
var enemyFourArray : Array
var enemyFiveArray : Array

var enemy1 = preload("res://prefabs/enemies/forest-spirt.tscn")
var enemy2 = preload("res://prefabs/enemies/flying-eye-ball.tscn")
var enemy3 = preload("res://prefabs/enemies/goblin.tscn")
var enemy4 = preload("res://prefabs/enemies/banshee.tscn")
var enemy5 = preload("res://prefabs/enemies/crow.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in maxEnemies:
		var enemy = enemy1.instantiate()
		var spawnPos : Vector2 = Vector2 (3000,3000)
		enemy._set_initial_position()
		enemy.set_process(false)
		add_child(enemy)
		enemyOneArray.append(enemy)
		#enemyTwoArray.append(enemy2.instantiate())
		#enemyThreeArray.append(enemy3.instantiate())
		#enemyFourArray.append(enemy4.instantiate())
		#enemyFiveArray.append(enemy5.instantiate())
	
	print(enemyOneArray.size())
	
func _spawnEnemy(arrayOfEnemies: Array):
	'''
	var enemySpawned = enemyToSpawn.instantiate()
	var pick: Vector2 = enemySpawned.yPositions.pick_random()
	enemySpawned._set_spawn_position(pick)
	add_child(enemySpawned)
	'''
	while true:
		var enemySpawned = arrayOfEnemies.pick_random()
		
		if(enemySpawned.isActive == false):
			enemySpawned.set_process(true)
			var pick: Vector2 = enemySpawned.yPositions.pick_random()
			enemySpawned._set_spawn_position(pick)
			
			break
	
	

func _on_forest_spirit_timer_timeout():
	#_spawnEnemy(enemy1)
	_spawnEnemy(enemyOneArray)
	pass

func _on_flying_eye_ball_timer_timeout():
	#_spawnEnemy(enemy2)
	pass
	
func _on_goblin_timer_timeout():
	#_spawnEnemy(enemy3)
	pass

func _on_banshee_timer_timeout():
	#_spawnEnemy(enemy4)
	pass

func _on_crow_timer_timeout():
	#_spawnEnemy(enemy5)
	pass
