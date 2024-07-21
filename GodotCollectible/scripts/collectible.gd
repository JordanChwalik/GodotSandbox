extends Area2D
signal get_collected

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_body_entered(_body):
	print("Body entered")
	get_collected.emit()
	call_deferred("free")
	
	pass # Replace with function body.
