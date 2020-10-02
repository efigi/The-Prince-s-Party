class_name State
extends Node2D

export var state_name = "State"

func _ready():
	owner = get_parent().get_parent()

func get_raw_input() -> Dictionary:
	var inputs = {
		is_moving = true, #Input.is_action_just_pressed("move_down") or Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right") or Input.is_action_just_pressed("move_up"),
		input_direction = get_input_direction()
	}
	return inputs
	
func interpret_inputs(input):
	if owner.drag_enabled:
		return "dragged"
	elif input.is_moving:
		return "moving"
	else:
		return "idle"


func enter():
	pass

func exit():
	pass

func get_input_direction() -> Vector2:
	return Vector2(float(Input.is_action_pressed("move_right")) - float(Input.is_action_pressed("move_left")), float(Input.is_action_pressed("move_down")) - float(Input.is_action_pressed("move_up")))

func run(input):
	pass
