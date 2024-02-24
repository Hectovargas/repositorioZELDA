extends Node2D

var wincondition = false
var superior = false
var inferior = true
var pescando = false
var dentro = false
var valor = false
var cambio = true
var aumento = false
var preguntado = false
var pregunta1 = false
var pregunta2 = false
var pregunta3 = false
var pregunta4 = false
var pregunta5 = false
var velocity = 0.5
var pescados = 0
var fallos = 0
var fallosleves = 0
var minNumber := 0.0
var maxNumber := 1
var num = 0
var rng := RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	$Instrucciones/AnimatedSprite2D2.play("secuencia")
	$AreaDeSalida/AnimatedSprite2D.play("default")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		$Jugador/Sprite2D3/Label.set_text(str(fallosleves))
		if(valor == false && wincondition==false):
			if( fallos == 1 ):
				$TileMap/AnimatedSprite2D.show()
				$TileMap/AnimatedSprite2D.play("1")
				maxNumber = 1.4
			if( fallos == 2 ):
				$TileMap/AnimatedSprite2D.play("2")
				maxNumber = 1.5
			if( fallos >= 3 ):
				$TileMap/AnimatedSprite2D.play("3")
				maxNumber = 2
			$Jugador/Sprite2D/ProgressBar.value = 40
			valor = true
		$Jugador/Sprite2D2/Label.set_text(str(pescados))

		if $Jugador.position.x > 214 && $Jugador.position.y > 375 && $Jugador.position.x < 380 && $Jugador.position.y < 400 && wincondition==false:
			if Input.is_key_pressed(KEY_E) && pescando==false:
				pescando=true
				$Jugador/CUERDA.show()
				Global.pescar = true
				$Jugador/CUERDA.play("default")
				await get_tree().create_timer(1).timeout
				$Jugador/CUERDA.stop()
				$Jugador/CUERDA.play("stand")
	#Aqui empieza el juego
		if pescando==true && preguntado==false && wincondition==false:
			var randomNumber := rng.randf() * (maxNumber - minNumber) + minNumber
			
			$Jugador/Sprite2D.show()
			
			if $Jugador/Sprite2D/AreaDeMovimientoAleatorio.position.y >=-27 && $Jugador/Sprite2D/AreaDeMovimientoAleatorio.position.y<= 11:
				if(superior==true):
					$Jugador/Sprite2D/AreaDeMovimientoAleatorio.position.y += velocity
				if(inferior==true):
					$Jugador/Sprite2D/AreaDeMovimientoAleatorio.position.y -= velocity
					
				if($Jugador/Sprite2D/AreaDeMovimientoAleatorio.position.y <=-25):
					superior = true
					inferior = false
				if $Jugador/Sprite2D/AreaDeMovimientoAleatorio.position.y >= 9:
					superior = false
					inferior = true
				if cambio == true:
					cambio = false
					await get_tree().create_timer(0.7).timeout
					velocity=randomNumber
					cambio = true
			if($Jugador/Sprite2D/AreaDeMovimientoAleatorio.position.y > $Jugador/Sprite2D/areaDelJugador.position.y-4 && $Jugador/Sprite2D/AreaDeMovimientoAleatorio.position.y < $Jugador/Sprite2D/areaDelJugador.position.y+4):
				$Jugador/Sprite2D/ProgressBar.value += 1
			else:
				$Jugador/Sprite2D/ProgressBar.value -=0.65
			
			if Input.is_key_pressed(KEY_SPACE):
				if($Jugador/Sprite2D/areaDelJugador.position.y >= -26):
					$Jugador/Sprite2D/areaDelJugador.position.y -= 0.6
				else:
					$Jugador/Sprite2D/areaDelJugador.position.y +=0
			else:
				if($Jugador/Sprite2D/areaDelJugador.position.y <= 9):
					$Jugador/Sprite2D/areaDelJugador.position.y += 0.6
				else:
					$Jugador/Sprite2D/areaDelJugador.position.y +=0
			if $Jugador/Sprite2D/ProgressBar.value == 100:
				Global.pescar = false
				pescados += 1
				$Jugador/Sprite2D/ProgressBar.value = 40
				pescando=false
				$Jugador/CUERDA.hide()
				$Jugador/Sprite2D.hide()
				$Jugador/pseudoanimacionpez.show()
				await get_tree().create_timer(0.2).timeout
				while true:
					var posy = $Jugador/pseudoanimacionpez.position.y
					if(posy > 1):
						await get_tree().create_timer(0.01).timeout
						$Jugador/pseudoanimacionpez.position.y -=1
					else:
						$Jugador/pseudoanimacionpez.position.y = 70
						valor = true
						$Jugador/pseudoanimacionpez.hide()
						break;
				if pescados==6:
					$AreaDeSalida/AnimatedSprite2D.show()
					$AreaDeSalida/AnimatedSprite2D.position = Vector2(454,366)
					wincondition = true


			if $Jugador/Sprite2D/ProgressBar.value == 0:
				if(aumento==false):
					aumento=true
					fallosleves += 1
				$Jugador/CUERDA.hide()
				$Jugador/Sprite2D.hide()
				Global.pescar = false
				$Jugador/Sprite2D/ProgressBar.value = 50
				aumento=false
				if(fallosleves==6):
					$Jugador/CUERDA.hide()
					$Jugador/Sprite2D.hide()
					$Jugador/TextureRect.hide()
					pescando=false
					Global.pescar=true
					secuenciatiburon()
					await get_tree().create_timer(15).timeout
					Global.pescar=false
					Global.vida=Global.maxvida
					get_tree().change_scene_to_file("res://mazmorra con ruleta.tscn")
					
				if(preguntado == false && fallosleves<6):
					
					$Jugador/TextureRect.show()
					
					$Jugador/TextureRect2.show()
					
					preguntado = true
					
					while true:
						num = rng.randi_range(1,5)
						if (num == 1 && pregunta1==false):
							$Jugador/TextureRect2/Label.set_text("Entre los siguientes renacentistas seleccione, uno de los precursores filósofo-científico del heliocentrismo")
							$Jugador/TextureRect/Label.set_text(" 1) Tomas Moro. 2) Galileo. 3) Platón. 4) Arquimedes")
							pregunta1=true
							break
						if (num == 2 && pregunta2==false):
							$Jugador/TextureRect2/Label.set_text("El método científico se introduce por tres filósofos. uno de los 4 mencionados no es precursor del método científico")
							$Jugador/TextureRect/Label.set_text("1) Francis Bacon. 2) Galileo Galilei. 3)Nicolas Maquiavelo. 4) René Descartes")
							pregunta2=true
							break
						if (num == 3 && pregunta3==false):
							$Jugador/TextureRect2/Label.set_text("Es uno de los precursores del pensamiento Moderno")
							$Jugador/TextureRect/Label.set_text("1) Isaac Newton. 2) René Descartes. 3) Erasmo de Roterdam. 4) Francis Bacon")
							pregunta3=true
							break
						if (num == 4 && pregunta4==false):
							$Jugador/TextureRect2/Label.set_text("De los siguientes filósofos niega el geocentrismo (teoría que afirma que el centro de nuestro sistema solar es la tierra) ")
							$Jugador/TextureRect/Label.set_text(" 1) Aristóteles. 2) Nicolás Copérnico. 3) Tomás de Aquino. 4) Isaac Newton")
							pregunta4=true
							break
						if (num == 5 && pregunta5==false):
							$Jugador/TextureRect/Label.set_text("1) El astrolabio. 2) La imprenta. 3) La Nao y la Carabela. 4) El Telescopio")
							$Jugador/TextureRect2/Label.set_text("Uno de los inventos que suscitó un conocimiento ilimitado, fue el de Gutenberg")
							pregunta5=true
							break
						if(pregunta1 && pregunta2 && pregunta3 && pregunta4 && pregunta5):
							break


