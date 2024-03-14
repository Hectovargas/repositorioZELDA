extends Node2D
var start = false
var nodo
var disparo = false
var respondio = true
var win = false
var portal = false
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if start == false:
		$TileMap/StaticBody2D.position.y -= 0.050
		$TileMap/StaticBody2D2.position.y -= 0.050
		$TileMap/StaticBody2D3.position.y -= 0.050
		$TileMap/StaticBody2D4.position.y -= 0.050
	if portal==true:
		$portal.show()
	if Global.conshoo>=5:
		$TextureRect.hide()
		$TileMap/AnimatedSprite2D2.hide()
		$TileMap/AnimatedSprite2D.queue_free()
		$AreaDeSalida/AnimatedSprite2D.show()
		Global.conshoo=0
		$TileMap/StaticBody2D.queue_free()
		$TileMap/StaticBody2D2.queue_free()
		$TileMap/StaticBody2D3.queue_free()
		$TileMap/StaticBody2D4.queue_free()
		win = true
	if win == false:
		if $Marker2D.position.y<$TileMap/StaticBody2D.position.y:
			$TileMap/Sprite2D.show()
			Global.caida=true
			$TileMap/StaticBody2D.hide()
			$TileMap/StaticBody2D2.hide()
			$TileMap/StaticBody2D3.hide()
			$TileMap/StaticBody2D4.hide()
			await get_tree().create_timer(2).timeout
			Global.caida=false
			get_tree().change_scene_to_file("res://mazmorra con ruleta.tscn")
	if Global.correcto == true:
		Global.correcto = false
		respondio=true
		$TextureRect/Label.set_text("Correcto")
		$TileMap/StaticBody2D.position.y -= 20
		$TileMap/StaticBody2D2.position.y -= 20
		$TileMap/StaticBody2D3.position.y -= 20
		$TileMap/StaticBody2D4.position.y -= 20
		if win==false:
			await get_tree().create_timer(1).timeout
			$TextureRect.hide()
			$TileMap/AnimatedSprite2D2.show()
	elif Global.incorrecto == true:
		respondio=true
		Global.incorrecto=false
		$TileMap/StaticBody2D.position.y += 45
		$TileMap/StaticBody2D2.position.y += 45
		$TileMap/StaticBody2D3.position.y += 45
		$TileMap/StaticBody2D4.position.y += 45
		$TextureRect/Label.set_text("Incorrecto")
		if win==false:
			await get_tree().create_timer(1).timeout
			$TextureRect.hide()
			$TileMap/AnimatedSprite2D2.show()
func _input(event):
	if event.is_action_released("ui_focus_next"):
			Global.flechando = true
			nodo = $flecha.duplicate()
			nodo.position = $Jugador.position
			add_child(nodo)
	
	
func _ready():
	Global.progreso+=8
	$portal/AnimatedSprite2D.play("default")
	$flecha.add_to_group("arrow")
	$TileMap/StaticBody2D.add_to_group("enemys")
	$TileMap/StaticBody2D2.add_to_group("enemys2")
	$TileMap/StaticBody2D3.add_to_group("enemys3")
	$TileMap/StaticBody2D4.add_to_group("enemys4")


func _on_area_2d_body_entered(body):
	start = true
	if respondio == true:
		respondio=false
		$TileMap/AnimatedSprite2D.play("normal")
		$TextureRect.show()
		$Jugador.position.y-=40
		match Global.conshoo:
			
			0:
				$TextureRect/Label.set_text("Durante el renacimiento, el modelo de gobierno es uno de los siguientes")
				await get_tree().create_timer(3).timeout
				$TextureRect/Label.set_text("A) Monarquía absoluta. B) Tiranía republicana. C) Democracia participativa. D) Liberalismo político")
			1:
				$TextureRect/Label.set_text("De los siguientes acontecimientos, selecciones el que inicia el período moderno")
				await get_tree().create_timer(3).timeout
				$TextureRect/Label.set_text("A) Toma de Constantinopla. B) Tratado de paz de westfalia. C) Toma de la Bastilla. La ruta de la seda")
			2:
				$TextureRect/Label.set_text("Durante el siglo XV, la sociedad se estratifica en tres estamentos definidos")
				await get_tree().create_timer(3).timeout
				$TextureRect/Label.set_text("A) Clase media, baja y alta. B) nobleza, clero y estado llano. C) Artesanos, guardianes y gobernantes D) Feudales")
			3:
				$TextureRect/Label.set_text("Aparece el realismo politico, que se basaba en un orden establecido, explicación de un sistema y recomendaciones de como gobernar:")
				await get_tree().create_timer(3).timeout
				$TextureRect/Label.set_text("A) Tomas Moro. B) Jean Bodín. C) Nicolas Maquiavelo. D) Erasmo de Rotterda")
			4:
				$TextureRect/Label.set_text("Terminada la edad media, en el contexto de la politica resulta que:")
				await get_tree().create_timer(3).timeout
				$TextureRect/Label.set_text("A) La Iglesia resalta su poder. B) La Iglesia pierde el papel rector en la política. C) La Iglesia evangelica se posiciona en la politica. D) La politica desaparece")
		$TileMap/AnimatedSprite2D2.hide()
	


func _on_area_2d_body_exited(body):
	$TileMap/AnimatedSprite2D.play("press")


func _on_area_2d_3_body_entered(body):
	pass # Replace with function body.


func _on_area_2d_5_body_entered(body):
	pass


func _on_area_2d_5_area_entered(area):
	pass # Replace with function body.


func _on_portal_body_entered(body):
	if portal == true:
		get_tree().change_scene_to_file("res://mazmorra con ruleta.tscn")


func _on_area_de_salida_body_entered(body):
	if win == true:
		$AreaDeSalida/AnimatedSprite2D.show()
		portal = true
		Global.maxvida+=1
		Global.vida = Global.maxvida
		$AreaDeSalida.position= Vector2(5000,5000)
