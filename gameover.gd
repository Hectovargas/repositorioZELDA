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
	Global.pelea1 = false
	Global.pelea2 = false
	Global.pelea3 = false
	Global.pelea4 = false
	var load_datas : Dictionary = FileUtils.load_users(Global.names)
	get_tree().change_scene_to_file("res://registro.tscn")
	load_datas.contraseña = Global.password
	Global.vida=Global.maxvida
	load_datas.patha=Global.escene
	if Global.escene == "res://zona Inical.tscn" :
		load_datas.x = position.x
		load_datas.y = position.y
	else:
		load_datas.x = Global.posicion.x
		load_datas.y = Global.posicion.y
	load_datas.usuario = Global.names
	load_datas.vida = Global.vida
	load_datas.maxvida = Global.maxvida
	load_datas.progreso = Global.progreso
	load_datas.ciencia = Global.ciencia
	load_datas.arte = Global.arte
	load_datas.historia = Global.historia
	load_datas.politica = Global.politica
	load_datas.ruleteado = Global.ruleteado
	load_datas.dialog = Global.dialog
	load_datas.empirista = Global.empirista
	load_datas.nacionalista = Global.nacionalista
	load_datas.obtenciongema = Global.obtenciongema
	load_datas.espadahabilitada = Global.espadahabilitada
	load_datas.nadando = Global.nadando
	load_datas.pelea1 = Global.pelea1
	load_datas.pelea2 = Global.pelea2
	load_datas.pelea3 = Global.pelea3
	load_datas.pelea4 = Global.pelea4
	load_datas.trifuerza = Global.trifuerza
	load_datas.castillo = Global.castillo
	load_datas.entradaCastillo = Global.entradaCastillo
	load_datas.logo1 = Global.logo1
	load_datas.logo2 = Global.logo2
	var path = "res://save_game_"+Global.names+".save"
	var file =FileAccess.open(path,FileAccess.WRITE)
	var datajason = JSON.stringify(load_datas)
	file.store_line(datajason)
