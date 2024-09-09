extends Node

var comboCount: int = 0
@export var abilityOneMark: int = 10
var abilityOneIsUnlocked: bool = false
@export var abilityTwoMark: int = 20
var abilityTwoIsUnlocked: bool = false
@export var abilityThreeMark: int = 30
var abilityThreeIsUnlocked: bool = false
@export var abilitFourMark: int = 40
var abilityFourIsUnlocked: bool = false


func _add_to_combo():
	comboCount += 1
	_unlock_ability()

func _reset_combo():
	comboCount = 0

func _unlock_ability():
	if comboCount == abilityOneMark and !abilityOneIsUnlocked:
		print("Unlocking new ability 1")
		abilityOneIsUnlocked = true
	elif comboCount == abilityTwoMark and !abilityTwoIsUnlocked:
		print("Unlocking new ability 2")
		abilityTwoIsUnlocked = true
	elif comboCount == abilityThreeMark and !abilityThreeIsUnlocked:
		print("Unlocking new ability 3")
		abilityThreeIsUnlocked = true
	elif comboCount == abilitFourMark and !abilityFourIsUnlocked:
		print("Unlocking new ability 4")
		abilityFourIsUnlocked = true
	else :
		print("Keep playing: " + str(comboCount))
