extends StaticBody2D
var vida = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _process(delta):
	position.y += 0.050
	if vida == 0:
		vida=1
		$AnimatedSprite2D.play("new_animation")
		await get_tree().create_timer(0.5).timeout
		$AnimatedSprite2D.play("default")

func _on_area_2d_area_entered(area):
	if area.is_in_group("arrow"):
		if is_in_group("enemys") && Global.conshoo == 0:
			print("colidekill")
			Global.correcto=true
			vida = 0
		elif Global.conshoo == 1 && is_in_group("enemys2"):
			print("colidekill2")
			Global.correcto=true
			vida = 0
		elif Global.conshoo == 2 && is_in_group("enemys2") :
			print("colidekill2")
			Global.correcto=true
			vida = 0
		elif Global.conshoo == 4 && is_in_group("enemys2"):
			print("colidekill2")
			Global.correcto=true
			vida = 0
		elif Global.conshoo == 3 && is_in_group("enemys3"):
			vida = 0
			Global.correcto=true
			print("colidekill3")
		else:
			Global.incorrecto=true
		print("------------------------------")
		print("pre"+str(Global.conshoo))
		Global.conshoo+=1
		print("pos"+str(Global.conshoo))
		
			
