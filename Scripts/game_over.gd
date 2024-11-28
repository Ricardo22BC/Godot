extends Control

func _ready():
	# Obtener el nodo Label directamente desde la escena y cambiar el texto
	var score_label = $ColorRect/score_label  # Accede al nodo Label por su nombre
	# Actualizar el texto del Label con la puntuación global
	score_label.text = "Puntuación obtenida: " + str(Global.puntos)  # Asignar los puntos globales
	
#función de pantala final que al presionar el botón no devuelve al menú principal
func _on_ok_pressed():
	get_tree().change_scene_to_file("res://Scenes/menú.tscn")
