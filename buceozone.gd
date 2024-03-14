extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.escene = "res://buceozone.tscn"
	Global.nadando=true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.is_in_group("Jugador"):
		get_tree().change_scene_to_file("res://caidahaciapelea.tscn")
