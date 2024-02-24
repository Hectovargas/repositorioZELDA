extends Control

var segundos = 0
# Called when the node enters the scene tree for the first time.

func _ready():
	pass # Replace with function body.

var parrafo: int=0
var contador: int=0
var enterPressed: bool=true
var reproducido = true
# Called every frame. 'delta' is the elapsed time since the previous frame.

func start(Text:String,image:Texture,audios: AudioStream)->void:
	$CanvasLayer.show()
	$CanvasLayer/Label.text[0]
	$CanvasLayer/Label.text = Text
	$CanvasLayer/Image.texture = image
	$CanvasLayer/audios.stream = audios
	$CanvasLayer/audios.play()
	$CanvasLayer/AnimationPlayer.stop()
	$CanvasLayer/AnimationPlayer.play("type")
	

func _process(delta):
	segundos+=1
	print(segundos)
	if(parrafo==0 && reproducido == true):
		reproducido=false
		start(textos[0],images[0],audio[0])
	if segundos >= 100:
		$CanvasLayer/Label2.show()
		if Input.is_key_pressed(KEY_ENTER):
			parrafo+=1
			$CanvasLayer/Label2.hide()
			segundos=0
			if 7<parrafo:
				get_tree().change_scene_to_file("res://zona Inical.tscn") 
			else:
				start(textos[parrafo],images[parrafo],audio[parrafo])

const images : Dictionary ={
	0 : preload("res://images/numero1.png"),
	1 : preload("res://images/numero2.png"),
	2 : preload("res://images/numero3.jpg"),
	3 : preload("res://images/numero4.jpg"),
	4 : preload("res://images/numero5 (frfr).jpg"),
	5 : preload("res://images/numero6.jpg"),
	6 : preload("res://images/numero7(frfr)1.jpg"),
	7 : preload("res://images/numero8.png"),
	8 : ""
}

const audio : Dictionary ={
	0 : preload("res://lvl 1/1 (frfr) (13).mp3"),
	1 : preload("res://lvl 1/2 (frfr) (17).mp3"),
	2 : preload("res://lvl 1/3 (frfr) (14).mp3"),
	3 : preload("res://lvl 1/4 (frfr) (19).mp3"),
	4 : preload("res://lvl 1/5 (frfr) (17).mp3"),
	5 : preload("res://lvl 1/6 (frfr) (16).mp3"),
	6 : preload("res://lvl 1/7 (frfr) (20).mp3"),
	7 : preload("res://lvl 1/8 (frfr) (9).mp3"),
	8 : ""
}


const textos : Array = [
"En la segunda mitad del siglo XIV, las personas cultas en Italia insisten en que se ha producido un cambio 
fundamental en la actitud de los hombres frente al mundo y a la vida, denominado humanismo. ",#0

"Están convencidos que se ha producido “una ruptura radical con el mundo medieval” y tratan de entender 
cuál es el significado del cambio, luego para final del mismo siglo y durante el siglo XV, los reyes
aprovecharon la crisis del feudalismo para retomar su poder", #1

"lo que supone el Renacimiento del hombre, de la cultura y la sociedad,pero sobre todo de 
transformaciones en los mecanismos del gobierno y en el ejercicio del poder,respaldado por la burguesía.", #2

"El tratado de Paz firmado en Westfalia que finalizó la Guerra de los Treinta Años en Alemania y la
Guerra de los ochenta años entre España y los Países Bajos en 1648,dio origen al Estado Nacional,
replanteando los principios de soberanía y de integridad territorial en las naciones europeas.", #3

"En el campo de la filosofía, después de la revolución científica, se revaloriza al hombre como
sujeto de la razón, suscitando una visión antropocéntrica de la filosofía, la ciencia y otras disciplinas.
En el terreno de la epistemología, uno de los cuales enfrentará a ", #4

"los racionalistas (quienes afirmaban que el conocimiento se origina en la razón a través de las
ideas innatas) frente a los empiristas (quienes afirmaban que el conocimiento se origina en las
experiencias sensibles, a través de los sentidos).", #5

"A continuación, te invitamos a acompañarnos en este viaje cognitivo. Vas a seguir un trayecto a través 
de distintos niveles, que deberás seguir con responsabilidad. En el primero denominada ruleta del saber,
inicias un nivel de entrenamiento donde vas a cargar vidas para los siguientes niveles", #6

"en el siguiente nivel denominado de andamiaje, vas asumiendo retos y guías mientras sumas puntos
hasta llegar al nivel de dominio, nivel de experto.",#7 
"" #8

		
]