func _on_area_de_salida_body_entered(body):
	if body.is_in_group("Jugador"):
		if(wincondition==true):
			$AnimatedSprite2D.play("secuenciaPuerta")
			$AnimatedSprite2D.play("puerta")
			Global.maxvida+=1
			Global.vida+=1
			$Jugador/TextureRect2.show()
			$Jugador/TextureRect2/Label.set_text("Felicidades Has ganado un corazon")
			$AnimatedSprite2D/StaticBody2D.position = Vector2(1000,1000)
			$AreaDeSalida.position = Vector2(1000,1000)
			await get_tree().create_timer(1).timeout
			$Jugador/TextureRect2.hide()

func _on_instrucciones_body_entered(body):
	if body.is_in_group("Jugador"):
		DialogueManager.show_dialogue_balloon(load("res://instrucciones ciencia.dialogue"), "start")


func _on_area_de_pesca_body_exited(body):
	if body.is_in_group("Jugador"):
		$Jugador/CUERDA.hide()
		Global.pescar = false


func _on_area_de_movimiento_aleatorio_body_entered(body):
	pass


func _on_area_del_jugador_body_entered(body):
	if body.is_in_group("Jugador"):
		dentro = true


func _on_area_de_movimiento_aleatorio_body_exited(body):
	pass


func _on_area_del_jugador_body_exited(body):
	if body.is_in_group("Jugador"):
		dentro = false
	dentro = false



