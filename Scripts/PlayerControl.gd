extends KinematicBody2D

export var speed = 80

var velocity = Vector2()

# Character Movement Controls

func input():
	# Detect Input
	velocity = Vector2()
	
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		#print("left")
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		#print("right")
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		#print("up")
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		#print("down")
		
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	
	input()
	move_and_collide(velocity * delta)
	

# Character Interact Controls


func interact():
	
	# If "E" is pressed, it emits the interacted signal
	
	if Input.is_action_just_pressed("interact"):
		#print("trying to interact")
		for interactable in $GroupTracker.inRange:
			interactable.recieve_interaction(self)
	


func _process(delta):
	
	interact()
	


