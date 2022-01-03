extends Area2D

export var last_level = "res://Scenes/victory.tscn"




func _ready():
	self.connect( "on_body_entered", self, "_on_Area2D_body_entered")
	preload("res://Scenes/victory.tscn")
	
func _on_Area2D_body_entered(body):
	if global.is_on_last_level():
		get_tree().change_scene(last_level)
	else:
		global.next_level()
