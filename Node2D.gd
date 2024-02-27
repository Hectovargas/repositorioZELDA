extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.nadando=false
	Global.caida=true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Jugador.position.y+=1


func _on_area_2d_body_entered(body):
	if body.is_in_group("Jugador"):
		Global.caida=false
		get_tree().change_scene_to_file("res://zona_war.tscn")
	
	
