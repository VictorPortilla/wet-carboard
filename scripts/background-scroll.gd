extends Node2D

var ParallaxOffset : float
var Background : ParallaxBackground

# Called when the node enters the scene tree for the first time.
func _ready():
	ParallaxOffset = 0.0
	Background = $ParallaxBackground
	for group in Background.get_groups():
		if group.begins_with("__cameras"):
			Background.remove_from_group(group)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ParallaxOffset -= 1000.0 * delta
	Background.set_scroll_offset(Vector2(ParallaxOffset, 0.0))
