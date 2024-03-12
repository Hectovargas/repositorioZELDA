extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_texture_button_2_pressed():
	get_tree().change_scene_to_file("res://registro.tscn") 


func _on_texture_button_3_pressed():
	get_tree().change_scene_to_file("res://registropantalla.tscn") 


func _on_texture_button_pressed():
	var nombre = $NinePatchRect.get_node("LineEdit").text
	var contraseña = $NinePatchRect.get_node("LineEdit2").text
	var load_datas : Dictionary = FileUtils.load_users(nombre)
	print(load_datas)
	var currentpassword = load_datas.contraseña
	var currentuser = load_datas.usuario
	Global.escene = load_datas.patha
	Global.posicion.x = load_datas.x
	Global.posicion.y = load_datas.y
	Global.names=currentuser
	Global.password=contraseña
	Global.vida = int(load_datas.vida)
	Global.maxvida = int(load_datas.maxvida)
	Global.progreso = float(load_datas.progreso)
	Global.ciencia =  bool(load_datas.ciencia)
	Global.arte =   bool(load_datas.arte)
	Global.historia =   bool(load_datas.historia)
	Global.politica =  bool(load_datas.politica)
	Global.ruleteado =  bool(load_datas.ruleteado)
	Global.dialog =  bool(load_datas.dialog)
	Global.empirista =  bool(load_datas.empirista)
	Global.nacionalista =  bool(load_datas.nacionalista)
	Global.obtenciongema =  bool(load_datas.obtenciongema)
	Global.espadahabilitada = bool( load_datas.espadahabilitada)
	Global.nadando =   bool(load_datas.nadando)
	Global.pelea1 = bool( load_datas.pelea1)
	Global.pelea2 = bool( load_datas.pelea2)
	Global.pelea3 =  bool(load_datas.pelea3)
	Global.pelea4 =   bool(load_datas.pelea4)
	Global.trifuerza =  bool(load_datas.trifuerza)
	Global.castillo =  bool(load_datas.castillo)
	Global.entradaCastillo = bool(load_datas.entradaCastillo)
	Global.logo1 =  bool(load_datas.logo1)
	Global.logo2 = bool( load_datas.logo2)
	if( currentpassword==contraseña && currentuser == nombre && currentpassword!="error" && currentuser != "error"):
		get_tree().change_scene_to_file(Global.escene) 
	else:
		var Line_Edit = $NinePatchRect.get_node("Label4")
		Line_Edit.set_text("Cuenta No encontrada")
		
