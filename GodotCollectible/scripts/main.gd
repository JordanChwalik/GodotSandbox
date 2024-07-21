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
	# Create a spawn point for a collectible
	var spawn_x = randf_range(20, screen_size.x - 20)
	var spawn_y = randf_range(20, screen_size.y - 20)
	var spawn_point = Vector2(spawn_x, spawn_y)
	
	# Create the collectible and assign it a spawn point
	var collectible = CollectibleScene.instantiate()
	collectible.position = spawn_point
	print(spawn_point)
	
	# Connect the signal from the collectible to current node (main)
	collectible.get_collected.connect(_on_collectible_get_collected)
	
	# Add the collectible to the tree and make it discoverable
	add_child(collectible)


func _on_collectible_get_collected():
	print("Main running on_collectible_get_collected")
	spawn_collectible()
	pass # Replace with function body.
