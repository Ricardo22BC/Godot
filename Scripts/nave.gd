extends CharacterBody2D
var my_velocity = Vector2(0,0)


var disparo = preload("res://Scenes/bala.tscn")
var vidas = 3
var controlShoot = true

func _physics_process(_delta):
	
	#Movimietno hacia dereche y izquierda
	if Input.is_action_pressed("d"):
		
		my_velocity.x = 500
	elif Input.is_action_pressed("a"):
		my_velocity.x = -500
	else:
		my_velocity.x = lerp(my_velocity.x, 0.0, 0.1)

	# Movimiento hacia arriba y abajo
	if Input.is_action_pressed("w"):
		my_velocity.y = -500
	elif Input.is_action_pressed("s"):
		my_velocity.y = 500
	else:
		my_velocity.y = lerp(my_velocity.y, 0.0, 0.1)
	
	velocity = my_velocity
	move_and_slide()
	#Disparo con el spacio
	if Input.is_action_pressed("space"):
		shoot()
	

func shoot():
	
	if controlShoot == true:
		var bala = disparo.instantiate()
		get_parent().call_deferred("add_child",bala)
		bala.position.x=self.position.x
		bala.position.y=self.position.y
		controlShoot = false
		$Node2D/Laser.play()
		await get_tree().create_timer(0.25).timeout
		controlShoot = true
		

#funcion para el asteroide que si choca con la nave del jugar impre un mensaje.
func _on_area_2d_area_entered(area: Area2D):
	if area.is_in_group("asteroide"):
		get_node("/root/Juego/Nave/Node2D/Impacto").play()
		$PointLight2D/AnimationPlayer.play("crash")
		print("Asteroide crash")
		
	if area.is_in_group("asteroide2"):
		get_node("/root/Juego/Nave/Node2D/Impacto").play()
		$PointLight2D/AnimationPlayer.play("crash")
		print("Asteroide crash")
		
	if area.is_in_group("asteroide3"):
		get_node("/root/Juego/Nave/Node2D/Impacto").play()
		$PointLight2D/AnimationPlayer.play("crash")
		print("Asteroide crash")
		
	if area.is_in_group("asteroide4"):
		get_node("/root/Juego/Nave/Node2D/Impacto").play()
		$PointLight2D/AnimationPlayer.play("crash")
		print("Asteroide crash")
		
#funcion para la nave enemiga , imprime mensaje cuando colisiona.		
	elif area.is_in_group("naveEnemiga"):
		get_node("/root/Juego/Nave/Node2D/Impacto").play()
		$PointLight2D/AnimationPlayer.play("crash")
		print("Nave enemiga crash")
		area.get_node("CollisionShape2D").set_deferred("disabled", true)  # Usar set_deferred		
		
	elif area.is_in_group("naveEnemiga2"):
		get_node("/root/Juego/Nave/Node2D/Impacto").play()
		$PointLight2D/AnimationPlayer.play("crash")
		print("Nave enemiga crash")
		area.get_node("CollisionShape2D").set_deferred("disabled", true)  # Usar set_deferred

	elif area.is_in_group("naveEnemiga3"):
		get_node("/root/Juego/Nave/Node2D/Impacto").play()
		$PointLight2D/AnimationPlayer.play("crash")
		print("Nave enemiga crash")
		area.get_node("CollisionShape2D").set_deferred("disabled", true)  # Usar set_deferred

	#Si el área de la nave choca con un enemigo perdemos vida.
	if area.is_in_group("enemigo"):
		lose_life()
		
#función de pantalla de GAME OVER
func game_over():
	# Usar call_deferred para asegurar que la eliminación se hace después del ciclo de física
	call_deferred("_change_scene_to_gameover")
	
# Función que se llama de forma diferida para cambiar de escena
	
# Función que se llama de forma diferida para cambiar de escena
func _change_scene_to_gameover():
	# Verificar si get_tree() está disponible antes de cambiar de escena
	var tree = get_tree()
	if tree:
		# Verificar si el nodo raíz existe antes de intentar cambiar la escena
		if tree.root:
			print("Cambiando a la escena de Game Over...")
			tree.change_scene_to_file("res://Scenes/gameOver.tscn")
		else:
			print("Error: El nodo raíz no está disponible para cambiar de escena")
	else:
		print("Error: El árbol de nodos no está disponible")
#función perder vida
func lose_life():
	#restamos 1 vida , si llega a 0 perdemos y vamos a escena de game over
	Global.vidas -= 1
	  # Asegurarse de que el HUD se actualice con las nuevas vidas
	update_vidas_display()  # Llamamos a la función que actualiza la visibilidad de las vidas

	#var juego1= get_tree().root.get_node("juego1")
	var juego = get_tree().root.get_node("Juego")
	if juego:
		juego.controlVidas(Global.vidas)
	
	if Global.vidas <=0:
		game_over()
	else:
		print("Vidas restantes:", Global.vidas)
		
# Función que actualiza la visibilidad de los sprites de vida
func update_vidas_display():
	 # Obtener el nodo HUD desde la raíz del árbol de escenas
	var hud = get_node("/root/Juego/HUD")  # Suponiendo que HUD está en la raíz

	# Acceder a los nodos de vida dentro de HUD
	var vida1 = hud.get_node("Vida1")
	var vida2 = hud.get_node("Vida2")
	var vida3 = hud.get_node("Vida3")

	# Hacer visible los sprites correspondientes según el número de vidas
	if Global.vidas == 3:
		vida1.visible = true
		vida2.visible = true
		vida3.visible = true
	elif Global.vidas == 2:
		vida1.visible = true
		vida2.visible = true
		vida3.visible = false
	elif Global.vidas == 1:
		vida1.visible = true
		vida2.visible = false
		vida3.visible = false
	elif Global.vidas <= 0:
		vida1.visible = false
		vida2.visible = false
		vida3.visible = false
	
func reset_vidas_display():
	# Restaurar las vidas visibles
	$Vida1.visible = true
	$Vida2.visible = true
	$Vida3.visible = true
