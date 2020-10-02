class_name Dragged
extends State

export var speed : int = 0
var last_direction : Vector2 = Vector2.ZERO
var direction : Vector2 = Vector2.ZERO
var velocity : Vector2 = Vector2.ZERO

onready var host = get_parent().get_parent()
onready var tween = $Tween

func _ready():
	._ready()
	state_name = "dragged"
	
func enter():
	owner.drag_enabled = true
	owner.change_time_scale(0.3)
	owner.attack_timer.paused = true
func exit():
	owner.drag_enabled = false
	owner.change_time_scale(1.0)
	owner.attack_timer.paused = false

func run(input):
	#	direction = Vector2.UP#input.input_direction.normalized()
	#	velocity = direction * speed
	##	host.move_and_slide(velocity)
	#	if velocity.x < 0:
	#		host.is_flipped = false
	#		host.change_direction("left")
	#
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
	#	host.move_and_slide(velocity)
	#
	#func interpret_inputs(input):
	#	if input.is_moving:
	#		return state_name
	#	else:
	#		return "idle"
	pass
	
