extends Control

func _ready():
	pass


func _on_texture_button_pressed():
	var nombre = $NinePatchRect/LineEdit.text() 
	var contraseña = $NinePatchRect/LineEdit2.text() 
	Acceder.data.name=nombre
	Acceder.data.name=contraseña
	


func _on_texture_button_2_pressed():
	get_tree().change_scene_to_file("res://registro.tscn")
