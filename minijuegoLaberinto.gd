extends Node2D
var vida
var dialogoFallo
var dialogoCorrecto
var pregunta_1
var pregunta_2
var pregunta_3
var pregunta_4
var pregunta_5
var dialogoCorazon
var InstruccionesLaberintos
# Called when the node enters the scene tree for the first time.
func _ready():
	InstruccionesLaberintos = DialogueManager.show_dialogue_balloon(load("res://instrucciones laberinto.dialogue"), "start")
	dialogoFallo = DialogueManager.show_dialogue_balloon(load("res://FALLASTE.dialogue"), "start")
	pregunta_2 = DialogueManager.show_dialogue_balloon(load("res://pregunta 1 laberinto.dialogue"), "start2")
	pregunta_1 =  DialogueManager.show_dialogue_balloon(load("res://pregunta 1 laberinto.dialogue"), "start")
	dialogoCorrecto = DialogueManager.show_dialogue_balloon(load("res://correcto.dialogue"), "start")
	pregunta_5 = DialogueManager.show_dialogue_balloon(load("res://pregunta 5.dialogue"), "start")
	pregunta_3 = DialogueManager.show_dialogue_balloon(load("res://pregunta 3.dialogue"), "start")
	dialogoCorazon = DialogueManager.show_dialogue_balloon(load("res://corazonObtenido.dialogue"), "start")
	pregunta_4 = DialogueManager.show_dialogue_balloon(load("res://pregunta 4.dialogue"), "start")
	dialogoFallo.hide()
	dialogoCorrecto.hide()
	pregunta_1.hide()
	pregunta_2.hide()
	pregunta_3.hide()
	pregunta_4.hide()
	pregunta_5.hide()
	dialogoCorazon.hide()
	InstruccionesLaberintos.hide()
	vida = Global.vida
	Global.progreso += 8
	$AnimatedSprite2D.play("default")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_ENTER):
		borrar_dialogos()


func _on_boton_de_preguntas_body_entered(body):
	if body.is_in_group("Jugador"):
		borrar_dialogos()
		$TileMap/botonDePreguntas/pressed.show()
		$TileMap/botonDePreguntas/unpressed.hide()
		$TileMap/botonDePreguntas/botonDeRespuesta1.show()
		$TileMap/botonDePreguntas/botonDeRespuesta2.show()
		$TileMap/botonDePreguntas/botonDeRespuesta3.show()
		$TileMap/botonDePreguntas/botonDeRespuesta4.show()
		pregunta_1.show()


func _on_boton_de_preguntas_body_exited(body):
	if body.is_in_group("Jugador"):
		$TileMap/botonDePreguntas/unpressed.show()
		$TileMap/botonDePreguntas/pressed.hide()

func _on_boton_de_preguntas_2_body_entered(body):
	if body.is_in_group("Jugador"):
		borrar_dialogos()
		$TileMap/botonDePreguntas2/pressed.show()
		$TileMap/botonDePreguntas2/unpressed.hide()
		$TileMap/botonDePreguntas2/botonDeRespuesta1_2.show()
		$TileMap/botonDePreguntas2/botonDeRespuesta2_2.show()
		$TileMap/botonDePreguntas2/botonDeRespuesta3_2.show()
		$TileMap/botonDePreguntas2/botonDeRespuesta4_2.show()
		pregunta_2.show()

func _on_boton_de_preguntas_2_body_exited(body):
	if body.is_in_group("Jugador"):
		$TileMap/botonDePreguntas2/unpressed.show()
		$TileMap/botonDePreguntas2/pressed.hide()


func _on_area_2d_2_body_entered(body):
	if body.is_in_group("Jugador"):
		Global.vida = Global.vida-1
		if(Global.vida!=0):
			Global.vida = Global.vida-1
		if(Global.vida!=0):
			Global.vida = Global.vida-1
		if(Global.vida!=0):
			Global.vida = Global.vida-1
		if(Global.vida!=0):
			Global.vida = Global.vida-1
		if(Global.vida!=0):
			Global.vida = Global.vida-1
		$CanvasModulate.hide()
		await get_tree().create_timer(0.25).timeout
		Global.caida=true
		await get_tree().create_timer(0.5).timeout
		Global.caida=false
		Global.vida=Global.maxvida
		get_tree().change_scene_to_file("res://mazmorra con ruleta.tscn")

