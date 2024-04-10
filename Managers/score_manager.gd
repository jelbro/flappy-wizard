extends Node

@export var score_panel_scene: PackedScene

@onready var high_score_screen = %HighscoreScreen
@onready var v_box_container = %VBoxContainer

var score = 0
var player_name: String
var player_high_score = 0

var highscores: Dictionary
var gameSave = SaveGame.new()
var save_path = "user://scoresave.tres"


func _ready():
	load_game()
	


func _on_player_score_point():
	score += 1
	%ScoreLabel.text = "Score: " + str(score)


func update_highscores(player_name):
	var name = player_name
	var score = player_high_score
	
	for entry in highscores:
		print(entry)
		print(score)
		print(highscores[entry])
		if str(entry) != name:
			pass
		else:
			if score > highscores[entry]:
				pass
			else:
				return
	
	highscores[name] = score
	
	while highscores.size() > 10:
		var lowest_value: int = 100
		for entry in highscores:
			if highscores[entry] < lowest_value:
				lowest_value = highscores[entry]

		for logged in highscores:
			if highscores[logged] == lowest_value:
				highscores.erase(logged)
	save_game()


func order_highscores(highscores: Dictionary) -> Dictionary:
	var original_dict: Dictionary = highscores.duplicate()
	var ordered_dict: Dictionary
	for i in original_dict.size():
		var highest_score: int = 0
		for entry in original_dict:
			if original_dict[entry] > highest_score:
				highest_score = original_dict[entry]
		ordered_dict[original_dict.find_key(highest_score)] = highest_score
		original_dict.erase(original_dict.find_key(highest_score))
	return ordered_dict


func save_game():
	ResourceSaver.save(gameSave, save_path)


func load_game():
	if FileAccess.file_exists(save_path):
		gameSave = ResourceLoader.load(save_path).duplicate(true)
		highscores = gameSave.highscores
	else:
		printerr('No save file found at path')


func _on_line_edit_text_submitted(input_name):
	player_name = input_name
	player_high_score = score
	update_highscores(player_name)
	highscores = order_highscores(highscores)
	print(highscores)
	draw_highscores_to_ui(highscores)
	high_score_screen.visible = true


func draw_highscores_to_ui(highscores):
	for i in v_box_container.get_child_count():
		if get_child(i) != null:
			v_box_container.get_child(i).queue_free()
	
	for entry in highscores:
		var score_panel = score_panel_scene.instantiate()
		score_panel.get_child(0).text = entry
		score_panel.get_child(1).text = str(highscores[entry]).pad_zeros(3)
		v_box_container.add_child(score_panel)
