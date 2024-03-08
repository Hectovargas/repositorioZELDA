extends Node2D

var pregunta1= false
var pregunta2=false
var pregunta3= false
var pregunta4=false
var pregunta5= false
var pregunta6=false
var pregunta7= false
var pregunta8=false
var preguntado =true
var num=0
var numero=0
var contador=0
var contadorpreguntas = 0
var numerodeenemigo = 0
var sintiempo = false
var rng := RandomNumberGenerator.new()
var respuestarespondida = false
var posicionJugadorimperialista = Vector2(554,229)
var posicionjugadornacionalista = Vector2(268,229)
var terminarpelea = false
var contadorfallos=0
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.estoyencombate=true
	if Global.empirista==true:
		$Jugador.position = posicionJugadorimperialista
		Global.posicionbatalla=true
	else:
		$Jugador.position = posicionjugadornacionalista
		Global.posicionbatallainversa=true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Global.vida==0:
		Global.posicionbatalla=false
		Global.posicionbatallainversa=false
		Global.muerteencombate = true
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_file("res://gameover.tscn")
	else:
		print("contador =" + str(contadorpreguntas))
		print("num: "+str(num))
		if(preguntado == false && num == 0):
			preguntado = true
			if contadorpreguntas == 2:
				terminarpelea=true
			else:
				while true:
					num = rng.randi_range(1,8)
					if (num == 1 && pregunta1==false):
						$TextureRect/TextureButton/Label2.set_text("Empiristas")
						$TextureRect/TextureButton2/Label2.set_text("Criticistas")
						$TextureRect/TextureButton3/Label2.set_text("Racionalistas")
						$TextureRect/TextureButton4/Label2.set_text("Dogmáticos")
						$TextureRect/Label.set_text("Para algunos de los siguientes filósofos, el criterio de verdad es la evidencia sensible:")
						pregunta1=true
						sintiempo=false
						break
					if (num == 2 && pregunta2==false):
						$TextureRect/TextureButton/Label2.set_text("Racionalistas")
						$TextureRect/TextureButton2/Label2.set_text("Empiristas")
						$TextureRect/TextureButton3/Label2.set_text("Escolásticos")
						$TextureRect/TextureButton4/Label2.set_text("Escépticos")
						$TextureRect/Label.set_text("De las siguientes, una de ellas es la corriente filosófica que en general tiende a negar la posibilidad de la metafísica y a sostener que hay conocimiento únicamente de los fenómenos")
						pregunta2=true
						sintiempo=false
						break
					if (num == 3 && pregunta3==false):
						$TextureRect/TextureButton/Label2.set_text("Epistemólogos")
						$TextureRect/TextureButton2/Label2.set_text("Racionalistas")
						$TextureRect/TextureButton3/Label2.set_text("Empiristas")
						$TextureRect/TextureButton4/Label2.set_text("Escépticos")
						$TextureRect/Label.set_text("Para unos de los siguientes filósofos, la experiencia como única fuente del conocimiento.")
						pregunta3=true
						sintiempo=false
						break
					if (num == 4 && pregunta4==false):
						$TextureRect/TextureButton/Label2.set_text("Epistemólogos")
						$TextureRect/TextureButton2/Label2.set_text("Racionalistas")
						$TextureRect/TextureButton3/Label2.set_text("Empiristas")
						$TextureRect/TextureButton4/Label2.set_text("Escépticos")
						$TextureRect/Label.set_text("Filósofos para quienes la única fuente del conocimiento es la razón")
						pregunta4=true
						sintiempo=false
						break
					if (num == 5 && pregunta5==false):
						$TextureRect/TextureButton/Label2.set_text("Empiristas")
						$TextureRect/TextureButton2/Label2.set_text("Idealistas")
						$TextureRect/TextureButton3/Label2.set_text("Racionalistas")
						$TextureRect/TextureButton4/Label2.set_text("Innatistas")
						$TextureRect/Label.set_text("Filósofos que postulan las ideas innatas en el sujeto")
						pregunta5=true
						sintiempo=false
						break
					if (num == 6 && pregunta6==false):
						$TextureRect/TextureButton/Label2.set_text("David Hume")
						$TextureRect/TextureButton2/Label2.set_text("John Locke")
						$TextureRect/TextureButton3/Label2.set_text("Nicolas Malebranch")
						$TextureRect/TextureButton4/Label2.set_text("Francis Bacon")
						$TextureRect/Label.set_text("De los siguientes filósofos selecciones el que no se considera Racionalista")
						pregunta6=true
						sintiempo=false
						break
					if (num == 7 && pregunta7==false):
						$TextureRect/TextureButton/Label2.set_text("Empirismo")
						$TextureRect/TextureButton2/Label2.set_text("Criticismo")
						$TextureRect/TextureButton3/Label2.set_text("Racionalismo")
						$TextureRect/TextureButton4/Label2.set_text("Epistemología")
						$TextureRect/Label.set_text("Es la doctrina que establece que todos nuestros conocimientos provienen de la razón.")
						pregunta7=true
						sintiempo=false
						break
					if (num == 8 && pregunta8==false):
						$TextureRect/TextureButton/Label2.set_text("George Berkeley")
						$TextureRect/TextureButton2/Label2.set_text("David Hume")
						$TextureRect/TextureButton3/Label2.set_text("Leibniz")
						$TextureRect/TextureButton4/Label2.set_text("Hipatía")
						$TextureRect/Label.set_text("Uno de los siguientes filósofos, postula las ideas innatas en el sujeto:")
						pregunta8=true
						sintiempo=false
						break
		if terminarpelea == true :
			print("entre1")
			terminarpelea = false
			$Ataque.hide()
			if contadorfallos==2:
				Global.peleas-=1
				if Global.empirista==true:
					Global.posicionbatalla=false
				else:
					Global.posicionbatallainversa=false
				Global.muerteencombate=true
				print("entre2")
				$TextureRect2/Label.set_text("Fuiste derrotado en tu primera pelea")
				$TextureRect2.show()
				if Global.empirista==true:
					Global.dañoenemy3=true
					Global.dañoenemy4=true
					await get_tree().create_timer(1).timeout
					$skeleton1_3.hide()
					$wolf.hide()
				if Global.nacionalista==true:
					Global.dañoenemy=true
					Global.dañoenemy2=true
					await get_tree().create_timer(1).timeout
					$yeti.hide()
					$samurai.hide()
			elif contadorfallos==1:
				print("entre3")
				$TextureRect2/Label.set_text("Empate, El Combate seguira")
				$TextureRect2.show()
				Global.vida = Global.videdurantecombate
				await get_tree().create_timer(2).timeout
				get_tree().reload_current_scene()
			else:
				print("entre4")
				$TextureRect2/Label.set_text("¡Has ganado!")
				Global.peleas+=1
			$TextureRect2.show()
			if(contadorfallos==0 || contadorfallos == 2):
				
				await get_tree().create_timer(3).timeout
				Global.estoyencombate=false
				Global.pelea1 = true
				Global.posicionbatalla=false
				get_tree().change_scene_to_file("res://zona Inical.tscn")


