extends CanvasLayer

signal game_over

# Called when the node enters the scene tree for the first time.
func _ready():
	GLOBAL.score = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$score_container/ScoreContainer/Points.text = str(GLOBAL.score)

func _game_over():
	emit_signal('game_over')
	$GameOverContainer.visible = true
	$GameOverBGM.play()

func _on_restart_pressed():
	get_tree().call_deferred('reload_current_scene')

func _on_exit_pressed():
	get_tree().change_scene_to_file('res://assets/menu/menu.tscn')

func _on_Player_tree_exiting()	:
	_game_over()
