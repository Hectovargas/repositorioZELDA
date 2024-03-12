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
var maxNumber := 0.6
var num = 0
var extraerpez = false
var rng := RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.progreso += 8
	$Instrucciones/AnimatedSprite2D2.play("secuencia")
	$AreaDeSalida/AnimatedSprite2D.play("default")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		$Jugador/nopescados/Label.set_text(str(fallosleves))
		if(valor == false && wincondition==false):
			if( fallos == 1 ):
				$TileMap/AnimatedSprite2D.show()
				$TileMap/AnimatedSprite2D.play("1")
			if( fallos == 2 ):
				$TileMap/AnimatedSprite2D.play("2")
			if( fallos >= 3 ):
				$TileMap/AnimatedSprite2D.play("3")
			$Jugador/tabladepesca/ProgressBar.value = 40
			valor = true
		$Jugador/pescados/Label.set_text(str(pescados))

		if $Jugador.position.x > 214 && $Jugador.position.y > 375 && $Jugador.position.x < 380 && $Jugador.position.y < 400 && wincondition==false && extraerpez==false && preguntado==false && fallosleves<6:
			if Input.is_key_pressed(KEY_E) && pescando==false:
				pescando=true
				$Jugador/CUERDA.show()
				Global.pescar = true
				$Jugador/CUERDA.play("default")
				await get_tree().create_timer(1).timeout
				$Jugador/CUERDA.stop()
				$Jugador/CUERDA.play("stand")
	#Aqui empieza el juego
		if pescando==true && preguntado==false && wincondition==false && fallosleves<6:
			var randomNumber := rng.randf() * (maxNumber - minNumber) + minNumber
			$Jugador/tabladepesca.show()
			#-----------------------------------------------------------------------------
			if $Jugador/tabladepesca/AreaDeMovimientoAleatorio.position.y >=-27 && $Jugador/tabladepesca/AreaDeMovimientoAleatorio.position.y<= 11:
				if(superior==true):
					
					$Jugador/tabladepesca/AreaDeMovimientoAleatorio.position.y += velocity
					
				if(inferior==true):
					$Jugador/tabladepesca/AreaDeMovimientoAleatorio.position.y -= velocity
					
				if($Jugador/tabladepesca/AreaDeMovimientoAleatorio.position.y <=-25):
					
					superior = true
					inferior = false
					
				if $Jugador/tabladepesca/AreaDeMovimientoAleatorio.position.y >= 9:
					
					superior = false
					inferior = true
				if cambio == true:
					
					cambio = false
					await get_tree().create_timer(0.7).timeout
					velocity=randomNumber
					cambio = true
					
			if($Jugador/tabladepesca/AreaDeMovimientoAleatorio.position.y > $Jugador/tabladepesca/areaDelJugador.position.y-4 && $Jugador/tabladepesca/AreaDeMovimientoAleatorio.position.y < $Jugador/tabladepesca/areaDelJugador.position.y+4):
				$Jugador/tabladepesca/ProgressBar.value += 0.85
			else:
				$Jugador/tabladepesca/ProgressBar.value -=0.50
			
			if Input.is_key_pressed(KEY_SPACE):
				if($Jugador/tabladepesca/areaDelJugador.position.y >= -26):
					$Jugador/tabladepesca/areaDelJugador.position.y -= 0.6
				else:
					$Jugador/tabladepesca/areaDelJugador.position.y +=0
			else:
				if($Jugador/tabladepesca/areaDelJugador.position.y <= 9):
					$Jugador/tabladepesca/areaDelJugador.position.y += 0.6
				else:
					$Jugador/tabladepesca/areaDelJugador.position.y +=0
			#------------------------------------------------------------------------------------
			if $Jugador/tabladepesca/ProgressBar.value == 100:
				Global.pescar = false
				$Jugador/tabladepesca/ProgressBar.value = 40
				pescando=false
				$Jugador/CUERDA.hide()
				$Jugador/tabladepesca.hide()
				#----------------------------------------------------
				if(preguntado == false && fallosleves<6 && extraerpez == false):
					
					$Jugador/TextureRect.show()
					
					preguntado = true
					
					while true:
						
						num = rng.randi_range(1,5)
						
						if (num == 1 && pregunta1==false):
							$Jugador/TextureRect/Label.set_text("Entre los siguientes renacentistas seleccione, uno de los precursores filósofo-científico del heliocentrismo")
							$Jugador/TextureRect/TextureButton/Label2.set_text("Tomas Moro")
							$Jugador/TextureRect/TextureButton2/Label2.set_text("Galileo")
							$Jugador/TextureRect/TextureButton3/Label2.set_text("Platón")
							$Jugador/TextureRect/TextureButton4/Label2.set_text("Arquimedes")
							break
							
						if (num == 2 && pregunta2==false):
							$Jugador/TextureRect/Label.set_text("El método científico se introduce por tres filósofos. uno de los 4 mencionados no es precursor del método científico")
							$Jugador/TextureRect/TextureButton/Label2.set_text("Francis Bacon")
							$Jugador/TextureRect/TextureButton2/Label2.set_text("Galileo Galilei")
							$Jugador/TextureRect/TextureButton3/Label2.set_text("Nicolas Maquiavelo")
							$Jugador/TextureRect/TextureButton4/Label2.set_text("René Descartes")
							break
							
						if (num == 3 && pregunta3==false):
							$Jugador/TextureRect/Label.set_text("Es uno de los precursores del pensamiento Moderno")
							$Jugador/TextureRect/TextureButton/Label2.set_text("Isaac Newton")
							$Jugador/TextureRect/TextureButton2/Label2.set_text("René Descartes")
							$Jugador/TextureRect/TextureButton3/Label2.set_text("Erasmo de Roterdam")
							$Jugador/TextureRect/TextureButton4/Label2.set_text("Francis Bacon")
							break
							
						if (num == 4 && pregunta4==false):
							$Jugador/TextureRect/Label.set_text("De los siguientes filósofos niega el geocentrismo (teoría que afirma que el centro de nuestro sistema solar es la tierra) ")
							$Jugador/TextureRect/TextureButton/Label2.set_text("Aristóteles")
							$Jugador/TextureRect/TextureButton2/Label2.set_text("Nicolás Copérnico")
							$Jugador/TextureRect/TextureButton3/Label2.set_text("Tomás de Aquino")
							$Jugador/TextureRect/TextureButton4/Label2.set_text("Isaac Newton")
							break
							
						if (num == 5 && pregunta5==false):
							$Jugador/TextureRect/Label.set_text("Uno de los inventos que suscitó un conocimiento ilimitado, fue el de Gutenberg")
							$Jugador/TextureRect/TextureButton/Label2.set_text("El astrolabio")
							$Jugador/TextureRect/TextureButton2/Label2.set_text("La imprenta")
							$Jugador/TextureRect/TextureButton3/Label2.set_text("La Nao y la Carabela")
							$Jugador/TextureRect/TextureButton4/Label2.set_text("El Telescopio")
							break
							
						if(pregunta1 && pregunta2 && pregunta3 && pregunta4 && pregunta5):
							break
			#---------------------------------------------
		if extraerpez == true:
			$Jugador/pseudoanimacionpez.show()
			await get_tree().create_timer(0.2).timeout
			while true:
					var posy = $Jugador/pseudoanimacionpez.position.y
					if(posy > 1 && fallosleves<6):
						await get_tree().create_timer(0.3).timeout
						$Jugador/pseudoanimacionpez.position.y -=1
					else:
						extraerpez = false
						$Jugador/pseudoanimacionpez.position.y = 100
						valor = true
						$Jugador/pseudoanimacionpez.hide()
						break;
			if pescados==5:
				$AreaDeSalida/AnimatedSprite2D.show()
				$AreaDeSalida/AnimatedSprite2D.position = Vector2(454,366)
				wincondition = true
				
		if $Jugador/tabladepesca/ProgressBar.value == 0:
			if(aumento==false):
				aumento=true
				fallosleves += 1
			$Jugador/CUERDA.hide()
			$Jugador/tabladepesca.hide()
			pescando=false
			Global.pescar = false
			$Jugador/tabladepesca/ProgressBar.value = 30
			aumento=false
			
			if(fallosleves==6):
				$Jugador/CUERDA.hide()
				$Jugador/tabladepesca.hide()
				$Jugador/TextureRect.hide()
				pescando=false
				Global.pescar=true
				secuenciatiburon()
				await get_tree().create_timer(10).timeout
				Global.pescar=false
				Global.vida=Global.maxvida
				get_tree().change_scene_to_file("res://mazmorra con ruleta.tscn")

