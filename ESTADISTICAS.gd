extends Control
var l
var arreglo
# Called when the node enters the scene tree for the first time.
func _ready():
	arreglo=FileUtils.dir_contents()
	_compare_descending(arreglo)
	print(arreglo)
	l = arreglo.size()
	if l > 5:
		l=5
	for i in range(l):
		if arreglo[i] != null:
			var file
			var load_datas : Dictionary
			if(FileAccess.file_exists(arreglo[i])):
				file = FileAccess.open(arreglo[i],FileAccess.READ)
				load_datas = JSON.parse_string(file.get_line())
			if i==0:
				mostrarvida(int(load_datas.maxvida))
				$NinePatchRect/ProgressBar.value=int(load_datas.progreso)
				$NinePatchRect/ProgressBar/RichTextLabel.set_text(load_datas.usuario)
				if load_datas.nacionalista:
					$NinePatchRect/ProgressBar/RichTextLabel2/LOGORACIONALISTA.show()
				if load_datas.empirista:
					$NinePatchRect/ProgressBar/RichTextLabel2/LOGOEMPIRISTA.show()
				if load_datas.trifuerza:
					$NinePatchRect/ProgressBar/RichTextLabel2/Sprite2D2.show()
				if load_datas.logo1:
					$NinePatchRect/ProgressBar/RichTextLabel2/Sprite2D.show()
				if load_datas.logo2:
					$NinePatchRect/ProgressBar/RichTextLabel2/Sprite2D3.show()
			if i==1:
				mostrarvida2(int(load_datas.maxvida))
				$NinePatchRect/ProgressBar2.value=int(load_datas.progreso)
				$NinePatchRect/ProgressBar2/RichTextLabel.set_text(load_datas.usuario)
				if load_datas.nacionalista:
					$NinePatchRect/ProgressBar2/RichTextLabel2/LOGORACIONALISTA.show()
				if load_datas.empirista:
					$NinePatchRect/ProgressBar2/RichTextLabel2/LOGOEMPIRISTA.show()
				if load_datas.trifuerza:
					$NinePatchRect/ProgressBar2/RichTextLabel2/Sprite2D2.show()
				if load_datas.logo1:
					$NinePatchRect/ProgressBar2/RichTextLabel2/Sprite2D.show()
				if load_datas.logo2:
					$NinePatchRect/ProgressBar2/RichTextLabel2/Sprite2D3.show()
			if i==2:
				mostrarvida3(int(load_datas.maxvida))
				$NinePatchRect/ProgressBar3.value=int(load_datas.progreso)
				$NinePatchRect/ProgressBar3/RichTextLabel.set_text(load_datas.usuario)
				if load_datas.nacionalista:
					$NinePatchRect/ProgressBar3/RichTextLabel2/LOGORACIONALISTA.show()
				if load_datas.empirista:
					$NinePatchRect/ProgressBar3/RichTextLabel2/LOGOEMPIRISTA.show()
				if load_datas.trifuerza:
					$NinePatchRect/ProgressBar3/RichTextLabel2/Sprite2D2.show()
				if load_datas.logo1:
					$NinePatchRect/ProgressBar3/RichTextLabel2/Sprite2D.show()
				if load_datas.logo2:
					$NinePatchRect/ProgressBar3/RichTextLabel2/Sprite2D3.show()
			if i==3:
				mostrarvida4(int(load_datas.maxvida))
				$NinePatchRect/ProgressBar4.value=int(load_datas.progreso)
				$NinePatchRect/ProgressBar4/RichTextLabel.set_text(load_datas.usuario)
				if load_datas.nacionalista:
					$NinePatchRect/ProgressBar4/RichTextLabel2/LOGORACIONALISTA.show()
				if load_datas.empirista:
					$NinePatchRect/ProgressBar4/RichTextLabel2/LOGOEMPIRISTA.show()
				if load_datas.trifuerza:
					$NinePatchRect/ProgressBar4/RichTextLabel2/Sprite2D2.show()
				if load_datas.logo1:
					$NinePatchRect/ProgressBar4/RichTextLabel2/Sprite2D.show()
				if load_datas.logo2:
					$NinePatchRect/ProgressBar4/RichTextLabel2/Sprite2D3.show()
			if i==4:
				mostrarvida5(int(load_datas.maxvida))
				$NinePatchRect/ProgressBar5.value=int(load_datas.progreso)
				$NinePatchRect/ProgressBar5/RichTextLabel.set_text(load_datas.usuario)
				if load_datas.nacionalista:
					$NinePatchRect/ProgressBar5/RichTextLabel2/LOGORACIONALISTA.show()
				if load_datas.empirista:
					$NinePatchRect/ProgressBar5/RichTextLabel2/LOGOEMPIRISTA.show()
				if load_datas.trifuerza:
					$NinePatchRect/ProgressBar5/RichTextLabel2/Sprite2D2.show()
				if load_datas.logo1:
					$NinePatchRect/ProgressBar5/RichTextLabel2/Sprite2D.show()
				if load_datas.logo2:
					$NinePatchRect/ProgressBar5/RichTextLabel2/Sprite2D3.show()

