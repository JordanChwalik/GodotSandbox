extends Area2D
signal hit

@export var speed = 100
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_up"): velocity.y -= 1
	if Input.is_action_pressed("move_down"): velocity.y += 1
	if Input.is_action_pressed("move_right"): velocity.x += 1
	if Input.is_action_pressed("move_left"): velocity.x -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	if velocity.x != 0:
		$AnimatedSprite2D.play("move_horizontal")
		$AnimatedSprite2D.flip_v = velocity.y > 0
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite2D.play("move_vertical")
		$AnimatedSprite2D.flip_v = velocity.y > 0
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	


func _on_body_entered(body):
	print("Collision Detected")
	hide()
	hit.emit()
	$CollisionShape2D.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false