extends Node2D
var cambiar_escena = false
var escena_actual = "zona Inical"

# Called when the node enters the scene tree for the first time.
func _ready():
	$MapaInicial/Jugador.position = Global.posicion

func _process(delta):
		if Global.espadahabilitada == true:
			$MapaInicial/StaticBody2D.position = Vector2(-1000,-1000)
			$MapaInicial/StaticBody2D2.position = Vector2(-1000,-1000)
			$MapaInicial/StaticBody2D3.position = Vector2(-1000,-1000)
		if ($MapaInicial/Jugador.position.x >= 1326 && $MapaInicial/Jugador.position.x <= 1382 && $MapaInicial/Jugador.position.y <= 742 && $MapaInicial/Jugador.position.y >= 691 && Global.espadahabilitada==false  or $MapaInicial/Jugador.position.x >= 392 && $MapaInicial/Jugador.position.x <= 458 && $MapaInicial/Jugador.position.y <= 1508 && $MapaInicial/Jugador.position.y >= 1470 && Global.espadahabilitada==false or $MapaInicial/Jugador.position.x >= -830 && $MapaInicial/Jugador.position.x <= -778 && $MapaInicial/Jugador.position.y <= 750 && $MapaInicial/Jugador.position.y >= 689 && Global.espadahabilitada==false):
			$MapaInicial/Jugador/AvisosLabel.set_text("Presione ENTER para interactuar")
			if Input.is_key_pressed(KEY_ENTER):
				$MapaInicial/Jugador/NinePatchRect/TextureRect.hide()
				$MapaInicial/Jugador/NinePatchRect/TextureRect2.show()
				$MapaInicial/Jugador/NinePatchRect.show()
				$MapaInicial/Jugador/NinePatchRect/Label.set_text("No puedes pasar hasta que tengas un arma")
		else:
			$MapaInicial/Jugador/NinePatchRect/Label.set_text("")
			$MapaInicial/Jugador/NinePatchRect.hide()
			$MapaInicial/Jugador/AvisosLabel.set_text("")
		if Global.caida==true:
			$MapaInicial/Jugador.position.y+=4
func _on_area_2d_body_entered(body):
	if body.is_in_group("Jugador"):
		Global.posicion= Vector2($MapaInicial/Jugador.position.x,$MapaInicial/Jugador.position.y+10)
		get_tree().change_scene_to_file("res://primercastle.tscn")


func _on_area_2d_3_body_entered(body):
	if body.is_in_group("Jugador"):
		if Global.entroenpiramide==true:
			$MapaInicial/Sprite2D3.show()
			Global.caida = true


func _on_area_2d_4_body_entered(body):
	if body.is_in_group("Jugador"):
		Global.caida = false
		get_tree().change_scene_to_file("res://buceozone.tscn")


func _on_area_2d_2_body_entered(body):
	if body.is_in_group("Jugador"):
		Global.videdurantecombate=Global.vida
		Global.entroenpiramide=true
