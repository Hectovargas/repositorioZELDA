extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$SubViewportContainer/SubViewport/Node2D/MapaInicial/Jugador/Camera2D.zoom = Vector2(0.2,0.2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
