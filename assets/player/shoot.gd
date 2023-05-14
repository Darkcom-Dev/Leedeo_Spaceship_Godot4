extends Area2D

@onready var player : CharacterBody2D = get_tree().get_nodes_in_group('player')[0]
const SPEED = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play()

func _on_Shoot_area_entered(area : Area2D):
	if area.is_in_group('enemy'):
		queue_free()

func _on_Visible_screen_exited():
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= SPEED * delta

