extends CharacterBody2D


func _on_territorio_body_entered(body):
	if body.is_in_group("Jugador"):
		if Global.pelea1==true:
			DialogueManager.show_dialogue_balloon(load("res://DialogoDoncella_Desierto.dialogue"), "start")
		else:
			Global.dialogo = true


func _on_territorio_body_exited(body):
	Global.dialogo=false
