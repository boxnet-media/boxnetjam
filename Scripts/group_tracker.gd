extends Area2D
export var group = ""
var inRange = []


# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("body_entered", self, "areaEntered")
	self.connect("body_exited", self, "areaExited")

func areaEntered(body):
	if body.is_in_group(group):
		inRange.append(body)
		print(inRange)
		
func areaExited(body):
	if body in inRange:
		inRange.erase(body)
		print(inRange)
