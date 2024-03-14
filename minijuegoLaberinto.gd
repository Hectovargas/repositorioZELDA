extends Node2D
var vida
var a= false
# Called when the node enters the scene tree for the first time.
func _ready():
	vida = Global.vida
	Global.progreso += 8
	$AnimatedSprite2D.play("default")
	

func _on_boton_de_preguntas_body_entered(body):
	if body.is_in_group("Jugador"):
		$TileMap/botonDePreguntas/pressed.show()
		$TileMap/botonDePreguntas/unpressed.hide()
		$TileMap/botonDePreguntas/botonDeRespuesta1.show()
		$TileMap/botonDePreguntas/botonDeRespuesta2.show()
		$TileMap/botonDePreguntas/botonDeRespuesta3.show()
		$TileMap/botonDePreguntas/botonDeRespuesta4.show()
		mostarpreguntas("Después del feudalismo medieval acudimos al surgimiento de una nueva clase social conocida como la:","1) La monarquía","2) El mercantilismo","3) La burguesía","4) El proletariado")


func _on_boton_de_preguntas_body_exited(body):
	if body.is_in_group("Jugador"):
		$TileMap/botonDePreguntas/unpressed.show()
		$TileMap/botonDePreguntas/pressed.hide()

func _on_boton_de_preguntas_2_body_entered(body):
	if body.is_in_group("Jugador"):
		$TileMap/botonDePreguntas2/pressed.show()
		$TileMap/botonDePreguntas2/unpressed.hide()
		$TileMap/botonDePreguntas2/botonDeRespuesta1_2.show()
		$TileMap/botonDePreguntas2/botonDeRespuesta2_2.show()
		$TileMap/botonDePreguntas2/botonDeRespuesta3_2.show()
		$TileMap/botonDePreguntas2/botonDeRespuesta4_2.show()
		mostarpreguntas("En el renacimiento se produce el nacimiento de fuertes monarquías europeas centralizadas como:","1) Grecia.","2) Inglaterra","3) Yugoslavia","4) Egipto")

func _on_boton_de_preguntas_2_body_exited(body):
	if body.is_in_group("Jugador"):
		$TileMap/botonDePreguntas2/unpressed.show()
		$TileMap/botonDePreguntas2/pressed.hide()


func _on_area_2d_2_body_entered(body):
	if body.is_in_group("Jugador"):
		$CanvasModulate.hide()
		await get_tree().create_timer(0.25).timeout
		Global.caida=true
		await get_tree().create_timer(0.5).timeout
		Global.caida=false
		Global.vida=Global.maxvida
		get_tree().change_scene_to_file("res://mazmorra con ruleta.tscn")

func _on_boton_de_respuesta_1_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas/botonDeRespuesta1.is_visible():
		$TileMap/Jugador/luzdeljugador.show()
		$TileMap/botonDePreguntas.queue_free()

func _on_boton_de_respuesta_2_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas/botonDeRespuesta2.is_visible():
		$TileMap/botonDePreguntas.queue_free()

func _on_boton_de_respuesta_3_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas/botonDeRespuesta3.is_visible():
		$TileMap/botonDePreguntas.queue_free()

func _on_boton_de_respuesta_4_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas/botonDeRespuesta4.is_visible():
		$TileMap/botonDePreguntas.queue_free()


func _on_area_2d_body_entered(body):
	if body.is_in_group("Jugador"):
		$TileMap/Jugador/NinePatchRect.show()
		$TileMap/Jugador/NinePatchRect/Label.set_text("Parate en el boton que esta en medio de la sala y responde la pregunta solicitada, para recibir luz.")
		


func _on_boton_de_respuesta_1_2_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas2/botonDeRespuesta1_2.is_visible():
		$TileMap/Jugador/luzdeljugador.show()
		$TileMap/botonDePreguntas2.queue_free()


func _on_boton_de_respuesta_2_2_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas2/botonDeRespuesta2_2.is_visible():
		$TileMap/botonDePreguntas2.queue_free()