func _compare_descending(arreglo : Array):
	var lista : Array
	var file
	var load_datas : Dictionary
	print(arreglo.size())
	for i in range(arreglo.size()):
			file = FileAccess.open(arreglo[i],FileAccess.READ)
			load_datas = JSON.parse_string(file.get_line())
			lista.append(int(load_datas.progreso))
			print(int(load_datas.progreso))
	for i in range(lista.size()):
		for j in range(lista.size()):
			var temp = lista[j]
			print(temp)
			var temp2 = lista[i]
			print(temp2)
			var tempa=arreglo[j]
			print(tempa)
			var temb=arreglo[i]
			print(temb)
			if lista[i] > lista[j]:
				lista[i]=temp
				arreglo[i]=tempa
				lista[j]=temp2
				arreglo[j]=temb
func mostrarvida(valor):
	
	match valor:
		3:
			$NinePatchRect/ProgressBar/RichTextLabel2/coracointainer.show()
			$NinePatchRect/ProgressBar/RichTextLabel2/coracointainer2.show()
			$NinePatchRect/ProgressBar/RichTextLabel2/coracointainer3.show()
		4:
			$NinePatchRect/ProgressBar/RichTextLabel2/coracointainer.show()
			$NinePatchRect/ProgressBar/RichTextLabel2/coracointainer2.show()
			$NinePatchRect/ProgressBar/RichTextLabel2/coracointainer3.show()
			$NinePatchRect/ProgressBar/RichTextLabel2/coracointainer4.show()
		5:
			$NinePatchRect/ProgressBar/RichTextLabel2/coracointainer.show()
			$NinePatchRect/ProgressBar/RichTextLabel2/coracointainer2.show()
			$NinePatchRect/ProgressBar/RichTextLabel2/coracointainer3.show()
			$NinePatchRect/ProgressBar/RichTextLabel2/coracointainer4.show()
			$NinePatchRect/ProgressBar/RichTextLabel2/coracointainer5.show()
		6:
			$NinePatchRect/ProgressBar/RichTextLabel2/coracointainer.show()
			$NinePatchRect/ProgressBar/RichTextLabel2/coracointainer2.show()
			$NinePatchRect/ProgressBar/RichTextLabel2/coracointainer3.show()
			$NinePatchRect/ProgressBar/RichTextLabel2/coracointainer4.show()
			$NinePatchRect/ProgressBar/RichTextLabel2/coracointainer5.show()
			$NinePatchRect/ProgressBar/RichTextLabel2/coracointainer6.show()
		7:
			$NinePatchRect/ProgressBar/RichTextLabel2/coracointainer.show()
			$NinePatchRect/ProgressBar/RichTextLabel2/coracointainer2.show()
			$NinePatchRect/ProgressBar/RichTextLabel2/coracointainer3.show()
			$NinePatchRect/ProgressBar/RichTextLabel2/coracointainer4.show()
			$NinePatchRect/ProgressBar/RichTextLabel2/coracointainer5.show()
			$NinePatchRect/ProgressBar/RichTextLabel2/coracointainer6.show()
			$NinePatchRect/ProgressBar/RichTextLabel2/coracointainer6.show()
