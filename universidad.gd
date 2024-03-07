extends Node2D
var registrado:bool=false;
var contador: int=0;
var finished:bool=false;
var finishedLab:bool=false;
var eKant:bool=false;
var descartes:bool=false;
var libro:bool=false;
var libro2:bool=false;
var dentroLibro:bool=false;
var dentroPizarra:bool=false;
var contadorPreguntas:int=0;
var correcta:int=0;
var terminoclass = false;
var fases:int=0;
var correctaLab:int=0;
var dentroPizarron:bool=false;
var terminolab = false
func _process(delta):
	
	if dentroPizarra == true:
		$Jugador.velocity = Vector2(0,0)
		
	if contadorPreguntas<3:
		libro=true;
	else :
		libro=false;
		libro2=true;
	if contadorPreguntas>=6:
		libro2=false;
		
	if dentroPizarra==true && Input.is_key_pressed(KEY_ENTER)&& terminoclass==false:
		$Jugador/pizarra.show();
		$Jugador/fondo.hide();
		$Jugador/msgRegistro.hide();
		$Jugador/Label2.show()
		
		if correcta==0:
			$"Jugador/pizarra/0buenas".show();
		elif correcta==1:
			$"Jugador/pizarra/1buenas".show();
		elif correcta==2:
			$"Jugador/pizarra/2buenas".show();
		elif correcta==3:
			$"Jugador/pizarra/3buenas".show();
		elif correcta==4:
			$"Jugador/pizarra/4buenas".show();
		elif correcta==5:
			$"Jugador/pizarra/5buenas".show();
		elif correcta==6:
			$"Jugador/pizarra/6buenas".show();
	
	if dentroPizarron==true && Input.is_key_pressed(KEY_ENTER):
		$Jugador/pizarronLaboratio.show();
		$Jugador/fondo.hide();
		$Jugador/msgRegistro.hide();
		$Jugador/Buttonp.show()
		$Jugador/Buttonp2.show()
		$Jugador/Buttonp3.show()
		$Jugador/Buttonp4.show()
		$Jugador/pizarronLaboratio/Label.show();
		if correctaLab==0:
			$"Jugador/pizarronLaboratio/0pistas".show();
		elif correctaLab==1:
			$"Jugador/pizarronLaboratio/1pistas".show();
		elif correctaLab==2:
			$"Jugador/pizarronLaboratio/2pistas".show();
		elif correctaLab==3:
			$"Jugador/pizarronLaboratio/3pistas".show();
		elif correctaLab==4:
			$"Jugador/pizarronLaboratio/4pistas".show();
		else:
			$"Jugador/pizarronLaboratio/5pistas".show();

