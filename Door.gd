extends Interactable

# exported Variables

export var requiredKey = ""

export(Texture) var doorClosed
export(Texture) var doorOpen

func _ready():
	
	$Sprite.texture = doorClosed
	
	self.connect("interacted", self, "on_interact")
	

func on_interact(user):
	
	var player_keylist = user.get_node("PlayerData").keys
	
	if requiredKey in player_keylist:
		$CollisionShape2D.queue_free()
		
		$Sprite.texture = doorOpen
		
		player_keylist.erase(requiredKey)
	else:
		print("does not have key")
