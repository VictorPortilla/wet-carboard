extends Area2D

@export var attack_hitbox_shape: CollisionShape2D
@onready var combo_system = $"../Combo-progession"
@onready var combo_canvas = get_parent().get_parent().get_node("ComboCanvas")
@export var charcater: CharacterBody2D 


func _on_body_entered(body):
	body._kill_enemy()
	combo_system._add_to_combo()
	combo_canvas.update_text(combo_system._get_current_combo())
  

func _on_attack_timer_timeout():
	attack_hitbox_shape.disabled = true
	charcater.can_move = true