func actualizar():
	if finished==false:
		$Jugador/TextureRect/Label.set_text(preguntas[contadorPreguntas]);
		if contadorPreguntas==0:
			$Jugador/TextureRect/TextureButton/opcion.set_text(respuestas[0]);
			$Jugador/TextureRect/TextureButton2/opcion.set_text(respuestas[1]);
			$Jugador/TextureRect/TextureButton3/opcion.set_text(respuestas[2]);
			$Jugador/TextureRect/TextureButton4/opcion.set_text(respuestas[3]);
		elif contadorPreguntas==1:
			$Jugador/TextureRect/TextureButton/opcion.set_text(respuestas[4]);
			$Jugador/TextureRect/TextureButton2/opcion.set_text(respuestas[5]);
			$Jugador/TextureRect/TextureButton3/opcion.set_text(respuestas[6]);
			$Jugador/TextureRect/TextureButton4/opcion.set_text(respuestas[7]);
		elif contadorPreguntas==2:
			$Jugador/TextureRect/TextureButton/opcion.set_text(respuestas[8]);
			$Jugador/TextureRect/TextureButton2/opcion.set_text(respuestas[9]);
			$Jugador/TextureRect/TextureButton3/opcion.set_text(respuestas[10]);
			$Jugador/TextureRect/TextureButton4/opcion.set_text(respuestas[11]);
		elif contadorPreguntas==3:
			$Jugador/TextureRect/TextureButton/opcion.set_text(respuestas[12]);
			$Jugador/TextureRect/TextureButton2/opcion.set_text(respuestas[13]);
			$Jugador/TextureRect/TextureButton3/opcion.set_text(respuestas[14]);
			$Jugador/TextureRect/TextureButton4/opcion.set_text(respuestas[15]);
		elif contadorPreguntas==4:
			$Jugador/TextureRect/TextureButton/opcion.set_text(respuestas[16]);
			$Jugador/TextureRect/TextureButton2/opcion.set_text(respuestas[17]);
			$Jugador/TextureRect/TextureButton3/opcion.set_text(respuestas[18]);
			$Jugador/TextureRect/TextureButton4/opcion.set_text(respuestas[19]);
		elif contadorPreguntas==5:
			$Jugador/TextureRect/TextureButton/opcion.set_text(respuestas[20]);
			$Jugador/TextureRect/TextureButton2/opcion.set_text(respuestas[21]);
			$Jugador/TextureRect/TextureButton3/opcion.set_text(respuestas[22]);
			$Jugador/TextureRect/TextureButton4/opcion.set_text(respuestas[23]);
	else:
			$Jugador/TextureRect/Label.set_text(lab[fases]);
			if fases==0:
				$Jugador/TextureRect/TextureButton/opcion.set_text(labRespuestas[0]);
				$Jugador/TextureRect/TextureButton2/opcion.set_text(labRespuestas[1]);
				$Jugador/TextureRect/TextureButton3/opcion.set_text(labRespuestas[2]);
				$Jugador/TextureRect/TextureButton4/opcion.set_text(labRespuestas[3]);
			elif fases==1:
				$Jugador/TextureRect/TextureButton/opcion.set_text(labRespuestas[4]);
				$Jugador/TextureRect/TextureButton2/opcion.set_text(labRespuestas[5]);
				$Jugador/TextureRect/TextureButton3/opcion.set_text(labRespuestas[6]);
				$Jugador/TextureRect/TextureButton4/opcion.set_text(labRespuestas[7]);
			elif fases==2:
				$Jugador/TextureRect/TextureButton/opcion.set_text(labRespuestas[8]);
				$Jugador/TextureRect/TextureButton2/opcion.set_text(labRespuestas[9]);
				$Jugador/TextureRect/TextureButton3/opcion.set_text(labRespuestas[10]);
				$Jugador/TextureRect/TextureButton4/opcion.set_text(labRespuestas[11]);
			elif fases==3:
				$Jugador/TextureRect/TextureButton/opcion.set_text(labRespuestas[12]);
				$Jugador/TextureRect/TextureButton2/opcion.set_text(labRespuestas[13]);
				$Jugador/TextureRect/TextureButton3/opcion.set_text(labRespuestas[14]);
				$Jugador/TextureRect/TextureButton4/opcion.set_text(labRespuestas[15]);
			elif fases==4:
				$Jugador/TextureRect/TextureButton/opcion.set_text(labRespuestas[16]);
				$Jugador/TextureRect/TextureButton2/opcion.set_text(labRespuestas[17]);
				$Jugador/TextureRect/TextureButton3/opcion.set_text(labRespuestas[18]);
				$Jugador/TextureRect/TextureButton4/opcion.set_text(labRespuestas[19]);
			
			
			



const lab:Array=[
	"Son los pasos o razones de la duda metódica: ",
	
	"Una de las siguientes es considerada de las cuatro reglas del método en Descartes: ",
	
	"En relación con los datos experimentales que otorgan los sentidos en el conocimiento, 
	Descartes define como: ",
	
	"Solo debemos aceptar como verdadero aquel conocimiento que sea EVIDENTE, CLARO Y
	DISTINTO:",
	
	"En cuanto a la certeza del conocimiento, René Descartes afirma lo siguiente: "
]

const labRespuestas:Array=[
	"Los sentidos nos engañan","La existencia del
	genio maligno","imposibilidad para
	diferenciar la vigilia 
	del sueño", "Todas son correctas",
	
	
	"Hipótesis","Deducción","Evidencia","Inducción",
	
	"Los sentidos son una fuente
	confiable para conocer","Desconfianza de lo que 
	los sentidos nos proporcionan","Los sentidos son complementarios","Los sentidos son determinantes",
	
	
	"René Descartes","David Hume","George Berkeley","Aristóteles",
	
	"Es preciso dudar","Debemos confiar ciegamente","Nada es importante","Todo es posible",
	
	"","","",""
]

const preguntas:Array=[
	"1. Seleccione el mandato cuya obligación viene del miedo al castigo o la búsqueda de un premio: ",
	
	"2. Para Emanuel Kant, es posible conocer lo que las cosas nos permiten (como lo superficial) a
	través de nuestros sentidos: ",
	
	"3. Kant decía que el lema de la ilustración era “Sapere aude”, que significa: ",
	
	"4. Kant (igual que Copérnico cambió el centro del universo de la tierra al sol), cambia el centro
	del conocimiento del objeto al sujeto, a esto se le llama: ",
	
	"5. La postura conciliadora de Kant respecto a los empiristas y racionalistas define que los datos
	experimentales son la fuente del conocimiento racional del sujeto: ",
	
	"6. De las siguientes obras de Emanuel Kant, seleccione aquella que define su epistemología: ",
	
	""
]

