extends Node2D
var registrado:bool=false;
var contador: int=0;
# Called when the node enters the scene tree for the first time.
func _ready():
	$alex.play("idle");
	$adam.play("idle");
	$bob.play("idle");
	$amelia.play("idle");


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.is_in_group("Jugador"):
		if contador==0:
			$Jugador/msgRegistro.set_text("Hola mi nombre es Alex, para registrarte 
			ve con mi compañero Bob. El esta aqui 
			al lado en su PC.");
		else:
			$Jugador/msgRegistro.set_text("Ya haz sido registrado! Ve por el pasillo a 
			la derecha para entrar a nuestra universidad!");
		
		$Jugador/Panel.show();
		$Jugador/msgRegistro.show();


func _on_area_2d_body_exited(body):
	if body.is_in_group("Jugador"):
		$Jugador/Panel.hide();
		$Jugador/msgRegistro.hide();


func _on_area_registro_body_entered(body):
	if body.is_in_group("Jugador"):
		if contador==0:
			$Jugador/msgRegistro.set_text("Bienvenido link, haz sido agregado al 
			registro correctamente! Ve por el pasillo
			a la derecha para entrar a nuestra universidad");
			contador+=1;
		else:
			$Jugador/msgRegistro.set_text("Ya haz sido registrado! Ve por el pasillo a 
			la derecha para entrar a nuestra universidad!")
		
		$Jugador/msgRegistro.show();
		$Jugador/Panel.show();
		$StaticBody2D.position.y+=50;
		$StaticBody2D/CollisionShape2D.position.y+=50;
		$adam.position.x=701;
		$adam.position.y=-200;
		$adam.play("idleDown");
		registrado=true;

func _on_area_registro_body_exited(body):
	if body.is_in_group("Jugador"):
		$Jugador/Panel.hide();
		$Jugador/msgRegistro.hide();


func _on_adam_area_body_entered(body):
	if body.is_in_group("Jugador") && registrado==false:
		$Jugador/msgRegistro.set_text("Tienes que registrarte con Alex
		antes de entrar a la universidad!")
		$Jugador/msgRegistro.show();
		$Jugador/Panel.show();


func _on_adam_area_body_exited(body):
	if body.is_in_group("Jugador"):
		$Jugador/msgRegistro.hide();
		$Jugador/Panel.hide();