func mostrarvida2(valor):
	match valor:
		3:
			$NinePatchRect/ProgressBar2/RichTextLabel2/coracointainer.show()
			$NinePatchRect/ProgressBar2/RichTextLabel2/coracointainer2.show()
			$NinePatchRect/ProgressBar2/RichTextLabel2/coracointainer3.show()
		4:
			$NinePatchRect/ProgressBar2/RichTextLabel2/coracointainer.show()
			$NinePatchRect/ProgressBar2/RichTextLabel2/coracointainer2.show()
			$NinePatchRect/ProgressBar2/RichTextLabel2/coracointainer3.show()
			$NinePatchRect/ProgressBar2/RichTextLabel2/coracointainer4.show()
		5:
			$NinePatchRect/ProgressBar2/RichTextLabel2/coracointainer.show()
			$NinePatchRect/ProgressBar2/RichTextLabel2/coracointainer2.show()
			$NinePatchRect/ProgressBar2/RichTextLabel2/coracointainer3.show()
			$NinePatchRect/ProgressBar2/RichTextLabel2/coracointainer4.show()
			$NinePatchRect/ProgressBar2/RichTextLabel2/coracointainer5.show()
		6:
			$NinePatchRect/ProgressBar2/RichTextLabel2/coracointainer.show()
			$NinePatchRect/ProgressBar2/RichTextLabel2/coracointainer2.show()
			$NinePatchRect/ProgressBar2/RichTextLabel2/coracointainer3.show()
			$NinePatchRect/ProgressBar2/RichTextLabel2/coracointainer4.show()
			$NinePatchRect/ProgressBar2/RichTextLabel2/coracointainer5.show()
			$NinePatchRect/ProgressBar2/RichTextLabel2/coracointainer6.show()
		7:
			$NinePatchRect/ProgressBar2/RichTextLabel2/coracointainer.show()
			$NinePatchRect/ProgressBar2/RichTextLabel2/coracointainer2.show()
			$NinePatchRect/ProgressBar2/RichTextLabel2/coracointainer3.show()
			$NinePatchRect/ProgressBar2/RichTextLabel2/coracointainer4.show()
			$NinePatchRect/ProgressBar2/RichTextLabel2/coracointainer5.show()
			$NinePatchRect/ProgressBar2/RichTextLabel2/coracointainer6.show()
			$NinePatchRect/ProgressBar2/RichTextLabel2/coracointainer6.show()
func mostrarvida3(valor):
	match valor:
		3:
			$NinePatchRect/ProgressBar3/RichTextLabel2/coracointainer.show()
			$NinePatchRect/ProgressBar3/RichTextLabel2/coracointainer2.show()
			$NinePatchRect/ProgressBar3/RichTextLabel2/coracointainer3.show()
		4:
			$NinePatchRect/ProgressBar3/RichTextLabel2/coracointainer.show()
			$NinePatchRect/ProgressBar3/RichTextLabel2/coracointainer2.show()
			$NinePatchRect/ProgressBar3/RichTextLabel2/coracointainer3.show()
			$NinePatchRect/ProgressBar3/RichTextLabel2/coracointainer4.show()
		5:
			$NinePatchRect/ProgressBar3/RichTextLabel2/coracointainer.show()
			$NinePatchRect/ProgressBar3/RichTextLabel2/coracointainer2.show()
			$NinePatchRect/ProgressBar3/RichTextLabel2/coracointainer3.show()
			$NinePatchRect/ProgressBar3/RichTextLabel2/coracointainer4.show()
			$NinePatchRect/ProgressBar3/RichTextLabel2/coracointainer5.show()
		6:
			$NinePatchRect/ProgressBar3/RichTextLabel2/coracointainer.show()
			$NinePatchRect/ProgressBar3/RichTextLabel2/coracointainer2.show()
			$NinePatchRect/ProgressBar3/RichTextLabel2/coracointainer3.show()
			$NinePatchRect/ProgressBar3/RichTextLabel2/coracointainer4.show()
			$NinePatchRect/ProgressBar3/RichTextLabel2/coracointainer5.show()
			$NinePatchRect/ProgressBar3/RichTextLabel2/coracointainer6.show()
		7:
			$NinePatchRect/ProgressBar3/RichTextLabel2/coracointainer.show()
			$NinePatchRect/ProgressBar3/RichTextLabel2/coracointainer2.show()
			$NinePatchRect/ProgressBar3/RichTextLabel2/coracointainer3.show()
			$NinePatchRect/ProgressBar3/RichTextLabel2/coracointainer4.show()
			$NinePatchRect/ProgressBar3/RichTextLabel2/coracointainer5.show()
			$NinePatchRect/ProgressBar3/RichTextLabel2/coracointainer6.show()
			$NinePatchRect/ProgressBar3/RichTextLabel2/coracointainer6.show()
