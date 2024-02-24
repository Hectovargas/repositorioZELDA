extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


const textos : Array = [
	'En la segunda mitad del siglo XIV, las personas cultas en Italia
insisten en que se ha producido un cambio fundamental en la actitud de los hombres frente al
mundo y a la vida, denominado humanismo.', #0
'Están convencidos que se ha producido “una ruptura
radical con el mundo medieval” y tratan de entender cuál es el significado del cambio, luego para
final del mismo siglo y durante el siglo XV, los reyes aprovecharon la crisis del feudalismo para
retomar su poder,', #1
'lo que supone el Renacimiento del hombre, de la cultura y la sociedad,pero sobre todo de transformaciones en los mecanismos del gobierno y en el ejercicio del poder,
respaldado por la burguesía.', #2
' El tratado de Paz firmado en Westfalia que finalizó la Guerra de los
Treinta Años en Alemania y la Guerra de los ochenta años entre España y los Países Bajos en
1648, dio origen al Estado Nacional, replanteando los principios de soberanía y de integridad
territorial en las naciones europeas.', #3
'En el campo de la filosofía, después de la revolución
científica, se revaloriza al hombre como sujeto de la razón, suscitando una visión antropocéntrica
de la filosofía, la ciencia y otras disciplinas. En el terreno de la epistemología, se desarrollan
grandes discusiones en torno al problema del conocimiento,', #4
' uno de los cuales enfrentará a los
racionalistas (quienes afirmaban que el conocimiento se origina en la razón a través de las ideas
innatas) frente a los empiristas (quienes afirmaban que el conocimiento se origina en las
experiencias sensibles, a través de los sentidos).', #5
' A continuación, te invitamos a acompañarnos en
este viaje cognitivo. Vas a seguir un trayecto a través de distintos niveles, que deberás seguir con
responsabilidad.', #6
'En el primero denominada ruleta del saber, inicias un nivel de entrenamiento
donde vas a cargar vidas para los siguientes niveles, en el siguiente nivel denominado de
andamiaje, vas asumiendo retos y guías mientras sumas puntos hasta llegar al nivel de dominio,
nivel de experto.' #7

		
]

var parrafo : int=0;

func setText(TEXTO:String)-> void:
	show()
	$TEXTO.text=TEXTO
	$ANIM.play("ponerTexto")
	

func alPresionarBoton()->void:
	if parrafo<textos.size():
		setText(textos[parrafo])
		parrafo=parrafo+1
	else:
		hide()
		parrafo=parrafo-textos.size()
		