func _on_area_de_salida_body_entered(body):
	if body.is_in_group("Jugador"):
		if(wincondition==true):
			$AnimatedSprite2D.play("secuenciaPuerta")
			$AnimatedSprite2D.play("puerta")
			Global.maxvida+=1
			Global.vida+=1
			$Jugador/TextureRect.show()
			$Jugador/TextureRect/TextureButton.hide()
			$Jugador/TextureRect/TextureButton2.hide()
			$Jugador/TextureRect/TextureButton3.hide()
			$Jugador/TextureRect/TextureButton4.hide()
			$Jugador/TextureRect/Label.set_text("Felicidades Has ganado un corazon")
			$AnimatedSprite2D/StaticBody2D.position = Vector2(1000,1000)
			$AreaDeSalida.position = Vector2(1000,1000)
			await get_tree().create_timer(1).timeout
			$Jugador/TextureRect.hide()

func _on_instrucciones_body_entered(body):
	if body.is_in_group("Jugador"):
		DialogueManager.show_dialogue_balloon(load("res://instrucciones ciencia.dialogue"), "start")


func _on_area_de_pesca_body_exited(body):
	if body.is_in_group("Jugador"):
		$Jugador/CUERDA.hide()
		Global.pescar = false


func _on_area_del_jugador_body_entered(body):
	if body.is_in_group("Jugador"):
		dentro = true


