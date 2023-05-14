extends Area2D

@export var Explosion : PackedScene
var speed : int

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimSpr.play()
	speed = GLOBAL.random(32, 42)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += speed * delta
	
func death_enemy():
	queue_free()
	explosion_ctrl()
	
func explosion_ctrl():
	var explosion = Explosion.instantiate()
	explosion.global_position = $ExplosionSpawn.global_position
	get_tree().call_group('level', 'add_child', explosion)
	
	
func _on_Enemy_area_entered(area):
	if area.is_in_group('shoot'):
		death_enemy()
		GLOBAL.score += 10
	

func _on_Enemy_body_entered(body):
	if body.is_in_group('player'):
		death_enemy()
		body.queue_free()


func _on_enemy_visibility_screen_exited():
	queue_free()
