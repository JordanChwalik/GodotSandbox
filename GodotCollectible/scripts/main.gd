extends Node
@export var CollectibleScene: PackedScene
var screen_size
# Called when the node enters the scene tree for the first time.
func _ready():
	print("Player position: ", $Player.position)
	screen_size = get_viewport().size
	spawn_collectible()
	pass

# Randomly spawn a collectible in the screen
func spawn_collectible():
	var spawn_x = randf_range(20, screen_size.x - 20)
	var spawn_y = randf_range(20, screen_size.y - 20)
	var spawn_point = Vector2(spawn_x, spawn_y)
	var collectible = CollectibleScene.instantiate()
	print("instance created")
	collectible.get_collected.connect(_on_collectible_get_collected)
	collectible.position = spawn_point
	print(spawn_point)
	add_child(collectible)


func _on_collectible_get_collected():
	print("Main running on_collectible_get_collected")
	spawn_collectible()
	pass # Replace with function body.
