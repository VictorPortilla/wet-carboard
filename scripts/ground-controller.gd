extends Node2D

var groundBasic = preload("res://prefabs/ground-basic.tscn")
var groundOneSpike = preload("res://prefabs/ground-onespike.tscn")
var groundTwoSpikes = preload("res://prefabs/ground-twospikes.tscn")
var groundPit = preload("res://prefabs/ground-pit.tscn")
var groundPitOneSpike = preload("res://prefabs/ground-pit-onespike.tscn")

var groundTypes = [groundBasic, groundOneSpike, groundTwoSpikes, groundPit, groundPitOneSpike]
var groundInstances : Array

var SPEED = 20.0
var screenSize : Vector2i

var activeGround : Node


# Called when the node enters the scene tree for the first time.
func _ready():
	screenSize = Vector2i(1920,1080)
	_generate_ground_instances()
	activeGround = groundInstances[0]
	activeGround.position = Vector2i(0,0)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	for ground in groundInstances:
		_move_ground(ground)
	_swap_ground_instances()
	pass

func _generate_ground_instances():
	for i in range (5): 
		var new_gnd = groundTypes[i]
		var gnd
		gnd = new_gnd.instantiate()
		gnd.position = Vector2i(i*(screenSize.x*2),1100)
		add_child(gnd)
		groundInstances.append(gnd)
		
func _move_ground(ground):
	ground.position.x -= SPEED
	if ground.position.x < -4000:
		ground.position.x = -4000


func _swap_ground_instances():
	if activeGround.position.x + (screenSize.x * 2) < screenSize.x:
		var groundsExceptSelf = groundInstances.filter(func(ground): 
			return ground != activeGround
		)
		var newGround = groundsExceptSelf[randi() % groundsExceptSelf.size()]
		newGround.position.x = activeGround.position.x + (screenSize.x * 2)
		newGround.position.y = 0
		activeGround = newGround
	

