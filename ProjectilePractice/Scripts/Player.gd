extends RigidBody2D
var direction = Vector2.ZERO
@export var speed = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	
	velocity = velocity.normalized()
	velocity = velocity * speed * delta
	move_and_collide(velocity)
	
	if Input.is_action_pressed("look_up"):
		# Do something
	if Input.is_action_pressed("look_down"):
		# Do something
	if Input.is_action_pressed("look_left"):
		# Do something
	if Input.is_action_pressed("look_right"):
		# Do something
	pass
