extends AnimatedSprite

var current_dir
var velocity
var no_vel

# Setting Animations based on velocity

func animated():
	
	if velocity.x > 0:
		play("walk_right")
		current_dir = "right"
	if velocity.x < 0:
		play("walk_left")
		current_dir = "left"
	if velocity.y > 0:
		play("walk_down")
		current_dir = "down"
	if velocity.y < 0:
		play("walk_up")
		current_dir = "up"
	

# Setting Idle based on direction and velocity

func idle():
	
	# Checking if there is no velocity
	
	if velocity == Vector2(0, 0):
		no_vel = true
	else:
		no_vel = false
	
	if no_vel:
		if current_dir == "right":
			play("right_idle")
		if current_dir == "left":
			play("left_idle")
		if current_dir == "up":
			play("up_idle")
		if current_dir == "down":
			play("down_idle")
	


func _process(_delta):
	
	# Getting velocity from the Character Control Script
	
	velocity = get_parent().get_parent().get("velocity")
	
	animated()
	idle()
	
	# For testing purposes
#	print(velocity)
#	print(current_dir)
#	print(no_vel)
	
