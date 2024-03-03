extends Node2D
var cambiar_escena = false
var escena_actual = "primercastle"

func _on_zona_inicial_body_entered(body):
	if body.is_in_group("Jugador"):
		cambiar_escena = true
		change_scenes()

func change_scenes():
	if cambiar_escena == true:
		if escena_actual == "primercastle":
			get_tree().change_scene_to_file("res://zona Inical.tscn")


func _on_area_2d_body_entered(body):
	if body.is_in_group("Jugador") && Global.castillo==false:
		$TileMap/Area2D/Sprite2D.show()
		Global.castillo = true
		Global.caida = true
		await get_tree().create_timer(0.20).timeout
		Global.caida = false
		get_tree().change_scene_to_file("res://mazmorra con ruleta.tscn")


func _on_area_2d_2_body_entered(body):
	if body.is_in_group("Jugador") :
		get_tree().change_scene_to_file("res://Victoria.tscn")
