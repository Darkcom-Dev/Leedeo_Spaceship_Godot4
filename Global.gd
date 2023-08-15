extends Node

var score : int
var rng : RandomNumberGenerator = RandomNumberGenerator.new()
var player_pos : Vector2

# Called when the node enters the scene tree for the first time.
func random(min_number, max_number):
	randomize()
	return rng.randf_range(min_number, max_number)


