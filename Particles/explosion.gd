extends Node2D

const SPEED = -150


func _physics_process(delta):
	move_local_x(delta * SPEED)

