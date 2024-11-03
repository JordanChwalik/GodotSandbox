extends CollisionShape2D
@export var speed = 50
@export var type = "None"
@export var damage = 10
@export var max_distance = 200
var start_position

# Called when the node enters the scene tree for the first time.
func _ready():
	start_position = get_global_position()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_global_position() - start_position > max_distance:
		call_deferred("queue_free")
	pass
