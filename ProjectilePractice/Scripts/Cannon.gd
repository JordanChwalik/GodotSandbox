extends Node2D



func _on_timer_timeout():
	var projectile = load("res://Scenes/fireball.tscn").instantiate()
	projectile.start_position = $Marker2D.get_global_position()
	projectile.direction = Vector2(1, 0)
	call_deferred("add_sibling", projectile)
