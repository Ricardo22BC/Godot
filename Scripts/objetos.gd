extends Node2D

func _on_area_2d_area_entered(area: Area2D):
	if area.is_in_group("bala"):
		if self.is_in_group("naveEnemiga"):
			Global.puntos += 5
			Global.playSound("enemyImpact")
			$Sprite2D/explosion.play("animation")
			$Sprite2D/ship.visible= false
		if self.is_in_group("naveEnemiga2"):
			Global.puntos += 5
			Global.playSound("enemyImpact")
			$Sprite2D/explosion.play("animation")
			$Sprite2D/ship.visible= false
		if self.is_in_group("naveEnemiga3"):
			Global.puntos += 5
			Global.playSound("enemyImpact")
			$Sprite2D/explosion.play("animation")
			$Sprite2D/ship.visible= false
			
		


func _on_animation_player_animation_finished(anim_name):
	queue_free()
