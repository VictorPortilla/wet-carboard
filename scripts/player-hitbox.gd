extends Area2D

@export var abilityName: String
@export var attack_hitbox_shape: CollisionShape2D
@onready var combo_system = $"../Combo-progession"
@onready var combo_canvas = get_parent().get_parent().get_node("ComboCanvas")
@export var charcater: CharacterBody2D 


func _on_body_entered(body):
	print("Enemy entered")
	body._kill_enemy()
	combo_system._add_to_combo()
	combo_canvas.update_text(combo_system._get_current_combo())
	
	if abilityName == "SkullCrusher":
		charcater._jump(1)
  
func _on_area_entered(area):
	area._kill_enemy()
	combo_system._add_to_combo()
	combo_canvas.update_text(combo_system._get_current_combo())
	
	if abilityName == "SkullCrusher":
		charcater._jump(1)

func _on_attack_timer_timeout():
	attack_hitbox_shape.disabled = true
	charcater.can_be_damaged = true
	if abilityName == "DragonSlayerSpin":
		charcater.can_move = true
		


