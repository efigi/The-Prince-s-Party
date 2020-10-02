extends ParallaxBackground

var speed_multiplier := 1.0
onready var ground_layer = $GroundLayer
func _ready():
	pass

func _process(delta):
	ground_layer.motion_offset.y += 0.4 * speed_multiplier

func change_speed_multiplier(val : float):
	speed_multiplier = val
