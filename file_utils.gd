extends Node
func save_user(name, password):
	var data : Dictionary = {
		usuario = name,
		contraseña = password
	}
	var file =FileAccess.open("res://save_game.save",FileAccess.WRITE)
	var datajason = JSON.stringify(data)
	print("quiero guardar: " , datajason)
	file.store_line(datajason)
	print("guardado exitoso")
	
func load_users():
	var load_datas : Dictionary
	var file =FileAccess.open("res://save_game.save",FileAccess.READ)
	load_datas = JSON.parse_string(file.get_line())
	return load_datas