func _on_boton_de_respuesta_1_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas/botonDeRespuesta1.is_visible():
		borrar_dialogos()
		$TileMap/Jugador/luzdeljugador.show()
		dialogoCorrecto.show()
		$TileMap/botonDePreguntas.queue_free()

func _on_boton_de_respuesta_2_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas/botonDeRespuesta2.is_visible():
		borrar_dialogos()
		dialogoFallo.show()
		$TileMap/botonDePreguntas.queue_free()

func _on_boton_de_respuesta_3_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas/botonDeRespuesta3.is_visible():
		borrar_dialogos()
		dialogoFallo.show()
		$TileMap/botonDePreguntas.queue_free()

func _on_boton_de_respuesta_4_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas/botonDeRespuesta4.is_visible():
		borrar_dialogos()
		dialogoFallo.show()
		$TileMap/botonDePreguntas.queue_free()


func _on_area_2d_body_entered(body):
	if body.is_in_group("Jugador"):
		borrar_dialogos()
		InstruccionesLaberintos.show()



func _on_boton_de_respuesta_1_2_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas2/botonDeRespuesta1_2.is_visible():
		borrar_dialogos()
		$TileMap/Jugador/luzdeljugador.show()
		dialogoCorrecto.show()
		$TileMap/botonDePreguntas2.queue_free()


func _on_boton_de_respuesta_2_2_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas2/botonDeRespuesta2_2.is_visible():
		borrar_dialogos()
		dialogoFallo.show()
		$TileMap/botonDePreguntas2.queue_free()

func _on_boton_de_respuesta_3_2_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas2/botonDeRespuesta3_2.is_visible():
		borrar_dialogos()
		dialogoFallo.show()
		$TileMap/botonDePreguntas2.queue_free()


func _on_boton_de_respuesta_4_2_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas2/botonDeRespuesta4_2.is_visible():
		borrar_dialogos()
		dialogoFallo.show()
		$TileMap/botonDePreguntas2.queue_free()


func _on_restaurarluzplayer_body_entered(body):
	$TileMap/Jugador/luzdeljugador.hide()
	borrar_dialogos()


func _on_boton_de_preguntas_3_body_entered(body):
	if body.is_in_group("Jugador"):
		borrar_dialogos()
		$TileMap/botonDePreguntas3/pressed.show()
		$TileMap/botonDePreguntas3/unpressed.hide()
		$TileMap/botonDePreguntas3/botonDeRespuesta1_3.show()
		$TileMap/botonDePreguntas3/botonDeRespuesta2_3.show()
		$TileMap/botonDePreguntas3/botonDeRespuesta3_3.show()
		$TileMap/botonDePreguntas3/botonDeRespuesta4_3.show()
		pregunta_3.show()


func _on_boton_de_respuesta_1_3_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas3/botonDeRespuesta1_3.is_visible():
		borrar_dialogos()
		$TileMap/Jugador/luzdeljugador.show()
		dialogoCorrecto.show()
		$TileMap/botonDePreguntas3.queue_free()

func _on_boton_de_respuesta_2_3_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas3/botonDeRespuesta2_3.is_visible():
		borrar_dialogos()
		dialogoFallo.show()
		$TileMap/botonDePreguntas3.queue_free()


func _on_boton_de_respuesta_3_3_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas3/botonDeRespuesta3_3.is_visible():
		borrar_dialogos()
		dialogoFallo.show()
		$TileMap/botonDePreguntas3.queue_free()


func _on_boton_de_respuesta_4_3_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas3/botonDeRespuesta4_3.is_visible():
		borrar_dialogos()
		dialogoFallo.show()
		$TileMap/botonDePreguntas3.queue_free()


func _on_area_corazon_body_entered(body):
	if body.is_in_group("Jugador"):
		borrar_dialogos()
		dialogoCorazon.show()
		Global.maxvida+=1
		Global.vida+=1
		$AnimatedSprite2D.queue_free()
		await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file("res://mazmorra con ruleta.tscn")


