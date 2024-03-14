extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("arrow")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	position.y -=5


func _on_area_2d_body_entered(body):
	if body.is_in_group("enemys"):
		queue_free()
		print("impacte1")
		if Global.conshoo == 0:
			Global.correcto = true
	if body.is_in_group("enemys2"):
		queue_free()
		print("impacte2")
		if Global.conshoo == 1 || Global.conshoo == 2 || Global.conshoo == 4:
			Global.correcto = true
	if body.is_in_group("enemys3"):
		queue_free()
		print("impacte3")
		if Global.conshoo == 3:
			Global.correcto = true
	if body.is_in_group("enemys4"):
		queue_free()
		print("impacte4")