func _on_boton_de_respuesta_3_2_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas2/botonDeRespuesta3_2.is_visible():
		$TileMap/botonDePreguntas2.queue_free()


func _on_boton_de_respuesta_4_2_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas2/botonDeRespuesta4_2.is_visible():
		mostraartextos("¡Fallaste!",2)
		$TileMap/botonDePreguntas2.queue_free()


func _on_restaurarluzplayer_body_entered(body):
	$TileMap/Jugador/luzdeljugador.hide()


func _on_boton_de_preguntas_3_body_entered(body):
	if body.is_in_group("Jugador"):
		$TileMap/botonDePreguntas3/pressed.show()
		$TileMap/botonDePreguntas3/unpressed.hide()
		$TileMap/botonDePreguntas3/botonDeRespuesta1_3.show()
		$TileMap/botonDePreguntas3/botonDeRespuesta2_3.show()
		$TileMap/botonDePreguntas3/botonDeRespuesta3_3.show()
		$TileMap/botonDePreguntas3/botonDeRespuesta4_3.show()
		mostarpreguntas("Antes de la consolidación del estado moderno, Italia estuvo divida en pequeñas ciudades-estado, una de esas fue:","1) Florencia-Napoli","2) Ámsterdam-Cracovia","3) Reims-Colonia","4) Milán-Lourdes")


func _on_boton_de_respuesta_1_3_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas3/botonDeRespuesta1_3.is_visible():
		$TileMap/Jugador/luzdeljugador.show()
		mostraartextos("¡Acertaste!",2)
		$TileMap/botonDePreguntas3.queue_free()

func _on_boton_de_respuesta_2_3_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas3/botonDeRespuesta2_3.is_visible():
		mostraartextos("¡Fallaste!",2)
		$TileMap/botonDePreguntas3.queue_free()


func _on_boton_de_respuesta_3_3_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas3/botonDeRespuesta3_3.is_visible():
		mostraartextos("¡Fallaste!",2)
		$TileMap/botonDePreguntas3.queue_free()


func _on_boton_de_respuesta_4_3_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas3/botonDeRespuesta4_3.is_visible():
		mostraartextos("¡Fallaste!",2)
		$TileMap/botonDePreguntas3.queue_free()


func _on_area_corazon_body_entered(body):
	if body.is_in_group("Jugador"):
		mostraartextos("Haz obtenido un corazon, tu vida ha incrementado",3)
		Global.maxvida+=1
		Global.vida+=1
		$AnimatedSprite2D.queue_free()
		await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file("res://mazmorra con ruleta.tscn")


func _on_boton_de_preguntas_4_body_entered(body):
	if body.is_in_group("Jugador"):
		$TileMap/botonDePreguntas4/pressed.show()
		$TileMap/botonDePreguntas4/unpressed.hide()
		$TileMap/botonDePreguntas4/botonDeRespuesta1_4.show()
		$TileMap/botonDePreguntas4/botonDeRespuesta2_4.show()
		$TileMap/botonDePreguntas4/botonDeRespuesta3_4.show()
		$TileMap/botonDePreguntas4/botonDeRespuesta4_4.show()
		mostarpreguntas("La toma de Constantinopla supone un bloqueo comercial entre Europa y Asia, ocurrió en lo que hoy es actualmente"," 1) Eslovaquia","2) Jerusalén","3) Mesopotamia","4) Estambul en Turquía")


func _on_boton_de_respuesta_1_4_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas4/botonDeRespuesta1_4.is_visible():
		mostraartextos("¡Fallaste!",2)
		$TileMap/botonDePreguntas4.queue_free()


func _on_boton_de_respuesta_2_4_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas4/botonDeRespuesta2_4.is_visible():
		mostraartextos("¡Fallaste!",2)
		$TileMap/botonDePreguntas4.queue_free()


func _on_boton_de_respuesta_3_4_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas4/botonDeRespuesta3_4.is_visible():
		mostraartextos("¡Fallaste!",2)
		$TileMap/botonDePreguntas4.queue_free()


