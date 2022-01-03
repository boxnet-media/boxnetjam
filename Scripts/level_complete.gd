extends Area2D

var last_level = preload("res://Scenes/Victory.tscn")
 



func _ready():
	self.connect( "on_body_entered", self, "_on_Area2D_body_entered")
	
	
func _on_Area2D_body_entered(body):
	if global.is_on_last_level():
		get_tree().change_scene(last_level)
	else:
		global.next_level()
