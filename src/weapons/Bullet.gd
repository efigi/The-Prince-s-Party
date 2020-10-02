class_name Bullet
extends Node2D

var speed := 50
var direction := Vector2.UP
var velocity := Vector2.ZERO

func _ready():
	velocity = speed * direction

func _physics_process(delta):
	position += velocity * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
