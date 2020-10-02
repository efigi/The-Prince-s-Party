class_name Character
extends KinematicBody2D

export var character_name = "Faceless"
var _state = null
var possible_states : Dictionary = {}
var speed := 0
var drag_enabled := false

onready var states_holder = $States
onready var state_label = $Addons/StateLabel
onready var sprite = $Sprite

onready var attack_timer = $Timers/Attack

onready var bullet_resource = preload("res://src/states/Bullet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	if states_holder != null:
		for child in states_holder.get_children():
			possible_states[child.state_name] = child
			if _state == null:
				_state = child
	print(_state.state_name)
	sprite.play("up")
	
func _physics_process(delta):
	if drag_enabled:
		var new_position = get_global_mouse_position()
		var movement = new_position - global_position
		global_position = new_position# * 0.2 
	else:
		var input = _state.get_raw_input()
		change_state(_state.interpret_inputs(input))
		state_label.text = _state.state_name
		_state.run(input)
	
	var limit = Vector2(10, 15)
	position.x = clamp(position.x, limit.x, 180 - limit.x)
	position.y = clamp(position.y, limit.y, 320 - limit.y)

func _on_Player_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			change_state("dragged") #TODO change state to drag self, change state of others to slow mo

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and not event.pressed:
			change_state("moving")

func change_time_scale(time : float):
	Engine.time_scale = time
	get_tree().call_group("backgrounds","change_speed_multiplier", time)

func change_state(state_name, repeat = false):
	var new_state = possible_states[state_name]
	if _state != new_state or repeat:
		print("STATE IS ", state_name)
		exit_state()
		_state = new_state
		state_label.text = _state.state_name
		enter_state()
	
func enter_state():
	_state.enter()
	
func exit_state():
	_state.exit()

func change_direction(dir):
	pass

func attack():
	pass
	
func _on_Attack_timeout():
	attack()
	if _state.state_name == "moving":
		attack_timer.start()