func _on_texture_button_pressed():
	if(aumento==false):
		fallos += 1
		aumento=false
	$Jugador/TextureRect.hide()
	$Jugador/TextureRect2/Label.set_text("INCORRECTO")
	await get_tree().create_timer(2).timeout
	if(fallos==4):
		$Jugador/CUERDA.hide()
		$Jugador/Sprite2D.hide()
		Global.pescar=true
		$Jugador/TextureRect2.hide()
		secuenciatiburon()
		await get_tree().create_timer(15).timeout
		Global.vida=Global.maxvida
		Global.pescar=false
		get_tree().change_scene_to_file("res://mazmorra con ruleta.tscn")
	$Jugador/TextureRect.hide()
	$Jugador/TextureRect2.hide()
	valor=false
	pescando=false
	preguntado = false
	aumento=false


func _on_texture_button_2_pressed():

	if(num != 2):
		$Jugador/TextureRect2/Label.set_text("CORRECTO")
		$Jugador/TextureRect.hide()
	else:
		if(aumento==false):
			fallos += 1
			aumento=true
		$Jugador/TextureRect.hide()
		$Jugador/TextureRect2/Label.set_text("INCORRECTO")

	await get_tree().create_timer(2).timeout
	if(fallos==4):
			$Jugador/CUERDA.hide()
			$Jugador/Sprite2D.hide()
			Global.pescar=true
			$Jugador/TextureRect2.hide()
			secuenciatiburon()
			await get_tree().create_timer(15).timeout
			Global.vida=Global.maxvida
			Global.pescar=false
			get_tree().change_scene_to_file("res://mazmorra con ruleta.tscn")
	$Jugador/TextureRect.hide()
	$Jugador/TextureRect2.hide()
	valor=false
	pescando=false
	preguntado = false
	aumento=false


func _on_texture_button_3_pressed():
	if(num == 2):
		$Jugador/TextureRect2/Label.set_text("CORRECTO")
		$Jugador/TextureRect.hide()
	else:
		if(aumento==false):
			fallos += 1
			aumento=true
		
		$Jugador/TextureRect2/Label.set_text("INCORRECTO")
		$Jugador/TextureRect.hide()
	await get_tree().create_timer(2).timeout
	if(fallos==4):
			$Jugador/CUERDA.hide()
			$Jugador/Sprite2D.hide()
			Global.pescar=true
			$Jugador/TextureRect2.hide()
			secuenciatiburon()
			await get_tree().create_timer(15).timeout
			Global.vida=Global.maxvida
			Global.pescar=false
			get_tree().change_scene_to_file("res://mazmorra con ruleta.tscn")
	$Jugador/TextureRect.hide()
	$Jugador/TextureRect2.hide()
	valor=false
	preguntado = false
	pescando=false
	aumento=false


func _on_texture_button_4_pressed():
	if(aumento==false):
		fallos += 1
		aumento=true
	$Jugador/TextureRect2/Label.set_text("INCORRECTO")
	$Jugador/TextureRect.hide()
	await get_tree().create_timer(2).timeout
	if(fallos==4):
			$Jugador/CUERDA.hide()
			$Jugador/Sprite2D.hide()
			Global.pescar=true
			$Jugador/TextureRect2.hide()
			secuenciatiburon()
			await get_tree().create_timer(15).timeout
			Global.vida=Global.maxvida
			Global.pescar=false
			get_tree().change_scene_to_file("res://mazmorra con ruleta.tscn")
	$Jugador/TextureRect.hide()
	$Jugador/TextureRect2.hide()
	valor=false
	pescando=false
	preguntado = false
	aumento=false


func _on_area_de_pesca_body_entered(body):
	pass # Replace with function body.

func secuenciatiburon():
	await get_tree().create_timer(0.025).timeout
	$Jugador/AnimatedSprite2D2.play("default")
	while true:
		$Jugador/AnimatedSprite2D2.position.y -= 1
		await get_tree().create_timer(0.025).timeout
		if $Jugador/AnimatedSprite2D2.position.y<84:
			break
	$Jugador/AnimatedSprite2D2.play("arriba")
	while true:
		$Jugador/AnimatedSprite2D2.position.y -= 2
		await get_tree().create_timer(0.025).timeout
		if $Jugador/AnimatedSprite2D2.position.y<1:
			break
	$Jugador/AnimatedSprite2D2.play("vuelta")
	while true:
		await get_tree().create_timer(0.4).timeout
		break
	$Jugador/AnimatedSprite2D2.play("atras")
	Global.pescar = false
	Global.vida=0
	while true:
		$Jugador/AnimatedSprite2D2.position.y += 2
		await get_tree().create_timer(0.025).timeout
		if $Jugador/AnimatedSprite2D2.position.y>=83:
			break
	$Jugador/AnimatedSprite2D2.play("atrasdentro")
	while true:
		$Jugador/AnimatedSprite2D2.position.y += 1
		await get_tree().create_timer(0.025).timeout
		if $Jugador/AnimatedSprite2D2.position.y>=152:
			break

func _on_area_2d_body_entered(body):
	if body.is_in_group("Jugador"):
		get_tree().change_scene_to_file("res://mazmorra con ruleta.tscn")
