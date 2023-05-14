extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$explosion_anim.play("explosion")
	$sfx.play()

func _on_sfx_finished():
	queue_free()
