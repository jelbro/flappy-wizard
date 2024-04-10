extends Node

@onready var game_over = %GameOver
@onready var highscore_screen = %HighscoreScreen


func _on_player_dead():
	game_over.visible = true


func _on_play_button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_highscore_play_again_button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_exit_button_pressed():
	get_tree().quit()


func _on_highscore_exit_button_pressed():
	get_tree().quit()
