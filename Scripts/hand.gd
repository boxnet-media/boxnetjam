extends Node2D

var mouse_position
var deadzone = .1
var controllerangle = Vector2.ZERO



	
func _process(delta):
	if mouse_position != get_local_mouse_position():
		mouse_position = get_local_mouse_position()
		rotation += mouse_position.angle()
	var xAxisRL = Input.get_joy_axis(0, JOY_AXIS_2)
	var yAxisUD = Input.get_joy_axis(0 ,JOY_AXIS_3)
	if abs(xAxisRL) > deadzone || abs(yAxisUD) > deadzone:
		controllerangle = Vector2(xAxisRL, yAxisUD).angle()
		self.rotation = controllerangle
