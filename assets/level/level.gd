extends Node2D

@export var BG_velocity : float = 8
@export var CNear_velocity : float = 10
@export var CFar_velocity : float = 12
@onready var background : ParallaxBackground = $Background
@onready var clouds_near : ParallaxBackground = $Clouds
@onready var clouds_far : ParallaxBackground = $Clouds2

@export var Enemy : PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	$EnemyTimer.start()
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	background.scroll_base_offset += Vector2(0, BG_velocity) * delta
	clouds_near.scroll_base_offset += Vector2(0, CNear_velocity) * delta
	clouds_far.scroll_base_offset += Vector2(0, CFar_velocity) * delta
	

func _on_EnemyTimer_timeout():
	
	var spawn = $EnemyPath/EnemySpawn
	spawn.progress_ratio = (randi())
	var enemy = Enemy.instantiate()
	add_child(enemy)
	enemy.position = spawn.position
	$EnemyTimer.wait_time = GLOBAL.random(1,2)
	$EnemyTimer.start()


func _on_hud_game_over():
	$BGM.stop()
