class_name Soldier
extends Character

func _ready():
	pass

func attack():
	var sword = bullet_resource.instance()
	sword.position = position + (Vector2.UP * 30)
	get_parent().get_parent().get_node("Objects").add_child(sword)
	pass
