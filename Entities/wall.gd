extends StaticBody2D

@export var speed = -135

@onready var wall_manager = get_tree().get_first_node_in_group("wall_manager")


func _physics_process(delta):
	if wall_manager.stop == true:
		speed = 0
	move_local_x(delta * speed)
	print("in wall speed =" + str(speed))

func _on_wall_despawn_area_area_entered(area):
	queue_free()


#func _on_player_dead():
#	get_tree().paused = true


func _on_player_wall_stop():
	speed = 0
