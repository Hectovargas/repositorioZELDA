extends Node2D
var cambiar_escena = false
var escena_actual = "zona Inical"
var esqueleto = preload("res://esqueleto.tscn")
var numeroaleatorio
var espera= true
var espera2 = true
var desert = true
var estoydentro = false
var snow = true
var advertenciadesierto = false
var estoyendesert = false
var advertencianieve = false
var estoyennieve = false
var random = RandomNumberGenerator.new()
var boole1 = false
var boole2 = false
var boole3 = false
var boole4 = false
var boole5 = false
var boole6 = false
var boole7 = false
var boole8 = false
var boole9 = false
var boole10 = false
var boole11 = false
var cont = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.escene = "res://zona Inical.tscn"
	$MapaInicial/Jugador.position = Global.posicion

func _process(delta):
	if Global.pelea3 && Global.pelea2:
		$MapaInicial/Area2D5/Sprite2D.position = Vector2(10000,10000)
	if Global.espadahabilitada == true:
		$MapaInicial/Jugador/Camera2D/Panel/NinePatchRect/Button2.show()
	if Global.pelea1==true:
		$MapaInicial/Jugador/Camera2D/Panel/NinePatchRect/Button3.show()
	if Global.pelea2==true:
		$MapaInicial/Jugador/Camera2D/Panel/NinePatchRect/Button4.show()
	if $MapaInicial/Jugador.position.x > $MapaInicial/Marker2D.position.x && $MapaInicial/Jugador.position.y < $MapaInicial/Marker2D.position.y && advertencianieve == false && Global.trajeantifrio==false:
		print("snow")
		estoyennieve=true
		advertencianieve=true
		$MapaInicial/Jugador/NinePatchRect.show()
		$MapaInicial/Jugador/NinePatchRect/Label.set_text("¡Ponte el traje anti frio o perderas vida!")
		await get_tree().create_timer(3).timeout
		$MapaInicial/Jugador/NinePatchRect.hide()
		estoyennieve=false
		espera=false
	if $MapaInicial/Jugador.position.x > $MapaInicial/Marker2D.position.x && $MapaInicial/Jugador.position.y < $MapaInicial/Marker2D.position.y && Global.trajeantifrio==false && espera==false:
		print("snow")
		espera=true
		Global.vida-=1
		await get_tree().create_timer(2).timeout
		espera=false
#------------------------------------------------------------
	if $MapaInicial/Marker2D2.position.x>$MapaInicial/Jugador.position.x && advertenciadesierto == false && Global.trajeanticalor==false:
		print("desert")
		estoyendesert=true
		advertenciadesierto=true
		$MapaInicial/Jugador/NinePatchRect.show()
		$MapaInicial/Jugador/NinePatchRect/Label.set_text("¡Ponte el traje anti calor o perderas vida!")
		await get_tree().create_timer(3).timeout
		$MapaInicial/Jugador/NinePatchRect.hide()
		estoyendesert=false
		espera2=false
	if $MapaInicial/Marker2D2.position.x>$MapaInicial/Jugador.position.x && Global.trajeanticalor==false && espera2==false:
		print("desert")
		estoydentro=true
		espera2=true
		Global.vida-=1
		await get_tree().create_timer(2).timeout
		espera2=false
