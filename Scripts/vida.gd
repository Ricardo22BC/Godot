extends Node2D

func _on_area_2d_area_entered(area):
	if area.is_in_group("jugador"):  # Verifica si el jugador colisiona con el objeto
		if Global.vidas < 3:  # Asegúrate de no exceder el límite de vidas
			Global.vidas += 1
			print("Vida añadida. Vidas actuales: ", Global.vidas)

			# Llama a controlVidas para actualizar la visibilidad de los sprites
			var juego = get_tree().root.get_node("Juego")
			if juego:
				juego.controlVidas(Global.vidas)
		else:
			print("Máximo de vidas alcanzado.")
		queue_free()
		
func _on_animation_player_animation_finished(anim_name):
	queue_free()