func _on_area_del_jugador_body_exited(body):
	if body.is_in_group("Jugador"):
		dentro = false
	dentro = false



func _on_texture_button_pressed():
	$Jugador/TextureRect/TextureButton.hide()
	$Jugador/TextureRect/TextureButton2.hide()
	$Jugador/TextureRect/TextureButton3.hide()
	$Jugador/TextureRect/TextureButton4.hide()
	if(aumento==false):
		fallosleves += 1
		aumento=false
	$Jugador/TextureRect/Label.set_text("INCORRECTO")
	await get_tree().create_timer(2).timeout
	if(fallosleves==6):
		$Jugador/CUERDA.hide()
		$Jugador/tabladepesca.hide()
		Global.pescar=true
		secuenciatiburon()
		await get_tree().create_timer(10).timeout
		Global.vida=Global.maxvida
		Global.pescar=false
		get_tree().change_scene_to_file("res://mazmorra con ruleta.tscn")
	$Jugador/TextureRect.hide()
	$Jugador/TextureRect/TextureButton.show()
	$Jugador/TextureRect/TextureButton2.show()
	$Jugador/TextureRect/TextureButton3.show()
	$Jugador/TextureRect/TextureButton4.show()
	valor=false
	pescando=false
	preguntado = false
	aumento=false


