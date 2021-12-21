extends Camera2D


export(NodePath) var following_node 

var attached_node_position

# Called when the node enters the scene tree for the first time.
func _ready():
	follow(get_node(following_node))
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = attached_node_position.position

func follow(node):
	following_node = node.get_path()
	attached_node_position = node