func _on_boton_de_respuesta_4_4_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas4/botonDeRespuesta4_4.is_visible():
		$TileMap/Jugador/luzdeljugador.show()
		mostraartextos("¡Acertaste!",2)
		$TileMap/botonDePreguntas4.queue_free()



func _on_boton_de_preguntas_5_body_entered(body):
	if body.is_in_group("Jugador"):
		$TileMap/botonDePreguntas5/pressed.show()
		$TileMap/botonDePreguntas5/unpressed.hide()
		$TileMap/botonDePreguntas5/botonDeRespuesta1_5.show()
		$TileMap/botonDePreguntas5/botonDeRespuesta2_5.show()
		$TileMap/botonDePreguntas5/botonDeRespuesta3_5.show()
		$TileMap/botonDePreguntas5/botonDeRespuesta4_5.show()
		mostarpreguntas("Resurge el interes por gecia y roma, junto al declive del sistema feudal, el crecimiento del comercio e innovaciones como lo fue","1) La imprenta y la brújula","2) La rueda y la escritura","3) Las máquinas de vapor y la producción en masa","4) La pólvora y La rueda")


func _on_boton_de_respuesta_1_5_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas5/botonDeRespuesta2_5.is_visible():
		mostraartextos("¡Fallaste!",2)
		$ColorRect.show()
		Global.caida=true
		$TileMap/botonDePreguntas5.queue_free()
		await get_tree().create_timer(2).timeout
		Global.caida=false
		get_tree().change_scene_to_file("res://mazmorra con ruleta.tscn")


func _on_boton_de_respuesta_2_5_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas5/botonDeRespuesta1_5.is_visible():
		mostraartextos("¡Acertaste!",2)
		$BarreraCorazon.queue_free()
		$TileMap/botonDePreguntas5.queue_free()

func _on_boton_de_respuesta_3_5_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas5/botonDeRespuesta3_5.is_visible():
		mostraartextos("¡Fallaste!",2)
		$ColorRect.show()
		Global.caida=true
		
		$TileMap/botonDePreguntas5.queue_free()
		await get_tree().create_timer(2).timeout
		Global.caida=false
		get_tree().change_scene_to_file("res://mazmorra con ruleta.tscn")


func _on_boton_de_respuesta_4_5_body_entered(body):
	if body.is_in_group("Jugador") && $TileMap/botonDePreguntas5/botonDeRespuesta4_5.is_visible():
		mostraartextos("¡Fallaste!",2)
		$ColorRect.show()
		Global.caida=true
		$TileMap/botonDePreguntas5.queue_free()
		await get_tree().create_timer(2).timeout
		Global.caida=false
		get_tree().change_scene_to_file("res://mazmorra con ruleta.tscn")

func mostraartextos(text,time):
	$TileMap/Jugador/NinePatchRect.show()
	$TileMap/Jugador/NinePatchRect/Label.set_text(text)
	await get_tree().create_timer(time).timeout
	$TileMap/Jugador/NinePatchRect.hide()
	$TileMap/Jugador/NinePatchRect/Label.set_text("")

func mostarpreguntas(text,text2,text3,text4,text5):
	if (a == false):
		a=true
		$TileMap/Jugador/NinePatchRect.show()
		$TileMap/Jugador/NinePatchRect/Label.set_text(text)
		await get_tree().create_timer(4.5).timeout
		$TileMap/Jugador/NinePatchRect/Label.set_text(text2)
		await get_tree().create_timer(1).timeout
		$TileMap/Jugador/NinePatchRect/Label.set_text(text3)
		await get_tree().create_timer(1).timeout
		$TileMap/Jugador/NinePatchRect/Label.set_text(text4)
		await get_tree().create_timer(1).timeout
		$TileMap/Jugador/NinePatchRect/Label.set_text(text5)
		await  get_tree().create_timer(1).timeout
		$TileMap/Jugador/NinePatchRect.hide()
		a = false

func _on_area_2d_body_exited(body):
	$TileMap/Jugador/NinePatchRect.hide()
