class_name Hitbox
extends Area2D

func _ready():
	owner = get_parent().get_parent()

func _on_Hitbox_area_entered(area):
	pass
#	if area.owner
