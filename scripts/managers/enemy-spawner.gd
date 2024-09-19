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
var enemy4 = preload("res://prefabs/enemies/banshee_.tscn")
var enemy5 = preload("res://prefabs/enemies/crow.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in maxEnemies:
		# Initial instance for enemy one
		var enemy = enemy1.instantiate()
		enemy._set_initial_position()
		enemy.set_process(false)
		add_child(enemy)
		enemyOneArray.append(enemy)
		
		enemy = enemy2.instantiate()
		enemy._set_initial_position()
		enemy.set_process(false)
		add_child(enemy)
		enemyTwoArray.append(enemy)
		
		# Initial instance for enemy three
		enemy = enemy3.instantiate()
		enemy._set_initial_position()
		enemy.set_process(false)
		add_child(enemy)
		enemyThreeArray.append(enemy)
		
		# Initial instance for enemy four
		enemy = enemy4.instantiate()
		enemy._set_initial_position()
		enemy.set_process(false)
		add_child(enemy)
		enemyFourArray.append(enemy)
		
		# Initial instance for enemy five
		'''enemy = enemy5.instantiate()
		enemy._set_initial_position()
		enemy.set_process(false)
		add_child(enemy)
		enemyFiveArray.append(enemy)'''

	
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
	_spawnEnemy(enemyOneArray)


func _on_flying_eye_ball_timer_timeout():
	_spawnEnemy(enemyTwoArray)
	
func _on_goblin_timer_timeout():
	_spawnEnemy(enemyThreeArray)
	

func _on_banshee_timer_timeout():
	_spawnEnemy(enemyFourArray)

func _on_crow_timer_timeout():
	#_spawnEnemy(enemyFiveArray)
	pass
