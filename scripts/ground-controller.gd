extends Node2D

var groundBasic = preload("res://prefabs/ground-basic.tscn")
var groundOneSpike = preload("res://prefabs/ground-onespike.tscn")

var groundTypes = [groundBasic, groundOneSpike]
var groundInstances : Array

var SPEED = 10.0
var screenSize : Vector2i
var lastGroundCalled 

var activeGround : Node


# Called when the node enters the scene tree for the first time.
func _ready():
	screenSize = get_window().size
	_generate_ground_instances()
	activeGround = groundInstances[0]
	activeGround.position = Vector2i(0,0)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass

func _generate_ground_instances():
	for i in range (2): 
		var new_gnd = groundTypes[i]
		var gnd
		gnd = new_gnd.instantiate()
		lastGroundCalled = gnd
		gnd.position = Vector2i(0,2000)
		add_child(gnd)
		groundInstances.append(gnd)
		
func _move_ground(ground, delta):
	ground.position.x -= $Player.SPEED


func _swap_ground_instances():
	
	pass

