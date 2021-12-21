extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var line = "SPACE IS VAST AND INFINITE"

# Called when the node enters the scene tree for the first time.
func _process(delta):
	
	if Input.is_action_just_pressed("ui_select"):
		print(line)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
