extends Area2D

@onready var attack_hitbox_shape = $AttackHitboxShape

func _on_body_entered(body):
	body._kill_enemy()
	$"../Combo-progession"._add_to_combo()


func _on_attack_timer_timeout():
	attack_hitbox_shape.disabled = true
