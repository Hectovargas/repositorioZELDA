extends Node2D
var animated_sprite = AnimatedSprite2D.new()
var texto = "Aparentemente he caido en una trampa"
var i = 0
var j = 0
var textos=""
var probabilidades_politica = 2000
var probabilidades_Historia = 2000
var probabilidades_Ciencia = 2000
var probabilidades_Arte = 2000
var finishcondition = false

func _ready():
	if Global.politica==true:
		probabilidades_Arte*3
		probabilidades_Ciencia*3
		probabilidades_Historia*3
	if Global.historia==true:
		probabilidades_Arte*3
		probabilidades_Ciencia*3
		probabilidades_politica*3
	if Global.ciencia==true:
		probabilidades_Arte*3
		probabilidades_politica*3
		probabilidades_Historia*3
	if Global.arte==true:
		probabilidades_politica*3
		probabilidades_Ciencia*3
		probabilidades_Historia*3
	
func _process(delta):
	if finishcondition == false:
		if(Global.arte == false || Global.historia == false || Global.ciencia == false || Global.politica == false):
			if $TileMap/Jugador.position.x >= 450 && $TileMap/Jugador.position.x <= 550 && $TileMap/Jugador.position.y <= 650 && $TileMap/Jugador.position.y >= 550 && Global.dialog == false:
				if i<36:
					$TileMap/Jugador/NinePatchRect.show()
					textos = $TileMap/Jugador/NinePatchRect/Label.text+(texto[i])
					$TileMap/Jugador/NinePatchRect/Label.set_text(textos)
					
				else:
					Global.dialog = true
					if Input.is_key_pressed(KEY_ENTER):
						$TileMap/Jugador/NinePatchRect.hide()
				i+=1
			else:
				await get_tree().create_timer(3).timeout
				$TileMap/Jugador/NinePatchRect.hide()
			var numeroaleatorio
			if $TileMap/Jugador.position.x >= 450 && $TileMap/Jugador.position.x <= 550 && $TileMap/Jugador.position.y <= 450 && $TileMap/Jugador.position.y >= 350:
				if(Global.ruleteado == false):
					$TileMap/Jugador/avisosLabel.set_text("Presione ENTER para interactuar")
				if Input.is_key_pressed(KEY_ENTER):
					if(Global.ruleteado == false):
						$TileMap/AnimatedSprite2D.play("default")
						Global.ruleteado = true;
					else:
						$TileMap/Jugador/avisosLabel.set_text("Ya le diste a la ruleta")
			else:
				$TileMap/Jugador/avisosLabel.set_text("")
			if $TileMap/AnimatedSprite2D.is_playing():
				
				var current_frame = $TileMap/AnimatedSprite2D.get_frame()
				var random = RandomNumberGenerator.new()
				numeroaleatorio = random.randi_range(0, 400000)
				print(current_frame)
				print(numeroaleatorio)
				if numeroaleatorio>=0 && numeroaleatorio<=(2*probabilidades_Ciencia)  && current_frame == 0 && Global.ciencia==false :
					Global.ciencia = true
					$TileMap/AnimatedSprite2D.pause()
					$TileMap/Jugador/Camera2D/TextureRect/Label.set_text("El resultado es: CIENCIA")
					$TileMap/Jugador/Camera2D/TextureRect.show()
					$Sprite2D.show()
					$StaticBody2D2.position = Vector2(0,0)
					Global.empezar=true
					
				if(numeroaleatorio>=(2*probabilidades_Arte)+1 && numeroaleatorio<=(4*probabilidades_Arte) && current_frame == 2 && Global.arte == false):
					Global.arte = true
					$TileMap/AnimatedSprite2D.pause()
					$TileMap/Jugador/Camera2D/TextureRect/Label.set_text("El resultado es: ARTE")
					$TileMap/Jugador/Camera2D/TextureRect.show()
					$Sprite2D2.show()
					$StaticBody2D3.position = Vector2(0,0)
					Global.empezar=true

				if(numeroaleatorio>=(4*probabilidades_Historia)+1 && numeroaleatorio<=(6*probabilidades_Historia) && current_frame == 4 && Global.historia == false):
					Global.historia=true
					$TileMap/AnimatedSprite2D.pause()
					$TileMap/Jugador/Camera2D/TextureRect/Label.set_text("El resultado es: HISTORIA")
					$TileMap/Jugador/Camera2D/TextureRect.show()
					$Sprite2D3.show()
					$StaticBody2D4.position = Vector2(0,0)
					Global.empezar=true
					
				if(numeroaleatorio>=(6*probabilidades_politica)+1 && numeroaleatorio<=(8*probabilidades_politica) && current_frame == 6 && Global.politica == false):
					Global.politica=true
					$TileMap/AnimatedSprite2D.pause()
					$TileMap/Jugador/Camera2D/TextureRect/Label.set_text("El resultado es: POLITICA")
					$TileMap/Jugador/Camera2D/TextureRect.show()
					$Sprite2D4.show()
					$StaticBody2D5.position = Vector2(0,0)
					Global.empezar=true
			if j<251:
				if Global.empezar == true:
					j+=1
					print (j)
					if j > 250:
						$TileMap/Jugador/Camera2D/TextureRect.hide()
						Global.empezar = false
		else:
			if $TileMap/Jugador.position.x >= 450 && $TileMap/Jugador.position.x <= 550 && $TileMap/Jugador.position.y <= 450 && $TileMap/Jugador.position.y >= 350:
				$TileMap/Jugador/avisosLabel.set_text("ya jugaste todos los minijuegos")
		if Global.politica==true && Global.ciencia==true && Global.historia==true && Global.arte==true && Global.ruleteado==false:
			finishcondition=true


func _on_area_2d_body_entered(body):
	if body.is_in_group("Jugador"):
		get_tree().change_scene_to_file("res://minijuego_ciencis.tscn")
		Global.ruleteado = false;
		


func _on_area_2d_2_body_entered(body):
	if body.is_in_group("Jugador"):
		get_tree().change_scene_to_file("res://arte_minigame.tscn")
		Global.ruleteado = false;


func _on_area_2d_4_body_entered(body):
	if body.is_in_group("Jugador"):
		get_tree().change_scene_to_file("res://main_shooter.tscn")
		Global.ruleteado = false;


func _on_area_2d_3_body_entered(body):
	if body.is_in_group("Jugador"):
		Global.ruleteado = false;
		get_tree().change_scene_to_file("res://minijuegoLaberinto.tscn")


func _on_areacaida_body_entered(body):
	if body.is_in_group("Jugador"):
		if finishcondition == true:
			$TileMap/AnimatedSprite2D2.show()
			$TileMap/AnimatedSprite2D2.play("explosion")
			$TileMap/hoyo.show()
			Global.caida=true
			await get_tree().create_timer(2).timeout
			Global.caida=false
			get_tree().change_scene_to_file("res://z_elegir_bando.tscn")
