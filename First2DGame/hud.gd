extends CanvasLayer
signal start_game


func _on_start_button_pressed():
	start_game.emit()
	$StartButton.hide()

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()


func show_game_over():
	show_message("Game Over")
	await $MessageTimer.timeout
	
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()
	
	$Message.text = "Dodge the Creeps!"
	$Message.show()
	
func update_score(score):
	$ScoreLabel.text = str(score)

func _on_message_timer_timeout():
	$Message.hide()