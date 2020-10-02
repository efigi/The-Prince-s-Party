extends KinematicBody2D


func _ready():
	pass

func _physics_process(delta):
	move_and_slide(10 * Vector2.UP)
