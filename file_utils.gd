extends Node
func save_user(name, password):
	var data : Dictionary = {
		usuario = name,
		contraseña = password,
		patha = "res://cinematica.tscn",
		x = -18,
		y = 37,
		vida = 3 ,#
		maxvida = 3, #
		progreso = 0 ,#
		ciencia = false ,#
		arte = false ,#
		historia = false ,#
		politica = false, #
		ruleteado = false, #
		dialog = false, #
		empirista = false, #
		nacionalista = false, #
		obtenciongema = false,
		espadahabilitada = false,#
		nadando = false ,#
		pelea1 = false,#
		pelea2 = false, #
		pelea3 = false, #
		pelea4 = false ,#
		trifuerza = false ,#
		castillo = false, #
		entradaCastillo = false, # 
		logo1 = false, #
		logo2 = false, #
	}
	var path = "res://save_game_"+name+".save"
	var file =FileAccess.open(path,FileAccess.WRITE)
	var datajason = JSON.stringify(data)
	file.store_line(datajason)
	
func load_users(nombre):
	var file
	var load_datas : Dictionary
	
	if(FileAccess.file_exists("res://save_game_"+nombre+".save")):
		file =FileAccess.open("res://save_game_"+nombre+".save",FileAccess.READ)
		load_datas = JSON.parse_string(file.get_line())
		return load_datas
		
	else:
		load_datas = {
		usuario = "error",
		contraseña = "error",
		vida = 3 ,#
		maxvida = 3, #
		progreso = 0 ,#
		ciencia = false ,#
		arte = false ,#
		historia = false ,#
		politica = false, #
		ruleteado = false, #
		dialog = false, #
		empirista = false, #
		nacionalista = false, #
		obtenciongema = false,
		espadahabilitada = false,#
		nadando = false ,#
		pelea1 = false,#
		pelea2 = false, #
		pelea3 = false, #
		pelea4 = false ,#
		trifuerza = false ,#
		castillo = false, #
		entradaCastillo = false, # 
		logo1 = false, #
		logo2 = false, #
		}
		return load_datas
