extends Node

@onready var game_over = %GameOver

func _on_player_dead():
	game_over.visible = true


func _on_play_button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_exit_button_pressed():
	get_tree().quit()
