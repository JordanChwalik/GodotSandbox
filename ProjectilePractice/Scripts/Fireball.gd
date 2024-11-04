extends RigidBody2D
@export var max_distance = 1000
@export var speed = 10

# Set from parent
var direction = Vector2.ZERO
var start_position = Vector2.ZERO


func _ready():
	global_position = start_position
	print($HurtBox.get_collision_layer())
	pass # Replace with function body.

func _process(_delta):
	move_and_collide(direction.normalized() * speed);
	if global_position.distance_squared_to(start_position) >= max_distance:
		print("max distance exceeded")
		queue_free()



func _on_hurt_box_area_entered(_area):
	print("Hit target")
	queue_free()
