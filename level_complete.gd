extends Area2D
export var next_level = ""




func _on_Area2D_body_entered(body):
	get_tree().change_scene(next_level)