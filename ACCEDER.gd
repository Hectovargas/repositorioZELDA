extends Node

func _on_texture_button_2_pressed():
	get_tree().change_scene_to_file("res://loginpantalla.tscn") 


func _on_texture_button_pressed():
	var nombre = $NinePatchRect.get_node("LineEdit").text
	var contraseña = $NinePatchRect.get_node("LineEdit2").text
	FileUtils.save_user(nombre,contraseña)
	$NinePatchRect.get_node("LineEdit").set_text("")
	$NinePatchRect.get_node("LineEdit2").set_text("")
	$NinePatchRect.get_node("Label4").set_text("Registrado")
