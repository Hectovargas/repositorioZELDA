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
	var load_datas : Dictionary = FileUtils.load_users()
	print(load_datas)
	var currentpassword = load_datas.contraseña
	var currentuser = load_datas.usuario
	if( currentpassword==contraseña && currentuser == nombre):
		get_tree().change_scene_to_file("res://cinematica.tscn") 
	else:
		var Line_Edit = $NinePatchRect.get_node("Label4")
		Line_Edit.set_text("Cuenta No encontrada")
		
