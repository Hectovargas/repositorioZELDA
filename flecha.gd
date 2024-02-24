extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	scale = Vector2(3,3)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= 7
	
