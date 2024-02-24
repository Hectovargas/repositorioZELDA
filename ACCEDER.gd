extends Node
const Savefile = "/registro/SAVEFILE.save"

var names
var password

var data = {
	"variables":{
		"name": names,
		"PASSWORD" : password
} }

	
func load_data():
	var file = FileAccess.open(Savefile, FileAccess.READ)
	if file == null:
		save_data()  # Asume que la creación del archivo solucionará el problema
	else:
		data = file.get_var()
		file.close()  # Cierra el archivo correctamente

func save_data():
	var file = FileAccess.open(Savefile, FileAccess.WRITE)
	if file == null:
		file.open(Savefile, FileAccess.WRITE)
		file.store_var(data)
		file.close()
	else:
		file.store_var(data)
		file.close()


func _on_texture_button_2_pressed():
	get_tree().change_scene_to_file("res://loginpantalla.tscn") 


func _on_texture_button_pressed():
	var nombre = $NinePatchRect.get_node("LineEdit").text
	var contraseña = $NinePatchRect.get_node("LineEdit2").text
	FileUtils.save_user(nombre,contraseña)
	$NinePatchRect.get_node("LineEdit").set_text("")
	$NinePatchRect.get_node("LineEdit2").set_text("")
	$NinePatchRect.get_node("Label4").set_text("Registrado")
