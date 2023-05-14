extends CharacterBody2D

@export var Shoot : PackedScene

const SPEED = 100

@onready var motion = Vector2.ZERO
@onready var can_shoot : bool = true
@onready var screensize = get_viewport_rect().size # Tamaño de muestra de la ventana

@onready var animation : AnimatedSprite2D = $AnimatedSprite2D
@onready var shootSpawn : Marker2D = $ShotSpawn

func _ready():
	animation.play()
	$ShootTimer.start()

func _physics_process(delta):
	motion_ctrl()
	animation_ctrl()
	motion = move_and_collide(motion * delta)

func _input(event):
	if event.is_action_pressed("ui_accept") and can_shoot:
		shoot_ctrl()
		can_shoot = false
		$ShootTimer.start()
		
func get_axis()->Vector2:
	
	var axis = Vector2(int(Input.is_action_pressed('ui_right')) - int(Input.is_action_pressed('ui_left')), 
	int(Input.is_action_pressed('ui_down')) - int(Input.is_action_pressed('ui_up')))
	
	return axis

func motion_ctrl():
	if get_axis() == Vector2.ZERO:
		motion = Vector2.ZERO
	else:
		motion = get_axis().normalized() * SPEED
		
	position.x = clamp(position.x, 8, screensize.x -8)
	position.y = clamp(position.y, 12, screensize.y -12)
	
func animation_ctrl():
	if get_axis().x == 1:
		animation.animation = 'Horizontal'
		animation.flip_h = true
	elif  get_axis().x == -1:
		animation.animation = 'Horizontal'
		animation.flip_h = false
	else:
		animation.animation = 'Vertical'
		
func shoot_ctrl():
	
	var shoot = Shoot.instantiate() # no existe funcion en PackedScene
	shoot.global_position = shootSpawn.global_position
	get_tree().call_group('level', 'add_child', shoot)
	

func _on_shoot_timer_timeout():
	can_shoot = true
