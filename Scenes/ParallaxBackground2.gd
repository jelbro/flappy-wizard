extends ParallaxBackground

var speed = 175

func _process(delta):
	scroll_offset.x -= speed * delta


func _on_player_player_wall_stop():
	print("helllo bitch")
	speed = 0
