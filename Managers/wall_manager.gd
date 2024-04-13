extends Node

@onready var wall_spawn_point = $"../WallSpawnPoint"
@onready var score_area_point = $"../ScoreAreaSpawnPoint"
@onready var timer = $Timer


@export var score_area: PackedScene
@export var wall_scenes: Array[PackedScene]


@export var stop = false


func _ready():
	var selected_wall = wall_scenes.pick_random()
	var wall = selected_wall.instantiate() as Node2D
	var score_area = score_area.instantiate() as Node2D
	var entities = get_tree().get_first_node_in_group("entities") as Node
	entities.add_child(wall)
	entities.add_child(score_area)
	score_area.global_position = score_area_point.global_position
	wall.global_position = wall_spawn_point.global_position


func _on_timer_timeout():
	var selected_wall = wall_scenes.pick_random()
	var wall = selected_wall.instantiate() as Node2D
	var score_area = score_area.instantiate() as Node2D
	var entities = get_tree().get_first_node_in_group("entities") as Node
	entities.add_child(wall)
	entities.add_child(score_area)
	score_area.global_position = score_area_point.global_position
	wall.global_position = wall_spawn_point.global_position
	if timer.wait_time > 0.9:
		timer.wait_time -= 0.02
		print(timer.wait_time)


func _on_player_player_wall_stop():
	stop = true
