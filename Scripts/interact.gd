extends Interactable


func _ready():
	
	self.connect("interacted", self, "on_interact")
	

func on_interact(user):
	
	print("interacted")
	