func _on_ataque_pressed():
	$TileMap/Camera2D/AnimatedSprite2D.stop()
	numero = rng.randi_range(6, 9)
	$TileMap/Camera2D/AnimatedSprite2D/Label2.set_text("Tiempo: "+str(numero))
	respuestarespondida=false
	contador=0
	$Ataque.hide()
	if numerodeenemigo == 0:
		if(num == 1):
			pregunta1=false
		if(num == 2):
			pregunta2=false
		if(num == 3):
			pregunta3=false
		if(num == 4):
			pregunta4=false
		if(num == 5):
			pregunta5=false
		if(num == 6):
			pregunta6=false
		if(num == 7):
			pregunta7=false
		if(num == 8):
			pregunta8=false
		var texto = $TextureRect/Label.get_text()
		$TextureRect2/Label.set_text("Primero Tienes Que seleccionar un enemigo")
		$TextureRect2.show()
		await get_tree().create_timer(2).timeout
		$TextureRect2.hide()
		preguntado=false
		$Ataque.show()
	else:
		preguntado=false
		$TextureRect.show()
		$TextureRect.show()
		$TileMap/Camera2D/AnimatedSprite2D.show()
		$TileMap/Camera2D/AnimatedSprite2D.play("default")
		while true:
			contador += 1
			$TileMap/Camera2D/AnimatedSprite2D/Label.set_text(str(contador))
			await get_tree().create_timer(1).timeout
			if contador==numero && respuestarespondida== false && sintiempo==false:
				fallaprgunta()
				$TileMap/Camera2D/AnimatedSprite2D.hide()
				break
			if respuestarespondida==true:
				break

func _on_texture_button_pressed():
	#en caso de que sea la pregunta 1
	contador=0
	$TileMap/Camera2D/AnimatedSprite2D.hide()
	$TileMap/Camera2D/AnimatedSprite2D.stop()
	if num==1:
		aciertapregunta()
	#en caso de que sea la prefunta 2
	else:
		fallaprgunta()


func _on_texture_button_2_pressed():
	contador=0
		#en caso de que sea la pregunta 2
	$TileMap/Camera2D/AnimatedSprite2D.hide()
	$TileMap/Camera2D/AnimatedSprite2D.stop()
	if num==2 || num==4:
		aciertapregunta()
	else:
		fallaprgunta()

func _on_texture_button_3_pressed():
	$TileMap/Camera2D/AnimatedSprite2D.hide()
	$TileMap/Camera2D/AnimatedSprite2D.stop()
	if num == 3 || num == 5 || num == 6 || num == 7 || num == 8:
		aciertapregunta()
	else:
		contador=0
		fallaprgunta()

func _on_texture_button_4_pressed():
	contador=0
	$TileMap/Camera2D/AnimatedSprite2D.hide()
	$TileMap/Camera2D/AnimatedSprite2D.stop()
	fallaprgunta()

func _on_botonyeti_pressed():
	if Global.empirista == true :
		numerodeenemigo = 1
		print("si1")

