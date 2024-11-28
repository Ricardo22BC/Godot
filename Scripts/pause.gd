extends Control

 #Conectar las señales de los botones con sus respectivas funciones.
#func _ready():
	#$ColorRect/VBoxContainer/resume.Callable("pressed", self, "_on_resume_button_pressed")
	#$ColorRect/VBoxContainer/restart.Callable("pressed", self, "_on_restart_button_pressed")
	#$ColorRect/VBoxContainer/quit.Callable("pressed", self, "_on_main_menu_button_pressed")

# Función para reanudar el juego
func _on_resume_button_pressed():
	get_parent().resume_game()  # Llama a la función de reanudar del nodo principal

# Función para reiniciar el juego
func _on_restart_button_pressed():
	get_parent().restart_game()  # Llama a la función de reiniciar del nodo principal

# Función para volver al menú principal
func _on_main_menu_button_pressed():
	get_parent().go_to_main_menu()  # Llama a la función de volver al menú principal