func _on_texture_button_2_pressed():

	if(num != 2):
		$Jugador/TextureRect/TextureButton.hide()
		$Jugador/TextureRect/TextureButton2.hide()
		$Jugador/TextureRect/TextureButton3.hide()
		$Jugador/TextureRect/TextureButton4.hide()
		$Jugador/TextureRect/Label.set_text("CORRECTO")
		extraerpez = true
		pescados+=1
		if (num == 1):
			pregunta1=true
		if (num == 2):
			pregunta2=true
		if (num == 3):
			pregunta3=true
		if (num == 4):
			pregunta4=true
		if (num == 5):
			pregunta5=true
	else:
		if(aumento==false):
			fallosleves += 1
			aumento=true
		$Jugador/TextureRect/Label.set_text("INCORRECTO")

	await get_tree().create_timer(2).timeout
	if(fallosleves==6):
			$Jugador/CUERDA.hide()
			$Jugador/tabladepesca.hide()
			Global.pescar=true
			secuenciatiburon()
			await get_tree().create_timer(10).timeout
			Global.vida=Global.maxvida
			Global.pescar=false
			get_tree().change_scene_to_file("res://mazmorra con ruleta.tscn")
	$Jugador/TextureRect.hide()
	$Jugador/TextureRect/TextureButton.show()
	$Jugador/TextureRect/TextureButton2.show()
	$Jugador/TextureRect/TextureButton3.show()
	$Jugador/TextureRect/TextureButton4.show()
	valor=false
	pescando=false
	preguntado = false
	aumento=false


func _on_texture_button_3_pressed():
	$Jugador/TextureRect/TextureButton.hide()
	$Jugador/TextureRect/TextureButton2.hide()
	$Jugador/TextureRect/TextureButton3.hide()
	$Jugador/TextureRect/TextureButton4.hide()
	if(num == 2):
		$Jugador/TextureRect/Label.set_text("CORRECTO")
		extraerpez=true
		pescados+=1
		if (num == 1):
			pregunta1=true
		if (num == 2):
			pregunta2=true
		if (num == 3):
			pregunta3=true
		if (num == 4):
			pregunta4=true
		if (num == 5):
			pregunta5=true
	else:
		if(aumento==false):
			fallosleves += 1
			aumento=true
		
		$Jugador/TextureRect/Label.set_text("INCORRECTO")
	await get_tree().create_timer(2).timeout
	if(fallosleves==6):
			$Jugador/CUERDA.hide()
			$Jugador/tabladepesca.hide()
			Global.pescar=true
			secuenciatiburon()
			await get_tree().create_timer(10).timeout
			Global.vida=Global.maxvida
			Global.pescar=false
			get_tree().change_scene_to_file("res://mazmorra con ruleta.tscn")
	$Jugador/TextureRect.hide()
	$Jugador/TextureRect/TextureButton.show()
	$Jugador/TextureRect/TextureButton2.show()
	$Jugador/TextureRect/TextureButton3.show()
	$Jugador/TextureRect/TextureButton4.show()
	valor=false
	preguntado = false
	pescando=false
	aumento=false


func _on_texture_button_4_pressed():
	$Jugador/TextureRect/TextureButton.hide()
	$Jugador/TextureRect/TextureButton2.hide()
	$Jugador/TextureRect/TextureButton3.hide()
	$Jugador/TextureRect/TextureButton4.hide()
	if(aumento==false):
		fallosleves += 1
		aumento=true
	$Jugador/TextureRect/Label.set_text("INCORRECTO")
	await get_tree().create_timer(2).timeout
	if(fallosleves==6):
			$Jugador/CUERDA.hide()
			$Jugador/tabladepesca.hide()
			Global.pescar=true
			secuenciatiburon()
			await get_tree().create_timer(10).timeout
			Global.vida=Global.maxvida
			Global.pescar=false
			get_tree().change_scene_to_file("res://mazmorra con ruleta.tscn")
	$Jugador/TextureRect.hide()
	$Jugador/TextureRect/TextureButton.show()
	$Jugador/TextureRect/TextureButton2.show()
	$Jugador/TextureRect/TextureButton3.show()
	$Jugador/TextureRect/TextureButton4.show()
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
