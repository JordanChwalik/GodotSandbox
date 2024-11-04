extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	var player = load("res://Scenes/player.tscn").instantiate()
	call_deferred("add_child", player)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
