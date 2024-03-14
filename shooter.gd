extends Node2D
var nodo
var disparo = false
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Marker2D.position.y<$TileMap/StaticBody2D.position.y:
		$TileMap/Sprite2D.show()
		Global.caida=true
		await get_tree().create_timer(2).timeout
		Global.caida=false
		get_tree().change_scene_to_file("res://mazmorra con ruleta.tscn")
	if Global.incorrecto == true:
		Global.incorrecto = false
		$TileMap/StaticBody2D.position.y += 10
		$TileMap/StaticBody2D2.position.y += 10
		$TileMap/StaticBody2D3.position.y += 10
		$TileMap/StaticBody2D4.position.y += 10
	if Global.correcto == true:
		Global.correcto = false
		$TileMap/StaticBody2D.position.y -= 10
		$TileMap/StaticBody2D2.position.y -= 10
		$TileMap/StaticBody2D3.position.y -= 10
		$TileMap/StaticBody2D4.position.y -= 10
func _input(event):
	if event.is_action_released("ui_focus_next"):
			Global.flechando = true
			nodo = $flecha.duplicate()
			nodo.position = $Jugador.position
			add_child(nodo)
	
	
func _ready():
	Global.progreso+=8
	$flecha.add_to_group("arrow")
	$TileMap/StaticBody2D.add_to_group("enemys")
	$TileMap/StaticBody2D2.add_to_group("enemys2")
	$TileMap/StaticBody2D3.add_to_group("enemys3")
	$TileMap/StaticBody2D4.add_to_group("enemys4")


func _on_area_2d_body_entered(body):
	$TileMap/AnimatedSprite2D.play("normal")
	$TileMap/AnimatedSprite2D2.hide()
	


func _on_area_2d_body_exited(body):
	$TileMap/AnimatedSprite2D.play("press")


func _on_area_2d_3_body_entered(body):
	pass # Replace with function body.


func _on_area_2d_5_body_entered(body):
	pass


func _on_area_2d_5_area_entered(area):
	pass # Replace with function body.
