extends Control
var pasar = false
var caida = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$TextureRect.modulate.a = 0.1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if pasar == false:
		pasar = true
		await get_tree().create_timer(0.05).timeout
		$TextureRect.modulate.a = 0.15
		await get_tree().create_timer(0.05).timeout
		$TextureRect.modulate.a = 0.2
		await get_tree().create_timer(0.05).timeout
		$TextureRect.modulate.a = 0.25
		await get_tree().create_timer(0.05).timeout
		$TextureRect.modulate.a = 0.30
		await get_tree().create_timer(0.05).timeout
		$TextureRect.modulate.a = 0.35
		await get_tree().create_timer(0.05).timeout
		$TextureRect.modulate.a = 0.40
		await get_tree().create_timer(0.05).timeout
		$TextureRect.modulate.a = 0.45
		await get_tree().create_timer(0.05).timeout
		$TextureRect.modulate.a = 0.50
		await get_tree().create_timer(0.05).timeout
		$TextureRect.modulate.a = 0.55
		await get_tree().create_timer(0.05).timeout
		$TextureRect.modulate.a = 0.60
		await get_tree().create_timer(0.05).timeout
		$TextureRect.modulate.a = 0.65
		await get_tree().create_timer(0.05).timeout
		$TextureRect.modulate.a = 0.70
		await get_tree().create_timer(0.05).timeout
		$TextureRect.modulate.a = 0.75
		await get_tree().create_timer(0.05).timeout
		$TextureRect.modulate.a = 0.80
		await get_tree().create_timer(0.05).timeout
		$TextureRect.modulate.a = 0.85
		await get_tree().create_timer(0.05).timeout
		$TextureRect.modulate.a = 0.90
		await get_tree().create_timer(0.05).timeout
		$TextureRect.modulate.a = 0.95
		await get_tree().create_timer(0.05).timeout
		$TextureRect.modulate.a = 1
		Global.caida = true
	if caida == false:
		$TextureRect/Jugador.position.y+=4


func _on_area_2d_body_entered(body):
	if body.is_in_group("Jugador"):
		Global.caida = false
		caida = true
		Global.vida=0


func _on_texture_button_pressed():
	Global.vida = Global.maxvida
	if (Global.peleas < 3):
		Global.pelea1 = false
		Global.pelea2 = false
		Global.pelea3 = false
		Global.pelea4 = false
	get_tree().change_scene_to_file("res://zona Inical.tscn")


func _on_texture_button_2_pressed():
	get_tree().change_scene_to_file("res://registro.tscn")