const respuestas:Array=[
	"Imperativo Hipotético","Imperativo categórico","Ambos","Ninguno",
	
	"Conocimiento Noumenico","Conocimiento fenoménico","Conocimiento Empírico","Conocimiento Racional ",
	
	"Sopesa tus acciones","Atrévete a saber por ti mismo","Saber a la fuerza","Someterse al conocimiento",
	
	"Subjetivismo","Prejuicio","Giro copernicano","Suerte",
	
	"Racionalismo","Empirismo","Criticismo","Escepticismo",
	
	"Critica de la razón práctica","Critica de la razón pura","Critica del juicio","Critica fenomenológica",
	
	"","","",""
]

func _ready():
	$alex.play("idle");
	$adam.play("idle");
	$bob.play("idle");
	$amelia.play("idle");

func _on_area_2d_body_entered(body):
	if body.is_in_group("Jugador"):
		if contador==0:
			$Jugador/msgRegistro.set_text("Hola mi nombre es Alex, para registrarte 
			ve con mi compañero Bob. El esta aqui 
			en la mesa de al lado.");
		else:
			$Jugador/msgRegistro.set_text("Ya haz sido registrado! Ve por el pasillo a 
			la derecha para entrar a nuestra universidad!");
		
		$Jugador/fondo.show();
		$Jugador/msgRegistro.show();

func _on_area_2d_body_exited(body):
	if body.is_in_group("Jugador"):
		$Jugador/fondo.hide();
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
		$Jugador/fondo.show();
		$StaticBody2D.position.y+=50;
		$StaticBody2D/CollisionShape2D.position.y+=50;
		$adam.position.x=701;
		$adam.position.y=-200;
		$adam.play("idle");
		registrado=true;
		$adamArea.position.x=701;
		$adamArea.position.y=-192;

func _on_area_registro_body_exited(body):
	if body.is_in_group("Jugador"):
		$Jugador/fondo.hide();
		$Jugador/msgRegistro.hide();

func _on_adam_area_body_entered(body):
	if body.is_in_group("Jugador") && registrado==false:
		$Jugador/msgRegistro.set_text("Tienes que registrarte con Alex
		antes de entrar a la universidad!")
		$Jugador/msgRegistro.show();
		$Jugador/fondo.show();
	
	if body.is_in_group("Jugador") && registrado==true:
		if finished==false:
			$Jugador/msgRegistro.set_text("Hola! Mi nombre es Emanuel Kant,
			para obtener la insignia de la Ingenieria debes 
			descifrar el nombre del personaje misterioso,
			para obtener pistas abre los libros.");
			$Jugador/msgRegistro.show();
			$Jugador/fondo.show();
			eKant=true;
		else:
			if terminoclass == false:
				$Jugador/msgRegistro.set_text("Dirigete a la pizarra para,
				adivinar quien es el personaje misterioso!");
				$Jugador/msgRegistro.show();
				$Jugador/fondo.show();
			else:
				$Jugador/msgRegistro.set_text("Ve al Laboratorio");
				$Jugador/msgRegistro.show();
				$Jugador/fondo.show();
		

func _on_adam_area_body_exited(body):
	if body.is_in_group("Jugador"):
		$Jugador/msgRegistro.hide();
		$Jugador/fondo.hide();

func _on_area_libro_body_entered(body):
	if body.is_in_group("Jugador"):
		dentroLibro=true;
		if eKant==true:
			if contadorPreguntas<=2 && libro==true:
				$Jugador/TextureRect.show();
				actualizar();
			else:
				if finished==false:
					$Jugador/msgRegistro.set_text("Para conseguir mas pistas puedes abrir
					el libro situado en el otro escritorio!");
					$Jugador/msgRegistro.show();
					$Jugador/fondo.show();
				else:
					$Jugador/msgRegistro.set_text("Dirigete a la pizarra para
					adivinar el personaje misterioso!");
					$Jugador/msgRegistro.show();
					$Jugador/fondo.show();
				
		else:
			$Jugador/msgRegistro.set_text("Para acceder a este libro tienes que hablar
			con Emanuel Kant.");
			$Jugador/msgRegistro.show();
			$Jugador/fondo.show();

func _on_area_libro_2_body_entered(body):
	if body.is_in_group("Jugador"):
		if eKant==true:
			if contadorPreguntas>2 && libro2==true:
				$Jugador/TextureRect.show();
				actualizar();
			else:
				if finished==false:
					$Jugador/msgRegistro.set_text("Primero debes leer el libro situado
					en el otro escritorio!");
					$Jugador/msgRegistro.show();
					$Jugador/fondo.show();
				else:
					$Jugador/msgRegistro.set_text("Dirigete a la pizarra para
					adivinar el personaje misterioso!");
					$Jugador/msgRegistro.show();
					$Jugador/fondo.show();
				
		else:
			$Jugador/msgRegistro.set_text("Para acceder a este libro tienes que hablar
			con Emanuel Kant.");
			$Jugador/msgRegistro.show();
			$Jugador/fondo.show();

func _on_area_libro_body_exited(body):
	if body.is_in_group("Jugador"):
		dentroLibro=false;
		$Jugador/TextureRect.hide();
		$Jugador/msgRegistro.hide();
		$Jugador/fondo.hide();

func _on_area_libro_2_body_exited(body):
	if body.is_in_group("Jugador"):
		$Jugador/TextureRect.hide();
		$Jugador/msgRegistro.hide();
		$Jugador/fondo.hide();

func _on_texture_button_pressed():
	if finished==false:
		if contadorPreguntas==0:
			correcta+=1;
			$Jugador/TextureRect.hide();
			$Jugador/Label.set_text("CORRECTA");
			$Jugador/correcta.show();
			$Jugador/Label.show();
			await get_tree().create_timer(1.5).timeout;
			$Jugador/correcta.hide();
			$Jugador/Label.hide();
		elif contadorPreguntas>=1 || contadorPreguntas<=5:
			$Jugador/TextureRect.hide();
			$Jugador/Label.set_text("INCORRECTA");
			$Jugador/incorrecta.show();
			$Jugador/Label.show();
			await get_tree().create_timer(1.5).timeout;
			$Jugador/incorrecta.hide();
			$Jugador/Label.hide();
		contadorPreguntas+=1;
		actualizar();
		$Jugador/TextureRect.show();
		if contadorPreguntas<=2 && libro==true || (contadorPreguntas>2 && libro2==true && dentroLibro==false):
			$Jugador/TextureRect.show();
			actualizar();
		else:
			$Jugador/msgRegistro.set_text("Para conseguir mas pistas puedes abrir
			el libro situado en el otro escritorio!");
			$Jugador/msgRegistro.show();
			$Jugador/fondo.show();
			$Jugador/TextureRect.hide();
		
		if contadorPreguntas>5:
			contadorPreguntas+=1;
			$Jugador/TextureRect.hide();
			$Jugador/msgRegistro.set_text("Dirigete a la pizarra para
			adivinar el personaje misterioso!");
			$Jugador/msgRegistro.show();
			$Jugador/fondo.show();
			finished=true;
	else:
		if fases==4 || fases==5:
			correctaLab+=1;
			$Jugador/TextureRect.hide();
			$Jugador/Label.set_text("CORRECTA");
			$Jugador/correcta.show();
			$Jugador/Label.show();
			await get_tree().create_timer(1.5).timeout;
			$Jugador/correcta.hide();
			$Jugador/Label.hide();
		else:
			$Jugador/TextureRect.hide();
			$Jugador/Label.set_text("INCORRECTA");
			$Jugador/incorrecta.show();
			$Jugador/Label.show();
			await get_tree().create_timer(1.5).timeout;
			$Jugador/incorrecta.hide();
			$Jugador/Label.hide();
		fases+=1;
		if fases==3:
			finishedLab=true;
		if fases>=5:
			fases+=1;
			$Jugador/TextureRect.hide();
			$Jugador/msgRegistro.set_text("Dirigete a la pizarra para
			adivinar el personaje misterioso!");
			$Jugador/msgRegistro.show();
			$Jugador/fondo.show();
			finishedLab=true;
	
	




func _on_texture_button_2_pressed():
	if finished==false:
		if contadorPreguntas==0:
			$Jugador/TextureRect.hide();
			$Jugador/Label.set_text("INCORRECTA");
			$Jugador/incorrecta.show();
			$Jugador/Label.show();
			await get_tree().create_timer(1.5).timeout;
			$Jugador/incorrecta.hide();
			$Jugador/Label.hide();
		elif contadorPreguntas==1 || contadorPreguntas==2 || contadorPreguntas==5:
			correcta+=1;
			$Jugador/TextureRect.hide();
			$Jugador/Label.set_text("CORRECTA");
			$Jugador/correcta.show();
			$Jugador/Label.show();
			await get_tree().create_timer(1.5).timeout;
			$Jugador/correcta.hide();
			$Jugador/Label.hide();
		elif contadorPreguntas==3 || contadorPreguntas==4:
			$Jugador/TextureRect.hide();
			$Jugador/Label.set_text("INCORRECTA");
			$Jugador/incorrecta.show();
			$Jugador/Label.show();
			await get_tree().create_timer(1.5).timeout;
			$Jugador/incorrecta.hide();
			$Jugador/Label.hide();
			
		contadorPreguntas+=1;
		actualizar();
		$Jugador/TextureRect.show();
		
		if contadorPreguntas<=2 && libro==true || (contadorPreguntas>2 && libro2==true && dentroLibro==false):
			$Jugador/TextureRect.show();
			actualizar();
		else:
			$Jugador/msgRegistro.set_text("Para conseguir mas pistas puedes abrir
			el libro situado en el otro escritorio!");
			$Jugador/msgRegistro.show();
			$Jugador/fondo.show();
			$Jugador/TextureRect.hide();
		
		if contadorPreguntas>5:
			contadorPreguntas+=1;
			$Jugador/TextureRect.hide();
			$Jugador/msgRegistro.set_text("Dirigete a la pizarra para
			adivinar el personaje misterioso!");
			$Jugador/msgRegistro.show();
			$Jugador/fondo.show();
			finished=true;
	else:
		if fases==2:
			correctaLab+=1;
			$Jugador/TextureRect.hide();
			$Jugador/Label.set_text("CORRECTA");
			$Jugador/correcta.show();
			$Jugador/Label.show();
			await get_tree().create_timer(1.5).timeout;
			$Jugador/correcta.hide();
			$Jugador/Label.hide();
		else:
			$Jugador/TextureRect.hide();
			$Jugador/Label.set_text("INCORRECTA");
			$Jugador/incorrecta.show();
			$Jugador/Label.show();
			await get_tree().create_timer(1.5).timeout;
			$Jugador/incorrecta.hide();
			$Jugador/Label.hide();
		fases+=1;
		if fases==3:
			finishedLab=true;
		if fases>=5:
			fases+=1;
			$Jugador/TextureRect.hide();
			$Jugador/msgRegistro.set_text("Dirigete a la pizarra para
			adivinar el personaje misterioso!");
			$Jugador/msgRegistro.show();
			$Jugador/fondo.show();
			finishedLab=true;
	
	



func _on_texture_button_3_pressed():
	if finished==false:
		if contadorPreguntas==0 || contadorPreguntas==1 || contadorPreguntas==2 || contadorPreguntas==5:
			$Jugador/incorrecta.show();
			$Jugador/TextureRect.hide();
			$Jugador/Label.set_text("INCORRECTA");
			$Jugador/Label.show();
			await get_tree().create_timer(1.5).timeout;
			$Jugador/incorrecta.hide();
			$Jugador/Label.hide();
		elif contadorPreguntas==3 || contadorPreguntas==4:
			correcta+=1;
			$Jugador/TextureRect.hide();
			$Jugador/Label.set_text("CORRECTA");
			$Jugador/correcta.show();
			$Jugador/Label.show();
			await get_tree().create_timer(1.5).timeout;
			$Jugador/correcta.hide();
			$Jugador/Label.hide();
			
		contadorPreguntas+=1;
		actualizar();
		$Jugador/TextureRect.show();
		
		if contadorPreguntas<=2 && libro==true || (contadorPreguntas>2 && libro2==true && dentroLibro==false):
			$Jugador/TextureRect.show();
			actualizar();
		else:
			$Jugador/msgRegistro.set_text("Para conseguir mas pistas puedes abrir
			el libro situado en el otro escritorio!");
			$Jugador/msgRegistro.show();
			$Jugador/fondo.show();
			$Jugador/TextureRect.hide();
		
		
		if contadorPreguntas>5:
			contadorPreguntas+=1;
			$Jugador/TextureRect.hide();
			$Jugador/msgRegistro.set_text("Dirigete a la pizarra para
			adivinar el personaje misterioso!");
			$Jugador/msgRegistro.show();
			$Jugador/fondo.show();
			finished=true;
	else:
		if fases==1:
			correctaLab+=1;
			$Jugador/TextureRect.hide();
			$Jugador/Label.set_text("CORRECTA");
			$Jugador/correcta.show();
			$Jugador/Label.show();
			await get_tree().create_timer(1.5).timeout;
			$Jugador/correcta.hide();
			$Jugador/Label.hide();
		else:
			$Jugador/TextureRect.hide();
			$Jugador/incorrecta.show();
			$Jugador/Label.set_text("INCORRECTA");
			$Jugador/Label.show();
			await get_tree().create_timer(1.5).timeout;
			$Jugador/incorrecta.hide();
			$Jugador/Label.hide();
		fases+=1;
		if fases==3:
			finishedLab=true;
		if fases>=5:
			fases+=1;
			$Jugador/TextureRect.hide();
			$Jugador/msgRegistro.set_text("Dirigete a la pizarra para
			adivinar el personaje misterioso!");
			$Jugador/msgRegistro.show();
			$Jugador/fondo.show();
			finishedLab=true;
	
	


func _on_texture_button_4_pressed():
	if finished==false:
		if contadorPreguntas>=0 || contadorPreguntas<=5:
			$Jugador/TextureRect.hide();
			$Jugador/incorrecta.show();
			$Jugador/Label.set_text("INCORRECTA");
			$Jugador/Label.show();
			await get_tree().create_timer(1.5).timeout;
			$Jugador/incorrecta.hide();
			$Jugador/Label.hide();
		contadorPreguntas+=1;
		actualizar();
		$Jugador/TextureRect.show();
		
		if contadorPreguntas<=2 && libro==true || (contadorPreguntas>2 && libro2==true && dentroLibro==false):
			$Jugador/TextureRect.show();
			actualizar();
		else:
			$Jugador/msgRegistro.set_text("Para conseguir mas pistas puedes abrir
			el libro situado en el otro escritorio!");
			$Jugador/msgRegistro.show();
			$Jugador/fondo.show();
			$Jugador/TextureRect.hide();
		
		if contadorPreguntas>5:
			contadorPreguntas+=1;
			$Jugador/TextureRect.hide();
			$Jugador/msgRegistro.set_text("Dirigete a la pizarra para
			adivinar el personaje misterioso!");
			$Jugador/msgRegistro.show();
			$Jugador/fondo.show();
			finished=true;
	else:
		if fases==0:
			correctaLab+=1;
			$Jugador/TextureRect.hide();
			$Jugador/Label.set_text("CORRECTA");
			$Jugador/correcta.show();
			$Jugador/Label.show();
			await get_tree().create_timer(1.5).timeout;
			$Jugador/correcta.hide();
			$Jugador/Label.hide();
		elif fases>=1 || fases<=5:
			$Jugador/TextureRect.hide();
			$Jugador/incorrecta.show();
			$Jugador/Label.set_text("INCORRECTA");
			$Jugador/Label.show();
			await get_tree().create_timer(1.5).timeout;
			$Jugador/incorrecta.hide();
			$Jugador/Label.hide();
		fases+=1;
		if fases==3:
			finishedLab=true;
		if fases>=5:
			fases+=1;
			$Jugador/TextureRect.hide();
			$Jugador/msgRegistro.set_text("Dirigete a la pizarra para
			adivinar el personaje misterioso!");
			$Jugador/msgRegistro.show();
			$Jugador/fondo.show();
			
	
	


func _on_texture_button_mouse_entered():
	$Jugador/TextureRect/TextureButton/PointLight2D.show();


func _on_texture_button_mouse_exited():
	$Jugador/TextureRect/TextureButton/PointLight2D.hide();


func _on_texture_button_2_mouse_entered():
	$Jugador/TextureRect/TextureButton2/PointLight2D.show();


func _on_texture_button_2_mouse_exited():
	$Jugador/TextureRect/TextureButton2/PointLight2D.hide();


func _on_texture_button_3_mouse_entered():
	$Jugador/TextureRect/TextureButton3/PointLight2D.show();


func _on_texture_button_3_mouse_exited():
	$Jugador/TextureRect/TextureButton3/PointLight2D.hide();


func _on_texture_button_4_mouse_entered():
	$Jugador/TextureRect/TextureButton4/PointLight2D.show();


func _on_texture_button_4_mouse_exited():
	$Jugador/TextureRect/TextureButton4/PointLight2D.hide();







func _on_area_pizarra_body_entered(body):
	if body.is_in_group("Jugador") && finished==true:
		dentroPizarra=true;
		$Jugador/fondo.show();
		$Jugador/msgRegistro.set_text("Presiona ENTER para interactuar.");
		$Jugador/msgRegistro.show();
		


func _on_area_pizarra_body_exited(body):
	$Jugador/msgRegistro.hide();
	$Jugador/fondo.hide();
	dentroPizarra=false;


#descartes
func _on_area_body_entered(body):
	if body.is_in_group("Jugador") && finished==false:
		$Jugador/msgRegistro.set_text("Primero debes resolver el enigma
		de Emanuel Kant!");
		$Jugador/msgRegistro.show();
		$Jugador/fondo.show();
	elif body.is_in_group("Jugador") && finishedLab==false:
		$Jugador/msgRegistro.set_text("Mi nombre es Rene Descartes, para
		obtener la insignia de la Teorizacion debes
		completar las 4 fases ubicadas en cada mesa
		y completadas las fases deducir el nombre
		del personaje visualizado en la pizarra.");
		$Jugador/msgRegistro.show();
		$Jugador/fondo.show();
		descartes=true;
	elif body.is_in_group("Jugador") && fases==4:
		$Jugador/TextureRect.show();
		actualizar()
	elif  body.is_in_group("Jugador") && fases>4:
		$Jugador/msgRegistro.set_text("Dirigete a una de las pizarras
		y acierta el nombre del personaje!");
		$Jugador/msgRegistro.show();
		$Jugador/fondo.show();



func _on_area_body_exited(body):
	$Jugador/msgRegistro.hide();
	$Jugador/fondo.hide();


#mesas
func _on_lab_body_entered(body):
	if body.is_in_group("Jugador") && descartes==true:
		if fases==0:
			$Jugador/TextureRect.show();
			actualizar();
		else:
			if fases==1:
				$Jugador/msgRegistro.set_text("Dirigete al escritorio 2!");
			elif fases==2:
				$Jugador/msgRegistro.set_text("Dirigete al escritorio 3!");
			elif fases==3:
				$Jugador/msgRegistro.set_text("Dirigete al escritorio 4!");
			elif fases==4:
				$Jugador/msgRegistro.set_text("Completaste todas lases fases,
				habla con Rene Descartes!");
			$Jugador/msgRegistro.show();
			$Jugador/fondo.show();
		
	elif body.is_in_group("Jugador") && descartes==false:
		$Jugador/msgRegistro.set_text("Primero debes hablar con Rene Descartes!");
		$Jugador/msgRegistro.show();
		$Jugador/fondo.show();

func _on_lab_body_exited(body):
	$Jugador/msgRegistro.hide();
	$Jugador/fondo.hide();
	$Jugador/TextureRect.hide();



func _on_lab_2_body_entered(body):
	if body.is_in_group("Jugador") && descartes==true:
		if fases==1:
			$Jugador/TextureRect.show();
			actualizar();
		else:
			if fases==0:
				$Jugador/msgRegistro.set_text("Dirigete al escritorio 1!");
			elif fases==2:
				$Jugador/msgRegistro.set_text("Dirigete al escritorio 3!");
			elif fases==3:
				$Jugador/msgRegistro.set_text("Dirigete al escritorio 4!");
			elif fases==4:
				$Jugador/msgRegistro.set_text("Completaste todas lases fases,
				habla con Rene Descartes!");
			$Jugador/msgRegistro.show();
			$Jugador/fondo.show();
		
	elif body.is_in_group("Jugador") && descartes==false:
		$Jugador/msgRegistro.set_text("Primero debes hablar con Rene Descartes!");
		$Jugador/msgRegistro.show();
		$Jugador/fondo.show();


func _on_lab_2_body_exited(body):
	$Jugador/msgRegistro.hide();
	$Jugador/fondo.hide();
	$Jugador/TextureRect.hide();


func _on_lab_3_body_entered(body):
	if body.is_in_group("Jugador") && descartes==true:
		if fases==2:
			$Jugador/TextureRect.show();
			actualizar();
		else:
			if fases==0:
				$Jugador/msgRegistro.set_text("Dirigete al escritorio 1!");
			elif fases==1:
				$Jugador/msgRegistro.set_text("Dirigete al escritorio 2!");
			elif fases==3:
				$Jugador/msgRegistro.set_text("Dirigete al escritorio 4!");
			elif fases==4:
				$Jugador/msgRegistro.set_text("Completaste todas lases fases,
				habla con Rene Descartes!");
			$Jugador/msgRegistro.show();
			$Jugador/fondo.show();
		
	elif body.is_in_group("Jugador") && descartes==false:
		$Jugador/msgRegistro.set_text("Primero debes hablar con Rene Descartes!");
		$Jugador/msgRegistro.show();
		$Jugador/fondo.show();

func _on_lab_3_body_exited(body):
	$Jugador/msgRegistro.hide();
	$Jugador/fondo.hide();
	$Jugador/TextureRect.hide();

func _on_lab_4_body_entered(body):
	if body.is_in_group("Jugador") && descartes==true:
		if fases==3:
			$Jugador/TextureRect.show();
			actualizar();
		else:
			if fases==0:
				$Jugador/msgRegistro.set_text("Dirigete al escritorio 1!");
			elif fases==1:
				$Jugador/msgRegistro.set_text("Dirigete al escritorio 2!");
			elif fases==2:
				$Jugador/msgRegistro.set_text("Dirigete al escritorio 3!");
			elif fases==4:
				$Jugador/msgRegistro.set_text("Completaste todas lases fases,
				habla con Rene Descartes!");
			$Jugador/msgRegistro.show();
			$Jugador/fondo.show();
		
	elif body.is_in_group("Jugador") && descartes==false:
		$Jugador/msgRegistro.set_text("Primero debes hablar con Rene Descartes!");
		$Jugador/msgRegistro.show();
		$Jugador/fondo.show();


func _on_lab_4_body_exited(body):
	$Jugador/msgRegistro.hide();
	$Jugador/fondo.hide();
	$Jugador/TextureRect.hide();




func _on_area_pizarron_body_entered(body):
	if body.is_in_group("Jugador") && finished==true && finishedLab==true && terminolab == false:
		$Jugador/Label2.show()
		dentroPizarron=true;
		$Jugador/fondo.show();
		$Jugador/msgRegistro.set_text("Presiona ENTER para interactuar.");
		$Jugador/msgRegistro.show();
		await get_tree().create_timer(3).timeout
		$Jugador/fondo.hide();
		$Jugador/msgRegistro.hide();


func _on_area_pizarron_body_exited(body):
	$Jugador/msgRegistro.hide();
	$Jugador/fondo.hide();
	dentroPizarron=false;


func _on_area_pizarron_2_body_entered(body):
	if body.is_in_group("Jugador") && finished==true && finishedLab==true && terminolab == false:
		dentroPizarron=true;
		$Jugador/msgRegistro.set_text("Presiona ENTER para interactuar.");
		$Jugador/msgRegistro.show();


func _on_area_pizarron_2_body_exited(body):
	$Jugador/msgRegistro.hide();
	$Jugador/fondo.hide();
	dentroPizarron=false;


func _on_button_pressed():
	dentroPizarron=false;
	$Jugador/Label2.hide()
	$Jugador/pizarra.hide()
	$Jugador/msgRegistro.show();
	$Jugador/msgRegistro.set_text("¡FALLASTE!");
	await get_tree().create_timer(1).timeout
	$Jugador/msgRegistro.set_text("TIENES QUE VOLVER A REPETIR EL CURSO")
	$Jugador/fondo.show();
	await get_tree().create_timer(3).timeout
	get_tree().reload_current_scene()


func _on_button_2_pressed():
	dentroPizarron=false;
	$Jugador/pizarra.hide()
	$Jugador/Label2.hide()
	$Jugador/msgRegistro.show();
	$Jugador/fondo.show();
	$Jugador/msgRegistro.set_text("¡ACERTASTE!");
	await get_tree().create_timer(1).timeout
	$Jugador/msgRegistro.set_text("AHORA TIENES QUE IR AL LABORATORIO")
	await get_tree().create_timer(3).timeout
	$Jugador/fondo.hide();
	$Jugador/msgRegistro.hide();
	terminoclass=true
	
func _on_button_3_pressed():
	dentroPizarron=false;
	$Jugador/pizarra.hide()
	$Jugador/msgRegistro.show();
	$Jugador/fondo.show();
	$Jugador/Label2.hide()
	$Jugador/msgRegistro.set_text("¡FALLASTE!");
	await get_tree().create_timer(1).timeout
	$Jugador/msgRegistro.set_text("TIENES QUE VOLVER A REPETIR EL CURSO");
	await get_tree().create_timer(3).timeout
	get_tree().reload_current_scene()


func _on_button_4_pressed():
	dentroPizarron=false;
	$Jugador/pizarra.hide()
	$Jugador/msgRegistro.show();
	$Jugador/Label2.hide()
	$Jugador/fondo.show();
	$Jugador/msgRegistro.set_text("¡FALLASTE!");
	await get_tree().create_timer(1).timeout
	$Jugador/msgRegistro.set_text("TIENES QUE VOLVER A REPETIR EL CURSO");
	await get_tree().create_timer(3).timeout
	get_tree().reload_current_scene()


func _on_buttonp_pressed():
	$Jugador/Buttonp.hide()
	$Jugador/Buttonp2.hide()
	$Jugador/Buttonp3.hide()
	$Jugador/Buttonp4.hide()
	$Jugador/pizarronLaboratio.hide()
	descartes=false;
	fases=0
	finishedLab=false
	dentroPizarron=false;
	$Jugador/fondo.show()
	$Jugador/msgRegistro.show()
	$Jugador/msgRegistro.set_text("Fallaste")
	await get_tree().create_timer(3).timeout
	$Jugador/fondo.hide()
	$Jugador/msgRegistro.hide()
	$Jugador.position = $TileMap/Marker2D.position

func _on_buttonp_2_pressed():
	$Jugador/Buttonp.hide()
	$Jugador/Buttonp2.hide()
	$Jugador/Buttonp3.hide()
	$Jugador/Buttonp4.hide()
	$Jugador/pizarronLaboratio.hide()
	$Jugador/fondo.show()
	$Jugador/msgRegistro.show()
	$Jugador/msgRegistro.set_text("Acertaste")
	terminolab = true
	await get_tree().create_timer(3).timeout
	$Jugador/fondo.hide()
	$Jugador/msgRegistro.hide()
	
	
func _on_buttonp_3_pressed():
	$Jugador/Buttonp.hide()
	$Jugador/Buttonp2.hide()
	$Jugador/Buttonp3.hide()
	$Jugador/Buttonp4.hide()
	$Jugador/pizarronLaboratio.hide()
	descartes=false;
	finishedLab=false
	fases=0
	dentroPizarron=false;
	$Jugador/fondo.show()
	$Jugador/msgRegistro.show()
	$Jugador/msgRegistro.set_text("Fallaste")
	await get_tree().create_timer(3).timeout
	$Jugador/fondo.hide()
	$Jugador/msgRegistro.hide()
	$Jugador.position = $TileMap/Marker2D.position


func _on_buttonp_4_pressed():
	$Jugador/Buttonp.hide()
	$Jugador/Buttonp2.hide()
	$Jugador/Buttonp3.hide()
	$Jugador/Buttonp4.hide()
	$Jugador/pizarronLaboratio.hide()
	descartes=false;
	fases=0
	finishedLab=false
	dentroPizarron=false;
	$Jugador/fondo.show()
	$Jugador/msgRegistro.show()
	$Jugador/msgRegistro.set_text("Fallaste")
	await get_tree().create_timer(3).timeout
	$Jugador/fondo.hide()
	$Jugador/msgRegistro.hide()
	$Jugador.position = $TileMap/Marker2D.position
