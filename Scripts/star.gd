extends Node2D

func _on_area_2d_area_entered(area):
	if area.is_in_group("jugador"):
		Global.puntos += 15
		queue_free()
	
	
func _on_animation_player_animation_finished(anim_name):
	queue_free()