#----------------------------------
	if(Global.espadahabilitada):
		$MapaInicial/Jugador/Camera2D/Panel/NinePatchRect/Button/Sprite2D2.show()
		$MapaInicial/Jugador/Camera2D/Panel/NinePatchRect/Button/Sprite2D.hide()
	if Global.trifuerza==true:
		$Sprite2D.show()
	if Global.pelea1 == true:
		if Global.dialogo==true:
			$MapaInicial/Jugador/NinePatchRect.show()
			$MapaInicial/Jugador/NinePatchRect/Label.set_text("Aún no puedo hablar contigo,entra al castillo primero.")
			$MapaInicial/Jugador/NinePatchRect/TextureRect.hide()
		else:
			$MapaInicial/Jugador/NinePatchRect/Label.set_text("")
			$MapaInicial/Jugador/NinePatchRect.hide()
			$MapaInicial/Jugador/AvisosLabel.set_text("")
	if Global.pelea2 == true:
		if Global.dialogo==true:
			$MapaInicial/Jugador/NinePatchRect.show()
			$MapaInicial/Jugador/NinePatchRect/Label.set_text("Aún no puedo hablar contigo,entra al castillo primero.")
			$MapaInicial/Jugador/NinePatchRect/TextureRect.hide()
		else:
			$MapaInicial/Jugador/NinePatchRect/Label.set_text("")
			$MapaInicial/Jugador/NinePatchRect.hide()
			$MapaInicial/Jugador/AvisosLabel.set_text("")
	if Global.espadahabilitada == true:
		$MapaInicial/StaticBody2D.position = Vector2(-1000,-1000)
		$MapaInicial/StaticBody2D2.position = Vector2(-1000,-1000)
		$MapaInicial/StaticBody2D3.position = Vector2(-1000,-1000)
	if ($MapaInicial/Jugador.position.x >= 1326 && $MapaInicial/Jugador.position.x <= 1382 && $MapaInicial/Jugador.position.y <= 742 && $MapaInicial/Jugador.position.y >= 691 && Global.espadahabilitada==false  or $MapaInicial/Jugador.position.x >= 392 && $MapaInicial/Jugador.position.x <= 458 && $MapaInicial/Jugador.position.y <= 1508 && $MapaInicial/Jugador.position.y >= 1470 && Global.espadahabilitada==false or $MapaInicial/Jugador.position.x >= -830 && $MapaInicial/Jugador.position.x <= -778 && $MapaInicial/Jugador.position.y <= 750 && $MapaInicial/Jugador.position.y >= 689 && Global.espadahabilitada==false):
		estoydentro=true
		$MapaInicial/Jugador/AvisosLabel.set_text("Presione ENTER para interactuar")
		if Input.is_key_pressed(KEY_ENTER):
			$MapaInicial/Jugador/NinePatchRect/TextureRect.hide()
			$MapaInicial/Jugador/NinePatchRect/TextureRect2.show()
			$MapaInicial/Jugador/NinePatchRect.show()
			$MapaInicial/Jugador/NinePatchRect/Label.set_text("No puedes pasar hasta que tengas una buena espada")
	elif Global.dialogo==true:
		$MapaInicial/Jugador/NinePatchRect.show()
		$MapaInicial/Jugador/NinePatchRect/Label.set_text("Aún no puedo hablar contigo,entra al castillo primero.")
		$MapaInicial/Jugador/NinePatchRect/TextureRect.hide()
	elif estoyennieve==false && estoyendesert==false:
		print("afura")
		$MapaInicial/Jugador/NinePatchRect/Label.set_text("")
		$MapaInicial/Jugador/NinePatchRect.hide()
		$MapaInicial/Jugador/AvisosLabel.set_text("")
		
	if Global.caida==true:
			$MapaInicial/Jugador.position.y+=4
	if Global.pelea1 && Global.pelea2 && Global.pelea3 && Global.pelea4:
			Global.entradaCastillo=false
	if Global.vida < 1:
			get_tree().change_scene_to_file("res://gameover.tscn")
			
func _on_area_2d_body_entered(body):
	if body.is_in_group("Jugador"):
		if Global.entradaCastillo == false:
			Global.posicion= Vector2($MapaInicial/Jugador.position.x,$MapaInicial/Jugador.position.y+10)
			get_tree().change_scene_to_file("res://primercastle.tscn")
			Global.entradaCastillo=true


func _on_area_2d_3_body_entered(body):
	if body.is_in_group("Jugador"):
		if Global.pelea2==true && Global.pelea3==false:
			$MapaInicial/Sprite2D3.show()
			Global.caida = true


func _on_area_2d_4_body_entered(body):
	if body.is_in_group("Jugador"):
		Global.caida = false
		Global.pelea3 = true
		Global.posicion= Vector2($MapaInicial/Jugador.position.x+200,$MapaInicial/Jugador.position.y-100)
		get_tree().change_scene_to_file("res://buceozone.tscn")


func _on_area_2d_2_body_entered(body):
	if body.is_in_group("Jugador"):
		if Global.pelea1==true:
			if Global.pelea2==false:
				Global.pelea2 = true
				Global.videdurantecombate=Global.vida
				Global.entroenpiramide=true
				Global.posicion= Vector2($MapaInicial/Jugador.position.x,$MapaInicial/Jugador.position.y+20)
				get_tree().change_scene_to_file("res://zone_desert.tscn")
		else:
			Global.vida = 0

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
			if Global.pelea1==false:
				Global.pelea1 = true
				Global.videdurantecombate= Global.vida
				Global.posicion= Vector2($MapaInicial/Jugador.position.x,$MapaInicial/Jugador.position.y+20)
				get_tree().change_scene_to_file("res://zona_war.tscn")


