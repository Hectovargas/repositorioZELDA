extends Node2D

var contestada:bool=false;
var contestada2:bool=false;
var contestada3:bool=false;
var contestada4:bool=false;
var contestada5:bool=false;
var contestada6:bool=false;
var entroPregunta:bool=false;
var z:int=0;
var contadorPreguntas:int=0;
var correcta:int=0;

const textoPista:Array=[
	"Tu personaje es portador de ______________ y representante de la ________________.
	Se convirtio en _________ tras _____________, en su viaje se dedica a _________________,
	acompañad_ de su leal compañer_ __________.",
	
	"Tu personaje es portador de la 'Espada Maestra' y representante de la ________________.
	Se convirtio en _________ tras _____________, en su viaje se dedica a _________________,
	acompañad_ de su leal compañer_ __________.",
	
	"Tu personaje es portador de la 'Espada Maestra' y representante de la Trifuerza del Valor.
	Se convirtio en _________ tras _____________, en su viaje se dedica a _________________,
	acompañad_ de su leal compañer_ __________.",
	
	"Tu personaje es portador de la 'Espada Maestra' y representante de la Trifuerza del Valor.
	Se convirtio en un heroe tras _____________, en su viaje se dedica a _________________,
	acompañad_ de su leal compañer_ __________.",
	
	"Tu personaje es portador de la 'Espada Maestra' y representante de la Trifuerza del Valor.
	Se convirtio en un heroe tras salvar Hyrule, en su viaje se dedica a _________________,
	acompañad_ de su leal compañer_ __________.",
	
	"Tu personaje es portador de la 'Espada Maestra' y representante de la Trifuerza del Valor.
	Se convirtio en un heroe tras salvar Hyrule, en su viaje se dedica a completar mazmorras
	acompañado de su leal compañer_ __________.",
	
	"Tu personaje es portador de la 'Espada Maestra' y representante de la Trifuerza del Valor.
	Se convirtio en un heroe tras salvar Hyrule, en su viaje se dedica a completar mazmorras
	acompañado de su leal compañera Navi, quien es un hada."
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
	
	"6. De las siguientes obras de Emanuel Kant, seleccione aquella que define su epistemología: "
]

const respuestas:Array=[
	"Imperativo Hipotético","Imperativo categórico","Ambos","Ninguno",
	
	"Conocimiento Noumenico","Conocimiento fenoménico","Conocimiento Empírico","Conocimiento Racional ",
	
	"Sopesa tus acciones","Atrévete a saber por ti mismo","Saber a la fuerza","Someterse al conocimiento",
	
	"Subjetivismo","Prejuicio","Giro copernicano","Suerte",
	
	"Racionalismo","Empirismo","Criticismo","Escepticismo",
	
	"Critica de la razón práctica","Critica de la razón pura","Critica del juicio","Critica fenomenológica",	
]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if z==1:
		if contadorPreguntas==0:
			$Jugador/TextureRect/Label.set_text(preguntas[contadorPreguntas]);
			$Jugador/TextureRect/TextureButton/opcion.set_text(respuestas[contadorPreguntas]);
			$Jugador/TextureRect/TextureButton2/opcion.set_text(respuestas[contadorPreguntas+1]);
			$Jugador/TextureRect/TextureButton3/opcion.set_text(respuestas[contadorPreguntas+2]);
			$Jugador/TextureRect/TextureButton4/opcion.set_text(respuestas[contadorPreguntas+3]);


func _on_area_libro_body_entered(body):
	if body.is_in_group("Jugador") && entroPregunta==false:
		$Jugador/TextureRect.show();
		z=1;
		entroPregunta=true;


func _on_area_libro_body_exited(body):
	if body.is_in_group("Jugador") && entroPregunta==false:
		$Jugador/TextureRect.hide();


func _on_area_libro_2_body_entered(body):
	if body.is_in_group("Jugador") && entroPregunta==false:
		$Jugador/TextureRect.show();


func _on_area_libro_2_body_exited(body):
	if body.is_in_group("Jugador") && entroPregunta==false:
		$Jugador/TextureRect.hide();


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


func _on_texture_button_pressed():
	if contadorPreguntas==0:
		correcta+=1;
		$Jugador/TextureRect.hide();
		$Jugador/Label.set_text("CORRECTA");
		$Jugador/correcta.show();
		$Jugador/Label.show();
		await get_tree().create_timer(1.5).timeout;
		$Jugador/correcta.hide();
		$Jugador/Label.hide();

func _on_texture_button_2_pressed():
	if contadorPreguntas==0:
		$Jugador/incorrecta.show();
		$Jugador/Label.set_text("INCORRECTA");
		$Jugador/Label.show();
		await get_tree().create_timer(1.5).timeout;
		$Jugador/incorrecta.hide();
		$Jugador/Label.hide();

func _on_texture_button_3_pressed():
	if contadorPreguntas==0:
		$Jugador/TextureRect.hide();
		$Jugador/incorrecta.show();
		$Jugador/Label.set_text("INCORRECTA");
		$Jugador/Label.show();
		await get_tree().create_timer(1.5).timeout;
		$Jugador/incorrecta.hide();
		$Jugador/Label.hide();


func _on_texture_button_4_pressed():
	if contadorPreguntas==0:
		$Jugador/TextureRect.hide();
		$Jugador/incorrecta.show();
		$Jugador/Label.set_text("INCORRECTA");
		$Jugador/Label.show();
		await get_tree().create_timer(1.5).timeout;
		$Jugador/incorrecta.hide();
		$Jugador/Label.hide();
