extends StaticBody2D

const SPEED = -135


func _physics_process(delta):
	move_local_x(delta * SPEED)


func _on_wall_despawn_area_area_entered(area):
	queue_free()



