extends Node2D
var pregunta1= false
var pregunta2=false
var preguntado = true
var num=0
var contador=0
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
	if Global.empirista==true:
		$Jugador.position = posicionJugadorimperialista
		Global.posicionbatalla=true
	else:
		$Jugador.position = posicionjugadornacionalista
		Global.posicionbatallainversa=true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(preguntado == false && num == 0):
		preguntado = true
		while true:
			num = rng.randi_range(1,2)
			if (num == 1 && pregunta1==false):
				$TextureRect2/Label.set_text("A) Empiristas. B) Criticistas. C) Racionalistas. D) Dogmáticos ")
				$TextureRect/Label.set_text("Para algunos de los siguientes filósofos, el criterio de verdad es la evidencia sensible:")
				pregunta1=true
				sintiempo=false
				break
			if (num == 2 && pregunta2==false):
				$TextureRect2/Label.set_text("A) Racionalistas. B) Empiristas. C) Escolásticos. D) Escépticos ")
				$TextureRect/Label.set_text("De las siguientes, una de ellas es la corriente filosófica que en general tiende a negar la posibilidad de la metafísica y a sostener que hay conocimiento únicamente de los fenómenos")
				pregunta2=true
				sintiempo=false
				break
			if pregunta1==true && pregunta2==true:
				terminarpelea=true
				break
	if terminarpelea == true :
		terminarpelea = false
		$Ataque.hide()
		if contadorfallos==2:
			$TextureRect2/Label.set_text("Fuiste derrotado en tu primera pelea")
			if Global.empirista==true:
				Global.dañoenemy3=true
				Global.dañoenemy4=true
				await get_tree().create_timer(1).timeout
				$skeleton1_3.hide()
				$skeleton.hide()
			if Global.nacionalista==true:
				Global.dañoenemy=true
				Global.dañoenemy2=true
				await get_tree().create_timer(1).timeout
				$orc1_2.hide()
				$orc1_4.hide()
		elif contadorfallos==1:
			$TextureRect2/Label.set_text("Empate, tus rivales fueron formidables pero no lo suficiente para ganarte")
		else:
			$TextureRect2/Label.set_text("¡Has ganado!")
		
		$TextureRect2.show()
		await get_tree().create_timer(3).timeout
		Global.posicionbatalla=false
		get_tree().change_scene_to_file("res://zona Inical.tscn")
		


func _on_ataque_pressed():
	respuestarespondida=false
	contador=0
	$Ataque.hide()
	if numerodeenemigo == 0:
		if(num == 1):
			pregunta1=false
		if(num == 2):
			pregunta2=false
		var texto = $TextureRect2/Label.get_text()
		$TextureRect2/Label.set_text("Primero Tienes Que seleccionar un enemigo")
		$TextureRect2.show()
		await get_tree().create_timer(2).timeout
		$TextureRect2.hide()
		preguntado=false
		$Ataque.show()
		$TextureRect2/Label.set_text(texto)
	else:
		preguntado=false
		$TextureRect.show()
		$TextureRect2.show()
		$TileMap/Camera2D/AnimatedSprite2D.show()
		$TileMap/Camera2D/AnimatedSprite2D.play("default")
		while true:
			contador += 1
			$TileMap/Camera2D/AnimatedSprite2D/Label.set_text(str(contador))
			await get_tree().create_timer(1).timeout
			if contador==10 && respuestarespondida== false && sintiempo==false:
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
	if num==2:
		fallaprgunta()


func _on_texture_button_2_pressed():
	contador=0
		#en caso de que sea la pregunta 2
	$TileMap/Camera2D/AnimatedSprite2D.hide()
	$TileMap/Camera2D/AnimatedSprite2D.stop()
	if num==2:
		aciertapregunta()
	if num==1:
		fallaprgunta()

func _on_texture_button_3_pressed():
	contador=0
	$TileMap/Camera2D/AnimatedSprite2D.hide()
	$TileMap/Camera2D/AnimatedSprite2D.stop()
	fallaprgunta()

func _on_texture_button_4_pressed():
	contador=0
	$TileMap/Camera2D/AnimatedSprite2D.hide()
	$TileMap/Camera2D/AnimatedSprite2D.stop()
	fallaprgunta()

func _on_botonorco_1_pressed():
	if Global.empirista == true :
		numerodeenemigo = 1
		print("sexo")

func _on_botonorco_2_pressed():
	if Global.empirista == true :
		numerodeenemigo = 2
		print("sexo2")

func _on_botonesqueleto_pressed():
	if Global.nacionalista == true :
		numerodeenemigo = 3
		print("sexo3")