func mostrarvida4(valor):
	match valor:
		3:
			$NinePatchRect/ProgressBar4/RichTextLabel2/coracointainer.show()
			$NinePatchRect/ProgressBar4/RichTextLabel2/coracointainer2.show()
			$NinePatchRect/ProgressBar4/RichTextLabel2/coracointainer3.show()
		4:
			$NinePatchRect/ProgressBar4/RichTextLabel2/coracointainer.show()
			$NinePatchRect/ProgressBar4/RichTextLabel2/coracointainer2.show()
			$NinePatchRect/ProgressBar4/RichTextLabel2/coracointainer3.show()
			$NinePatchRect/ProgressBar4/RichTextLabel2/coracointainer4.show()
		5:
			$NinePatchRect/ProgressBar4/RichTextLabel2/coracointainer.show()
			$NinePatchRect/ProgressBar4/RichTextLabel2/coracointainer2.show()
			$NinePatchRect/ProgressBar4/RichTextLabel2/coracointainer3.show()
			$NinePatchRect/ProgressBar4/RichTextLabel2/coracointainer4.show()
			$NinePatchRect/ProgressBar4/RichTextLabel2/coracointainer5.show()
		6:
			$NinePatchRect/ProgressBar4/RichTextLabel2/coracointainer.show()
			$NinePatchRect/ProgressBar4/RichTextLabel2/coracointainer2.show()
			$NinePatchRect/ProgressBar4/RichTextLabel2/coracointainer3.show()
			$NinePatchRect/ProgressBar4/RichTextLabel2/coracointainer4.show()
			$NinePatchRect/ProgressBar4/RichTextLabel2/coracointainer5.show()
			$NinePatchRect/ProgressBar4/RichTextLabel2/coracointainer6.show()
		7:
			$NinePatchRect/ProgressBar4/RichTextLabel2/coracointainer.show()
			$NinePatchRect/ProgressBar4/RichTextLabel2/coracointainer2.show()
			$NinePatchRect/ProgressBar4/RichTextLabel2/coracointainer3.show()
			$NinePatchRect/ProgressBar4/RichTextLabel2/coracointainer4.show()
			$NinePatchRect/ProgressBar4/RichTextLabel2/coracointainer5.show()
			$NinePatchRect/ProgressBar4/RichTextLabel2/coracointainer6.show()
			$NinePatchRect/ProgressBar4/RichTextLabel2/coracointainer6.show()
func mostrarvida5(valor):
	match valor:
		3:
			$NinePatchRect/ProgressBar5/RichTextLabel2/coracointainer.show()
			$NinePatchRect/ProgressBar5/RichTextLabel2/coracointainer2.show()
			$NinePatchRect/ProgressBar5/RichTextLabel2/coracointainer3.show()
		4:
			$NinePatchRect/ProgressBar5/RichTextLabel2/coracointainer.show()
			$NinePatchRect/ProgressBar5/RichTextLabel2/coracointainer2.show()
			$NinePatchRect/ProgressBar5/RichTextLabel2/coracointainer3.show()
			$NinePatchRect/ProgressBar5/RichTextLabel2/coracointainer4.show()
		5:
			$NinePatchRect/ProgressBar5/RichTextLabel2/coracointainer.show()
			$NinePatchRect/ProgressBar5/RichTextLabel2/coracointainer2.show()
			$NinePatchRect/ProgressBar5/RichTextLabel2/coracointainer3.show()
			$NinePatchRect/ProgressBar5/RichTextLabel2/coracointainer4.show()
			$NinePatchRect/ProgressBar5/RichTextLabel2/coracointainer5.show()
		6:
			$NinePatchRect/ProgressBar5/RichTextLabel2/coracointainer.show()
			$NinePatchRect/ProgressBar5/RichTextLabel2/coracointainer2.show()
			$NinePatchRect/ProgressBar5/RichTextLabel2/coracointainer3.show()
			$NinePatchRect/ProgressBar5/RichTextLabel2/coracointainer4.show()
			$NinePatchRect/ProgressBar5/RichTextLabel2/coracointainer5.show()
			$NinePatchRect/ProgressBar5/RichTextLabel2/coracointainer6.show()
		7:
			$NinePatchRect/ProgressBar5/RichTextLabel2/coracointainer.show()
			$NinePatchRect/ProgressBar5/RichTextLabel2/coracointainer2.show()
			$NinePatchRect/ProgressBar5/RichTextLabel2/coracointainer3.show()
			$NinePatchRect/ProgressBar5/RichTextLabel2/coracointainer4.show()
			$NinePatchRect/ProgressBar5/RichTextLabel2/coracointainer5.show()
			$NinePatchRect/ProgressBar5/RichTextLabel2/coracointainer6.show()
			$NinePatchRect/ProgressBar5/RichTextLabel2/coracointainer6.show()


func _on_texture_button_2_pressed():
	get_tree().change_scene_to_file("res://registro.tscn") 
