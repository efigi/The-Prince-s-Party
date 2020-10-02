class_name Moving
extends State

export var speed := 0
var last_direction := Vector2.ZERO
var direction := Vector2.ZERO
var velocity := Vector2.ZERO

onready var host = get_parent().get_parent()
onready var tween = $Tween

func _ready():
	._ready()
	speed = owner.speed
	state_name = "moving"
	
func enter():
	pass

func run(input):
	pass
	owner.move_and_slide(Vector2.ZERO)
	#TODO add shooting!
#	direction = Vector2.UP#input.input_direction.normalized()
#	velocity = direction * speed
##	host.move_and_slide(velocity)
#	if velocity.x < 0:
#		host.is_flipped = false
#		host.change_direction("left")
#	elif velocity.x > 0:
#		host.is_flipped = false
#		host.change_direction("right")
#	elif velocity.y < 0:
#		host.change_direction("up")
#	else:
#		host.change_direction("down")
#
##	tween.interpolate_property(host,"position", host.position, host.position + velocity, 0.2, Tween.TRANS_LINEAR,Tween.EASE_IN)
##	tween.start()
##	host.position += velocity
