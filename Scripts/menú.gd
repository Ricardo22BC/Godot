extends Control

func _on_inicio_pressed():
	Global.reset_game()
	get_tree().change_scene_to_file("res://Scenes/juego.tscn")
#Botón para ir a la escena del juego

func _on_opciones_pressed():
	get_tree().change_scene_to_file("res://Scenes/opciones.tscn")
#Botón para ir  a la escena de opciones

func _on_salir_pressed():
	get_tree().quit()
#Botón para salir del juego 

func _ready():
	$music/menuMusic.play()
