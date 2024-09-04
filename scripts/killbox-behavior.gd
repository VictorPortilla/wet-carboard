extends Area2D

func _on_Killbox_body_entered(body):
	if body.name == "Player":  
		print("Player entered body")
		##body._damagePlayer()
		body._jump(1.3)
		
