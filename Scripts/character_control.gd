extends KinematicBody2D


export var speed = 10

var velocity = Vector2()

func input():
	# Detect Input
	velocity = Vector2()
	
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		#print("left")
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		#print("right")
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		#print("up")
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		#print("down")
		
	velocity = velocity.normalized() * speed


func _physics_process(delta):
	
	input()
	move_and_collide(velocity * delta)
	
	pass # Replace with function body.