func _on_botonsamurai_pressed():
	if Global.empirista == true :
		numerodeenemigo = 2
		print("si2")

func _on_botonesqueleto_pressed():
	if Global.nacionalista == true :
		numerodeenemigo = 3
		print("si3")


func _on_botonsamurai_mouse_entered():
	$samurai/botonsamurai/PointLight2D.show()


func _on_botonsamurai_mouse_exited():
	$samurai/botonsamurai/PointLight2D.hide()


func _on_botonyeti_mouse_entered():
	$yeti/botonyeti/PointLight2D.show()


func _on_botonyeti_mouse_exited():
	$yeti/botonyeti/PointLight2D.hide()


func _on_botonesqueleto_mouse_entered():
	$skeleton1_3/botonesqueleto/PointLight2D.show()


func _on_botonesqueleto_mouse_exited():
	$skeleton1_3/botonesqueleto/PointLight2D.hide()	


func _on_botonwolf_mouse_entered():
	$wolf/botonwolf/PointLight2D.show()


func _on_botonwolf_mouse_exited():
	$wolf/botonwolf/PointLight2D.hide()	


func _on_botonwolf_pressed():
	if Global.nacionalista == true :
		print("sexo4")
		numerodeenemigo = 4

func fallaprgunta():
	contadorfallos+=1
	$Ataque.hide()
	respuestarespondida=true
	$TextureRect.hide()
	preguntado=false
	await get_tree().create_timer(1).timeout
	if numerodeenemigo==1:
		var posicion = $yeti.position
		$yeti.position = Vector2($Jugador.position.x-35,$Jugador.position.y)
		Global.ataqueenemy=true
		await get_tree().create_timer(1.5).timeout
		$yeti.position=posicion
	if numerodeenemigo==2:
		var posicion = $samurai.position
		$samurai.position = Vector2($Jugador.position.x-65,$Jugador.position.y)
		Global.ataqueenemy2=true
		await get_tree().create_timer(1.5).timeout
		$samurai.position=posicion
	if numerodeenemigo==3:
		var posicion = $skeleton1_3.position
		$skeleton1_3.position = Vector2($Jugador.position.x+70,$Jugador.position.y)
		Global.ataqueenemy3=true
		await get_tree().create_timer(1.5).timeout
		$skeleton1_3.position=posicion
	if numerodeenemigo==4:
		var posicion = $wolf.position
		$wolf.position = Vector2($Jugador.position.x+45,$Jugador.position.y)
		Global.ataqueenemy4=true
		await get_tree().create_timer(1.5).timeout
		$wolf.position=posicion
	Global.vida-=1
	num=0
	numerodeenemigo=0
	contadorpreguntas+=1
	$Ataque.show()
func aciertapregunta():
		$Ataque.hide()
		respuestarespondida=true
		$TextureRect.hide()
		if Global.empirista==true:
			#mover personaje hacia enemigo seleccionado
			if numerodeenemigo==1:
				$Jugador.position = Vector2($yeti.position.x+35,$yeti.position.y)
			else:
				$Jugador.position = Vector2($samurai.position.x+35,$samurai.position.y)

		if Global.nacionalista==true:
			#mover personaje hacia enemigo seleccionado
			if numerodeenemigo==3:
				$Jugador.position = Vector2($skeleton1_3.position.x-35,$skeleton1_3.position.y)
			else:
				$Jugador.position = Vector2($wolf.position.x-35,$wolf.position.y)
		#efecto de camara en ataque
		$Jugador/Camera2D.make_current()
		await get_tree().create_timer(0.5).timeout
		$Jugador/Camera2D.zoom = Vector2(4,4)
		await get_tree().create_timer(0.5).timeout
		$Jugador/Camera2D.zoom = Vector2(5,5)
		await get_tree().create_timer(0.5).timeout
		$Jugador/Camera2D.zoom = Vector2(6,6)
		$Jugador/AudioStreamPlayer2D.play()
		if Global.empirista==true:
			Global.attacking = true
		else:
			Global.ataqueinverso = true
		
		if numerodeenemigo==1:
			Global.dañoenemy=true
			await get_tree().create_timer(1).timeout
			$yeti.hide()
		if numerodeenemigo==2:
			Global.dañoenemy2=true
			await get_tree().create_timer(1).timeout
			$samurai.hide()
		if numerodeenemigo==3:
			Global.dañoenemy3=true
			await get_tree().create_timer(1).timeout
			$skeleton1_3.hide()
		if numerodeenemigo==4:
			Global.dañoenemy4=true
			await get_tree().create_timer(1).timeout
			$wolf.hide()
		await get_tree().create_timer(0.5).timeout
		$TileMap/Camera2D.make_current()
		$Jugador/Camera2D.zoom = Vector2(3,3)
		#habilitar las preguntas denuevo 
		preguntado=false
		if Global.empirista==true:
			$Jugador.position=posicionJugadorimperialista
		else:
			$Jugador.position=posicionjugadornacionalista
		num=0
		numerodeenemigo=0
		contadorpreguntas+=1
		$Ataque.show()





