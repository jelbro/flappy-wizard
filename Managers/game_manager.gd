extends Node

signal timer

@onready var game_over = %GameOver
@onready var highscore_screen = %HighscoreScreen

var count_number = 4


func _ready():
	get_tree().paused = true


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


func _on_button_pressed():
	%StartScreen.visible = false
	%CountDown.visible = true
	%CountDownTimer.start(0.7)


func _on_count_down_timer_timeout():
	%TimerLabel.text = (str(count_number - 1))
	count_number -= 1
	if count_number == 0:
		%CountDownTimer.stop()
		%CountDown.visible = false
		%ScoreBoard.visible = true
		get_tree().paused = false
		timer.emit()