func _on_timer_timeout():
	if Global.espadahabilitada == true:
		var enemigo = esqueleto.instantiate()
		if cont<11:
			numeroaleatorio = random.randi_range(0, 10)
			match numeroaleatorio:
				0:
					if boole1 == false:
						cont+=1
						enemigo.position = $Marker2D.position
					else:
						numeroaleatorio = random.randi_range(0, 10)
				1:
					if boole2 == false:
						cont+=1
						enemigo.position = $Marker2D2.position
					else:
						numeroaleatorio = random.randi_range(0, 10)
				2:
					if boole3 == false:
						cont+=1
						enemigo.position = $Marker2D3.position
					else:
						numeroaleatorio = random.randi_range(0, 10)
				3:
					if boole4 == false:
						cont+=1
						enemigo.position = $Marker2D4.position
					else:
						numeroaleatorio = random.randi_range(0, 10)
				4:
					if boole5 == false:
						cont+=1
						enemigo.position = $Marker2D5.position
					else:
						numeroaleatorio = random.randi_range(0, 10)
				5:
					if boole6 == false:
						cont+=1
						enemigo.position = $Marker2D6.position
					else:
						numeroaleatorio = random.randi_range(0, 10)
				6:
					if boole7 == false:
						cont+=1
						enemigo.position = $Marker2D7.position
					else:
						numeroaleatorio = random.randi_range(0, 10)
				7:
					if boole8 == false:
						cont+=1
						enemigo.position = $Marker2D8.position
					else:
						numeroaleatorio = random.randi_range(0, 10)
				8:
					if boole9 == false:
						cont+=1
						enemigo.position = $Marker2D9.position
					else:
						numeroaleatorio = random.randi_range(0, 10)
				9:
					if boole10 == false:
						cont+=1
						enemigo.position = $Marker2D10.position
					else:
						numeroaleatorio = random.randi_range(0, 10)
				10:
					if boole11 == false:
						cont+=1
						enemigo.position = $Marker2D11.position
					else:
						numeroaleatorio = random.randi_range(0, 10)
		add_child(enemigo)


func _on_area_2d_10_body_entered(body):
	if body.is_in_group("Jugador"):
		if Global.trifuerza==true:
			get_tree().change_scene_to_file("res://universidad.tscn")
		else:
			$MapaInicial/Jugador/NinePatchRect.show()
			$MapaInicial/Jugador/NinePatchRect/Label.set_text("Aun No eres Digno de entrar A UNITEC")
			await get_tree().create_timer(3).timeout
			$MapaInicial/Jugador/NinePatchRect.hide()


func _on_button_4_pressed():
	if Global.supervelicidad==false:
		Global.supervelicidad=true
		$MapaInicial/Jugador/Camera2D/Panel/NinePatchRect/Button4/PointLight2D.show()
	else:
		Global.supervelicidad=false
		$MapaInicial/Jugador/Camera2D/Panel/NinePatchRect/Button4/PointLight2D.hide()


func _on_button_3_pressed():
	if Global.trajeanticalor == false:
		Global.trajeanticalor=true
		Global.trajeantifrio=false
		$MapaInicial/Jugador/Camera2D/Panel/NinePatchRect/Button3/PointLight2D.show()
		$MapaInicial/Jugador/Camera2D/Panel/NinePatchRect/Button2/PointLight2D.hide()
	else:
		Global.trajeanticalor=false
		$MapaInicial/Jugador/Camera2D/Panel/NinePatchRect/Button3/PointLight2D.hide()


func _on_button_2_pressed():
	if Global.trajeantifrio == false:
		Global.trajeanticalor=false
		Global.trajeantifrio=true
		$MapaInicial/Jugador/Camera2D/Panel/NinePatchRect/Button2/PointLight2D.show()
		$MapaInicial/Jugador/Camera2D/Panel/NinePatchRect/Button3/PointLight2D.hide()
	else:
		Global.trajeantifrio=false
		$MapaInicial/Jugador/Camera2D/Panel/NinePatchRect/Button2/PointLight2D.hide()


func _on_button_pressed():
	pass # Replace with function body.