func _on_botonorco_2_mouse_entered():
	$orc1_4/botonorco2/PointLight2D.show()


func _on_botonorco_2_mouse_exited():
	$orc1_4/botonorco2/PointLight2D.hide()


func _on_botonorco_1_mouse_entered():
	$orc1_2/botonorco1/PointLight2D.show()


func _on_botonorco_1_mouse_exited():
	$orc1_2/botonorco1/PointLight2D.hide()


func _on_botonesqueleto_mouse_entered():
	$skeleton1_3/botonesqueleto/PointLight2D.show()


func _on_botonesqueleto_mouse_exited():
	$skeleton1_3/botonesqueleto/PointLight2D.hide()	


func _on_botonesqueleto_2_mouse_entered():
	$skeleton/botonesqueleto2/PointLight2D.show()


func _on_botonesqueleto_2_mouse_exited():
	$skeleton/botonesqueleto2/PointLight2D.hide()	


func _on_botonesqueleto_2_pressed():
	if Global.nacionalista == true :
		print("sexo4")
		numerodeenemigo = 4

func fallaprgunta():
	contadorfallos+=1
	$Ataque.hide()
	respuestarespondida=true
	$TextureRect.hide()
	$TextureRect2/Label.set_text("Fallaste")
	await get_tree().create_timer(1).timeout
	$TextureRect2.hide()
	preguntado=false
	await get_tree().create_timer(1).timeout
	if numerodeenemigo==1:
		var posicion = $orc1_2.position
		$orc1_2.position = Vector2($Jugador.position.x-35,$Jugador.position.y)
		await get_tree().create_timer(1.5).timeout
		$orc1_2.position=posicion
	if numerodeenemigo==2:
		var posicion = $orc1_4.position
		$orc1_4.position = Vector2($Jugador.position.x-35,$Jugador.position.y)
		await get_tree().create_timer(1.5).timeout
		$orc1_4.position=posicion
	if numerodeenemigo==3:
		var posicion = $skeleton1_3.position
		$skeleton1_3.position = Vector2($Jugador.position.x+35,$Jugador.position.y)
		await get_tree().create_timer(1.5).timeout
		$skeleton1_3.position=posicion
	if numerodeenemigo==4:
		var posicion = $skeleton.position
		$skeleton.position = Vector2($Jugador.position.x+35,$Jugador.position.y)
		await get_tree().create_timer(1.5).timeout
		$skeleton.position=posicion
	Global.vida-=1
	num=0
	numerodeenemigo=0
	$Ataque.show()
func aciertapregunta():
		$Ataque.hide()
		respuestarespondida=true
		if Global.empirista==true:
			#mover personaje hacia enemigo seleccionado
			if numerodeenemigo==1:
				$Jugador.position = Vector2($orc1_2.position.x+35,$orc1_2.position.y)
			else:
				$Jugador.position = Vector2($orc1_4.position.x+35,$orc1_4.position.y)

		if Global.nacionalista==true:
			#mover personaje hacia enemigo seleccionado
			if numerodeenemigo==3:
				$Jugador.position = Vector2($skeleton1_3.position.x-35,$skeleton1_3.position.y)
			else:
				$Jugador.position = Vector2($skeleton.position.x-35,$skeleton.position.y)
			
		#esconder pregunta
		$TextureRect.hide()
		$TextureRect2.hide()
		#efecto de camara en ataque
		$Jugador/Camera2D.make_current()
		await get_tree().create_timer(0.5).timeout
		$Jugador/Camera2D.zoom = Vector2(4,4)
		await get_tree().create_timer(0.5).timeout
		$Jugador/Camera2D.zoom = Vector2(5,5)
		await get_tree().create_timer(0.5).timeout
		$Jugador/Camera2D.zoom = Vector2(6,6)
		if Global.empirista==true:
			Global.attacking = true
		else:
			Global.ataqueinverso = true
		if numerodeenemigo==1:
			Global.dañoenemy=true
			await get_tree().create_timer(1).timeout
			$orc1_2.hide()
		if numerodeenemigo==2:
			Global.dañoenemy2=true
			await get_tree().create_timer(1).timeout
			$orc1_4.hide()
		if numerodeenemigo==3:
			Global.dañoenemy3=true
			await get_tree().create_timer(1).timeout
			$skeleton1_3.hide()
		if numerodeenemigo==4:
			Global.dañoenemy4=true
			await get_tree().create_timer(1).timeout
			$skeleton.hide()
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
		$Ataque.show()