func _on_boton_de_preguntas_4_body_entered(body):
	if body.is_in_group("Jugador"):
		borrar_dialogos()
		$TileMap/botonDePreguntas4/pressed.show()
		$TileMap/botonDePreguntas4/unpressed.hide()
		$TileMap/botonDePreguntas4/botonDeRespuesta1_4.show()
		$TileMap/botonDePreguntas4/botonDeRespuesta2_4.show()
		$TileMap/botonDePreguntas4/botonDeRespuesta3_4.show()
		$TileMap/botonDePreguntas4/botonDeRespuesta4_4.show()
		pregunta_4.show()


func _on_boton_de_respuesta_1_4_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas4/botonDeRespuesta1_4.is_visible():
		borrar_dialogos()
		dialogoFallo.show()
		$TileMap/botonDePreguntas4.queue_free()


func _on_boton_de_respuesta_2_4_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas4/botonDeRespuesta2_4.is_visible():
		borrar_dialogos()
		dialogoFallo.show()
		$TileMap/botonDePreguntas4.queue_free()


func _on_boton_de_respuesta_3_4_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas4/botonDeRespuesta3_4.is_visible():
		borrar_dialogos()
		dialogoFallo.show()
		$TileMap/botonDePreguntas4.queue_free()


func _on_boton_de_respuesta_4_4_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas4/botonDeRespuesta4_4.is_visible():
		borrar_dialogos()
		$TileMap/Jugador/luzdeljugador.show()
		dialogoCorrecto.show()
		$TileMap/botonDePreguntas4.queue_free()



func _on_boton_de_preguntas_5_body_entered(body):
	if body.is_in_group("Jugador"):
		borrar_dialogos()
		$TileMap/botonDePreguntas5/pressed.show()
		$TileMap/botonDePreguntas5/unpressed.hide()
		$TileMap/botonDePreguntas5/botonDeRespuesta1_5.show()
		$TileMap/botonDePreguntas5/botonDeRespuesta2_5.show()
		$TileMap/botonDePreguntas5/botonDeRespuesta3_5.show()
		$TileMap/botonDePreguntas5/botonDeRespuesta4_5.show()
		pregunta_5.show()


func _on_boton_de_respuesta_1_5_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas5/botonDeRespuesta2_5.is_visible():
		borrar_dialogos()
		dialogoFallo.show()
		$ColorRect.show()
		Global.caida=true
		$TileMap/botonDePreguntas5.queue_free()
		await get_tree().create_timer(2).timeout
		Global.caida=false
		get_tree().change_scene_to_file("res://mazmorra con ruleta.tscn")


func _on_boton_de_respuesta_2_5_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas5/botonDeRespuesta1_5.is_visible():
		borrar_dialogos()
		dialogoCorrecto.show()
		$BarreraCorazon.queue_free()
		$TileMap/botonDePreguntas5.queue_free()

func _on_boton_de_respuesta_3_5_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas5/botonDeRespuesta3_5.is_visible():
		borrar_dialogos()
		dialogoFallo.show()
		$ColorRect.show()
		Global.caida=true
		
		$TileMap/botonDePreguntas5.queue_free()
		await get_tree().create_timer(2).timeout
		Global.caida=false
		get_tree().change_scene_to_file("res://mazmorra con ruleta.tscn")


func _on_boton_de_respuesta_4_5_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas5/botonDeRespuesta4_5.is_visible():
		borrar_dialogos()
		dialogoFallo.show()
		$ColorRect.show()
		Global.caida=true
		$TileMap/botonDePreguntas5.queue_free()
		await get_tree().create_timer(2).timeout
		Global.caida=false
		get_tree().change_scene_to_file("res://mazmorra con ruleta.tscn")

func borrar_dialogos():
	dialogoFallo.hide()
	dialogoCorrecto.hide()
	pregunta_1.hide()
	pregunta_2.hide()
	pregunta_3.hide()
	pregunta_4.hide()
	pregunta_5.hide()
	dialogoCorazon.hide()
	InstruccionesLaberintos.hide()
	
