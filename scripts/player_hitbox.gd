extends Area2D

@export var attack_hitbox_shape: CollisionShape2D

func _on_body_entered(body):
	body._kill_enemy()
	$"../Combo-progession"._add_to_combo()


func _on_attack_timer_timeout():
	attack_hitbox_shape.disabled = true
