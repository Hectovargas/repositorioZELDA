extends Control
const Savefile = "User//SAVEFILE.save"


var data = {
	"name": name,
	"password": password
  }

func load_data():
	var file = FileAccess.open(Savefile,FileAccess.READ)
	if file == null:
		save_data()
	else:
		data=file.get_var()

func save_data():
	var file = FileAccess.open(Savefile,FileAccess.WRITE)
	file.store_var(data)
	file=null


func _on_texture_button_pressed():
	var nombre = $NinePatchRect/LineEdit.text() 
	var password = $NinePatchRect/LineEdit2.text() 
