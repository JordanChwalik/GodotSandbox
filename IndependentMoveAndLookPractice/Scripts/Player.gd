extends RigidBody2D
@export var speed = 50

var mouse_and_keyboard = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventKey:
		mouse_and_keyboard = true
	elif event is InputEventMouse:
		mouse_and_keyboard = true
	elif event is InputEventJoypadMotion:
		mouse_and_keyboard = false
	elif event is InputEventJoypadButton:
		mouse_and_keyboard = false


func change_looking_direction(look_direction):
	if look_direction.length() > 0:
		$LookingPoint.position = look_direction.normalized() * 100
	# Handle sprite looking direction here
		var angle = get_angle_to($LookingPoint.global_position)
		if angle > -PI / 8 and angle < PI / 8:
			print("Look right")
		elif angle >= PI / 8 and angle < 3 * PI / 8:
			print("Look down right")
		elif angle >= 3 * PI / 8 and angle < 5 * PI / 8:
			print("Look down")
		elif angle >= 5 * PI / 8 and angle < 7 * PI / 8:
			print("Look down left")
		elif angle >= 7 * PI / 8 or angle <= -7 * PI / 8:
			print("Look left")
		elif angle > -7 * PI / 8 and angle <= -5 * PI / 8:
			print("Look up left")
		elif angle > -5 * PI / 8 and angle <= -3 * PI / 8:
			print("Look up")
		else:
			print("Look up right")
	
func mouse_and_keyboard_movement(delta):
	var velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down", 0.3)	
	velocity = velocity.normalized()
	velocity = velocity * speed * delta
	move_and_collide(velocity)
	
	change_looking_direction(get_global_mouse_position() - global_position)


func controller_movment(delta):
	var velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down", 0.3)	
	if velocity.length() > 1:
		velocity = velocity.normalized()
	velocity = velocity * speed * delta
	move_and_collide(velocity)
	
	change_looking_direction(Input.get_vector("look_left", "look_right", "look_up", "look_down", 0.3))
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if mouse_and_keyboard:
		mouse_and_keyboard_movement(delta)
	else:
		controller_movment(delta)
