extends Node2D

var pre_naveEnemiga = preload("res://Scenes/navaEnemiga.tscn")
var pre_naveEnemiga2 = preload("res://Scenes/navaEnemiga2.tscn")
var pre_naveEnemiga3 = preload("res://Scenes/navaEnemiga3.tscn")
var pre_asteroide = preload("res://Scenes/asteroide.tscn")
var pre_asteroide2 = preload("res://Scenes/asteroide2.tscn")
var pre_asteroide3 = preload("res://Scenes/asteroide3.tscn")
var pre_asteroide4 = preload("res://Scenes/asteroide4.tscn")
var pre_star = preload("res://Scenes/star.tscn")
var pre_vida = preload("res://Scenes/vida.tscn")
var vida1
var vida2
var vida3

@onready var timer = $Timer  # Referencia al Timer
var tiempo = 2.0  # Tiempo de espera inicial entre apariciones (en segundos)
var tiempo_minimo = 0.5  # Tiempo mínimo entre apariciones

# Inicialización de las vidas y el HUD


#cronómetro que cada 1seg llama a la funciones
func _on_timer_timeout():
	 # Reducir el tiempo entre apariciones a medida que pasa el tiempo
	if tiempo > tiempo_minimo:
		tiempo -= 0.1  # Decrementa el tiempo de espera entre cada aparición
		timer.wait_time = tiempo  # Actualiza el temporizador
	#eligimos al azar entre 1 y 2
	randomize()
	var randomEnemy= round(randf_range(1,9))
	# si el valor es 1 instancia, crea en escena y posiciona la nave.
	if randomEnemy == 1:
		var naveEnemiga = pre_naveEnemiga.instantiate()
		self.call_deferred("add_child",naveEnemiga)
		naveEnemiga.position.x=round(randf_range(0,1280))
		naveEnemiga.add_to_group("naveEnemiga")
	#Si es 2 instancia, crea escena y posiciona la nave.	
	if randomEnemy == 2:
		var asteroide = pre_asteroide.instantiate()
		self.call_deferred("add_child",asteroide)
		asteroide.position.x=round(randf_range(0,1280))
		asteroide.add_to_group("naveEnemiga")	
		
	if randomEnemy == 3:
		var naveEnemiga2 = pre_naveEnemiga2.instantiate()
		self.call_deferred("add_child",naveEnemiga2)
		naveEnemiga2.position.x=round(randf_range(0,1280))
		naveEnemiga2.add_to_group("naveEnemiga2")
		
	if randomEnemy == 4:
		var naveEnemiga3 = pre_naveEnemiga3.instantiate()
		self.call_deferred("add_child",naveEnemiga3)
		naveEnemiga3.position.x=round(randf_range(0,1280))
		naveEnemiga3.add_to_group("naveEnemiga3")
		
	if randomEnemy == 5:
		var star = pre_star.instantiate()
		self.call_deferred("add_child",star)
		star.position.x=round(randf_range(0,1280))
		star.add_to_group("star")
	
	if randomEnemy == 6:
		var vida = pre_vida.instantiate()
		self.call_deferred("add_child",vida)
		vida.position.x=round(randf_range(0,1280))
		vida.add_to_group("vida")
			
	if randomEnemy == 7:
		var asteroide2 = pre_asteroide2.instantiate()
		self.call_deferred("add_child",asteroide2)
		asteroide2.position.x=round(randf_range(0,1280))
		asteroide2.add_to_group("asteroide2")
		
	if randomEnemy == 8:
		var asteroide3 = pre_asteroide3.instantiate()
		self.call_deferred("add_child",asteroide3)
		asteroide3.position.x=round(randf_range(0,1280))
		asteroide3.add_to_group("asteroide3")
	
	if randomEnemy == 9:
		var asteroide4 = pre_asteroide4.instantiate()
		self.call_deferred("add_child",asteroide4)
		asteroide4.position.x=round(randf_range(0,1280))
		asteroide4.add_to_group("asteroide4")
		
func _physics_process(_delta):
	$HUD/PuntValor.text = str(Global.puntos)
	#Funcionamiento del fondo animado.
	$ParallaxBackground/ParallaxLayer.motion_offset.y +=5
func _ready():
	vida1 = $HUD/Vida1  # Asume que tienes nodos llamados "Vida1", "Vida2", y "Vida3" en el nodo HUD
	vida2 = $HUD/Vida2
	vida3 = $HUD/Vida3
	
	timer.start()  # Inicia el temporizador al comienzo
	timer.wait_time = tiempo  # Asigna el tiempo de espera inicial
	
	$Node2D/AudioStreamPlayer2D.play()
	
	controlVidas(Global.vidas)
func controlVidas(vidas):
	 # Controlar visibilidad de las vidas
	if vidas == 3:
		vida1.visible = true
		vida2.visible = true
		vida3.visible = true
	elif vidas == 2:
		vida1.visible = true
		vida2.visible = true
		vida3.visible = false
	elif vidas == 1:
		vida1.visible = true
		vida2.visible = false
		vida3.visible = false
	elif vidas <= 0:
		vida1.visible = false
		vida2.visible = false
		vida3.visible = false
		game_over()
		
func game_over():
	# Usar call_deferred para asegurar que la eliminación se hace después del ciclo de física
	call_deferred("_change_scene_to_gameover")
	
# Función que se llama de forma diferida para cambiar de escena
func _change_scene_to_gameover():
	get_tree().change_scene_to_file("res://Scenes/gameOver.tscn")
	
func ready():
	$music/juegoMusic.play()
	
#var is_paused = false
#var pause_scene = preload("res://Scenes/pause.tscn")  # Asegúrate de usar la ruta correcta de tu escena de pausa
##var pause_menu_instance = null  # Variable para almacenar la instancia de la escena de pausa
#
## Método para manejar la pausa
#func _process(delta):
	#if Input.is_action_just_pressed("ui_cancel"):  # ESC o la tecla asignada en el input
		#if is_paused:
			#resume_game()
		#else:
			#pause_game()

## Función para activar la pausa
## Función para activar la pausa
#func pause_game():
	#is_paused = true
	#var pause_menu = pause_scene.instantiate()  # Instanciamos la escena de pausa
	#get_tree().current_scene.add_child(pause_menu)  # Añadimos la escena de pausa a la escena actual
	#get_tree().paused = true  # Pausamos el juego
#
## Función para reanudar el juego
#func resume_game():
	#is_paused = false
	#for node in get_children():
		#if node.name == "pause":  # Asegúrate de que el nombre del nodo de la pausa sea correcto
			#node.queue_free()  # Eliminar el menú de pausa
	#get_tree().paused = false  # Reanudamos el juego
## Función para reiniciar el juego
#func restart_game():
	#get_tree().reload_current_scene()  # Recarga la escena actual
#
## Función para ir al menú principal
#func go_to_main_menu():
	#get_tree().change_scene("res://Scenes/menú.tscn")  # Ajusta la ruta a tu menú principal
