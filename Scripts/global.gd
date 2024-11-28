extends Node
# Definir variables globales
var vidas = 3
var puntos = 0

# Método para aumentar los puntos
func aumentar_puntos(cantidad):
	puntos += cantidad

# Método para restar vidas
func perder_vida():
	vidas -= 1
	if vidas <= 0:
		get_tree().change_scene("res://Scenes/gameOver.tscn")
		
func playSound(sound):
	if sound == "enemyImpact":
		get_node("/root/Juego/sonidos/enemyImpact").play()
		
func reset_game():
	vidas = 3
	puntos = 0
		
