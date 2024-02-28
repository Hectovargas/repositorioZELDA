extends Node2D
var dentro:bool=false;
var sword:bool=false;
var contador:int=0;
# Called when the node enters the scene tree for the first time.
func _ready():
	$SpritesOrcos/baseOrc.play("orc")
	$SpritesOrcos/rogueOrc.play("orcRogue")
	$SpritesOrcos/shamanOrc.play("orcShaman")
	$SpritesOrcos/warriorOrc.play("orcWarrior")
	$SpritesEsqueletos/baseSkeleton.play("skeletonBase")
	$SpritesEsqueletos/mageSkeleton.play("skeletonMage")
	$SpritesEsqueletos/rogueSkeleton.play("skeletonRogue")
	$SpritesEsqueletos/warriorSkeleton.play("skeletonWarrior")
	DialogueManager.show_dialogue_balloon(load("res://dialogo bandosss.dialogue"),"start");

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.nacionalista == true:
		$SpritesEsqueletos.hide()
	if Global.empirista == true:
		$SpritesOrcos.hide()
	if dentro==true && Input.is_key_pressed(KEY_ENTER):
		$Sword.hide()
		$avisosLabel.hide()
		Global.sword=true;
		Global.espadahabilitada=true
		sword=true;
		if contador==0:
			DialogueManager.show_dialogue_balloon(load("res://elegirBando/dialogues/espadaObtenida.dialogue"),"start");
			contador+=1;
	


func _on_area_sword_body_entered(body):
	if body.is_in_group("Jugador"):
		dentro=true;
		if sword==false:
			$avisosLabel.show()
		




func _on_area_sword_body_exited(body):
	$avisosLabel.hide()
	dentro=false;


func _on_area_empirista_body_entered(body):
	if Global.empirista == false && Global.nacionalista==false:
		if body.is_in_group("Jugador") && sword==false:
			DialogueManager.show_dialogue_balloon(load("res://elegirBando/dialogues/noHazObtenidoEspada.dialogue"),"start");
		if body.is_in_group("Jugador") && Global.espadahabilitada==true:
			DialogueManager.show_dialogue_balloon(load("res://dialogo union empirista.dialogue"),"start");
			Global.empirista=true
			Global.obtenciongema=true




func _on_area_racionalista_body_entered(body):
	if Global.empirista == false && Global.nacionalista==false:
		if body.is_in_group("Jugador") && sword==false:
			DialogueManager.show_dialogue_balloon(load("res://elegirBando/dialogues/noHazObtenidoEspada.dialogue"),"start");
		if body.is_in_group("Jugador") && Global.espadahabilitada==true:
			DialogueManager.show_dialogue_balloon(load("res://dialogo union nacionalista.dialogue"),"start");
			Global.nacionalista=true
			Global.obtenciongema=true


func _on_salida_body_entered(body):
	if body.is_in_group("Jugador"):
		if Global.empirista==true || Global.nacionalista==true:
			Global.sword=false
			get_tree().change_scene_to_file("res://zona Inical.tscn")
		else:
			DialogueManager.show_dialogue_balloon(load("res://no puede salir.dialogue"),"start");
