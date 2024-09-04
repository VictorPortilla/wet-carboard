extends Area2D

func _on_Killbox_body_entered(body):
	if body.name == "Player":  
		body._damagePlayer()
		body._jump(1.3)
		
