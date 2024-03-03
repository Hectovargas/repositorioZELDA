extends Node2D
var cambiar_escena = false
var escena_actual = "zona Inical"
var esqueleto = preload("res://esqueleto.tscn")
var numeroaleatorio
var random = RandomNumberGenerator.new()
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
		Global.pelea2 = true
		Global.posicion= Vector2($MapaInicial/Jugador.position.x+200,$MapaInicial/Jugador.position.y-100)
		get_tree().change_scene_to_file("res://buceozone.tscn")


func _on_area_2d_2_body_entered(body):
	if body.is_in_group("Jugador"):
		Global.pelea2 = true
		Global.videdurantecombate=Global.vida
		Global.entroenpiramide=true
		Global.posicion= Vector2($MapaInicial/Jugador.position.x,$MapaInicial/Jugador.position.y+20)
		get_tree().change_scene_to_file("res://zone_desert.tscn")


func _on_area_2d_5_body_entered(body):
		if body.is_in_group("Jugador"):
			$MapaInicial/Jugador.position= Vector2($MapaInicial/Area2D6/CollisionShape2D.position.x,$MapaInicial/Area2D6/CollisionShape2D.position.y+20)
			


func _on_area_2d_6_body_entered(body):
		if body.is_in_group("Jugador"):
			$MapaInicial/Jugador.position= Vector2($MapaInicial/Area2D5/CollisionShape2D.position.x,$MapaInicial/Area2D5/CollisionShape2D.position.y+20)

func _on_area_2d_7_body_entered(body):
		if body.is_in_group("Jugador"):
			Global.pelea4 = true
			Global.videdurantecombate= Global.vida
			Global.posicion= Vector2($MapaInicial/Jugador.position.x,$MapaInicial/Jugador.position.y+20)
			get_tree().change_scene_to_file("res://zone_mountains.tscn")


func _on_area_2d_8_body_entered(body):
		if body.is_in_group("Jugador"):
			Global.videdurantecombate= Global.vida
			get_tree().change_scene_to_file("res://universidad.tscn")


func _on_area_2d_9_body_entered(body):
		if body.is_in_group("Jugador"):
			Global.pelea1 = true
			Global.videdurantecombate= Global.vida
			Global.posicion= Vector2($MapaInicial/Jugador.position.x,$MapaInicial/Jugador.position.y+20)
			get_tree().change_scene_to_file("res://zona_war.tscn")


func _on_timer_timeout():
	if Global.espadahabilitada == true:
		var enemigo = esqueleto.instantiate()
		numeroaleatorio = random.randi_range(0, 10)
		match numeroaleatorio:
			0:
				enemigo.position = $Marker2D.position
			1:
				enemigo.position = $Marker2D2.position
			2:
				enemigo.position = $Marker2D3.position
			3:
				enemigo.position = $Marker2D4.position
			4:
				enemigo.position = $Marker2D5.position
			5:
				enemigo.position = $Marker2D6.position
			6:
				enemigo.position = $Marker2D7.position
			7:
				enemigo.position = $Marker2D8.position
			8:
				enemigo.position = $Marker2D9.position
			9:
				enemigo.position = $Marker2D10.position
			10:
				enemigo.position = $Marker2D11.position
		add_child(enemigo)
