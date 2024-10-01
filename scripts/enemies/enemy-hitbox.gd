extends Area2D

func _on_body_entered(body):
	print("This body got hit: " + body.get_class())
	body._damagePlayer()
 
func _kill_enemy():
	print("Dummy hit!")
