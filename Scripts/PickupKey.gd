extends Interactable


# Exported Variables

export var keyName = ""

export(Texture) var keyTexture

# Functions

func _ready():
	
	$Sprite.texture = keyTexture
	
	self.connect("interacted", self, "on_interact")

func on_interact(user):
	
	user.get_node("PlayerData").keys.append(keyName)
	
	queue_free()
	



