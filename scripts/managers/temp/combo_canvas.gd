extends CanvasLayer

@onready var combo_counter_text = $Counter

func update_text(new_value: int):
	combo_counter_text.text = "Combo: " + str(new_value)
