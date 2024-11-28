extends CharacterBody2D
#
func _physics_process(_delta):
	position.y -= 10
	

#Funcion para que la bala cuando choque con lo que tenemos en el grupo enemigo
#(asteroide y naveEnemiga) desaparece al chocar con ellos.
func _on_area_2d_area_entered(area: Area2D):
	if area.is_in_group("enemigo"):
		queue_free()
		
		
