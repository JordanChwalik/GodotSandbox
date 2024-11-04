extends RigidBody2D

@export var speed = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func change_looking_direction(look_direction):
	if look_direction.length() > 0:
		$LookingPoint.position = look_direction.normalized() * 100
	# Handle sprite looking direction here
		var angle = get_angle_to($LookingPoint.global_position)
		$LookingPoint.rotation = angle
	
func mouse_and_keyboard_movement(delta):
	var velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down", 0.3)	
	velocity = velocity.normalized()
	velocity = velocity * speed * delta
	move_and_collide(velocity)
	
	change_looking_direction(get_global_mouse_position() - global_position)

func shoot_projectile():
	var projectile = load("res://Scenes/fireball.tscn")
	var test_pos = $LookingPoint.get_global_position()
	var instance = projectile.instantiate()
	instance.start_position = $LookingPoint.get_global_position()
	instance.rotation = get_angle_to($LookingPoint.get_global_position())
	instance.direction = (get_global_mouse_position() - global_position).normalized()
	call_deferred("add_sibling", instance)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mouse_and_keyboard_movement(delta)
	if Input.is_action_just_pressed("ui_accept"):
		print("Shooting")
		shoot_projectile()
		
