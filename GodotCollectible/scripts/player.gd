extends RigidBody2D
signal pickup_collectible

@export var speed = 500
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	
	velocity = velocity.normalized()
	velocity *= speed
	velocity *= delta
	move_and_collide(velocity)
	
	pass


func _collect_spell():
	print("Player recognizes spell")
	pass # Replace with function body.
