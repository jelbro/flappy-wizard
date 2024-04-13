extends ParallaxBackground

var speed = 30

func _process(delta):
	scroll_offset.x -= speed * delta


func _on_player_player_wall_stop():
	speed = 0
